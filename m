Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C302EEBB9
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 04:13:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBp8964XxzDqvg
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 14:13:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CbP6W+uW; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBp7Q5ltJzDqHJ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Jan 2021 14:12:34 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id b64so7383145qkc.12
 for <openbmc@lists.ozlabs.org>; Thu, 07 Jan 2021 19:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M37/RtQrbJESNmSL5AF8ggo9EyVIbBFpZbHhXZkRDiY=;
 b=CbP6W+uWC4Qxgl5pcoiuEGcCLmZTr9ZdqjgGihJl6Gt9mf1mCEqLZnLptQnp0zbKKw
 9g5lfdWKeI4OGfrEhfCJ8czgUVCGkB5RC820hW7PFBM1ZkOcwyS9LaqGlqbyDG1fKL3+
 IC7kBxssg1lxVFCeZj5bhh12zd1tF75hFsnfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M37/RtQrbJESNmSL5AF8ggo9EyVIbBFpZbHhXZkRDiY=;
 b=AuFmy3QIAJWTBXJI9O2ZM7kEQ8Dv9ieuQQyrPm0G77LTk1VtwduISFhjhIBDEfYpS7
 3BGNg/uPu/hRt0qTnBleLSj/C6boIfTjkWbn0F/1wBSgfFE0iy05oGH7xzPgSgh1HQqW
 DsQfnnu50OnpKwSQsTLzg7O+v8z4gDHasjt7RNPl9Ja3HJwwj0LqWfWuQY4u0GR7SzUy
 ZD7leL/EI8CSMyuy8MIeDfsNEB9uz51IQQlG7zRwYTgc5OsSOcfK9ZvSJ58NPpHLOkx1
 NirMkS5/SaiqvVnFkNZd/tUNA8m5h8SvG71KH8weeYxlCvi6CiGAKgW8yIJ6yZHbBi/s
 yXnw==
X-Gm-Message-State: AOAM5309YsEKoVf1hGR1i/TRz7ofqd9QuYFenZkHjW3FHVDm6y0kI9vT
 FO2GGvNny5rJXFoHOlnE23AUvqLGhBc/LkcL0EI=
X-Google-Smtp-Source: ABdhPJzL+m+yyEiowmQVJmIi3guHgDwX9XaDu2v8aCV3WBja2uITAF5ThWHJ3XtaXJed4su4Xzn2QVM/ipDJx4wYXzY=
X-Received: by 2002:a37:a085:: with SMTP id j127mr2031779qke.273.1610075550944; 
 Thu, 07 Jan 2021 19:12:30 -0800 (PST)
MIME-Version: 1.0
References: <1609990909-18189-1-git-send-email-willie_thai@compal.com>
In-Reply-To: <1609990909-18189-1-git-send-email-willie_thai@compal.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jan 2021 03:12:18 +0000
Message-ID: <CACPK8Xd0aMcXrUD4YLWHMSz9rb7p0KKQGVCHRxFWdajGXcgLZg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Liwu2 BMC
To: Willie Thai <williethaitu@gmail.com>
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
Cc: willie <willie_thai@compal.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 7 Jan 2021 at 03:42, Willie Thai <williethaitu@gmail.com> wrote:
>
> From: willie <willie_thai@compal.com>

Please add a short description of the machine you're adding. Take a
look at the git history for other BMC machines to see what I mean.

>
> ---
>  arch/arm/boot/dts/Makefile                    |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts | 605 ++++++++++++++++++++++++++
>  2 files changed, 607 insertions(+), 1 deletion(-)
>  create mode 100755 arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 5a14adc..8ccb5d3 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1381,4 +1381,5 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
> -       aspeed-bmc-supermicro-x11spi.dtb
> +       aspeed-bmc-supermicro-x11spi.dtb \
> +       aspeed-bmc-compal-liwu2.dtb

