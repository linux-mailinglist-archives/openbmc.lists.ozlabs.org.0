Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A6931105
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 11:17:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A8BLxG/3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMxRH507yz3c5R
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 19:16:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A8BLxG/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMxQm4SpPz2xQ7
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 19:16:32 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e0354459844so4087722276.3
        for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721034987; x=1721639787; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AUf85od3WX5T42eEiIsErqdDz4+/5gJw0VbBxOkFiq8=;
        b=A8BLxG/3IFsJwKR4E3r9f1vHUVlpk05hc8w9iE+g//3lcuzpBygF6HD45fBzgErN+0
         6QbSqj5rzD5v73zCg2+zyqbUx/rhsc1Afl4bFpg3q2BTEXcf0DGC7uUwXGePwvaxza/b
         IdUdj9jat3I31ZwzlzdlQAu+epkh7xK2VQXqaHUVUv4Z1KlaXQCkD4cZNGhnx6e5iZfM
         DCVystYkaERJIfuSGCqABaPQISo9TZuwUBYEMmIV7dq2R1DpR4SB/BnHP75K2hULBuVU
         Jk4VyXO+FtR+OzTrmbG5jw2XFQSoYKBjW2RxaT375omoO/128C8KoTevrTR3aGIfr0UG
         P+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721034987; x=1721639787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUf85od3WX5T42eEiIsErqdDz4+/5gJw0VbBxOkFiq8=;
        b=ZKS/hK4u/D2r0WV6JHU9Lj8K1EEOq7IqRzcjmLaHnYpw/ZWeoGKvCbyGe1CIOoJohJ
         iSW0xan20AaazTpY3gpEWPQd3zXlKar/8JKgRSbHE0UUVQXyRCL90piROEx9JEC/Y9l1
         L80het4dPYmGmuyTXLlVpGLRGsICnROu0VpEvuj8DZW58QBGyptFLHdkEtbRKuEKVqMl
         qZyqCd068baTLUfAWmF1X7ibQLataTU2NMWA2jWKvC4Eg636+w5JM6hbxQDETKMUhpkP
         eqECQS5dvlGGBMII4NbDrrix/+V08STCv92Yyu+ePDs/7yOOc9heRXuNsB4lPTv2jDeV
         cRKw==
X-Gm-Message-State: AOJu0YykvydX36liLlUJIS4eGNi2D6ru4Mgg3rfALyBKmmQlu3LgdAkg
	DXJ2Ko+Kk41T7XwGOThnujiUjaJ8jt0VSHaQv77lOX4Hej5QYVL8/tZa9Et77iTtQNuibdYz0Bz
	JHwU9FoKQ5EObbUML1qes5zzLbE7Lpo4C
X-Google-Smtp-Source: AGHT+IG/NkTCpw7WPq8iWHPh0HawHLAacAAji0d4+tYez0hji3Ek8M7wllKm/xyJYNCjyGvyTTegS8WSQH2dOz7wHJ8=
X-Received: by 2002:a05:690c:4a0c:b0:63b:aaf1:b8c1 with SMTP id
 00721157ae682-658f02f5605mr229613207b3.37.1721034987213; Mon, 15 Jul 2024
 02:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240714152617.3055768-1-tmaimon77@gmail.com> <1c0d0b77405bbc5a2ddb5893405cc816a30a18cb.camel@codeconstruct.com.au>
In-Reply-To: <1c0d0b77405bbc5a2ddb5893405cc816a30a18cb.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jul 2024 12:16:16 +0300
Message-ID: <CAP6Zq1iGhQRUZx2j3nF0cYArAhXH_uqv7T8ztNEN3j1wePJGAw@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 1/3] arm64: dts: nuvoton: npcm8xx: add
 reference 25m clock property
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks for your comments.

