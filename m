Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981940319F
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 01:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H422S2C6cz2yMg
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 09:45:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VFSR5Hl5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=VFSR5Hl5; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H422404Hyz2xjR
 for <openbmc@lists.ozlabs.org>; Wed,  8 Sep 2021 09:45:15 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id c8so1126177lfi.3
 for <openbmc@lists.ozlabs.org>; Tue, 07 Sep 2021 16:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHbn2vxCOuJ2iU1MUjkJjsUgBsO35bqjTp8f/owJZOQ=;
 b=VFSR5Hl5icKkBxnyKMqIp1sAX8hN8L0a1UpU38/xMmKeXp3AY0mVZKTScGVTPLEPSL
 qwIZ/EuqeEe2dVtAIWVh1dmKssgOgyqGc63Hg686vJ8ldd9CNhYIgT8j/UjD/LngOuUd
 oQ2q+D+ode1SqJBWSJGNGSm2hT3UMRYQRgDutTOekhcYQps9JOjwfJ3wgFT26plGGQ2f
 VbU884yGP8BNYjVWn8A18UXYcw8Boq4EMYRGrKloWC5Ulg+ik1YqCgMFLGvbGpinHwe/
 ZQjfl7q/PPPl2loVxFUsJ9ar3G7bB9JvnYZwIzOgdlcnwn/7GpiL9R455cEBDay33Atb
 W1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHbn2vxCOuJ2iU1MUjkJjsUgBsO35bqjTp8f/owJZOQ=;
 b=iTROgLLZlC8BGXnPCxX3FxdSwRp4T5GdLi07M8fBZVnKMCi1diEtOGlO0Irwf7fyNl
 ajEugsu3ME3zZJQ/IHf4/X9pp5aD6HgT3dcgpWM0iUOFx0W4iZIdxZQErig1vAHx8Y1q
 ThCjrh+bG+/4g/bn5sBaoR5TAWH4MeeTCPj1ccAGvHpLHQwmtLiDeogPzVCpxWNrWtKm
 K1dOAQfdx18dXm8PKlS4aY3tuSlpl6gfwp8CJugvjHOvuwrx2/PS/JnUIoQ/YLETUHTf
 Jm/gq6rxJ3bbRzi3VjMIdiBujsn3JxcsZywJFYomYt0wXWgB7VwCEm2j25wBMPfAI9IL
 UmTQ==
X-Gm-Message-State: AOAM530wO15iUmeqdW3kvWnHIdJhFpjNveVXB4CACojL6BT1241yD8Yy
 tne4ouCgDmT5RO3pLCI5n/FLpKMNBt3F7IFuc/s5AQHfvvXg7cBu
X-Google-Smtp-Source: ABdhPJzk5MNi4qN3WlMtub09tTE/pn89I/WfWPl6EqzV5aUuJbXult5m6MX1mzM10GnvzGR1iA9LEFYtFbt+nYguVqA=
X-Received: by 2002:ac2:598a:: with SMTP id w10mr617420lfn.179.1631058311066; 
 Tue, 07 Sep 2021 16:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210907205200.1193552-1-osk@google.com>
In-Reply-To: <20210907205200.1193552-1-osk@google.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 7 Sep 2021 19:44:55 -0400
Message-ID: <CABoTLcTTk_wfGbFHrwKrLcKdtpMKqUnt2KijNPvYhpEo_+7M6w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10] ARM: dts: aspeed: Add TYAN S7106 BMC
 machine
To: openbmc@lists.ozlabs.org, joel@jms.id.au
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
Cc: Ed Tanous <ed@tanous.net>, Vijay Khemka <vijaykhemkalinux@gmail.com>,
 Jason Hargis <jason.hargis@equuscs.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'm working with Joel Stanley <joel@jms.id.au> on the review of the
upstream change, so this commit can be ignored for now. I'll re-send
as V2 as soon as the upstream change is complete.

Oskar.

