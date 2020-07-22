Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E026229041
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 07:59:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBPsv75kJzDqjR
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 15:58:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XlgcqI4M; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBPrm2Cm1zDqG0;
 Wed, 22 Jul 2020 15:57:57 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id g20so732662edm.4;
 Tue, 21 Jul 2020 22:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7HyvRxIrXJ94hpJJ10KYHhFfMdEOmHA2GHT0K+5iUXk=;
 b=XlgcqI4MvjemKHQVFDQvUzykkZRmP3lD/jG4aYdiM6hGOhyvXScttPI7hWy9rKRfuk
 7J0QusowPX9dYB44LlAJBmavv5IOKWu71jWfGsTCuhQfavb8v/oc7Gq4CemDQBtbwA2A
 uio4InFKyFHp+HAVNkP3Xk0qQQOfYwlexvZpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HyvRxIrXJ94hpJJ10KYHhFfMdEOmHA2GHT0K+5iUXk=;
 b=NbDjWMCsFjTUqvBaMxOcOUrc7L+9pjta+b6NaKafCOblx0o1y1o0qYwWSKvx59Mq2p
 VXXMJaVx40dVcnH0yaR9sljR65Uea0CiETYjD83Xa4sYJI3nE9YgH+jt9Y/BJS3jFjom
 oMFnjvE6oFCkq2in7ujRx9At9+/naF1aVu8AtM90lAVYa85a59kin0a5A1JBc5MSuOkl
 xgKi+boNt+oVNFwxC6arCaKDKNP5H9M69QtR0r4CUaxSVShvg+i6DBp9Oaa476Su5vPe
 Ge64Q2jRYLTeGOdW6xzUvpMt/tbAp5UlFkf5AK3hYSIHP0dv6xJaT99WdNG5Q6PYjpSK
 tQmg==
X-Gm-Message-State: AOAM533TfdXHtT1BdsUrMySvaiKQwGYvBz4pCjIHPMFXAs9ed6ng++Eb
 dHkmDjfRa/znyNWtCoo3WaZJmsHGZYPQCYu8lmY=
X-Google-Smtp-Source: ABdhPJyqwx7/7Ern/u8AfDOeaGdctpyl3n7V510LJKLg3E6NY/BORruzv1YBZDEOqkF3HbgrRGVMMg07hHLqxCPsRBY=
X-Received: by 2002:a50:ee8a:: with SMTP id f10mr28623696edr.383.1595397473857; 
 Tue, 21 Jul 2020 22:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200720160147.22339-1-supreeth.venkatesh@amd.com>
In-Reply-To: <20200720160147.22339-1-supreeth.venkatesh@amd.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Jul 2020 05:57:41 +0000
Message-ID: <CACPK8XfBPb85uXyYiphD9uEUG6a+acAzEMAsfaenT3t0jqUWNw@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD EthanolX
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jul 2020 at 16:02, Supreeth Venkatesh
<supreeth.venkatesh@amd.com> wrote:
>
> Initial introduction of AMD EthanolX platform equipped with an
> Aspeed ast2500 BMC manufactured by AMD.
>
> AMD EthanolX platform is an AMD customer reference board with an
> Aspeed ast2500 BMC manufactured by AMD.
> This adds AMD EthanolX device tree file including the flash layout
> used by EthanolX BMC machines.
>
> This also adds an entry of AMD EthanolX device tree file in Makefile.
>
> Signed-off-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Looks good. One question about the licence.


> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: Apache-2.0
> +// Copyright (c) 2020 AMD Inc.

Can you have a read of the licence rules and add a preferred licence.
The rules are here:

 https://www.kernel.org/doc/html/latest/process/license-rules.html

This very hacky one liner will give you an idea of common licences
used by device trees:

