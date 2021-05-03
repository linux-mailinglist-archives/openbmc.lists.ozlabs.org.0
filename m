Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DAC3713AD
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 12:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYfTP1NBKz2yyL
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 20:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=WUGzwoN3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=q1o7ZTA8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=WUGzwoN3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=q1o7ZTA8; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYfSz43Qyz2xfx;
 Mon,  3 May 2021 20:33:22 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 053F4580B6A;
 Mon,  3 May 2021 06:33:19 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 03 May 2021 06:33:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=rlPCJINeTm8HbuRWm6UlVXdByMgTHzf
 VXScCOKr52eM=; b=WUGzwoN3ttDsOqa0YjNkiO+a2r8/soQqFvzwb2h/iuRM4aa
 fo+q9bpWTHDvOcxVsG11UDnFkhLuFODcY/YGfTYLi+tBJFU4CnjQc43BuD/C2h6r
 gz3MJupqfXlQDHuKiLAo2tohFRwSyOJNMNvAU2xo87PV2kT1NEHk9zE2g4u9BDND
 i2IPwAARb+rWPOuZW7Xk3znIeAkfHR7QCE8X2eqhLUiTSDeNNipgYtN1JdMado9n
 CvwpxarO+SrUbes+uhxU497Ijv5ifeYramx+/WV/CCp9wm421BRDhZCHlMNVeP4H
 eWNGEYeX4wF2Pw5Ncng81lXhRt1ceRj5mzidBPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rlPCJI
 NeTm8HbuRWm6UlVXdByMgTHzfVXScCOKr52eM=; b=q1o7ZTA86GPxBmIR5uAGGP
 UMmpG+Oz6SnP0KkZoENxSJXdr/QNQTVs3XswNGt8xZHGRTG9OlQTuCASoFxzoSPl
 2OGZI7Xv40ZBARV9oGcggYpT4QwGK5RmkFR/HgZ1qWL+cEtP6H5655j4ZRTdOKws
 wqPMopT811MeOgMckGGYSpAvX6kWhN72O85UhFFYTaKNNVhL8I478qREUrVzFXl2
 VWvfDmH+SNFuEXMLEfbohVvJdbL06D8iTU8ay3K/0H8j0L2noY5CxhM64GrlPza0
 rR1WcAmAa8xIQTWYuz9GKz2Kkg8BPfqnX+bRTJjHbgl+jxfyYbj6IglqaNzP1vAA
 ==
X-ME-Sender: <xms:bdGPYJB0o07yb4liJbPzhn_9Geoz6ezKjP1RBtcjWwEGHIq_yjhbHA>
 <xme:bdGPYHgdCPNWNLPPv6FIYMLV-f2stpo5BliCPffSzTvGC2k8251qjt-c_uI7Z2F4f
 UiiIfvTWVUpQmFytQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvefhgfffffejudetffdtffeiudfgleduudehheehvedvleetgfevvdek
 vefhgffhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdphigrmhhlrdhorhhgnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruh
X-ME-Proxy: <xmx:bdGPYEm07vbJhkZhNDSQ9IbWdZe2qeKObsSTyyLuq6AjiTT62lRKug>
 <xmx:bdGPYDzFy1_Z2W2E761fgjQR4JR0CDZA4atTCDuxNl1pY0K7SmdxKQ>
 <xmx:bdGPYOSmivSYUjqddPmKlWfpOWpnSoNq3kj2Lyx1PJg24KeHGq7kEA>
 <xmx:b9GPYKY7BvK6FtV3eh1F1qJ8c1RoGdAMb8BYJ7zBsZQaj7goKR79Cg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D5486A00079; Mon,  3 May 2021 06:33:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <6678be60-d078-4eaa-8fef-37a60473f1cc@www.fastmail.com>
In-Reply-To: <20210503094054.GA12520@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-2-steven_lee@aspeedtech.com>
 <75226402-503c-4e9b-96dc-e4bd74cf20ac@www.fastmail.com>
 <20210503094054.GA12520@aspeedtech.com>
Date: Mon, 03 May 2021 20:02:56 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2_1/3]_dt-bindings:_mmc:_sdhci-of-aspeed:_Add_desc?=
 =?UTF-8?Q?ription_for_AST2600_EVB.?=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 3 May 2021, at 19:10, Steven Lee wrote:
