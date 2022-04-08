Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281954F9D73
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 21:05:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZnkz0lDyz3046
	for <lists+openbmc@lfdr.de>; Sat,  9 Apr 2022 05:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=HdVauC39;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=HdVauC39; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZnkX5x71z2xfC
 for <openbmc@lists.ozlabs.org>; Sat,  9 Apr 2022 05:05:08 +1000 (AEST)
Received: from zn.tnic (p200300ea971561a9329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9715:61a9:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E67201EC04CB;
 Fri,  8 Apr 2022 21:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1649444697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=KpaRWCXQvHMw13tAWTqc0fir1KBH9bfP8YIlzscHHqM=;
 b=HdVauC39hzz0mf3eYL8lBD/oGzomz9EgqNvtjWk8zITUxAo4TczKOZlAQmqdlAA7yFZZcU
 BqbYCj3AI+MIa63YihD9Z5vc4ExNEMntsEDQ4exSB4vlfK9Ln8HgcDDw2k4nm7YIIE1GwH
 h7SEgD73GgGHXiwyINA8Heo8RcViqmQ=
Date: Fri, 8 Apr 2022 21:04:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Medad CChien <medadyoung@gmail.com>
Subject: Re: [PATCH v6 3/3] EDAC: nuvoton: Add NPCM memory controller driver
Message-ID: <YlCHVen0zv/ujEYN@zn.tnic>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-4-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220322030152.19018-4-ctcchien@nuvoton.com>
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
 devicetree@vger.kernel.org, robh+dt@kernel.org, james.morse@arm.com,
 YSCHU@nuvoton.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
 tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 22, 2022 at 11:01:52AM +0800, Medad CChien wrote:
> Add support for Nuvoton NPCM SoC.
> 
> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):

I'm sure you can summarize this in one sentence instead of pasting all
the warnings in the commit message where they don't belong.

...

> diff --git a/drivers/edac/npcm_edac.c b/drivers/edac/npcm_edac.c
> new file mode 100644
> index 000000000000..9dd05bec0b7f
> --- /dev/null
> +++ b/drivers/edac/npcm_edac.c
> @@ -0,0 +1,706 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2022 Nuvoton Technology corporation.
> +
> +#include <linux/delay.h>
> +#include <linux/of_device.h>
> +
> +#include "edac_module.h"
> +
> +#define NPCM_EDAC_MOD_NAME "npcm-edac"
> +#define FORCED_ECC_ERR_EVENT_SUPPORT	BIT(1)
> +#define EDAC_MSG_SIZE                  256
> +/* Granularity of reported error in bytes */
> +#define NPCM_EDAC_ERR_GRAIN		1
> +
> +#define MEM_TYPE_DDR4			0xA
> +
> +#define NPCM8XX_CHIP			0x800
> +#define NPCM7XX_CHIP			0x700
> +
> +/* Control register width definitions */
> +#define WDTH_16				(2)
> +#define WDTH_32				(1)
> +#define WDTH_64				(0)
> +#define CTL_MEM_MAX_WIDTH_MASK		GENMASK(4, 0)
> +#define CTL_REG_WIDTH_SHIFT		(32)
> +#define XOR_CHECK_BIT_SPLIT_WIDTH		(16)
> +#define CTL_CONTROLLER_BUSY_FLAG	BIT(0)
> +#define NPCM_ECC_CTL_FORCE_WC		BIT(8)
> +#define NPCM_ECC_CTL_AUTO_WRITEBACK_EN	BIT(24)
> +#define NPCM_ECC_CTL_XOR_BITS_MASK		GENMASK(23, 16)
> +#define NPCM_ECC_CTL_MTYPE_MASK			GENMASK(11, 8)
> +#define NPCM_ECC_CTL_GLOBAL_INT_DISABLE	BIT(31)

Align those values vertically pls.

