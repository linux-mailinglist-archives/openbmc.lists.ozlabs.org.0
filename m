Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0869193B
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 08:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PClky0sfwz3f79
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 18:30:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PClgm5Hbdz3cYd;
	Fri, 10 Feb 2023 18:27:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 31A7EWrq068845;
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
Subject: [PATCH 3/4] serial: 8250: Add Aspeed UART driver
Date: Fri, 10 Feb 2023 15:26:42 +0800
Message-ID: <20230210072643.2772-4-chiawei_wang@aspeedtech.com>
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
X-MAIL: twspam01.aspeedtech.com 31A7EWrq068845
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

Add the driver for Aspeed UART/VUART devices, which are 16550A
compatible. It is an wrapper to cover the generic 16550A operation
while exetending DMA feature for the devices.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 drivers/tty/serial/8250/8250_aspeed.c | 502 ++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig       |   8 +
 drivers/tty/serial/8250/Makefile      |   1 +
 3 files changed, 511 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_aspeed.c

diff --git a/drivers/tty/serial/8250/8250_aspeed.c b/drivers/tty/serial/8250/8250_aspeed.c
new file mode 100644
index 000000000000..2eaa59ee6d27
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_aspeed.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ */
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/serial_8250.h>
+#include <linux/serial_reg.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <linux/dma-mapping.h>
+#include <linux/circ_buf.h>
+#include <linux/tty_flip.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/aspeed/aspeed-udma.h>
+
+#include "8250.h"
+
+#define DEVICE_NAME "aspeed-uart"
+
+/* offsets for the aspeed virtual uart registers */
+#define VUART_GCRA	0x20
+#define   VUART_GCRA_VUART_EN			BIT(0)
+#define   VUART_GCRA_SIRQ_POLARITY		BIT(1)
+#define   VUART_GCRA_DISABLE_HOST_TX_DISCARD	BIT(5)
+#define VUART_GCRB	0x24
+#define   VUART_GCRB_HOST_SIRQ_MASK		GENMASK(7, 4)
+#define   VUART_GCRB_HOST_SIRQ_SHIFT		4
+#define VUART_ADDRL	0x28
+#define VUART_ADDRH	0x2c
+
+#define DMA_TX_BUFSZ	PAGE_SIZE
+#define DMA_RX_BUFSZ	(64 * 1024)
+
+struct uart_ops ast8250_pops;
+
+struct ast8250_vuart {
+	u32 port;
+	u32 sirq;
+	u32 sirq_pol;
+};
+
+struct ast8250_udma {
+	u32 ch;
+
+	u32 tx_rbsz;
+	u32 rx_rbsz;
+
+	dma_addr_t tx_addr;
+	dma_addr_t rx_addr;
+
+	struct circ_buf *tx_rb;
+	struct circ_buf *rx_rb;
+
+	bool tx_tmout_dis;
+	bool rx_tmout_dis;
+};
+
+struct ast8250_data {
+	int line;
+
+	u8 __iomem *regs;
+
+	bool is_vuart;
+	bool use_dma;
+
+	struct reset_control *rst;
+	struct clk *clk;
+
+	struct ast8250_vuart vuart;
+	struct ast8250_udma dma;
+};
+
+static void ast8250_dma_tx_complete(int tx_rb_rptr, void *id)
+{
+	u32 count;
+	unsigned long flags;
+	struct uart_port *port = (struct uart_port *)id;
+	struct ast8250_data *data = port->private_data;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	count = CIRC_CNT(tx_rb_rptr, port->state->xmit.tail, data->dma.tx_rbsz);
+	port->state->xmit.tail = tx_rb_rptr;
+	port->icount.tx += count;
+
+	if (uart_circ_chars_pending(&port->state->xmit) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+static void ast8250_dma_rx_complete(int rx_rb_wptr, void *id)
+{
+	unsigned long flags;
+	struct uart_port *up = (struct uart_port *)id;
+	struct tty_port *tp = &up->state->port;
+	struct ast8250_data *data = up->private_data;
+	struct ast8250_udma *dma = &data->dma;
+	struct circ_buf *rx_rb = dma->rx_rb;
+	u32 rx_rbsz = dma->rx_rbsz;
+	u32 count = 0;
+
+	spin_lock_irqsave(&up->lock, flags);
+
+	rx_rb->head = rx_rb_wptr;
+
+	dma_sync_single_for_cpu(up->dev,
+			dma->rx_addr, dma->rx_rbsz, DMA_FROM_DEVICE);
+
+	while (CIRC_CNT(rx_rb->head, rx_rb->tail, rx_rbsz)) {
+		count = CIRC_CNT_TO_END(rx_rb->head, rx_rb->tail, rx_rbsz);
+
+		tty_insert_flip_string(tp, rx_rb->buf + rx_rb->tail, count);
+
+		rx_rb->tail += count;
+		rx_rb->tail %= rx_rbsz;
+
+		up->icount.rx += count;
+	}
+
+	if (count) {
+		aspeed_udma_set_rx_rptr(data->dma.ch, rx_rb->tail);
+		tty_flip_buffer_push(tp);
+	}
+
+	spin_unlock_irqrestore(&up->lock, flags);
+}
+
+static void ast8250_dma_start_tx(struct uart_port *port)
+{
+	struct ast8250_data *data = port->private_data;
+	struct ast8250_udma *dma = &data->dma;
+	struct circ_buf *tx_rb = dma->tx_rb;
+
+	dma_sync_single_for_device(port->dev,
+			dma->tx_addr, dma->tx_rbsz, DMA_TO_DEVICE);
+
+	aspeed_udma_set_tx_wptr(dma->ch, tx_rb->head);
+}
+
+static void ast8250_dma_pops_hook(struct uart_port *port)
+{
+	static int first = 1;
+
+	if (first) {
+		ast8250_pops = *port->ops;
+		ast8250_pops.start_tx = ast8250_dma_start_tx;
+	}
+
+	first = 0;
+	port->ops = &ast8250_pops;
+}
+
+static void ast8250_vuart_init(struct ast8250_data *data)
+{
+	u8 reg;
+	struct ast8250_vuart *vuart = &data->vuart;
+
+	/* IO port address */
+	writeb((u8)(vuart->port >> 0), data->regs + VUART_ADDRL);
+	writeb((u8)(vuart->port >> 8), data->regs + VUART_ADDRH);
+
+	/* SIRQ number */
+	reg = readb(data->regs + VUART_GCRB);
+	reg &= ~VUART_GCRB_HOST_SIRQ_MASK;
+	reg |= ((vuart->sirq << VUART_GCRB_HOST_SIRQ_SHIFT) & VUART_GCRB_HOST_SIRQ_MASK);
+	writeb(reg, data->regs + VUART_GCRB);
+
+	/* SIRQ polarity */
+	reg = readb(data->regs + VUART_GCRA);
+	if (vuart->sirq_pol)
+		reg |= VUART_GCRA_SIRQ_POLARITY;
+	else
+		reg &= ~VUART_GCRA_SIRQ_POLARITY;
+	writeb(reg, data->regs + VUART_GCRA);
+}
+
+static void ast8250_vuart_set_host_tx_discard(struct ast8250_data *data, bool discard)
+{
+	u8 reg;
+
+	reg = readb(data->regs + VUART_GCRA);
+	if (discard)
+		reg &= ~VUART_GCRA_DISABLE_HOST_TX_DISCARD;
+	else
+		reg |= VUART_GCRA_DISABLE_HOST_TX_DISCARD;
+	writeb(reg, data->regs + VUART_GCRA);
+}
+
+static void ast8250_vuart_set_enable(struct ast8250_data *data, bool enable)
+{
+	u8 reg;
+
+	reg = readb(data->regs + VUART_GCRA);
+	if (enable)
+		reg |= VUART_GCRA_VUART_EN;
+	else
+		reg &= ~VUART_GCRA_VUART_EN;
+	writeb(reg, data->regs + VUART_GCRA);
+}
+
+static int ast8250_handle_irq(struct uart_port *port)
+{
+	u32 iir = port->serial_in(port, UART_IIR);
+
+	return serial8250_handle_irq(port, iir);
+}
+
+static int ast8250_startup(struct uart_port *port)
+{
+	int rc = 0;
+	struct ast8250_data *data = port->private_data;
+	struct ast8250_udma *dma;
+
+	if (data->is_vuart)
+		ast8250_vuart_set_host_tx_discard(data, false);
+
+	if (data->use_dma) {
+		dma = &data->dma;
+
+		dma->tx_rbsz = DMA_TX_BUFSZ;
+		dma->rx_rbsz = DMA_RX_BUFSZ;
+
+		/*
+		 * We take the xmit buffer passed from upper layers as
+		 * the DMA TX buffer and allocate a new buffer for the
+		 * RX use.
+		 *
+		 * To keep the TX/RX operation consistency, we use the
+		 * streaming DMA interface instead of the coherent one
+		 */
+		dma->tx_rb = &port->state->xmit;
+		dma->rx_rb->buf = kzalloc(data->dma.rx_rbsz, GFP_KERNEL);
+		if (IS_ERR_OR_NULL(dma->rx_rb->buf)) {
+			dev_err(port->dev, "failed to allcoate RX DMA buffer\n");
+			rc = -ENOMEM;
+			goto out;
+		}
+
+		dma->tx_addr = dma_map_single(port->dev, dma->tx_rb->buf,
+				dma->tx_rbsz, DMA_TO_DEVICE);
+		if (dma_mapping_error(port->dev, dma->tx_addr)) {
+			dev_err(port->dev, "failed to map streaming TX DMA region\n");
+			rc = -ENOMEM;
+			goto free_dma_n_out;
+		}
+
+		dma->rx_addr = dma_map_single(port->dev, dma->rx_rb->buf,
+				dma->rx_rbsz, DMA_FROM_DEVICE);
+		if (dma_mapping_error(port->dev, dma->rx_addr)) {
+			dev_err(port->dev, "failed to map streaming RX DMA region\n");
+			rc = -ENOMEM;
+			goto free_dma_n_out;
+		}
+
+		rc = aspeed_udma_request_tx_chan(dma->ch, dma->tx_addr, dma->tx_rb,
+						 dma->tx_rbsz, ast8250_dma_tx_complete,
+						 port, dma->tx_tmout_dis);
+		if (rc) {
+			dev_err(port->dev, "failed to request DMA TX channel\n");
+			goto free_dma_n_out;
+		}
+
+		rc = aspeed_udma_request_rx_chan(dma->ch, dma->rx_addr, dma->rx_rb,
+						 dma->rx_rbsz, ast8250_dma_rx_complete,
+						 port, dma->rx_tmout_dis);
+		if (rc) {
+			dev_err(port->dev, "failed to request DMA RX channel\n");
+			goto free_dma_n_out;
+		}
+
+		ast8250_dma_pops_hook(port);
+
+		aspeed_udma_tx_chan_ctrl(dma->ch, ASPEED_UDMA_OP_ENABLE);
+		aspeed_udma_rx_chan_ctrl(dma->ch, ASPEED_UDMA_OP_ENABLE);
+	}
+
+	memset(&port->icount, 0, sizeof(port->icount));
+	return serial8250_do_startup(port);
+
+free_dma_n_out:
+	kfree(dma->rx_rb->buf);
+out:
+	return rc;
+}
+
+static void ast8250_shutdown(struct uart_port *port)
+{
+	int rc;
+	struct ast8250_data *data = port->private_data;
+	struct ast8250_udma *dma;
+
+	if (data->use_dma) {
+		dma = &data->dma;
+
+		aspeed_udma_tx_chan_ctrl(dma->ch, ASPEED_UDMA_OP_RESET);
+		aspeed_udma_rx_chan_ctrl(dma->ch, ASPEED_UDMA_OP_RESET);
+
+		aspeed_udma_tx_chan_ctrl(dma->ch, ASPEED_UDMA_OP_DISABLE);
+		aspeed_udma_rx_chan_ctrl(dma->ch, ASPEED_UDMA_OP_DISABLE);
+
+		rc = aspeed_udma_free_tx_chan(dma->ch);
+		if (rc)
+			dev_err(port->dev, "failed to free DMA TX channel, rc=%d\n", rc);
+
+		rc = aspeed_udma_free_rx_chan(dma->ch);
+		if (rc)
+			dev_err(port->dev, "failed to free DMA TX channel, rc=%d\n", rc);
+
+		dma_unmap_single(port->dev, dma->tx_addr,
+				dma->tx_rbsz, DMA_TO_DEVICE);
+		dma_unmap_single(port->dev, dma->rx_addr,
+				dma->rx_rbsz, DMA_FROM_DEVICE);
+
+		kfree(dma->rx_rb->buf);
+	}
+
+	if (data->is_vuart)
+		ast8250_vuart_set_host_tx_discard(data, true);
+
+	serial8250_do_shutdown(port);
+}
+
+static int __maybe_unused ast8250_suspend(struct device *dev)
+{
+	struct ast8250_data *data = dev_get_drvdata(dev);
+
+	serial8250_suspend_port(data->line);
+
+	return 0;
+}
+
+static int __maybe_unused ast8250_resume(struct device *dev)
+{
+	struct ast8250_data *data = dev_get_drvdata(dev);
+
+	serial8250_resume_port(data->line);
+
+	return 0;
+}
+
+static int ast8250_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct uart_8250_port uart = {};
+	struct uart_port *port = &uart.port;
+	struct device *dev = &pdev->dev;
+	struct ast8250_data *data;
+
+	struct resource *res;
+	u32 irq;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (data == NULL)
+		return -ENOMEM;
+
+	data->dma.rx_rb = devm_kzalloc(dev, sizeof(data->dma.rx_rb), GFP_KERNEL);
+	if (data->dma.rx_rb == NULL)
+		return -ENOMEM;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		dev_err(dev, "failed to get register base\n");
+		return -ENODEV;
+	}
+
+	data->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(data->regs)) {
+		dev_err(dev, "failed to map registers\n");
+		return PTR_ERR(data->regs);
+	}
+
+	data->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(data->clk)) {
+		dev_err(dev, "failed to get clocks\n");
+		return -ENODEV;
+	}
+
+	rc = clk_prepare_enable(data->clk);
+	if (rc) {
+		dev_err(dev, "failed to enable clock\n");
+		return rc;
+	}
+
+	data->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (!IS_ERR(data->rst))
+		reset_control_deassert(data->rst);
+
+	data->is_vuart = of_property_read_bool(dev->of_node, "virtual");
+	if (data->is_vuart) {
+		rc = of_property_read_u32(dev->of_node, "port", &data->vuart.port);
+		if (rc) {
+			dev_err(dev, "failed to get VUART port address\n");
+			return -ENODEV;
+		}
+
+		rc = of_property_read_u32(dev->of_node, "sirq", &data->vuart.sirq);
+		if (rc) {
+			dev_err(dev, "failed to get VUART SIRQ number\n");
+			return -ENODEV;
+		}
+
+		rc = of_property_read_u32(dev->of_node, "sirq-polarity", &data->vuart.sirq_pol);
+		if (rc) {
+			dev_err(dev, "failed to get VUART SIRQ polarity\n");
+			return -ENODEV;
+		}
+
+		ast8250_vuart_init(data);
+		ast8250_vuart_set_host_tx_discard(data, true);
+		ast8250_vuart_set_enable(data, true);
+	}
+
+	data->use_dma = of_property_read_bool(dev->of_node, "dma-mode");
+	if (data->use_dma) {
+		rc = of_property_read_u32(dev->of_node, "dma-channel", &data->dma.ch);
+		if (rc) {
+			dev_err(dev, "failed to get DMA channel\n");
+			return -ENODEV;
+		}
+
+		data->dma.tx_tmout_dis = of_property_read_bool(dev->of_node,
+							       "dma-tx-timeout-disable");
+		data->dma.rx_tmout_dis = of_property_read_bool(dev->of_node,
+							       "dma-rx-timeout-disable");
+	}
+
+	spin_lock_init(&port->lock);
+	port->dev = dev;
+	port->type = PORT_16550A;
+	port->irq = irq;
+	port->line = of_alias_get_id(dev->of_node, "serial");
+	port->handle_irq = ast8250_handle_irq;
+	port->mapbase = res->start;
+	port->mapsize = resource_size(res);
+	port->membase = data->regs;
+	port->uartclk = clk_get_rate(data->clk);
+	port->regshift = 2;
+	port->iotype = UPIO_MEM32;
+	port->flags = UPF_FIXED_TYPE | UPF_FIXED_PORT | UPF_SHARE_IRQ;
+	port->startup = ast8250_startup;
+	port->shutdown = ast8250_shutdown;
+	port->private_data = data;
+	uart.bugs |= UART_BUG_TXRACE;
+
+	data->line = serial8250_register_8250_port(&uart);
+	if (data->line < 0) {
+		dev_err(dev, "failed to register 8250 port\n");
+		return data->line;
+	}
+
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	platform_set_drvdata(pdev, data);
+	return 0;
+}
+
+static int ast8250_remove(struct platform_device *pdev)
+{
+	struct ast8250_data *data = platform_get_drvdata(pdev);
+
+	if (data->is_vuart)
+		ast8250_vuart_set_enable(data, false);
+
+	serial8250_unregister_port(data->line);
+	return 0;
+}
+
+static const struct dev_pm_ops ast8250_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(ast8250_suspend, ast8250_resume)
+};
+
+static const struct of_device_id ast8250_of_match[] = {
+	{ .compatible = "aspeed,ast2600-uart" },
+};
+
+static struct platform_driver ast8250_platform_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
+		.pm = &ast8250_pm_ops,
+		.of_match_table = ast8250_of_match,
+	},
+	.probe = ast8250_probe,
+	.remove = ast8250_remove,
+};
+
+module_platform_driver(ast8250_platform_driver);
+
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Aspeed UART Driver");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index b0f62345bc84..d8ecc261d8c4 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -538,6 +538,14 @@ config SERIAL_8250_BCM7271
 	  including DMA support and high accuracy BAUD rates, say
 	  Y to this option. If unsure, say N.
 
+config SERIAL_8250_ASPEED
+	tristate "Aspeed serial port support"
+	depends on SERIAL_8250 && ARCH_ASPEED
+	help
+	  If you have a system using an Aspeed AST26xx SoCs and wish to
+	  make use of its UARTs and VUARTs, which are 16550A compatible
+	  and include DMA support, say Y to this option. If unsure, say N.
+
 config SERIAL_OF_PLATFORM
 	tristate "Devicetree based probing for 8250 ports"
 	depends on SERIAL_8250 && OF
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 1615bfdde2a0..7f05b7ed422b 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_SERIAL_8250_PERICOM)	+= 8250_pericom.o
 obj-$(CONFIG_SERIAL_8250_PXA)		+= 8250_pxa.o
 obj-$(CONFIG_SERIAL_8250_TEGRA)		+= 8250_tegra.o
 obj-$(CONFIG_SERIAL_8250_BCM7271)	+= 8250_bcm7271.o
+obj-$(CONFIG_SERIAL_8250_ASPEED)	+= 8250_aspeed.o
 obj-$(CONFIG_SERIAL_OF_PLATFORM)	+= 8250_of.o
 
 CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
-- 
2.25.1

