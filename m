Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C924C3D6D
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 05:48:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4cj12H91z3cD1
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 15:48:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LypbJ/PR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LypbJ/PR; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4chC2DD6z3bb4
 for <openbmc@lists.ozlabs.org>; Fri, 25 Feb 2022 15:47:22 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id bt3so1500214qtb.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 20:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pwsV5RsKq/pnH4PHx5Ez0FXMne0vq3BHxjkvYDLrxD4=;
 b=LypbJ/PRlv09IFwFpLV0P+slE8lFEHfu/oGCIW82U1IqMgfCeG7y/mLd7fEBDIywf7
 +NqkblYxnHTDEOuv6axGQrQ1qQe++LmNkniccNlUZFSoP8jvRvQTrRhAQq+BYxWdKDj7
 h3dRG9qkGssvn59ivnbhUvywpk/vT5/+mUkg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pwsV5RsKq/pnH4PHx5Ez0FXMne0vq3BHxjkvYDLrxD4=;
 b=ODryF67zD3pzeBkReuSWsuNtNt1FIHFEUzcW96WMh3e8EPx3DzdKsvazno1dDkDZc2
 tZ1Hu7M5IylCl8tE6m/+/0FGCrHAgduxZLz/RQqsw6W3AKBw5zgQM1PYM6qMj8IY7ibs
 lKClSJAZzA/zdi+RxBsdNLUlH7ZDtaC20Ijl0KxO80bqWnp8oreIPTSuJkLZoArFqiu2
 mz5UXvhFpkoo7yvKzRXwC1fjaICNCmcjLy6R0TELwSrkLE9Yc5OgwqU4LSs0mHQGPP1o
 yMuwCFg1gu91msf2IJtMLU9vlkZBHt4Cbs6HB4qSCKhS5YvjPW1WcdNUNj3eV2fuSrea
 kb2A==
X-Gm-Message-State: AOAM533pB4TlxgBsbR/ZEVgW5562RXrivd8a2SRMyQa9zPFsJ2eZROyr
 7oJ+V3nRm7XP2xOaKwLfbGtJSlqCAAke+i2j6M4zHeKItSY=
X-Google-Smtp-Source: ABdhPJz48QBdi81U18u9w2xDF9aa1dadQF1hkRIghS8whLCc8ozMwWodESYlvcpJWsDmM63DMFtV8xkT0ZUseoiXeVw=
X-Received: by 2002:a05:622a:111:b0:2dd:dc84:4d42 with SMTP id
 u17-20020a05622a011100b002dddc844d42mr5382074qtw.494.1645764440766; Thu, 24
 Feb 2022 20:47:20 -0800 (PST)
MIME-Version: 1.0
References: <9C969ACE-F369-4A24-995B-5797426DDFDD@gmail.com>
In-Reply-To: <9C969ACE-F369-4A24-995B-5797426DDFDD@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 25 Feb 2022 04:47:07 +0000
Message-ID: <CACPK8XeRBYG7QMoh5dpk0aLpKLs7O3FLygAumEG1qRascqpEnA@mail.gmail.com>
Subject: Re: validating secure boot settings
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Feb 2022 at 18:23, Andrew Geissler <geissonator@gmail.com> wrote=
:
>
> IBM has a feature[1] they=E2=80=99d like in regards to validating secure =
boot settings.
>
> The basic requirement is to utilize the new bmc-secure-boot GPIO defined
> within this patch[2]. If the GPIO is found, then verify the system is in =
secure
> mode by validating the GPIO reads 1. If it=E2=80=99s not a 1, then log an=
 error.
>
> Similarly the code will also look at a sysfs file created via this patch[=
3] to tell
> if the system was started with secure boot enabled in the firmware. An er=
ror
> will be logged if it was not.
>
> From an IBM perspective, we only want to run these tests if we=E2=80=99re=
 in what
> we consider to be the manufacturing environment. What we use to determine
> that will probably be something configurable with the code. There are a l=
ot
> of other things that will prevent a boot if the system has secure boot en=
abled
> and the security checks fail. This new function is just a mechanism to
> provide a quick check to our manufacturing team that they=E2=80=99ve enab=
led
> everything as expected.
>
> So, anyone else interested in something like this? If so, any votes on wh=
ere
> a good place for this logic to reside would be? We don=E2=80=99t have any=
 obvious
> security repository that I can find that seems like a good fit for this.

In the future we will have applications that deal with TPM logs and
attestation. This is a precursor to that.

Names that come to mind are:

 - firmware
 - boot
 - information
 - state
 - verification

firmware-state?
boot-information?

And we like putting phosphor at the start, so throw that in.

Cheers,

Joel
