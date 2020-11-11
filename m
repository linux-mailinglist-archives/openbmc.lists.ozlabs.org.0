Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AEE2AF94C
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 20:51:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWb2j03vNzDqvv
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 06:51:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=vveerach@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=I3QGroDQ; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWb1X1qZ6zDqsy
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 06:50:15 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id c16so3436731wmd.2
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLvQtN2WowDB42axf5E4kcY1rk01u7qOGZjbTk8osC0=;
 b=I3QGroDQLWmSTcR+iay7/n1+yOgLZyiRj7iXVf0bc7sgR3Y9I+7VWetrx/73tlLqFa
 mZl6nycjtbxomYMxBsnFRcJCzmLPjRTY6DB+uwYmpwUYYy1rYgquFFbPufsbCp0u89l8
 mKCfu0rLUfxHTUMoCpDZd6jprD8vk/YbQNJIPRUHPJH6HGhzoKPqPu9col01TLKDh1Nn
 RBAgkrt/C1UxxSKG3v3+8ec0LPTT7GPzc0iGPzTQqFqRaPyJhzTIGu3g28Uy6x45/SCm
 /7jF0i4OURoKlQDSXmUa7tH0BFuRgPhaTJ7F4JIEQZRH/jF/3IkVgyGfNlbHlqVuSOkZ
 4BYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLvQtN2WowDB42axf5E4kcY1rk01u7qOGZjbTk8osC0=;
 b=jVELj4B9uK+36w+a1q+ZVwi8tZYxmT3062bSRYeZWBtmVTlT9PUOqKna59XqCxUTfW
 5nlTiylAX7HrFkOrnVOkvTo9w2toXjSjeQH2co+qr2uV9hrJJtY4sEg5qZOSbR/CNAXx
 w2oqriiDuxZubHwvY2s/vTSmMCmnZhQVNkExjdwx5LfPD19CGhV1QDpOL5N5oukXpmfq
 x01KxR3qQp8JioZZaCzD4Z6xCzisDq4E9dpj4GZJzGMuX7bsCq8DXbTIIwrjltuShMID
 +zBmsbxMmy9LYv0QSmzfW2i+7e1Io+koX/mqMo/9/riZ/JEBncOR+B9hmSB0LpS4UGVx
 SzDQ==
X-Gm-Message-State: AOAM5334BHW2tl1IyxYPN41qYrzdLLr1L14a0QLONOIk+jYu0dE2ayXh
 LN65RYPAJSQjdfF+SUGYmSHCgjAoh1r5joGzGDJQNA==
X-Google-Smtp-Source: ABdhPJyMjkFp4tP79i9Ur1SGHkmki7xVr3iC9X1JaS7ECTR/LgRG1il2Pa06M2UmNLGVYeHclRXvir4zZCYi42PZ+RQ=
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr5975506wmj.126.1605124211220; 
 Wed, 11 Nov 2020 11:50:11 -0800 (PST)