> The 05/03/2021 12:19, Andrew Jeffery wrote:
> > Hi Steven,
> > 
> > On Mon, 3 May 2021, at 11:13, Steven Lee wrote:
> > > Add the description for describing the AST 2600 EVB reference design of
> > > GPIO regulators and provide the example in the document.
> > > 
> > > AST2600-A2 EVB has the reference design for enabling SD bus
> > > power and toggling SD bus signal voltage by GPIO pins.
> > > 
> > > In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> > > power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> > > connected to a 1.8v and a 3.3v power load switch that providing
> > > signal voltage to
> > > SD1 bus.
> > > 
> > > If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > > disabled.
> > > If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> > > signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> > > enabled, SD1 signal voltage becomes 1.8v.
> > > 
> > > AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > > The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> > > GPIOV3 as power-switch-gpio.
> > > 
> > > Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> > > ---
> > >  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 99 +++++++++++++++++++
> > >  1 file changed, 99 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml 
> > > b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > index 987b287f3bff..dd894aba0bb7 100644
> > > --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> > > @@ -20,6 +20,19 @@ description: |+
> > >    the slots are dependent on the common configuration area, they are 
> > > described
> > >    as child nodes.
> > >  
> > > +  The signal voltage of SDHCIs on AST2600-A2 EVB is able to be toggled 
> > > by GPIO
> > > +  pins. In the reference design, GPIOV0 of AST2600-A2 EVB is connected 
> > > to the
> > > +  power load switch that providing 3.3v to SD1 bus vdd, GPIOV1 is 
> > > connected to
> > > +  a 1.8v and a 3.3v power load switch that providing signal voltage to
> > > +  SD1 bus.
> > > +  If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> > > +  disabled. If GPIOV1 is active high, 3.3v power load switch is 
> > > enabled, SD1
> > > +  signal voltage is 3.3v. Otherwise, 1.8v power load switch will be 
> > > enabled, SD1
> > > +  signal voltage becomes 1.8v.
> > > +  AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> > > +  The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and 
> > > GPIOV3
> > > +  as power-switch-gpio.
> > 
> > I don't think we should be describing design-specific details in the 
> > binding document. However, I think this would be a great comment in the 
> > AST2600 EVB devicetree. Can you please move it there?
> > 
> 
> Ok, I will move it to the device tree.
> 
> I was wondering if the following place is a good place to put the
> comment
> 
> at line 534 of aspeed-g6.dtsi

What you're describing is specific to the AST2600 EVB, so I suggest you 
put it in the EVB dts, e.g. at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-ast2600-evb.dts#n103

