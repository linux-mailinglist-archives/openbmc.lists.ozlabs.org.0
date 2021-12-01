Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1514643F0
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 01:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3g0F4RGjz308v
	for <lists+openbmc@lfdr.de>; Wed,  1 Dec 2021 11:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=k9F1sVrx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=k9F1sVrx; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3fzp1WfZz304n
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 11:27:16 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id t11so22168049qtw.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 Nov 2021 16:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKN5ifiaWpLrTgW1qDZs3TgMb6ZK2mF5QFDhZvdjIAg=;
 b=k9F1sVrxpAAMbliDUyFHkas0XLkglCZCbxRyoxmFdMMSThOO5fCiIh0tW6GnjSoIUm
 Ru75R/FZc+Zl3b5WcwZBGwGP5hjL/tjokAgBqQLR1e+EMpAuJltOLunQ2cas/B+kBNpF
 iwxcrzz1IHNl81au2tMr6+l0b4P7oyGgZ53WE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKN5ifiaWpLrTgW1qDZs3TgMb6ZK2mF5QFDhZvdjIAg=;
 b=6FJZGL+XnmIL8FthqwDazGWStlc02eLEJ4z0yT1C/XV/Me8eSu/Eth8vJd2ZOYrj5h
 Jp3EsMQ3w9yzD3OP6CUp9t5KAv1aVjZ7tHvfev9/2afnonZX/nJvh0pLJaVayo5ssiMf
 09iUq9glnraXW7Uc0etOnAx5lPqcWF2BdZ6rXg6f29B6zxhuKclrHYX/b57LK/ZrxTR5
 xSpRFY4ZB2ZUKTGr/GU6zWNN/UPtu2C9ufLqB2P/oQGla+1kuhbgKwLciUYL6KGJzR+f
 64QCtUdTifMlYmqQGMF1n0CCESeCBoMgzUBp5oEbjBBQot1qxJyvSCSs649jwlQUUN92
 NyMw==
X-Gm-Message-State: AOAM533SSm/QgfBbauk3/O7alycRh6EeZHQLSBFrW3Z/hKoRMgXyhvKq
 ND/XaIu3H9LHOGLH0/i2yscraL0aHfxWpmzCLBI=
X-Google-Smtp-Source: ABdhPJzY6KYCJUbhdvF5I8AvCRVysO0Piji02QgXuZRLPzip7FcR6R2Qj/JTiDgUEXFFR+A3A2bpWO9HZtnthVRPPQY=
X-Received: by 2002:a05:622a:588:: with SMTP id
 c8mr3381408qtb.108.1638318431138; 
 Tue, 30 Nov 2021 16:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20211118014445.1621187-1-wak@google.com>
 <CACPK8XfD31bUx1NZM3qo7VEwMe-N8VsQimP9b7GxCn1PwxC5yQ@mail.gmail.com>
 <CAPnigKmd38-bHesYpSKp14Rv+KO48nTP-NxYZRKozR8zQWOPRA@mail.gmail.com>
In-Reply-To: <CAPnigKmd38-bHesYpSKp14Rv+KO48nTP-NxYZRKozR8zQWOPRA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Dec 2021 00:26:58 +0000
Message-ID: <CACPK8Xf6HfrBwjUA24hds+KT_aMBY25v0yivQDDONGiAy_Dejw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Fix GPIO pin names
To: William Kennington <wak@google.com>
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

On Tue, 30 Nov 2021 at 18:59, William Kennington <wak@google.com> wrote:
>
> The changes only exist in 9a543726887d805d80f63b5165ef3d1a07d6c6eb,
> which is an openbmc specific tree change. Mainline doesn't have the
> breakage yet.

Please reply inline on open source mailing lists instead of top posting.

If you want this in the openbmc tree, we have conventions for doing
so. Please see my note below.

