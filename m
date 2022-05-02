Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918D516BB7
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 10:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsG6q5t7rz30BS
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 18:12:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CZH3YIYH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=CZH3YIYH; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsG6Q64xPz2yHp
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2022 18:12:28 +1000 (AEST)
Received: by mail-qv1-xf34.google.com with SMTP id kd11so9811606qvb.2
 for <openbmc@lists.ozlabs.org>; Mon, 02 May 2022 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2PU6acCfEJUJL05zdmUYaK48X8TBv4BGOCGAJ6ERnXU=;
 b=CZH3YIYHSCMx3tdFBd1gfR9ItasKsSYyXyfGUf7EY6ZwLz9rGLnqh8WtGFhoznA0oL
 KtlYPk2NaILG4RjrPDJLjJUorrBMtDguiqg7u7U472xzmdlqYsLqOU7cw3+/qsmV/isM
 qy8IKU4h7kzQXiWYnn/vzidtZzwdHgCMZLbN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2PU6acCfEJUJL05zdmUYaK48X8TBv4BGOCGAJ6ERnXU=;
 b=o0GQsc8v7OPNhGk6cqDf7PZ6kPZ31/EgVfvNv1lQ9s5lU9Y6iZLuCXbRi9BCw4hXBP
 qQubXW5XkVfYJpaJZFNXoP3Br0DsYYUmrQtqAYjygov101OE4rrSWxUqTB046Ee6+pZY
 /v9iyOTE+7aVpFcvMhsIdIIp46At0vvRkwGeM+jpzgVHQBTWFNil01QcOmNVbpw7XM24
 XSI1LDCCwoAdd+pkqqGozPx2/6b0jZZrBUdwnRAT9y1TkUlfmAtfbjgAkovDnhjNzg5+
 jmhEW7ggJ4h42SQ+2E0DTfScpkxibebj6uVf+H8B/XvuRpaW2nCyH6l8XPE/W+Ac8YGY
 1Wnw==
X-Gm-Message-State: AOAM530Y+Uz3oqrSqvecx3h79VaCVuem5Zfv5vZ1KsQs2QR5auLUPxsG
 PEKtleD4Y1zgtifGi0drLIcWcGd/iquurHKRBpo=
X-Google-Smtp-Source: ABdhPJxZoG4JUFF/9YhM7FU2yvcmiLUfhQcGRfh1CEOQ2T4W1DLFY7wnoP4Gi/JeeeedCSh+TRDIOTWRAx+RBtrtiwk=
X-Received: by 2002:ad4:53c5:0:b0:42d:7bb4:a8e8 with SMTP id
 k5-20020ad453c5000000b0042d7bb4a8e8mr8625114qvv.8.1651479145951; Mon, 02 May
 2022 01:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220419234202.8895-1-zev@bewilderbeest.net>
In-Reply-To: <20220419234202.8895-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 May 2022 08:11:00 +0000
Message-ID: <CACPK8XfYuWT9Q5G_bo9AGugx-DcODDZ8xb39Sr+Sa8qWqVeW6A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3] aspeed: Disable
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

On Tue, 19 Apr 2022 at 23:43, Zev Weiss <zev@bewilderbeest.net> wrote:
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
> ---
>
> Tested on ast2500 and (hostless, BMC-only) ast2400.
>
> Ryan, are you OK with having an option (off by default) to leave the
> debug UART enabled as in this version of the patch?
>
> Ian, if you could test this out with CONFIG_ASPEED_ENABLE_SUPERIO=y on
> one of your systems and confirm that that setting works as intended
> that would be great.

Ian, did you get around to testing this?

I've given it a careful review.

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
>
>  arch/arm/include/asm/arch-aspeed/platform.h   |  7 ++
>  .../arm/include/asm/arch-aspeed/scu_ast2400.h |  7 ++
>  .../arm/include/asm/arch-aspeed/scu_ast2500.h |  8 ++
>  arch/arm/mach-aspeed/Kconfig                  | 22 ++++++
>  arch/arm/mach-aspeed/ast2400/board_common.c   | 66 +++++++++++++++++
>  arch/arm/mach-aspeed/ast2500/board_common.c   | 73 +++++++++++++++++++
>  6 files changed, 183 insertions(+)
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

sp: function

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

sp: function

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
> index 579a547df61e..fc565e0da830 100644
> --- a/arch/arm/mach-aspeed/Kconfig
> +++ b/arch/arm/mach-aspeed/Kconfig
> @@ -45,6 +45,28 @@ config ASPEED_AST2600
>           which is enabled by support of LPC and eSPI peripherals.
>  endchoice
>
> +config ASPEED_ENABLE_SUPERIO
> +       bool "Enable built-in AST2x00 Super I/O hardware"
> +       depends on ASPEED_AST2400 || ASPEED_AST2500
> +       help
> +         The Aspeed AST2400 and AST2500 include a built-in Super I/O
> +         device that is normally disabled; say Y here to enable it.

