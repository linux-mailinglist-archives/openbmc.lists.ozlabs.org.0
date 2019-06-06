Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B838326
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 05:31:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kp3k4g7BzDqs8
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 13:31:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=james.morse@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45KVLQ0spgzDqjp
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2019 01:43:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C8AEA78;
 Thu,  6 Jun 2019 08:43:17 -0700 (PDT)
Received: from [10.1.196.105] (eglon.cambridge.arm.com [10.1.196.105])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0BAA3F690;
 Thu,  6 Jun 2019 08:43:12 -0700 (PDT)
Subject: Re: [PATCH 5.2 v2 1/2] edac: npcm: Add Nuvoton NPCM7xx EDAC driver
To: George Hung <ghung.quanta@gmail.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
From: James Morse <james.morse@arm.com>
Message-ID: <4aa49cc7-17d7-5729-005e-b75bf853bf15@arm.com>
Date: Thu, 6 Jun 2019 16:43:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605141253.38554-1-ghung.quanta@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:30:26 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 paulmck@linux.ibm.com, wak@google.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, tomer.maimon@nuvoton.com, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Avi.Fishman@nuvoton.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-edac <linux-edac@vger.kernel.org>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George,

On 05/06/2019 15:12, George Hung wrote:
> Add support for the Nuvoton NPCM7xx SoC EDAC driver

Could you say something about what the NPCM7xx SoC is, and what errors its memory
controller can detect?

The commit message is for describing what/why this code was added.

Is this Cadence DDR Manual available anywhere?


> NPCM7xx ECC datasheet from nuvoton.israel-Poleg:
> "Cadence DDR Controller User’s Manual For DDR3 & DDR4 Memories"
> 
> Tested: Forcing an ECC error event
> 
> Write a value to the xor_check_bits parameter that will trigger
> an ECC event once that word is read
> 
> For example, to force a single-bit correctable error on bit 0 of
> the user-word space shown, write 0x75 into that byte of the
> xor_check_bits parameter and then assert fwc (force write check)
> bit to 'b1' (mem base: 0xf0824000, xor_check_bits reg addr: 0x178)
> 
> $ devmem 0xf0824178 32 0x7501
> 
> To force a double-bit un-correctable error for the user-word space,
> write 0x03 into that byte of the xor_check_bits parameter
> 
> $ devmem 0xf0824178 32 0x301

This is great to know, but it doesn't belong in the commit message. Please move it to the
cover letter ... Please add a cover letter to any series with multiple patches!


> diff --git a/drivers/edac/npcm7xx_edac.c b/drivers/edac/npcm7xx_edac.c
> new file mode 100644
> index 000000000000..2d2deb81e49c
> --- /dev/null
> +++ b/drivers/edac/npcm7xx_edac.c
> @@ -0,0 +1,424 @@

> +#include <linux/edac.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +
> +#include "edac_module.h"
> +
> +#define ECC_ENABLE                     BIT(24)
> +#define ECC_EN_INT_MASK                0x7fffff87
> +
> +#define INT_STATUS_ADDR                116
> +#define INT_ACK_ADDR                   117
> +#define INT_MASK_ADDR                  118

> +#define ECC_EN_ADDR                    93
> +#define ECC_C_ADDR_ADDR                98
> +#define ECC_C_DATA_ADDR                100
> +#define ECC_C_ID_ADDR                  101
> +#define ECC_C_SYND_ADDR                99
> +#define ECC_U_ADDR_ADDR                95
> +#define ECC_U_DATA_ADDR                97
> +#define ECC_U_ID_ADDR                  101
> +#define ECC_U_SYND_ADDR                96

All the users of these multiply them by 4 first.
If these are numbers that are easy to check in the datasheet, then we should keep them
visible. But it would be good to wrap the '*4' up in a macro that describes what is going
on. Something like:

| #define SLOT(x)			(4*x)
| #define ECC_U_SYND_ADDR               SLOT(96)

This way some future developer can't accidentally use the bare ECC_U_SYND_ADDR as an
address/offset.


