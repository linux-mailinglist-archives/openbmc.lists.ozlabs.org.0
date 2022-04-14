Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59721500811
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 10:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfC0n2cjLz3bYP
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 18:14:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NlKPlCsb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NlKPlCsb; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfC0L5gdYz2x9p
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 18:13:54 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id c199so3337866qkg.4
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2022 01:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKu+FPiwStmY/jJwAKYDS17QmN2AZKId5qyjT0RaxeM=;
 b=NlKPlCsbAvxczWtMq2P8E2SKR90adtmh66Cc42wWhIK/PY9u6+0IepVhL7HOSx7fkd
 9xjynLes366xTuONx0WkVQncZgFcwWIiRWW7XCEMpn/Q9MR+gK1GkCUkf9I8ibuShBji
 jMLnpDRW1EVai1J4sNXMAk7Q9LW8pekj7D7PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKu+FPiwStmY/jJwAKYDS17QmN2AZKId5qyjT0RaxeM=;
 b=dTW/VG0wVv4udWYzh5TrJxWF50O75JXvQvB6q9kL8j5HTJ4df5r0T4QyGpfj5l6j88
 LGzzfMETaDSy6whHU2vauKmkKqz+MyR0oKH1W+hMsiYxVVs57ooR2bKt8wuuI06UkynZ
 rLAx089yinXC4wXv6qpKwAX2lbQqIr2t7FeI0wO2tO7Umzp8KLbm8Xl6r6e8AiDtFzXN
 rtEyJnViu0uIto7ymI/itikq66lAtr8CkiikH257A4bNr23yOTc7sB1Y+eZbS4F7gJA4
 HovkggE1/RCri0KMHHdA/z1Qmo+BsCcvyQs8omEiJlMLSwMT8hoWZ/3/8wPeBEG6fvOd
 MUZw==
X-Gm-Message-State: AOAM530pc6OKpa54rlzL90xlsxMrFuXJx2YG7aTQqDfDM+Nx54hsbvjE
 OCu7dtor4wETKiqtoB7NGnU5dfew8DoTeBXVyfQ=
X-Google-Smtp-Source: ABdhPJxeLPGYaCsjkxeScZuB44lmhc1xv6aD2nR3z+Lh+WYWPoxrT7PUo3n9SY3XvkV4n6mQvn1oypTNcdpKcDDcZQY=
X-Received: by 2002:a37:9801:0:b0:69a:902:6811 with SMTP id
 a1-20020a379801000000b0069a09026811mr953608qke.346.1649924030925; Thu, 14 Apr
 2022 01:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220414040448.27100-1-zev@bewilderbeest.net>
In-Reply-To: <20220414040448.27100-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 14 Apr 2022 08:13:37 +0000
Message-ID: <CACPK8XfKuNEvrZBxuD0Q891Wb23hkwRSRe6GcmZ_KR=3g4Q=mw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed: add
 CONFIG_ASPEED_ISOLATE_BMC
To: Zev Weiss <zev@bewilderbeest.net>, Ryan Chen <ryan_chen@aspeedtech.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 14 Apr 2022 at 04:05, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> This provides the functionality of the OpenBMC df-isolate-bmc distro
> feature flag, and is very directly derived from Andrew Jeffery's patch
> in the OpenBMC tree for the v2016.07 u-boot branch.  The
> implementation currently only supports ast2500, though ast2400 and
> ast2600 support should be fairly simple extensions.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>
> This is meant more as something of an RFC to see if this seems like
> approximately the right way of going about this (since as far as I can
> see the existing df-isolate-bmc implementation only supports the old
> 2016 u-boot branch), but if it looks OK I suppose it could potentially
> go in as-is.

Thanks for doing this. The only potential change I can suggest is we
make each bit of hardware a different option (or we allow it to be
configured in the device tree). That assumes someone has a use case
for leaving one of the backdoorts open but closing the others.

