Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77D691936
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 08:30:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PClkH318sz3f6g
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 18:29:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PClgm4lbgz3bfT;
	Fri, 10 Feb 2023 18:27:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31A7EWrp068845;
	Fri, 10 Feb 2023 15:14:33 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Feb
 2023 15:26:47 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <jirislaby@kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH 2/4] soc: aspeed: Add UART DMA support
Date: Fri, 10 Feb 2023 15:26:41 +0800
Message-ID: <20230210072643.2772-3-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
References: <20230210072643.2772-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 31A7EWrp068845
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver provides DMA support for AST26xx UART and VUART
devices. It is useful to offload CPU overhead while using
UART/VUART for binary file transfer.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 drivers/soc/aspeed/Kconfig             |   9 +
 drivers/soc/aspeed/Makefile            |   1 +
 drivers/soc/aspeed/aspeed-udma.c       | 447 +++++++++++++++++++++++++
 include/linux/soc/aspeed/aspeed-udma.h |  34 ++
 4 files changed, 491 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-udma.c
 create mode 100644 include/linux/soc/aspeed/aspeed-udma.h

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..c3bb238bea75 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -52,6 +52,15 @@ config ASPEED_SOCINFO
 	help
 	  Say yes to support decoding of ASPEED BMC information.
 
+config ASPEED_UDMA
+	tristate "Aspeed UDMA Engine Driver"
+	default ARCH_ASPEED
+	help
+	  Enable support for the Aspeed UDMA Engine found on the
+	  Aspeed AST26xx SOCs. The UDMA engine provides UART DMA
+	  operations between the memory buffer and UART/VUART
+	  FIFO data.
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b35d74592964..5aeabafee1d4 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
 obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