On Tue, Sep 7, 2021 at 4:52 PM Oskar Senft <osk@google.com> wrote:
>
> The TYAN S7106 is a server platform with an ASPEED AST2500 BMC.
>
> Submitted to upstream in
> https://lists.ozlabs.org/pipermail/linux-aspeed/2021-September/006326.html
>
> Signed-off-by: Oskar Senft <osk@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 415 ++++++++++++++++++++
>  1 file changed, 415 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> new file mode 100644
> index 000000000000..292bfb1a4bb2
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "Tyan S7106 BMC";
> +       compatible = "tyan,s7106-bmc", "aspeed,ast2500";
> +
> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               p2a_memory: region@987F0000 {
> +                       no-map;
> +                       reg = <0x987F0000 0x00010000>; /* 64KB */
> +               };
> +
> +               vga_memory: framebuffer@9f000000 {
> +                       no-map;
> +                       reg = <0x9f000000 0x01000000>; /* 16M */
> +               };
> +
> +               gfx_memory: framebuffer {
> +                       size = <0x01000000>; /* 16M */
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               heartbeat {
> +                       gpios = <&gpio ASPEED_GPIO(E, 7) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                       <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                       <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                       <&adc 12>, <&adc 13>, <&adc 14>;
> +       };
> +
> +       iio-hwmon-battery {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 15>;
> +       };
> +};
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               label = "bmc";
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
> +
> +       flash@0 {
> +               status = "okay";
> +               label = "pnor";
> +               m25p,fast-read;
> +       };
> +};
> +
> +&uart1 {
> +       /* Rear RS-232 connector */
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd1_default
> +                       &pinctrl_rxd1_default>;
> +};
> +
> +&uart2 {
> +       /* RS-232 connector on header */
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd2_default
> +                       &pinctrl_rxd2_default>;
> +};
> +
> +&uart3 {
> +       /* Alternative to vuart to internally connect (route) to uart1
> +        * when vuart cannot be used due to BIOS limitations.
> +        */
> +       status = "okay";
> +};
> +
> +&uart4 {
> +       /* Alternative to vuart to internally connect (route) to the
> +        * external port usually used by uart1 when vuart cannot be
> +        * used due to BIOS limitations.
> +        */
> +       status = "okay";
> +};
> +
> +&uart5 {
> +       /* BMC "debug" (console) UART; connected to RS-232 connector
> +        * on header; selectable via jumpers as alternative to uart2
> +        */
> +       status = "okay";
> +};
> +
> +&vuart {
> +       status = "okay";
> +};
> +
> +&lpc_ctrl {
> +       status = "okay";
> +};
> +
> +&p2a {
> +       status = "okay";
> +       memory-region = <&p2a_memory>;
> +};
> +
> +&lpc_snoop {
> +       status = "okay";
> +       snoop-ports = <0x80>;
> +};
> +
> +&adc {
> +       status = "okay";
> +};
> +
> +&vhub {
> +       status = "okay";
> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default
> +                       &pinctrl_pwm1_default
> +                       &pinctrl_pwm3_default
> +                       &pinctrl_pwm4_default>;
> +
> +       /* CPU fan #0 */
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +       };
> +
> +       /* CPU fan #1 */
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
> +       };
> +
> +       /* PWM group for chassis fans #1, #2, #3 and #4  */
> +       fan@2 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
> +       };
> +
> +       /* PWM group for chassis fans #5 and #6  */
> +       fan@6 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
> +       };
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +
> +       /* Hardware monitor with temperature sensors */
> +       nct7802@28 {
> +               compatible = "nuvoton,nct7802";
> +               reg = <0x28>;
> +       };
> +
> +       /* Also connected to:
> +        * - IPMB pin header
> +        * - CPU #0 memory error LED @ 0x3A
> +        * - CPU #1 memory error LED @ 0x3C
> +        */
> +};
> +
> +&i2c1 {
> +       /* Directly connected to PCH SMBUS #0 */
> +       status = "okay";
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +
> +       /* BMC EEPROM, incl. mainboard FRU */
> +       eeprom@50 {
> +               compatible = "atmel,24c256";
> +               reg = <0x50>;
> +       };
> +
> +       /* Also connected to:
> +        * - fan header
> +        * - mini-SAS HD connector
> +        * - SSATA SGPIO
> +        * - via switch (BMC_SMB3_PCH_IE_SML3_EN, active low) to PCH SMBUS #3
> +        */
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       /* PSU1 FRU @ 0xA0 */
> +       eeprom@50 {
> +               compatible = "atmel,24c02";
> +               reg = <0x50>;
> +       };
> +
> +       /* PSU2 FRU @ 0xA2 */
> +       eeprom@51 {
> +               compatible = "atmel,24c02";
> +               reg = <0x51>;
> +       };
> +
> +       /* PSU1 @ 0xB0 */
> +       power-supply@58 {
> +               compatible = "pmbus";
> +               reg = <0x58>;
> +       };
> +
> +       /* PSU2 @ 0xB2 */
> +       power-supply@59 {
> +               compatible = "pmbus";
> +               reg = <0x59>;
> +       };
> +
> +       /* Also connected to:
> +        * - PCH SMBUS #1
> +        */
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       /* Connected to:
> +        * - PCH SMBUS #2
> +        */
> +
> +       /* Connected via switch to:
> +        * - CPU #0 channels ABC VDDQ @ 0x80
> +        * - CPU #0 channels DEF VDDQ @ 0x81
> +        * - CPU #1 channels ABC VDDQ @ 0x82
> +        * - CPU #1 channels DEF VDDQ @ 0x83
> +        * - CPU #0 VCCIO & VMCP @ 0x52
> +        * - CPU #1 VCCIO & VMCP @ 0x53
> +        * - CPU #0 VCCIN @ 0xC0
> +        * - CPU #0 VSA @ 0xC2
> +        * - CPU #1 VCCIN @ 0xC4
> +        * - CPU #1 VSA @ 0xC6
> +        * - J110
> +        */
> +};
> +
> +&i2c5 {
> +       status = "okay";
> +
> +       /* Connected via switch (PCH_BMC_SMB_SW_P) to:
> +        * - mainboard FRU @ 0xAE
> +        * - XDP connector
> +        * - ME debug header
> +        * - clock buffer @ 0xD8
> +        * - i2c4 via switch (PCH_VR_SMBUS_SW_P; controlled by PCH)
> +        * - PCH SMBUS
> +        */
> +};
> +
> +&i2c6 {
> +       status = "okay";
> +
> +       /* Connected via switch (BMC_PE_SMB_EN_1_N) to
> +        * bus mux (selector BMC_PE_SMB_SW_BIT[1..0]) to:
> +        * - 0,0: PCIE slot 1, SMB #1
> +        * - 0,1: PCIE slot 1, SMB #2
> +        * - 1,0: PCIE slot 2, SMB #1
> +        * - 1,1: PCIE slot 2, SMB #2
> +        */
> +
> +       /* Connected via switch (BMC_PE_SMB_EN_2_N) to
> +        * bus mux (selector BMC_PE_SMB_SW_BIT[1..0]) to:
> +        * - 0,0: OCP0 (A) SMB
> +        * - 0,1: OCP0 (C) SMB
> +        * - 1,0: OCP1 (A) SMB
> +        * - 1,1: NC
> +        */
> +};
> +
> +&i2c7 {
> +       status = "okay";
> +
> +       /* Connected to:
> +        * - PCH SMBUS #4
> +        */
> +};
> +
> +&i2c8 {
> +       status = "okay";
> +
> +       /* Not connected */
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       use-ncsi;
> +       no-hw-checksum;
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rmii1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&ibt {
> +       status = "okay";
> +};
> +
> +&kcs1 {
> +       status = "okay";
> +       kcs_addr = <0xca8>;
> +};
> +
> +&kcs3 {
> +       status = "okay";
> +       kcs_addr = <0xca2>;
> +};
> +
> +&gfx {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> +
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","IDLED_N","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "","","","","ID_BUTTON","POST_COMPLETE","","",
> +       /*D0-D7*/       "","","PS_PWROK","PLTRST_N","","","","",
> +       /*E0-E7*/       "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
> +                                       "NMI_BUTTON","NMI_OUT","","HEARTBEAT_LED_N",
> +       /*F0-F7*/       "","CLEAR_CMOS_N","","","IPMI_ALERT_LED_N","","","",
> +       /*G0-G7*/       "BMC_PE_SMB_EN_1_N","BMC_PE_SMB_EN_2_N","","","","","","",
> +       /*H0-H7*/       "","","","","","","","",
> +       /*I0-I7*/       "","","","","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "","","","","","","","",
> +       /*M0-M7*/       "","","","","","","","",
> +       /*N0-N7*/       "","","","","","","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","","","","",
> +       /*Q0-Q7*/       "","","","","BMC_PE_SMB_SW_BIT0","BMC_PE_SMB_SW_BIT1","","",
> +       /*R0-R7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","","","","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","","","",
> +       /*V0-V7*/       "","","","","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","","","","","",
> +       /*Y0-Y7*/       "","","","","","","","",
> +       /*Z0-Z7*/   "","","","","","","","",
> +       /*AA0-AA7*/     "","","","BMC_SMB3_PCH_IE_SML3_EN","","","","",
> +       /*AB0-AB7*/     "","","","","","","","";
> +};
> --
> 2.33.0.309.g3052b89438-goog
>
