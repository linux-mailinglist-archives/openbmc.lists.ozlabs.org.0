Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A958122A
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 13:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsZf23lBSz3bmW
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 21:37:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aavlwnCX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=logananth13.hcl@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aavlwnCX;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsZdY40kqz2xss;
	Tue, 26 Jul 2022 21:37:20 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id o12so12949691pfp.5;
        Tue, 26 Jul 2022 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oIx6UQIy+Kcx2wptGKqvJKx+Yj7JR9CskwtKF8hf9aA=;
        b=aavlwnCXrs+XyVcZvrauOZSXy5pk6YRAqgkxg+a+8tcb6L+vp1u5izB/W/BI5OO0FN
         ZNnNmkGcHThlXPNxWf92oSV6Y9hsLx6O2O0v9XmJ1iaWueDfAvpX5v7f5HDWf0Q1QkMv
         9wgBTvAXReMT+1V64NowL4Ms892OQiAtXkmPXF2KoGgbrylpj3p+MXaESlqgXuMGCXkI
         /d5GI+KtElcJPGWxHrYt8Jz7obVtgw0mQ3wvNz90FD/15ZBBzkGaOOkR44mMYb3xGVXt
         uJezN0jRW4YGh8WPcAYRrI9TN1JQhhjj8v+7ELuMXidhkDL02MJIGzOfIXjE9+fv42A2
         Bn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oIx6UQIy+Kcx2wptGKqvJKx+Yj7JR9CskwtKF8hf9aA=;
        b=MACokiZyPxs7bLlgwLo1SRwbJFZk2Q1bz2ZZmtfYoow7ZTA1JYF837UIagv2fF5hta
         Z1rSYsJEJemiuzi369RVhAGbY2zgZ2S1t+RPvRPKu/THxWASEFS9txwch65qYwdp0pHy
         VrWe4UBuAboazHUyTxpCezuwjmunZMqnN7xQhuao9HVwd74cXZw+hu97dZr1eXfFJHLH
         qK3Z6OKCJDM9NrnuSRhkQ9euQX8G0ExS12ubIkl5ShPHKoYPtofWozNSiHMMrktM0zSf
         sO5lz7ZdglmaurQLg4IRmMhiLkyciJZeWAcFYv1MrKM2KbgFcVKNeYnJzTK72/6ABsFO
         kiFg==
X-Gm-Message-State: AJIora94pq4ZKLteUPR2X5J3M3boVlZbg059IwNUBOQ1a5lzR+ZSYHsp
	VBDI9Rzwr4JXyMtWFFFypQIre/AxosEy24bKVHc=
X-Google-Smtp-Source: AGRyM1ulgc57vOTGFUbyJd2M+S5NBD9mZ1jZmKGaAyJz1wyNARUVs2X/Zg74fAq/2CrDUeE2sUrZqda4iP1HwlWhwM0=
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id
 b11-20020a056a000a8b00b004e152db9e5cmr16918851pfl.38.1658835437685; Tue, 26
 Jul 2022 04:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220720105331.GA23472@logan-ThinkPad-T14-Gen-1> <20220720231605.GA30806@packtop>
In-Reply-To: <20220720231605.GA30806@packtop>
From: logananth hcl <logananth13.hcl@gmail.com>
Date: Tue, 26 Jul 2022 17:07:06 +0530
Message-ID: <CAGpPFEGs5BHPvY0VCMJofASTLd5hCD5uovDpfLembX+EMs+rnw@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: dts: aspeed: Adding Facebook Yosemite V3.5 BMC
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="00000000000001107905e4b3b900"
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "naveen.mosess@hcl.com" <naveen.mosess@hcl.com>, "thangavel.k@hcl.com" <thangavel.k@hcl.com>, "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Olof Johansson <olof@lixom.net>, "garnermic@gmail.com" <garnermic@gmail.com>, "velumanit@hcl.com" <velumanit@hcl.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000001107905e4b3b900
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 21, 2022 at 4:46 AM Zev Weiss <zweiss@equinix.com> wrote:

