Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D802D335
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 03:18:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DCX353W0zDqQ3
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 11:18:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="vibnm/Vz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gp/Db8Ta"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DCWY4v7lzDqM2
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 11:18:01 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C61722085;
 Tue, 28 May 2019 21:17:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 28 May 2019 21:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Y4gZhBY5RCIDOwrTHgSXi5Zu9S+TUfo
 MtyKBV+GIyiw=; b=vibnm/VzDL6VyMLjvfgrLz19fCKVnDokZFu4kcApwn3h3q/
 QVEiNBXhaQGpImy3QHHgvanlW74QjMIS7TAOw8jIm5CRZ0iuZAgBI4O8H6ll97fq
 MTIvim7ZGDPZ8YhBW7uv2ayNb/8kxpX4m4qYM34DH96WLZXjP0pGmr7fIsa2GUl7
 aFWyjGB7kLzXYFS/l89uxUaJLdIWhTQKNqg29cUwKO3oT2irNBMjn4vpcZ01sF71
 gcaXpSJuJOwFPHkVvjKg0vpGL5Y8P93PCbmITE46Gbto5WDk7qR5/DBB+rFF5imC
 BWLBfiPVZBX0lkXaIuUO9Opof1Hl1e1d2ZhfvHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y4gZhB
 Y5RCIDOwrTHgSXi5Zu9S+TUfoMtyKBV+GIyiw=; b=gp/Db8TattzQ88tKKcMsaq
 xvTEH/NsUB2IO+76+EypW7lMGhpOyOETS/5Zw2GgSfMBBMSDa/xKJCwH6XioU9eE
 T/cQy2e8T3ZnFmO2LkIV7owm63pXxlHV2aSGwL5w8aXYvwntcmh0ao/B/gNxG7pr
 FCaf0XEUxxozLVLciSUEciNCi49jQ/zcxPQOjjr4kPIqNFnKw+/Ab7zFwzCpV0yw
 y9Y1gZ93IggdU8LSDn1tCzHhQjrYeFJnEONMSYKwUPN9FObyTECVkqDhc5Cyc27K
 7q6t7XcMVPbwZwK0ltvp3luCSAIb/8eageKx1Wlw9MPcDCEnrGSd+eY9uxvGLzwQ
 ==
X-ME-Sender: <xms:xt3tXNdy94pQa3GAEw2Eiusuiop5uuxhn8a2ilD3a78NBpJDPxLw7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddviedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:xt3tXNFngffJLu7DXIIDMNZ4P3Fhyt0Chv3Qhh5Ci1RsSYKDTUyL1w>
 <xmx:xt3tXLoraYmYNFsOV60eZ-jaJ5WWO1f3f2b2RncX1xReKKNje5Udcw>
 <xmx:xt3tXHIjWuQAzoCk_MkOCrxo8LUb-o0AQZdjajQEyAOG24UZBLj7yQ>
 <xmx:x93tXCqcl77Gz94MlHMwTLfeQTaXpPO62vEgzNBj3FUL76t6K7gGwg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 47CAEE00A3; Tue, 28 May 2019 21:17:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-555-g49357e1-fmstable-20190528v2
Mime-Version: 1.0
Message-Id: <cbc6dde9-ceb1-4051-a952-0d56767d61d0@www.fastmail.com>
In-Reply-To: <1559025597-56042-1-git-send-email-ray.lue@mic.com.tw>
References: <1559025597-56042-1-git-send-email-ray.lue@mic.com.tw>
Date: Wed, 29 May 2019 10:47:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ray Lue" <ray.lue@gmail.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.1_v1_1/1]_ARM:_dts:_aspeed:_Add_s7106_B?=
 =?UTF-8?Q?MC_Machine?=
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
Cc: Ray Lue <ray.lue@mic.com.tw>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ray,

Thanks for the patch - it looks pretty good overall, but I have a few comments below:

On Tue, 28 May 2019, at 16:11, Ray Lue wrote:
> s7106 is a Tyan platform family with an ASPEED AST2500 BMC
> 
> Signed-off-by: Ray Lue <ray.lue@mic.com.tw>
> ---
>  arch/arm/boot/dts/Makefile                  |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 351 ++++++++++++++++++++++++++++
>  2 files changed, 353 insertions(+), 1 deletion(-)
>  create mode 100755 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 1276167..72115e0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1262,4 +1262,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-opp-witherspoon.dtb \
>  	aspeed-bmc-opp-zaius.dtb \
>  	aspeed-bmc-portwell-neptune.dtb \
> -	aspeed-bmc-quanta-q71l.dtb
> +	aspeed-bmc-quanta-q71l.dtb \
> +	aspeed-bmc-tyan-s7106.dtb
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts 
> b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> new file mode 100755
> index 0000000..9f549c6
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -0,0 +1,351 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Device Tree file for Tyan S7106 platform
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +    model = "Tyan S7106 BMC";
> +    compatible = "tyan,s7106-bmc", "aspeed,ast2500";
> +
> +    chosen {
> +        stdout-path = &uart5;
> +        bootargs = "earlyprintk";
> +    };
> +  
> +    memory {
> +        reg = <0x80000000 0x20000000>;
> +    };
> +
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        flash_memory: region@98000000 {
> +            no-map;
> +            reg = <0x98000000 0x04000000>; /* 64M */
> +        };