This should be sorted alphabetically.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> new file mode 100755
> index 0000000..5882b42
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-compal-liwu2.dts
> @@ -0,0 +1,605 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/dts-v1/;
> +
> +#include "aspeed-g5.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model = "AST2500 liwu2";
> +       compatible = "aspeed,ast2500";
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
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               gfx_memory: framebuffer {

Are you sure you're using this device? This is the BMC's internal
graphics device, not the one that is attached to the host over PCI. If
you're only using host graphics then you don't need this node.

> +                       size = <0x01000000>;
> +                       alignment = <0x01000000>;
> +                       compatible = "shared-dma-pool";
> +                       reusable;
> +               };
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
> +                             <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
> +                             <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>,
> +                             <&adc 12>, <&adc 13>, <&adc 14>, <&adc 15>;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               LED_FAN0_FAULT {
> +                       label = "LED_FAN0_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN1_FAULT {
> +                       label = "LED_FAN1_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(F, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN2_FAULT {
> +                       label = "LED_FAN2_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN3_FAULT {
> +                       label = "LED_FAN3_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN4_FAULT {
> +                       label = "LED_FAN4_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               LED_FAN5_FAULT {
> +                       label = "LED_FAN5_FAULT";
> +                       gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               FP_LED_STATUS_AMBER_N {
> +                       label = "FP_LED_STATUS_AMBER_N";
> +                       gpios = <&gpio ASPEED_GPIO(S, 5) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               REAR_ID_LED_N {
> +                       label = "REAR_ID_LED_N";
> +                       gpios = <&gpio ASPEED_GPIO(S, 6) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               poll-interval = <1000>;
> +
> +               FM_SYS_FAN0_PRSNT_D_N {
> +                       label = "FM_SYS_FAN0_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(M, 0) GPIO_ACTIVE_LOW>;

The internal GPIO device can generate interrupts, so you don't need to
use gpio-keys-polled, you should be able to use gpio-keys. This should
be fixed before merging your device tree.

Secondly, you shouldn't need to use gpio-keys at all, as you can use
the gpio chardev interface to be notified in userspace when a pin
changes level. This is a mistake that many openbmc systems have made,
so while I recommend you fix your userspace, it will not block the
merging of this patch.

> +                       linux,code = <ASPEED_GPIO(M, 0)>;
> +               };
> +
> +               FM_SYS_FAN1_PRSNT_D_N {
> +                       label = "FM_SYS_FAN1_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(M, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(M, 1)>;
> +               };
> +
> +               FM_SYS_FAN2_PRSNT_D_N {
> +                       label = "FM_SYS_FAN2_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(M, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(M, 2)>;
> +               };
> +
> +               FM_SYS_FAN3_PRSNT_D_N {
> +                       label = "FM_SYS_FAN3_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(M, 3) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(M, 3)>;
> +               };
> +
> +               FM_SYS_FAN4_PRSNT_D_N {
> +                       label = "FM_SYS_FAN4_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(M, 4) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(M, 4)>;
> +               };
> +
> +               FM_SYS_FAN5_PRSNT_D_N {
> +                       label = "FM_SYS_FAN5_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(M, 5) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(M, 5)>;
> +               };
> +
> +               FM_SYS_FAN6_PRSNT_D_N {
> +                       label = "FM_SYS_FAN6_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(S, 7) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(S, 7)>;
> +               };
> +
> +               FM_SYS_FAN7_PRSNT_D_N {
> +                       label = "FM_SYS_FAN7_PRSNT_D_N";
> +                       gpios = <&gpio ASPEED_GPIO(AB, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(AB, 1)>;
> +               };
> +       };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +               // A0-A7
> +               BMC_SEL_M2_SATA_PCIE {
> +                       label = "BMC_SEL_M2_SATA_PCIE";
> +                       gpios = <&gpio ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(A, 0)>;
> +               };
> +
> +               PD_RMII_BMC_MDC {
> +                       label = "PD_RMII_BMC_MDC";
> +                       gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(A, 6)>;
> +               };
> +
> +               PD_RMII_BMC_MDIO {
> +                       label = "PD_RMII_BMC_MDIO";
> +                       gpios = <&gpio ASPEED_GPIO(A, 7) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(A, 7)>;
> +               };
> +               // B0-B7
> +               VR_PVCCIN_PVCCSA_CPU1_FAULT_N {
> +                       label = "VR_PVCCIN_PVCCSA_CPU1_FAULT_N";
> +                       gpios = <&gpio ASPEED_GPIO(B, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(B, 0)>;
> +               };
> +
> +               VR_PVCCIN_PVCCSA_CPU2_FAULT_N {
> +                       label = "VR_PVCCIN_PVCCSA_CPU2_FAULT_N";
> +                       gpios = <&gpio ASPEED_GPIO(B, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(B, 1)>;
> +               };
> +
> +               VR_PVCCIO_CPU1_FAULT_N {
> +                       label = "VR_PVCCIO_CPU1_FAULT_N";
> +                       gpios = <&gpio ASPEED_GPIO(B, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(B, 2)>;
> +               };
> +
> +               VR_PVCCIO_CPU2_FAULT_N {
> +                       label = "VR_PVCCIO_CPU2_FAULT_N";
> +                       gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(B, 3)>;
> +               };
> +
> +               NC_CLK_48M_USB_NMC_R2 {
> +                       label = "NC_CLK_48M_USB_NMC_R2";
> +                       gpios = <&gpio ASPEED_GPIO(B, 4) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(B, 4)>;
> +               };
> +
> +               PU_BMC_GPIOB6 {
> +                       label = "PU_BMC_GPIOB6";
> +                       gpios = <&gpio ASPEED_GPIO(B, 6) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(B, 6)>;
> +               };
> +
> +               NC_BMC_GPIOB7 {
> +                       label = "NC_BMC_GPIOB7";
> +                       gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(B, 7)>;
> +               };
> +               // C0-C7
> +               PROJECT_REV_ID0 {
> +                       label = "PROJECT_REV_ID0";
> +                       gpios = <&gpio ASPEED_GPIO(C, 0) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 0)>;
> +               };
> +
> +               PROJECT_REV_ID1 {
> +                       label = "PROJECT_REV_ID1";

I'm reading this and wondering why you need to expose the ID pins as a
input event. Are you aware that you can and should read GPIO state
without exposing them as gpio-keys?

> +                       gpios = <&gpio ASPEED_GPIO(C, 1) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 1)>;
> +               };
> +
> +               PROJECT_REV_ID2 {
> +                       label = "PROJECT_REV_ID2";
> +                       gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 2)>;
> +               };
> +
> +               PCB_REV_ID0 {
> +                       label = "PCB_REV_ID0";
> +                       gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 3)>;
> +               };
> +
> +               PCB_REV_ID1 {
> +                       label = "PCB_REV_ID1";
> +                       gpios = <&gpio ASPEED_GPIO(C, 4) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 4)>;
> +               };
> +
> +               PCB_REV_ID2 {
> +                       label = "PCB_REV_ID2";
> +                       gpios = <&gpio ASPEED_GPIO(C, 5) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 5)>;
> +               };
> +
> +               NC_BMC_GPIOC6 {
> +                       label = "NC_BMC_GPIOC6";
> +                       gpios = <&gpio ASPEED_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 6)>;
> +               };
> +
> +               NC_BMC_GPIOC7 {
> +                       label = "NC_BMC_GPIOC7";
> +                       gpios = <&gpio ASPEED_GPIO(C, 7) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(C, 7)>;
> +               };
> +               // D0-D7
> +               FM_FORCE_BMC_UPDATE_N {
> +                       label = "FM_FORCE_BMC_UPDATE_N";
> +                       gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(D, 0)>;
> +               };
> +
> +               RST_RSTB_BMC_R_N {
> +                       label = "RST_RSTB_BMC_R_N";
> +                       gpios = <&gpio ASPEED_GPIO(D, 1) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(D, 1)>;
> +               };
> +
> +               NC_BMC_GPIOD2 {
> +                       label = "NC_BMC_GPIOD2";
> +                       gpios = <&gpio ASPEED_GPIO(D, 2) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(D, 2)>;
> +               };
> +
> +               NC_BMC_GPIOD3 {
> +                       label = "NC_BMC_GPIOD3";
> +                       gpios = <&gpio ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(D, 3)>;
> +               };
> +
> +               NC_BMC_GPIOD4 {
> +                       label = "NC_BMC_GPIOD4";
> +                       gpios = <&gpio ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(D, 4)>;
> +               };
> +
> +               NC_BMC_GPIOD5 {
> +                       label = "NC_BMC_GPIOD5";
> +                       gpios = <&gpio ASPEED_GPIO(D, 5) GPIO_ACTIVE_HIGH>;
> +                       linux,code = <ASPEED_GPIO(D, 5)>;
> +               };
> +       };
> +
> +};
> +
> +
> +&gpio {
> +       // A0-A7
> +       fm_spd_ddrcpu_lvlshft_en_r {
> +               gpio-hog;
> +               label = "FM_SPD_DDRCPU_LVLSHFT_EN_R";
> +               gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
> +               linux,code = <ASPEED_GPIO(A, 1)>;

I do not think the input code makes any sense for a hog.

> +               output-high;
> +       };
> +
> +       mb_bmc_hbsp_reset_n {
> +               gpio-hog;
> +               label = "MB_BMC_HBSP_RESET_N";
> +               gpios = <ASPEED_GPIO(A, 2) GPIO_ACTIVE_LOW>;
> +               linux,code = <ASPEED_GPIO(A, 2)>;
> +               output-high;
> +       };
> +
> +       mb_bmc_hbsp_isp_n {
> +               gpio-hog;
> +               label = "MB_BMC_HBSP_ISP_N";
> +               gpios = <ASPEED_GPIO(A, 3) GPIO_ACTIVE_LOW>;
> +               linux,code = <ASPEED_GPIO(A, 3)>;
> +               output-high;
> +       };
> +       // D0-D7
> +       jtag_pld_en {
> +               gpio-hog;
> +               label = "JTAG_PLD_EN";
> +               gpios = <ASPEED_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
> +               linux,code = <ASPEED_GPIO(D, 6)>;
> +               output-low;
> +       };
> +       FM_BMC_DBP_PRESENT_R_N {
> +               gpio-hog;
> +               label = "FM_BMC_DBP_PRESENT_R_N";
> +               gpios = <ASPEED_GPIO(E, 5) GPIO_ACTIVE_LOW>;
> +               linux,code = <ASPEED_GPIO(E, 5)>;
> +               output-high;
> +       };
> +
> +       // F0-F7
> +       IRQ_BMC_PCH_NMI_R {
> +               gpio-hog;
> +               label = "IRQ_BMC_PCH_NMI_R";
> +               gpios = <ASPEED_GPIO(F, 0) GPIO_ACTIVE_HIGH>;
> +               linux,code = <ASPEED_GPIO(F, 0)>;
> +               output-low;
> +       };
> +
> +       FM_CPU2_DISABLE_COD_N {
> +               gpio-hog;
> +               label = "FM_CPU2_DISABLE_COD_N";
> +               gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_LOW>;
> +               linux,code = <ASPEED_GPIO(F, 1)>;
> +               output-high;
> +       };
> +
> +       SPI_SYSBIOS_BMC_SEL {
> +               gpio-hog;
> +               label = "SPI_SYSBIOS_BMC_SEL";
> +               gpios = <ASPEED_GPIO(F, 2) GPIO_ACTIVE_LOW>;
> +               linux,code = <ASPEED_GPIO(F, 2)>;
> +               output-high;
> +       };
> +       // Q0-Q7
> +       FM_BMC_CPU_PWR_DEBUG_R_N {
> +               gpio-hog;
> +               label = "FM_BMC_CPU_PWR_DEBUG_R_N";
> +               gpios = <ASPEED_GPIO(Q, 7) GPIO_ACTIVE_LOW>;
> +               linux,code = <ASPEED_GPIO(Q, 7)>;
> +               output-high;
> +       };
> +};
> +
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "bmc";
> +               spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout.dtsi"
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "pnor";
> +               spi-max-frequency = <100000000>;
> +       };
> +};
> +
> +&spi2 {
> +       status = "okay";
> +};
> +
> +&uart5 {
> +       status = "okay";
> +};
> +
> +&mac0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +&mac1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&adc {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +
> +       eeprom@54 {
> +        compatible = "atmel,24c64";
> +        reg = <0x54>;
> +        pagesize = <32>;

The whitespace seems off here.

> +    };
> +};
> +
> +&i2c2 {
> +       status = "okay";
> +};
> +
> +&i2c3 {
> +       status = "okay";
> +
> +       tmp75@48 {
> +               compatible = "ti,tmp75";
> +               reg = <0x48>;
> +       };
> +
> +       tmp75@4b {
> +               compatible = "ti,tmp75";
> +               reg = <0x4b>;
> +       };
> +
> +       tmp75@4c {
> +               compatible = "ti,tmp75";
> +               reg = <0x4c>;
> +       };
> +
> +       tmp75@4d {
> +               compatible = "ti,tmp75";
> +               reg = <0x4d>;
> +       };
> +
> +       vr-controller@5a {
> +               compatible = "ti,tps53679";
> +               reg = <0x5a>;
> +       };
> +
> +       vr-controller@5d {
> +               compatible = "ti,tps53679";
> +               reg = <0x5d>;
> +       };
> +
> +       vr-controller@68 {
> +               compatible = "ti,tps53679";
> +               reg = <0x68>;
> +       };
> +
> +       vr-controller@6a {
> +               compatible = "ti,tps53679";
> +               reg = <0x6a>;
> +       };
> +
> +       vr-controller@6c {
> +               compatible = "ti,tps53679";
> +               reg = <0x6c>;
> +       };
> +
> +       vr-controller@6e {
> +               compatible = "ti,tps53679";
> +               reg = <0x6e>;
> +       };
> +
> +};
> +
> +&i2c4 {
> +       status = "okay";
> +
> +       eeprom@51 {
> +        compatible = "atmel,24c64";
> +        reg = <0x51>;
> +        pagesize = <32>;
> +    };
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
> +       power-supply@58 {
> +               compatible = "pmbus";
> +               reg = <0x58>;
> +       };
> +
> +       power-supply@59 {
> +               compatible = "pmbus";
> +               reg = <0x59>;
> +       };
> +};
> +
> +
> +&sdmmc {
> +       status = "okay";
> +};
> +
> +&sdhci0 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_sd1_default>;
> +};
> +
> +/*
> + * Enable port A as device (via the virtual hub) and port B as
> + * host by default on the eval board. This can be easily changed
> + * by replacing the override below with &ehci0 { ... } to enable
> + * host on both ports.

This comment is for the eval board, you should remove it.

> + */
> +&vhub {
> +       status = "okay";
> +};
> +
> +&ehci1 {
> +       status = "okay";
> +};
> +
> +&uhci {
> +       status = "okay";
> +};
> +
> +&gfx {
> +     status = "okay";
> +     memory-region = <&gfx_memory>;

See my comment about the display device above. You probably don't need
this node.


> +};
> +
> +&pwm_tacho {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
> +               &pinctrl_pwm2_default &pinctrl_pwm3_default
> +               &pinctrl_pwm4_default &pinctrl_pwm5_default
> +               &pinctrl_pwm6_default &pinctrl_pwm7_default>;
> +
> +       fan@0 {
> +               reg = <0x00>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
> +       };
> +
> +       fan@1 {
> +               reg = <0x01>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
> +       };
> +
> +       fan@2 {
> +               reg = <0x02>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
> +       };
> +
> +       fan@3 {
> +               reg = <0x03>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
> +       };
> +
> +       fan@4 {
> +               reg = <0x04>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x08 0x09>;
> +       };
> +
> +       fan@5 {
> +               reg = <0x05>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0a 0x0b>;
> +       };
> +
> +       fan@6 {
> +               reg = <0x06>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0c 0x0d>;
> +       };
> +
> +       fan@7 {
> +               reg = <0x07>;
> +               aspeed,fan-tach-ch = /bits/ 8 <0x0e 0x0f>;
> +       };
> +
> +};
> +
> --
> 2.7.4
>
