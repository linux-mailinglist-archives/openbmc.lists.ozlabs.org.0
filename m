Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94A6C3F15
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 01:25:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph8QT1yZkz3c9L
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 11:25:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nHaNO0/d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nHaNO0/d;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgBvv5Lj9z3cBp;
	Mon, 20 Mar 2023 22:14:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679310876; x=1710846876;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Amz4/Av8RIHbzuWj5LX0wvdbWha7TGpA6N4V/XgAueM=;
  b=nHaNO0/dkrMxO/tANts4pQM4Fw6uF8Bn1nn9HZMYCA3QrPSpnlGkNC9I
   m1hBGmNZS+5qQklzoIhrKok28KS1mzWXRDgF3gOPIMmsb1AmvHeuxGS3L
   3cEioDYHBfiAT15KBGUc2FIlxXCcANJ9j+1MLeQzkQnlpLCGw6hobMw4i
   /tDAhVjTQEuCYPgpQPBpCHJ63AORrIjhfBw0RppoC4YwDEXpqPuj3gRMQ
   fbMgJZXaAU5Vz90aaP+WXJNoBASBrvhExD8th0GYCW/tBizVQKPA8q4z5
   hTEqliCZ2l8PKowJZE8k/Pu9JksvVAnAfzKO1bpV4MOi9Yh0406gdfDoK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="401206726"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="401206726"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="1010431497"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="1010431497"
Received: from mbouhaou-mobl1.ger.corp.intel.com ([10.252.61.151])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 04:14:24 -0700
Date: Mon, 20 Mar 2023 13:14:22 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v3 3/5] dmaengine: aspeed: Add AST2600 UART DMA driver
In-Reply-To: <20230320081133.23655-4-chiawei_wang@aspeedtech.com>
Message-ID: <493b758-2ddf-b44a-48a8-69e8de5d85b@linux.intel.com>
References: <20230320081133.23655-1-chiawei_wang@aspeedtech.com> <20230320081133.23655-4-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Wed, 22 Mar 2023 11:17:45 +1100
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
Cc: pmenzel@molgen.mpg.de, hdanton@sina.com, linux-serial <linux-serial@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, vkoul@kernel.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, dmaengine@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 20 Mar 2023, Chia-Wei Wang wrote:

> Aspeed AST2600 UART DMA (UDMA) includes 28 channels for the
> DMA transmission and recevie of each UART devices.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
> diff --git a/drivers/dma/ast2600-udma.c b/drivers/dma/ast2600-udma.c
> new file mode 100644
> index 000000000000..39117b26996d
> --- /dev/null
> +++ b/drivers/dma/ast2600-udma.c
> @@ -0,0 +1,534 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + */
> +#include <linux/delay.h>
> +#include <linux/bitfield.h>
> +#include <linux/interrupt.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/dma-direct.h>
> +#include "dmaengine.h"
> +
> +#define DEVICE_NAME	"aspeed-udma"
> +
> +/* register offset */
> +#define UDMA_TX_EN		0x000
> +#define UDMA_RX_EN		0x004
> +#define UDMA_TMOUT		0x00c
> +#define UDMA_TX_PTR_RST		0x020
> +#define UDMA_RX_PTR_RST		0x024
> +#define UDMA_TX_INT_EN		0x030
> +#define UDMA_TX_INT_STS		0x034
> +#define UDMA_RX_INT_EN		0x038
> +#define UDMA_RX_INT_STS		0x03c
> +
> +#define UDMA_CH_OFFS(x)		((x) * 0x10)
> +#define UDMA_CH_RPTR(x)		(0x040 + UDMA_CH_OFFS(x))
> +#define UDMA_CH_WPTR(x)		(0x044 + UDMA_CH_OFFS(x))
> +#define UDMA_CH_ADDR(x)		(0x048 + UDMA_CH_OFFS(x))
> +#define UDMA_CH_CTRL(x)		(0x04c + UDMA_CH_OFFS(x))
> +#define   UDMA_CH_CTRL_BUFSZ	GENMASK(1, 0)
> +
> +#define UDMA_MAX_BUFSZ	(0x10000)

