Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544696E5D1D
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 11:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0ys93MLwz3fKh
	for <lists+openbmc@lfdr.de>; Tue, 18 Apr 2023 19:13:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LbFGBLVs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LbFGBLVs;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0yrZ3GmMz3cJn
	for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2023 19:13:16 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b73203e0aso7023490b3a.1
        for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2023 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1681809193; x=1684401193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx+j+Biu0RQhYsrtixZdSS8TuUtpGoS1q32CqVSBK6Y=;
        b=LbFGBLVsXdNRo1otAMJb72GdtQC+lh3vibtf4LyoYuuqZxmdDtKXFss8tBtyuMphFP
         6LnwThQCUPjgUlVBaKlytthd/IFqodVIr8GTmlXlNyITsv2QfE4rnjUq7AXCUkrp7pCM
         KnmNbdWztBL8UAEEuzWSfBM+JMo7YkCniMENhAAXV/JaC7BeD7y1tgQ8t1TzUPRpqI6v
         2mAGPrx2j4NVQHaQEl0q28jkBmX7lVgd/Fmf+uxwfiskFjJFyXp8gokZ4WeyBF6A5aVy
         4fwjTF4QXBKswerE6dwVaMRAOaiHELajeU5D+BCTfsUzeUj3Bf+WAnfGElUBE64DS9AN
         AhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681809193; x=1684401193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cx+j+Biu0RQhYsrtixZdSS8TuUtpGoS1q32CqVSBK6Y=;
        b=Oww4WptAsWXPoGAXa6SeXbt1w6k1pzG/jPOc4/Pe++FxFmEUaCwOe9xGzmrJHsvHmR
         yrxICVEZ35vZ22fNNimN4Gy5+eT6GVc+MNIZmbo0OdSbZ+XeNioZ/6DI38sppDnqlhf3
         nNA4PkeYpeZdYX/ySvD422fn1SaUx+GgM+B0y5hmAIBGcDshb7HETMdYwg0AucCk0DLo
         4IWIx7y/wIv4cOocuWY0H7z/bzGy4r1qoM6/arBQfBZmXc4rVj9JUJ8GoQAZ0REHxnaI
         pTZziOdr5nYKqCgZkQzj6Ec/prm8PY+1WagkkzJV0xxsaIe61gvLjPQ44eMS6aI3lrnD
         1q+w==
X-Gm-Message-State: AAQBX9dwccwuwtHIkLqKWrS0jvmEdl6KAk0VfUYokxJiNWyP09vv9nQp
	CDOCzKgowoXTW3OTkSQ5uTWVatYlx+8LIK/rVpsH4A==
X-Google-Smtp-Source: AKy350YM5TLVkBwrc35Poa4e32kwWDmdzlnY/SLWliwN70tPOBnfYTFSFZRTnCnNxJV5SsdDYsekGR2JJSCY7tP6ZKA=
X-Received: by 2002:a05:6a00:2d89:b0:63b:7263:b8a7 with SMTP id
 fb9-20020a056a002d8900b0063b7263b8a7mr6858411pfb.0.1681809193258; Tue, 18 Apr
 2023 02:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <CACSj6VWmDO4o17M4ubiw3msQTChXPuJBdocFJ+Q8R0yYVfdA2A@mail.gmail.com>
In-Reply-To: <CACSj6VWmDO4o17M4ubiw3msQTChXPuJBdocFJ+Q8R0yYVfdA2A@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 18 Apr 2023 17:13:01 +0800
Message-ID: <CAGm54UFZ2S7aSZciLEC0B4sNxoiOrz5-FyJ7RHYBJG6O2tr=eQ@mail.gmail.com>
Subject: Re: 'phosphor-bmc-code-mgmt' throws 'InvalidSignature' error even if
 'verify-signature' is not enabled
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 17, 2023 at 4:00=E2=80=AFPM Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Hello!
>
> By default the OpenBMC tarball is generated without a signature.
> And 'verify-signature' is a separate option which is not enabled by defau=
lt in the 'phosphor-bmc-code-mgmt' recipe.
> But still currently in that case when we load OpenBMC tarball, the 'Softw=
are::Version::Error::InvalidSignature' error is generated in SEL.
> I think it is not right, so I've proposed a patchset that changes this be=
haviour.
> Please check:
> 62521: meson: Disable 'verify-signature' option by default | https://gerr=
it.openbmc.org/c/openbmc/phosphor-bmc-code-mgmt/+/62521
>
> The patchset changes the default API of the 'phosphor-bmc-code-mgmt', so =
this message is intended to ask if anybody has any objections against this =
patchset.

I would prefer to remove the `verify-signature` as it's deprecated for
a long time.
Let's just enable the `verify-full-signature` in the repo as before.

--=20
BRs,
Lei YU
