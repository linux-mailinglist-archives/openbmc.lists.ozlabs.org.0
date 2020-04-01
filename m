Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641519AB83
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 14:19:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48slch4CphzDr7m
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 23:19:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mnWZ82pq; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48slbZ287KzDqXJ;
 Wed,  1 Apr 2020 23:18:33 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id j4so26654949qkc.11;
 Wed, 01 Apr 2020 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cYgn6RQydhxEk4Yg/z1Bm/e2sVRk32p5oBa766QTAqk=;
 b=mnWZ82pqNPv0UXH2JHl3te3MYxNR553fID3X8WrACZm/1J602MoPR+mcCg7AmszPk3
 zssmg/U6SuCeVojy8fm8nFWdO86Q13xCaXNse6jfC+hFTyOQL6btumPCb886B1/XsMJJ
 Z343d2vMO94W49HMLzzXhHZChM6iTfzz+WX90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cYgn6RQydhxEk4Yg/z1Bm/e2sVRk32p5oBa766QTAqk=;
 b=HNdn2aL2S631cZ7z618PDL1p/Mozu3V2hzL24ZzTgcXsHe5mamJB2RT5NLDKNjVwOi
 /gZOjf6P0Od6gXZXkeEMDWs7gC0kFAzkFvZptvG9yAaHRynP9qY+Jk8M+GS6R30+okVj
 A+rF9TobV+lltsRu9OEmfbFDugPyQJH5hQI1WgOenNN0Wq6tws+QJTNNZjRXC3R3O3rt
 N9sRJyPydXJeHPIE8YrVGzKeNuGfu/9V35cPoEP8v9nsyQcr61ZpSAkHIdlngXuMIi7t
 Z8UbNhWNesd18ru+ippazRydgDDpHIyZi/ldGzgqFciSi/NwtzTRPgupzk6yZzjwm5jE
 0fIQ==
X-Gm-Message-State: ANhLgQ0AA/l18HpQbt5dal1TZYo48/qJ/5Xe2NmQSqt2HMGgmhYYtMAq
 xe3CtGPRLJgCKuElDSci/8/WyV76vDUS2eQq5vc=
X-Google-Smtp-Source: ADFU+vsGJIiZgzJs5OL/Q4JZje/tqiDApfEfPU29WwaxIGq+J9716ZkBiwCe7NGvvIhWTP92hnvGqh2b7LnBXWG2nyg=
X-Received: by 2002:a37:61d0:: with SMTP id v199mr9555105qkb.292.1585743508846; 
 Wed, 01 Apr 2020 05:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200401114023.GA29180@cnn>
In-Reply-To: <20200401114023.GA29180@cnn>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2020 12:18:17 +0000
Message-ID: <CACPK8Xf+EOUk-HroNmPe5Pjgu6BdP8VU-m6mxQMpTtL1CYBn=A@mail.gmail.com>
Subject: Re: [PATCH v7] ARM: dts: aspeed: Adding Facebook Yosemite V2 BMC
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, manikandan.e@hcl.com,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 1 Apr 2020 at 11:40, Manikandan Elumalai
<manikandan.hcl.ers.epl@gmail.com> wrote:
>
> The Yosemite V2 is a facebook multi-node server
> platform that host four OCP server. The BMC
> in the Yosemite V2 platform based on AST2500 SoC.
>
> This patch adds linux device tree entry related to
> Yosemite V2 specific devices connected to BMC SoC.
>
> Signed-off-by: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
> Acked-by     : Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by  : Vijay Khemka <vkhemka@fb.com>
> ---
> ---      v7 - Added multi-host SOL feature.
> ---      v6 - Added device tree property for multi-host Mellanox NIC in the ncsi driver.
> ---      v5 - Spell and contributor name correction.
> ---           - License identifier changed to GPL-2.0-or-later.
> ---           - aspeed-gpio.h removed.
> ---           - FAN2 tacho channel changed.
> ---      v4 - Bootargs removed.
> ---      v3 - Uart1 Debug removed .
> ---      v2 - LPC and VUART removed .
> ---      v1 - Initial draft.
> ---
> ---
>  .../boot/dts/aspeed-bmc-facebook-yosemitev2.dts    | 186 +++++++++++++++++++++

