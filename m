Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180F463E4F
	for <lists+openbmc@lfdr.de>; Tue, 30 Nov 2021 20:00:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3WkD06RDz3c7Q
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 06:00:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KwGRA80K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=KwGRA80K; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3Wjr2bQ5z2xXg
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 05:59:43 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id v15so43159083ljc.0
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 10:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jYCAvngDuFSsbxeiGlc+WElSPqdXpIAVts6LGe23+J4=;
 b=KwGRA80KiFrIGxF3pohLJ+dsJfOFDCSyTPi0c4Ga5gHBxI9eMKAOYdwRLq63g6ycTO
 v+M5j0KaRCRusnQgHkdG2buVqYdFtFgBjelgaoqBa/HcKYl/GLYoipttenv63KEa7FpE
 8QlFD0QZXXEC/57lZa+jutHZ7cwrmXaXERk4R6kXrio6bwePpfRLo78U8ahZgkFmg6Qd
 H5XtaYSbZuFTVNPdLuy91KUXGkx7OC5QtCsmHJZDUbCX+u7Ah1gLgGXsZcz8gsWkP5KX
 oQcvgLMQM+i12SFn/Q/yNe+MlqUJbt0MBq7n/7gBAP7KYGt5XBtRt4IgORnMk9p1rYIJ
 11Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jYCAvngDuFSsbxeiGlc+WElSPqdXpIAVts6LGe23+J4=;
 b=G4M0iFIf2ZzrLlITa9t8Vl+4phsJ030I7WBJ8E+nKKNMJEbDL1hNQU+wRKiLzwkWnP
 3LOVAwx2oP/cIvdouZMwm9RDloQ+Kdfft5iUzqM/qZf491jA6f+Vcb1Uv4fhDaQMcEx+
 XwEjuQaswszgjuXs+8U5OuYZ5OD9Dw6gTKF/034P750HIukigCATDuz4H53evweD+oMy
 mQntptJsOTtg75Ui9aHSxDJdR1EHCqgXa2HowmbE1qslCUTu1Shla2fAJfZs6xe3xVC5
 t0FoiFJT0v76RgWI6+Xe3zmiynT/tipqc6TGJnGO5xKC400rDpaciZptvP5EYleoU52T
 KI+Q==
X-Gm-Message-State: AOAM532Dof+RRdm/eNeVHCKO1+3kIieoRzC4VpD6BkbBFPUStdKgLRiO
 kz532hcYByWgDvd4XiYVYKo3XWTw8VxKHFCV9oS2CSb7i0jjmw==
X-Google-Smtp-Source: ABdhPJwZhLNh0LvbRzARncN2m9ASGOBPiAev/OrzCC+ljQeNTo/NPMqvTSCKn9SoySQLdfJ4altIE0F1R/6Xt2e8Nm4=
X-Received: by 2002:a2e:894e:: with SMTP id b14mr787734ljk.216.1638298778689; 
 Tue, 30 Nov 2021 10:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20211118014445.1621187-1-wak@google.com>
 <CACPK8XfD31bUx1NZM3qo7VEwMe-N8VsQimP9b7GxCn1PwxC5yQ@mail.gmail.com>
In-Reply-To: <CACPK8XfD31bUx1NZM3qo7VEwMe-N8VsQimP9b7GxCn1PwxC5yQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 30 Nov 2021 10:59:27 -0800
Message-ID: <CAPnigKmd38-bHesYpSKp14Rv+KO48nTP-NxYZRKozR8zQWOPRA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix GPIO pin names
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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

The changes only exist in 9a543726887d805d80f63b5165ef3d1a07d6c6eb,
which is an openbmc specific tree change. Mainline doesn't have the
breakage yet.