$ git grep -h SPDX -- arch/arm/boot/dts/ | cut -c3- |sort -b | uniq -c
| sort -hr
    579  SPDX-License-Identifier: GPL-2.0
    305  SPDX-License-Identifier: GPL-2.0-only
    222  SPDX-License-Identifier: GPL-2.0-or-later
    188  SPDX-License-Identifier: (GPL-2.0+ OR MIT)
     91  SPDX-License-Identifier: GPL-2.0+
     72  SPDX-License-Identifier: (GPL-2.0 OR MIT)
     57  SPDX-License-Identifier: GPL-2.0+ OR MIT
     46  SPDX-License-Identifier: GPL-2.0-or-later OR MIT
     38  SPDX-License-Identifier: GPL-2.0 OR X11
     29  SPDX-License-Identifier: GPL-2.0 OR MIT
     19  SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
     16  SPDX-License-Identifier: GPL-2.0-only */
      6  SPDX-License-Identifier: ISC
      5  SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
      4  SPDX-License-Identifier: (GPL-2.0+ OR X11)
      4  SPDX-License-Identifier: (GPL-2.0 or MIT)
      4  SPDX-License-Identifier: GPL-2.0 */
      3  SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
      2  SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause) */
      2  SPDX-License-Identifier: GPL-2.0-or-later */
      2  SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
      2  SPDX-License-Identifier: (GPL-2.0+)
      2  SPDX-License-Identifier: (GPL-2.0)
      2 SPDX-License-Identifier: GPL-2.0
      1  SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
      1  SPDX-License-Identifier:  GPL-2.0+
      1 SPDX-License-Identifier: GPL-2.0+
      1   SPDX-License-Identifier: BSD-3-Clause


> +// Author: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "AMD EthanolX BMC";
> +       compatible = "amd,ethanolx-bmc", "aspeed,ast2500";
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +       aliases {
> +               serial0 = &uart1;
> +               serial4 = &uart5;
> +       };
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               fault {
> +                       gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               #include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +                <&syscon ASPEED_CLK_MAC1RCLK>;
> +       clock-names = "MACCLK", "RCLK";
> +};
> +
> +&uart1 {
> +       //Host Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                    &pinctrl_rxd1_default>;
> +};
> +
> +&uart5 {
> +       //BMC Console
> +       status = "okay";
> +};
> +
> +&adc {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +                    &pinctrl_adc1_default
> +                    &pinctrl_adc2_default
> +                    &pinctrl_adc3_default
> +                    &pinctrl_adc4_default>;
> +};
> +
> +// Thermal Sensors
> +&i2c7 {
> +       status = "okay";
> +
> +       lm75a@48 {
> +               compatible = "national,lm75a";
> +               reg = <0x48>;
> +       };
> +
> +       lm75a@49 {
> +               compatible = "national,lm75a";
> +               reg = <0x49>;
> +       };
> +
> +       lm75a@4a {
> +               compatible = "national,lm75a";
> +               reg = <0x4a>;
> +       };
> +
> +       lm75a@4b {
> +               compatible = "national,lm75a";
> +               reg = <0x4b>;
> +       };
> +
> +       lm75a@4c {
> +               compatible = "national,lm75a";
> +               reg = <0x4c>;
> +       };
> +
> +       lm75a@4d {
> +               compatible = "national,lm75a";
> +               reg = <0x4d>;
> +       };
> +
> +       lm75a@4e {
> +               compatible = "national,lm75a";
> +               reg = <0x4e>;
> +       };
> +
> +       lm75a@4f {
> +               compatible = "national,lm75a";
> +               reg = <0x4f>;
> +       };
> +};
> +
> +&kcs1 {
> +       status = "okay";
> +       kcs_addr = <0x60>;
> +};
> +
> +&kcs2 {
> +       status = "okay";
> +       kcs_addr = <0x62>;
> +};
> +
> +&kcs4 {
> +       status = "okay";
> +       kcs_addr = <0x97DE>;
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>;
> +};
> +
> +&lpc_ctrl {
> +       //Enable lpc clock
> +       status = "okay";
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default
> +       &pinctrl_pwm1_default
> +       &pinctrl_pwm2_default
> +       &pinctrl_pwm3_default
> +       &pinctrl_pwm4_default
> +       &pinctrl_pwm5_default
> +       &pinctrl_pwm6_default
> +       &pinctrl_pwm7_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +};
> +
> +
> +
> --
> 2.17.1
>
