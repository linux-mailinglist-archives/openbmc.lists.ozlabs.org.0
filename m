Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE405EBBC8
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 09:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McBRm71q9z3c69
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 17:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KfrPukLh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KfrPukLh;
	dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McBRJ53yYz3blg
	for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 17:42:18 +1000 (AEST)
Received: by mail-wr1-x42b.google.com with SMTP id bq9so13653909wrb.4
        for <openbmc@lists.ozlabs.org>; Tue, 27 Sep 2022 00:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XMqF+iAxuzUKd4CT/5siE5olFsyo8NOd/74bEIvN5GA=;
        b=KfrPukLhVP9JYTOdxWYg4sI2vWu8WLCWtObKTic6LeQfJy46+7WsRLNYjuw3Rqt4/v
         VHvy3H6Jz++igIZIe9iF0hzQjRtCAg2y/VEH2nLscEVJsb9dD/ItI/AQDEBFl45Tu0aL
         mVIjqegRpPfpVdSZ2PS471DGyqwIqB1UO1LkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XMqF+iAxuzUKd4CT/5siE5olFsyo8NOd/74bEIvN5GA=;
        b=1IIEX/D0qDG0PL3ER26TTamAbGJ+fJE7pdlQkq8kRbZVdeRNvrLzTL7KCCw0PZJgis
         Jx7RAU1CjZsRFu+UaxhryCCYRagWrcVUqs2kYdvroAB9KvvDdPTJ0GM5QBZJTbVdy4Mi
         dLhqCo6+3G5UZOXxRsSBp0QSkj0lTO+zR974FOGPdg0TkCUAI8CAB+shuZbPLnBm0p4i
         HUNuPSQMCD68WFhy/IEb6ZqvHtgkTfNHTp1mW7NFBMEP2WBY9s3OBEsWMmw6cORDC+9I
         FHCbO/zTKqe6WUoh3Fr8D7vFUNxhEQKjrxg6VhDyurtNCVypIwqGCkoAQ9iN8hl788Q1
         4pTA==
X-Gm-Message-State: ACrzQf34b40thwkXJQtY/8ntzjT/0NfMQViy9/q6I9UQVv/4seZQYAmT
	XCc/S+WK+pcrtz2ZrouEvLZ8kzBZTVVDRnSVhtk=
X-Google-Smtp-Source: AMsMyM5cDQ9PXjNWPraBB7MkxyBEism1ZeXzwhlHD6MaaFNJLf/5EjDKzjnYFuTmQaVdizuJf5746cCW6iufhZ7TFhA=
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr15651579wrt.549.1664264534174; Tue, 27
 Sep 2022 00:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220913203707.26228-1-Charles.Boyer@fii-usa.com>
In-Reply-To: <20220913203707.26228-1-Charles.Boyer@fii-usa.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Sep 2022 07:42:02 +0000
Message-ID: <CACPK8XeAu6wp_DTsS8QYe38Pt_iSy_VnWmu1kUb-XSW3ztYAcA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] ARM: dts: nuvoton: Add Fii Mori system
To: Charles Boyer <Charles.Boyer@fii-usa.com>
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
Cc: Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Avenash Asai Thambi <avenash.thambi@fii-usa.com>, Vivekanand Veeracholan <vveerach@google.com>, Kyle Nieman <kyle.nieman@fii-usa.com>, Kyle Nieman <kyle.nieman@fii-na.com>, Lancelot Kao <Lancelot.Kao@fii-usa.com>, Ashwin Murali <ashwin.murali@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 13 Sept 2022 at 20:37, Charles Boyer <Charles.Boyer@fii-usa.com> wrote:
>
> Add the device tree for Mori BMC, which is an Ampere server
> platform manufactured by Fii. The device tree is based on Nuvoton
> NPCM730 SoC.

You need to add this to the makefile, or else it won't compile when
building the kernel.

Please send to the upstream lists first, and then we can backport to
the openbmc kernel.

>
> Signed-off-by: Avenash Asai Thambi <avenash.thambi@fii-usa.com>
> Signed-off-by: Ashwin Murali <ashwin.murali@fii-na.com>
> Signed-off-by: Kyle Nieman <kyle.nieman@fii-na.com>
> Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>

This long s-o-b chain doesn't provide much value considering you are
all from the same company. Have these other people reviewed the
change?