Unnecessary parenthesis.

> +#define UDMA_MAX_TXSZ	(UDMA_MAX_BUFSZ - 1)
> +
> +enum ast2600_udma_bufsz {
> +	UDMA_BUFSZ_1KB,
> +	UDMA_BUFSZ_4KB,
> +	UDMA_BUFSZ_16KB,
> +	UDMA_BUFSZ_64KB,
> +};
> +
> +struct ast2600_udma_desc {
> +	struct dma_async_tx_descriptor tx;
> +	dma_addr_t addr;
> +	unsigned int size;
> +};
> +
> +struct ast2600_udma_chan {
> +	struct dma_chan chan;
> +	struct ast2600_udma_desc ud;
> +	struct ast2600_udma *udma;
> +	uint32_t residue;
> +
> +	/* 4B-aligned local buffer for workaround */
> +	uint8_t *buf;
> +	dma_addr_t buf_addr;
> +
> +	bool is_tx;
> +};
> +
> +struct ast2600_udma {
> +	struct dma_device ddev;
> +	uint8_t __iomem *regs;
> +	int irq;
> +	struct ast2600_udma_chan *ucs;
> +	uint32_t n_ucs;
> +	spinlock_t lock;
> +};
> +
> +static struct ast2600_udma_chan *to_ast2600_udma_chan(struct dma_chan *chan)
> +{
> +	return container_of(chan, struct ast2600_udma_chan, chan);
> +}
> +
> +static int ast2600_udma_alloc_chan_resources(struct dma_chan *chan)
> +{
> +	dma_cookie_init(chan);
> +
> +	return 0;
> +}
> +
> +static dma_cookie_t ast2600_udma_tx_submit(struct dma_async_tx_descriptor *tx)
> +{
> +	return dma_cookie_assign(tx);
> +}
> +
> +/* consider only 8250_dma using dmaengine_prep_slave_single() */
> +static struct dma_async_tx_descriptor *ast2600_udma_prep_slave_sg(struct dma_chan *chan,
> +								  struct scatterlist *sgl,
> +								  unsigned int sg_len,
> +								  enum dma_transfer_direction dir,
> +								  unsigned long tx_flags,
> +								  void *context)
> +{
> +	struct device *dev = chan->device->dev;
> +	struct ast2600_udma_chan *uc = to_ast2600_udma_chan(chan);
> +	struct ast2600_udma_desc *ud = &uc->ud;
> +	phys_addr_t pa;
> +	void *va;
> +
> +	if (!is_slave_direction(dir)) {
> +		dev_err(dev, "direction is not slave mode\n");
> +		return NULL;
> +	}
> +
> +	if (sg_len != 1) {

> 1

> +		dev_err(dev, "scatter list length is not 1\n");
> +		return NULL;
> +	}
> +
> +	if (uc->is_tx && dir != DMA_MEM_TO_DEV) {
> +		dev_err(dev, "invalid direction to TX channel\n");
> +		return NULL;
> +	}
> +
> +	ud->addr = sg_dma_address(sgl);
> +	ud->size = sg_dma_len(sgl);
> +
> +	if (uc->is_tx) {
> +		if (ud->size > UDMA_MAX_TXSZ) {
> +			dev_err(dev, "invalid TX DMA SIZE");
> +			return NULL;
> +		}
> +
> +		/*
> +		 * UDMA is limited to 4B-aligned DMA addresses.
> +		 * Thus copy data to local 4B-aligned buffer if
> +		 * the source does not fit.
> +		 */
> +		if (ud->addr & 0x3) {

!IS_ALIGNED()

Remember to add include for it.

> +			pa = dma_to_phys(chan->device->dev, ud->addr);
> +			if (pa != (phys_addr_t)-1) {
> +				va = phys_to_virt(pa);
> +				memcpy(uc->buf, va, ud->size);
> +				ud->addr = uc->buf_addr;
> +			}
> +		}
> +	} else {
> +		/*
> +		 * UDMA RX buffer size is limited to 1/4/16/64 KB
> +		 * We use the lower bits to encode the buffer size
> +		 */
> +		switch (ud->size) {
> +		case 0x400:

SZ_1K, etc in linux/sizes.h.

> +			ud->size |= FIELD_PREP(UDMA_CH_CTRL_BUFSZ, UDMA_BUFSZ_1KB);
> +			break;
> +		case 0x1000:
> +			ud->size |= FIELD_PREP(UDMA_CH_CTRL_BUFSZ, UDMA_BUFSZ_4KB);
> +			break;
> +		case 0x4000:
> +			ud->size |= FIELD_PREP(UDMA_CH_CTRL_BUFSZ, UDMA_BUFSZ_16KB);
> +			break;
> +		case 0x10000:
> +			ud->size |= FIELD_PREP(UDMA_CH_CTRL_BUFSZ, UDMA_BUFSZ_64KB);
> +			break;
> +		default:
> +			dev_err(dev, "invalid RX DMA size\n");
> +			return NULL;
> +		}
> +	}
> +
> +	dma_async_tx_descriptor_init(&ud->tx, &uc->chan);
> +	ud->tx.tx_submit = ast2600_udma_tx_submit;
> +
> +	return &ud->tx;
> +}
> +
> +static void ast2600_udma_issue_pending(struct dma_chan *chan)
> +{
> +	unsigned long flags;
> +	uint32_t r_pr, r_is, r_ie, r_en, reg;
> +	uint32_t ch_id = chan->chan_id;
> +	uint32_t ch_bit = ch_id / 2;
> +	dma_addr_t rx_addr;
> +	uint32_t rx_size;
> +	struct ast2600_udma_chan *uc = to_ast2600_udma_chan(chan);
> +	struct ast2600_udma_desc *ud = &uc->ud;
> +	struct ast2600_udma *udma = uc->udma;
> +
> +	if (uc->is_tx) {
> +		r_pr = UDMA_TX_PTR_RST;
> +		r_is = UDMA_TX_INT_STS;
> +		r_ie = UDMA_TX_INT_EN;
> +		r_en = UDMA_TX_EN;
> +	} else {
> +		r_pr = UDMA_RX_PTR_RST;
> +		r_is = UDMA_RX_INT_STS;
> +		r_ie = UDMA_RX_INT_EN;
> +		r_en = UDMA_RX_EN;
> +	}
> +
> +	spin_lock_irqsave(&udma->lock, flags);
> +
> +	/* reset channel HW read/write pointer */
> +	writel(BIT(ch_bit), udma->regs + r_pr);
> +	writel(0, udma->regs + r_pr);
> +
> +	/* clear interrupt status */
> +	writel(BIT(ch_bit), udma->regs + r_is);
> +
> +	/* set transfer address & size */
> +	if (uc->is_tx) {
> +		writel(ud->addr, udma->regs + UDMA_CH_ADDR(ch_id));
> +		writel(ud->size, udma->regs + UDMA_CH_WPTR(ch_id));
> +		writel(UDMA_BUFSZ_64KB, udma->regs + UDMA_CH_CTRL(ch_id));
> +	} else {
> +		/*
> +		 * UDMA is limited to 4B-aligned addresses.
> +		 * Thus use local 4B-aligned buffer to get
> +		 * RX data and copy to the real destination
> +		 * after then.
> +		 */
> +		rx_addr = (ud->addr & 0x3) ? uc->buf_addr : ud->addr;

!IS_ALIGNED()

> +		rx_size = FIELD_GET(UDMA_CH_CTRL_BUFSZ, ud->size);
> +		writel(rx_addr, udma->regs + UDMA_CH_ADDR(ch_id));
> +		writel(rx_size, udma->regs + UDMA_CH_CTRL(ch_id));
> +	}
> +
> +	/* enable interrupt */
> +	reg = readl(udma->regs + r_ie) | BIT(ch_bit);

Usually, in this kind of constructs, the logic is put on its own line 
between readl and writel.

> +	writel(reg, udma->regs + r_ie);
> +
> +	/* start DMA */
> +	reg = readl(udma->regs + r_en) | BIT(ch_bit);
> +	writel(reg, udma->regs + r_en);
> +
> +	spin_unlock_irqrestore(&udma->lock, flags);
> +}
> +
> +static enum dma_status ast2600_udma_tx_status(struct dma_chan *chan,
> +		dma_cookie_t cookie, struct dma_tx_state *txstate)
> +{
> +	struct ast2600_udma_chan *uc = to_ast2600_udma_chan(chan);
> +	enum dma_status sts = dma_cookie_status(chan, cookie, txstate);
> +
> +	dma_set_residue(txstate, uc->residue);
> +
> +	return sts;
> +}
> +
> +static int ast2600_udma_pause(struct dma_chan *chan)
> +{
> +	unsigned long flags;
> +	uint32_t r_en, r_ie, reg;
> +	uint32_t ch_id = chan->chan_id;
> +	uint32_t ch_bit = ch_id / 2;
> +	struct ast2600_udma_chan *uc = to_ast2600_udma_chan(chan);
> +	struct ast2600_udma *udma = uc->udma;
> +
> +	if (uc->is_tx) {
> +		r_en = UDMA_TX_EN;
> +		r_ie = UDMA_TX_INT_EN;
> +	} else {
> +		r_en = UDMA_RX_EN;
> +		r_ie = UDMA_RX_INT_EN;
> +	}
> +
> +	spin_lock_irqsave(&udma->lock, flags);
> +
> +	reg = readl(udma->regs + r_en) & ~BIT(ch_bit);
> +	writel(reg, udma->regs + r_en);
> +
> +	reg = readl(udma->regs + r_ie) & ~BIT(ch_bit);
> +	writel(reg, udma->regs + r_ie);
> +
> +	spin_unlock_irqrestore(&udma->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ast2600_udma_resume(struct dma_chan *chan)
> +{
> +	unsigned long flags;
> +	uint32_t r_en, r_ie, reg;
> +	uint32_t ch_id = chan->chan_id;
> +	uint32_t ch_bit = ch_id / 2;
> +	struct ast2600_udma_chan *uc = to_ast2600_udma_chan(chan);
> +	struct ast2600_udma *udma = uc->udma;
> +
> +	if (uc->is_tx) {
> +		r_en = UDMA_TX_EN;
> +		r_ie = UDMA_TX_INT_EN;
> +	} else {
> +		r_en = UDMA_RX_EN;
> +		r_ie = UDMA_RX_INT_EN;
> +	}
> +
> +	spin_lock_irqsave(&udma->lock, flags);
> +
> +	reg = readl(udma->regs + r_en) | BIT(ch_bit);
> +	writel(reg, udma->regs + r_en);
> +
> +	reg = readl(udma->regs + r_ie) | BIT(ch_bit);
> +	writel(reg, udma->regs + r_ie);
> +
> +	spin_unlock_irqrestore(&udma->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int ast2600_udma_terminate(struct dma_chan *chan)
> +{
> +	unsigned long flags;
> +	uint32_t r_pr, r_is, r_ie, r_en, reg;
> +	uint32_t ch_id = chan->chan_id;
> +	uint32_t ch_bit = ch_id / 2;
> +	struct ast2600_udma_chan *uc = to_ast2600_udma_chan(chan);
> +	struct ast2600_udma *udma = uc->udma;
> +
> +	if (uc->is_tx) {
> +		r_pr = UDMA_TX_PTR_RST;
> +		r_is = UDMA_TX_INT_STS;
> +		r_ie = UDMA_TX_INT_EN;
> +		r_en = UDMA_TX_EN;
> +	} else {
> +		r_pr = UDMA_RX_PTR_RST;
> +		r_is = UDMA_RX_INT_STS;
> +		r_ie = UDMA_RX_INT_EN;
> +		r_en = UDMA_RX_EN;
> +	}
> +
> +	spin_lock_irqsave(&udma->lock, flags);
> +
> +	/* disable DMA */
> +	reg = readl(udma->regs + r_en) & ~BIT(ch_bit);
> +	writel(reg, udma->regs + r_en);
> +
> +	/* disable interrupt */
> +	reg = readl(udma->regs + r_ie) & ~BIT(ch_bit);
> +	writel(reg, udma->regs + r_ie);
> +
> +	/* clear interrupt status */
> +	writel(BIT(ch_bit), udma->regs + r_is);
> +
> +	/* reset channel HW read/write pointer */
> +	writel(BIT(ch_bit), udma->regs + r_pr);
> +	writel(0, udma->regs + r_pr);
> +
> +	spin_unlock_irqrestore(&udma->lock, flags);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t ast2600_udma_isr(int irq, void *arg)
> +{
> +	struct ast2600_udma *udma = arg;
> +	struct ast2600_udma_chan *uc;
> +	struct ast2600_udma_desc *ud;
> +	struct dma_async_tx_descriptor *tx;
> +	uint32_t sts, rptr, wptr;
> +	uint32_t ch_id, ch_bit;
> +	phys_addr_t pa;
> +	void *va;
> +
> +	/* handle TX interrupt */
> +	sts = readl(udma->regs + UDMA_TX_INT_STS);
> +	for_each_set_bit(ch_bit, (unsigned long *)&sts, (udma->n_ucs / 2)) {

Why not make sts unsigned long to avoid the cast?

Unnecessary parenthesis.

> +		ch_id = ch_bit << 1;
> +		rptr = readl(udma->regs + UDMA_CH_RPTR(ch_id));
> +		wptr = readl(udma->regs + UDMA_CH_WPTR(ch_id));
> +
> +		uc = &udma->ucs[ch_id];
> +		uc->residue = wptr - rptr;
> +
> +		ast2600_udma_terminate(&uc->chan);
> +
> +		tx = &uc->ud.tx;
> +		dma_cookie_complete(tx);
> +		dma_descriptor_unmap(tx);
> +		dmaengine_desc_get_callback_invoke(tx, NULL);
> +	}
> +
> +	/* handle RX interrupt */
> +	sts = readl(udma->regs + UDMA_RX_INT_STS);
> +	for_each_set_bit(ch_bit, (unsigned long *)&sts, udma->n_ucs / 2) {
> +		ch_id = (ch_bit << 1) + 1;
> +		wptr = readl(udma->regs + UDMA_CH_WPTR(ch_id));
> +
> +		uc = &udma->ucs[ch_id];
> +		ud = &uc->ud;
> +		tx = &ud->tx;
> +
> +		uc->residue = (ud->size & ~UDMA_CH_CTRL_BUFSZ) - wptr;
> +
> +		/* handle non-4B-aligned case */
> +		if (ud->addr & 0x3) {

!IS_ALIGNED()

> +			pa = dma_to_phys(uc->chan.device->dev, ud->addr);
> +			if (pa != (phys_addr_t)-1) {
> +				va = phys_to_virt(pa);
> +				memcpy(va, uc->buf, wptr);
> +			}
> +		}
> +
> +		ast2600_udma_terminate(&uc->chan);
> +
> +		dma_cookie_complete(tx);
> +		dma_descriptor_unmap(tx);
> +		dmaengine_desc_get_callback_invoke(tx, NULL);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ast2600_udma_probe(struct platform_device *pdev)
> +{
> +	int i, rc;
> +	struct resource *res;
> +	struct ast2600_udma *udma;
> +	struct device *dev = &pdev->dev;
> +
> +	udma = devm_kzalloc(dev, sizeof(*udma), GFP_KERNEL);
> +	if (!udma)
> +		return -ENOMEM;
> +
> +	dma_cap_set(DMA_SLAVE, udma->ddev.cap_mask);
> +	udma->ddev.device_alloc_chan_resources = ast2600_udma_alloc_chan_resources;
> +	udma->ddev.device_prep_slave_sg = ast2600_udma_prep_slave_sg;
> +	udma->ddev.device_issue_pending = ast2600_udma_issue_pending;
> +	udma->ddev.device_tx_status = ast2600_udma_tx_status;
> +	udma->ddev.device_pause = ast2600_udma_pause;
> +	udma->ddev.device_resume = ast2600_udma_resume;
> +	udma->ddev.device_terminate_all = ast2600_udma_terminate;
> +	udma->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
> +	udma->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
> +	udma->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> +	udma->ddev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
> +	udma->ddev.dev = dev;
> +	INIT_LIST_HEAD(&udma->ddev.channels);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (IS_ERR(res)) {
> +		dev_err(dev, "cannot get IO resource\n");
> +		return -ENODEV;
> +	}
> +
> +	udma->regs = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(udma->regs)) {
> +		dev_err(dev, "cannot map IO registers\n");
> +		return PTR_ERR(udma->regs);
> +	}
> +
> +	/* timeout value: 0x200 * (PCLK * 14400) */
> +	writel(0x200, udma->regs + UDMA_TMOUT);
> +
> +	/* disable all for safety */
> +	writel(0x0, udma->regs + UDMA_TX_EN);
> +	writel(0x0, udma->regs + UDMA_RX_EN);
> +
> +	udma->irq = platform_get_irq(pdev, 0);
> +	if (udma->irq < 0)
> +		return udma->irq;
> +
> +	rc = devm_request_irq(&pdev->dev, udma->irq, ast2600_udma_isr,
> +			      IRQF_SHARED, DEVICE_NAME, udma);
> +	if (rc) {
> +		dev_err(dev, "cannot request IRQ\n");
> +		return rc;
> +	}
> +
> +	rc = of_property_read_u32(dev->of_node, "dma-channels", &udma->n_ucs);
> +	if (rc) {
> +		dev_err(dev, "cannot find number of channels\n");
> +		return rc;
> +	}
> +
> +	udma->ucs = devm_kzalloc(dev,
> +				 sizeof(struct ast2600_udma_chan) * udma->n_ucs, GFP_KERNEL);
> +	if (!udma->ucs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < udma->n_ucs; ++i) {
> +		udma->ucs[i].is_tx = !(i % 2);

& 1 would make more sense I think.

> +		udma->ucs[i].chan.device = &udma->ddev;
> +		udma->ucs[i].buf = dmam_alloc_coherent(dev, UDMA_MAX_BUFSZ,
> +						       &udma->ucs[i].buf_addr, GFP_KERNEL);
> +		if (!udma->ucs[i].buf)
> +			return -ENOMEM;
> +
> +		udma->ucs[i].udma = udma;
> +		list_add_tail(&udma->ucs[i].chan.device_node, &udma->ddev.channels);
> +	}
> +
> +	rc = dma_async_device_register(&udma->ddev);
> +	if (rc)
> +		return rc;
> +
> +	rc = of_dma_controller_register(dev->of_node, of_dma_xlate_by_chan_id, &udma->ddev);
> +	if (rc)
> +		return rc;
> +
> +	spin_lock_init(&udma->lock);
> +
> +	platform_set_drvdata(pdev, udma);
> +
> +	dev_info(dev, "module loaded\n");

Don't print anything when there's no error.

> +	return 0;
> +}
> +
> +static int ast2600_udma_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ast2600_udma *udma = platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(dev->of_node);
> +	dma_async_device_unregister(&udma->ddev);
> +
> +	dev_info(dev, "module removed\n");

Ditto.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ast2600_udma_match[] = {
> +	{ .compatible = "aspeed,ast2600-udma" },
> +	{ },
> +};
> +
> +static struct platform_driver ast2600_udma_driver = {
> +	.probe = ast2600_udma_probe,
> +	.remove = ast2600_udma_remove,
> +	.driver = {
> +			.name = DEVICE_NAME,
> +			.of_match_table = ast2600_udma_match,
> +	},
> +};
> +
> +module_platform_driver(ast2600_udma_driver);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com");
> 

-- 
 i.

