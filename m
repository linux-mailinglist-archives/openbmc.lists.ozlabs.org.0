Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC7520F0F
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 09:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky9Dy1wrNz3cBf
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 17:50:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky9Dd5q5Bz3bqC
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 17:49:51 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeae3.dynamic.kabel-deutschland.de
 [95.90.234.227])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id E775A61E6478B;
 Tue, 10 May 2022 09:49:47 +0200 (CEST)
Message-ID: <0a46ba6f-9eac-7138-c675-99df86750c83@molgen.mpg.de>
Date: Tue, 10 May 2022 09:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v9 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Content-Language: en-US
To: Medad CChien <medadyoung@gmail.com>
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-4-ctcchien@nuvoton.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220510031056.1657-4-ctcchien@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 benjaminfair@google.com, linux-edac@vger.kernel.org, KFTING@nuvoton.com,
 avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, tali.perry1@gmail.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org, bp@alien8.de,
 james.morse@arm.com, YSCHU@nuvoton.com, mchehab@kernel.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Medad,


Am 10.05.22 um 05:10 schrieb Medad CChien:
> Add memory controller support for Nuvoton NPCM SoC.

It’d be great if you added the datasheet name, revision and section used 
to implement this.

> Note:
>     you can force an ecc event by writing a string to edac sysfs node
>     and remember to define CONFIG_EDAC_DEBUG to enable this feature
>     example: force a correctable event on checkcode bit 0
>     echo "CE checkcode 0" > /sys/devices/system/edac/mc/mc0/forced_ecc_error
> 
> Fix the following warnings and error:
> error:
>     error: macro "edac_printk" requires 4 arguments, but only 2 given in
>     driver/edac/npcm_edac.c
>     edac_printk(KERN_INFO, "bit_no for checkcode must be 0~7\n");
> 
> warnings:
>     performing pointer arithmetic on a null pointer has undefined behavior.
>     logical not is only applied to the left hand side of this bitwise
>     operator.
>     mixing declarations and code is a C99 extension.
> 
> Reported-by: kernel test robot <lkp@intel.com>

I find this line confusing as the kernel test robot did not report that 
the memory controller driver is missing.

> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> ---
>   drivers/edac/Kconfig     |  10 +
>   drivers/edac/Makefile    |   1 +
>   drivers/edac/npcm_edac.c | 680 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 691 insertions(+)
>   create mode 100644 drivers/edac/npcm_edac.c
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 58ab63642e72..9c83202cbf65 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -539,4 +539,14 @@ config EDAC_DMC520
>   	  Support for error detection and correction on the
>   	  SoCs with ARM DMC-520 DRAM controller.
>   
> +config EDAC_NPCM
> +	tristate "Nuvoton NPCM DDR Memory Controller"
> +	depends on (ARCH_NPCM || COMPILE_TEST)
> +	help
> +	  Support for error detection and correction on the Nuvoton NPCM DDR
> +	  memory controller.

Maybe add the information from the devicetree documentation:

The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
correction check).

The memory controller supports single bit error correction, double bit
error detection (in-line ECC in which a section (1/8th) of the memory
device used to store data is used for ECC storage).

> +
> +	  First, ECC must be configured in the BootBlock header. Then, this driver
> +	  will expose error counters via the EDAC kernel framework.
> +
>   endif # EDAC
> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
> index 2d1641a27a28..db3c59d3ad84 100644
> --- a/drivers/edac/Makefile
> +++ b/drivers/edac/Makefile
> @@ -84,3 +84,4 @@ obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
>   obj-$(CONFIG_EDAC_ASPEED)		+= aspeed_edac.o
>   obj-$(CONFIG_EDAC_BLUEFIELD)		+= bluefield_edac.o
>   obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
> +obj-$(CONFIG_EDAC_NPCM)			+= npcm_edac.o
> diff --git a/drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
> new file mode 100644
> index 000000000000..5552dab242b1
> --- /dev/null
> +++ b/drivers/edac/npcm_edac.c
> @@ -0,0 +1,680 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2022 Nuvoton Technology corporation.

No dot/period is needed at the end, as corporation is not abbreviated. 
Maybe also capitalize Corporation as done on the Web site.

