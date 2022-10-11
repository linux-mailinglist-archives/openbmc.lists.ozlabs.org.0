Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA55FB34D
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 15:22:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmxJr2L7fz3bht
	for <lists+openbmc@lfdr.de>; Wed, 12 Oct 2022 00:22:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nuznLHsZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nuznLHsZ;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmxHk3668z3blj
	for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2022 00:21:06 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id b2so31339037eja.6
        for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ1YybhaFsgjhj87KrtTMSAD9Wi9BEJSVTkvF+F7y/s=;
        b=nuznLHsZqSeHuNxBxIVla0dDPblNggjGFRbxm10ehr+xmolbPCWnWq/W0fyT+Lg9Am
         MXGMQSYWfzwz35XuRx9bEYH4Yrdj5Df+tgCTROcAffB6PsA13FeqD2IzFSlqrVbIVK5R
         VJ2mjX1J6op982N2yuDgfYcvYcE/UP77Bfn62Z0S+9ew/vj4heE96ug4HVTbwp6Z0Xal
         OW/ySDGBL3VNJMq3U9pSb6unekMF2GRSiIRUstjQxViOfe0IvS0E6lGl2FUwB/vIxSdf
         ParT2JDanOzC0EAJk1bHui23SChLyyajsF4CwFcbJPOSTPXKuTWid5p9PC8rtiqebIpD
         /8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQ1YybhaFsgjhj87KrtTMSAD9Wi9BEJSVTkvF+F7y/s=;
        b=mTFvxxqxsf1F3KWtpAKK/H8ZjrjNVKKDApOkVQmbVGwOpLZ2yrVSeo05o30QGK0umb
         SuNwWeLJ8NlfQO2lneGhqH1oHIg2/mGvY+rJ25ODJ6w1ZMerh8Boj8DLM1aCwjKOWFO0
         tHOtQIVyaZvHSf+rB5H7f7AlNjwqjmYNPx4H37cK6jRdkRZe+tSSPner4RvMd3Dub4Pi
         7Ryb38kZTPET8Pxd0edQieHi3b7Wwv65xLV2tdtRNttmuRCaLQfLq6NnyUfKHrV2QFjF
         5Y5hdiNsDjlDtBz4JyS6PFMAT3AGoHnCWwNyKlcMudJ/rPPNo1orFaZsNB3qJymg6jUK
         Ay0w==
X-Gm-Message-State: ACrzQf1Egzeq/Dt6OmJ3aF97zReECZQ4HCxJVR8eQwlHElFk2SJafDMD
	PKy7alZQPpmrmCSIYX3Y62TxdHTZoydUhhv1aj4=
X-Google-Smtp-Source: AMsMyM5hAMcYG/VzOBuNtn7wHnD73H+Ff56cR1xaZtRAMXDIeKzOamf11UeMKH2VYebWzu/xOMRgE84kj7CnU+SkQGM=
X-Received: by 2002:a17:907:728a:b0:78d:2b4b:e7f7 with SMTP id
 dt10-20020a170907728a00b0078d2b4be7f7mr19149176ejc.269.1665494459061; Tue, 11
 Oct 2022 06:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221007025413.3549628-1-milkfafa@gmail.com> <Y0AsbVvZA+VQVfcP@probook>
 <CADnNmFq-_pVFSDRFJ07HAt0Z+=CMwbHaiSPamaJiUXOU9haD-g@mail.gmail.com> <Y0RW7rOfUrvWXgdv@probook>
In-Reply-To: <Y0RW7rOfUrvWXgdv@probook>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 11 Oct 2022 21:20:50 +0800
Message-ID: <CADnNmFqix6goZTu-vHEP73e3QumaxPnSXecdfqLvZ0ux2z3vAA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, tmaimon77@gmail.com, kflin@nuvoton.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B410=
=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=8C =E5=87=8C=E6=99=A81:31=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> Ah, I missed that, thank you for the explanation!
>
> To avoid such confusion, I'd suggest perhaps indicating the branch in the
> subject line, e.g. using [PATCH openbmc-6.0 v1 0/5] or similar instead of
> [PATCH v1 0/5]. "git format-patch" can do this with the --subject-prefix =
option.

Got it, sorry for the confusion and thanks for the suggestion!

Regards,
Marvin
