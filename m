Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6452C9363
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 00:56:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClMZc22W8zDr1r
	for <lists+openbmc@lfdr.de>; Tue,  1 Dec 2020 10:56:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=hwcsVpoj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jAa9Erkc; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClMYN1hKTzDr0w
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2020 10:55:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D4BEA724;
 Mon, 30 Nov 2020 18:55:15 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 30 Nov 2020 18:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=bIASrzuF0QEwzvmGN79cmMZuVWoNl4K
 QAUhKfxX4dYg=; b=hwcsVpojxwXeCBva1sxAB+mSJIXYZQRi6gSu3y0ek7cYiB7
 V2hTWDLLje7zSi6dRzkCxH6lpwYrofZyq1QzHIUffalmxq4dQRVX4jV+VzubpJ15
 am1KAAt78wps6iBCnp16gDT97Qi/t4kNeiJOdMzADKPHiIYHRsA7ueoOdP7V9Q6q
 QzP9RPEs4sXISXMGhwHCy4sDJWU/I2lRE7Jidg5vsknJ1Ekzde7hBnNBrVr5MLWS
 isTJKNBYSC96+BOaHy7LEhti81Dzqx3om6/lTJWt4yxjt3f/cMNggVTZ3rKAGXzB
 P4pHDH+uaJvECYT/RYGYVl1oNYZMPLkG4zyrJ3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=bIASrz
 uF0QEwzvmGN79cmMZuVWoNl4KQAUhKfxX4dYg=; b=jAa9ErkcF8ruRZW7djm23C
 YbRQ1CFVSrxriLI7THSCFUmFB1OglueEyzU3gM6Fs/b7/HH+S+U4/DbeJ8zkd0VX
 ouGn7xPGe0vrVr/xCsF13fCbtlKy5gF3+CmsoYJaangorAlNvILzo4vgFqojaLva
 nisD6uB5F458vMZPkYXt2x2Pw0nG3ZrF3JhC/EvpgNezok/6A+E3P4o1DkKw+9M1
 YaY7fAMfd8l1l/vrInZtPX+JDY6EhE+1A+UvzZ3q4AamRUQBamUuLuWgX7hvR51F
 j0MuxmAHRqTY6mZgkCHW9bs6xCJNO4jcXREB/Osqn7TcrTSJ05/6SqhCoW4yhPWg
 ==
X-ME-Sender: <xms:YobFX_sQcM2n40U9nJP3FOVEVz8zGOpVYn0mNCTMADVyAiAMBGGXJw>
 <xme:YobFXwfZUsEsgG6Do88dKjrNzsUgIwOH1ZV8hUiDlzcbnfS57fVd2Z-yKNK3FWzRW
 HTiQgTnTl5WEIjyrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:YobFXywKF9stSRH5bwrmeCljLk_KXlsUjcN7jUsv6wh_oe24Muv4YQ>
 <xmx:YobFX-NIZslmv-BPsB_xP3Uv3X4b9h5lqonNOgLZq582rSA5skgscA>
 <xmx:YobFX_--kO3Tg_n5ddXS2fjTE4HQ2VGZYOQZa76jcLS610sAUr2dTw>
 <xmx:Y4bFX8HA8oHyXezk6HJ84_CYcIUPnYSomI5Ix6bmMM1C-H5ucPyYBQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A68E3E00A6; Mon, 30 Nov 2020 18:55:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <e6a009c1-a324-47ad-bb9c-25569a29b2dc@www.fastmail.com>
In-Reply-To: <CACPK8Xf2wh_bBEY_83-CfskeTKgQM1w3vSx837_y0QhMHkbeCg@mail.gmail.com>
References: <20201124044910.2006209-1-msbarth@linux.ibm.com>
 <CACPK8Xf2wh_bBEY_83-CfskeTKgQM1w3vSx837_y0QhMHkbeCg@mail.gmail.com>
Date: Tue, 01 Dec 2020 10:24:54 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Matthew Barth" <msbarth@linux.ibm.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.8]_ARM:_dts:_aspeed:_rainier:_Set_MAX31?=
 =?UTF-8?Q?785_config?=
Content-Type: text/plain
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



On Fri, 27 Nov 2020, at 15:24, Joel Stanley wrote:
> On Tue, 24 Nov 2020 at 04:49, Matthew Barth <msbarth@linux.ibm.com> wrote:
> >
> > Set the MAX31785 device configuration properties
> 
> Andrew,
> 
> As I understand it these properties are not upstream 

