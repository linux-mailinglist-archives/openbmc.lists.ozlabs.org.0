Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E932738BB83
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 03:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmTT7601kz303h
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 11:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=K5aql/Fy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=K5aql/Fy; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmTSs2jHsz2yXB;
 Fri, 21 May 2021 11:25:48 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id t20so14267537qtx.8;
 Thu, 20 May 2021 18:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEFeFLlXrN7s5hMropugd1IByFgGDO3tL02grQ2M6rU=;
 b=K5aql/FypUyDgtlwguPy2zRcTYxI825oNlH+pPWiPZY/grHIQTRtauU0g1zQMuhfGS
 xEjknimLJhEDjAwK5CqqtCV0mceHohEWviAKPoWwru8foxIQy1r3rnw39wMZb0Hjh3Wm
 8kSmH2cEJv6jZtTo/7Z4h8ba9D8KB5lkRt32k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEFeFLlXrN7s5hMropugd1IByFgGDO3tL02grQ2M6rU=;
 b=gWrvBYUQIgup/c4dR0xtN0LI5sHsEgdv3aCXMQf85ilCA7wCH5KDIijTXfS+fEOg4+
 uUgx3/JH/Z6XOGEWZ+lOlVo1T0hYjcqMZG2g5Chd3dYlg8rRpaPaZoTUVw59bn1Rg5zk
 XCwszOR6cYmeSQd+ulwx3yKAOi1KljHn9ON1znM7QluT8VgJEkU4lt4RdQX0T9f2mC7e
 hdSVYCHpvc544YcTQlWNhh4nkrRX4lORYflPAyC1xCMk4eFCRQiamg5XjkcDdRzXEkEP
 5r4Dml9kAwCTp2LDiLhuu0vGcrjr6xVE65Hr0LfSzozbpH5euhxsQW1SQhASE27mAmY6
 r65Q==
X-Gm-Message-State: AOAM531+QCzeaFT1TVnVqLzvnqHpw0yO2HCHoCWm9kia3dMRCJYnJXwj
 nbCxnb8f87V237NkiFxHw6wyfNDT9OmKHAxfZ6U=
X-Google-Smtp-Source: ABdhPJwGolCdNlaVr889/7139gTWlXMVM5GNQ7Xn/TL3jLWCZ1R5RzqO+rGv8/UweRupWlqLbRTp1r1r0PPyl5gBoaU=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr8821733qtr.176.1621560344522; 
 Thu, 20 May 2021 18:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210520101346.16772-1-steven_lee@aspeedtech.com>
 <20210520101346.16772-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210520101346.16772-2-steven_lee@aspeedtech.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 May 2021 01:25:31 +0000
Message-ID: <CACPK8XcSYgQKRp7C5gZ9LKekL0LCHYPDwjC49EDTEr5__T2M3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] ARM: dts: aspeed: ast2600evb: Add sdhci node and
 gpio regulator for A2 evb.
To: Steven Lee <steven_lee@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "moderated list:ASPEED SD/MMC DRIVER" <openbmc@lists.ozlabs.org>,
 "open list:ASPEED SD/MMC DRIVER" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Steven,

On Thu, 20 May 2021 at 10:16, Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600 A2(or newer) EVB has gpio regulators for toggling signal voltage
> between 3.3v and 1.8v, the patch adds sdhci node and gpio regulator in the
> new dts file and adds commment for describing the reference design.

spelling: comment

I need you to justify the separate dts for the A2 EVB.

What would happen if this device tree was loaded on to an A1 or A0?

Would this device tree be used for the A3 (and any future revision?)

An alternative proposal: we modify the ast2600-evb.dts to support the
A2 (which I assume would also support the A3).

If we need a separate board file for the A0 and A1 EVB, we add a new
one that supports these earlier revisions. Or we decide to only
support the latest revision in mainline.

>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts | 98 +++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts b/arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts
> new file mode 100644
> index 000000000000..d581e8069a82
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb-a2.dts
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2021 IBM Corp.
> +
> +#include "aspeed-ast2600-evb.dts"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       model = "AST2600 A2 EVB";
> +       compatible = "aspeed,ast2600";

Will this override the "aspeed,ast2600-evb" compatible in the dts? I
think you can drop the compatible string here and just use the one
from the DTS.

> +
> +       vcc_sdhci0: regulator-vcc-sdhci0 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "SDHCI0 Vcc";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&gpio0 168

We have macros for describing the GPIOs:

ASPEED_GPIO(V, 0)

> +                        GPIO_ACTIVE_HIGH>;

This can go on one line.

> +               enable-active-high;
> +       };
> +
> +       vccq_sdhci0: regulator-vccq-sdhci0 {
> +               compatible = "regulator-gpio";
> +               regulator-name = "SDHCI0 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&gpio0 169
> +                        GPIO_ACTIVE_HIGH>;
> +               gpios-states = <1>;
> +               states = <3300000 1>,
> +                        <1800000 0>;
> +       };
> +
> +       vcc_sdhci1: regulator-vcc-sdhci1 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "SDHCI1 Vcc";
> +               regulator-min-microvolt = <3300000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&gpio0 170
> +                        GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
> +       vccq_sdhci1: regulator-vccq-sdhci1 {
> +               compatible = "regulator-gpio";
> +               regulator-name = "SDHCI1 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               gpios = <&gpio0 171
> +                        GPIO_ACTIVE_HIGH>;
> +               gpios-states = <1>;
> +               states = <3300000 1>,
> +                        <1800000 0>;
> +       };
> +};
> +
> +&sdc {
> +       status = "okay";
> +};
> +
> +/*
> + * The signal voltage of sdhci0 and sdhci1 on AST2600-A2 EVB is able to be
> + * toggled by GPIO pins.
> + * In the reference design, GPIOV0 of AST2600-A2 EVB is connected to the
> + * power load switch that providing 3.3v to sdhci0 vdd, GPIOV1 is connected to
> + * a 1.8v and a 3.3v power load switch that providing signal voltage to

nit: provides

> + * sdhci0 bus.
> + * If GPIOV0 is active high, sdhci0 is enabled, otherwise, sdhci0 is disabled.
> + * If GPIOV1 is active high, 3.3v power load switch is enabled, sdhci0 signal
> + * voltage is 3.3v, otherwise, 1.8v power load switch will be enabled,
> + * sdhci0 signal voltage becomes 1.8v.
> + * AST2600-A2 EVB also support toggling signal voltage for sdhci1.

nit: supports

> + * The design is the same as sdhci0, it uses GPIOV2 as power-gpio and GPIOV3
> + * as power-switch-gpio.
> + */
> +&sdhci0 {
> +       status = "okay";
> +       bus-width = <4>;
> +       max-frequency = <100000000>;
> +       sdhci-drive-type = /bits/ 8 <3>;
> +       sdhci-caps-mask = <0x7 0x0>;
> +       sdhci,wp-inverted;
> +       vmmc-supply = <&vcc_sdhci0>;
> +       vqmmc-supply = <&vccq_sdhci0>;
> +       clk-phase-sd-hs = <7>, <200>;
> +};
> +
> +&sdhci1 {
> +       status = "okay";
> +       bus-width = <4>;
> +       max-frequency = <100000000>;
> +       sdhci-drive-type = /bits/ 8 <3>;
> +       sdhci-caps-mask = <0x7 0x0>;
> +       sdhci,wp-inverted;
> +       vmmc-supply = <&vcc_sdhci1>;
> +       vqmmc-supply = <&vccq_sdhci1>;
> +       clk-phase-sd-hs = <7>, <200>;
> +};
> +
> --
> 2.17.1
>