> +
> +#include <linux/delay.h>
> +#include <linux/of_device.h>
> +
> +#include "edac_module.h"
> +
> +#define NPCM_EDAC_MOD_NAME "npcm-edac"
> +#define FORCED_ECC_ERR_EVENT_SUPPORT		BIT(1)
> +#define EDAC_MSG_SIZE						256
> +/* Granularity of reported error in bytes */
> +#define NPCM_EDAC_ERR_GRAIN				1
> +
> +#define MEM_TYPE_DDR4						0xA
> +
> +#define NPCM7XX_CHIP						0x700
> +#define NPCM8XX_CHIP						0x800
> +
> +/* Control register width definitions */
> +#define WDTH_16								(2)
> +#define WDTH_32								(1)
> +#define WDTH_64								(0)
> +#define CTL_MEM_MAX_WIDTH_MASK			GENMASK(4, 0)
> +#define CTL_REG_WIDTH_SHIFT					(32)
> +#define XOR_CHECK_BIT_SPLIT_WIDTH			(16)
> +#define CTL_CONTROLLER_BUSY_FLAG			BIT(0)
> +#define NPCM_ECC_CTL_FORCE_WC				BIT(8)
> +#define NPCM_ECC_CTL_AUTO_WRITEBACK_EN	BIT(24)
> +#define NPCM_ECC_CTL_XOR_BITS_MASK			GENMASK(23, 16)
> +#define NPCM_ECC_CTL_MTYPE_MASK			GENMASK(11, 8)
> +#define NPCM_ECC_CTL_GLOBAL_INT_DISABLE		BIT(31)
> +
> +/* Syndrome values */
> +#define ECC_DOUBLE_MULTI_ERR_SYND			0x03
> +
> +static char data_synd[] = {
> +			0xf4, 0xf1, 0xec, 0xea, 0xe9, 0xe6, 0xe5, 0xe3,
> +			0xdc, 0xda, 0xd9, 0xd6, 0xd5, 0xd3, 0xce, 0xcb,
> +			0xb5, 0xb0, 0xad, 0xab, 0xa8, 0xa7, 0xa4, 0xa2,
> +			0x9d, 0x9b, 0x98, 0x97, 0x94, 0x92, 0x8f, 0x8a,
> +			0x75, 0x70, 0x6d, 0x6b, 0x68, 0x67, 0x64, 0x62,
> +			0x5e, 0x5b, 0x58, 0x57, 0x54, 0x52, 0x4f, 0x4a,
> +			0x34, 0x31, 0x2c, 0x2a, 0x29, 0x26, 0x25, 0x23,
> +			0x1c, 0x1a, 0x19, 0x16, 0x15, 0x13, 0x0e, 0x0b
> +		  };

This does not look correctly indented. At least the } should be at the 
beginning. The values can just be indented by one tab I believe. (At 
least that is what `indent --linux-style` does (GNU indent 2.2.12).

> +
> +static char check_synd[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};

At least `indent --linux-style` add a space after { and before }.

> +
> +struct npcm_edac_platform_data {
> +	/* force ECC event */
> +	u32 ip_features;
> +	u32 ddr_ctl_controller_busy_reg;
> +	u32 ecc_ctl_xor_check_bits_reg;
> +
> +	u32 chip;
> +
> +	/* DDR4 Controller Registers */
> +	u32 ddr_ctl_mem_type_reg;
> +	u32 ddr_ctl_mem_width_reg;
> +
> +	u32 ecc_ctl_en_reg;
> +	u32 ecc_ctl_int_mask;
> +	u32 ecc_ctl_int_status;
> +	u32 ecc_ctl_int_ack;
> +	u32 ecc_ctl_int_mask_master;
> +	u32 ecc_ctl_int_mask_ecc;
> +
> +	u32 ecc_sig_c_addr_l;
> +	u32 ecc_sig_c_addr_h;
> +	u32 ecc_sig_c_data_l;
> +	u32 ecc_sig_c_data_h;
> +	u32 ecc_sig_c_id;
> +	u32 ecc_sig_c_synd;
> +
> +	u32 ecc_sig_u_addr_l;
> +	u32 ecc_sig_u_addr_h;
> +	u32 ecc_sig_u_data_l;
> +	u32 ecc_sig_u_data_h;
> +	u32 ecc_sig_u_id;
> +	u32 ecc_sig_u_synd;
> +
> +	/* MASK */
> +	u32 ecc_ctl_ecc_enable_mask;
> +	u32 ecc_ctl_en_int_master_mask;
> +	u32 ecc_ctl_en_int_ecc_mask;
> +
> +	/* ECC IRQ Macros */
> +	u32 ecc_int_ce_event;
> +	u32 ecc_int_second_ce_event;
> +	u32 ecc_int_ue_event;
> +	u32 ecc_int_second_ue_event;
> +	u32 ecc_int_ce_ue_mask;
> +	u32 ecc_ce_intr_mask;
> +	u32 ecc_ue_intr_mask;
> +
> +	/* ECC Signature Macros */
> +	u32 ecc_sig_c_id_shift;
> +	u32 ecc_sig_c_synd_shift;
> +	u32 ecc_sig_c_addr_h_mask;
> +	u32 ecc_sig_c_id_mask;
> +	u32 ecc_sig_c_synd_mask;
> +
> +	u32 ecc_sig_u_id_shift;
> +	u32 ecc_sig_u_synd_shift;
> +	u32 ecc_sig_u_addr_h_mask;
> +	u32 ecc_sig_u_id_mask;
> +	u32 ecc_sig_u_synd_mask;
> +};
> +
> +struct priv_data {
> +	void __iomem *reg;
> +	u32 ce_cnt;
> +	u32 ue_cnt; > +	char message[EDAC_MSG_SIZE];
> +	const struct npcm_edac_platform_data *npcm_chip;
> +};
> +
> +
> +static void init_mem_layout(struct mem_ctl_info *mci)
> +{
> +	struct priv_data *priv = mci->pvt_info;
> +	const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> +	struct csrow_info *csi;
> +	struct dimm_info *dimm;
> +	struct sysinfo info;
> +	enum mem_type mtype;
> +	u32 val, width;
> +	u32 size, row;
> +	u8 j;

At least for loop variables, the default size integers should be used [1].

[…]


Kind regards,

Paul


[1]: https://notabs.org/coding/smallIntsBigPenalty.htm