+obj-$(CONFIG_ASPEED_UDMA)		+= aspeed-udma.o
diff --git a/drivers/soc/aspeed/aspeed-udma.c b/drivers/soc/aspeed/aspeed-udma.c
new file mode 100644
index 000000000000..95898fbd6ed8
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-udma.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) Aspeed Technology Inc.
+ */
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/spinlock.h>
+#include <linux/soc/aspeed/aspeed-udma.h>
+#include <linux/delay.h>
+
+#define DEVICE_NAME "aspeed-udma"
+
+/* UART DMA registers offset */
+#define UDMA_TX_DMA_EN		0x000
+#define UDMA_RX_DMA_EN		0x004
+#define UDMA_TIMEOUT_TIMER	0x00c
+#define UDMA_TX_DMA_RST		0x020
+#define UDMA_RX_DMA_RST		0x024
+#define UDMA_TX_DMA_INT_EN	0x030
+#define UDMA_TX_DMA_INT_STAT	0x034
+#define UDMA_RX_DMA_INT_EN	0x038
+#define UDMA_RX_DMA_INT_STAT	0x03c
+
+#define UDMA_CHX_OFF(x)		((x) * 0x20)
+#define UDMA_CHX_TX_RD_PTR(x)	(0x040 + UDMA_CHX_OFF(x))
+#define UDMA_CHX_TX_WR_PTR(x)	(0x044 + UDMA_CHX_OFF(x))
+#define UDMA_CHX_TX_BUF_BASE(x)	(0x048 + UDMA_CHX_OFF(x))
+#define UDMA_CHX_TX_CTRL(x)	(0x04c + UDMA_CHX_OFF(x))
+#define   UDMA_TX_CTRL_TMOUT_DISABLE	BIT(4)
+#define   UDMA_TX_CTRL_BUFSZ_MASK	GENMASK(3, 0)
+#define   UDMA_TX_CTRL_BUFSZ_SHIFT	0
+#define UDMA_CHX_RX_RD_PTR(x)	(0x050 + UDMA_CHX_OFF(x))
+#define UDMA_CHX_RX_WR_PTR(x)	(0x054 + UDMA_CHX_OFF(x))
+#define UDMA_CHX_RX_BUF_BASE(x)	(0x058 + UDMA_CHX_OFF(x))
+#define UDMA_CHX_RX_CTRL(x)	(0x05c + UDMA_CHX_OFF(x))
+#define   UDMA_RX_CTRL_TMOUT_DISABLE	BIT(4)
+#define   UDMA_RX_CTRL_BUFSZ_MASK	GENMASK(3, 0)
+#define   UDMA_RX_CTRL_BUFSZ_SHIFT	0
+
+#define UDMA_MAX_CHANNEL	14
+#define UDMA_TIMEOUT		0x200
+
+enum aspeed_udma_bufsz_code {
+	UDMA_BUFSZ_CODE_1KB,
+	UDMA_BUFSZ_CODE_4KB,
+	UDMA_BUFSZ_CODE_16KB,
+	UDMA_BUFSZ_CODE_64KB,
+
+	/*
+	 * 128KB and above are supported ONLY for
+	 * virtual UARTs. For physical UARTs, the
+	 * size code is wrapped around at the 64K
+	 * boundary.
+	 */
+	UDMA_BUFSZ_CODE_128KB,
+	UDMA_BUFSZ_CODE_256KB,
+	UDMA_BUFSZ_CODE_512KB,
+	UDMA_BUFSZ_CODE_1024KB,
+	UDMA_BUFSZ_CODE_2048KB,
+	UDMA_BUFSZ_CODE_4096KB,
+	UDMA_BUFSZ_CODE_8192KB,
+	UDMA_BUFSZ_CODE_16384KB,
+};
+
+struct aspeed_udma_chan {
+	dma_addr_t dma_addr;
+
+	struct circ_buf *rb;
+	u32 rb_sz;
+
+	aspeed_udma_cb_t cb;
+	void *cb_arg;
+
+	bool dis_tmout;
+};
+
+struct aspeed_udma {
+	struct device *dev;
+	u8 __iomem *regs;
+	int irq;
+	struct aspeed_udma_chan tx_chs[UDMA_MAX_CHANNEL];
+	struct aspeed_udma_chan rx_chs[UDMA_MAX_CHANNEL];
+	spinlock_t lock;
+};
+
+struct aspeed_udma udma[1];
+
+static int aspeed_udma_get_bufsz_code(u32 buf_sz)
+{
+	switch (buf_sz) {
+	case 0x400:
+		return UDMA_BUFSZ_CODE_1KB;
+	case 0x1000:
+		return UDMA_BUFSZ_CODE_4KB;
+	case 0x4000:
+		return UDMA_BUFSZ_CODE_16KB;
+	case 0x10000:
+		return UDMA_BUFSZ_CODE_64KB;
+	case 0x20000:
+		return UDMA_BUFSZ_CODE_128KB;
+	case 0x40000:
+		return UDMA_BUFSZ_CODE_256KB;
+	case 0x80000:
+		return UDMA_BUFSZ_CODE_512KB;
+	case 0x100000:
+		return UDMA_BUFSZ_CODE_1024KB;
+	case 0x200000:
+		return UDMA_BUFSZ_CODE_2048KB;
+	case 0x400000:
+		return UDMA_BUFSZ_CODE_4096KB;
+	case 0x800000:
+		return UDMA_BUFSZ_CODE_8192KB;
+	case 0x1000000:
+		return UDMA_BUFSZ_CODE_16384KB;
+	default:
+		return -1;
+	}
+
+	return -1;
+}
+
+static u32 aspeed_udma_get_tx_rptr(u32 ch_no)
+{
+	return readl(udma->regs + UDMA_CHX_TX_RD_PTR(ch_no));
+}
+
+static u32 aspeed_udma_get_rx_wptr(u32 ch_no)
+{
+	return readl(udma->regs + UDMA_CHX_RX_WR_PTR(ch_no));
+}
+
+static void aspeed_udma_set_ptr(u32 ch_no, u32 ptr, bool is_tx)
+{
+	writel(ptr, udma->regs +
+	       ((is_tx) ? UDMA_CHX_TX_WR_PTR(ch_no) : UDMA_CHX_RX_RD_PTR(ch_no)));
+}
+
+void aspeed_udma_set_tx_wptr(u32 ch_no, u32 wptr)
+{
+	aspeed_udma_set_ptr(ch_no, wptr, true);
+}
+EXPORT_SYMBOL(aspeed_udma_set_tx_wptr);
+
+void aspeed_udma_set_rx_rptr(u32 ch_no, u32 rptr)
+{
+	aspeed_udma_set_ptr(ch_no, rptr, false);
+}
+EXPORT_SYMBOL(aspeed_udma_set_rx_rptr);
+
+static int aspeed_udma_free_chan(u32 ch_no, bool is_tx)
+{
+	u32 reg;
+	unsigned long flags;
+
+	if (ch_no > UDMA_MAX_CHANNEL)
+		return -EINVAL;
+
+	spin_lock_irqsave(&udma->lock, flags);
+
+	reg = readl(udma->regs +
+			((is_tx) ? UDMA_TX_DMA_INT_EN : UDMA_RX_DMA_INT_EN));
+	reg &= ~(0x1 << ch_no);
+
+	writel(reg, udma->regs +
+			((is_tx) ? UDMA_TX_DMA_INT_EN : UDMA_RX_DMA_INT_EN));
+
+	spin_unlock_irqrestore(&udma->lock, flags);
+
+	return 0;
+}
+
+int aspeed_udma_free_tx_chan(u32 ch_no)
+{
+	return aspeed_udma_free_chan(ch_no, true);
+}
+EXPORT_SYMBOL(aspeed_udma_free_tx_chan);
+
+int aspeed_udma_free_rx_chan(u32 ch_no)
+{
+	return aspeed_udma_free_chan(ch_no, false);
+}
+EXPORT_SYMBOL(aspeed_udma_free_rx_chan);
+
+static int aspeed_udma_request_chan(u32 ch_no, dma_addr_t addr,
+		struct circ_buf *rb, u32 rb_sz,
+		aspeed_udma_cb_t cb, void *id, bool dis_tmout, bool is_tx)
+{
+	int retval = 0;
+	int rbsz_code;
+
+	u32 reg;
+	unsigned long flags;
+	struct aspeed_udma_chan *ch;
+
+	if (ch_no > UDMA_MAX_CHANNEL) {
+		retval = -EINVAL;
+		goto out;
+	}
+
+	if (IS_ERR_OR_NULL(rb) || IS_ERR_OR_NULL(rb->buf)) {
+		retval = -EINVAL;
+		goto out;
+	}
+
+	rbsz_code = aspeed_udma_get_bufsz_code(rb_sz);
+	if (rbsz_code < 0) {
+		retval = -EINVAL;
+		goto out;
+	}
+
+	spin_lock_irqsave(&udma->lock, flags);
+
+	if (is_tx) {
+		reg = readl(udma->regs + UDMA_TX_DMA_INT_EN);
+		if (reg & (0x1 << ch_no)) {
+			retval = -EBUSY;
+			goto unlock_n_out;
+		}
+
+		reg |= (0x1 << ch_no);
+		writel(reg, udma->regs + UDMA_TX_DMA_INT_EN);
+
+		reg = readl(udma->regs + UDMA_CHX_TX_CTRL(ch_no));
+		reg |= (dis_tmout) ? UDMA_TX_CTRL_TMOUT_DISABLE : 0;
+		reg |= (rbsz_code << UDMA_TX_CTRL_BUFSZ_SHIFT) & UDMA_TX_CTRL_BUFSZ_MASK;
+		writel(reg, udma->regs + UDMA_CHX_TX_CTRL(ch_no));
+
+		writel(addr, udma->regs + UDMA_CHX_TX_BUF_BASE(ch_no));
+	} else {
+		reg = readl(udma->regs + UDMA_RX_DMA_INT_EN);
+		if (reg & (0x1 << ch_no)) {
+			retval = -EBUSY;
+			goto unlock_n_out;
+		}
+
+		reg |= (0x1 << ch_no);
+		writel(reg, udma->regs + UDMA_RX_DMA_INT_EN);
+
+		reg = readl(udma->regs + UDMA_CHX_RX_CTRL(ch_no));
+		reg |= (dis_tmout) ? UDMA_RX_CTRL_TMOUT_DISABLE : 0;
+		reg |= (rbsz_code << UDMA_RX_CTRL_BUFSZ_SHIFT) & UDMA_RX_CTRL_BUFSZ_MASK;
+		writel(reg, udma->regs + UDMA_CHX_RX_CTRL(ch_no));
+
+		writel(addr, udma->regs + UDMA_CHX_RX_BUF_BASE(ch_no));
+	}
+
+	ch = (is_tx) ? &udma->tx_chs[ch_no] : &udma->rx_chs[ch_no];
+	ch->rb = rb;
+	ch->rb_sz = rb_sz;
+	ch->cb = cb;
+	ch->cb_arg = id;
+	ch->dma_addr = addr;
+	ch->dis_tmout = dis_tmout;
+
+unlock_n_out:
+	spin_unlock_irqrestore(&udma->lock, flags);
+out:
+	return 0;
+}
+
+int aspeed_udma_request_tx_chan(u32 ch_no, dma_addr_t addr,
+		struct circ_buf *rb, u32 rb_sz,
+		aspeed_udma_cb_t cb, void *id, bool dis_tmout)
+{
+	return aspeed_udma_request_chan(ch_no, addr, rb, rb_sz, cb, id,
+									dis_tmout, true);
+}
+EXPORT_SYMBOL(aspeed_udma_request_tx_chan);
+
+int aspeed_udma_request_rx_chan(u32 ch_no, dma_addr_t addr,
+		struct circ_buf *rb, u32 rb_sz,
+		aspeed_udma_cb_t cb, void *id, bool dis_tmout)
+{
+	return aspeed_udma_request_chan(ch_no, addr, rb, rb_sz, cb, id,
+									dis_tmout, false);
+}
+EXPORT_SYMBOL(aspeed_udma_request_rx_chan);
+
+static void aspeed_udma_chan_ctrl(u32 ch_no, u32 op, bool is_tx)
+{
+	unsigned long flags;
+	u32 reg_en, reg_rst;
+	u32 reg_en_off = (is_tx) ? UDMA_TX_DMA_EN : UDMA_RX_DMA_EN;
+	u32 reg_rst_off = (is_tx) ? UDMA_TX_DMA_RST : UDMA_TX_DMA_RST;
+
+	if (ch_no > UDMA_MAX_CHANNEL)
+		return;
+
+	spin_lock_irqsave(&udma->lock, flags);
+
+	reg_en = readl(udma->regs + reg_en_off);
+	reg_rst = readl(udma->regs + reg_rst_off);
+
+	switch (op) {
+	case ASPEED_UDMA_OP_ENABLE:
+		reg_en |= (0x1 << ch_no);
+		writel(reg_en, udma->regs + reg_en_off);
+		break;
+	case ASPEED_UDMA_OP_DISABLE:
+		reg_en &= ~(0x1 << ch_no);
+		writel(reg_en, udma->regs + reg_en_off);
+		break;
+	case ASPEED_UDMA_OP_RESET:
+		reg_en &= ~(0x1 << ch_no);
+		writel(reg_en, udma->regs + reg_en_off);
+
+		reg_rst |= (0x1 << ch_no);
+		writel(reg_rst, udma->regs + reg_rst_off);
+
+		udelay(100);
+
+		reg_rst &= ~(0x1 << ch_no);
+		writel(reg_rst, udma->regs + reg_rst_off);
+		break;
+	default:
+		break;
+	}
+
+	spin_unlock_irqrestore(&udma->lock, flags);
+}
+
+void aspeed_udma_tx_chan_ctrl(u32 ch_no, enum aspeed_udma_ops op)
+{
+	aspeed_udma_chan_ctrl(ch_no, op, true);
+}
+EXPORT_SYMBOL(aspeed_udma_tx_chan_ctrl);
+
+void aspeed_udma_rx_chan_ctrl(u32 ch_no, enum aspeed_udma_ops op)
+{
+	aspeed_udma_chan_ctrl(ch_no, op, false);
+}
+EXPORT_SYMBOL(aspeed_udma_rx_chan_ctrl);
+
+static irqreturn_t aspeed_udma_isr(int irq, void *arg)
+{
+	u32 bit;
+	unsigned long tx_stat = readl(udma->regs + UDMA_TX_DMA_INT_STAT);
+	unsigned long rx_stat = readl(udma->regs + UDMA_RX_DMA_INT_STAT);
+
+	if (udma != (struct aspeed_udma *)arg)
+		return IRQ_NONE;
+
+	if (tx_stat == 0 && rx_stat == 0)
+		return IRQ_NONE;
+
+	for_each_set_bit(bit, &tx_stat, UDMA_MAX_CHANNEL) {
+		writel((0x1 << bit), udma->regs + UDMA_TX_DMA_INT_STAT);
+		if (udma->tx_chs[bit].cb)
+			udma->tx_chs[bit].cb(aspeed_udma_get_tx_rptr(bit),
+					udma->tx_chs[bit].cb_arg);
+	}
+
+	for_each_set_bit(bit, &rx_stat, UDMA_MAX_CHANNEL) {
+		writel((0x1 << bit), udma->regs + UDMA_RX_DMA_INT_STAT);
+		if (udma->rx_chs[bit].cb)
+			udma->rx_chs[bit].cb(aspeed_udma_get_rx_wptr(bit),
+					udma->rx_chs[bit].cb_arg);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int aspeed_udma_probe(struct platform_device *pdev)
+{
+	int i, rc;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (IS_ERR_OR_NULL(res)) {
+		dev_err(dev, "failed to get register base\n");
+		return -ENODEV;
+	}
+
+	udma->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR_OR_NULL(udma->regs)) {
+		dev_err(dev, "failed to map registers\n");
+		return PTR_ERR(udma->regs);
+	}
+
+	/* disable for safety */
+	writel(0x0, udma->regs + UDMA_TX_DMA_EN);
+	writel(0x0, udma->regs + UDMA_RX_DMA_EN);
+
+	udma->irq = platform_get_irq(pdev, 0);
+	if (udma->irq < 0) {
+		dev_err(dev, "failed to get IRQ number\n");
+		return -ENODEV;
+	}
+
+	rc = devm_request_irq(dev, udma->irq, aspeed_udma_isr,
+			IRQF_SHARED, DEVICE_NAME, udma);
+	if (rc) {
+		dev_err(dev, "failed to request IRQ handler\n");
+		return rc;
+	}
+
+	for (i = 0; i < UDMA_MAX_CHANNEL; ++i) {
+		writel(0, udma->regs + UDMA_CHX_TX_WR_PTR(i));
+		writel(0, udma->regs + UDMA_CHX_RX_RD_PTR(i));
+	}
+
+	writel(0xffffffff, udma->regs + UDMA_TX_DMA_RST);
+	writel(0x0, udma->regs + UDMA_TX_DMA_RST);
+
+	writel(0xffffffff, udma->regs + UDMA_RX_DMA_RST);
+	writel(0x0, udma->regs + UDMA_RX_DMA_RST);
+
+	writel(0x0, udma->regs + UDMA_TX_DMA_INT_EN);
+	writel(0xffffffff, udma->regs + UDMA_TX_DMA_INT_STAT);
+	writel(0x0, udma->regs + UDMA_RX_DMA_INT_EN);
+	writel(0xffffffff, udma->regs + UDMA_RX_DMA_INT_STAT);
+
+	writel(UDMA_TIMEOUT, udma->regs + UDMA_TIMEOUT_TIMER);
+
+	spin_lock_init(&udma->lock);
+
+	dev_set_drvdata(dev, udma);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_udma_match[] = {
+	{ .compatible = "aspeed,ast2600-udma" },
+	{ },
+};
+
+static struct platform_driver aspeed_udma_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
+		.of_match_table = aspeed_udma_match,
+
+	},
+	.probe = aspeed_udma_probe,
+};
+
+module_platform_driver(aspeed_udma_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Aspeed UDMA Engine Driver");
diff --git a/include/linux/soc/aspeed/aspeed-udma.h b/include/linux/soc/aspeed/aspeed-udma.h
new file mode 100644
index 000000000000..4ec95d726ede
--- /dev/null
+++ b/include/linux/soc/aspeed/aspeed-udma.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) Aspeed Technology Inc.
+ */
+#ifndef __ASPEED_UDMA_H__
+#define __ASPEED_UDMA_H__
+
+#include <linux/circ_buf.h>
+
+typedef void (*aspeed_udma_cb_t)(int rb_rwptr, void *id);
+
+enum aspeed_udma_ops {
+	ASPEED_UDMA_OP_ENABLE,
+	ASPEED_UDMA_OP_DISABLE,
+	ASPEED_UDMA_OP_RESET,
+};
+
+void aspeed_udma_set_tx_wptr(u32 ch_no, u32 wptr);
+void aspeed_udma_set_rx_rptr(u32 ch_no, u32 rptr);
+
+void aspeed_udma_tx_chan_ctrl(u32 ch_no, enum aspeed_udma_ops op);
+void aspeed_udma_rx_chan_ctrl(u32 ch_no, enum aspeed_udma_ops op);
+
+int aspeed_udma_request_tx_chan(u32 ch_no, dma_addr_t addr,
+				struct circ_buf *rb, u32 rb_sz,
+				aspeed_udma_cb_t cb, void *id, bool en_tmout);
+int aspeed_udma_request_rx_chan(u32 ch_no, dma_addr_t addr,
+				struct circ_buf *rb, u32 rb_sz,
+				aspeed_udma_cb_t cb, void *id, bool en_tmout);
+
+int aspeed_udma_free_tx_chan(u32 ch_no);
+int aspeed_udma_free_rx_chan(u32 ch_no);
+
+#endif
-- 
2.25.1