>
>  arch/arm/include/asm/arch-aspeed/platform.h   |  3 +
>  .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
>  arch/arm/mach-aspeed/Kconfig                  | 12 +++
>  arch/arm/mach-aspeed/ast2500/board_common.c   | 75 +++++++++++++++++++
>  4 files changed, 98 insertions(+)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
> index f016bdaba3e7..be7e9087a782 100644
> --- a/arch/arm/include/asm/arch-aspeed/platform.h
> +++ b/arch/arm/include/asm/arch-aspeed/platform.h
> @@ -25,14 +25,17 @@
>  #define ASPEED_FMC_CS0_BASE    0x20000000
>  #elif defined(CONFIG_ASPEED_AST2500)
>  #define ASPEED_MAC_COUNT       2
> +#define ASPEED_MISC1_CTRL      0x1e6e202C
>  #define ASPEED_HW_STRAP1       0x1e6e2070
>  #define ASPEED_HW_STRAP2       0x1e6e20D0
>  #define ASPEED_REVISION_ID     0x1e6e207C
>  #define ASPEED_SYS_RESET_CTRL  0x1e6e203C
>  #define ASPEED_VGA_HANDSHAKE0  0x1e6e2040      /*      VGA fuction handshake register */
> +#define ASPEED_PCIE_CONFIG_SET 0x1e6e2180
>  #define ASPEED_MAC_COUNT       2
>  #define ASPEED_DRAM_BASE       0x80000000
>  #define ASPEED_SRAM_BASE       0x1E720000
> +#define ASPEED_LPC_CTRL                0x1e789000
>  #define ASPEED_SRAM_SIZE       0x9000
>  #define ASPEED_FMC_CS0_BASE    0x20000000
>  #elif defined(CONFIG_ASPEED_AST2600)
> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> index 8fe4028e4ff0..2d54d915dfed 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> @@ -11,6 +11,7 @@
>  #define SCU_HWSTRAP_VGAMEM_MASK                (3 << SCU_HWSTRAP_VGAMEM_SHIFT)
>  #define SCU_HWSTRAP_MAC1_RGMII         (1 << 6)
>  #define SCU_HWSTRAP_MAC2_RGMII         (1 << 7)
> +#define SCU_HWSTRAP_LPC_DISABLE                (1 << 20)
>  #define SCU_HWSTRAP_DDR4               (1 << 24)
>  #define SCU_HWSTRAP_CLKIN_25MHZ                (1 << 23)
>
> @@ -107,6 +108,13 @@
>  #define SCU_CLKDUTY_RGMII2TXCK_SHIFT   16
>  #define SCU_CLKDUTY_RGMII2TXCK_MASK    (0x7f << SCU_CLKDUTY_RGMII2TXCK_SHIFT)
>
> +#define SCU_PCIE_CONFIG_SET_VGA_MMIO   (1 << 1)
> +#define SCU_PCIE_CONFIG_SET_BMC_EN     (1 << 8)
> +#define SCU_PCIE_CONFIG_SET_BMC_MMIO   (1 << 9)
> +#define SCU_PCIE_CONFIG_SET_BMC_DMA    (1 << 14)
> +
> +#define SCU_MISC_DEBUG_UART_DISABLE    (1 << 10)
> +
>  struct ast2500_clk_priv {
>         struct ast2500_scu *scu;
>  };
> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> index 579a547df61e..2b51f87e0732 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -45,6 +45,18 @@ config ASPEED_AST2600
>           which is enabled by support of LPC and eSPI peripherals.
>  endchoice
>
> +config ASPEED_ISOLATE_BMC
> +       bool "Disable hardware features that provide unnecessary access to the BMC"
> +       depends on ASPEED_AST2500
> +       default n

all kconfig are "default n", so you can omit this.

I suggest we invert the meaning of the option. The default should be
turn off the backdoors, and someone can optionally re-enable them by
selecting the option.

config ASPEED_ALLOW_BACKDOORS?

