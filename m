Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5A67EB78
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 06:27:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Ddj12wTzDqyg
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 14:27:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="l77Xm6dV"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460DW363RfzDqxq;
 Fri,  2 Aug 2019 14:21:19 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id r21so53883863qke.2;
 Thu, 01 Aug 2019 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q9UBcMKtePrtEaomibezEEEJmQ4FGM8GYQb7rZ+rqS0=;
 b=l77Xm6dVdFosSZz4ISpaeYA7N3fyZ4FrUY6Msp8xRh2WT283dDS5cl5Ph96Lh17ca4
 1sqbwz0J5Wo2+Hfyw9n1MlhFQZ6Xp2/iNaSYddqSxhO3pMI6shuo+Yr47tn26F1OIeyN
 0vybk8mv34jD1mv+IIMd50UPndQRhkiafo+WY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q9UBcMKtePrtEaomibezEEEJmQ4FGM8GYQb7rZ+rqS0=;
 b=uM6n1aUrEv1LnZEJfOY6iHD6Ejzbmu2HsLiZmqqJtP8ScrnXR4XQUJf8bGipiCS+9D
 wjfL32oTj/fC1JDi0wnVTHI4BKD3H5m6MQg6BZt26UmoegwSCOPPfyLjAWTmgo2epC7L
 TugJ6BVJWX0pkfzKrOy+2tfl8Xo2qSIwpelfzJGHC8Jsbgs41BXO+PXilHluK+UFMzGC
 vxjpSWB2keK3m+n+jyv7PgBGOcIsWg9i1uejanil0J3ezKOd8Brvx/o4CReJ0r5NioyH
 pBm/qEQShHmMJ202NtEVottxEWxhklLKx+AXS1tuLim6w498Gm3CILZ35pdJtv72Avca
 fHMQ==
X-Gm-Message-State: APjAAAXRMTWMdrPmCUczaFGZdmQSjhMZttHHz72aF5FHOtH7P5uNaUHN
 2HS0j+vUNSCvSMEM7ocLQFQI46B00S2QcQ47aeo=
X-Google-Smtp-Source: APXvYqx+1KRNUxUimqfzDpoeWfQqVYjpwpMAv6POY1MuPBx01LXJU1p7xULXTW7V3lAp+QMTexKFlSiRSNfwf0S6ye0=
X-Received: by 2002:a37:b0c6:: with SMTP id
 z189mr88058946qke.208.1564719675402; 
 Thu, 01 Aug 2019 21:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190802041010.1234178-1-taoren@fb.com>
In-Reply-To: <20190802041010.1234178-1-taoren@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Aug 2019 04:21:03 +0000
Message-ID: <CACPK8XcuwNE3aBrsgn-paTZt-EtF6pc6WwYBQef5xc7157bk2g@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add Facebook Wedge100 BMC
To: Tao Ren <taoren@fb.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2 Aug 2019 at 04:10, Tao Ren <taoren@fb.com> wrote:
>
> Add initial version of device tree for Facebook Wedge100 AST2400 BMC
> platform.
>
> Signed-off-by: Tao Ren <taoren@fb.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Changes in v2:
>  - remove "debug" from bootargs.

Thanks. I applied wedge40 and then this one fails to apply due to
conflicts in the Makefile. Next time you have two patches, send them
as a series they apply one atop the other.

The naming of these two files suggests they come from a family. I
noticed there's very minor differences, a pca9548 switch and the use
of a watchdog.

Are these device trees complete? If yes, do you think it's worthwhile
to have a common wedge description in eg.
aspeed-bmc-facebook-wedge.dtsi, and put the unique description in
respective dts board files?

The upside of this is reduced duplication.

If you have a reason not to, then that is okay and we can leave it as
you submitted them.

Cheers,

Joel

--- arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts    2019-08-02
13:44:26.536934502 +0930
+++ arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts    2019-08-02
13:44:02.980670672 +0930
@@ -5,8 +5,8 @@
 #include "aspeed-g4.dtsi"

 / {
-    model = "Facebook Wedge 100 BMC";
-    compatible = "facebook,wedge100-bmc", "aspeed,ast2400";
+    model = "Facebook Wedge 40 BMC";
+    compatible = "facebook,wedge40-bmc", "aspeed,ast2400";

     aliases {
         /*
@@ -35,8 +35,7 @@
 };

 &wdt2 {
-    status = "okay";
-    aspeed,reset-type = "system";
+    status = "disabled";
 };

 &fmc {
@@ -111,13 +110,6 @@

 &i2c7 {
     status = "okay";
-
-    i2c-switch@70 {
-        compatible = "nxp,pca9548";
-        #address-cells = <1>;
-        #size-cells = <0>;
-        reg = <0x70>;
-    };
 };

>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-facebook-wedge100.dts | 149 ++++++++++++++++++
>  2 files changed, 150 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 39a05a10a2a2..d71504ed82d3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1273,6 +1273,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-minipack.dtb \
>         aspeed-bmc-facebook-tiogapass.dtb \
> +       aspeed-bmc-facebook-wedge100.dtb \
>         aspeed-bmc-facebook-yamp.dtb \
>         aspeed-bmc-intel-s2600wf.dtb \
>         aspeed-bmc-inspur-fp5280g2.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> new file mode 100644
> index 000000000000..b1e10f0c85c9
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge100.dts
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2018 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +
> +/ {
> +       model = "Facebook Wedge 100 BMC";
> +       compatible = "facebook,wedge100-bmc", "aspeed,ast2400";
> +
> +       aliases {
> +               /*
> +                * Override the default uart aliases to avoid breaking
> +                * the legacy applications.
> +                */
> +               serial0 = &uart5;
> +               serial1 = &uart1;
> +               serial2 = &uart3;
> +               serial3 = &uart4;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart3;
> +               bootargs = "console=ttyS2,9600n8 root=/dev/ram rw";
> +       };
> +
> +       memory@40000000 {
> +               reg = <0x40000000 0x20000000>;
> +       };
> +};
> +
> +&wdt1 {
> +       status = "okay";
> +       aspeed,reset-type = "system";
> +};
> +
> +&wdt2 {
> +       status = "okay";
> +       aspeed,reset-type = "system";
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "fmc0";
> +#include "facebook-bmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&uart1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                    &pinctrl_rxd1_default>;
> +};
> +
> +&uart3 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd3_default
> +                    &pinctrl_rxd3_default>;
> +};
> +
> +&uart4 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd4_default
> +                    &pinctrl_rxd4_default>;
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       no-hw-checksum;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       i2c-switch@70 {
> +               compatible = "nxp,pca9548";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x70>;
> +       };
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +};
> +
> +&i2c13 {
> +       status = "okay";
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> --
> 2.17.1
>