On Mon, 15 Jul 2024 at 09:05, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Tomer,
>
> In the future, can you please send your series with a cover letter with
> the patches threaded under it?
Sure!
>
> If you're not already using it, b4 is a helpful tool for sending
> patches:
I wasn't aware to B$, I will try it, thanks :-)
>
> https://b4.docs.kernel.org/en/latest/
>
> I ask because it's not clear to me what the relationship of this series
> is with respect to what's going on upstream. A cover letter is a great
> place to explain whether the patches are:
>
> 1. A backport of those under review upstream
> 2. A backport of patches already merged upstream
> 3. Specific to the openbmc/linux tree and have no upstream equivalent
>
> In the case of 1 and 2 (which are the ideal cases), I really prefer you
> include a link to the upstream equivalents. The link makes it easier
> for me to gauge how mature the patches are.
If I am sending one patch only do you like me to add under --- in the
patch explanation as well?
>
> Regarding the patch content (rather than process), while the patches
> all touch the NPCM8XX devicetree, they don't seem to have a coherent
> feel otherwise :(
>
> On Sun, 2024-07-14 at 18:26 +0300, Tomer Maimon wrote:
> > The NPCM8XX clock driver uses a 25Mhz external clock, therefore adding
> > clock property.
> >
> > The new required clock property does not break the NPCM8XX clock ABI
> > since the NPCM8XX clock driver hasn't merged yet to the Linux vanilla.
>
> This is a statement with respect to upstream, but it seems we've
> already applied some of the patches here, and so there's possibly a
> concern?
Unfortunately, the NPCM8XX clock driver has been removed in dev-6.6,
so the OpenBMC Linux kernel is dev-6.6 is in the same state as the
Linux kernel vanilla.
BTW, I don't see any concern with the reference clock patch, but the
DT maintainers asked me to mention it not cause any ABI issue.
>
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++----
> >  arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts     | 7 +++++++
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 91c1b5c4d635..9bd22f7d43f4 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -58,6 +58,7 @@ clk: clock-controller@f0801000 {
> >                       compatible = "nuvoton,npcm845-clk";
> >                       #clock-cells = <1>;
> >                       reg = <0x0 0xf0801000 0x0 0x1000>;
> > +                     clocks = <&refclk>;
> >               };
> >
> >               apb {
> > @@ -81,7 +82,7 @@ timer0: timer@8000 {
> >                               compatible = "nuvoton,npcm845-timer";
> >                               interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg = <0x8000 0x1C>;
> > -                             clocks = <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks = <&refclk>;
> >                               clock-names = "refclk";
> >                       };
> >
> > @@ -153,7 +154,7 @@ watchdog0: watchdog@801c {
> >                               interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg = <0x801c 0x4>;
> >                               status = "disabled";
> > -                             clocks = <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks = <&refclk>;
> >                               syscon = <&gcr>;
> >                       };
> >
> > @@ -162,7 +163,7 @@ watchdog1: watchdog@901c {
> >                               interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg = <0x901c 0x4>;
> >                               status = "disabled";
> > -                             clocks = <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks = <&refclk>;
> >                               syscon = <&gcr>;
> >                       };
> >
> > @@ -171,7 +172,7 @@ watchdog2: watchdog@a01c {
> >                               interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg = <0xa01c 0x4>;
> >                               status = "disabled";
> > -                             clocks = <&clk NPCM8XX_CLK_REFCLK>;
> > +                             clocks = <&refclk>;
> >                               syscon = <&gcr>;
> >                       };
> >               };
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > index a5ab2bc0f835..83c2f4e138e5 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > @@ -19,6 +19,13 @@ chosen {
> >       memory {
> >               reg = <0x0 0x0 0x0 0x40000000>;
> >       };
> > +
> > +     refclk: refclk-25mhz {
>
> The node name should probably just be 'clock' according to the generic
> node names recommendation?
What do you mean? refclock? I am not sure, for example:
https://elixir.bootlin.com/linux/v6.10-rc7/source/arch/arm64/boot/dts/freescale/imx8mq-evk.dts#L24
>
> > +             compatible = "fixed-clock";
> > +             clock-output-names = "ref";
> > +             clock-frequency = <25000000>;
> > +             #clock-cells = <0>;
> > +     };
>
> Defining this in the .dts but referencing the label inside the .dtsi
> feels a bit off to me (as the .dtsi is no-longer self-contained). How
> about we define the node in the .dtsi but override it in the .dts?
I had a dissection about it with Krzysztof :-) I was told that since
it is a reference clock on the board and not inside the SoC it should
be defined in the DTS.
>
> Andrew

Best regards,

Tomer