> +#define ECC_ERROR                      -1
> +#define EDAC_MSG_SIZE                  256
> +#define EDAC_MOD_NAME                  "npcm7xx-edac"
> +
> +struct ecc_error_signature_info {
> +	u32 ecc_addr;
> +	u32 ecc_data;
> +	u32 ecc_id;
> +	u32 ecc_synd;
> +};
> +
> +struct npcm7xx_ecc_int_status {

> +	u32 int_mask;
> +	u32 int_status;
> +	u32 int_ack;

Nothing uses these three.


> +	u32 ce_cnt;
> +	u32 ue_cnt;
> +	struct ecc_error_signature_info ceinfo;
> +	struct ecc_error_signature_info ueinfo;
> +};
> +
> +struct npcm7xx_edac_priv {
> +	void __iomem *baseaddr;
> +	char message[EDAC_MSG_SIZE];
> +	struct npcm7xx_ecc_int_status stat;
> +};
> +
> +/**
> + * npcm7xx_edac_get_ecc_syndrom - Get the current ecc error info
> + * @base:	Pointer to the base address of the ddr memory controller
> + * @p:		Pointer to the Nuvoton ecc status structure
> + *
> + * Determines there is any ecc error or not
> + *
> + * Return: ECC detection status
> + */
> +static int npcm7xx_edac_get_ecc_syndrom(void __iomem *base,
> +					struct npcm7xx_ecc_int_status *p)
> +{
> +	int status = 0;
> +	u32 int_status = 0;

I've muddled these up already! Can status be called ret/rv/edac_error?
Or int_status renamed irq_status...


> +	int_status = readl(base + 4*INT_STATUS_ADDR);

> +	writel(int_status, base + 4*INT_ACK_ADDR);

Should you read the other addr/data/synd values before writing to this register?
Could the hardware clear those values before we get to read them? or overwrite them if a
new error is detected?


> +	edac_dbg(3, "int_status: %#08x\n", int_status);
> +

> +	if ((int_status & (1 << 6)) == (1 << 6)) {

| #define NPCM7XX_STATUS_MUC	BIT(6)
| if (int_status & EDAC_NPCM7XX_STATUS_MUC) {

is much more readable. This lets you give the bits names that can match the datasheet.
If this applies to other potential users of the same Cadence IP block, please reflect that
in the name.


> +		edac_dbg(3, "6-Mult uncorrectable detected.\n");
> +		p->ue_cnt++;
> +		status = ECC_ERROR;
> +	}
> +
> +	if ((int_status & (1 << 5)) == (1 << 5)) {
> +		edac_dbg(3, "5-An uncorrectable detected\n");
> +		p->ue_cnt++;
> +		status = ECC_ERROR;
> +	}
> +
> +	if ((int_status & (1 << 4)) == (1 << 4)) {
> +		edac_dbg(3, "4-mult correctable detected.\n");
> +		p->ce_cnt++;
> +		status = ECC_ERROR;
> +	}
> +
> +	if ((int_status & (1 << 3)) == (1 << 3)) {
> +		edac_dbg(3, "3-A correctable detected.\n");
> +		p->ce_cnt++;
> +		status = ECC_ERROR;
> +	}
> +
> +	if (status == ECC_ERROR) {
> +		u32 ecc_id;
> +

> +		p->ceinfo.ecc_addr = readl(base + 4*ECC_C_ADDR_ADDR);
> +		p->ceinfo.ecc_data = readl(base + 4*ECC_C_DATA_ADDR);
> +		p->ceinfo.ecc_synd = readl(base + 4*ECC_C_SYND_ADDR);
> +
> +		p->ueinfo.ecc_addr = readl(base + 4*ECC_U_ADDR_ADDR);
> +		p->ueinfo.ecc_data = readl(base + 4*ECC_U_DATA_ADDR);
> +		p->ueinfo.ecc_synd = readl(base + 4*ECC_U_SYND_ADDR);
> +
> +		/* ECC_C_ID_ADDR has same value as ECC_U_ID_ADDR */
> +		ecc_id = readl(base + 4*ECC_C_ID_ADDR);
> +		p->ueinfo.ecc_id = ecc_id & 0xffff;
> +		p->ceinfo.ecc_id = ecc_id >> 16;

Do these still relate to the same error? You acknowledged the interrupt early, is it
possible these registers now hold details for a new error with its own pending irq?


> +	}
> +
> +	return status;
> +}
> +
> +/**
> + * npcm7xx_edac_handle_error - Handle controller error types CE and UE
> + * @mci:	Pointer to the edac memory controller instance
> + * @p:		Pointer to the Nuvoton ecc status structure
> + *
> + * Handles the controller ECC correctable and un correctable error.
> + */
> +static void npcm7xx_edac_handle_error(struct mem_ctl_info *mci,
> +				    struct npcm7xx_ecc_int_status *p)
> +{
> +	struct npcm7xx_edac_priv *priv = mci->pvt_info;
> +	u32 page, offset;
> +
> +	if (p->ce_cnt) {
> +		snprintf(priv->message, EDAC_MSG_SIZE,
> +			"DDR ECC: synd=%#08x addr=%#08x data=%#08x source_id=%#08x ",
> +			p->ceinfo.ecc_synd, p->ceinfo.ecc_addr,
> +			p->ceinfo.ecc_data, p->ceinfo.ecc_id);
> +
> +		page = p->ceinfo.ecc_addr >> PAGE_SHIFT;

PHYS_PFN()?


> +		offset = p->ceinfo.ecc_addr & ~PAGE_MASK;

I recently learnt there is a helper for this: offset_in_page()


> +		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
> +				     p->ce_cnt, page, offset,
> +				     p->ceinfo.ecc_synd,
> +				     0, 0, -1,
> +				     priv->message, "");
> +	}
> +
> +	if (p->ue_cnt) {
> +		snprintf(priv->message, EDAC_MSG_SIZE,
> +			"DDR ECC: synd=%#08x addr=%#08x data=%#08x source_id=%#08x ",
> +			p->ueinfo.ecc_synd, p->ueinfo.ecc_addr,
> +			p->ueinfo.ecc_data, p->ueinfo.ecc_id);
> +
> +		page = p->ueinfo.ecc_addr >> PAGE_SHIFT;
> +		offset = p->ueinfo.ecc_addr & ~PAGE_MASK;
> +		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
> +				     p->ue_cnt, page, offset,
> +				     p->ueinfo.ecc_synd,
> +				     0, 0, -1,
> +				     priv->message, "");
> +	}
> +
> +	memset(p, 0, sizeof(*p));
> +}
> +
> +/**
> + * npcm7xx_edac_check - Check controller for ECC errors
> + * @mci:	Pointer to the edac memory controller instance
> + *
> + * This routine is used to check and post ECC errors and is called by
> + * this driver's CE and UE interrupt handler.
> + */
> +static void npcm7xx_edac_check(struct mem_ctl_info *mci)

