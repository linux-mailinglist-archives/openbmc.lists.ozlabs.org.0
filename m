Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB004ED337
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 07:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTWrn487Kz2ygC
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 16:22:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MJmS+Xha;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MJmS+Xha; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTWrN1kPFz2xtJ
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 16:21:55 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id p25so18916269qkj.10
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 22:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FE+B87XydrLGLp193wpU4AGosuqIAX4WZikNl3I7dpQ=;
 b=MJmS+XhaGV0i0p9Xx6fpYNbY57TuhlmJKjCimoINv/YTzDZdIvTu3wGxnIv/o3gMbg
 LOIAkQ8SmNpvTJRIs5tyUy/nM+0jlDi+JOm6iL37lHXjk92WHAA36SCIvUa+7IA7oFSF
 H77fkUcU5Sx+NxQKppbZz/dc6j99tPMrV4zYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FE+B87XydrLGLp193wpU4AGosuqIAX4WZikNl3I7dpQ=;
 b=FE6nIrDyTy5EoTgu3kLhMRKbVBlzTnfW1CbWp2LNz5luQYksscxbsEijIG0Tsl0e3A
 of4xBq8lN6/NkIY/y9UnKP1IILUZdHOp6gdoIcTn1yzDZy9CWTW65y0EtzqXpw4bflav
 eJ4ey6VPxbD5POD/E8wLqh1ih1fk2KM27CtHsDmjLBKhZRLFmZTnqKEYHbGGbf1nCwGA
 CiiQ1lplLTJusDjctcU0lRYZfpTcJ/jPckm4pYuEY+c1XBs4hGc6FLXQVPeamZ1FNYjE
 Hkhvt/IuVwdoyuMPyokIzwXJjgTlE0051hoZhIw+BVG70oTPclDSMee0z5fhHf6fyrNh
 D5Tw==
X-Gm-Message-State: AOAM532YIHIY+WdWF1bFJ3sueOd0ldfiCl0OgQLiVVTbENwFBGDHHHKJ
 WkO1hi9pDeEdg4pWaAR2fByRCjhEeAc+WX96BEKfS3l3
X-Google-Smtp-Source: ABdhPJwWne9U91S5wu4dijS6vam44ldUV88B9JxzcoAmRhv4tY+c7/AoNuhmhqBrs7NO5MeIKuoytTGU/kTIH22PYZQ=
X-Received: by 2002:a05:620a:2ed:b0:680:a80e:c813 with SMTP id
 a13-20020a05620a02ed00b00680a80ec813mr2191634qko.243.1648704111844; Wed, 30
 Mar 2022 22:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220331030001.30102-1-zev@bewilderbeest.net>
In-Reply-To: <20220331030001.30102-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Mar 2022 05:21:39 +0000
Message-ID: <CACPK8Xf=YJX9R8yqWvKOTOV9znXMKe7AqWZM2EDGjyPxMA1=rA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 31 Mar 2022 at 03:00, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This is a half-width, single-socket Epyc server board with an AST2500
> BMC.  This device tree is sufficient for basic OpenBMC functionality,
> but we'll need to add a few more devices (as driver support becomes
> available) before it's fully usable.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>
> Joel, this is essentially the same patch as upstream commit
> a9a3d60b937a, though for the sake of simplicity I've also folded in
> the two small corrections I just sent earlier -- I'm not sure whether
> fewer patches (this approach) or ones that exactly match what's
> upstream is easier for you to deal with; if the latter let me know and
> I can resend them separately.
>
> Once this device tree is in openbmc/linux I'll get started on getting
> the meta-asrock/meta-romed8hm3 layer upstreamed.

Mergd, thanks. Squeezing them together is fine, as it saves me
applying three different patches.


>
>
> Thanks,
> Zev
>
>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-asrock-romed8hm3.dts  | 261 ++++++++++++++++++
>  2 files changed, 262 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index ec801dc22b61..120bae7d9997 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1462,6 +1462,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
> +       aspeed-bmc-asrock-romed8hm3.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
>         aspeed-bmc-facebook-bletchley.dtb \
>         aspeed-bmc-facebook-cloudripper.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> new file mode 100644
> index 000000000000..ff4c07c69af1
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> @@ -0,0 +1,261 @@
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
> +               shunt-resistor-micro-ohms = <1000>;
> +       };
> +
> +       /* 12VSB PMIC */
> +       lm25066@41 {
> +               compatible = "lm25066";
> +               reg = <0x41>;
> +               shunt-resistor-micro-ohms = <10000>;
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
> +               /*  B */ "POST_COMPLETE_N", "", "", "", "", "", "", "",
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
> 2.35.1
>
