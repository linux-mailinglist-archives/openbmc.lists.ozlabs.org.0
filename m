Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE89350D45
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 05:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9q4s5njLz30Cy
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 14:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ys55/Yc5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ys55/Yc5; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9q4Z6nVXz2yYn;
 Thu,  1 Apr 2021 14:51:58 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id z10so953747qkz.13;
 Wed, 31 Mar 2021 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G2UzKuCdp1j8anPgqYZtRd7WtA1gZSM9upkU0HaBZxs=;
 b=Ys55/Yc56xPgdVRXN/HBS4oQkCdVyEAfTsBTgt22jNI/ReUyHJC7Fivo6VgQTVCqXK
 F/LOIRBjNGoAUB9lQGIVJCYOX2D5CXOkD4yYxL64eWhS9nssupqqC5R9BKyRrUB4zo8W
 4xnpbdVNsRDDpFUYLRiqpsceODnK/2dQM8wIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G2UzKuCdp1j8anPgqYZtRd7WtA1gZSM9upkU0HaBZxs=;
 b=dVMZGXaiy+Zm64mWwA0HC7EOD+LFj8APOHONTLQeZPb8qg9AvVWfye0SotyYQt8c7A
 jNBOdCZVuuULy3UqON4QkTm2MZWq/2DCAwWl+iqruG7BfDhkEfyhIAl1O7/cP5FSsgA5
 ECZ79dLZfyvey0p99O6ba9Uv1OBNtMU6XeK6SGHqqwqjhliOqa25DsMEux7nJiNZa1b9
 XjncWxGs3XWRV1nyORMXF76hmiEqwUpQ651MxoZJ4OcNYqArFCVb31nNvo+RcWLNp14G
 oygwMiPB2wHQkEs1VjtGvdu2rAn+jtE8HruvgaEXWnl4xocpwkU5TPdTDe7ZLNhhPZz7
 WIQw==
X-Gm-Message-State: AOAM532tAibXcPZw+X62Ri4M3J882Et/JOVu5zsVVreNmCw4AIoOmzN5
 hE/lsV4NrLMFepUIfK5jTZWL4KGhSA/X8rhswbWZLLE10xOKItKT
X-Google-Smtp-Source: ABdhPJyPyUqt1LE98UHlWdEY70Fzzk2zIuvPWojOLPrtTopLJFCQ2ygWnNdRtshS4txlG2QtOIodDE5mmLwZT1wWiPA=
X-Received: by 2002:a37:a147:: with SMTP id k68mr6564933qke.66.1617249114564; 
 Wed, 31 Mar 2021 20:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfBsq6H5qsSNgwqdRhHXTUYnNQKekSNMnxXoVaAzMc=MQ@mail.gmail.com>
 <20210401025104.2278-1-zev@bewilderbeest.net>
In-Reply-To: <20210401025104.2278-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Apr 2021 03:51:42 +0000
Message-ID: <CACPK8Xcr+OauMH2NFSOKF7TZ2HDDnpqPvbnqg17YbKmhroqBMw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: add ASRock E3C246D4I BMC
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
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On Thu, 1 Apr 2021 at 02:57, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
> mini-ITX board that we hope can provide a decent platform for OpenBMC
> development.
>
> This initial device-tree provides the necessary configuration for
> basic BMC functionality such as host power control, serial console and
> KVM support, and POST code snooping.

The patch looks good! Some minor things below.

When sending subsequent versions, make sure to add -v N to your git
format-patch to mark it as the Nth version.

You've also set this to be threaded with a previous version of the
patch. We normally don't do that, and in this case it's doubly
confusing as you've split this patch out from the previous series.

I noticed you cc'd soc@kernel.org. We normally only do this when we
want the soc maintainers to apply a patch directly without going
through another maintainer. In this case the patch should go through
the aspeed maintainer's tree (me), so you don't need to cc that
address.

> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---

This spot just here is where you should put the changes between v1 and v2.

>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 202 ++++++++++++++++++
>  2 files changed, 203 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 8e5d4ab4e75e..b12911262ca1 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1406,6 +1406,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-ampere-mtjade.dtb \
>         aspeed-bmc-arm-centriq2400-rep.dtb \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
> +       aspeed-bmc-asrock-e3c246d4i.dts \

This should be the output name (.dtb).

>         aspeed-bmc-bytedance-g220a.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-galaxy100.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> new file mode 100644
> index 000000000000..dcab6e78dfa4
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts

The device tree itself looks good!

If you fix up the things I mentioned and send a v3 I will apply it.

Cheers,

Joel

> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
> +
> +/{
> +       model = "ASRock E3C246D4I BMC";
> +       compatible = "asrock,e3c246d4i-bmc", "aspeed,ast2500";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=tty0 console=ttyS4,115200 earlyprintk";
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
> +                       /* BMC_HB_LED_N */
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +                       linux,default-trigger = "timer";
> +               };
> +
> +               system-fault {
> +                       /* SYSTEM_FAULT_LED_N */
> +                       gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
> +                       panic-indicator;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               uid-button {
> +                       label = "uid-button";
> +                       gpios = <&gpio ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(F, 1)>;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
> +                       <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
> +                       <&adc 10>, <&adc 11>, <&adc 12>;
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
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&vuart {
> +       status = "okay";
> +       aspeed,sirq-active-high;
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       /* thermal sensor, one diode run to a disconnected header */
> +       w83773g@4c {
> +               compatible = "nuvoton,w83773g";
> +               reg = <0x4c>;
> +       };
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       /* FRU EEPROM */
> +       eeprom@57 {
> +               compatible = "st,24c128", "atmel,24c128";
> +               reg = <0x57>;
> +               pagesize = <16>;
> +       };
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
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +               /*  A */ "BMC_MAC1_INTB", "BMC_MAC2_INTB", "NMI_BTN_N", "BMC_NMI",
> +                       "", "", "", "",
> +               /*  B */ "", "", "", "", "", "IRQ_BMC_PCH_SMI_LPC_N", "", "",
> +               /*  C */ "", "", "", "", "", "", "", "",
> +               /*  D */ "BMC_PSIN", "BMC_PSOUT", "BMC_RESETCON", "RESETCON",
> +                       "", "", "", "",
> +               /*  E */ "", "", "", "", "", "", "", "",
> +               /*  F */ "LOCATORLED_STATUS_N", "LOCATORBTN", "", "",
> +                       "", "", "BMC_PCH_SCI_LPC", "BMC_NCSI_MUX_CTL",
> +               /*  G */ "HWM_BAT_EN", "CHASSIS_ID0", "CHASSIS_ID1", "CHASSIS_ID2",
> +                       "BMC_ALERT1_N_R", "BMC_ALERT2_N_R", "BMC_ALERT3_N", "SML0ALERT",
> +               /*  H */ "FM_ME_RCVR_N", "O_PWROK", "SKL_CNL_R", "D4_DIMM_EVENT_3V_N",
> +                       "MFG_MODE_N", "BMC_RTCRST", "BMC_HB_LED_N", "BMC_CASEOPEN",
> +               /*  I */ "", "", "", "", "", "", "", "",
> +               /*  J */ "BMC_READY", "BMC_PCH_BIOS_CS_N", "BMC_SMI", "",
> +                       "", "", "", "",
> +               /*  K */ "", "", "", "", "", "", "", "",
> +               /*  L */ "BMC_CTS1", "BMC_DCD1", "BMC_DSR1", "BMC_RI1",
> +                       "BMC_DTR1", "BMC_RTS1", "BMC_TXD1", "BMC_RXD1",
> +               /*  M */ "BMC_LAN0_DIS_N", "BMC_LAN1_DIS_N", "", "",
> +                       "", "", "", "",
> +               /*  N */ "", "", "", "", "", "", "", "",
> +               /*  O */ "", "", "", "", "", "", "", "",
> +               /*  P */ "", "", "", "", "", "", "", "",
> +               /*  Q */ "", "", "", "",
> +                       "BMC_SBM_PRESENT_1_N", "BMC_SBM_PRESENT_2_N",
> +                       "BMC_SBM_PRESENT_3_N", "BMC_PCIE_WAKE_N",
> +               /*  R */ "", "", "", "", "", "", "", "",
> +               /*  S */ "PCHHOT_BMC_N", "", "RSMRST",
> +                       "", "", "", "", "",
> +               /*  T */ "", "", "", "", "", "", "", "",
> +               /*  U */ "", "", "", "", "", "", "", "",
> +               /*  V */ "", "", "", "", "", "", "", "",
> +               /*  W */ "PS_PWROK", /* dummy always-high signal */
> +                       "", "", "", "", "", "", "",
> +               /*  X */ "", "", "", "", "", "", "", "",
> +               /*  Y */ "SLP_S3", "SLP_S5", "", "", "", "", "", "",
> +               /*  Z */ "CPU_CATERR_BMC_PCH_N", "", "SYSTEM_FAULT_LED_N", "BMC_THROTTLE_N",
> +                       "", "", "", "",
> +               /* AA */ "CPU1_THERMTRIP_LATCH_N", "", "CPU1_PROCHOT_N", "",
> +                       "", "", "IRQ_SMI_ACTIVE_N", "FM_BIOS_POST_CMPLT_N",
> +               /* AB */ "", "", "ME_OVERRIDE", "BMC_DMI_MODIFY",
> +                       "", "", "", "",
> +               /* AC */ "LAD0", "LAD1", "LAD2", "LAD3",
> +                       "CK_33M_BMC", "LFRAME", "SERIRQ", "S_PLTRST";
> +
> +       /* Assert BMC_READY so BIOS doesn't sit around waiting for it */
> +       bmc-ready {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(J, 0) GPIO_ACTIVE_LOW>;
> +               output-high;
> +       };
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
> +                       &pinctrl_adc12_default>;
> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xca2>;
> +};
> --
> 2.31.1
>
