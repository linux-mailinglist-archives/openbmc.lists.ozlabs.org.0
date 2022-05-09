Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE451F69A
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 10:38:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxZMg3xw4z3brn
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 18:38:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=W7gTcQRF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=W7gTcQRF; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxZMG392cz2yJ5
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 18:38:33 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id w3so10242094qkb.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EUZNhy/1ksRbxUcx2PE5Lx6Aem88Zn7/Z5TXgwR7a4E=;
 b=W7gTcQRFl4xXRrgCfoWBKt4cjSPsM2U4Ev85rfo6+HMXZLKFmXZSDacpKWzxe3bIuJ
 wjM1Me459ifEpFwh1AqcSeKrml7K31BmLdQxcMbCoQNDob2CBbfhALkP6Rszz/Z0F0f0
 /8vBIgFPP3+uoFHXwWZkYW9P6zTrnXQ30yl+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EUZNhy/1ksRbxUcx2PE5Lx6Aem88Zn7/Z5TXgwR7a4E=;
 b=U6V+Gdte7bvEAZIAhYzPHvN7NMREoxGPj+LT92SguQXcjvObZsymTyUSHZWWySkAVZ
 QzMg6uJaPm9fCcTNNmNJk7oA020NwaDR9ENJkalKyiqSbn/X5g1riczB67LWcmlVi92U
 l51aVYvhOQdK17aGXQI7/0bgO0kkiAvwGLl+5OBtpI8zB+klN+hfbPiTsPtro4wBk+Q3
 yDgy/2/UBBD0h1ReckF5+Es0CnhKV0dtcGDPWe5W8tuz2wyJMhQRGV62hMYJnYkxcUY2
 sy5bzRsIXuYAUxcXFINh+JgRlnbrydML0iIwYSF1udsRj84N+7zU2oygJzG0tDv3amZ7
 4rrA==
X-Gm-Message-State: AOAM530J6BZA/Y5r+Cnunl02SvGisbGcr6XkvFaiqX7noJqlbVvJlvi+
 3vReT3Cb81pDp1NDSCu9n3x6F2Dsw7ijZx29irI=
X-Google-Smtp-Source: ABdhPJxp96oxQ2cbSLeLrUlkH8Hjf6Owy9F7qE6HyL903iSKspD3BUMtiNTDW17vsYn1pWCZQ8GyV/+55KVxlwP4inM=
X-Received: by 2002:ae9:e8cd:0:b0:6a0:846a:b836 with SMTP id
 a196-20020ae9e8cd000000b006a0846ab836mr3044865qkg.533.1652085509966; Mon, 09
 May 2022 01:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220504004739.15829-1-zev@bewilderbeest.net>
In-Reply-To: <20220504004739.15829-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 9 May 2022 08:38:16 +0000
Message-ID: <CACPK8Xc3V_rkaV4MbtfGTaJnJ=b9Fuufa-ZVXGHyDra0FnKfuQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4] aspeed: Disable
 backdoor interfaces
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Ian Woloschin <ian.woloschin@akamai.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 4 May 2022 at 00:47, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On ast2400 and ast2500 we now disable the various hardware backdoor
> interfaces as is done on ast2600.  Two Kconfig options can selectively
> re-enable some of these interfaces: CONFIG_ASPEED_ENABLE_SUPERIO
> leaves the ast2x00 built-in Super I/O device enabled, as it is
> required for some systems, and CONFIG_ASPEED_ENABLE_DEBUG_UART leaves
> the hardware debug UART enabled, since it provides a relatively high
> ratio of utility to security risk during development.
>
> This patch is based on a patch by Andrew Jeffery for an older u-boot
> branch in the OpenBMC tree for the df-isolate-bmc distro feature flag.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Tested-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>
> Ian, if you want to test out this version note that you'll also need
> to add CONFIG_ASPEED_ALLOW_DANGEROUS_BACKDOORS=y now in addition to
> CONFIG_ASPEED_ENABLE_SUPERIO=y.
>
> Changes since v3 [2]:
>  - added louder warnings to Kconfig help text and an additional "gate"
>    option guarding the two "make my BMC vulnerable" options

Thanks Zev, I've applied this and pushed a bump to the openbmc repository:

 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/53576

Ian, if you get around to testing then please reply to this thread
with the results.

Thank you Zev for your work on this patch.

Cheers,

Joel