Correct.

> and we have no
> intention of making them so

Well, they were rejected last time I tried. I think there are some things I 
could try to fix, but I'm not optimistic that the fixes will get the binding 
changes across the line.

> as the correct fix is to properly program
> the EEPROM in the fan controller with these settings. Can you clarify
> here?

Right - I've been considering whether we could use a first-boot systemd service 
to program the fan controller settings from userspace using i2c[sg]et. 
Conceptually nice, but we may need to come up with a means to reprogram the 
chip after the fan card is replaced due to a fault or some such issue.

I haven't put any effort in to prototyping the first-boot approach, so we 
should probably take this patch for now.

Andrew

> 
> >
> > Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 54 ++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > index a4b77aec5424..4692c5e8f919 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> > @@ -732,24 +732,78 @@ fan0: fan@0 {
> >                         compatible = "pmbus-fan";
> >                         reg = <0>;
> >                         tach-pulses = <2>;
> > +                       maxim,fan-rotor-input = "tach";
> > +                       maxim,fan-pwm-freq = <25000>;
> > +                       maxim,fan-dual-tach;
> > +                       maxim,fan-no-watchdog;
> > +                       maxim,fan-no-fault-ramp;
> > +                       maxim,fan-ramp = <2>;
> > +                       maxim,fan-fault-pin-mon;
> >                 };
> >
> >                 fan1: fan@1 {
> >                         compatible = "pmbus-fan";
> >                         reg = <1>;
> >                         tach-pulses = <2>;
> > +                       maxim,fan-rotor-input = "tach";
> > +                       maxim,fan-pwm-freq = <25000>;
> > +                       maxim,fan-dual-tach;
> > +                       maxim,fan-no-watchdog;
> > +                       maxim,fan-no-fault-ramp;
> > +                       maxim,fan-ramp = <2>;
> > +                       maxim,fan-fault-pin-mon;
> >                 };
> >
> >                 fan2: fan@2 {
> >                         compatible = "pmbus-fan";
> >                         reg = <2>;
> >                         tach-pulses = <2>;
> > +                       maxim,fan-rotor-input = "tach";
> > +                       maxim,fan-pwm-freq = <25000>;
> > +                       maxim,fan-dual-tach;
> > +                       maxim,fan-no-watchdog;
> > +                       maxim,fan-no-fault-ramp;
> > +                       maxim,fan-ramp = <2>;
> > +                       maxim,fan-fault-pin-mon;
> >                 };
> >
> >                 fan3: fan@3 {
> >                         compatible = "pmbus-fan";
> >                         reg = <3>;
> >                         tach-pulses = <2>;
> > +                       maxim,fan-rotor-input = "tach";
> > +                       maxim,fan-pwm-freq = <25000>;
> > +                       maxim,fan-dual-tach;
> > +                       maxim,fan-no-watchdog;
> > +                       maxim,fan-no-fault-ramp;
> > +                       maxim,fan-ramp = <2>;
> > +                       maxim,fan-fault-pin-mon;
> > +               };
> > +
> > +               fan4: fan@4 {
> > +                       compatible = "pmbus-fan";
> > +                       reg = <4>;
> > +                       tach-pulses = <2>;
> > +                       maxim,fan-rotor-input = "tach";
> > +                       maxim,fan-pwm-freq = <25000>;
> > +                       maxim,fan-dual-tach;
> > +                       maxim,fan-no-watchdog;
> > +                       maxim,fan-no-fault-ramp;
> > +                       maxim,fan-ramp = <2>;
> > +                       maxim,fan-fault-pin-mon;
> > +               };
> > +
> > +               fan5: fan@5 {
> > +                       compatible = "pmbus-fan";
> > +                       reg = <5>;
> > +                       tach-pulses = <2>;
> > +                       maxim,fan-rotor-input = "tach";
> > +                       maxim,fan-pwm-freq = <25000>;
> > +                       maxim,fan-dual-tach;
> > +                       maxim,fan-no-watchdog;
> > +                       maxim,fan-no-fault-ramp;
> > +                       maxim,fan-ramp = <2>;
> > +                       maxim,fan-fault-pin-mon;
> >                 };
> >         };
> >
> > --
> > 2.28.0
> >
>
