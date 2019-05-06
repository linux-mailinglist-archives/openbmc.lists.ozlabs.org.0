Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580314C59
	for <lists+openbmc@lfdr.de>; Mon,  6 May 2019 16:39:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yQP63l5yzDqJs
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 00:39:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="BZBaShp1"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yQMc2QYgzDq7j
 for <openbmc@lists.ozlabs.org>; Tue,  7 May 2019 00:38:20 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id b3so6471933plr.7
 for <openbmc@lists.ozlabs.org>; Mon, 06 May 2019 07:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v+PO9lMge7+TYt+NYWmGc45Jx0a0UQSXMwGvBPkyCIs=;
 b=BZBaShp1bxahCq5IQxP6N28HYPmCVEfKqppKqkMIse/8hWn+JC6kEOXxgOQpfVoEe3
 2sVcjvYrapRRye7oipuzpWn99Bj7dcYC22oEDY83OvdSIhP3SgQp31vcrNfWhQ8BzE5F
 wfJzqxNwPhaXwqqOIhxHo13QDs7AKDNyp4nd+kDqdIF2EQrzLwGOqXqd9n/vyVwuq/xK
 qHn4VsBS1L5mNfmoxdfGgPUqG7i3Dw0DaGVbxWLmoo96hulBLyh3C6xuBheUNKFzpUJ1
 7ao3T1qL924lIcZIfooLHxUiPC/7R1V5d2RX99EEnLnLIKcm2F8pECq2ousi9FvUdMmG
 g7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v+PO9lMge7+TYt+NYWmGc45Jx0a0UQSXMwGvBPkyCIs=;
 b=uOZOZptB6hSGXNrBfE4yJohjpmDrpy9U3OnKGWRHLICYviA9JxVAQul3PqLqocFVuq
 bE1GooFqhFhrN1vCFNTui2cw7EHV62KkqW8OeXNKusrLHS/Kx3yVxQ3uoML3e/1cwPP2
 zoeI2Z6xKX6Ab47KZHts0Jdkkk3swcZbJXOBtTokkxshO76jv+cxQd3UQ9MZNFCfzYzV
 6THRQOv3WlgjTu9VvDWb8rtP8VMGU+4bKZb2F4/kd7DTgFY5+U0LQlWoJRdj1yXKWUnK
 u/Dm5SztAkIdgYB7jfixNCBMPtR5lNrxjxnnm1EI1OvMIKtdp2wLFpqSPg+FlquIT/kp
 zEiQ==
X-Gm-Message-State: APjAAAVZHVxu+xloVgo+VEqc9rjIVtkjWdoTrgzVXboVLDtdNxOyRn4y
 2Ew/O3ftTFoe3OIA+zuebi1W+KkMx7zb9hcAhUDhxg==
X-Google-Smtp-Source: APXvYqxyKuo3TFlg9+L89lzY8ZTqiUb9pAU7urx33cGqngXWf5yGTbaNapcxoC8B329CqR1HvYKGLRtCOUFASwzuuxs=
X-Received: by 2002:a17:902:3324:: with SMTP id
 a33mr1336421plc.1.1557153496619; 
 Mon, 06 May 2019 07:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <1557036518-286348-1-git-send-email-pengms1@lenovo.com>
 <00dfd048-d8f7-4f33-941d-ab5f2c507aae@www.fastmail.com>
In-Reply-To: <00dfd048-d8f7-4f33-941d-ab5f2c507aae@www.fastmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 6 May 2019 07:38:04 -0700
Message-ID: <CAO=notye14F+PCTc+a4GqS+yBWVQpRXH7+wEDX96jq9iWYMOGg@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Lenovo Hr630 BMC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org,
 Duke KH Du <dukh@lenovo.com>, Andrew Peng <pengms1@lenovo.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Harry Sung1 <hsung1@lenovo.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Yonghui YH21 Liu <liuyh21@lenovo.com>,
 Lisa YJ19 Liu <liuyj19@lenovo.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, May 5, 2019 at 8:17 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Sun, 5 May 2019, at 15:38, Andrew Peng wrote:
> > Initial introduction of Lenovo Hr630 family equipped with
> > Aspeed 2500 BMC SoC. Hr630 is a x86 server development kit
> > with a ASPEED ast2500 BMC manufactured by Lenovo.
> > Specifically, This adds the Hr630 platform device tree file
> > used by the Hr630 BMC machines.
> >
> > This also adds an entry of Hr630 device tree file in Makefile
> >
> > Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> > Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>
> > Signed-off-by: Lisa Liu <liuyj19@lenovo.com>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Patrick Venture <venture@google.com>

