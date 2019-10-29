Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7EEB9B1
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 23:27:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4740L93y2DzF468
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 09:26:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472bHs1QrhzF36w
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 02:35:05 +1100 (AEDT)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1iPTWL-0001qa-LN; Tue, 29 Oct 2019 16:34:57 +0100
Message-ID: <f9ccc316d0974d162bee421baaa2c872632cdc5b.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/3] reset: npcm: add NPCM reset controller driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, 
 mark.rutland@arm.com, yuenn@google.com, venture@google.com, 
 benjaminfair@google.com, avifishman70@gmail.com, joel@jms.id.au
Date: Tue, 29 Oct 2019 16:34:56 +0100
In-Reply-To: <20191028155403.134126-4-tmaimon77@gmail.com>
References: <20191028155403.134126-1-tmaimon77@gmail.com>
 <20191028155403.134126-4-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Mailman-Approved-At: Fri, 01 Nov 2019 09:21:56 +1100
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2019-10-28 at 17:54 +0200, Tomer Maimon wrote:
> Add Nuvoton NPCM BMC reset controller driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/reset/Kconfig      |   7 +
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-npcm.c | 275 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 283 insertions(+)
>  create mode 100644 drivers/reset/reset-npcm.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7b07281aa0ae..5dbfdf6d717a 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -89,6 +89,13 @@ config RESET_MESON_AUDIO_ARB
>  	  This enables the reset driver for Audio Memory Arbiter of
>  	  Amlogic's A113 based SoCs
>  
> +config RESET_NPCM
> +	bool "NPCM BMC Reset Driver"
> +	depends on ARCH_NPCM || COMPILE_TEST
> +	help
> +	  This enables the reset controller driver for Nuvoton NPCM 
> +	  BMC SoCs.
> +

Is there any reason to ever disable this driver when building ARCH_NPCM?

>  config RESET_OXNAS
>  	bool
>  
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index cf60ce526064..00767c03f5f2 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> +obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>  obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
>  obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
>  obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
> diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
> new file mode 100644
> index 000000000000..ebb3071767e1
> --- /dev/null
> +++ b/drivers/reset/reset-npcm.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology corporation.
> +
> +#include <linux/clk.h>

Please remove unused header includes.

> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reboot.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/of_address.h>
> +
> +/* NPCM7xx GCR registers */
> +#define NPCM_MDLR_OFFSET	0x7C
> +#define NPCM_MDLR_USBD0		BIT(9)
> +#define NPCM_MDLR_USBD1		BIT(8)
> +#define NPCM_MDLR_USBD2_4	BIT(21)
> +#define NPCM_MDLR_USBD5_9	BIT(22)
> +
> +#define NPCM_USB1PHYCTL_OFFSET	0x140
> +#define NPCM_USB2PHYCTL_OFFSET	0x144
> +#define NPCM_USBXPHYCTL_RS	BIT(28)
> +
> +/* NPCM7xx Reset registers */
> +#define NPCM_SWRSTR		0x14
> +#define NPCM_SWRST		BIT(2)
> +
> +#define NPCM_IPSRST1		0x20
> +#define NPCM_IPSRST1_USBD1	BIT(5)
> +#define NPCM_IPSRST1_USBD2	BIT(8)
> +#define NPCM_IPSRST1_USBD3	BIT(25)
> +#define NPCM_IPSRST1_USBD4	BIT(22)
> +#define NPCM_IPSRST1_USBD5	BIT(23)
> +#define NPCM_IPSRST1_USBD6	BIT(24)
> +
> +#define NPCM_IPSRST2		0x24
> +#define NPCM_IPSRST2_USB_HOST	BIT(26)
> +
> +#define NPCM_IPSRST3		0x34
> +#define NPCM_IPSRST3_USBD0	BIT(4)
> +#define NPCM_IPSRST3_USBD7	BIT(5)
> +#define NPCM_IPSRST3_USBD8	BIT(6)
> +#define NPCM_IPSRST3_USBD9	BIT(7)
> +#define NPCM_IPSRST3_USBPHY1	BIT(24)
> +#define NPCM_IPSRST3_USBPHY2	BIT(25)
> +
> +#define NPCM_RC_RESETS_PER_REG	32
> +
> +struct npcm_rc_data {
> +	struct reset_controller_dev rcdev;
> +	struct notifier_block restart_nb;
> +	u32 sw_reset_number;
> +	void __iomem *base;
> +	spinlock_t lock;
> +};
> +
> +#define to_rc_data(p) container_of(p, struct npcm_rc_data, rcdev)
> +
> +static int npcm_rc_restart(struct notifier_block *nb, unsigned long mode,
> +			   void *cmd)
> +{
> +	struct npcm_rc_data *rc = container_of(nb, struct npcm_rc_data,
> +					       restart_nb);
> +
> +	writel(NPCM_SWRST << rc->sw_reset_number, rc->base + NPCM_SWRSTR);
> +	mdelay(1000);
> +
> +	pr_emerg("%s: unable to restart system\n", __func__);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int npcm_rc_setclear_reset(struct reset_controller_dev *rcdev,
> +				  unsigned long id, bool set)
> +{
> +	struct npcm_rc_data *rc = to_rc_data(rcdev);
> +	u32 ctrl_offset = NPCM_IPSRST1;
> +	unsigned long flags;
> +	u32 stat, rst_bit;
> +
> +	ctrl_offset += (id / NPCM_RC_RESETS_PER_REG) * sizeof(u32);
> +	rst_bit = 1 << (id % NPCM_RC_RESETS_PER_REG);
> +
> +	spin_lock_irqsave(&rc->lock, flags);
> +	stat = readl(rc->base + ctrl_offset);
> +	if (set)
> +		writel(stat | rst_bit, rc->base + ctrl_offset);
> +	else
> +		writel(stat & ~rst_bit, rc->base + ctrl_offset);
> +	spin_unlock_irqrestore(&rc->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int npcm_rc_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return npcm_rc_setclear_reset(rcdev, id, true);
> +}
> +
> +static int npcm_rc_deassert(struct reset_controller_dev *rcdev,
> +			    unsigned long id)
> +{
> +	return npcm_rc_setclear_reset(rcdev, id, false);
> +}
> +
> +static int npcm_rc_status(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	struct npcm_rc_data *rc = to_rc_data(rcdev);
> +	u32 bit, ctrl_offset = NPCM_IPSRST1;
> +
> +	ctrl_offset += (id / NPCM_RC_RESETS_PER_REG) * sizeof(u32);
> +	bit = 1 << (id % NPCM_RC_RESETS_PER_REG);
> +
> +	return (readl(rc->base + ctrl_offset) & bit);
> +}
> +
> +/*
> + *  The following procedure should be observed in USB PHY, USB device and
> + *  USB host initialization at BMC boot
> + */
> +static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	u32 mdlr, iprst1, iprst2, iprst3;
> +	struct regmap *gcr_regmap;
> +	u32 ipsrst1_bits = 0;
> +	u32 ipsrst2_bits = NPCM_IPSRST2_USB_HOST;
> +	u32 ipsrst3_bits = 0;
> +
> +	if (of_device_is_compatible(np, "nuvoton,npcm750-reset")) {
> +		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> +		if (IS_ERR(gcr_regmap)) {
> +			dev_err(&pdev->dev, "Failed to find nuvoton,npcm750-gcr\n");
> +			return PTR_ERR(gcr_regmap);
> +		}
> +	}
> +	if (!gcr_regmap)
> +		return -ENXIO;
> +
> +	/* checking which USB device is enabled */
> +	regmap_read(gcr_regmap, NPCM_MDLR_OFFSET, &mdlr);
> +	if (!(mdlr & NPCM_MDLR_USBD0))
> +		ipsrst3_bits |= NPCM_IPSRST3_USBD0;
> +	if (!(mdlr & NPCM_MDLR_USBD1))
> +		ipsrst1_bits |= NPCM_IPSRST1_USBD1;
> +	if (!(mdlr & NPCM_MDLR_USBD2_4))
> +		ipsrst1_bits |= (NPCM_IPSRST1_USBD2 |
> +				 NPCM_IPSRST1_USBD3 |
> +				 NPCM_IPSRST1_USBD4);
> +	if (!(mdlr & NPCM_MDLR_USBD0)) {
> +		ipsrst1_bits |= (NPCM_IPSRST1_USBD5 |
> +				 NPCM_IPSRST1_USBD6);
> +		ipsrst3_bits |= (NPCM_IPSRST3_USBD7 |
> +				 NPCM_IPSRST3_USBD8 |
> +				 NPCM_IPSRST3_USBD9);
> +	}
> +
> +	/* assert reset USB PHY and USB devices */
> +	iprst1 = readl(rc->base + NPCM_IPSRST1);
> +	iprst2 = readl(rc->base + NPCM_IPSRST2);
> +	iprst3 = readl(rc->base + NPCM_IPSRST3);
> +
> +	iprst1 |= ipsrst1_bits;
> +	iprst2 |= ipsrst2_bits;
> +	iprst3 |= (ipsrst3_bits | NPCM_IPSRST3_USBPHY1 |
> +		   NPCM_IPSRST3_USBPHY2);
> +
> +	writel(iprst1, rc->base + NPCM_IPSRST1);
> +	writel(iprst2, rc->base + NPCM_IPSRST2);
> +	writel(iprst3, rc->base + NPCM_IPSRST3);
> +
> +	/* clear USB PHY RS bit */
> +	regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
> +			   NPCM_USBXPHYCTL_RS, 0);
> +	regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
> +			   NPCM_USBXPHYCTL_RS, 0);
> +
> +	/* deassert reset USB PHY */
> +	iprst3 &= ~(NPCM_IPSRST3_USBPHY1 | NPCM_IPSRST3_USBPHY2);
> +	writel(iprst3, rc->base + NPCM_IPSRST3);
> +
> +	udelay(50);
> +
> +	/* set USB PHY RS bit */
> +	regmap_update_bits(gcr_regmap, NPCM_USB1PHYCTL_OFFSET,
> +			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
> +	regmap_update_bits(gcr_regmap, NPCM_USB2PHYCTL_OFFSET,
> +			   NPCM_USBXPHYCTL_RS, NPCM_USBXPHYCTL_RS);
> +
> +	/* deassert reset USB devices*/
> +	iprst1 &= ~ipsrst1_bits;
> +	iprst2 &= ~ipsrst2_bits;
> +	iprst3 &= ~ipsrst3_bits;
> +
> +	writel(iprst1, rc->base + NPCM_IPSRST1);
> +	writel(iprst2, rc->base + NPCM_IPSRST2);
> +	writel(iprst3, rc->base + NPCM_IPSRST3);
> +
> +	return 0;
> +}