Can you add a line break here.

> +         Note that this has security implications: it grants the host
> +         read access to the BMC's entire address space.  This should
> +         thus be left disabled unless required by a specific system.

Change "note" to WARNING or DANGER or an all caps label of your choosing.

Do you think we should put these behind a config
ASPEED_SHOW_DANGEROUS_BACKDOOR_FEATURE so users have to acknowledge
that option before enabling these?


> +
> +config ASPEED_ENABLE_DEBUG_UART
> +       bool "Enable AST2500 hardware debug UART"
> +       depends on ASPEED_AST2500
> +       help
> +         The Aspeed AST2500 include a hardware-supported, UART-based
> +         debug interface that is normally disabled; say Y here to
> +         enable it.

line break

> Note that this has security implications: the
> +         debug UART provide read/write access to the BMC's entire

provides

> +         address space.  This should thus be left disabled on
> +         production systems, but may be useful to enable for
> +         debugging during development.
> +

I did a build as follows:

$ cat build-ast2500.sh
#!/bin/bash

set -e

OBJ=ast2500-obj
CONFIG=evb-ast2500_defconfig
IMG="$OBJ/test.img"

make -j8 O="$OBJ" -s clean
make -j8 O="$OBJ" -j8 -s $CONFIG
CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm make -j8 O="$OBJ"  -j8
DEVICE_TREE=ast2500-evb -s
size "$OBJ/u-boot"

cp "$OBJ/u-boot.bin" "$OBJ/test.img"
truncate -s 32M "$OBJ/test.img"

Testing on a qemu instance, before your patch:

$ qemu-system-arm -M ast2500-evb -drive
file=ast2500-obj/test.img,if=mtd -nographic -nic user,tftp=/srv/tftp/

# ./culvert probe
[*] Probing AHB interfaces
[*] Performing interface discovery via devmem
SuperIO: Enabled
iLPC2AHB Bridge: Read-write
VGA PCIe device: Enabled
MMIO on VGA device: Enabled
P2A write filter state:
0x00000000-0x0fffffff (Firmware): Read-write
0x10000000-0x1fffffff (SoC IO): Read-write
0x20000000-0x2fffffff (BMC Flash): Read-write
0x30000000-0x3fffffff (Host Flash): Read-write
0x40000000-0x5fffffff (Reserved): Read-write
0x60000000-0x7fffffff (LPC Host): Read-write
0x80000000-0xffffffff (DRAM): Read-write
X-DMA on VGA device: Enabled
BMC PCIe device: Disabled
X-DMA is unconstrained: Yes
Debug UART: Enabled
Debug UART enabled on: UART5

After applying your patch:

# ./culvert probe
[*] Probing AHB interfaces
[*] Performing interface discovery via devmem
SuperIO: Disabled
VGA PCIe device: Enabled
MMIO on VGA device: Disabled
X-DMA on VGA device: Enabled
BMC PCIe device: Disabled
X-DMA is unconstrained: No
Debug UART: Disabled


Similarly with the ast2400:

qemu-system-arm -M palmetto-bmc -drive
file=ast2400-obj/test.img,if=mtd -nographic -nic user,tftp=/srv/tftp/

# ./culvert probe
[*] Probing AHB interfaces
[*] Performing interface discovery via devmem
SuperIO: Enabled
iLPC2AHB Bridge: Read-write
VGA PCIe device: Enabled
MMIO on VGA device: Enabled
P2A write filter state:
0x00000000-0x17ffffff (Firmware): Read-write
0x18000000-0x1fffffff (SoC IO): Read-write
0x20000000-0x2fffffff (BMC Flash): Read-write
0x30000000-0x3fffffff (Host Flash): Read-write
0x40000000-0x5fffffff (DRAM): Read-write
0x60000000-0x7fffffff (LPC Host): Read-write
0x80000000-0xffffffff (Reserved): Read-write
X-DMA on VGA device: Enabled
BMC PCIe device: Disabled
X-DMA is unconstrained: Yes
Debug UART: Absent

# ./culvert probe
[*] Probing AHB interfaces
[*] Performing interface discovery via devmem
SuperIO: Disabled
VGA PCIe device: Enabled
MMIO on VGA device: Disabled
X-DMA on VGA device: Enabled
BMC PCIe device: Disabled
X-DMA is unconstrained: No
Debug UART: Absent

These "after" settings look good. I didn't check that qemu models the
default state of these bits in detail, but the fact that they change
from "insecure" to "secure" indicates your patch is setting the
correct things.

Tested-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
