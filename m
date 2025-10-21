Return-Path: <openbmc+bounces-782-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DEBF4475
	for <lists+openbmc@lfdr.de>; Tue, 21 Oct 2025 03:37:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crFHv6S0Cz30RN;
	Tue, 21 Oct 2025 12:36:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761010571;
	cv=none; b=EZlwq5d7AAJiBu86WzOfdmqDwBZrE3QLNc7udE/Sz6wK0VfiQudAFYMkkZWQNwEWx+rzUiqs4JkcFWLdEug41OK12QUX3I+hKZPIKXej99niBjj2Jj+3bKKoGxjoQTrSml4vcdjcMwMD7MBcv3JIFwldbXAJGfengqJgb5eIgsFVGh6aGs3kjHExaP98HSr4wXy754uLYdtiYBebUy37vhRPHLE++SlKNoy8UXuA2S3U4RO60tBZwETVuHLhSLEfcXqCiCkbFveECf7nYSstXzNHTWe+TFuLXKS479qSJbK17KnS4AFEJr2IJh/Oa31XcsQqGm8OMRwr/2HEGmpmAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761010571; c=relaxed/relaxed;
	bh=KqZSvbzY4Ob459byM0mh4FRU45daFFSxefzdAPtFSo4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/zvjdkd1uoWWJsfWkgAtBRqPQb9z7iX0ba8v52xw6QMX9qvDZmr+Gp76MvqHd2J2ZPwUoPObxLgq25FNgmTM7lQKt1E2gF7hz76yJgu3BoKwXC8jznFpG3BlGt3aKIQ7Kk8/2Gy6lC6ujzFOmDjdU+LXYPMoINwdfMsuPQ0grEuOlsXrWrOVCr0Ob41f3JFZQbSHbDulm0NaVporSMolNuvpiW+HSfe7I/w7tnMk+wMjKs6jwCqWXrYkOR2N4ttuPMWqm7CFt2KViZvVbyY2bFkyhTs6ekteZY+YPRVoseejjuJh1ddHi0vV/WubC2icqBlgIT61hY6Vl6tv1qlJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crFHv0jtrz3bW7;
	Tue, 21 Oct 2025 12:36:11 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 21 Oct
 2025 09:35:48 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 21 Oct 2025 09:35:48 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <ryan_chen@aspeedtech.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <jk@codeconstruct.com.au>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<naresh.solanki@9elements.com>, <linux-i2c@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v20 4/4] i2c: ast2600: Add target mode support
Date: Tue, 21 Oct 2025 09:35:48 +0800
Message-ID: <20251021013548.2375190-5-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add target mode support to the AST2600 I2C driver using
new register layout.

Target mode features implemented include:
- Add target interrupt handling
- Address match and response logic
- Separate Tx/Rx DMA address and length configuration

This complements the existing controller-mode support,
enabling dual-role capability.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/i2c/busses/i2c-ast2600.c | 560 +++++++++++++++++++++++++++++++
 1 file changed, 560 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-ast2600.c
index 885b451030ac..81d1eb51334a 100644
--- a/drivers/i2c/busses/i2c-ast2600.c
+++ b/drivers/i2c/busses/i2c-ast2600.c
@@ -81,6 +81,7 @@
 #define AST2600_I2CC_THDDAT(x)			(((x) & GENMASK(1, 0)) << 10)
 #define AST2600_I2CC_TOUTBASECLK(x)			(((x) & GENMASK(1, 0)) << 8)
 #define AST2600_I2CC_TBASECLK(x)			((x) & GENMASK(3, 0))
+#define AST2600_I2CC_AC_TIMING_MASK		GENMASK(23, 0)
 
 /* 0x08 : I2CC Controller/Target Transmit/Receive Byte Buffer Register */
 #define AST2600_I2CC_STS_AND_BUFF		0x08
