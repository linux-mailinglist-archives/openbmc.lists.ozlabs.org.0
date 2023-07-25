Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FB760E16
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 11:13:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Prlvhi+W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9BC7035rz3c3y
	for <lists+openbmc@lfdr.de>; Tue, 25 Jul 2023 19:13:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Prlvhi+W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9BBQ4Cq5z2xWc
	for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 19:12:28 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-26586e824e7so2464835a91.3
        for <openbmc@lists.ozlabs.org>; Tue, 25 Jul 2023 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690276345; x=1690881145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wy4cplgUNKS/9BcirQhDIU2ZvQMme3avaAgjDUzLJFI=;
        b=Prlvhi+W3NQigLGT4jThq88LFysqxcqnyIKmuPJdKUnzioowF3f4q/higXZowJ/hKt
         s3cHWWSCReTLuRDyFUgab6YxWa5ptOtLDtDdrWV4hZAjCaYHaSrXOMzJi8o2jMsLCCz2
         OUo7sayJw/xDH7y46LzpxLG8rE8BGVC0yDeONls8hZ3HW7IJaI8H3gZ/Udvizs/4fXZT
         etx9DgZcDmoqp3iOG0NklLQJZg8PDuwJyv++3WdW+hgtQu3HbobYXlIahU9UuSON9qCn
         z/ZD4/2VO67p6bHtAbUAnPd9EnWew4bmy/arprpFJRdccBSdb0IEAqreSGLBuhW9tR34
         Oh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690276345; x=1690881145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wy4cplgUNKS/9BcirQhDIU2ZvQMme3avaAgjDUzLJFI=;
        b=htzCWFTm6a8B6jnLiPOAcxhYeTAeuvCjuB2IByp1ADCRSWccBWjzdEc1SLHYlT+PFP
         wK4zFTlYjE7DdJZPG5s++57DeqXRGVajxnQAzf41VPH86k3OB+4qRqoZ9o6Qu0H6hvPR
         RpmgQJFR1U/M8+Q4b0UmhjID9mztP12z9Z9N19qpXM79dE+4955kf/1eiOHW2nMnmJ+M
         6Cj2D1YSKZzL/iFvZYYz1kvxib3MA9vUl04NJjGMJihwCFpn8xPLOS7HcEQOy8KQ98Yj
         ZoQijsCHMlVIqRKoJowWU+zXnCrZRQv9Zv7qOavAVrrJWlodqNs9+tQxtBxK35C7ahMp
         p0Kg==
X-Gm-Message-State: ABy/qLZIHCwMNfLPuru4Z5YOe5qY3xmOyiEptEJIqs3t0VK3zDN0g9VC
	/kFrLqoOWnG7FGjI3dSMsZVbPVAsOtdGsNonPn0=
X-Google-Smtp-Source: APBJJlGyXl77l7rNbCiEBT6wuO+tKE75bot9gLJIEjBVAep3CYCmhlB26HO/n36iO05IO1h9jceGOIu0ZO0UNSO8dus=
X-Received: by 2002:a17:90a:ce83:b0:267:f893:d562 with SMTP id
 g3-20020a17090ace8300b00267f893d562mr6667046pju.8.1690276345470; Tue, 25 Jul
 2023 02:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230314092311.8924-1-jim.t90615@gmail.com> <20230314092311.8924-2-jim.t90615@gmail.com>
 <519312b6-f28c-7482-21c1-d9628f0295cb@molgen.mpg.de> <CAKUZ0+FGSEgzbK6H_sHaGpP9JnvrLeBRQViqmViR1OVXoVs7vA@mail.gmail.com>
 <45cf294e-3124-9a0d-864f-ba7c605405c0@molgen.mpg.de>
In-Reply-To: <45cf294e-3124-9a0d-864f-ba7c605405c0@molgen.mpg.de>
From: Jim Liu <jim.t90615@gmail.com>
Date: Tue, 25 Jul 2023 17:12:12 +0800
Message-ID: <CAKUZ0+GcnDNY8rmM0wi920LSCqFdMY0UCGmxqn_RMwLbdr5Jxg@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] gpio: nuvoton: Add Nuvoton NPCM sgpio driver
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: KWLIU@nuvoton.com, devicetree@vger.kernel.org, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi  Paul

Thanks for your reply.

> If this is paid work, using your company email address should be
> preferred in my opinion.

because I can't use company email to send the patch upstream.
So BMC NPCM all drivers always  use gmail to send the patch.
It's the company mail security rule. I am sorry about that.
After the V3 version I changed to gmail.


> One byte would also fit into `unsigned int`, wouldn=E2=80=99t it?

Yes, so should i change u8 ,u16, u32 to standard `unsigned int` is
better than now?
Could you provide more information?

Best regards,
Jim



On Mon, Jul 24, 2023 at 10:44=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> Dear Jim,
>
>
> Am 24.07.23 um 05:04 schrieb Jim Liu:
>
> > sorry for reply late.
>
> No problem. Thank you for your reply. Some minor comments below.
>
> > First, thanks for your review.
> >
> > the description is as below:
> >
> > The SGPIO module can be programmed to support from zero (none) to
> > eight external output ports ,
>
> No space before the comma.
>
> > each with eight output pins (for a total of 64 output pins). The
> > output ports must be serial-to-parallel devices (such as the HC595 or
> > a faster equivalent).
> >
> > The SGPIO can be programmed to accept from zero to eight external
> > input ports (IXPp), each with eight input pins, supporting a total of
> > 64 input pins. The input ports must be parallel-to-serial devices
> > (such as the HC165 or a faster equivalent).
> >
> > you can add hc595 and hc165 ic to get the serial data from BMC and
> > send serial data to BMC.
> > This driver can expand  extra gpio pins up to 64 input and 64 output.
>
> One space before =E2=80=9Cextra=E2=80=9D. Maybe:
>
> hc595 and c165 ic allow to transmit serial data from and to the BMC.
> This driver can expand extra GPIO pins up to 64 inputs and 64 outputs.
>
> > i will use jim.t90615@gmail.com this mail to upstream this driver not
> > company mail.
>
> If this is paid work, using your company email address should be
> preferred in my opinion.
>
> > The driver needs to fix the length of the variables, because the reg
> > size is one byte.
>
> One byte would also fit into `unsigned int`, wouldn=E2=80=99t it?
>
> > I will follow your suggestion to modify and upstream again. If you
> > have any questions please let me know.
>
> If you could use Mozilla Thunderbird to reply easily in interleaved
> style, that would great.
>
> Otherwise, I am looking forward to the next revision.
>
>
> Kind regards,
>
> Paul