> sdc: sdc@1e740000 {
> 	// Comment here...
> 
> 	compatible = "aspeed,ast2600-sd-controller";
> 	reg = <0x1e740000 0x100>;
> 
> 	sdhci0: sdhci@1e740100 {
> 		compatible = "aspeed,ast2600-sdhci", "sdhci";
> 		reg = <0x100 0x100>;
> 		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> ...
> }
> 
> > > +
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -78,6 +91,7 @@ required:
> > >    - clocks
> > >  
> > >  examples:
> > > +  //Example 1
> > >    - |
> > >      #include <dt-bindings/clock/aspeed-clock.h>
> > >      sdc@1e740000 {
> > > @@ -104,3 +118,88 @@ examples:
> > >                      clocks = <&syscon ASPEED_CLK_SDIO>;
> > >              };
> > >      };
> > > +
> > > +  //Example 2 (AST2600EVB with GPIO regulator)
> > 
> > I feel you didn't test this with `make dt_binding_check` as `//` isn't
> > a valid YAML comment token. You need to use `#` for comments (
> > https://yaml.org/spec/1.2/spec.html#id2780069 ).
> > 
> 
> Sorry, I don't know that there is a binding check command for valiating
> YAML document.

No worries! There's also `make dtbs_check` to validate the devicetree files
against the bindings. It's useful to run both, as usually when you're adding to
the binding you're modifying a devicetree as well.

Unfortunately we need to do a bit of a cleanup of the Aspeed dts files, they
generate a number of warnings right now.

> Regardless, thanks for the reference link.
> I will test with dt_binding_check.
> 
> > > +  - |
> > > +    #include <dt-bindings/clock/aspeed-clock.h>
> > > +    #include <dt-bindings/gpio/aspeed-gpio.h>
> > > +    vcc_sdhci0: regulator-vcc-sdhci0 {
> > > +            compatible = "regulator-fixed";
> > > +
> > > +            regulator-name = "SDHCI0 Vcc";
> > > +            regulator-min-microvolt = <3300000>;
> > > +            regulator-max-microvolt = <3300000>;
> > > +            gpios = <&gpio0 ASPEED_GPIO(V, 0)
> > > +                            GPIO_ACTIVE_HIGH>;
> > > +            enable-active-high;
> > > +    };
> > > +
> > > +    vccq_sdhci0: regulator-vccq-sdhci0 {
> > > +            compatible = "regulator-gpio";
> > > +
> > > +            regulator-name = "SDHCI0 VccQ";
> > > +            regulator-min-microvolt = <1800000>;
> > > +            regulator-max-microvolt = <3300000>;
> > > +            gpios = <&gpio0 ASPEED_GPIO(V, 1)
> > > +                            GPIO_ACTIVE_HIGH>;
> > > +            gpios-states = <1>;
> > > +            states = <3300000 1
> > > +                      1800000 0>;
> > > +    };
> > > +
> > > +    vcc_sdhci1: regulator-vcc-sdhci1 {
> > > +            compatible = "regulator-fixed";
> > > +
> > > +            regulator-name = "SDHCI1 Vcc";
> > > +            regulator-min-microvolt = <3300000>;
> > > +            regulator-max-microvolt = <3300000>;
> > > +            gpios = <&gpio0 ASPEED_GPIO(V, 2)
> > > +                            GPIO_ACTIVE_HIGH>;
> > > +            enable-active-high;
> > > +    };
> > > +
> > > +    vccq_sdhci1: regulator-vccq-sdhci1 {
> > > +            compatible = "regulator-gpio";
> > > +
> > > +            regulator-name = "SDHCI1 VccQ";
> > > +            regulator-min-microvolt = <1800000>;
> > > +            regulator-max-microvolt = <3300000>;
> > > +            gpios = <&gpio0 ASPEED_GPIO(V, 3)
> > > +                            GPIO_ACTIVE_HIGH>;
> > > +            gpios-states = <1>;
> > > +            states = <3300000 1
> > > +                      1800000 0>;
> > > +    };
> > > +
> > > +    sdc@1e740000 {
> > > +            compatible = "aspeed,ast2600-sd-controller";
> > > +            reg = <0x1e740000 0x100>;
> > > +            #address-cells = <1>;
> > > +            #size-cells = <1>;
> > > +            ranges = <0 0x1e740000 0x20000>;
> > > +            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
> > > +
> > > +            sdhci0: sdhci@100 {
> > > +                    compatible = "aspeed,ast2600-sdhci", "sdhci";
> > > +                    reg = <0x100 0x100>;
> > > +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> > > +                    sdhci,auto-cmd12;
> > > +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> > > +                    vmmc-supply = <&vcc_sdhci0>;
> > > +                    vqmmc-supply = <&vccq_sdhci0>;
> > > +                    sd-uhs-sdr104;
> > > +                    clk-phase-uhs-sdr104 = <180>, <180>;
> > > +            };
> > > +
> > > +            sdhci1: sdhci@200 {
> > > +                    compatible = "aspeed,ast2600-sdhci", "sdhci";
> > > +                    reg = <0x200 0x100>;
> > > +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> > > +                    sdhci,auto-cmd12;
> > > +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> > > +                    vmmc-supply = <&vcc_sdhci1>;
> > > +                    vqmmc-supply = <&vccq_sdhci1>;
> > > +                    sd-uhs-sdr104;
> > > +                    clk-phase-uhs-sdr104 = <0>, <0>;
> > > +            };
> > > +    };
> > 
> > This is a good example, so can we keep this and just drop the comment 
> > from the binding document?
> 
> Ok, I will remove the comment.

Thanks.

Andrew