> +
> +#ifdef CONFIG_EDAC_DEBUG
> +
> +/* Syndrome values */
> +#define ECC_DOUBLE_MULTI_ERR_SYND	0x03
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
> +
> +static char check_synd[] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
> +#endif
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
> +	u32 ecc_sig_ecc_c_addr_l;
> +	u32 ecc_sig_ecc_c_addr_h;
> +	u32 ecc_sig_ecc_c_data_l;
> +	u32 ecc_sig_ecc_c_data_h;
> +	u32 ecc_sig_ecc_c_id;
> +	u32 ecc_sig_ecc_c_synd;
> +
> +	u32 ecc_sig_ecc_u_addr_l;
> +	u32 ecc_sig_ecc_u_addr_h;
> +	u32 ecc_sig_ecc_u_data_l;
> +	u32 ecc_sig_ecc_u_data_h;
> +	u32 ecc_sig_ecc_u_id;
> +	u32 ecc_sig_ecc_u_synd;
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
> +	u32 ecc_sig_ecc_c_id_shift;
> +	u32 ecc_sig_ecc_c_synd_shift;
> +	u32 ecc_sig_ecc_c_addr_h_mask;
> +	u32 ecc_sig_ecc_c_id_mask;
> +	u32 ecc_sig_ecc_c_synd_mask;
> +
> +	u32 ecc_sig_ecc_u_id_shift;
> +	u32 ecc_sig_ecc_u_synd_shift;
> +	u32 ecc_sig_ecc_u_addr_h_mask;
> +	u32 ecc_sig_ecc_u_id_mask;
> +	u32 ecc_sig_ecc_u_synd_mask;

I'd try to shorten those if I were you - "ecc_sig_" could go, "ecc_int_"
too. Then the code accessing them would become more readable and you
won't have to break long lines.

> +};
> +
> +struct priv_data {
> +	void __iomem *reg;
> +	u32 ce_cnt;
> +	u32 ue_cnt;
> +	char message[EDAC_MSG_SIZE];
> +	const struct npcm_edac_platform_data *npcm_chip;
> +};
> +
> +#ifdef CONFIG_EDAC_DEBUG

Move that ifdeffery...

> +static void init_mem_layout(struct mem_ctl_info *mci)
> +{

... here and then you won't need the ifdeffery at the call site below.

> +	struct priv_data *priv = mci->pvt_info;
> +	const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> +	struct csrow_info *csi;
> +	struct dimm_info *dimm;
> +	struct sysinfo inf;
> +	enum mem_type mtype;
> +	u32 val, width;
> +	u32 size, row;
> +	u8 j;
> +
> +	dimm = edac_get_dimm(mci, 0, 0, 0);
> +	if (!dimm) {

Save an indentation level:

	if (dimm)
		return;

	si_meminfo(&inf);
	...

> +		si_meminfo(&inf);
> +		for (row = 0; row < mci->nr_csrows; row++) {
> +			csi = mci->csrows[row];
> +			size = inf.totalram * inf.mem_unit;
> +
> +			for (j = 0; j < csi->nr_channels; j++) {
> +				dimm            = csi->channels[j]->dimm;
> +				dimm->edac_mode = EDAC_FLAG_SECDED;
> +				/* Get memory type by reading hw registers*/
> +				val = readl(priv->reg + npcm_chip->ddr_ctl_mem_type_reg);
> +				mtype = val & NPCM_ECC_CTL_MTYPE_MASK;
> +
> +				if (mtype == MEM_TYPE_DDR4)
> +					dimm->mtype = MEM_DDR4;
> +				else
> +					dimm->mtype = MEM_EMPTY;
> +
> +				/*Get EDAC devtype width for the current mc*/

Put spaces between the * and the text. There are other comments who have
this, pls fix them all.

> +				width = readl(priv->reg + npcm_chip->ddr_ctl_mem_width_reg)
> +					      & CTL_MEM_MAX_WIDTH_MASK;
> +				switch (width) {
> +				case WDTH_16:
> +					dimm->dtype  = DEV_X2;
> +					break;
> +				case WDTH_32:
> +					dimm->dtype  = DEV_X4;
> +					break;
> +				case WDTH_64:
> +					dimm->dtype  = DEV_X8;
> +					break;
> +				default:
> +					dimm->dtype = DEV_UNKNOWN;
> +				}
> +
> +				dimm->nr_pages  = (size >> PAGE_SHIFT) /
> +					csi->nr_channels;
> +				dimm->grain     = NPCM_EDAC_ERR_GRAIN;
> +			}
> +		}
> +	}
> +}
> +#endif
> +
> +static void handle_ce(struct mem_ctl_info *mci)
> +{
> +	struct priv_data *priv = mci->pvt_info;
> +	const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> +	u64 err_c_addr = 0x0;
> +	u64 err_c_data = 0x0;
> +	u32 err_c_synd, err_c_id;
> +	u32 sig_val_l, sig_val_h;
> +
> +	sig_val_l = readl(priv->reg + npcm_chip->ecc_sig_ecc_c_addr_l);
> +
> +	if (npcm_chip->chip == NPCM8XX_CHIP)
> +		sig_val_h = (readl(priv->reg + npcm_chip->ecc_sig_ecc_c_addr_h) &
> +				npcm_chip->ecc_sig_ecc_c_addr_h_mask);
> +	else
> +		sig_val_h = 0x0;

assign those vars to 0 at declaration time and you won't need the else
branch here...

> +
> +	err_c_addr = (((err_c_addr | sig_val_h) <<
> +				CTL_REG_WIDTH_SHIFT) | sig_val_l);
> +
> +	sig_val_l = readl(priv->reg + npcm_chip->ecc_sig_ecc_c_data_l);
> +
> +	if (npcm_chip->chip == NPCM8XX_CHIP)
> +		sig_val_h = readl(priv->reg + npcm_chip->ecc_sig_ecc_c_data_h);
> +	else
> +		sig_val_h = 0x0;

... and here.

Ditto for handle_ue() below.

> +	err_c_data = (((err_c_data | sig_val_h) <<
> +				CTL_REG_WIDTH_SHIFT) | sig_val_l);
> +
> +	err_c_id = ((readl(priv->reg + npcm_chip->ecc_sig_ecc_c_id) &
> +				npcm_chip->ecc_sig_ecc_c_id_mask) >>
> +				npcm_chip->ecc_sig_ecc_c_id_shift);
> +
> +	err_c_synd = ((readl(priv->reg + npcm_chip->ecc_sig_ecc_c_synd) &
> +				npcm_chip->ecc_sig_ecc_c_synd_mask) >>
> +				npcm_chip->ecc_sig_ecc_c_synd_shift);
> +
> +	priv->ce_cnt = priv->ce_cnt + 1;
> +
> +	snprintf(priv->message,
> +		 EDAC_MSG_SIZE, "DDR ECC %s: data=0x%llx source_id=%#08x",
> +		 mci->ctl_name, err_c_data, err_c_id);
> +
> +	edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> +			     1,
> +			     err_c_addr >> PAGE_SHIFT,
> +			     err_c_addr & ~PAGE_MASK,
> +			     err_c_synd, 0, 0, -1,
> +			     priv->message, "");
> +}
>