I expect you don't need the functionality this provides. There are some patches
that make the reserved memory property optional for the aspeed-lpc-ctrl node,
but they're not yet upstream.

I'll try to fix that, but in the mean time you could significantly reduce the
amount of memory you're setting aside here.

> +
> +        vga_memory: framebuffer@7f000000 {
> +            no-map;
> +            reg = <0x7f000000 0x01000000>;
> +        };
> +        
> +        safs_memory: region@30000000 {
> +            no-map;
> +            reg = <0x30000000 0x08000000>; /* 128M */
> +        };
> +
> +        gfx_memory: framebuffer {
> +            size = <0x04000000>;
> +            alignment = <0x01000000>;
> +            compatible = "shared-dma-pool";
> +            reusable;
> +        };
> +    };
> +    
> +    vga-shared-memory {
> +        compatible = "aspeed,ast2500-vga-sharedmem";
> +        reg = <0x9ff00000 0x100000>;
> +    };
> +    
> +    leds {
> +        compatible = "gpio-leds";
> +        
> +        power {
> +            gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +        };
> +
> +        identify {
> +            gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +        };
> +
> +            heartbeat {
> +            gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +      
> +    gpio-keys {
> +        compatible = "gpio-keys";
> +
> +        caterr {
> +            label = "caterr";
> +            gpios = <&gpio ASPEED_GPIO(AB, 0) GPIO_ACTIVE_LOW>;
> +            linux,code = <ASPEED_GPIO(AB, 0)>;
> +        };
> +        
> +        id-button {
> +            label = "id-button";
> +            gpios = <&gpio ASPEED_GPIO(C, 4) GPIO_ACTIVE_LOW>;
> +            linux,code = <ASPEED_GPIO(C, 4)>;
> +        };
> +    };    
> +
> +    iio-hwmon {
> +        compatible = "iio-hwmon";
> +        io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +            <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +            <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +            <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +    };
> +};
> +
> +&fmc {
> +    status = "okay";
> +    flash@0 {
> +        label = "bmc";
> +        status = "okay";
> +        m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
> +    };
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_spi1_default>;
> +
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "pnor";
> +	};
> +};
> +
> +// UART1 is used only by the host. While the BMC does not need to 
> access it,
> +// enable it here to make sure the UART's clock gets enabled.
> +&uart1 {
> +    status = "okay";
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_txd1_default
> +            &pinctrl_rxd1_default
> +            &pinctrl_ncts1_default
> +            &pinctrl_ndcd1_default
> +            &pinctrl_ndsr1_default
> +            &pinctrl_nri1_default
> +            &pinctrl_ndtr1_default
> +            &pinctrl_nrts1_default>;
> +};
> +
> +// Host UART2
> +&uart2 {
> +    status = "okay";
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_txd2_default
> +            &pinctrl_rxd2_default
> +            &pinctrl_ncts2_default
> +            &pinctrl_ndcd2_default
> +            &pinctrl_ndsr2_default
> +            &pinctrl_nri2_default
> +            &pinctrl_ndtr2_default
> +            &pinctrl_nrts2_default>;
> +};
> +
> +// SOL,route to UART1 or UART2
> +&uart3 {
> +    status = "okay";
> +};
> +
> +&uart5 {
> +    status = "okay";
> +};
> +
> +&mac0 {
> +    status = "okay";
> +    
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_rmii1_default>;
> +    use-ncsi;
> +};
> +
> +&mac1 {
> +    status = "okay";
> +
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +    status = "okay";
> +    // NCT7802 Hardware Monitor @50h
> +    nct7802@28 {
> +        compatible = "nuvoton,nct7802";
> +        reg = <0x28>;
> +    };
> +};
> +
> +// IPMB, dedicated for AST2500 <-> Intel PCH ME 
> +&i2c1 {
> +    multi-master =<1>;

The documentation implies that this is a simple boolean property. I don't think
you have to assign it the value '1', the property just needs to be present (e.g. see
'use-ncsi' in &mac0 above).

> +    status = "okay";
> +    spsfw1@10 {
> +        compatible = "slave-mqueue";

This compatible isn't documented anywhere. Do you have a bindings document
for it? We'll need that before we can merge the devicetree.

> +        reg = <0x10>;
> +        message-size = <256>;
> +        queue-size = <32>;
> +    };
> +};
> +
> +&i2c2 {
> +    status = "okay";
> +    // FRU 24C256 @50h 
> +    eeprom@50 {
> +        compatible = "atmel,24c256";
> +        reg = <0x50>;
> +        pagesize = <32>;
> +    };
> +};
> +
> +&i2c3 {
> +    status = "okay";
> +    power-supply@58 {
> +        compatible = "ibm,cffps1";

Is this a copy/paste error?

> +        reg = <0x58>;
> +    };
> +};
> +
> +&i2c4 {
> +    status = "okay";
> +};
> +
> +&i2c5 {
> +    status = "okay";
> +};
> +
> +&i2c6 {
> +    status = "okay";
> +};
> +
> +&i2c7 {
> +    status = "okay";
> +};
> +
> +&gfx {
> +    status = "okay";
> +    memory-region = <&gfx_memory>;
> +};
> +
> +&video {
> +    status = "okay";
> +    memory-region = <&gfx_memory>;
> +};
> +
> +&vhub {
> +    status = "okay";
> +};
> +
> +&pwm_tacho {
> +    status = "okay";
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_pwm0_default
> +        &pinctrl_pwm1_default
> +        &pinctrl_pwm2_default
> +        &pinctrl_pwm3_default
> +        &pinctrl_pwm4_default
> +        &pinctrl_pwm5_default>;

Need to mux pwm6 as well according to rearfan@2 below.

> +
> +    cpufan@0 {
> +        reg = <0x00>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +    };
> +
> +    cpufan@1 {
> +        reg = <0x01>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +    };
> +    
> +    frontfan@1 {
> +        reg = <0x02>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +    };
> +    
> +    frontfan@2 {
> +        reg = <0x03>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +    };
> +
> +    frontfan@3 {
> +        reg = <0x04>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +    };
> +
> +    rearfan@1 {
> +        reg = <0x04>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +    };
> +
> +    rearfan@2 {
> +        reg = <0x04>;
> +        aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +    };
> +};
> +
> +&lpc_ctrl {
> +    status = "okay";
> +    memory-region = <&flash_memory>;
> +    flash = <&spi1>;
> +};
> +
> +&lpc_snoop {
> +    status = "okay";
> +    snoop-ports = <0x80>;
> +};
> +
> +&adc {
> +    status = "okay";
> +
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&pinctrl_adc0_default
> +            &pinctrl_adc1_default
> +            &pinctrl_adc2_default
> +            &pinctrl_adc3_default
> +            &pinctrl_adc4_default
> +            &pinctrl_adc5_default
> +            &pinctrl_adc6_default
> +            &pinctrl_adc7_default
> +            &pinctrl_adc8_default
> +            &pinctrl_adc9_default
> +            &pinctrl_adc10_default
> +            &pinctrl_adc12_default
> +            &pinctrl_adc13_default
> +            &pinctrl_adc14_default>;
> +};
> +
> +&lpc_bmc {
> +    compatible = "aspeed,ast2500-lpc-bmc", "simple-mfd", "syscon";

>  
> +    reg = <0x0 0x80>;
> +    reg-io-width = <4>;
> +    #address-cells = <1>;
> +    #size-cells = <1>;
> +    ranges = <0x0 0x0 0x80>;

You don't need to specify the compatible line or any of the above properties,
this is done in the node that you're referencing.

Once you've addressed these issues it would be good to send the patch
upstream as well.

Cheers,

Andrew

> +
> +    kcs1@0 {
> +        compatible = "aspeed,ast2500-kcs-bmc";
> +        reg = <0x0 0x80>;
> +        interrupts = <8>;
> +        kcs_chan = <1>;
> +        kcs_addr = <0xca0>;
> +        status = "okay";
> +    };
> +
> +    kcs2@0 {
> +        compatible = "aspeed,ast2500-kcs-bmc";
> +        reg = <0x0 0x80>;
> +        interrupts = <8>;
> +        kcs_chan = <2>;
> +        kcs_addr = <0xca8>;
> +        status = "okay";
> +    };
> +
> +    kcs3@0 {
> +        compatible = "aspeed,ast2500-kcs-bmc";
> +        reg = <0x0 0x80>;
> +        interrupts = <8>;
> +        kcs_chan = <3>;
> +        kcs_addr = <0xca2>;
> +        status = "okay";
> +    };  
> +};
> +
> -- 
> 2.7.4
> 
>