> On Wed, Jul 20, 2022 at 03:53:31AM PDT, Logananth Sundararaj wrote:
> >The Yosemite V3.5 is a facebook multi-node server
> >platform that host four OCP server. The BMC
> >in the Yosemite V3.5 platform based on AST2600 SoC.
> >
> >This patch adds linux device tree entry related to
> >Yosemite V3.5 specific devices connected to BMC SoC.
> >
> >Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>
> >
> >---
> >--- v4 - Bootagrs and memory removed.
> >--- v3 - Addressed v2 patch comments.
> >--- v2 - Enabled i2c drivers.
> >--- v1 - Initial draft.
> >---
> >---
> > arch/arm/boot/dts/Makefile                    |   1 +
> > .../boot/dts/aspeed-bmc-facebook-fby35.dts    | 260 ++++++++++++++++++
> > 2 files changed, 261 insertions(+)
> > create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
> >
> >diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >index 7e0934180724..58add093e5fb 100644
> >--- a/arch/arm/boot/dts/Makefile
> >+++ b/arch/arm/boot/dts/Makefile
> >@@ -1465,6 +1465,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
> >       aspeed-bmc-facebook-cloudripper.dtb \
> >       aspeed-bmc-facebook-cmm.dtb \
> >       aspeed-bmc-facebook-elbert.dtb \
> >+      aspeed-bmc-facebook-fby35.dtb \
> >       aspeed-bmc-facebook-fuji.dtb \
> >       aspeed-bmc-facebook-galaxy100.dtb \
> >       aspeed-bmc-facebook-minipack.dtb \
> >diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
> b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
> >new file mode 100644
> >index 000000000000..05efba7117a8
> >--- /dev/null
> >+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts
> >@@ -0,0 +1,260 @@
> >+// SPDX-License-Identifier: GPL-2.0-or-later
> >+// Copyright (c) 2020 Facebook Inc.
> >+
> >+/dts-v1/;
> >+
> >+#include "aspeed-g6.dtsi"
> >+#include <dt-bindings/gpio/aspeed-gpio.h>
> >+#include <dt-bindings/i2c/i2c.h>
> >+
> >+/ {
> >+      model = "Facebook fby35";
> >+      compatible = "facebook,fby35", "aspeed,ast2600";
> >+
> >+      aliases {
> >+              serial4 = &uart5;
> >+      };
> >+
> >+      chosen {
> >+              stdout-path = &uart5;
> >+      };
> >+
> >+      iio-hwmon {
> >+              compatible = "iio-hwmon";
> >+              io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> >+                      <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> >+                      <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> >+                      <&adc1 4>, <&adc1 5>, <&adc1 6>;
> >+      };
>
> A blank line here would be nice for formatting consistency...
>
> will fix it.

> >+      spi_gpio: spi-gpio {
> >+              status = "okay";
> >+              compatible = "spi-gpio";
> >+              #address-cells = <1>;
> >+              #size-cells = <0>;
> >+
> >+              gpio-sck = <&gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH>;
> >+              gpio-mosi = <&gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH>;
> >+              gpio-miso = <&gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH>;
> >+              num-chipselects = <1>;
> >+              cs-gpios = <&gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW>;
> >+
> >+              tpmdev@0 {
> >+                      compatible = "tcg,tpm_tis-spi";
> >+                      spi-max-frequency = <33000000>;
> >+                      reg = <0>;
> >+              };
> >+      };
> >+
>
> ...and this one could be removed.
>
> will fix it.

> >+};
> >+
> >+&mac3 {
> >+      status = "okay";
> >+
> >+      pinctrl-names = "default";
> >+      pinctrl-0 = <&pinctrl_rmii4_default>;
> >+      no-hw-checksum;
> >+      use-ncsi;
> >+      mlx,multi-host;
> >+      ncsi-ctrl,start-redo-probe;
> >+      ncsi-ctrl,no-channel-monitor;
> >+      ncsi-package = <1>;
> >+      ncsi-channel = <1>;
> >+      ncsi-rexmit = <1>;
> >+      ncsi-timeout = <2>;
> >+};
> >+
> >+&uart1 {
> >+      status = "okay";
> >+};
> >+
> >+&uart2 {
> >+      status = "okay";
> >+};
> >+
> >+&uart3 {
> >+      status = "okay";
> >+};
> >+
> >+&uart4 {
> >+      status = "okay";
> >+};
> >+
> >+&uart5 {
> >+      status = "okay";
> >+      compatible = "snps,dw-apb-uart";
> >+};
> >+
> >+&wdt1 {
> >+      status = "okay";
> >+      pinctrl-names = "default";
> >+      pinctrl-0 = <&pinctrl_wdtrst1_default>;
> >+      aspeed,reset-type = "soc";
> >+      aspeed,external-signal;
> >+      aspeed,ext-push-pull;
> >+      aspeed,ext-active-high;
> >+      aspeed,ext-pulse-duration = <256>;
> >+};
> >+
> >+&rtc {
> >+      status = "okay";
> >+};
> >+
> >+&fmc {
> >+      status = "okay";
> >+      flash@0 {
> >+              status = "okay";
> >+              m25p,fast-read;
> >+              label = "spi0.1";
> >+              spi-max-frequency = <50000000>;
> >+              #include "openbmc-flash-layout-128.dtsi"
> >+      };
> >+      flash@1 {
> >+              status = "okay";
> >+              m25p,fast-read;
> >+              label = "spi0.0";
> >+              spi-max-frequency = <50000000>;
> >+              #include "openbmc-flash-layout.dtsi"
> >+      };
>
> The labels on these look backwards from what I'd guess was probably
> intended (flash@0 is spi0.1 and flash@1 is spi0.0).
>
> Let's check into this, and fix it.

> >+};
> >+
> >+&i2c0 {
> >+      //Host1 IPMB bus
>
> While it's not currently 100% consistent, I think the generally
> preferred style is to put a space after '//' (here and elsewhere).
>
will fix it.

>
> >+      status = "okay";
> >+      multi-master;
> >+      ipmb0@10 {
> >+              compatible = "ipmb-dev";
> >+              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> >+              i2c-protocol;
> >+      };
> >+};
> >+
> >+&i2c1 {
> >+      //Host2 IPMB bus
> >+      status = "okay";
> >+      multi-master;
> >+      ipmb1@10 {
> >+              compatible = "ipmb-dev";
> >+              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> >+              i2c-protocol;
> >+      };
> >+};
> >+
> >+&i2c2 {
> >+      //Host3 IPMB bus
> >+      status = "okay";
> >+      multi-master;
> >+      ipmb2@10 {
> >+              compatible = "ipmb-dev";
> >+              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> >+              i2c-protocol;
> >+      };
> >+};
> >+
> >+&i2c3 {
> >+      //Host1 IPMB bus
> >+      status = "okay";
> >+      multi-master;
> >+      ipmb3@10 {
> >+              compatible = "ipmb-dev";
> >+              reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> >+              i2c-protocol;
> >+      };
> >+};
> >+
> >+&i2c4 {
> >+      status = "okay";
> >+};
> >+
> >+&i2c5 {
> >+      status = "okay";
> >+};
> >+
> >+&i2c6 {
> >+      status = "okay";
> >+};
> >+
> >+&i2c7 {
> >+      status = "okay";
> >+};
> >+
> >+&i2c8 {
> >+      //NIC SENSOR TEMP
> >+      status = "okay";
> >+      tmp421@1f {
> >+              compatible = "ti,tmp421";
> >+              reg = <0x1f>;
> >+      };
> >+};
> >+
> >+&i2c9 {
> >+      // Debug-Card IPMB bus
> >+      status = "okay";
> >+      multi-master;
> >+      ipmb9@30 {
> >+              compatible = "ipmb-dev";
> >+              reg = <(0x30 | I2C_OWN_SLAVE_ADDRESS)>;
> >+              i2c-protocol;
> >+      };
> >+};
> >+
> >+&i2c10 {
> >+      status = "okay";
> >+};
> >+
> >+&i2c11 {
> >+      status = "okay";
> >+      //FRU EEPROM
> >+      eeprom@51 {
> >+              compatible = "atmel,24c64";
> >+              reg = <0x51>;
> >+              pagesize = <32>;
> >+      };
> >+};
> >+
> >+&i2c12 {
> >+      status = "okay";
> >+      //INLET TEMP
> >+      tmp75@4e {
> >+              compatible = "ti,tmp75";
> >+              reg = <0x4e>;
> >+      };
> >+      //OUTLET TEMP
> >+      tmp75@4f {
> >+              compatible = "ti,tmp75";
> >+              reg = <0x4f>;
> >+      };
> >+};
> >+
> >+&i2c13 {
> >+      status = "okay";
> >+};
> >+
> >+&adc0 {
> >+      ref_voltage = <2500>;
> >+      status = "okay";
> >+
> >+      pinctrl-0 = <&pinctrl_adc0_default &pinctrl_adc1_default
> >+              &pinctrl_adc2_default &pinctrl_adc3_default
> >+              &pinctrl_adc4_default &pinctrl_adc5_default
> >+              &pinctrl_adc6_default &pinctrl_adc7_default>;
> >+};
> >+
> >+&adc1 {
> >+      ref_voltage = <2500>;
> >+      status = "okay";
> >+
> >+      pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default
> >+              &pinctrl_adc10_default &pinctrl_adc11_default
> >+              &pinctrl_adc12_default &pinctrl_adc13_default>;
> >+};
>
> Missing blank line.
>
> will fix.