> ---
>  arch/arm/boot/dts/nuvoton-npcm730-mori.dts | 1446 ++++++++++++++++++++
>  1 file changed, 1446 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-mori.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-mori.dts b/arch/arm/boot/dts/nuvoton-npcm730-mori.dts
> new file mode 100644
> index 000000000000..c03563995210
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-mori.dts
> @@ -0,0 +1,1446 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Fii USA Inc.
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +    model = "Fii mori Board";
> +    compatible = "fii,mori", "nuvoton,npcm730";
> +
> +    aliases {
> +        ethernet0 = &emc0;
> +        ethernet1 = &gmac0;
> +        serial0 = &serial0;
> +        serial1 = &serial1;
> +        serial2 = &serial2;
> +        serial3 = &serial3;
> +        emmc0 = &sdhci0;
> +        udc5 = &udc5;
> +        vdma = &vdma;
> +        i2c0 = &i2c0;
> +        i2c1 = &i2c1;
> +        i2c2 = &i2c2;
> +        i2c3 = &i2c3;
> +        i2c4 = &i2c4;
> +        i2c5 = &i2c5;
> +        i2c6 = &i2c6;
> +        i2c7 = &i2c7;
> +        i2c8 = &i2c8;
> +        i2c9 = &i2c9;
> +        i2c10 = &i2c10;
> +        i2c11 = &i2c11;
> +        i2c12 = &i2c12;
> +        i2c13 = &i2c13;
> +        i2c14 = &i2c14;
> +        i2c15 = &i2c15;
> +        i2c16 = &i2c16;
> +        i2c17 = &i2c17;
> +        i2c18 = &i2c18;
> +        i2c19 = &i2c19;
> +        i2c20 = &i2c20;
> +        i2c21 = &i2c21;
> +        i2c22 = &i2c22;
> +        i2c23 = &i2c23;
> +        i2c24 = &i2c24;
> +        i2c25 = &i2c25;
> +        i2c26 = &i2c26;
> +        i2c27 = &i2c27;
> +        i2c28 = &i2c28;
> +        i2c29 = &i2c29;
> +        i2c30 = &i2c30;
> +        i2c31 = &i2c31;
> +        i2c32 = &i2c32;
> +        i2c33 = &i2c33;
> +        i2c34 = &i2c34;
> +        i2c35 = &i2c35;
> +        i2c36 = &i2c36;
> +        i2c37 = &i2c37;
> +        i2c38 = &i2c38;
> +        i2c39 = &i2c39;
> +        i2c40 = &i2c40;
> +        i2c41 = &i2c41;
> +        i2c42 = &i2c42;
> +        i2c43 = &i2c43;
> +        i2c44 = &i2c44;
> +        i2c45 = &i2c45;
> +        i2c46 = &i2c46;
> +        i2c47 = &i2c47;
> +        i2c48 = &i2c48;
> +        i2c49 = &i2c49;
> +        i2c50 = &i2c50;
> +        i2c51 = &i2c51;
> +        i2c52 = &i2c52;
> +        i2c53 = &i2c53;
> +        i2c54 = &i2c54;
> +        i2c55 = &i2c55;
> +        i2c56 = &i2c56;
> +        i2c57 = &i2c57;
> +        i2c58 = &i2c58;
> +        i2c59 = &i2c59;
> +        //spi0 = &spi0;
> +        spi1 = &spi1;
> +        fiu0 = &fiu0;
> +        fiu1 = &fiu3;
> +    };
> +
> +    chosen {
> +        stdout-path = &serial0;
> +    };
> +
> +    memory {
> +        reg = <0 0x40000000>;
> +    };
> +
> +    iio-hwmon {
> +        compatible = "iio-hwmon";
> +        io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +            <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +    };
> +
> +    leds {
> +        compatible = "gpio-leds";
> +        BMC_ALIVE {
> +            gpios = <&gpio9 4 0>;
> +        };
> +        boot_status_led {
> +            gpios = <&gpio10 15 0>;
> +        };
> +    };
> +
> +    pinctrl: pinctrl@f0800000 {
> +        gpio0oh_pins: gpio0oh-pins {
> +            pins = "GPIO0/IOX1DI";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio4i_pins: gpio4i-pins {
> +            pins = "GPIO4/IOX2DI/SMB1DSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio5i_pins: gpio5i-pins {
> +            pins = "GPIO5/IOX2LD/SMB1DSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio6oh_pins: gpio6oh-pins {
> +            pins = "GPIO6/IOX2CK/SMB2DSDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio7oh_pins: gpio7oh-pins {
> +            pins = "GPIO7/IOX2D0/SMB2DSCL";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio8i_pins: gpio8i-pins {
> +            pins = "GPIO8/LKGPO1";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio9oh_pins: gpio9oh-pins {
> +            pins = "GPIO9/LKGPO2";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio10oh_pins: gpio10oh-pins {
> +            pins = "GPIO10/IOXHLD";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio13i_pins: gpio13i-pins {
> +            pins = "GPIO13/GSPIDO/SMB5BSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio14i_pins: gpio14i-pins {
> +            pins = "GPIO14/GSPIDI/SMB5CSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio15oh_pins: gpio15oh-pins {
> +            pins = "GPIO15/GSPICS/SMB5CSDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio16ol_pins: gpio16ol-pins {
> +            pins = "GPIO16/LKGPO0";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio17i_pins: gpio17i-pins {
> +            pins = "GPIO17/PSPI2DI/SMB4DEN";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio18i_pins: gpio18i-pins {
> +            pins = "GPIO18/PSPI2D0/SMB4BSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio19i_pins: gpio19i-pins {
> +            pins = "GPIO19/PSPI2CK/SMB4BSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio24i_pins: gpio24i-pins {
> +            pins = "GPIO24/IOXHDO";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio25i_pins: gpio25i-pins {
> +            pins = "GPIO25/IOXHDI";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio32oh_pins: gpio32oh-pins {
> +            pins = "GPIO32/nSPI0CS1";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio37ol_pins: gpio37ol-pins {
> +            pins = "GPIO37/SMB3CSDA";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio38i_pins: gpio38i-pins {
> +              pins = "GPIO38/SMB3CSCL";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio39i_pins: gpio39i-pins {
> +              pins = "GPIO39/SMB3BSDA";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio40i_pins: gpio40i-pins {
> +              pins = "GPIO40/SMB3BSCL";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio45i_pins: gpio45i-pins {
> +            pins = "GPIO45/nDCD1/JTDO2";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio47i_pins: gpio47i-pins {
> +            pins = "GPIO47/nRI1/JCP_RDY2";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio59oh_pins: gpio59oh-pins {
> +            pins = "GPIO59/SMB3DSDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio64i_pins: gpio64i-pins {
> +            pins = "GPIO64/FANIN0";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio65i_pins: gpio65i-pins {
> +            pins = "GPIO65/FANIN1";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio66ol_pins: gpio66ol-pins {
> +            pins = "GPIO66/FANIN2";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio67ol_pins: gpio67ol-pins {
> +            pins = "GPIO67/FANIN3";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio68oh_pins: gpio68oh-pins {
> +            pins = "GPIO68/FANIN4";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio69oh_pins: gpio69oh-pins {
> +              pins = "GPIO69/FANIN5";
> +              bias-disable;
> +              output-high;
> +        };
> +        gpio70ol_pins: gpio70ol-pins {
> +            pins = "GPIO70/FANIN6";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio71i_pins: gpio71i-pins {
> +            pins = "GPIO71/FANIN7";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio72oh_pins: gpio72oh-pins {
> +            pins = "GPIO72/FANIN8";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio73i_pins: gpio73i-pins {
> +            pins = "GPIO73/FANIN9";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio74ol_pins: gpio74ol-pins {
> +            pins = "GPIO74/FANIN10";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio75ol_pins: gpio75ol-pins {
> +            pins = "GPIO75/FANIN11";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio76oh_pins: gpio76oh-pins {
> +            pins = "GPIO76/FANIN12";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio77oh_pins: gpio77oh-pins {
> +            pins = "GPIO77/FANIN13";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio78i_pins: gpio78i-pins {
> +            pins = "GPIO78/FANIN14";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio79i_pins: gpio79i-pins {
> +            pins = "GPIO79/FANIN15";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio80ol_pins: gpio80ol-pins {
> +            pins = "GPIO80/PWM0";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio81oh_pins: gpio81oh-pins {
> +            pins = "GPIO81/PWM1";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio84oh_pins: gpio84oh-pins {
> +            pins = "GPIO84/R2TXD0";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio85oh_pins: gpio85oh-pins {
> +            pins = "GPIO85/R2TXD1";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio86oh_pins: gpio86oh-pins {
> +            pins = "GPIO86/R2TXEN";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio87oh_pins: gpio87oh-pins {
> +            pins = "GPIO87/R2RXD0";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio88oh_pins: gpio88oh-pins {
> +            pins = "GPIO88/R2RXD1";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio89oh_pins: gpio89oh-pins {
> +            pins = "GPIO89/R2CRSDV";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio90oh_pins: gpio90oh-pins {
> +            pins = "GPIO90/R2RXERR";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio91oh_pins: gpio91oh-pins {
> +            pins = "GPIO91/R2MDC";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio92oh_pins: gpio92oh-pins {
> +            pins = "GPIO92/R2MDIO";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio93i_pins: gpio93i-pins {
> +            pins = "GPIO93/GA20/SMB5DSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio94i_pins: gpio94i-pins {
> +            pins = "GPIO94/nKBRST/SMB5DSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio95i_pins: gpio95i-pins {
> +            pins = "GPIO95/nLRESET/nESPIRST";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio120oh_pins: gpio120oh-pins {
> +            pins = "GPIO120/SMB2CSDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio121i_pins: gpio121i-pins {
> +            pins = "GPIO121/SMB2CSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio122i_pins: gpio122i-pins {
> +            pins = "GPIO122/SMB2BSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio123i_pins: gpio123i-pins {
> +            pins = "GPIO123/SMB2BSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio124i_pins: gpio124i-pins {
> +            pins = "GPIO124/SMB1CSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio126oh_pins: gpio126oh-pins {
> +            pins = "GPIO126/SMB1BSDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio136i_pins: gpio136i-pins {
> +              pins = "GPIO136/SD1DT0";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio137oh_pins: gpio137oh-pins {
> +            pins = "GPIO137/SD1DT1";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio138i_pins: gpio138i-pins {
> +              pins = "GPIO138/SD1DT2";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio139i_pins: gpio139i-pins {
> +              pins = "GPIO139/SD1DT3";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio140i_pins: gpio140i-pins {
> +              pins = "GPIO140/SD1CLK";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio141i_pins: gpio141i-pins {
> +              pins = "GPIO141/SD1WP";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio142oh_pins: gpio142oh-pins {
> +            pins = "GPIO142/SD1CMD";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio145oh_pins: gpio145oh-pins {
> +              pins = "GPIO145/PWM5";
> +              bias-disable;
> +              output-high;
> +        };
> +        gpio146i_pins: gpio146i-pins {
> +              pins = "GPIO146/PWM6";
> +              bias-disable;
> +              input-enable;
> +        };
> +        gpio160ol_pins: gpio160ol-pins {
> +            pins = "GPIO160/CLKOUT/RNGOSCOUT";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio162ol_pins: gpio162ol-pins {
> +            pins = "GPIO162/SERIRQ";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio169i_pins: gpio169i-pins {
> +            pins = "GPIO169/nSCIPME";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio175ol_pins: gpio175ol-pins {
> +            pins = "GPIO175/PSPI1CK/FANIN19";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio176o_pins: gpio176o-pins {
> +            pins = "GPIO176/PSPI1DO/FANIN18";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio177_pins: gpio177-pins {
> +            pins = "GPIO177/PSPI1DI/FANIN17";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio190i_pins: gpio190i-pins {
> +            pins = "GPIO190/nPRD_SMI";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio195i_pins: gpio195i-pins {
> +            pins = "GPIO195/SMB0BSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio196ol_pins: gpio196ol-pins {
> +            pins = "GPIO196/SMB0CSCL";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio197i_pins: gpio197i-pins {
> +            pins = "GPIO197/SMB0DEN";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio198oh_pins: gpio198oh-pins {
> +            pins = "GPIO198/SMB0DSDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio199i_pins: gpio199i-pins {
> +            pins = "GPIO199/SMB0DSCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio200oh_pins: gpio200oh-pins {
> +            pins = "GPIO200/R2CK";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio202i_pins: gpio202i-pins {
> +            pins = "GPIO202/SMB0CSDA";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio204i_pins: gpio204i-pins {
> +            pins = "GPIO204/DDC2SCL";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio205oh_pins: gpio205oh-pins {
> +            pins = "GPIO205/DDC2SDA";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio206oh_pins: gpio206oh-pins {
> +            pins = "GPIO206/HSYNC2";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio207ol_pins: gpio207ol-pins {
> +            pins = "GPIO207/VSYNC2";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio212oh_pins: gpio212oh-pins {
> +            pins = "GPIO212/RG2RXD2/DDRV7";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio214i_pins: gpio214i-pins {
> +            pins = "GPIO214/RG2RXC/DDRV9";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio215oh_pins: gpio215oh-pins {
> +            pins = "GPIO215/RG2RXCTL/DDRV10";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio216oh_pins: gpio216oh-pins {
> +            pins = "GPIO216/RG2MDC/DDRV11";
> +            bias-disable;
> +            output-high;
> +        };
> +        gpio217ol_pins: gpio217ol-pins {
> +            pins = "GPIO217/RG2MDIO/DVHSYNC";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio218ol_pins: gpio218ol-pins {
> +            pins = "GPIO218/nWDO1";
> +            bias-disable;
> +            output-low;
> +        };
> +        gpio231i_pins: gpio231i-pins {
> +            pins = "GPIO231/nCLKREQ";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio224i_pins: gpio224i-pins {
> +            pins = "GPIO224/SPIXCK";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio228i_pins: gpio228i-pins {
> +            pins = "GPIO228/nSPIXCS1";
> +            bias-disable;
> +            input-enable;
> +        };
> +        gpio230i_pins: gpio230i-pins {
> +            pins = "GPIO230/SPIXD3";
> +            bias-disable;
> +            input-enable;
> +        };
> +    };
> +
> +    ahb {
> +       udc5: udc@f0835000 {
> +               compatible = "nuvoton,npcm750-udc";
> +               reg = <0xf0835000 0x1000
> +                      0xfffd2800 0x800>;
> +               interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +               status = "okay";
> +               clocks = <&clk NPCM7XX_CLK_SU>;
> +               clock-names = "clk_usb_bridge";
> +       };
> +    };
> +
> +};
> +&gmac0 {
> +    phy-mode = "rgmii-id";
> +    snps,eee-force-disable;
> +    status = "okay";
> +};
> +
> +&emc0 {
> +    phy-mode = "rmii";
> +    status = "okay";
> +    fixed-link {
> +        speed = <100>;
> +        full-duplex;
> +    };
> +};
> +
> +&ehci1 {
> +    status = "okay";
> +};
> +
> +&ohci1 {
> +    status = "okay";
> +};
> +
> +&aes {
> +    status = "okay";
> +};
> +
> +&sha {
> +    status = "okay";
> +};
> +
> +&spi1 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&gpio177_pins &gpio176o_pins
> +            &gpio175ol_pins>;
> +    status = "okay";
> +    jtag_master {
> +        compatible = "nuvoton,npcm750-jtag-master";
> +        spi-max-frequency = <25000000>;
> +        reg = <0>;
> +
> +        pinctrl-names = "pspi", "gpio";
> +        pinctrl-0 = <&pspi1_pins>;
> +        pinctrl-1 = <&gpio177_pins &gpio176o_pins
> +                        &gpio175ol_pins>;
> +
> +        tck-gpios = <&gpio5 15 GPIO_ACTIVE_HIGH>;
> +        tdi-gpios = <&gpio5 16 GPIO_ACTIVE_HIGH>;
> +        tdo-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
> +        tms-gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> +        status = "okay";
> +    };
> +};
> +
> +&fiu0 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&spi0cs1_pins>;
> +    status = "okay";
> +    spi-nor@0 {
> +        compatible = "jedec,spi-nor";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0>;
> +        spi-max-frequency = <5000000>;
> +        spi-rx-bus-width = <2>;
> +        label = "bmc";
> +        partitions@80000000 {
> +            compatible = "fixed-partitions";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            u-boot@0 {
> +                label = "u-boot";
> +                reg = <0x0000000 0xC0000>;
> +                read-only;
> +            };
> +            image-descriptor@f0000 {
> +                label = "image-descriptor";
> +                reg = <0xf0000 0x10000>;
> +            };
> +            hoth-update@100000 {
> +                label = "hoth-update";
> +                reg = <0x100000 0x100000>;
> +            };
> +            kernel@200000 {
> +                label = "kernel";
> +                reg = <0x200000 0x500000>;
> +            };
> +            rofs@700000 {
> +                label = "rofs";
> +                reg = <0x700000 0x35f0000>;
> +            };
> +            rwfs@3cf0000 {
> +                label = "rwfs";
> +                reg = <0x3cf0000 0x300000>;
> +            };
> +            hoth-mailbox@3ff0000 {
> +                label = "hoth-mailbox";
> +                reg = <0x3ff0000 0x10000>;
> +            };
> +        };
> +    };
> +};
> +
> +&fiu3 {
> +    pinctrl-0 = <&spi3_pins>;
> +    status = "okay";
> +
> +    spi-nor@0 {
> +        compatible = "jedec,spi-nor";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        spi-rx-bus-width = <2>;
> +        reg = <0>;
> +        label = "bios";
> +    };
> +};
> +
> +// emmc
> +&sdhci0 {
> +    status = "okay";
> +};
> +// USB
> +&ehci1 {
> +    status = "okay";
> +};
> +
> +&ohci1 {
> +    status = "okay";
> +};
> +
> +&vdma {
> +    status = "okay";
> +};
> +
> +&pcimbox {
> +    status = "okay";
> +};
> +
> +&vcd {
> +    status = "okay";
> +};
> +
> +&ece {
> +    status = "okay";
> +};
> +
> +&watchdog1 {
> +    status = "okay";
> +};
> +
> +&rng {
> +    status = "okay";
> +};
> +
> +&serial0 {
> +    status = "okay";
> +};
> +
> +&serial1 {
> +    status = "okay";
> +};
> +
> +&serial2 {
> +    status = "okay";
> +};
> +
> +&serial3 {
> +    status = "okay";
> +};
> +
> +&adc {
> +    #io-channel-cells = <1>;
> +    status = "okay";
> +};
> +
> +&otp {
> +    status = "okay";
> +};
> +
> +&i2c0 {
> +    status = "okay";
> +};
> +
> +&i2c1 {
> +    status = "okay";
> +    i2c-switch@75 {
> +        compatible = "nxp,pca9548";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x75>;
> +        i2c-mux-idle-disconnect;
> +
> +        i2c16: i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +        };
> +        i2c17: i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +        };
> +        i2c18: i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +        };
> +        i2c19: i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +
> +           cpu@50 {
> +                       compatible = "atmel,24c64";
> +                       reg = <0x50>;
> +           };
> +        };
> +        i2c20: i2c@4 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <4>;
> +        };
> +        i2c21: i2c@5 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <5>;
> +        };
> +        i2c22: i2c@6 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <6>;
> +        };
> +        i2c23: i2c@7 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <7>;
> +        };
> +    };
> +    i2c-switch@77 {
> +        compatible = "nxp,pca9548";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x77>;
> +        i2c-mux-idle-disconnect;
> +
> +        i2c24: i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +        };
> +        i2c25: i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +
> +            adm1272@1f {
> +                    compatible = "adi,adm1272";
> +                    reg = <0x1f>;
> +                    shunt-resistor-micro-ohms = <333>;
> +           };
> +
> +        };
> +        i2c26: i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +        };
> +        i2c27: i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +        };
> +        i2c28: i2c@4 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <4>;
> +        };
> +        i2c29: i2c@5 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <5>;
> +        };
> +        i2c30: i2c@6 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <6>;
> +        };
> +        i2c31: i2c@7 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <7>;
> +        };
> +    };
> +};
> +
> +&i2c2 {
> +    status = "okay";
> +    i2c-switch@77 {
> +        compatible = "nxp,pca9548";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x77>;
> +        i2c-mux-idle-disconnect;
> +
> +        i2c32: i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +        };
> +        i2c33: i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +        };
> +        i2c34: i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +        };
> +        i2c35: i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +
> +            //REAR FAN
> +            max31790@2c {
> +                compatible = "maxim,max31790";
> +                reg = <0x2c>;
> +            };
> +        };
> +        i2c36: i2c@4 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <4>;
> +        };
> +        i2c37: i2c@5 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <5>;
> +
> +            //OUTLET1_T
> +            lm75@5c {
> +                compatible = "ti,lm75";
> +                reg = <0x5c>;
> +            };
> +        };
> +        i2c38: i2c@6 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <6>;
> +
> +            //INLET1_T
> +            lm75@5c {
> +                compatible = "ti,lm75";
> +                reg = <0x5c>;
> +            };
> +        };
> +        i2c39: i2c@7 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <7>;
> +        };
> +    };
> +};
> +
> +&i2c3 {
> +    status = "okay";
> +};
> +
> +&i2c4 {
> +    status = "okay";
> +    mbfru@50 {
> +                compatible = "atmel,24c64";
> +                reg = <0x50>;
> +    };
> +
> +    i2c-switch@77 {
> +        compatible = "nxp,pca9548";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x77>;
> +        i2c-mux-idle-disconnect;
> +
> +        i2c40: i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            //Power Sequencer
> +            adm1266@40 {
> +                    compatible = "adi,adm1266";
> +                    reg = <0x40>;
> +            };
> +        };
> +        i2c41: i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +        };
> +        i2c42: i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +
> +            //SKM EEPROM
> +            skm@55 {
> +                    compatible = "atmel,24c64";
> +                    reg = <0x55>;
> +                    pagesize = <0x20>;
> +            };
> +        };
> +        i2c43: i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +
> +            gpio10: pca6416@20 {
> +                compatible = "nxp,pca6416";
> +                reg = <0x20>;
> +                pinctrl-names = "default";
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-line-names =
> +                    "P12V_PCIE_PE0_ON", "P12V_PCIE_PE1_ON", "P12V_PCIE_PE2_ON", "P12V_PCIE_PE3_ON", "P13V5_NBM_S0_PGD",
> +                    "P12V_EFUSE_ABCD_EN", "P12V_EFUSE_EFGH_EN", "NC_P0_7", "MB_JTAG_MUX_SEL", "JTAG_SCM_MUX_OE_N",
> +                    "FM_BMC_IO_CPLD_PROGRAM_N", "FM_BMC_IO_CPLD_HITLESS_N", "FM_IOEXP_DRAM_P12V_EN", "NC_P1_5",
> +                    "NCSI_CX_PRSNT_N", "SYS_BOOT_STATUS_LED";
> +            };
> +        };
> +        i2c44: i2c@4 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <4>;
> +
> +            gpio12: pca6416@21 {
> +                compatible = "nxp,pca6416";
> +                reg = <0x21>;
> +                pinctrl-names = "default";
> +                gpio-controller;
> +                #gpio-cells = <2>;
> +                gpio-line-names =
> +                    "PE0_ADP_PRSNT_N", "PE1_ADP_PRSNT_N", "PE2_ADP_PRSNT_N", "PE3_ADP_PRSNT_N",
> +                    "SMB_RST_PCIE_PE0_N", "SMB_RST_PCIE_PE1_N", "SMB_RST_PCIE_PE2_N", "SMB_RST_PCIE_PE3_N",
> +                    "PCIE_PE0_PRSNT_N", "PCIE_PE1_PRSNT_N", "PCIE_PE2_PRSNT_N", "PCIE_PE3_PRSNT_N",
> +                    "NC_P1_4", "NC_P1_5", "NC_P1_6", "NC_P1_7";
> +            };
> +        };
> +        i2c45: i2c@5 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <5>;
> +        };
> +        i2c46: i2c@6 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <6>;
> +        };
> +        i2c47: i2c@7 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <7>;
> +
> +            //RTC
> +            rtc@68 {
> +                compatible = "dallas,ds1337";
> +                reg = <0x68>;
> +            };
> +        };
> +    };
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
> +&i2c8 {
> +    status = "okay";
> +};
> +
> +&i2c9 {
> +    status = "okay";
> +};
> +
> +&i2c10 {
> +    status = "okay";
> +};
> +
> +&i2c11 {
> +    status = "okay";
> +};
> +
> +&i2c12 {
> +    status = "okay";
> +};
> +
> +&i2c13 {
> +    status = "okay";
> +};
> +
> +&i2c14 {
> +    status = "okay";
> +    bmcfru@55 {
> +        compatible = "atmel,24c64";
> +        reg = <0x55>;
> +    };
> +    gpio9: pca6416@20 {
> +        compatible = "nxp,pca6416";
> +        reg = <0x20>;
> +        pinctrl-names = "default";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-line-names =
> +            "FM_BMC_CPLD_A_PROGRAM_N", "FM_BMC_CPLD_A_HITLESS_N", "FM_BMC_THROTTLE_N", "SYS_ERROR_LED",
> +            "LED_BMC_ALIVE", "SYS_ATTN_LED", "PU_IO_EXPANDER", "FM_CPU1_DISABLE_COD_N", "S0_UART1_BMC_SEL",
> +            "S0_UART0_BMC_SEL", "CPU_EEPROM_SEL", "I2C4_IO_EXPANDER3_RST", "I2C1_MUX2_RST", "I2C1_MUX1_RST",
> +            "I2C4_MUX4_RST", "BMC_PERST_PE7_N";
> +    };
> +    i2c-switch@77 {
> +        compatible = "nxp,pca9548";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x77>;
> +        i2c-mux-idle-disconnect;
> +
> +        i2c48: i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            max34451@59 {
> +                compatible = "maxim,max34451";
> +                reg = <0x59>;
> +            };
> +        };
> +        i2c49: i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +        };
> +        i2c50: i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +        };
> +        i2c51: i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +        };
> +        i2c52: i2c@4 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <4>;
> +
> +            max31725@5c {
> +                compatible = "maxim,max31725";
> +                reg = <0x5c>;
> +            };
> +        };
> +        i2c53: i2c@5 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <5>;
> +        };
> +        i2c54: i2c@6 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <6>;
> +        };
> +        i2c55: i2c@7 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <7>;
> +        };
> +    };
> +};
> +
> +&i2c15 {
> +    status = "okay";
> +    i2c-switch@75 {
> +        compatible = "nxp,pca9546";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0x75>;
> +        i2c-mux-idle-disconnect;
> +
> +        i2c56: i2c@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +        };
> +        i2c57: i2c@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +        };
> +        i2c58: i2c@2 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <2>;
> +        };
> +        i2c59: i2c@3 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <3>;
> +        };
> +    };
> +};
> +
> +&gpio0  {
> +    gpio-line-names =
> +    /* GPIO0 */
> +    "S0_SYSRESET", "RST_POST_R_N", "BMC_PORT80_CLK_R", "BMC_PORT80_DATA_R", /* 0-3 */
> +    "PWRGD_P12V_HDD0_R1", "SATA0_PRSNT", "RESET_OUT", "POWER_OUT", /* 4-7 */
> +    "host0-ready", "S0_SHD_REQ", "RST_IOEXP_R_N", "IRQ_PSYS_CRIT_PLD_N", /* 8-11 */
> +    "PWRGD_CPU01_LVC3_R", "SYS_PWROK", "PE0_IRQ_N", "RST_BMC_PHY_R_N", /* 12-15 */
> +    "S0_BMC_OK", "HPM_STBY_RDY_R", "S0_PIN_ALERT_N", "SALT4_N", /* 16-19 */
> +    "SMB_BMC_15_R_SDA", "SMB_BMC_15_R_SCL", "SMB_BMC_14_R_SDA", "SMB_BMC_14_R_SCL", /* 20-23 */
> +    "S0_SHD_ACK", "S0_REBOOT_ACK", "SMB_BMC_5_R_SDA", "SMB_BMC_5_R_SCL", /* 24-27 */
> +    "SMB_BMC_4_R_SDA", "SMB_BMC_4_R_SCL", "SMB_BMC_3_R_SDA", "SMB_BMC_3_R_SCL"; /* 28-31 */
> +};
> +&gpio1 {
> +    gpio-line-names =
> +    /* GPIO1 */
> +    "RST_BMC_PCA9546_R_N", "NC_GPIO33", "NC_GPIO34", "NC_GPIO35", /* 0-3 */
> +    "NC_GPIO36", "VBAT_EN", "PE3_IRQ_N", "PE2_IRQ_N", /* 4-7 */
> +    "PE1_IRQ_N", "UART_SYS_DEBUG_RX_R", "UART_BMC_DEBUG_TX_R", "UART0_SCM_RX_R", /* 8-11 */
> +    "JTAG_BMC_CP_DEBUG_TDI", "S0_HIGHTEMP_N", "JTAG_BMC_CP_DEBUG_TCK", "S0_SPI_AUTH_FAILURE_N", /* 12-15 */
> +    "BMC_UART_TXD1_R", "UART1_SCM_RX_R", "BMC_CTS2_N", "BMC_STRAP2", /* 16-19 */
> +    "BMC_DCD2_N", "BMC_STRAP1", "BMC_DSR2_N", "BMC_RI2_N", /* 20-23 */
> +    "NCSI_RX_R_ERR", "IRQ_CPLD_M_BMC_0_R_N", "IRQ_CPLD_M_BMC_1_R_N", "ASSERT_CLR_CMOS_N", /* 24-27 */
> +    "ROT_CPU_RST_AUTH_R2_N", "BMC_STRAP6", "BMC_STRAP5", "BMC_STRAP4"; /* 28-31 */
> +};
> +&gpio2  {
> +    gpio-line-names =
> +    /* GPIO2 */
> +    "POWER_BUTTON", "RESET_BUTTON", "SPI_BMC_BOOT_HOLD_R_N", "SPI_BMC_BOOT_WP_R_N", /* 0-3 */
> +    "FM_HDD0_PWR_EN_R", "SALT12_N", "HPM_STBY_RST_N", "S0_SLP5_N", /* 4-7 */
> +    "SGPIO_RESET_R_N", "S0_VR_HOT", "S0_RTC_LOCK", "BMC_JTAG_MUX_SEL", /* 8-11 */
> +    "I2C4_IO_EXPANDER2_RST", "SALT11_N", "DBP_PRESENT_R2_N", "PWRGD_P12V_FAN_R", /* 12-15 */
> +    "JTAG_MUX_EN", "CPU_DDR_SEL", "FM_BMC_CPU_PWR_DEBUG_R_N", "JTAG_DBP_CPU_PREQ_R_N", /* 16-19 */
> +    "RST_PCA9548_0_N", "RST_PCA9548_1_N", "RST_PCA9548_2_N", "RST_PCA6416_0_N", /* 20-23 */
> +    "RST_PCA9548_N", "RST_PCA6416_1_N", "RST_PCA9548_PLD_N", "RST_USB2517_N", /* 24-27 */
> +    "RST_BMC_USB2514B_R_N", "IRQ_HSC_FAULT_N", "S0_OVERTEMP_N", "RST_BMC_ESPIRST_N"; /* 28-31 */
> +};
> +&gpio3  {
> +    gpio-line-names =
> +    "RGMII_BMC_BCM54612_R_TXD0", "RGMII_BMC_BCM54612_R_TXD1", "RGMII_BMC_BCM54612_R_TXD2", "RGMII_BMC_BCM54612_R_TXD3", /* 0-3 */
> +    "RGMII_BMC_BCM54612_TX_R_CLK", "RGMII_BMC_BCM54612_TX_R_CLKTL", "RGMII_BMC_BCM54612_RXD0", "RGMII_BMC_BCM54612_RXD1", /* 4-7 */
> +    "RGMII_BMC_BCM54612_RXD2", "RGMII_BMC_BCM54612_RXD3", "RGMII_BMC_BCM54612_RX_CLK", "RGMII_BMC_BCM54612_RX_CLKTL", /* 8-11 */
> +    "RGMII_BMC_RG1MDC_R", "RGMII_BMC_RG1MDIO_R", "PWRGD_P12V_PE0", "PWRGD_P12V_PE1", /* 12-15 */
> +    "PWRGD_P12V_PE2", "PWRGD_P12V_PE3", "SMB_BMC_0_R_SCL", "SMB_BMC_0_R_SDA", /* 16-19 */
> +    "SMB_BMC_1_R_SCL", "SMB_BMC_1_R_SDA", "SMB_BMC_2_R_SCL", "SMB_BMC_2_R_SDA", /* 20-23 */
> +    "PCA6416_2_RST", "S0_RC5A01_DDR1346_FAULT_N", "FM_SEQ_BMC_PCIRST_N", "BMC_SEQ_ALERT_N", /* 24-27 */
> +    "RST_RSMRST_BMC_AND_SEQ_N", "FM_BMC_PLD_CRASHLOG_N", "RST_BIOS_EEPROM0_N", "IRQ_SMI_ACTIVE_BMC_N"; /* 28-31 */
> +};
> +&gpio4 {
> +    gpio-line-names =
> +    /* GPIO4 */
> +    "SMB_BMC_8_R_SCL", "SMB_BMC_8_R_SDA", "SMB_BMC_9_R_SCL", "SMB_BMC_9_R_SDA", /* 0-3 */
> +    "SMB_BMC_10_R_SCL", "SMB_BMC_10_R_SDA", "SMB_BMC_11_R_SCL", "SMB_BMC_11_R_SDA", /* 4-7 */
> +    "SALT1_N", "S0_PMIN_N", "PSEQ_FAULT", "S0_PCP_MP_IMON", /* 8-11 */
> +    "P5V_SATA_OC_N", "S0_PMALERT_N", "S0_BMC_READY", "POST_DONE", /* 12-15 */
> +    "JTAG_BMC_PRDY_R_N", "BACKUP_CPU_SEL", "SALT2_N", "FM_BMC_RSMRST_N", /* 16 - 19 */
> +    "BMC_EMMC_DAT4_R", "BMC_EMMC_DAT5_R", "BMC_EMMC_DAT6_R", "BMC_EMMC_DAT7_R", /* 20-23 */
> +    "BMC_EMMC_CLK_R", "BMC_EMMC_WP_R", "BMC_EMMC_CMD_R", "BMC_EMMC_RST_R", /* 24-27 */
> +    "BMC_EMMC_DAT0_R", "BMC_EMMC_DAT1_R", "BMC_EMMC_DAT2_R", "BMC_EMMC_DAT3_R"; /* 28-31 */
> +};
> +&gpio5  {
> +    gpio-line-names =
> +    "CPU_BIOS_RECOVER", "ESPI_BMC_CS0_R_N", "S0_BMC_SPI_NOR_ACCESS", "CLK_50M_ESPI_BMC_R", /* 0-3 */
> +    "ESPI_BMC_DATA_IO0_R", "ESPI_BMC_DATA_IO1_R", "ESPI_BMC_DATA_IO2_R", "ESPI_BMC_DATA_IO3_R", /* 4-7 */
> +    "ESPI_BMC_ALERT_R_N", "S0_SOC_SPI_NOR_ACCESS", "BMC_GPIO170_USER_MODE", "SMB_BMC_6_R_SCL", /* 8-11 */
> +    "SMB_BMC_6_R_SDA", "SMB_BMC_7_R_SCL", "SMB_BMC_7_R_SDA", "JTAG_BMC_TCK_R", /* 12-15 */
> +    "JTAG_BMC_TDI_R", "JTAG_BMC_TDO", "NCSI_CX_R_TXD0", "NCSI_CX_R_TXD1", /* 16-19 */
> +    "NCSI_TX_R_EN", "NCSI_CX_R_RXD0", "NCSI_CX_R_RXD1", "QSPI_BMC_BIOS_CLK_R", /* 20-23 */
> +    "QSPI_BMC_BIOS_IO0_R", "QSPI_BMC_BIOS_IO1_R", "QSPI_BMC_BIOS_CS0_R_N", "FM_BIOS_FLASH_SPI_MUX_R_SEL", /* 24-27 */
> +    "QSPI_BMC_BIOS_IO2_R", "QSPI_BMC_BIOS_IO3_R", "FM_BMC_GPIO190_CPLD_R", "SCM_CHASI_N"; /* 28-31 */
> +};
> +&gpio6  {
> +    gpio-line-names =
> +    /* GPIO6 */
> +    "CPLD_FAULT_IN", "NCSI_CRS_R_DV", "IRQ_NMI_EVENT_N", "S0_PRESENT_N", /* 0-3 */
> +    "S0_GPI2_SPECIAL_BOOT", "FM_BMC_GPIO197_CPLD_R", "REARFAN_FULL_SPEED_N", "S0_SLPS5_N", /* 4-7 */
> +    "MON_BMC_ALIVE", "CLK_50M_BMC_NCSI", "S0_D2D_FAULT_N", "JTAG_BMC_TMS_R", /* 8-11 */
> +    "FAN_FAIL_N", "FM_BMC_FW_RECOVERY", "FM_BMC_FRU_EEPROM_WP_R", "FRU_SKM_EEPROM_WP_R", /* 12-15 */
> +    "PWRGD_P12V_PE4", "PWRGD_P12V_PE5", "PWRGD_P12V_PE6", "PWRGD_P12V_PE7", /* 16-19 */
> +    "I2C_MUX3_RST", "IRQ_CPU0_MEM_VRHOT_R_N", "S0_FAULT_ALERT", "CPU_PEPRSNT_SEL", /* 20-23 */
> +    "CPU_VRD_SEL", "BMC_FAULT_LED", "HOTSWAP", "FM_SPD_DDRCPU_LVLSHFT_EN_R", /* 24-27 */
> +    "SMB_BMC_12_R_SCL", "SMB_BMC_12_R_SDA", "SMB_BMC_CPLD_R_SCL", "SMB_BMC_CPLD_R_SDA"; /* 28-31 */
> +};
> +&gpio7  {
> +    gpio-line-names =
> +    "S0_AVDD_RC5A_FAULT_N", "BMC_STRAP12", "BMC_STRAP13", "RST_PLTRST_BMC_N", /* 0-3 */
> +    "S0_PCP_FAULT_N", "BMC_STRAP3", "S0_SYS_AUTH_FAILURE_N", "FM_SYS_THROTTLE_LVC3_PLD", /* 4-7 */
> +    "NC_GPIO232", "NC_GPIO233", "NC_GPIO234", "NC_GPIO235", /* 8-11 */
> +    "NC_GPIO236", "NC_GPIO237", "NC_GPIO238", "NC_GPIO239", /* 12-15 */
> +    "NC_GPIO240", "NC_GPIO241", "NC_GPIO242", "NC_GPIO243", /* 16-19 */
> +    "NC_GPIO244", "NC_GPIO245", "NC_GPIO246", "NC_GPIO247", /* 20-23 */
> +    "NC_GPIO248", "NC_GPIO249", "NC_GPIO250", "NC_GPIO251", /* 24-27 */
> +    "NC_GPIO252", "NC_GPIO253", "NC_GPIO254", "NC_GPIO255"; /* 28-31 */
> +};
> +
> +&pinctrl {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <
> +        &gpio0oh_pins
> +        &gpio4i_pins
> +        &gpio5i_pins
> +        &gpio6oh_pins
> +        &gpio7oh_pins
> +        &gpio8i_pins
> +        &gpio9oh_pins
> +        &gpio10oh_pins
> +        &gpio13i_pins
> +        &gpio14i_pins
> +        &gpio15oh_pins
> +        &gpio16ol_pins
> +        &gpio17i_pins
> +        &gpio18i_pins
> +        &gpio19i_pins
> +        &gpio24i_pins
> +        &gpio25i_pins
> +        &gpio32oh_pins
> +        &gpio37ol_pins
> +        &gpio38i_pins
> +        &gpio39i_pins
> +        &gpio40i_pins
> +        &gpio45i_pins
> +        &gpio47i_pins
> +        &gpio59oh_pins
> +        &gpio64i_pins
> +        &gpio65i_pins
> +        &gpio66ol_pins
> +        &gpio67ol_pins
> +        &gpio68oh_pins
> +        &gpio69oh_pins
> +        &gpio70ol_pins
> +        &gpio71i_pins
> +        &gpio72oh_pins
> +        &gpio73i_pins
> +        &gpio74ol_pins
> +        &gpio75ol_pins
> +        &gpio76oh_pins
> +        &gpio77oh_pins
> +        &gpio78i_pins
> +        &gpio79i_pins
> +        &gpio80ol_pins
> +        &gpio81oh_pins
> +        &gpio84oh_pins
> +        &gpio85oh_pins
> +        &gpio86oh_pins
> +        &gpio87oh_pins
> +        &gpio88oh_pins
> +        &gpio89oh_pins
> +        &gpio90oh_pins
> +        &gpio91oh_pins
> +        &gpio92oh_pins
> +        &gpio93i_pins
> +        &gpio94i_pins
> +        &gpio95i_pins
> +        &gpio120oh_pins
> +        &gpio121i_pins
> +        &gpio122i_pins
> +        &gpio123i_pins
> +        &gpio124i_pins
> +        &gpio126oh_pins
> +        &gpio136i_pins
> +        &gpio137oh_pins
> +        &gpio138i_pins
> +        &gpio139i_pins
> +        &gpio140i_pins
> +        &gpio141i_pins
> +        &gpio142oh_pins
> +        &gpio145oh_pins
> +        &gpio146i_pins
> +        &gpio160ol_pins
> +        &gpio162ol_pins
> +        &gpio169i_pins
> +        &gpio190i_pins
> +        &gpio195i_pins
> +        &gpio196ol_pins
> +        &gpio197i_pins
> +        &gpio198oh_pins
> +        &gpio199i_pins
> +        &gpio200oh_pins
> +        &gpio202i_pins
> +        &gpio204i_pins
> +        &gpio205oh_pins
> +        &gpio206oh_pins
> +        &gpio207ol_pins
> +        &gpio212oh_pins
> +        &gpio214i_pins
> +        &gpio215oh_pins
> +        &gpio216oh_pins
> +        &gpio217ol_pins
> +        &gpio218ol_pins
> +        &gpio224i_pins
> +        &gpio228i_pins
> +        &gpio230i_pins
> +        &gpio231i_pins
> +
> +        // BSP RX/TX
> +        &bmcuart0a_pins /* BSP RX/TX */
> +        /* BU1 RX/TD */
> +        &bmcuart1_pins /* BU1 RX/TD */
> +        /* TX/RX D2 */
> +        &uart2_pins /* TX/RX D2 */
> +    >;
> +};
> +
> +&gcr {
> +    serial_port_mux: mux-controller {
> +        compatible = "mmio-mux";
> +        #mux-control-cells = <1>;
> +
> +        mux-reg-masks = <0x38 0x07>;
> +        idle-states = <2>;
> +    };
> +};
> --
> 2.17.1
>