Is there no better place for this, such as USB glue code?

> +static const struct reset_control_ops npcm_rc_ops = {
> +	.assert		= npcm_rc_assert,
> +	.deassert	= npcm_rc_deassert,
> +	.status		= npcm_rc_status,
> +};
> +
> +static int npcm_rc_probe(struct platform_device *pdev)
> +{
> +	struct npcm_rc_data *rc;
> +	struct resource res;
> +	int ret;
> +
> +	rc = devm_kzalloc(&pdev->dev, sizeof(*rc), GFP_KERNEL);
> +	if (!rc)
> +		return -ENOMEM;
> +
> +	of_address_to_resource(pdev->dev.of_node, 0, &res);
> +	rc->base = devm_ioremap_resource(&pdev->dev, &res);

Can't you just use

	rc->base = devm_platform_ioremap_resource(pdev, 0);

here?

> +	if (IS_ERR(rc->base))
> +		return PTR_ERR(rc->base);
> +
> +	spin_lock_init(&rc->lock);
> +
> +	rc->rcdev.owner = THIS_MODULE;
> +	rc->rcdev.nr_resets = resource_size(&res) / 4 * BITS_PER_LONG;

That doesn't seem right. With the ctrl_offset = NPCM_IPSRST1 in
npcm_rc_setclear_reset that would allow access beyond the configured
register range.

> +	rc->rcdev.ops = &npcm_rc_ops;
> +	rc->rcdev.of_node = pdev->dev.of_node;
> +
> +	platform_set_drvdata(pdev, rc);
> +
> +	ret = reset_controller_register(&rc->rcdev);

	ret = devm_reset_controller_register(&pdev->dev, &rc->rcdev);

> +	if (ret) {
> +		dev_err(&pdev->dev, "unable to register device\n");
> +		return ret;
> +	}
> +
> +	if (npcm_usb_reset(pdev, rc))
> +		dev_warn(&pdev->dev, "NPCM USB reset failed, can cause issues with UDC and USB host\n");
> +
> +	if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,sw-reset-number",
> +				  &rc->sw_reset_number)) {
> +		if (rc->sw_reset_number && rc->sw_reset_number < 5) {
> +			rc->restart_nb.priority = 192,
> +			rc->restart_nb.notifier_call = npcm_rc_restart,
> +			ret = register_restart_handler(&rc->restart_nb);
> +			if (ret)
> +				dev_warn(&pdev->dev, "failed to register restart handler\n");
> +		}
> +	}
> +
> +	pr_info("NPCM RESET driver probed\n");

It think this is a bit verbose.

> +	return ret;
> +}
> +
> +static const struct of_device_id npcm_rc_match[] = {
> +	{ .compatible = "nuvoton,npcm750-reset" },
> +	{ }
> +};
> +
> +static struct platform_driver npcm_rc_driver = {
> +	.probe	= npcm_rc_probe,
> +	.driver	= {
> +		.name			= "npcm-reset",
> +		.of_match_table		= npcm_rc_match,
> +		.suppress_bind_attrs	= true,
> +	},
> +};
> +builtin_platform_driver(npcm_rc_driver);

regards
Philipp