>
> Changes since v2 [1]:
>  - made most of the changes unconditional/unconfigurable, but added
>    Kconfig options to leave Super I/O and debug UART enabled
>
> Changes since v1 [0]:
>  - extended to cover ast2400
>  - inverted sense of Kconfig option, default (n) is now secure mode
>  - renamed some register/bit macros more appropriately
>
> [0] https://lore.kernel.org/openbmc/20220414040448.27100-1-zev@bewilderbeest.net/
> [1] https://lore.kernel.org/openbmc/20220414224004.29703-1-zev@bewilderbeest.net/
> [2] https://lore.kernel.org/openbmc/20220419234202.8895-1-zev@bewilderbeest.net/
>
>  arch/arm/include/asm/arch-aspeed/platform.h   |  7 ++
>  .../arm/include/asm/arch-aspeed/scu_ast2400.h |  7 ++
>  .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
>  arch/arm/mach-aspeed/Kconfig                  | 39 ++++++++++
>  arch/arm/mach-aspeed/ast2400/board_common.c   | 66 +++++++++++++++++
>  arch/arm/mach-aspeed/ast2500/board_common.c   | 73 +++++++++++++++++++
>  6 files changed, 200 insertions(+)
>
> diff --git a/arch/arm/include/asm/arch-aspeed/platform.h b/arch/arm/include/asm/arch-aspeed/platform.h
> index f016bdaba3e7..f05747642f38 100644
> --- a/arch/arm/include/asm/arch-aspeed/platform.h
> +++ b/arch/arm/include/asm/arch-aspeed/platform.h
> @@ -15,24 +15,31 @@
>  /*********************************************************************************/
>  #if defined(CONFIG_ASPEED_AST2400)
>  #define ASPEED_MAC_COUNT       2
> +#define ASPEED_SDRAM_CTRL      0x1e6e0000
>  #define ASPEED_HW_STRAP1       0x1e6e2070
>  #define ASPEED_REVISION_ID     0x1e6e207C
>  #define ASPEED_SYS_RESET_CTRL  0x1e6e203C
>  #define ASPEED_VGA_HANDSHAKE0  0x1e6e2040      /*      VGA fuction handshake register */
> +#define ASPEED_PCIE_CONFIG_SET 0x1e6e2180
>  #define ASPEED_DRAM_BASE       0x40000000
>  #define ASPEED_SRAM_BASE       0x1E720000
> +#define ASPEED_LPC_CTRL                0x1e789000
>  #define ASPEED_SRAM_SIZE       0x8000
>  #define ASPEED_FMC_CS0_BASE    0x20000000
>  #elif defined(CONFIG_ASPEED_AST2500)
>  #define ASPEED_MAC_COUNT       2
> +#define ASPEED_SDRAM_CTRL      0x1e6e0000
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
> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> index 9c5d96ae84b9..55875fd8312f 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2400.h
> @@ -8,6 +8,7 @@
>  #define SCU_HWSTRAP_VGAMEM_MASK                (3 << SCU_HWSTRAP_VGAMEM_SHIFT)
>  #define SCU_HWSTRAP_MAC1_RGMII         (1 << 6)
>  #define SCU_HWSTRAP_MAC2_RGMII         (1 << 7)
> +#define SCU_HWSTRAP_LPC_SIO_DEC_DIS    (1 << 20)
>  #define SCU_HWSTRAP_DDR4               (1 << 24)
>  #define SCU_HWSTRAP_CLKIN_25MHZ                (1 << 23)
>
> @@ -104,6 +105,12 @@
>  #define SCU_CLKDUTY_RGMII2TXCK_SHIFT   16
>  #define SCU_CLKDUTY_RGMII2TXCK_MASK    (0x7f << SCU_CLKDUTY_RGMII2TXCK_SHIFT)
>
> +#define SCU_PCIE_CONFIG_SET_VGA_MMIO   (1 << 1)
> +#define SCU_PCIE_CONFIG_SET_BMC_EN     (1 << 8)
> +#define SCU_PCIE_CONFIG_SET_BMC_MMIO   (1 << 9)
> +#define SCU_PCIE_CONFIG_SET_BMC_DMA    (1 << 14)
> +
> +
>  struct ast2400_clk_priv {
>         struct ast2400_scu *scu;
>  };
> diff --git a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> index 8fe4028e4ff0..06dc998afaa8 100644
> --- a/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> +++ b/arch/arm/include/asm/arch-aspeed/scu_ast2500.h
> @@ -11,6 +11,7 @@
>  #define SCU_HWSTRAP_VGAMEM_MASK                (3 << SCU_HWSTRAP_VGAMEM_SHIFT)
>  #define SCU_HWSTRAP_MAC1_RGMII         (1 << 6)
>  #define SCU_HWSTRAP_MAC2_RGMII         (1 << 7)
> +#define SCU_HWSTRAP_LPC_SIO_DEC_DIS    (1 << 20)
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
> index 579a547df61e..edb5520aec7a 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -45,6 +45,45 @@ config ASPEED_AST2600
>           which is enabled by support of LPC and eSPI peripherals.
>  endchoice
>
> +config ASPEED_ALLOW_DANGEROUS_BACKDOORS
> +       bool "Expose options enabling dangerous Aspeed hardware backdoors"
> +       help
> +         This option exposes configuration settings that create
> +         critical security vulnerabilities by enabling dangerous
> +         hardware backdoors in Aspeed BMCs.  Enable it only if
> +         absolutely required for a specific system or for debugging
> +         during development.
> +
> +if ASPEED_ALLOW_DANGEROUS_BACKDOORS
> +
> +config ASPEED_ENABLE_SUPERIO
> +       bool "Enable built-in AST2x00 Super I/O hardware"
> +       depends on ASPEED_AST2400 || ASPEED_AST2500
> +       help
> +         The Aspeed AST2400 and AST2500 include a built-in Super I/O
> +         device that is normally disabled; say Y here to enable it.
> +
> +         WARNING: this has serious security implications: it grants
> +         the host read access to the BMC's entire address space.
> +         This should thus be left disabled unless required by a
> +         specific system.
> +
> +config ASPEED_ENABLE_DEBUG_UART
> +       bool "Enable AST2500 hardware debug UART"
> +       depends on ASPEED_AST2500
> +       help
> +         The Aspeed AST2500 include a hardware-supported, UART-based
> +         debug interface that is normally disabled; say Y here to
> +         enable it.
> +
> +         Note that this has security implications: the debug UART
> +         provides read/write access to the BMC's entire address
> +         space.  This should thus be left disabled on production
> +         systems, but may be useful to enable for debugging during
> +         development.
> +
> +endif
> +
>  config ASPEED_PALLADIUM
>         bool "Aspeed palladium for simulation"
>         default n
> diff --git a/arch/arm/mach-aspeed/ast2400/board_common.c b/arch/arm/mach-aspeed/ast2400/board_common.c
> index 3829b069342e..7134105232cb 100644
> --- a/arch/arm/mach-aspeed/ast2400/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2400/board_common.c
> @@ -4,14 +4,80 @@
>  #include <ram.h>
>  #include <timer.h>
>  #include <asm/io.h>
> +#include <asm/arch/platform.h>
> +#include <asm/arch/scu_ast2400.h>
>  #include <asm/arch/timer.h>
>  #include <linux/err.h>
>  #include <dm/uclass.h>
>
>  DECLARE_GLOBAL_DATA_PTR;
>
> +#define AST_LPC_HICR5 0x080
> +# define LPC_HICR5_ENFWH BIT(10)
> +#define AST_LPC_HICRB 0x100
> +# define LPC_HICRB_SIO_ILPC2AHB_DIS BIT(6)
> +
> +#define AST_SDMC_PROTECT 0x00
> +# define SDRAM_UNLOCK_KEY 0xfc600309
> +#define AST_SDMC_GFX_PROT 0x08
> +# define SDMC_GFX_PROT_VGA_CURSOR BIT(0)
> +# define SDMC_GFX_PROT_VGA_CG_READ BIT(1)
> +# define SDMC_GFX_PROT_VGA_ASCII_READ BIT(2)
> +# define SDMC_GFX_PROT_VGA_CRT BIT(3)
> +# define SDMC_GFX_PROT_PCIE BIT(16)
> +# define SDMC_GFX_PROT_XDMA BIT(17)
> +
> +static void isolate_bmc(void)
> +{
> +       bool sdmc_unlocked;
> +       u32 val;
> +
> +       /* iLPC2AHB */
> +#if !defined(CONFIG_ASPEED_ENABLE_SUPERIO)
> +       val = readl(ASPEED_HW_STRAP1);
> +       val |= SCU_HWSTRAP_LPC_SIO_DEC_DIS;
> +       writel(val, ASPEED_HW_STRAP1);
> +#endif
> +
> +       val = readl(ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +       val |= LPC_HICRB_SIO_ILPC2AHB_DIS;
> +       writel(val, ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +
> +       /* P2A, PCIe BMC */
> +       val = readl(ASPEED_PCIE_CONFIG_SET);
> +       val &= ~(SCU_PCIE_CONFIG_SET_BMC_DMA
> +                | SCU_PCIE_CONFIG_SET_BMC_MMIO
> +                | SCU_PCIE_CONFIG_SET_BMC_EN
> +                | SCU_PCIE_CONFIG_SET_VGA_MMIO);
> +       writel(val, ASPEED_PCIE_CONFIG_SET);
> +
> +       /* X-DMA */
> +       sdmc_unlocked = readl(ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +       if (!sdmc_unlocked)
> +               writel(SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +
> +       val = readl(ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +       val |= (SDMC_GFX_PROT_VGA_CURSOR
> +               | SDMC_GFX_PROT_VGA_CG_READ
> +               | SDMC_GFX_PROT_VGA_ASCII_READ
> +               | SDMC_GFX_PROT_VGA_CRT
> +               | SDMC_GFX_PROT_PCIE
> +               | SDMC_GFX_PROT_XDMA);
> +       writel(val, ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +
> +       if (!sdmc_unlocked)
> +               writel(~SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +
> +       /* LPC2AHB */
> +       val = readl(ASPEED_LPC_CTRL + AST_LPC_HICR5);
> +       val &= ~LPC_HICR5_ENFWH;
> +       writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5);
> +}
> +
>  __weak int board_init(void)
>  {
> +       isolate_bmc();
> +
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>
>         return 0;
> diff --git a/arch/arm/mach-aspeed/ast2500/board_common.c b/arch/arm/mach-aspeed/ast2500/board_common.c
> index ce541e88fb8e..c63fe466eb4b 100644
> --- a/arch/arm/mach-aspeed/ast2500/board_common.c
> +++ b/arch/arm/mach-aspeed/ast2500/board_common.c
> @@ -7,18 +7,91 @@
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
> +#define AST_LPC_HICR5 0x080
> +# define LPC_HICR5_ENFWH BIT(10)
> +#define AST_LPC_HICRB 0x100
> +# define LPC_HICRB_SIO_ILPC2AHB_DIS BIT(6)
> +
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
> +#if !defined(CONFIG_ASPEED_ENABLE_SUPERIO)
> +       val = readl(ASPEED_HW_STRAP1);
> +       val |= SCU_HWSTRAP_LPC_SIO_DEC_DIS;
> +       writel(val, ASPEED_HW_STRAP1);
> +#endif
> +
> +       val = readl(ASPEED_LPC_CTRL + AST_LPC_HICRB);
> +       val |= LPC_HICRB_SIO_ILPC2AHB_DIS;
> +       writel(val, ASPEED_LPC_CTRL + AST_LPC_HICRB);
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
> +#if !defined(CONFIG_ASPEED_ENABLE_DEBUG_UART)
> +       val = readl(ASPEED_MISC1_CTRL);
> +       val |= SCU_MISC_DEBUG_UART_DISABLE;
> +       writel(val, ASPEED_MISC1_CTRL);
> +#endif
> +
> +       /* X-DMA */
> +       sdmc_unlocked = readl(ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +       if (!sdmc_unlocked)
> +               writel(SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +
> +       val = readl(ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +       val |= (SDMC_GFX_PROT_VGA_CURSOR
> +               | SDMC_GFX_PROT_VGA_CG_READ
> +               | SDMC_GFX_PROT_VGA_ASCII_READ
> +               | SDMC_GFX_PROT_VGA_CRT
> +               | SDMC_GFX_PROT_PCIE
> +               | SDMC_GFX_PROT_XDMA);
> +       writel(val, ASPEED_SDRAM_CTRL + AST_SDMC_GFX_PROT);
> +
> +       if (!sdmc_unlocked)
> +               writel(~SDRAM_UNLOCK_KEY, ASPEED_SDRAM_CTRL + AST_SDMC_PROTECT);
> +
> +       /* LPC2AHB */
> +       val = readl(ASPEED_LPC_CTRL + AST_LPC_HICR5);
> +       val &= ~LPC_HICR5_ENFWH;
> +       writel(val, ASPEED_LPC_CTRL + AST_LPC_HICR5);
> +}
> +
>  __weak int board_init(void)
>  {
>         struct udevice *dev;
>         int i;
>         int ret;
>
> +       isolate_bmc();
> +
>         gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
>
>         /*
> --
> 2.36.0
>
