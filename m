Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F56C0BF5
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 09:15:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg6xC6YXQz3cNM
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 19:15:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg6tH46wwz3cFd;
	Mon, 20 Mar 2023 19:12:54 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 32K7v6wi088828;
	Mon, 20 Mar 2023 15:57:06 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Mar
 2023 16:11:39 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <vkoul@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <pmenzel@molgen.mpg.de>,
        <ilpo.jarvinen@linux.intel.com>, <hdanton@sina.com>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 4/5] serial: 8250: Add AST2600 UART driver
Date: Mon, 20 Mar 2023 16:11:32 +0800
Message-ID: <20230320081133.23655-5-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320081133.23655-1-chiawei_wang@aspeedtech.com>
References: <20230320081133.23655-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 32K7v6wi088828
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

Add new UART driver with DMA support for Aspeed AST2600 SoCs.
The drivers mainly prepare the dma instance based on the 8250_dma
implementation to leverage the AST2600 UART DMA (UDMA) engine.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 drivers/tty/serial/8250/8250_aspeed.c | 224 ++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig       |   8 +
 drivers/tty/serial/8250/Makefile      |   1 +
 3 files changed, 233 insertions(+)
 create mode 100644 drivers/tty/serial/8250/8250_aspeed.c

diff --git a/drivers/tty/serial/8250/8250_aspeed.c b/drivers/tty/serial/8250/8250_aspeed.c
new file mode 100644
index 000000000000..04d0bf6fba28
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_aspeed.c
@@ -0,0 +1,224 @@
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
+
+#include "8250.h"
+
+#define DEVICE_NAME "aspeed-uart"
+
+struct ast8250_data {
+	int line;
+	int irq;
+	u8 __iomem *regs;
+	struct reset_control *rst;
+	struct clk *clk;
+#ifdef CONFIG_SERIAL_8250_DMA
+	struct uart_8250_dma dma;
+#endif
+};
+
+#ifdef CONFIG_SERIAL_8250_DMA
+static int ast8250_rx_dma(struct uart_8250_port *p);
+
+static void ast8250_rx_dma_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+	struct tty_port *tty_port = &p->port.state->port;
+	struct dma_tx_state	state;
+	int	count;
+
+	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
+
+	count = dma->rx_size - state.residue;
+
+	tty_insert_flip_string(tty_port, dma->rx_buf, count);
+	p->port.icount.rx += count;
+
+	tty_flip_buffer_push(tty_port);
+
+	ast8250_rx_dma(p);
+}
+
+static int ast8250_rx_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	struct dma_async_tx_descriptor *tx;
+
+	tx = dmaengine_prep_slave_single(dma->rxchan, dma->rx_addr,
+					 dma->rx_size, DMA_DEV_TO_MEM,
+					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!tx)
+		return -EBUSY;
+
+	tx->callback = ast8250_rx_dma_complete;
+	tx->callback_param = p;
+
+	dma->rx_cookie = dmaengine_submit(tx);
+
+	dma_async_issue_pending(dma->rxchan);
+
+	return 0;
+}
+#endif
+
+static int ast8250_handle_irq(struct uart_port *port)
+{
+	return serial8250_handle_irq(port, serial_port_in(port, UART_IIR));
+}
+
+static int ast8250_startup(struct uart_port *port)
+{
+#ifdef CONFIG_SERIAL_8250_DMA
+	int rc;
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	rc = serial8250_do_startup(port);
+	if (rc)
+		return rc;
+
+	/*
+	 * The default RX DMA is launched upon rising DR bit.
+	 *
+	 * However, this can result in byte lost if UART FIFO has
+	 * been overruned before the DMA engine gets prepared and
+	 * read the data out. This is especially common when UART
+	 * DMA is used for file transfer. Thus we initiate RX DMA
+	 * as early as possible.
+	 */
+	if (up->dma)
+		return ast8250_rx_dma(up);
+
+	return 0;
+#else
+	return serial8250_do_startup(port);
+#endif
+}
+
+static void ast8250_shutdown(struct uart_port *port)
+{
+	return serial8250_do_shutdown(port);
+}
+
+static int ast8250_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct uart_8250_port uart = {};
+	struct uart_port *port = &uart.port;
+	struct device *dev = &pdev->dev;
+	struct ast8250_data *data;
+	struct resource *res;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->irq = platform_get_irq(pdev, 0);
+	if (data->irq < 0)
+		return data->irq;
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
+	spin_lock_init(&port->lock);
+	port->dev = dev;
+	port->type = PORT_16550A;
+	port->irq = data->irq;
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
+#ifdef CONFIG_SERIAL_8250_DMA
+	data->dma.rxconf.src_maxburst = UART_XMIT_SIZE;
+	data->dma.txconf.dst_maxburst = UART_XMIT_SIZE;
+	uart.dma = &data->dma;
+#endif
+
+	data->line = serial8250_register_8250_port(&uart);
+	if (data->line < 0) {
+		dev_err(dev, "failed to register 8250 port\n");
+		return data->line;
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static int ast8250_remove(struct platform_device *pdev)
+{
+	struct ast8250_data *data = platform_get_drvdata(pdev);
+
+	serial8250_unregister_port(data->line);
+
+	return 0;
+}
+
+static const struct of_device_id ast8250_of_match[] = {
+	{ .compatible = "aspeed,ast2600-uart" },
+	{ },
+};
+
+static struct platform_driver ast8250_platform_driver = {
+	.driver = {
+		.name = DEVICE_NAME,
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
+MODULE_DESCRIPTION("Aspeed 8250 UART Driver with DMA support");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 978dc196c29b..f8a2231816c4 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -253,6 +253,14 @@ config SERIAL_8250_ACCENT
 	  To compile this driver as a module, choose M here: the module
 	  will be called 8250_accent.
 
+config SERIAL_8250_ASPEED
+	tristate "Aspeed UART"
+	depends on ARCH_ASPEED && SERIAL_8250
+	help
+	  If you have a system using an Aspeed AST26xx SoCs and wish to
+	  make use of its 16550A-compatible UART devices with DMA support,
+	  say Y to this option. If unsure, say N.
+
 config SERIAL_8250_ASPEED_VUART
 	tristate "Aspeed Virtual UART"
 	depends on SERIAL_8250
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 4fc2fc1f41b6..7b959e652b67 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_SERIAL_8250_HP300)		+= 8250_hp300.o
 obj-$(CONFIG_SERIAL_8250_CS)		+= serial_cs.o
 obj-$(CONFIG_SERIAL_8250_ACORN)		+= 8250_acorn.o
 obj-$(CONFIG_SERIAL_8250_ASPEED_VUART)	+= 8250_aspeed_vuart.o
+obj-$(CONFIG_SERIAL_8250_ASPEED)	+= 8250_aspeed.o
 obj-$(CONFIG_SERIAL_8250_BCM2835AUX)	+= 8250_bcm2835aux.o
 obj-$(CONFIG_SERIAL_8250_CONSOLE)	+= 8250_early.o
 obj-$(CONFIG_SERIAL_8250_FOURPORT)	+= 8250_fourport.o
-- 
2.25.1