Returning whether any errors were processed here is going to be useful later on...


> +{
> +	struct npcm7xx_edac_priv *priv = mci->pvt_info;
> +	int status = 0;
> +
> +	status = npcm7xx_edac_get_ecc_syndrom(priv->baseaddr, &priv->stat);
> +	if (status != ECC_ERROR)
> +		return;
> +
> +	npcm7xx_edac_handle_error(mci, &priv->stat);
> +}
> +
> +/**
> + * npcm7xx_edac_isr - CE/UE interrupt service routine
> + * @irq:    The virtual interrupt number being serviced.
> + * @dev_id: A pointer to the EDAC memory controller instance
> + *          associated with the interrupt being handled.
> + *
> + * This routine implements the interrupt handler for both correctable
> + * (CE) and uncorrectable (UE) ECC errors for the Nuvoton Cadence DDR
> + * controller. It simply calls through to the routine used to check,
> + * report and clear the ECC status.
> + *
> + * Unconditionally returns IRQ_HANDLED.

... it would be better to return IRQ_NONE if this driver had no work to do. Your status
register means the device tells you if it triggered an interrupt. This is good manners for
shared IRQs, and its what the kernel uses to track spurious IRQs.


> + */
> +static irqreturn_t npcm7xx_edac_isr(int irq, void *dev_id)
> +{
> +	struct mem_ctl_info *mci = dev_id;

> +	int npcm_edac_report = 0;
> +
> +	npcm_edac_report = edac_get_report_status();
> +	if (npcm_edac_report != EDAC_REPORTING_DISABLED)

|	if (edac_get_report_status() != EDAC_REPORTING_DISABLED)

Would save you some lines here. No need to initialise the variable if you're about to
overwrite it.


> +		npcm7xx_edac_check(mci);
> +
> +	return IRQ_HANDLED;
> +}

