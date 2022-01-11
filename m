Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D9F48AC10
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 12:00:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JY7545HQzz30H3
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 22:00:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N+MW1AOl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=N+MW1AOl; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JY74f2NDvz2ymZ;
 Tue, 11 Jan 2022 21:59:44 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id q14so18078714qtx.10;
 Tue, 11 Jan 2022 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHrbOrbls6RMwF4zXh/JucakSYo80NpW3Y1oPsSn0+A=;
 b=N+MW1AOl6r8OnoNgkE7IklzPbNXkOMm8DKxoSGLIlJl3g1xEfBdMpQfjcH0LUl5ZLl
 l9p06YQhns35PMs7qmp7Q3sAvIWerlgkmkJ3IoaA5RP8OkOAHpdEwUrqymW0/nvPUjhV
 MI/9Fj8wjVvZpNdcvDDXyz/a44ryDQ8X5UCq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHrbOrbls6RMwF4zXh/JucakSYo80NpW3Y1oPsSn0+A=;
 b=6G6q3i8sspi2Q3ea3VRSrf8sfVSw6IpFBPnuauZ/rMUlGkg+0x20FYcvI1nji2y6HG
 GaIk/LohrM5vydWQ27lvGWqCgJmh6U9wOp8xH2Q7h9BxSFVvS91wLLLnomY7Gk304Ke7
 twBAabG5S4l9JjhPJ5xG7f9QC5f/Hkn1qdBSHB4jEgCX3zjYidaCJ5gC42QFePs5bQVc
 XUIxMKSkgcqHkVi5kfmTncgE+yWuDfbshKuui/aJ8SVAdmL7h5enH/+XfnK7iuZp1pL6
 1T0Zt3ax7nRNBwlGXTwowdP5i8uxYrL3yECtMna2iBpHIqZG6cWTxTRqpqiI3DdW86zx
 jycA==
X-Gm-Message-State: AOAM530qTJoY/fUCwRI0b9R2BJ7Cnxb/wl+3DcOQ8JVNCR9EDLoKQCQk
 MTT+GG8Iy92+zU2Y7/ZzOI3LzNhtPCHtaCcjvZ3FUS8f
X-Google-Smtp-Source: ABdhPJwFsqlEroGN3U55JVWSumZqoKNo3s6q1iayFmqeYxyY4VyTbQDGFPPubUrEmX0irnNrB5YLROVH6FTznMWp9tw=
X-Received: by 2002:a05:622a:1044:: with SMTP id
 f4mr3122569qte.494.1641898780492; 
 Tue, 11 Jan 2022 02:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20220105101719.7093-1-zev@bewilderbeest.net>
In-Reply-To: <20220105101719.7093-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Jan 2022 10:59:28 +0000
Message-ID: <CACPK8XeHyoo0D1vQm=L8m284kC5n-O+FEMp1HN+ROWJfx7qjhQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC
To: Zev Weiss <zev@bewilderbeest.net>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Horman <neil.horman@privafy.com>,
 Olof Johansson <olof@lixom.net>, Anthony Jenkins <anthony.jenkins@privafy.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 5 Jan 2022 at 23:10, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This is a half-width, single-socket Epyc server board with an AST2500
> BMC.  This device tree is sufficient for basic OpenBMC functionality,
> but we'll need to add a few more devices (as driver support becomes
> available) before it's fully usable.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Have you considered using the openbmc gpio naming scheme for the
gpio-line-names?


> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-asrock-romed8hm3.dts  | 259 ++++++++++++++++++
>  2 files changed, 260 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 0de64f237cd8..4008d2143b44 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1481,6 +1481,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
> +       aspeed-bmc-asrock-romed8hm3.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
>         aspeed-bmc-facebook-cloudripper.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> new file mode 100644
> index 000000000000..e71ccfd1df63
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/{
> +       model = "ASRock ROMED8HM3 BMC v1.00";
> +       compatible = "asrock,romed8hm3-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=tty0 console=ttyS4,115200 earlycon";
> +       };
> +
> +       memory@80000000 {
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               heartbeat {
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "timer";
> +               };
> +
> +               system-fault {
> +                       gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +                       panic-indicator;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <100000000>; /* 100 MHz */
> +#include "openbmc-flash-layout-64.dtsi"
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&vuart {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0x2f8>;
> +       aspeed,lpc-interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +
> +       /* inlet temp sensor */
> +       w83773g@4c {
> +               compatible = "nuvoton,w83773g";
> +               reg = <0x4c>;
> +       };
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       /* IPB temp sensor */
> +       w83773g@4c {
> +               compatible = "nuvoton,w83773g";
> +               reg = <0x4c>;
> +       };
> +
> +       /* IPB PMIC */
> +       lm25066@40 {
> +               compatible = "lm25066";
> +               reg = <0x40>;
> +       };
> +
> +       /* 12VSB PMIC */
> +       lm25066@41 {
> +               compatible = "lm25066";
> +               reg = <0x41>;
> +       };
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
> +       /* Baseboard FRU eeprom */
> +       eeprom@50 {
> +               compatible = "st,24c128", "atmel,24c128";
> +               reg = <0x50>;
> +               pagesize = <16>;
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
> +&video {
> +       status = "okay";
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>;
> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xca2>;
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm3_default
> +               &pinctrl_pwm4_default
> +               &pinctrl_pwm5_default
> +               &pinctrl_pwm6_default>;
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03 0x0b>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04 0x0c>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05 0x0d>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06 0x0e>;
> +       };
> +};
> +
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +               /*  A */ "LOCATORLED_STATUS_N", "BMC_MAC2_INTB", "NMI_BTN_N", "BMC_NMI",
> +                       "", "", "", "",
> +               /*  B */ "DDR_MEM_TEMP", "", "", "", "", "", "", "",
> +               /*  C */ "", "", "", "", "PCIE_HP_SEL_N", "PCIE_SATA_SEL_N", "LOCATORBTN", "",
> +               /*  D */ "BMC_PSIN", "BMC_PSOUT", "BMC_RESETCON", "RESETCON",
> +                       "", "", "", "PSU_FAN_FAIL_N",
> +               /*  E */ "", "", "", "", "", "", "", "",
> +               /*  F */ "NIC_PWR_GOOD", "PRSNTB0", "PRSNTB1", "PRSNTB2",
> +                       "PRSNTB3", "", "3VSB_PCIE1_PG", "12V_PCIE1_PG",
> +               /*  G */ "HWM_BAT_EN", "CHASSIS_ID0", "CHASSIS_ID1", "CHASSIS_ID2",
> +                       "BMC_ALERT1_N_R", "BMC_ALERT2_N_R", "BMC_ALERT3_N", "BMC_ALERT4_N",
> +               /*  H */ "X24_C1_PRSNT", "X24_C2_PRSNT", "X24_C3_PRSNT", "FM_MEM_THERM_EVENT_BMC_R_N",
> +                       "FACMODE", "BMC_RTCRST", "BMC_HB_LED_N", "BMC_CASEOPEN",
> +               /*  I */ "", "", "", "", "", "", "", "",
> +               /*  J */ "BMC_READY", "BMC_PCH_BIOS_CS_N", "", "P0_MA_DDR_QS_CS_N",
> +                       "", "", "", "",
> +               /*  K */ "", "", "", "", "", "", "", "",
> +               /*  L */ "", "", "", "", "", "", "", "",
> +               /*  M */ "", "", "MEZZ_PWRBRK_N", "OCP_HP_RST_EN",
> +                       "MAIN_PWR_EN_G", "BMC_MAIN_EN", "AUX_PWR_EN_G", "BMC_AUX_EN",
> +               /*  N */ "", "", "", "", "", "", "", "",
> +               /*  O */ "", "", "", "", "", "", "", "",
> +               /*  P */ "", "", "", "", "", "", "", "",
> +               /*  Q */ "", "", "", "",
> +                       "BMC_SMB_PRESENT_1_N", "BMC_SMB_PRESENT_2_N",
> +                       "BMC_SMB_PRESENT_3_N", "BMC_PCIE_WAKE_N",
> +               /*  R */ "", "", "THERMALTRIP_CLEAR_N", "", "", "", "", "",
> +               /*  S */ "", "", "", "", "", "", "", "",
> +               /*  T */ "", "", "", "", "", "", "", "",
> +               /*  U */ "", "", "", "", "", "", "", "",
> +               /*  V */ "", "", "", "", "", "", "", "",
> +               /*  W */ "", "", "", "", "", "", "", "",
> +               /*  X */ "", "", "", "", "", "", "", "",
> +               /*  Y */ "SLP_S3", "SLP_S4_S5", "NODE_ID_1", "NODE_ID_2", "", "", "", "",
> +               /*  Z */ "", "", "SYSTEM_FAULT_LED_N", "FAST_THROTTLE_N",
> +                       "", "", "", "",
> +               /* AA */ "FM_CPU0_IBMC_THERMTRIP_N", "", "PROCHOT_L_G", "",
> +                       "", "", "", "",
> +               /* AB */ "BMC_FORCE_SELFREFRESH", "PWRGD_OUT", "", "IRQ_BMC_PCH_SMI_LPC_N",
> +                       "", "", "", "",
> +               /* AC */ "", "", "", "", "", "", "", "";
> +};
> +
> +&adc {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_adc0_default
> +               &pinctrl_adc1_default
> +               &pinctrl_adc2_default
> +               &pinctrl_adc3_default
> +               &pinctrl_adc4_default
> +               &pinctrl_adc5_default
> +               &pinctrl_adc6_default
> +               &pinctrl_adc7_default
> +               &pinctrl_adc8_default
> +               &pinctrl_adc9_default
> +               &pinctrl_adc10_default
> +               &pinctrl_adc11_default
> +               &pinctrl_adc12_default
> +               &pinctrl_adc13_default
> +               &pinctrl_adc14_default
> +               &pinctrl_adc15_default>;
> +};
> --
> 2.34.1
>