> +       help
> +         Aspeed BMC hardware provides a number of hardware features
> +         that, in their default configuration, allow access to BMC
> +         internals that may be undesirable in production systems for
> +         security reasons (iLPC2AHB, P2A, PCIe, debug UART, X-DMA,
> +         LPC2AHB).  This disables these features so as to provide
> +         stronger security isolation for the BMC.
> +
>  config ASPEED_PALLADIUM
>         bool "Aspeed palladium for simulation"
>         default n
> diff --git a/arch/arm/mach-aspeed/ast2500/board_common.c b/arch/arm/mach-aspeed/ast2500/board_common.c
> index ce541e88fb8e..bd73fe1c1070 100644
> --- a/arch/arm/mach-aspeed/ast2500/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2500/board_common.c
> @@ -7,18 +7,93 @@
>  #include <ram.h>
>  #include <timer.h>
>  #include <asm/io.h>
> +#include <asm/arch/platform.h>
> +#include <asm/arch/scu_ast2500.h>
> +#include <asm/arch/sdram_ast2500.h>
>  #include <asm/arch/timer.h>
>  #include <linux/err.h>
>  #include <dm/uclass.h>
>
>  DECLARE_GLOBAL_DATA_PTR;
>
> +#if CONFIG_ASPEED_ISOLATE_BMC
> +#define AST_LPC_BASE 0x1e789000
> +# define AST_LPC_HICR5 0x080
> +#  define LPC_HICR5_ENFWH BIT(10)
> +# define AST_LPC_HICRB 0x100
> +#  define LPC_HICRB_ILPC2AHB BIT(6)
> +
> +#define AST_SDMC_BASE 0x1e6e0000
> +# define AST_SDMC_PROTECT 0x00
> +# define AST_SDMC_GFX_PROT 0x08
> +#  define SDMC_GFX_PROT_VGA_CURSOR BIT(0)
> +#  define SDMC_GFX_PROT_VGA_CG_READ BIT(1)
> +#  define SDMC_GFX_PROT_VGA_ASCII_READ BIT(2)
> +#  define SDMC_GFX_PROT_VGA_CRT BIT(3)
> +#  define SDMC_GFX_PROT_PCIE BIT(16)
> +#  define SDMC_GFX_PROT_XDMA BIT(17)
> +
> +static void isolate_bmc(void)
> +{
> +       bool sdmc_unlocked;
> +       u32 val;
> +
> +       /* iLPC2AHB */
> +       val = readl(ASPEED_HW_STRAP1);
> +       val |= SCU_HWSTRAP_LPC_DISABLE;
> +       writel(val, ASPEED_HW_STRAP1);
> +
> +       val = readl(AST_LPC_BASE + AST_LPC_HICRB);
> +       val |= LPC_HICRB_ILPC2AHB;
> +       writel(val, AST_LPC_BASE + AST_LPC_HICRB);
> +
> +       /* P2A, PCIe BMC */
> +       val = readl(ASPEED_PCIE_CONFIG_SET);
> +       val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
> +                | SCU_PCIE_CONFIG_SET_BMC_MMIO
> +                | SCU_PCIE_CONFIG_SET_BMC_EN
> +                | SCU_PCIE_CONFIG_SET_VGA_MMIO);
> +       writel(val, ASPEED_PCIE_CONFIG_SET);
> +
> +       /* Debug UART */
> +       val = readl(ASPEED_MISC1_CTRL);
> +       val |= SCU_MISC_DEBUG_UART_DISABLE;
> +       writel(val, ASPEED_MISC1_CTRL);
> +
> +       /* X-DMA */
> +       sdmc_unlocked = readl(AST_SDMC_BASE + AST_SDMC_PROTECT);
> +       if (!sdmc_unlocked)
> +               writel(SDRAM_UNLOCK_KEY, AST_SDMC_BASE + AST_SDMC_PROTECT);
> +
> +       val = readl(AST_SDMC_BASE + AST_SDMC_GFX_PROT);
> +       val |= (SDMC_GFX_PROT_VGA_CURSOR
> +               | SDMC_GFX_PROT_VGA_CG_READ
> +               | SDMC_GFX_PROT_VGA_ASCII_READ
> +               | SDMC_GFX_PROT_VGA_CRT
> +               | SDMC_GFX_PROT_PCIE
> +               | SDMC_GFX_PROT_XDMA);
> +       writel(val, AST_SDMC_BASE + AST_SDMC_GFX_PROT);
> +
> +       if (!sdmc_unlocked)
> +               writel(~SDRAM_UNLOCK_KEY, AST_SDMC_BASE + AST_SDMC_PROTECT);
> +
> +       /* LPC2AHB */
> +       val = readl(AST_LPC_BASE + AST_LPC_HICR5);
> +       val &= ~LPC_HICR5_ENFWH;
> +       writel(val, AST_LPC_BASE + AST_LPC_HICR5);
> +}
> +#endif
> +
>  __weak int board_init(void)
>  {
>         struct udevice *dev;
>         int i;
>         int ret;
>
> +#if CONFIG_ASPEED_ISOLATE_BMC
> +       isolate_bmc();
> +#endif
> +
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>
>         /*
> --
> 2.35.1
>