> +static int npcm7xx_edac_register_irq(struct mem_ctl_info *mci,
> +					struct platform_device *pdev)
> +{
> +	int status = 0;
> +	int mc_irq;
> +	struct npcm7xx_edac_priv *priv = mci->pvt_info;
> +
> +	/* Only enable MC interrupts with ECC - clear int_mask[6:3] */
> +	writel(ECC_EN_INT_MASK, priv->baseaddr + 4*INT_MASK_ADDR);
> +
> +	mc_irq = platform_get_irq(pdev, 0);
> +
> +	if (!mc_irq) {
> +		edac_printk(KERN_ERR, EDAC_MC, "Unable to map interrupts.\n");
> +		status = -ENODEV;
> +		goto fail;

As you don't do any free()ing to unwind stuff with this goto, you may as well 'return
-ENODEV' in both places you have the goto.

> +	}
> +
> +	status = devm_request_irq(&pdev->dev, mc_irq, npcm7xx_edac_isr,

> +				0,

If you can pass IRQF_SHARED here, please do. You can identify when your device generated
an interrupt, so you don't need exclusive use of it. Someone else with the same IP block
may have wired additional things up to that line.


> +			       "npcm-memory-controller", mci);
> +
> +	if (status < 0) {
> +		edac_printk(KERN_ERR, EDAC_MC,
> +				      "Unable to request irq %d for ECC",
> +				      mc_irq);
> +		status = -ENODEV;
> +		goto fail;
> +	}
> +
> +	return 0;
> +
> +fail:> +	return status;
> +}

> +/**
> + * npcm7xx_edac_mc_init - Initialize driver instance
> + * @mci:	Pointer to the edac memory controller instance
> + * @pdev:	Pointer to the platform_device struct
> + *
> + * Performs initialization of the EDAC memory controller instance and
> + * related driver-private data associated with the memory controller the
> + * instance is bound to.
> + *
> + * Returns 0 if OK; otherwise, < 0 on error.
> + */
> +static int npcm7xx_edac_mc_init(struct mem_ctl_info *mci,
> +				 struct platform_device *pdev)
> +{
> +	const struct of_device_id *id;

> +	id = of_match_device(npcm7xx_edac_of_match, &pdev->dev);
> +	if (!id)
> +		return -ENODEV;

Is this possible? I thought the OF code did this for you as part of matching the device
and driver together. This happened before calling your probe() function.


> +	/* Initialize controller capabilities and configuration */
> +	mci->mtype_cap = MEM_FLAG_DDR4;
> +	mci->edac_ctl_cap = EDAC_FLAG_SECDED;
> +	mci->edac_cap = EDAC_FLAG_SECDED;
> +	mci->scrub_cap = SCRUB_FLAG_HW_SRC;
> +	mci->scrub_mode = SCRUB_HW_SRC;
> +	mci->ctl_name = id->compatible;
> +	mci->dev_name = dev_name(&pdev->dev);
> +	mci->mod_name = EDAC_MOD_NAME;
> +
> +	edac_op_state = EDAC_OPSTATE_INT;

Why does any of this need to be in a separate function?


> +	return 0;
> +}
> +
> +/**
> + * npcm7xx_edac_get_eccstate - Return the controller ecc enable/disable status
> + * @base:	Pointer to the ddr memory controller base address
> + *
> + * Get the ECC enable/disable status for the controller
> + *
> + * Return: a ecc status boolean i.e true/false - enabled/disabled.
> + */
> +static bool npcm7xx_edac_get_eccstate(void __iomem *base)
> +{
> +	u32 ecc_en;
> +	bool state = false;
> +
> +	ecc_en = readl(base + 4*ECC_EN_ADDR);
> +	if (ecc_en & ECC_ENABLE) {
> +		edac_printk(KERN_INFO, EDAC_MC, "ECC reporting and correcting on. ");

Spurious printk()? You are going to get a message from edac when you register the device too.


> +		state = true;
> +	}
> +
> +	return state;
> +}
> +
> +/**
> + * npcm7xx_edac_mc_probe - Check controller and bind driver
> + * @pdev:	Pointer to the platform_device struct
> + *
> + * Probes a specific controller instance for binding with the driver.
> + *
> + * Return: 0 if the controller instance was successfully bound to the
> + * driver; otherwise, < 0 on error.
> + */
> +static int npcm7xx_edac_mc_probe(struct platform_device *pdev)
> +{
> +	struct mem_ctl_info *mci;
> +	struct edac_mc_layer layers[1];
> +	struct npcm7xx_edac_priv *priv;
> +	struct resource *res;
> +	void __iomem *baseaddr;
> +	int rc;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	baseaddr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(baseaddr)) {
> +		edac_printk(KERN_ERR, EDAC_MOD_NAME,
> +			    "DDR controller regs not defined\n");
> +		return PTR_ERR(baseaddr);
> +	}
> +
> +	/*
> +	 * Check if ECC is enabled.
> +	 * If not, there is no useful monitoring that can be done
> +	 * for this controller.
> +	 */
> +	if (!npcm7xx_edac_get_eccstate(baseaddr)) {
> +		edac_printk(KERN_INFO, EDAC_MC, "ECC disabled\n");
> +		return -ENXIO;
> +	}
> +
> +	/*
> +	 * Allocate an EDA controller instance and perform the appropriate
> +	 * initialization.
> +	 */
> +	layers[0].type = EDAC_MC_LAYER_ALL_MEM;
> +	layers[0].size = 1;
> +
> +	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
> +			    sizeof(struct npcm7xx_edac_priv));
> +	if (!mci) {
> +		edac_printk(KERN_ERR, EDAC_MC,
> +			    "Failed memory allocation for mc instance\n");
> +		return -ENOMEM;
> +	}
> +
> +	mci->pdev = &pdev->dev;
> +	priv = mci->pvt_info;
> +	priv->baseaddr = baseaddr;
> +	platform_set_drvdata(pdev, mci);