>
> On Tue, Nov 23, 2021 at 12:53 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hi William,
> >
> > On Thu, 18 Nov 2021 at 01:45, William A. Kennington III <wak@google.com> wrote:
> > >
> > > The pinctrl driver for the NPCM7xx updated some of the pinctrl names to
> > > include HGPIO definitions, but the dts file remained unchanged. This
> > > breaks pinctrl parsing if the strings don't match.
> > >
> > > Signed-off-by: William A. Kennington III <wak@google.com>
> >
> > I'm wondering where you want this patch to be applied (and who would do so!).
> >
> > Is the relevant pinctrl driver change merged to mainline? If so, send
> > it to the upstream lists (linux-arm-kernel) and cc some nuvoton
> > reviewers.
> >
> > If you just want it in the openbmc tree, we can do that. Normally this
> > means putting the branch name in the subject.
> >
> > You should get some review from someone who works on the nuvoton
> > boards regardless.
> >
> > Cheers,
> >
> > Joel
> >
> > > ---
> > >  arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi | 42 ++++++++++-----------
> > >  1 file changed, 21 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> > > index 444ea403547b..7c7942cdfd08 100644
> > > --- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> > > +++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
> > > @@ -219,77 +219,77 @@ gpio19ol_pins: gpio19ol-pins {
> > >                         output-low;
> > >                 };
> > >                 gpio20_pins: gpio20-pins {
> > > -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> > > +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio20o_pins: gpio20o-pins {
> > > -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> > > +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
> > >                         bias-disable;
> > >                         output-high;
> > >                 };
> > >                 gpio20ol_pins: gpio20ol-pins {
> > > -                       pins = "GPIO20/SMB4CSDA/SMB15SDA";
> > > +                       pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > >                 gpio21_pins: gpio21-pins {
> > > -                       pins = "GPIO21/SMB4CSCL/SMB15SCL";
> > > +                       pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio21ol_pins: gpio21ol-pins {
> > > -                       pins = "GPIO21/SMB4CSCL/SMB15SCL";
> > > +                       pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > >                 gpio22_pins: gpio22-pins {
> > > -                       pins = "GPIO22/SMB4DSDA/SMB14SDA";
> > > +                       pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio22ol_pins: gpio22ol-pins {
> > > -                       pins = "GPIO22/SMB4DSDA/SMB14SDA";
> > > +                       pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > >                 gpio23_pins: gpio23-pins {
> > > -                       pins = "GPIO23/SMB4DSCL/SMB14SCL";
> > > +                       pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio23ol_pins: gpio23ol-pins {
> > > -                       pins = "GPIO23/SMB4DSCL/SMB14SCL";
> > > +                       pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > >                 gpio24_pins: gpio24-pins {
> > > -                       pins = "GPIO24/IOXHDO";
> > > +                       pins = "GPIO24/HGPIO4/IOXHDO";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio24o_pins: gpio24o-pins {
> > > -                       pins = "GPIO24/IOXHDO";
> > > +                       pins = "GPIO24/HGPIO4/IOXHDO";
> > >                         bias-disable;
> > >                         output-high;
> > >                 };
> > >                 gpio24ol_pins: gpio24ol-pins {
> > > -                       pins = "GPIO24/IOXHDO";
> > > +                       pins = "GPIO24/HGPIO4/IOXHDO";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > >                 gpio25_pins: gpio25-pins {
> > > -                       pins = "GPIO25/IOXHDI";
> > > +                       pins = "GPIO25/HGPIO5/IOXHDI";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio25o_pins: gpio25o-pins {
> > > -                       pins = "GPIO25/IOXHDI";
> > > +                       pins = "GPIO25/HGPIO5/IOXHDI";
> > >                         bias-disable;
> > >                         output-high;
> > >                 };
> > >                 gpio25ol_pins: gpio25ol-pins {
> > > -                       pins = "GPIO25/IOXHDI";
> > > +                       pins = "GPIO25/HGPIO5/IOXHDI";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > > @@ -523,32 +523,32 @@ gpio58ol_pins: gpio58ol-pins {
> > >                         output-low;
> > >                 };
> > >                 gpio59_pins: gpio59-pins {
> > > -                       pins = "GPIO59/SMB3DSDA";
> > > +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio59o_pins: gpio59o-pins {
> > > -                       pins = "GPIO59/SMB3DSDA";
> > > +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
> > >                         bias-disable;
> > >                         output-high;
> > >                 };
> > >                 gpio59ol_pins: gpio59ol-pins {
> > > -                       pins = "GPIO59/SMB3DSDA";
> > > +                       pins = "GPIO59/HGPIO6/SMB3DSDA";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > >                 gpio60_pins: gpio60-pins {
> > > -                       pins = "GPIO60/SMB3DSCL";
> > > +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
> > >                         bias-disable;
> > >                         input-enable;
> > >                 };
> > >                 gpio60o_pins: gpio60o-pins {
> > > -                       pins = "GPIO60/SMB3DSCL";
> > > +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
> > >                         bias-disable;
> > >                         output-high;
> > >                 };
> > >                 gpio60ol_pins: gpio60ol-pins {
> > > -                       pins = "GPIO60/SMB3DSCL";
> > > +                       pins = "GPIO60/HGPIO7/SMB3DSCL";
> > >                         bias-disable;
> > >                         output-low;
> > >                 };
> > > --
> > > 2.34.0.rc1.387.gb447b232ab-goog
> > >