You need to add the device tree to the makefile.

>  1 file changed, 186 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> new file mode 100644
> index 0000000..bc83901
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2018 Facebook Inc.
> +/dts-v1/;
> +#include "aspeed-g5.dtsi"
> +
> +/ {
> +       model = "Facebook Yosemitev2 BMC";
> +       compatible = "facebook,yosemitev2-bmc", "aspeed,ast2500";
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +       chosen {
> +               stdout-path = &uart5;
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       iio-hwmon {
> +               // VOLATAGE SENSOR
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0> , <&adc 1> , <&adc 2> ,  <&adc 3> ,
> +               <&adc 4> , <&adc 5> , <&adc 6> ,  <&adc 7> ,
> +               <&adc 8> , <&adc 9> , <&adc 10>, <&adc 11> ,
> +               <&adc 12> , <&adc 13> , <&adc 14> , <&adc 15> ;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_spi1_default>;
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "pnor";
> +       };
> +};
> +&uart1 {
> +       // Host1 Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                    &pinctrl_rxd1_default>;
> +};
> +
> +&uart2 {
> +       // Host2 Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default
> +                    &pinctrl_rxd2_default>;
> +
> +};
> +
> +&uart3 {
> +       // Host3 Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd3_default
> +                    &pinctrl_rxd3_default>;
> +};
> +
> +&uart4 {
> +       // Host4 Console
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd4_default
> +                    &pinctrl_rxd4_default>;
> +};
> +
> +&uart5 {
> +       // BMC Console
> +       status = "okay";
> +};
> +
> +&vuart {
> +       // Virtual UART
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +       use-ncsi;
> +       mlx,multi-host;
> +};
> +
> +&adc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +                       &pinctrl_adc1_default
> +                       &pinctrl_adc2_default
> +                       &pinctrl_adc3_default
> +                       &pinctrl_adc4_default
> +                       &pinctrl_adc5_default
> +                       &pinctrl_adc6_default
> +                       &pinctrl_adc7_default
> +                       &pinctrl_adc8_default
> +                       &pinctrl_adc9_default
> +                       &pinctrl_adc10_default
> +                       &pinctrl_adc11_default
> +                       &pinctrl_adc12_default
> +                       &pinctrl_adc13_default
> +                       &pinctrl_adc14_default
> +                       &pinctrl_adc15_default>;
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +       //FRU EEPROM
> +       eeprom@51 {
> +               compatible = "atmel,24c64";
> +               reg = <0x51>;
> +               pagesize = <32>;
> +       };
> +};
> +
> +&i2c9 {
> +       status = "okay";
> +       tmp421@4e {
> +       //INLET TEMP
> +               compatible = "ti,tmp421";
> +               reg = <0x4e>;
> +       };
> +       //OUTLET TEMP
> +       tmp421@4f {
> +               compatible = "ti,tmp421";
> +               reg = <0x4f>;
> +       };
> +};
> +
> +&i2c10 {
> +       status = "okay";
> +       //HSC
> +       adm1278@40 {
> +               compatible = "adi,adm1278";
> +               reg = <0x40>;
> +       };
> +};
> +
> +&i2c11 {
> +       status = "okay";
> +       //MEZZ_TEMP_SENSOR
> +       tmp421@1f {
> +               compatible = "ti,tmp421";
> +               reg = <0x1f>;
> +       };
> +};
> +
> +&i2c12 {
> +       status = "okay";
> +       //MEZZ_FRU
> +       eeprom@51 {
> +               compatible = "atmel,24c64";
> +               reg = <0x51>;
> +               pagesize = <32>;
> +       };
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       //FSC
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +};
> --
> 2.7.4
>