> +	rc = npcm7xx_edac_mc_init(mci, pdev);
> +	if (rc) {
> +		edac_printk(KERN_ERR, EDAC_MC,
> +			    "Failed to initialize instance\n");
> +		goto free_edac_mc;
> +	}

I don't think this error handling can ever be triggered. I don't see the point of the
extra init function.


> +	/* Attempt to register it with the EDAC subsystem */
> +	rc = edac_mc_add_mc(mci);
> +	if (rc) {
> +		edac_printk(KERN_ERR, EDAC_MC,
> +			    "Failed to register with EDAC core\n");
> +		goto free_edac_mc;
> +	}
> +
> +	/* Register interrupts */
> +	rc = npcm7xx_edac_register_irq(mci, pdev);
> +	if (rc)
> +		goto free_edac_mc;
> +
> +	return 0;
> +
> +free_edac_mc:
> +	edac_mc_free(mci);
> +
> +	return rc;
> +}
> +
> +/**
> + * npcm7xx_edac_mc_remove - Unbind driver from controller
> + * @pdev:	Pointer to the platform_device struct
> + *
> + * Return: Unconditionally 0
> + */
> +static int npcm7xx_edac_mc_remove(struct platform_device *pdev)
> +{
> +	struct mem_ctl_info *mci = platform_get_drvdata(pdev);

Your irq register function poked the hardware to enable the irq:
|	writel(ECC_EN_INT_MASK, priv->baseaddr + 4*INT_MASK_ADDR);

Shouldn't we turn it off?

If this is a shared interrupt it will keep waking up anything else using that irq for no
reason.


> +	edac_mc_del_mc(&pdev->dev);
> +	edac_mc_free(mci);


Hmmm. Either the devres stuff is freed before this remove() call, in which case we can't
touch the iomapping. Or its freed after, and the interrupt could still be running on
another CPU while we free() the edac memory underneath it....

~

It looks like all this happens in drivers/base/dd.c::__device_release_driver().
That calls drv->remove() (which comes in here), and then calls devres_release_all().

So I'm pretty sure the interrupt can still be registered after you've freed the edac bits.

Can we unregister it explicitly with devm_free_irq() before freeing the memory?


> +	return 0;
> +}


Thanks,

James
