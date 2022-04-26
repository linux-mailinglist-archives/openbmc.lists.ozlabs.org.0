Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D0650F3AB
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:26:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnZhl4ZPZz3bk9
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 18:25:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnZhP6bHCz2xB1
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 18:25:40 +1000 (AEST)
Received: from [172.16.4.143] (unknown [87.190.40.202])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 086E861EA1928;
 Tue, 26 Apr 2022 10:25:35 +0200 (CEST)
Message-ID: <44c145a8-cbfd-c8e4-8391-76abb9562f97@molgen.mpg.de>
Date: Tue, 26 Apr 2022 10:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 01/11] aach: arm: mach-hpe: Introduce the HPE GXP
 architecture
Content-Language: en-US
To: Nick Hawkins <nick.hawkins@hpe.com>
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220421192132.109954-1-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de, verdun@hpe.com, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Nick,


Thank you for the patches.

Am 21.04.22 um 21:21 schrieb nick.hawkins@hpe.com:
> From: Nick Hawkins <nick.hawkins@hpe.com>

Type in the prefix: s/aach/arch/. Looking at `git log --oneline 
arch/arm`, *ARM* or *arm* seems to be commonly used though.

> The GXP is the HPE BMC SoC that is used in the majority
> of HPE Generation 10 servers. Traditionally the asic will
> last multiple generations of server before being replaced.

Please mention what kind of documentation (datasheets, …) are available.

> In gxp.c we reset the EHCI controller early to boot the asic.

Why does the EHCI controller need to be reset?

> Info about SoC:
> 
> HPE GXP is the name of the HPE Soc. This SoC is used to implement
> many BMC features at HPE. It supports ARMv7 architecture based on
> the Cortex A9 core. It is capable of using an AXI bus to which
> a memory controller is attached. It has multiple SPI interfaces
> to connect boot flash and BIOS flash. It uses a 10/100/1000 MAC
> for network connectivity. It has multiple i2c engines to drive
> connectivity with a host infrastructure. The initial patches
> enable the watchdog and timer enabling the host to be able to
> boot.

Maybe doe that in separate commits?

Please reflow the commit message for 75 characters per line.

> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> 
> ---
> v5:
> * Fixed version log
> v4:
> * Removed unecessary code: restart, iomap, init_machine

unnecessary

> * Reordered Kconfig depends
> * Removed SPARSE_IRQ, MULTI_IRQ_HANDLER, IRQ_DOMAIN, PINCTL from
>    Kconfig
> v3:
> * Put into proper patchset format
> v2:
> * No change
> ---
>   arch/arm/Kconfig           |  2 ++
>   arch/arm/Makefile          |  1 +
>   arch/arm/mach-hpe/Kconfig  | 17 +++++++++++++++++
>   arch/arm/mach-hpe/Makefile |  1 +
>   arch/arm/mach-hpe/gxp.c    | 16 ++++++++++++++++
>   5 files changed, 37 insertions(+)
>   create mode 100644 arch/arm/mach-hpe/Kconfig
>   create mode 100644 arch/arm/mach-hpe/Makefile
>   create mode 100644 arch/arm/mach-hpe/gxp.c
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 2e8091e2d8a8..13f77eec7c40 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -620,6 +620,8 @@ source "arch/arm/mach-highbank/Kconfig"
>   
>   source "arch/arm/mach-hisi/Kconfig"
>   
> +source "arch/arm/mach-hpe/Kconfig"
> +
>   source "arch/arm/mach-imx/Kconfig"
>   
>   source "arch/arm/mach-integrator/Kconfig"
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index a2391b8de5a5..97a89023c10f 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -179,6 +179,7 @@ machine-$(CONFIG_ARCH_FOOTBRIDGE)	+= footbridge
>   machine-$(CONFIG_ARCH_GEMINI)		+= gemini
>   machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
>   machine-$(CONFIG_ARCH_HISI)		+= hisi
> +machine-$(CONFIG_ARCH_HPE)		+= hpe
>   machine-$(CONFIG_ARCH_INTEGRATOR)	+= integrator
>   machine-$(CONFIG_ARCH_IOP32X)		+= iop32x
>   machine-$(CONFIG_ARCH_IXP4XX)		+= ixp4xx
> diff --git a/arch/arm/mach-hpe/Kconfig b/arch/arm/mach-hpe/Kconfig
> new file mode 100644
> index 000000000000..c075248b259e
> --- /dev/null
> +++ b/arch/arm/mach-hpe/Kconfig
> @@ -0,0 +1,17 @@
> +menuconfig ARCH_HPE
> +	bool "HPE SoC support"
> +	depends on ARCH_MULTI_V7
> +	help
> +	  This enables support for HPE ARM based SoC chips

Add a dot/period at the end?

> +if ARCH_HPE
> +
> +config ARCH_HPE_GXP
> +	bool "HPE GXP SoC"
> +	depends on ARCH_MULTI_V7
> +	select ARM_VIC
> +	select GENERIC_IRQ_CHIP
> +	select CLKSRC_MMIO
> +	help
> +	  Support for GXP SoCs

Please elaborate here, maybe copying parts of the commit message, in 
what servers it is used.

> +
> +endif
> diff --git a/arch/arm/mach-hpe/Makefile b/arch/arm/mach-hpe/Makefile
> new file mode 100644
> index 000000000000..8b0a91234df4
> --- /dev/null
> +++ b/arch/arm/mach-hpe/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_ARCH_HPE_GXP) += gxp.o
> diff --git a/arch/arm/mach-hpe/gxp.c b/arch/arm/mach-hpe/gxp.c
> new file mode 100644
> index 000000000000..e2f0c3ae6bd8
> --- /dev/null
> +++ b/arch/arm/mach-hpe/gxp.c
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P.*/

Space before closing comment delimiter.

> +
> +#include <linux/of_platform.h>
> +#include <asm/mach/arch.h>
> +
> +static const char * const gxp_board_dt_compat[] = {
> +	"hpe,gxp",
> +	NULL,
> +};
> +
> +DT_MACHINE_START(GXP_DT, "HPE GXP")
> +	.dt_compat	= gxp_board_dt_compat,
> +	.l2c_aux_val = 0,
> +	.l2c_aux_mask = 0,
> +MACHINE_END

Where is the EHCI controller reset?


Kind regards,

Paul