...

> +static ssize_t forced_ecc_error_store(struct device *dev,
> +				      struct device_attribute *mattr,
> +				      const char *data, size_t count)
> +{
> +	struct mem_ctl_info *mci = to_mci(dev);
> +	struct priv_data *priv = mci->pvt_info;
> +	const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> +	int	args_cnt;
> +	int	ret;
> +	char	**args;
> +	u32	regval;
> +	u8	bit_no;
> +
> +	/* Split string buffer into separate parameters */
> +	args = argv_split(GFP_KERNEL, data, &args_cnt);

Move that args splitting...

> +
> +	/* Check ecc enabled */
> +	if (!(readl(priv->reg + npcm_chip->ecc_ctl_en_reg) & npcm_chip->ecc_ctl_ecc_enable_mask))
> +		return count;
> +
> +	/* Check no write operation pending to controller*/
> +	while (readl(priv->reg + npcm_chip->ddr_ctl_controller_busy_reg) &
> +			CTL_CONTROLLER_BUSY_FLAG) {
> +		usleep_range(1000, 10000);
> +	}

... here.

> +
> +	/* Write appropriate syndrome to xor_check_bit*/

Any documentation about the string being written to debugfs here? I
wouldn't want to read the source each time :)

> +	if (!strcmp(args[0], "CE") && args_cnt == 3) {
> +		ret = kstrtou8(args[2], 0, &bit_no);
> +		if (ret)
> +			return ret;
> +		if (!strcmp(args[1], "checkcode")) {
> +			if (bit_no > 7) {
> +				edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME, "bit_no for checkcode must be 0~7\n");
> +				return count;
> +			}
> +			regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +			regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
> +				(check_synd[bit_no] << XOR_CHECK_BIT_SPLIT_WIDTH);
> +			writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +		} else if (!strcmp(args[1], "data")) {
> +			if (bit_no > 63) {
> +				edac_printk(KERN_INFO, NPCM_EDAC_MOD_NAME, "bit_no for data must be 0~63\n");
> +				return count;
> +			}
> +			regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +			regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
> +					 (data_synd[bit_no] << XOR_CHECK_BIT_SPLIT_WIDTH);
> +			writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +		}
> +		/* Enable the ECC writeback_en for corrected error */
> +		regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +		writel((regval | NPCM_ECC_CTL_AUTO_WRITEBACK_EN),
> +		       priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +	} else if (!strcmp(args[0], "UE")) {
> +		regval = readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +		regval = (regval & ~(NPCM_ECC_CTL_XOR_BITS_MASK)) |
> +				 (ECC_DOUBLE_MULTI_ERR_SYND << XOR_CHECK_BIT_SPLIT_WIDTH);
> +		writel(regval, priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +	}
> +
> +	/* Assert fwc */
> +	writel((NPCM_ECC_CTL_FORCE_WC | readl(priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg)),
> +	       priv->reg + npcm_chip->ecc_ctl_xor_check_bits_reg);
> +
> +	return count;
> +}

...

> +#ifdef CONFIG_EDAC_DEBUG
> +	if ((npcm_chip->ip_features & FORCED_ECC_ERR_EVENT_SUPPORT) &&
> +	    npcm_chip->chip == NPCM8XX_CHIP) {
> +		if (create_sysfs_attributes(mci)) {
> +			edac_printk(KERN_ERR, NPCM_EDAC_MOD_NAME,
> +				    "Failed to create sysfs entries\n");
> +			goto err1;
> +		}
> +	}
> +#endif
> +
> +	/* Only enable MC interrupts with ECC - clear global int mask bit and ecc bit */
> +	writel(npcm_chip->ecc_ctl_en_int_master_mask,
> +	       priv_data->reg + npcm_chip->ecc_ctl_int_mask_master);
> +
> +	if (npcm_chip->chip == NPCM8XX_CHIP) {
> +		/* clear single and multi for ce and ue */
> +		writel(npcm_chip->ecc_ctl_en_int_ecc_mask,
> +		       priv_data->reg + npcm_chip->ecc_ctl_int_mask_ecc);
> +	}
> +
> +	return 0;
> +
> +#ifdef CONFIG_EDAC_DEBUG
> +err1:
> +#endif

This is just silly. Why should loading of the driver fail when it cannot
create a couple of sysfs debugging helpers? I think you're fine if you
simply issue the error message but continue.

> +
> +	edac_mc_del_mc(&pdev->dev);
> +
> +err:
> +	edac_mc_free(mci);
> +	return ret;
> +}
> +
> +static int npcm_edac_mc_remove(struct platform_device *pdev)
> +{
> +	struct mem_ctl_info *mci = platform_get_drvdata(pdev);
> +	struct priv_data *priv = mci->pvt_info;
> +	const struct npcm_edac_platform_data *npcm_chip = priv->npcm_chip;
> +
> +	writel(NPCM_ECC_CTL_GLOBAL_INT_DISABLE, priv->reg + npcm_chip->ecc_ctl_int_mask_master);
> +
> +	/* Disable ecc feature before removing driver by writing 0 */
> +	writel((unsigned int)(~(npcm_chip->ecc_ctl_ecc_enable_mask)),
> +	       priv->reg + npcm_chip->ecc_ctl_en_reg);
> +
> +#ifdef CONFIG_EDAC_DEBUG
> +	remove_sysfs_attributes(mci);
> +#endif
> +	edac_mc_del_mc(&pdev->dev);
> +	edac_mc_free(mci);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver npcm_edac_mc_driver = {
> +	.driver = {
> +		   .name = "npcm-edac",
> +		   .of_match_table = npcm_edac_of_match,
> +	},
> +	.probe = npcm_edac_mc_probe,
> +	.remove = npcm_edac_mc_remove,
> +};
> +
> +module_platform_driver(npcm_edac_mc_driver);
> +
> +MODULE_AUTHOR("Medad <ctcchien@nuvoton.com>");
			^^

Your surname too pls.

> +MODULE_DESCRIPTION("Nuvoton NPCM EDAC Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
