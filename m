Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2463710BE
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 06:20:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYVBh3N0Mz301v
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 14:20:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=bDUARedU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=B4jlIQXk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=bDUARedU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=B4jlIQXk; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYVBH1pwyz2xfx;
 Mon,  3 May 2021 14:20:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8994D580915;
 Mon,  3 May 2021 00:20:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 03 May 2021 00:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Wp7XYzm4lyNSERoy1FmfOae3cQfvuVX
 2QEotJK/yJJ8=; b=bDUARedUZgjPAzEnZC1bxDiwX+6f3UMtdIfPIEmZ19UArg1
 gRjpcu0moAVl/68G1R09VyDMoXzDkBnynu9KIA8ywdVm3i2eOzt/MzAroKWV9HtE
 EaawbiAPRpMmYsW/0JwECb8riPszF8U+EMMJC+kdujj2fYncAdRj+k6BxRDnJ9dp
 ToAuRIK7LRPk1sfr5UA2jjwBqyQKI05UpBcw8H4RnRbgy23JGhDdupWTOSsYuXT4
 S75haQONi0i28bLR6rLIBXwA8MdhPP8MZE5JVweg1W/FjVd3mkZBA8OPm+ue9DlE
 xqIpvmxgy+714czPXLCUZoFLt5PIAnwGKqwjLBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Wp7XYz
 m4lyNSERoy1FmfOae3cQfvuVX2QEotJK/yJJ8=; b=B4jlIQXklSprl8L9WIInZ4
 K6xyebrbKDzJHotVIMBNqWBMapb2OARcXQ7k8h4iksMYcs94Hd+8CLFN69ZjK5eW
 YQ9cvbnCFhJqZIPc2ITnnaYYeQmXsP8ZXOhnBJygSNBSGcXTr2WPBkYidrhe0z6e
 jnBdv46glIKPSf3XQuyPwmG+kkpcqUtj+89V1MSUXv9ykOTadg+a4C42+ZTUQH35
 vHNfq9oQgUGz0teetMQp3Ot2eeJ7MQGHee2YX82S5shxOckmEanipyD+y6HZ6593
 cgyvExNcwIAiwyLReo17hWhYEkJPgJZx3NRou185hS4ZiBqGUd7yWgTTq8AqcwcQ
 ==
X-ME-Sender: <xms:73mPYDojdWVtg9_LOr2USDZ2uIWZdoeakfedoXaEo3WVXB6ddTUcyQ>
 <xme:73mPYNo39H0zBM3yTk6t_4UN60AA7U2SMbsOtW-eqPlBaK9h7RgxhrcmwXAuoJYfT
 jm0TMNWKNYtWowNSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeffedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepheehfeegfeekjeegtdetuedvgeeljedvteffudeiffduvefhiefhleef
 lefghfeknecuffhomhgrihhnpeihrghmlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:73mPYAP8gYu5MQvSTHL55s7uxh_jEnQPC03tZhcFNc0SMWElXhTg6A>
 <xmx:73mPYG5ramDY4t-dl9upZ_28ky4tT0hOkfSQ0V28SRJ6nWg2xEk0xg>
 <xmx:73mPYC5WgFP_J3uF-xMm3nl0TYsJjBsZMZD0jyNgcZPvF4BwDvOUEA>
 <xmx:8XmPYKj-gqfwS9VvZuy_zC_Adc0d8IFIOFHX0PkGebpW3Eqc1Qb2VQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CD029A00079; Mon,  3 May 2021 00:19:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <75226402-503c-4e9b-96dc-e4bd74cf20ac@www.fastmail.com>
In-Reply-To: <20210503014336.20256-2-steven_lee@aspeedtech.com>
References: <20210503014336.20256-1-steven_lee@aspeedtech.com>
 <20210503014336.20256-2-steven_lee@aspeedtech.com>
Date: Mon, 03 May 2021 13:49:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Steven Lee" <steven_lee@aspeedtech.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>, "Ryan Chen" <ryanchen.aspeed@gmail.com>,
 "moderated list:ASPEED SD/MMC DRIVER" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list" <linux-kernel@vger.kernel.org>
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
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Hongwei Zhang <Hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Steven,