MIME-Version: 1.0
References: <20201110220550.31965-1-lancelot.kao@fii-usa.com>
In-Reply-To: <20201110220550.31965-1-lancelot.kao@fii-usa.com>
From: Vivekanand Veeracholan <vveerach@google.com>
Date: Wed, 11 Nov 2020 11:49:59 -0800
Message-ID: <CAL4K88pfMZH+Y2tvJQ7VEPqCe=j49ZOE-L2SMkmXibFYWrVpxQ@mail.gmail.com>
Subject: Re: [PATCH v2 linux dev-5.8] Fii Kudo project device tree file
To: Lancelot Kao <lancelot.kao@fii-usa.com>
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
Cc: openbmc@lists.ozlabs.org, Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 10, 2020 at 2:06 PM Lancelot Kao <lancelot.kao@fii-usa.com> wrote:
>
> 1. Add Fii kudo project device tree dts and dtsi
> files to the upstream.
> 2. Remove the duplicate the full path and address
> of node.
> 3. modified syntax
>
> Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
> Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>
> ---
>  .../boot/dts/nuvoton-npcm730-kudo-gpio.dtsi   | 288 ++++++++
>  arch/arm/boot/dts/nuvoton-npcm730-kudo.dts    | 631 ++++++++++++++++++
>  2 files changed, 919 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
> new file mode 100644
> index 000000000000..0dc888dac73b
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo-gpio.dtsi
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Fii USA Inc. Brandon Ong <Brandon.Ong@fii-na.com>
> +
> +
> +/ {
> +       pinctrl: pinctrl@f0800000 {
> +               gpio61oh_pins: gpio61oh-pins {
> +                       pins = "GPO61/nDTR1_BOUT1/STRAP6";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio62oh_pins: gpio62oh-pins {
> +                       pins = "GPO62/nRTST1/STRAP5";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio161ol_pins: gpio161ol-pins {
> +                       pins = "GPIO161/nLFRAME/nESPICS";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio163i_pins: gpio163i-pins {
> +                       pins = "GPIO163/LCLK/ESPICLK";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio167ol_pins: gpio167ol-pins {
> +                       pins = "GPIO167/LAD3/ESPI_IO3";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio95i_pins: gpio95i-pins {
> +                       pins = "GPIO95/nLRESET/nESPIRST";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio65ol_pins: gpio65ol-pins {
> +                       pins = "GPIO65/FANIN1";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio66oh_pins: gpio66oh-pins {
> +                       pins = "GPIO66/FANIN2";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio67oh_pins: gpio67oh-pins {
> +                       pins = "GPIO67/FANIN3";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio68ol_pins: gpio68ol-pins {
> +                       pins = "GPIO68/FANIN4";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio69i_pins: gpio69i-pins {
> +                       pins = "GPIO69/FANIN5";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio70ol_pins: gpio70ol-pins {
> +                       pins = "GPIO70/FANIN6";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio71i_pins: gpio71i-pins {
> +                       pins = "GPIO71/FANIN7";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio72i_pins: gpio72i-pins {
> +                       pins = "GPIO72/FANIN8";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio73i_pins: gpio73i-pins {
> +                       pins = "GPIO73/FANIN9";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio74i_pins: gpio74i-pins {
> +                       pins = "GPIO74/FANIN10";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio75i_pins: gpio75i-pins {
> +                       pins = "GPIO75/FANIN11";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio76i_pins: gpio76i-pins {
> +                       pins = "GPIO76/FANIN12";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio77i_pins: gpio77i-pins {
> +                       pins = "GPIO77/FANIN13";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio78i_pins: gpio78i-pins {
> +                       pins = "GPIO78/FANIN14";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio79ol_pins: gpio79ol-pins {
> +                       pins = "GPIO79/FANIN15";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio80oh_pins: gpio80oh-pins {
> +                       pins = "GPIO80/PWM0";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio81i_pins: gpio81i-pins {
> +                       pins = "GPIO81/PWM1";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio82i_pins: gpio82i-pins {
> +                       pins = "GPIO82/PWM2";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio83i_pins: gpio83i-pins {
> +                       pins = "GPIO83/PWM3";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio144i_pins: gpio144i-pins {
> +                       pins = "GPIO144/PWM4";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio145i_pins: gpio145i-pins {
> +                       pins = "GPIO145/PWM5";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio146i_pins: gpio146i-pins {
> +                       pins = "GPIO146/PWM6";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio147oh_pins: gpio147oh-pins {
> +                       pins = "GPIO147/PWM7";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio168ol_pins: gpio168ol-pins {
> +                       pins = "GPIO168/nCLKRUN/nESPIALERT";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio169oh_pins: gpio169oh-pins {
> +                       pins = "GPIO169/nSCIPME";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio170ol_pins: gpio170ol-pins {
> +                       pins = "GPIO170/nSMI";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio218oh_pins: gpio218oh-pins {
> +                       pins = "GPIO218/nWDO1";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio37i_pins: gpio37i-pins {
> +                       pins = "GPIO37/SMB3CSDA";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio38i_pins: gpio38i-pins {
> +                       pins = "GPIO38/SMB3CSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio39i_pins: gpio39i-pins {
> +                       pins = "GPIO39/SMB3BSDA";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio40i_pins: gpio40i-pins {
> +                       pins = "GPIO40/SMB3BSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio121i_pins: gpio121i-pins {
> +                       pins = "GPIO121/SMB2CSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio122i_pins: gpio122i-pins {
> +                       pins = "GPIO122/SMB2BSDA";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio123i_pins: gpio123i-pins {
> +                       pins = "GPIO123/SMB2BSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio124i_pins: gpio124i-pins {
> +                       pins = "GPIO124/SMB1CSDA";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio125i_pins: gpio125i-pins {
> +                       pins = "GPIO125/SMB1CSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio126i_pins: gpio126i-pins {
> +                       pins = "GPIO126/SMB1BSDA";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio127i_pins: gpio127i-pins {
> +                       pins = "GPIO127/SMB1BSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio136i_pins: gpio136i-pins {
> +                       pins = "GPIO136/SD1DT0";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio137oh_pins: gpio137oh-pins {
> +                       pins = "GPIO137/SD1DT1";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio138i_pins: gpio138i-pins {
> +                       pins = "GPIO138/SD1DT2";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio139i_pins: gpio139i-pins {
> +                       pins = "GPIO139/SD1DT3";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio140i_pins: gpio140i-pins {
> +                       pins = "GPIO140/SD1CLK";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio141i_pins: gpio141i-pins {
> +                       pins = "GPIO141/SD1WP";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio190oh_pins: gpio190oh-pins {
> +                       pins = "GPIO190/nPRD_SMI";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio191oh_pins: gpio191oh-pins {
> +                       pins = "GPIO191";
> +                       bias-disable;
> +                       output-high;
> +               };
> +               gpio195ol_pins: gpio195ol-pins {
> +                       pins = "GPIO195/SMB0BSDA";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio196ol_pins: gpio196ol-pins {
> +                       pins = "GPIO196/SMB0CSCL";
> +                       bias-disable;
> +                       output-low;
> +               };
> +               gpio199i_pins: gpio199i-pins {
> +                       pins = "GPIO199/SMB0DSCL";
> +                       bias-disable;
> +                       input-enable;
> +               };
> +               gpio202ol_pins: gpio202ol-pins {
> +                       pins = "GPIO202/SMB0CSDA";
> +                       bias-disable;
> +                       output-low;
> +               };
> +       };
> +};
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> new file mode 100644
> index 000000000000..ab5cf1aea220
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-kudo.dts
> @@ -0,0 +1,631 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Fii USA Inc. Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include "nuvoton-npcm730-kudo-gpio.dtsi"
> +
> +/ {
> +       model = "Fii Kudo Board (Device Tree v00.01)";
> +       compatible = "nuvoton,npcm730";
> +
> +       aliases {
> +               ethernet0 = &emc0;
> +               ethernet1 = &gmac0;
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
> +               udc9 = &udc9;
> +               emmc0 = &sdhci0;
> +               vdma = &vdma;
> +               i2c0 = &i2c0;
> +               i2c1 = &i2c1;
> +               i2c2 = &i2c2;
> +               i2c3 = &i2c3;
> +               i2c4 = &i2c4;
> +               i2c5 = &i2c5;
> +               i2c6 = &i2c6;
> +               i2c7 = &i2c7;
> +               i2c8 = &i2c8;
> +               i2c9 = &i2c9;
> +               i2c10 = &i2c10;
> +               i2c11 = &i2c11;
> +               i2c12 = &i2c12;
> +               i2c13 = &i2c13;
> +               spi0 = &spi0;
> +               spi1 = &spi1;
> +               fiu0 = &fiu0;
> +               fiu1 = &fiu3;
> +       };
> +
> +       chosen {
> +               stdout-path = &serial3;
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
> +       };
> +
> +       jtag_master {
> +               compatible = "nuvoton,npcm750-jtag-master";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               dev-num = <0>; /* /dev/jtag0 */
> +               mode = "pspi"; /* pspi or gpio */
> +
> +               pspi-controller = <2>; /* pspi2 */
> +               reg = <0xf0201000 0x1000>;
> +               interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&clk NPCM7XX_CLK_APB5>;
> +
> +               jtag-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>, /* TCK */
> +                               <&gpio0 18 GPIO_ACTIVE_HIGH>, /* TDI */
> +                               <&gpio0 17 GPIO_ACTIVE_HIGH>, /* TDO */
> +                               <&gpio0 16 GPIO_ACTIVE_HIGH>; /* TMS */
> +               status = "okay";
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +               heartbeat {
> +                       label = "heartbeat";
> +                       gpios = <&gpio0 14 1>;
> +               };
> +       };
> +};
> +
> +&gmac0 {
> +       phy-mode = "rgmii-id";
> +       snps,eee-force-disable;
> +       status = "okay";
> +};
> +
> +&emc0 {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&ohci1 {
> +       status = "okay";
> +};
> +
> +&udc9 {
> +       status = "okay";
> +};
> +
> +&aes {
> +       status = "okay";
> +};
> +
> +&sha {
> +       status = "okay";
> +};
> +
> +&fiu0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&spi0cs1_pins>;
> +       status = "okay";
> +       spi-nor@0 {
> +               compatible = "jedec,spi-nor";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0>;
> +               spi-max-frequency = <5000000>;
> +               spi-rx-bus-width = <2>;
> +               partitions@80000000 {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       bmc@0{
> +                               label = "bmc";
> +                               reg = <0x000000 0x2000000>;
> +                       };
> +                       u-boot@0 {
> +                               label = "u-boot";
> +                               reg = <0x0000000 0xf0000>;
> +                       };
> +                       image-descriptor@f0000 {
> +                               label = "image-descriptor";
> +                               reg = <0xf0000 0x10000>;
> +                       };
> +                       reserved-update@100000 {
> +                               label = "reserved-update";
> +                               reg = <0x100000 0x100000>;
> +                       };
> +                       kernel@200000 {
> +                               label = "kernel";
> +                               reg = <0x200000 0x500000>;
> +                       };
> +                       rofs@700000 {
> +                               label = "rofs";
> +                               reg = <0x700000 0x35f0000>;
> +                       };
> +                       rwfs@3cf0000 {
> +                               label = "rwfs";
> +                               reg = <0x3cf0000 0x300000>;
> +                       };
> +                       reserved-mailbox@3ff0000 {
> +                               label = "reserved-mailbox";
> +                               reg = <0x3ff0000 0x10000>;
> +                       };
> +               };
> +       };
> +       spi-nor@1 {
> +               compatible = "jedec,spi-nor";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <1>;
> +               spi-max-frequency = <5000000>;
> +               spi-rx-bus-width = <2>;
> +               partitions@88000000 {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       spare1@0 {
> +                               label = "spi0-cs1-spare1";
> +                               reg = <0x0 0x800000>;
> +                       };
> +                       spare2@800000 {
> +                               label = "spi0-cs1-spare2";
> +                               reg = <0x800000 0x0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&fiu3 {
> +       pinctrl-0 = <&spi3_pins>;
> +       status = "okay";
> +       spi-nor@0 {
> +               compatible = "jedec,spi-nor";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               reg = <0>;
> +               spi-max-frequency = <5000000>;
> +               spi-rx-bus-width = <2>;
> +               partitions@A0000000 {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       system1@0 {
> +                               label = "bios";
> +                               reg = <0x0 0x0>;
> +                       };
> +                       system2@800000 {
> +                               label = "spi3-system2";
> +                               reg = <0x800000 0x0>;
> +                       };
> +               };
> +       };
> +};
> +
> +&sdhci0 {
> +       status = "okay";
> +};
> +
> +&vdma {
> +       status = "okay";
> +};
> +
> +&pcimbox {
> +       status = "okay";
> +};
> +
> +&vcd {
> +       status = "okay";
> +};
> +
> +&ece {
> +       status = "okay";
> +};
> +
> +&watchdog1 {
> +       status = "okay";
> +};
> +
> +&rng {
> +       status = "okay";
> +};
> +
> +&serial0 {
> +       status = "okay";
> +};
> +
> +&serial1 {
> +       status = "okay";
> +};
> +
> +&serial2 {
> +       status = "okay";
> +};
> +
> +&serial3 {
> +       status = "okay";
> +};
> +
> +&adc {
> +       #io-channel-cells = <1>;
> +       status = "okay";
> +};
> +
> +&otp {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "disabled";
> +};
> +
> +&i2c1 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       i2c-switch@75 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x75>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       max31790@58 { // Fan
> +                               compatible = "maxim,max31790";
> +                               reg = <0x58>;
> +                       };
> +               };
> +
> +               i2c@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       max31790@58 { // Fan
> +                               compatible = "maxim,max31790";
> +                               reg = <0x58>;
> +                       };
> +               };
> +
> +               i2c-bus@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       lm75@5c { // INLET1_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +
> +               i2c-bus@5 { // OUTLET1_T
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       lm75@5c {
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +
> +               i2c-bus@6 { // OUTLET2_T
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +
> +                       lm75@5c {
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +
> +               i2c-bus@7 { // OUTLET3_T
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <7>;
> +
> +                       lm75@5c {
> +                               compatible = "ti,lm75";
> +                               reg = <0x5c>;
> +                       };
> +               };
> +       };
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c-bus@2 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <2>;
> +
> +                       pmbus@74 { // STB-T
> +                               compatible = "pmbus";
> +                               reg = <0x74>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       smpro@4f {
> +               compatible = "ampere,smpro";
> +               reg = <0x4f>;
> +       };
> +
> +       smpro@4e {
> +               compatible = "ampere,smpro";
> +               reg = <0x4e>;
> +       };
> +};
> +
> +&i2c3 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;

> +
> +               i2c-bus@0 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0>;
> +
> +                       adm1266@40 { // ADC sensors
> +                               compatible = "adi,adm1266";
> +                               reg = <0x40>;
> +                       };
> +               };
> +
> +               i2c-bus@1 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <1>;
> +
> +                       adm1266@41 { // ADC sensors
> +                               compatible = "adi,adm1266";
> +                               reg = <0x41>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c5 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c8 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       #address-cells = <1>;
> +       #address-cells = <1>;
Duplicate. 2 address-cells entry.

> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       #address-cells = <1>;
> +       #address-cells = <1>;
Duplicate. 2 address-cells entry.

> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       ssif-bmc@10 {
> +               compatible = "ssif-bmc";
> +               reg = <0x10>;
> +               status = "okay";
> +       };
> +};
> +
> +&i2c13 {
> +       #address-cells = <1>;
> +       #address-cells = <1>;
Duplicate. 2 address-cells entry.

> +       #size-cells = <0>;
> +       bus-frequency = <100000>;
> +       status = "okay";
> +
> +       i2c-switch@77 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x77>;
> +               i2c-mux-idle-disconnect;
> +
> +               i2c-bus@3 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <3>;
> +
> +                       lm75@28 { // M2_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x28>;
> +                       };
> +               };
> +
> +               i2c-bus@4 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <4>;
> +
> +                       lm75@29 { // BATT_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x29>;
> +                       };
> +               };
> +
> +               i2c-bus@5 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <5>;
> +
> +                       lm75@28 { // NBM1_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x28>;
> +                       };
> +               };
> +               i2c-bus@6 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <6>;
> +
> +                       lm75@29 { // NBM2_ZONE_T
> +                               compatible = "ti,lm75";
> +                               reg = <0x29>;
> +                       };
> +               };
> +       };
> +};
> +
> +&spi0 {
> +       cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> +       status = "okay";
> +};
> +
> +&pinctrl {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <
> +                       &gpio61oh_pins
> +                       &gpio62oh_pins
> +                       &gpio161ol_pins
> +                       &gpio163i_pins
> +                       &gpio167ol_pins
> +                       &gpio95i_pins
> +                       &gpio65ol_pins
> +                       &gpio66oh_pins
> +                       &gpio67oh_pins
> +                       &gpio68ol_pins
> +                       &gpio69i_pins
> +                       &gpio70ol_pins
> +                       &gpio71i_pins
> +                       &gpio72i_pins
> +                       &gpio73i_pins
> +                       &gpio74i_pins
> +                       &gpio75i_pins
> +                       &gpio76i_pins
> +                       &gpio77i_pins
> +                       &gpio78i_pins
> +                       &gpio79ol_pins
> +                       &gpio80oh_pins
> +                       &gpio81i_pins
> +                       &gpio82i_pins
> +                       &gpio83i_pins
> +                       &gpio144i_pins
> +                       &gpio145i_pins
> +                       &gpio146i_pins
> +                       &gpio147oh_pins
> +                       &gpio168ol_pins
> +                       &gpio169oh_pins
> +                       &gpio170ol_pins
> +                       &gpio218oh_pins
> +                       &gpio37i_pins
> +                       &gpio38i_pins
> +                       &gpio39i_pins
> +                       &gpio40i_pins
> +                       &gpio121i_pins
> +                       &gpio122i_pins
> +                       &gpio123i_pins
> +                       &gpio124i_pins
> +                       &gpio125i_pins
> +                       &gpio126i_pins
> +                       &gpio127i_pins
> +                       &gpio136i_pins
> +                       &gpio137oh_pins
> +                       &gpio138i_pins
> +                       &gpio139i_pins
> +                       &gpio140i_pins
> +                       &gpio141i_pins
> +                       &gpio190oh_pins
> +                       &gpio191oh_pins
> +                       &gpio195ol_pins
> +                       &gpio196ol_pins
> +                       &gpio199i_pins
> +                       &gpio202ol_pins
> +                       >;
> +};
> +
> +&gcr {
> +       serial_port_mux: mux-controller {
> +               compatible = "mmio-mux";
> +               #mux-control-cells = <1>;
> +
> +               mux-reg-masks = <0x38 0x07>;
> +               idle-states = <2>;
> +       };
> +};
> --
> 2.17.1
>