@@ -271,6 +272,13 @@ struct ast2600_i2c_bus {
 	/* Buffer mode */
 	void __iomem		*buf_base;
 	struct i2c_smbus_alert_setup	alert_data;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* target structure */
+	int			target_operate;
+	unsigned char	*target_dma_buf;
+	dma_addr_t		target_dma_addr;
+	struct i2c_client	*target;
+#endif
 };
 
 static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
@@ -361,6 +369,423 @@ static int ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void ast2600_i2c_target_packet_dma_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	int target_rx_len = 0;
+	u32 cmd = 0;
+	u8 value;
+	int i;
+
+	sts &= ~(AST2600_I2CS_SLAVE_PENDING);
+	/* Handle i2c target timeout condition */
+	if (AST2600_I2CS_INACTIVE_TO & sts) {
+		cmd = TARGET_TRIGGER_CMD;
+		cmd |= AST2600_I2CS_RX_DMA_EN;
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		return;
+	}
+
+	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
+
+	switch (sts) {
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		target_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
+						      AST2600_I2CS_DMA_LEN_STS));
+		for (i = 0; i < target_rx_len; i++) {
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
+					&i2c_bus->target_dma_buf[i]);
+		}
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE_NAK |
+			AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA |
+			AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_RX_DONE_NAK | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_STOP:
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		if (sts & AST2600_I2CS_SLAVE_MATCH)
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+		target_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
+						      AST2600_I2CS_DMA_LEN_STS));
+		for (i = 0; i < target_rx_len; i++) {
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
+					&i2c_bus->target_dma_buf[i]);
+		}
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		if (sts & AST2600_I2CS_STOP)
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+
+	/* it is Mw data Mr coming -> it need send tx */
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
+		/* it should be repeat start read */
+		if (sts & AST2600_I2CS_SLAVE_MATCH)
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+		target_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
+						      AST2600_I2CS_DMA_LEN_STS));
+		for (i = 0; i < target_rx_len; i++) {
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED,
+					&i2c_bus->target_dma_buf[i]);
+		}
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
+				&i2c_bus->target_dma_buf[0]);
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA:
+		/* First Start read */
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED,
+				&i2c_bus->target_dma_buf[0]);
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_WAIT_TX_DMA:
+		/* it should be next start read */
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_PROCESSED,
+				&i2c_bus->target_dma_buf[0]);
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
+		/* it just tx complete */
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+		cmd = 0;
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		break;
+	case AST2600_I2CS_STOP:
+		cmd = 0;
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		break;
+	default:
+		dev_dbg(i2c_bus->dev, "unhandled target isr case %x, sts %x\n", sts,
+			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
+		break;
+	}
+
+	if (cmd)
+		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
+	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
+}
+
+static void ast2600_i2c_target_packet_buff_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	int target_rx_len = 0;
+	u32 cmd = 0;
+	u8 value;
+	int i;
+
+	/* due to controller target is common buffer, need force the master stop not issue */
+	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & GENMASK(15, 0)) {
+		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
+		i2c_bus->cmd_err = -EBUSY;
+		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		complete(&i2c_bus->cmd_complete);
+	}
+
+	/* Handle i2c target timeout condition */
+	if (AST2600_I2CS_INACTIVE_TO & sts) {
+		/* Reset timeout counter */
+		u32 ac_timing = readl(i2c_bus->reg_base + AST2600_I2CC_AC_TIMING) &
+				AST2600_I2CC_AC_TIMING_MASK;
+
+		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
+		ac_timing |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
+		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
+		writel(TARGET_TRIGGER_CMD, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		i2c_bus->target_operate = 0;
+		return;
+	}
+
+	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
+
+	if (sts & AST2600_I2CS_SLAVE_MATCH)
+		i2c_bus->target_operate = 1;
+
+	switch (sts) {
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
+		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_SLAVE_PENDING |
+		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_SLAVE_PENDING |
+		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		fallthrough;
+	case AST2600_I2CS_SLAVE_PENDING |
+		 AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		cmd = TARGET_TRIGGER_CMD;
+		if (sts & AST2600_I2CS_RX_DONE) {
+			target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+							       AST2600_I2CC_BUFF_CTRL));
+			for (i = 0; i < target_rx_len; i++) {
+				value = readb(i2c_bus->buf_base + 0x10 + i);
+				i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+			}
+		}
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) & AST2600_I2CS_RX_BUFF_EN)
+			cmd = 0;
+		else
+			cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
+
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		break;
+	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_RX_DONE:
+		cmd = TARGET_TRIGGER_CMD;
+		target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+						       AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < target_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		cmd |= AST2600_I2CS_RX_BUFF_EN;
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		break;
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
+				AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		cmd = TARGET_TRIGGER_CMD;
+		target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < target_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		cmd |= AST2600_I2CS_RX_BUFF_EN;
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		break;
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		cmd = TARGET_TRIGGER_CMD;
+		target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < target_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		/* workaround for avoid next start with len != 0 */
+		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		break;
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		cmd = TARGET_TRIGGER_CMD;
+		target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < target_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		/* workaround for avoid next start with len != 0 */
+		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		break;
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE |
+	     AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_STOP:
+		target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < target_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED, &value);
+		writeb(value, i2c_bus->buf_base);
+		break;
+	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_SLAVE_MATCH:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED, &value);
+		writeb(value, i2c_bus->buf_base);
+		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
+		break;
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_STOP |
+	     AST2600_I2CS_TX_NAK | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_STOP |
+	     AST2600_I2CS_TX_NAK | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+						AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < target_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_TX_DMA:
+		if (sts & AST2600_I2CS_SLAVE_MATCH)
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+		if (sts & AST2600_I2CS_RX_DONE) {
+			target_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+							AST2600_I2CC_BUFF_CTRL));
+			for (i = 0; i < target_rx_len; i++) {
+				value = readb(i2c_bus->buf_base + 0x10 + i);
+				i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &value);
+			}
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED, &value);
+		} else {
+			i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_PROCESSED, &value);
+		}
+		writeb(value, i2c_bus->buf_base);
+		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
+		break;
+	/* workaround : trigger the cmd twice to fix next state keep 1000000 */
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
+		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		break;
+
+	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
+	case AST2600_I2CS_STOP:
+		cmd = TARGET_TRIGGER_CMD;
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		break;
+	default:
+		dev_dbg(i2c_bus->dev, "unhandled target isr case %x, sts %x\n", sts,
+			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
+		break;
+	}
+
+	if (cmd)
+		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+	writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
+	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
+
+	if ((sts & AST2600_I2CS_STOP) && !(sts & AST2600_I2CS_SLAVE_PENDING))
+		i2c_bus->target_operate = 0;
+}
+
+static void ast2600_i2c_target_byte_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	u32 i2c_buff = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+	u32 cmd = AST2600_I2CS_ACTIVE_ALL;
+	u8 byte_data;
+	u8 value;
+
+	switch (sts) {
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		/* first address match is address */
+		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
+		break;
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_RECEIVED, &byte_data);
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
+		cmd |= AST2600_I2CS_TX_CMD;
+		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_REQUESTED, &byte_data);
+		writel(byte_data, i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+		break;
+	case AST2600_I2CS_TX_ACK | AST2600_I2CS_WAIT_TX_DMA:
+		cmd |= AST2600_I2CS_TX_CMD;
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_READ_PROCESSED, &byte_data);
+		writel(byte_data, i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+		break;
+	case AST2600_I2CS_STOP:
+	case AST2600_I2CS_STOP | AST2600_I2CS_TX_NAK:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		break;
+	default:
+		dev_dbg(i2c_bus->dev, "unhandled pkt isr %x\n", sts);
+		break;
+	}
+	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+	writel(sts, i2c_bus->reg_base + AST2600_I2CS_ISR);
+	readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
+}
+
+static int ast2600_i2c_target_irq(struct ast2600_i2c_bus *i2c_bus)
+{
+	u32 ier = readl(i2c_bus->reg_base + AST2600_I2CS_IER);
+	u32 isr = readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
+
+	if (!(isr & ier))
+		return 0;
+
+	/*
+	 * Target interrupt coming after Master package done
+	 * So need handle master first.
+	 */
+	if (readl(i2c_bus->reg_base + AST2600_I2CM_ISR) & AST2600_I2CM_PKT_DONE)
+		return 0;
+
+	isr &= ~(AST2600_I2CS_ADDR_INDICATE_MASK);
+
+	if (AST2600_I2CS_ADDR1_NAK & isr)
+		isr &= ~AST2600_I2CS_ADDR1_NAK;
+
+	if (AST2600_I2CS_ADDR2_NAK & isr)
+		isr &= ~AST2600_I2CS_ADDR2_NAK;
+
+	if (AST2600_I2CS_ADDR3_NAK & isr)
+		isr &= ~AST2600_I2CS_ADDR3_NAK;
+
+	if (AST2600_I2CS_ADDR_MASK & isr)
+		isr &= ~AST2600_I2CS_ADDR_MASK;
+
+	if (AST2600_I2CS_PKT_DONE & isr) {
+		if (i2c_bus->mode == DMA_MODE)
+			ast2600_i2c_target_packet_dma_irq(i2c_bus, isr);
+		else
+			ast2600_i2c_target_packet_buff_irq(i2c_bus, isr);
+	} else {
+		ast2600_i2c_target_byte_irq(i2c_bus, isr);
+	}
+
+	return 1;
+}
+#endif
+
 static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
 {
 	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
@@ -690,6 +1115,20 @@ static void ast2600_i2c_controller_package_irq(struct ast2600_i2c_bus *i2c_bus,
 		}
 		break;
 	case AST2600_I2CM_RX_DONE:
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/*
+		 * Workaround for controller/target package mode enable rx done stuck issue
+		 * When master go for first read (RX_DONE), target mode will also effect
+		 * Then controller will send nack, not operate anymore.
+		 */
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) & AST2600_I2CS_PKT_MODE_EN) {
+			u32 target_cmd = readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+
+			writel(0, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+			writel(target_cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		}
+		fallthrough;
+#endif
 	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
 		/* do next rx */
 		if (i2c_bus->mode == DMA_MODE) {
@@ -799,6 +1238,12 @@ static irqreturn_t ast2600_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct ast2600_i2c_bus *i2c_bus = dev_id;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) & AST2600_I2CC_SLAVE_EN) {
+		if (ast2600_i2c_target_irq(i2c_bus))
+			return IRQ_HANDLED;
+	}
+#endif
 	return IRQ_RETVAL(ast2600_i2c_controller_irq(i2c_bus));
 }
 