On Mon, 3 May 2021, at 11:13, Steven Lee wrote:
> Add the description for describing the AST 2600 EVB reference design of
> GPIO regulators and provide the example in the document.
> 
> AST2600-A2 EVB has the reference design for enabling SD bus
> power and toggling SD bus signal voltage by GPIO pins.
> 
> In the reference design, GPIOV0 of AST2600-A2 EVB is connected to
> power load switch that providing 3.3v to SD1 bus vdd. GPIOV1 is
> connected to a 1.8v and a 3.3v power load switch that providing
> signal voltage to
> SD1 bus.
> 
> If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> disabled.
> If GPIOV1 is active high, 3.3v power load switch is enabled, SD1
> signal voltage is 3.3v. Otherwise, 1.8v power load switch will be
> enabled, SD1 signal voltage becomes 1.8v.
> 
> AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and
> GPIOV3 as power-switch-gpio.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  .../devicetree/bindings/mmc/aspeed,sdhci.yaml | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml 
> b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> index 987b287f3bff..dd894aba0bb7 100644
> --- a/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml
> @@ -20,6 +20,19 @@ description: |+
>    the slots are dependent on the common configuration area, they are 
> described
>    as child nodes.
>  
> +  The signal voltage of SDHCIs on AST2600-A2 EVB is able to be toggled 
> by GPIO
> +  pins. In the reference design, GPIOV0 of AST2600-A2 EVB is connected 
> to the
> +  power load switch that providing 3.3v to SD1 bus vdd, GPIOV1 is 
> connected to
> +  a 1.8v and a 3.3v power load switch that providing signal voltage to
> +  SD1 bus.
> +  If GPIOV0 is active high, SD1 bus is enabled. Otherwise, SD1 bus is
> +  disabled. If GPIOV1 is active high, 3.3v power load switch is 
> enabled, SD1
> +  signal voltage is 3.3v. Otherwise, 1.8v power load switch will be 
> enabled, SD1
> +  signal voltage becomes 1.8v.
> +  AST2600-A2 EVB also support toggling signal voltage for SD2 bus.
> +  The design is the same as SD1 bus. It uses GPIOV2 as power-gpio and 
> GPIOV3
> +  as power-switch-gpio.

I don't think we should be describing design-specific details in the 
binding document. However, I think this would be a great comment in the 
AST2600 EVB devicetree. Can you please move it there?

> +
>  properties:
>    compatible:
>      enum:
> @@ -78,6 +91,7 @@ required:
>    - clocks
>  
>  examples:
> +  //Example 1
>    - |
>      #include <dt-bindings/clock/aspeed-clock.h>
>      sdc@1e740000 {
> @@ -104,3 +118,88 @@ examples:
>                      clocks = <&syscon ASPEED_CLK_SDIO>;
>              };
>      };
> +
> +  //Example 2 (AST2600EVB with GPIO regulator)

I feel you didn't test this with `make dt_binding_check` as `//` isn't
a valid YAML comment token. You need to use `#` for comments (
https://yaml.org/spec/1.2/spec.html#id2780069 ).

> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/gpio/aspeed-gpio.h>
> +    vcc_sdhci0: regulator-vcc-sdhci0 {
> +            compatible = "regulator-fixed";
> +
> +            regulator-name = "SDHCI0 Vcc";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 ASPEED_GPIO(V, 0)
> +                            GPIO_ACTIVE_HIGH>;
> +            enable-active-high;
> +    };
> +
> +    vccq_sdhci0: regulator-vccq-sdhci0 {
> +            compatible = "regulator-gpio";
> +
> +            regulator-name = "SDHCI0 VccQ";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 ASPEED_GPIO(V, 1)
> +                            GPIO_ACTIVE_HIGH>;
> +            gpios-states = <1>;
> +            states = <3300000 1
> +                      1800000 0>;
> +    };
> +
> +    vcc_sdhci1: regulator-vcc-sdhci1 {
> +            compatible = "regulator-fixed";
> +
> +            regulator-name = "SDHCI1 Vcc";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 ASPEED_GPIO(V, 2)
> +                            GPIO_ACTIVE_HIGH>;
> +            enable-active-high;
> +    };
> +
> +    vccq_sdhci1: regulator-vccq-sdhci1 {
> +            compatible = "regulator-gpio";
> +
> +            regulator-name = "SDHCI1 VccQ";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            gpios = <&gpio0 ASPEED_GPIO(V, 3)
> +                            GPIO_ACTIVE_HIGH>;
> +            gpios-states = <1>;
> +            states = <3300000 1
> +                      1800000 0>;
> +    };
> +
> +    sdc@1e740000 {
> +            compatible = "aspeed,ast2600-sd-controller";
> +            reg = <0x1e740000 0x100>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges = <0 0x1e740000 0x20000>;
> +            clocks = <&syscon ASPEED_CLK_GATE_SDCLK>;
> +
> +            sdhci0: sdhci@100 {
> +                    compatible = "aspeed,ast2600-sdhci", "sdhci";
> +                    reg = <0x100 0x100>;
> +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    vmmc-supply = <&vcc_sdhci0>;
> +                    vqmmc-supply = <&vccq_sdhci0>;
> +                    sd-uhs-sdr104;
> +                    clk-phase-uhs-sdr104 = <180>, <180>;
> +            };
> +
> +            sdhci1: sdhci@200 {
> +                    compatible = "aspeed,ast2600-sdhci", "sdhci";
> +                    reg = <0x200 0x100>;
> +                    interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                    sdhci,auto-cmd12;
> +                    clocks = <&syscon ASPEED_CLK_SDIO>;
> +                    vmmc-supply = <&vcc_sdhci1>;
> +                    vqmmc-supply = <&vccq_sdhci1>;
> +                    sd-uhs-sdr104;
> +                    clk-phase-uhs-sdr104 = <0>, <0>;
> +            };
> +    };

This is a good example, so can we keep this and just drop the comment 
from the binding document?

Cheers,

Andrew