> >+&ehci0 {
> >+      status = "okay";
> >+};
> >+
> >+&ehci1 {
> >+      status = "okay";
> >+};
> >+
> >+&uhci {
> >+      status = "okay";
> >+};
> >--
> >2.17.1
> >

Thanks
-Logananth

--00000000000001107905e4b3b900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 21, 2022 at 4:46 AM Zev W=
eiss &lt;<a href=3D"mailto:zweiss@equinix.com">zweiss@equinix.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Ju=
l 20, 2022 at 03:53:31AM PDT, Logananth Sundararaj wrote:<br>
&gt;The Yosemite V3.5 is a facebook multi-node server<br>
&gt;platform that host four OCP server. The BMC<br>
&gt;in the Yosemite V3.5 platform based on AST2600 SoC.<br>
&gt;<br>
&gt;This patch adds linux device tree entry related to<br>
&gt;Yosemite V3.5 specific devices connected to BMC SoC.<br>
&gt;<br>
&gt;Signed-off-by: Logananth Sundararaj &lt;<a href=3D"mailto:logananth_s@h=
cl.com" target=3D"_blank">logananth_s@hcl.com</a>&gt;<br>
&gt;<br>
&gt;---<br>
&gt;--- v4 - Bootagrs and memory removed.<br>
&gt;--- v3 - Addressed v2 patch comments.<br>
&gt;--- v2 - Enabled i2c drivers.<br>
&gt;--- v1 - Initial draft.<br>
&gt;---<br>
&gt;---<br>
&gt; arch/arm/boot/dts/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; .../boot/dts/aspeed-bmc-facebook-fby35.dts=C2=A0 =C2=A0 | 260 ++++++++=
++++++++++<br>
&gt; 2 files changed, 261 insertions(+)<br>
&gt; create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts<br>
&gt;<br>
&gt;diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile<br=
>
&gt;index 7e0934180724..58add093e5fb 100644<br>
&gt;--- a/arch/arm/boot/dts/Makefile<br>
&gt;+++ b/arch/arm/boot/dts/Makefile<br>
&gt;@@ -1465,6 +1465,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed-bmc-facebook-cloudripper.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed-bmc-facebook-cmm.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed-bmc-facebook-elbert.dtb \<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aspeed-bmc-facebook-fby35.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed-bmc-facebook-fuji.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed-bmc-facebook-galaxy100.dtb \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed-bmc-facebook-minipack.dtb \<br>
&gt;diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts b/arch/arm=
/boot/dts/aspeed-bmc-facebook-fby35.dts<br>
&gt;new file mode 100644<br>
&gt;index 000000000000..05efba7117a8<br>
&gt;--- /dev/null<br>
&gt;+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-fby35.dts<br>
&gt;@@ -0,0 +1,260 @@<br>
&gt;+// SPDX-License-Identifier: GPL-2.0-or-later<br>
&gt;+// Copyright (c) 2020 Facebook Inc.<br>
&gt;+<br>
&gt;+/dts-v1/;<br>
&gt;+<br>
&gt;+#include &quot;aspeed-g6.dtsi&quot;<br>
&gt;+#include &lt;dt-bindings/gpio/aspeed-gpio.h&gt;<br>
&gt;+#include &lt;dt-bindings/i2c/i2c.h&gt;<br>
&gt;+<br>
&gt;+/ {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 model =3D &quot;Facebook fby35&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;facebook,fby35&quot;, &quot;=
aspeed,ast2600&quot;;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aliases {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serial4 =3D &amp;uart=
5;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 chosen {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout-path =3D &amp;=
uart5;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 iio-hwmon {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
iio-hwmon&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 io-channels =3D &lt;&=
amp;adc0 0&gt;, &lt;&amp;adc0 1&gt;, &lt;&amp;adc0 2&gt;, &lt;&amp;adc0 3&g=
t;,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;adc0 4&gt;, &lt;&amp;adc0 5&gt;, &lt;&amp;adc0 6&gt;, &lt;&=
amp;adc0 7&gt;,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;adc1 0&gt;, &lt;&amp;adc1 1&gt;, &lt;&amp;adc1 2&gt;, &lt;&=
amp;adc1 3&gt;,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;&amp;adc1 4&gt;, &lt;&amp;adc1 5&gt;, &lt;&amp;adc1 6&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
<br>
A blank line here would be nice for formatting consistency...<br>
<br></blockquote><div>will fix it. <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt;+=C2=A0 =C2=A0 =C2=A0 spi_gpio: spi-gpio {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay=
&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
spi-gpio&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #address-cells =3D &l=
t;1&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #size-cells =3D &lt;0=
&gt;;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-sck =3D &lt;&amp=
;gpio0 ASPEED_GPIO(X, 3) GPIO_ACTIVE_HIGH&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-mosi =3D &lt;&am=
p;gpio0 ASPEED_GPIO(X, 4) GPIO_ACTIVE_HIGH&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpio-miso =3D &lt;&am=
p;gpio0 ASPEED_GPIO(X, 5) GPIO_ACTIVE_HIGH&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num-chipselects =3D &=
lt;1&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-gpios =3D &lt;&amp=
;gpio0 ASPEED_GPIO(X, 0) GPIO_ACTIVE_LOW&gt;;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tpmdev@0 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 compatible =3D &quot;tcg,tpm_tis-spi&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 spi-max-frequency =3D &lt;33000000&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 reg =3D &lt;0&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+<br>
<br>
...and this one could be removed.<br>
<br></blockquote><div>will fix it. <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
&gt;+};<br>
&gt;+<br>
&gt;+&amp;mac3 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_rmii4_default&gt;;=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 no-hw-checksum;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 use-ncsi;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 mlx,multi-host;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ncsi-ctrl,start-redo-probe;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ncsi-ctrl,no-channel-monitor;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ncsi-package =3D &lt;1&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ncsi-channel =3D &lt;1&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ncsi-rexmit =3D &lt;1&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ncsi-timeout =3D &lt;2&gt;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;uart1 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;uart2 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;uart3 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;uart4 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;uart5 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;snps,dw-apb-uart&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;wdt1 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D &quot;default&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_wdtrst1_default&gt=
;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aspeed,reset-type =3D &quot;soc&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aspeed,external-signal;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aspeed,ext-push-pull;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aspeed,ext-active-high;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 aspeed,ext-pulse-duration =3D &lt;256&gt;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;rtc {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;fmc {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 flash@0 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay=
&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m25p,fast-read;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;spi0.=
1&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-max-frequency =3D=
 &lt;50000000&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &quot;openbm=
c-flash-layout-128.dtsi&quot;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 flash@1 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay=
&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m25p,fast-read;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D &quot;spi0.=
0&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-max-frequency =3D=
 &lt;50000000&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &quot;openbm=
c-flash-layout.dtsi&quot;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
<br>
The labels on these look backwards from what I&#39;d guess was probably<br>
intended (flash@0 is spi0.1 and flash@1 is spi0.0).<br>
<br></blockquote><div>Let&#39;s check into this, and fix it. <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c0 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //Host1 IPMB bus<br>
<br>
While it&#39;s not currently 100% consistent, I think the generally<br>
preferred style is to put a space after &#39;//&#39; (here and elsewhere).<=
br></blockquote><div>will fix it. <br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 multi-master;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ipmb0@10 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;(0x10 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-protocol;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c1 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //Host2 IPMB bus<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 multi-master;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ipmb1@10 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;(0x10 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-protocol;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c2 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //Host3 IPMB bus<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 multi-master;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ipmb2@10 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;(0x10 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-protocol;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c3 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //Host1 IPMB bus<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 multi-master;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ipmb3@10 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;(0x10 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-protocol;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c4 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c5 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c6 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c7 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c8 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //NIC SENSOR TEMP<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 tmp421@1f {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ti,tmp421&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x1f&gt;;=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c9 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 // Debug-Card IPMB bus<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 multi-master;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ipmb9@30 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ipmb-dev&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;(0x30 | I=
2C_OWN_SLAVE_ADDRESS)&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-protocol;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c10 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c11 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //FRU EEPROM<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 eeprom@51 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
atmel,24c64&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x51&gt;;=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pagesize =3D &lt;32&g=
t;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c12 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //INLET TEMP<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 tmp75@4e {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ti,tmp75&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x4e&gt;;=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 //OUTLET TEMP<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 tmp75@4f {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;=
ti,tmp75&quot;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg =3D &lt;0x4f&gt;;=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;i2c13 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;adc0 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ref_voltage =3D &lt;2500&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_adc0_default &amp;=
pinctrl_adc1_default<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_adc2_def=
ault &amp;pinctrl_adc3_default<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_adc4_def=
ault &amp;pinctrl_adc5_default<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_adc6_def=
ault &amp;pinctrl_adc7_default&gt;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;adc1 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ref_voltage =3D &lt;2500&gt;;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D &lt;&amp;pinctrl_adc8_default &amp;=
pinctrl_adc9_default<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_adc10_de=
fault &amp;pinctrl_adc11_default<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;pinctrl_adc12_de=
fault &amp;pinctrl_adc13_default&gt;;<br>
&gt;+};<br>
<br>
Missing blank line.<br>
<br></blockquote><div>will fix. <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
&gt;+&amp;ehci0 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;ehci1 {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;+<br>
&gt;+&amp;uhci {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
&gt;+};<br>
&gt;-- <br>
&gt;2.17.1<br>
&gt;</blockquote><div>Thanks <br></div><div>-Logananth <br></div></div></di=
v>

--00000000000001107905e4b3b900--