@@ -815,12 +1260,30 @@ static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct i2c_msg
 			return ret;
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (i2c_bus->mode == BUFF_MODE) {
+		if (i2c_bus->target_operate)
+			return -EBUSY;
+		/* disable target isr */
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) || i2c_bus->target_operate) {
+			writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+			return -EBUSY;
+		}
+	}
+#endif
+
 	i2c_bus->cmd_err = 0;
 	i2c_bus->msgs = msgs;
 	i2c_bus->msgs_index = 0;
 	i2c_bus->msgs_count = num;
 	reinit_completion(&i2c_bus->cmd_complete);
 	ret = ast2600_i2c_do_start(i2c_bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* avoid race condication target is wait and master wait 1st target operate */
+	if (i2c_bus->mode == BUFF_MODE)
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+#endif
 	if (ret)
 		goto controller_out;
 	timeout = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
@@ -837,7 +1300,26 @@ static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct i2c_msg
 		    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
 		    AST2600_I2CC_BUS_BUSY_STS))
 			ast2600_i2c_recover_bus(i2c_bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		if (ctrl & AST2600_I2CC_SLAVE_EN) {
+			u32 cmd = TARGET_TRIGGER_CMD;
 
+			if (i2c_bus->mode == DMA_MODE) {
+				cmd |= AST2600_I2CS_RX_DMA_EN;
+				writel(i2c_bus->target_dma_addr,
+				       i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
+				writel(i2c_bus->target_dma_addr,
+				       i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
+				writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+				       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+			} else if (i2c_bus->mode == BUFF_MODE) {
+				cmd = TARGET_TRIGGER_CMD;
+			} else {
+				cmd &= ~AST2600_I2CS_PKT_MODE_EN;
+			}
+			writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		}
+#endif
 		ret = -ETIMEDOUT;
 	} else {
 		ret = i2c_bus->cmd_err;
@@ -886,7 +1368,78 @@ static void ast2600_i2c_init(struct ast2600_i2c_bus *i2c_bus)
 
 	/* Clear Interrupt */
 	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CM_ISR);
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* for memory buffer initial */
+	if (i2c_bus->mode == DMA_MODE) {
+		i2c_bus->target_dma_buf =
+			dmam_alloc_coherent(i2c_bus->dev, I2C_TARGET_MSG_BUF_SIZE,
+					    &i2c_bus->target_dma_addr, GFP_KERNEL);
+		if (!i2c_bus->target_dma_buf)
+			return;
+	}
+
+	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CS_ISR);
+
+	if (i2c_bus->mode == BYTE_MODE)
+		writel(GENMASK(15, 0), i2c_bus->reg_base + AST2600_I2CS_IER);
+	else
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+#endif
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int ast2600_i2c_reg_target(struct i2c_client *client)
+{
+	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(client->adapter);
+	u32 cmd = TARGET_TRIGGER_CMD;
+
+	if (i2c_bus->target)
+		return -EINVAL;
+
+	dev_dbg(i2c_bus->dev, "target addr %x\n", client->addr);
+
+	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+	writel(AST2600_I2CC_SLAVE_EN | readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL),
+	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+
+	/* trigger rx buffer */
+	if (i2c_bus->mode == DMA_MODE) {
+		cmd |= AST2600_I2CS_RX_DMA_EN;
+		writel(i2c_bus->target_dma_addr, i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
+		writel(i2c_bus->target_dma_addr, i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+	} else if (i2c_bus->mode == BUFF_MODE) {
+		cmd = TARGET_TRIGGER_CMD;
+	} else {
+		cmd &= ~AST2600_I2CS_PKT_MODE_EN;
+	}
+
+	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+	i2c_bus->target = client;
+	/* Set target addr. */
+	writel(client->addr | AST2600_I2CS_ADDR1_ENABLE,
+	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+
+	return 0;
+}
+
+static int ast2600_i2c_unreg_target(struct i2c_client *client)
+{
+	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(client->adapter);
+
+	/* Turn off target mode. */
+	writel(~AST2600_I2CC_SLAVE_EN & readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL),
+	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+	writel(readl(i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL) & ~AST2600_I2CS_ADDR1_MASK,
+	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+
+	i2c_bus->target = NULL;
+
+	return 0;
 }
+#endif
 
 static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
 {
@@ -896,6 +1449,10 @@ static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
 static const struct i2c_algorithm i2c_ast2600_algorithm = {
 	.xfer = ast2600_i2c_controller_xfer,
 	.functionality = ast2600_i2c_functionality,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_target = ast2600_i2c_reg_target,
+	.unreg_target = ast2600_i2c_unreg_target,
+#endif
 };
 
 static int ast2600_i2c_probe(struct platform_device *pdev)
@@ -930,6 +1487,9 @@ static int ast2600_i2c_probe(struct platform_device *pdev)
 		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DIV_CTRL);
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	i2c_bus->target_operate = 0;
+#endif
 	i2c_bus->dev = dev;
 	i2c_bus->mode = BUFF_MODE;
 	if (!device_property_read_string(dev, "aspeed,transfer-mode", &xfer_mode)) {
-- 
2.34.1