>
> > ---
> > Changes in v6:
> >  - add appropriate pinctrl property for uar1, uart2, uart3 and adc.
> >  - remove vhub definition and comment.
> >  - remove some GPIO definitions.
> >  - revise Makefile according to sort alphabetically.
> > Changes in v5:
> >  - revise pca9545 and pca9546 switch aliases name.
> > Changes in v4:
> >  - add pca9546 switch aliases name.
> > Changes in v3:
> >  - revise i2c switch aliases name.
> > Changes in v2:
> >  - add i2c switch aliases name.
> >  - remove the unused eeprom device from DT file.
> >  - remove "Licensed under..." sentence.
> >
> >  arch/arm/boot/dts/Makefile                    |   1 +
> >  arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts | 566 ++++++++++++++++++++++++++
> >  2 files changed, 567 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> >
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index f4f5aea..1276167 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1255,6 +1255,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >       aspeed-bmc-facebook-cmm.dtb \
> >       aspeed-bmc-facebook-tiogapass.dtb \
> >       aspeed-bmc-intel-s2600wf.dtb \
> > +     aspeed-bmc-lenovo-hr630.dtb \
> >       aspeed-bmc-opp-lanyang.dtb \
> >       aspeed-bmc-opp-palmetto.dtb \
> >       aspeed-bmc-opp-romulus.dtb \
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > new file mode 100644
> > index 0000000..d3695a3
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr630.dts
> > @@ -0,0 +1,566 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Device Tree file for Lenovo Hr630 platform
> > + *
> > + * Copyright (C) 2019-present Lenovo
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "aspeed-g5.dtsi"
> > +#include <dt-bindings/gpio/aspeed-gpio.h>
> > +
> > +/ {
> > +     model = "HR630 BMC";
> > +     compatible = "lenovo,hr630-bmc", "aspeed,ast2500";
> > +
> > +     aliases {
> > +             i2c14 = &i2c_rbp;
> > +             i2c15 = &i2c_fbp1;
> > +             i2c16 = &i2c_fbp2;
> > +             i2c17 = &i2c_fbp3;
> > +             i2c18 = &i2c_riser2;
> > +             i2c19 = &i2c_pcie4;
> > +             i2c20 = &i2c_riser1;
> > +             i2c21 = &i2c_ocp;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = &uart5;
> > +             bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
> > +     };
> > +
> > +     memory@80000000 {
> > +             device_type = "memory";
> > +             reg = <0x80000000 0x20000000>;
> > +     };
> > +
> > +     reserved-memory {
> > +             #address-cells = <1>;
> > +             #size-cells = <1>;
> > +             ranges;
> > +
> > +             flash_memory: region@98000000 {
> > +                     no-map;
> > +                     reg = <0x98000000 0x00100000>; /* 1M */
> > +             };
> > +
> > +             gfx_memory: framebuffer {
> > +                     size = <0x01000000>;
> > +                     alignment = <0x01000000>;
> > +                     compatible = "shared-dma-pool";
> > +                     reusable;
> > +             };
> > +     };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +
> > +             heartbeat {
> > +                     gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_LOW>;
> > +             };
> > +
> > +             fault {
> > +                     gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
> > +             };
> > +     };
> > +
> > +     iio-hwmon {
> > +             compatible = "iio-hwmon";
> > +             io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> > +             <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> > +             <&adc 8>, <&adc 9>, <&adc 10>,
> > +             <&adc 12>, <&adc 13>, <&adc 14>;
> > +     };
> > +
> > +};
> > +
> > +&fmc {
> > +     status = "okay";
> > +     flash@0 {
> > +             status = "okay";
> > +             m25p,fast-read;
> > +             label = "bmc";
> > +             spi-max-frequency = <50000000>;
> > +#include "openbmc-flash-layout.dtsi"
> > +     };
> > +};
> > +
> > +&lpc_ctrl {
> > +     status = "okay";
> > +     memory-region = <&flash_memory>;
> > +     flash = <&spi1>;
> > +};
> > +
> > +&uart1 {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_txd1_default
> > +                     &pinctrl_rxd1_default>;
> > +};
> > +
> > +&uart2 {
> > +     /* Rear RS-232 connector */
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_txd2_default
> > +                     &pinctrl_rxd2_default
> > +                     &pinctrl_nrts2_default
> > +                     &pinctrl_ndtr2_default
> > +                     &pinctrl_ndsr2_default
> > +                     &pinctrl_ncts2_default
> > +                     &pinctrl_ndcd2_default
> > +                     &pinctrl_nri2_default>;
> > +};
> > +
> > +&uart3 {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_txd3_default
> > +                     &pinctrl_rxd3_default>;
> > +};
> > +
> > +&uart5 {
> > +     status = "okay";
> > +};
> > +
> > +&ibt {
> > +     status = "okay";
> > +};
> > +
> > +&mac0 {
> > +     status = "okay";
> > +
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_rmii1_default>;
> > +     use-ncsi;
> > +};
> > +
> > +&mac1 {
> > +     status = "okay";
> > +
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> > +};
> > +
> > +&adc {
> > +     status = "okay";
> > +
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_adc0_default
> > +                     &pinctrl_adc1_default
> > +                     &pinctrl_adc2_default
> > +                     &pinctrl_adc3_default
> > +                     &pinctrl_adc4_default
> > +                     &pinctrl_adc5_default
> > +                     &pinctrl_adc6_default
> > +                     &pinctrl_adc7_default
> > +                     &pinctrl_adc8_default
> > +                     &pinctrl_adc9_default
> > +                     &pinctrl_adc10_default
> > +                     &pinctrl_adc12_default
> > +                     &pinctrl_adc13_default
> > +                     &pinctrl_adc14_default>;
> > +};
> > +
> > +&i2c0 {
> > +     status = "okay";
> > +     /* temp1 inlet */
> > +     tmp75@4e {
> > +             compatible = "national,lm75";
> > +             reg = <0x4e>;
> > +     };
> > +};
> > +
> > +&i2c1 {
> > +     status = "okay";
> > +     /* temp2 outlet */
> > +     tmp75@4d {
> > +             compatible = "national,lm75";
> > +             reg = <0x4d>;
> > +     };
> > +};
> > +
> > +&i2c2 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c3 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c4 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c5 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c6 {
> > +     status = "okay";
> > +     /*      Slot 0,
> > +      *      Slot 1,
> > +      *      Slot 2,
> > +      *      Slot 3
> > +      */
> > +
> > +     i2c-switch@70 {
> > +             compatible = "nxp,pca9545";
> > +             reg = <0x70>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             i2c-mux-idle-disconnect;        /* may use mux@70 next. */

Per an earlier email, this comment, and its sibling comment don't
really make sense, and there's no chance of a bus collision here since
the switches reside on different buses.  If the switches were under
the same bus then accesses could collide the address ranges without
the "i2c-mux-idle-disconnect" property set.

I'm ok with this being here, but someone will want to send a follow-up
patchset at some point to remove the comment - at the least.

> > +
> > +             i2c_rbp: i2c@0 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0>;
> > +             };
> > +
> > +             i2c_fbp1: i2c@1 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <1>;
> > +             };
> > +
> > +             i2c_fbp2: i2c@2 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <2>;
> > +             };
> > +
> > +             i2c_fbp3: i2c@3 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <3>;
> > +             };
> > +     };
> > +};
> > +
> > +&i2c7 {
> > +     status = "okay";
> > +
> > +     /*      Slot 0,
> > +      *      Slot 1,
> > +      *      Slot 2,
> > +      *      Slot 3
> > +      */
> > +     i2c-switch@76 {
> > +             compatible = "nxp,pca9546";
> > +             reg = <0x76>;
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             i2c-mux-idle-disconnect;  /* may use mux@76 next. */
> > +
> > +             i2c_riser2: i2c@0 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0>;
> > +             };
> > +
> > +             i2c_pcie4: i2c@1 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <1>;
> > +             };
> > +
> > +             i2c_riser1: i2c@2 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <2>;
> > +             };
> > +
> > +             i2c_ocp: i2c@3 {
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <3>;
> > +             };
> > +     };
> > +};
> > +
> > +&i2c8 {
> > +     status = "okay";
> > +
> > +     eeprom@57 {
> > +             compatible = "atmel,24c256";
> > +             reg = <0x57>;
> > +             pagesize = <16>;
> > +     };
> > +};
> > +
> > +&i2c9 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c10 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c11 {
> > +     status = "okay";
> > +};
> > +
> > +&i2c12 {
> > +     status = "okay";
> > +};
> > +
> > +&ehci1 {
> > +     status = "okay";
> > +};
> > +
> > +&uhci {
> > +     status = "okay";
> > +};
> > +
> > +&gfx {
> > +     status = "okay";
> > +     memory-region = <&gfx_memory>;
> > +};
> > +
> > +&pwm_tacho {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&pinctrl_pwm0_default
> > +     &pinctrl_pwm1_default
> > +     &pinctrl_pwm2_default
> > +     &pinctrl_pwm3_default
> > +     &pinctrl_pwm4_default
> > +     &pinctrl_pwm5_default
> > +     &pinctrl_pwm6_default>;
> > +
> > +     fan@0 {
> > +             reg = <0x00>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> > +     };
> > +
> > +     fan@1 {
> > +             reg = <0x00>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> > +     };
> > +
> > +     fan@2 {
> > +             reg = <0x01>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> > +     };
> > +
> > +     fan@3 {
> > +             reg = <0x01>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> > +     };
> > +
> > +     fan@4 {
> > +             reg = <0x02>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> > +     };
> > +
> > +     fan@5 {
> > +             reg = <0x02>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> > +     };
> > +
> > +     fan@6 {
> > +             reg = <0x03>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> > +     };
> > +
> > +     fan@7 {
> > +             reg = <0x03>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> > +     };
> > +
> > +     fan@8 {
> > +             reg = <0x04>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x08>;
> > +     };
> > +
> > +     fan@9 {
> > +             reg = <0x04>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x09>;
> > +     };
> > +
> > +     fan@10 {
> > +             reg = <0x05>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x0a>;
> > +     };
> > +
> > +     fan@11 {
> > +             reg = <0x05>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x0b>;
> > +     };
> > +
> > +     fan@12 {
> > +             reg = <0x06>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x0c>;
> > +     };
> > +
> > +     fan@13 {
> > +             reg = <0x06>;
> > +             aspeed,fan-tach-ch = /bits/ 8 <0x0d>;
> > +     };
> > +};
> > +
> > +&gpio {
> > +
> > +     pin_gpio_b5 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "IRQ_BMC_PCH_SMI_LPC_N";
> > +     };
> > +
> > +     pin_gpio_f0 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "IRQ_BMC_PCH_NMI_R";
> > +     };
> > +
> > +     pin_gpio_f3 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(F, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "I2C_BUS0_RST_OUT_N";
> > +     };
> > +
> > +     pin_gpio_f4 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "FM_SKT0_FAULT_LED";
> > +     };
> > +
> > +     pin_gpio_f5 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "FM_SKT1_FAULT_LED";
> > +     };
> > +
> > +     pin_gpio_g4 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "FAN_PWR_CTL_N";
> > +     };
> > +
> > +     pin_gpio_g7 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(G, 7) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "RST_BMC_PCIE_I2CMUX_N";
> > +     };
> > +
> > +     pin_gpio_h2 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "PSU1_FFS_N_R";
> > +     };
> > +
> > +     pin_gpio_h3 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "PSU2_FFS_N_R";
> > +     };
> > +
> > +     pin_gpio_i3 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(I, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "BMC_INTRUDED_COVER";
> > +     };
> > +
> > +     pin_gpio_j2 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "BMC_BIOS_UPDATE_N";
> > +     };
> > +
> > +     pin_gpio_j3 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(J, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "RST_BMC_HDD_I2CMUX_N";
> > +     };
> > +
> > +     pin_gpio_s2 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(S, 2) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "BMC_VGA_SW";
> > +     };
> > +
> > +     pin_gpio_s4 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(S, 4) GPIO_ACTIVE_HIGH>;
> > +             output;
> > +             line-name = "VBAT_EN_N";
> > +     };
> > +
> > +     pin_gpio_s6 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(S, 6) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "PU_BMC_GPIOS6";
> > +     };
> > +
> > +     pin_gpio_y0 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(Y, 0) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "BMC_NCSI_MUX_CTL_S0";
> > +     };
> > +
> > +     pin_gpio_y1 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(Y, 1) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "BMC_NCSI_MUX_CTL_S1";
> > +     };
> > +
> > +     pin_gpio_z0 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(Z, 0) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "I2C_RISER2_INT_N";
> > +     };
> > +
> > +     pin_gpio_z2 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(Z, 2) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "I2C_RISER2_RESET_N";
> > +     };
> > +
> > +     pin_gpio_z3 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "FM_BMC_PCH_SCI_LPC_N";
> > +     };
> > +
> > +     pin_gpio_z7 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(Z, 7) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "BMC_POST_CMPLT_N";
> > +     };
> > +
> > +     pin_gpio_aa0 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
> > +             output-low;
> > +             line-name = "HOST_BMC_USB_SEL";
> > +     };
> > +
> > +     pin_gpio_aa5 {
> > +             gpio-hog;
> > +             gpios = <ASPEED_GPIO(AA, 5) GPIO_ACTIVE_HIGH>;
> > +             output-high;
> > +             line-name = "I2C_BUS1_RST_OUT_N";
> > +     };
> > +
> > +};
> > --
> > 2.7.4
> >
> >