On Tue, Nov 23, 2021 at 12:53 AM Joel Stanley <joel@jms.id.au> wrote:
>
> Hi William,
>
> On Thu, 18 Nov 2021 at 01:45, William A. Kennington III <wak@google.com> wrote:
> >
> > The pinctrl driver for the NPCM7xx updated some of the pinctrl names to
> > include HGPIO definitions, but the dts file remained unchanged. This
> > breaks pinctrl parsing if the strings don't match.
> >
> > Signed-off-by: William A. Kennington III <wak@google.com>
>
> I'm wondering where you want this patch to be applied (and who would do so!).
>
> Is the relevant pinctrl driver change merged to mainline? If so, send
> it to the upstream lists (linux-arm-kernel) and cc some nuvoton
> reviewers.
>
> If you just want it in the openbmc tree, we can do that. Normally this
> means putting the branch name in the subject.
>
> You should get some review from someone who works on the nuvoton
> boards regardless.
>
> Cheers,
>
> Joel
>
> > ---
> >  arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi | 42 ++++++++++-----------
> >  1 file changed, 21 insertions(+), 21 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> > index 444ea403547b..7c7942cdfd08 100644
> > --- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> > +++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> > @@ -219,77 +219,77 @@ gpio19ol_pins: gpio19ol-pins {
> >                         output-low;
> >                 };
> >                 gpio20_pins: gpio20-pins {
> > -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> > +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio20o_pins: gpio20o-pins {
> > -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> > +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
> >                         bias-disable;
> >                         output-high;
> >                 };
> >                 gpio20ol_pins: gpio20ol-pins {
> > -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> > +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
> >                         bias-disable;
> >                         output-low;
> >                 };
> >                 gpio21_pins: gpio21-pins {
> > -                       pins = "GPIO21/SMB4CSCL/SMB15SCL";
> > +                       pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio21ol_pins: gpio21ol-pins {
> > -                       pins = "GPIO21/SMB4CSCL/SMB15SCL";
> > +                       pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
> >                         bias-disable;
> >                         output-low;
> >                 };
> >                 gpio22_pins: gpio22-pins {
> > -                       pins = "GPIO22/SMB4DSDA/SMB14SDA";
> > +                       pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio22ol_pins: gpio22ol-pins {
> > -                       pins = "GPIO22/SMB4DSDA/SMB14SDA";
> > +                       pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
> >                         bias-disable;
> >                         output-low;
> >                 };
> >                 gpio23_pins: gpio23-pins {
> > -                       pins = "GPIO23/SMB4DSCL/SMB14SCL";
> > +                       pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio23ol_pins: gpio23ol-pins {
> > -                       pins = "GPIO23/SMB4DSCL/SMB14SCL";
> > +                       pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
> >                         bias-disable;
> >                         output-low;
> >                 };
> >                 gpio24_pins: gpio24-pins {
> > -                       pins = "GPIO24/IOXHDO";
> > +                       pins = "GPIO24/HGPIO4/IOXHDO";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio24o_pins: gpio24o-pins {
> > -                       pins = "GPIO24/IOXHDO";
> > +                       pins = "GPIO24/HGPIO4/IOXHDO";
> >                         bias-disable;
> >                         output-high;
> >                 };
> >                 gpio24ol_pins: gpio24ol-pins {
> > -                       pins = "GPIO24/IOXHDO";
> > +                       pins = "GPIO24/HGPIO4/IOXHDO";
> >                         bias-disable;
> >                         output-low;
> >                 };
> >                 gpio25_pins: gpio25-pins {
> > -                       pins = "GPIO25/IOXHDI";
> > +                       pins = "GPIO25/HGPIO5/IOXHDI";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio25o_pins: gpio25o-pins {
> > -                       pins = "GPIO25/IOXHDI";
> > +                       pins = "GPIO25/HGPIO5/IOXHDI";
> >                         bias-disable;
> >                         output-high;
> >                 };
> >                 gpio25ol_pins: gpio25ol-pins {
> > -                       pins = "GPIO25/IOXHDI";
> > +                       pins = "GPIO25/HGPIO5/IOXHDI";
> >                         bias-disable;
> >                         output-low;
> >                 };
> > @@ -523,32 +523,32 @@ gpio58ol_pins: gpio58ol-pins {
> >                         output-low;
> >                 };
> >                 gpio59_pins: gpio59-pins {
> > -                       pins = "GPIO59/SMB3DSDA";
> > +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio59o_pins: gpio59o-pins {
> > -                       pins = "GPIO59/SMB3DSDA";
> > +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
> >                         bias-disable;
> >                         output-high;
> >                 };
> >                 gpio59ol_pins: gpio59ol-pins {
> > -                       pins = "GPIO59/SMB3DSDA";
> > +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
> >                         bias-disable;
> >                         output-low;
> >                 };
> >                 gpio60_pins: gpio60-pins {
> > -                       pins = "GPIO60/SMB3DSCL";
> > +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
> >                         bias-disable;
> >                         input-enable;
> >                 };
> >                 gpio60o_pins: gpio60o-pins {
> > -                       pins = "GPIO60/SMB3DSCL";
> > +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
> >                         bias-disable;
> >                         output-high;
> >                 };
> >                 gpio60ol_pins: gpio60ol-pins {
> > -                       pins = "GPIO60/SMB3DSCL";
> > +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
> >                         bias-disable;
> >                         output-low;
> >                 };
> > --
> > 2.34.0.rc1.387.gb447b232ab-goog
> >
