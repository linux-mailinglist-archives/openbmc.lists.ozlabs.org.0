Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3F98CD94
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 09:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJQk76Fp7z3fvH
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2024 17:02:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727852559;
	cv=none; b=XeZNxgJZnIo1Se0omB7KqXDIS5Oce45OV7y8MTk8WeJAQTLabaL36zQIhfqNFaxAv/0lakOwV5SQN4lt9pTIUlaTNWsfk8ZIhiEvcgV4EB7JHEtuHOZUaETuDZIM8QiVZOQ69Jg7e6y7GFfGr2z47ZJ7PmDH2AFNY1L3CTliXaNNz+TZhnFmqj4ra+Zl2NSn9xD7tvKonT2InWbOjTMuM6SUplr8HXG+8U9/jtt6dqlZTZGw4vHRjR923e+QYJo5d2mV/L0CJ2OpkVO2mjzZjIxb2KDQWGVPUGLqM6VDpGphgARFX34EMoX2bVJZY6ueQ+2UNn9w2sXeKyU2wGFM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727852559; c=relaxed/relaxed;
	bh=SfSKk+NEAJXc7P8MUzZMMqe5JT/zAcPkttoIlU97vq8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fyM6KJQdJ7uElQVSchNLBUA8UIYbWnEofFA2IgKXm+9ppUG02IAFu828ofW5IPv0OEfqw2m3Yw/YmBqS+63xyepuLZyzU7+3oFYKZdUb/aUb0+y020bRST/3+NlcD8FJa+jNnWboEVKxdsy/YMrB4l5p/7UFDUedcs5/RJAw5meriks+zZzqaVf2BxhQvwhJJ8ZAsoKkCY6v0sCuR2uQ7ulwxKAyBdu2KkuT4ITc+gWzsknTeZnK6JR1K3MMxdK0FdSdhCqRWHbRPXYgVju8doNjAg7qdV1bY/xDuF5mXfJIHS9egLNX2UpuMqTIc+NaMqCEGBZ8tYO00oY7ciNjgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJQjq3qN7z2yYf;
	Wed,  2 Oct 2024 17:02:39 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 2 Oct
 2024 15:02:14 +0800
Received: from twmbx02.aspeed.com (192.168.10.152) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 2 Oct 2024 15:02:14 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: <brendan.higgins@linux.dev>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <andrew@codeconstruct.com.au>,
	<p.zabel@pengutronix.de>, <andriy.shevchenko@linux.intel.com>,
	<linux-i2c@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<ryan_chen@aspeedtech.com>
Subject: [PATCH v14 3/3] i2c: aspeed: support AST2600 i2c new register slave mode driver
Date: Wed, 2 Oct 2024 15:02:13 +0800
Message-ID: <20241002070213.1165263-4-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_FAIL,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

This patch is for i2c new register slave mode driver.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/i2c/busses/i2c-ast2600.c | 528 +++++++++++++++++++++++++++++++
 1 file changed, 528 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-ast2600.c
index 7084f2297a07..ca4ed892e4a5 100644
--- a/drivers/i2c/busses/i2c-ast2600.c
+++ b/drivers/i2c/busses/i2c-ast2600.c
@@ -270,6 +270,15 @@ struct ast2600_i2c_bus {
 	/* Buffer mode */
 	void __iomem		*buf_base;
 	struct i2c_smbus_alert_setup	alert_data;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* Slave structure */
+	int			slave_operate;
+	int			slave_xfer_len;
+	int			slave_xfer_cnt;
+	unsigned char	*slave_dma_buf;
+	dma_addr_t		slave_dma_addr;
+	struct i2c_client	*slave;
+#endif
 };
 
 static u32 ast2600_select_i2c_clock(struct ast2600_i2c_bus *i2c_bus)
@@ -361,6 +370,388 @@ static u8 ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void ast2600_i2c_slave_packet_dma_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	int slave_rx_len;
+	u32 cmd = 0;
+	u8 value;
+	int i;
+
+	sts &= ~(AST2600_I2CS_SLAVE_PENDING);
+	/* Handle i2c slave timeout condition */
+	if (AST2600_I2CS_INACTIVE_TO & sts) {
+		cmd = SLAVE_TRIGGER_CMD;
+		cmd |= AST2600_I2CS_RX_DMA_EN;
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		return;
+	}
+
+	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
+
+	switch (sts) {
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_RX_DMA:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		slave_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
+						      AST2600_I2CS_DMA_LEN_STS));
+		for (i = 0; i < slave_rx_len; i++) {
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+					&i2c_bus->slave_dma_buf[i]);
+		}
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
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
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+		slave_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
+						      AST2600_I2CS_DMA_LEN_STS));
+		for (i = 0; i < slave_rx_len; i++) {
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+					&i2c_bus->slave_dma_buf[i]);
+		}
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		if (sts & AST2600_I2CS_STOP)
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+
+	/* it is Mw data Mr coming -> it need send tx */
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
+		/* it should be repeat start read */
+		if (sts & AST2600_I2CS_SLAVE_MATCH)
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+		slave_rx_len = AST2600_I2C_GET_RX_DMA_LEN(readl(i2c_bus->reg_base +
+						      AST2600_I2CS_DMA_LEN_STS));
+		for (i = 0; i < slave_rx_len; i++) {
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED,
+					&i2c_bus->slave_dma_buf[i]);
+		}
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED,
+				&i2c_bus->slave_dma_buf[0]);
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA:
+		/* First Start read */
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED,
+				&i2c_bus->slave_dma_buf[0]);
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_WAIT_TX_DMA:
+		/* it should be next start read */
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_PROCESSED,
+				&i2c_bus->slave_dma_buf[0]);
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
+		/* it just tx complete */
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_DMA_LEN_STS);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+		cmd = 0;
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		break;
+	case AST2600_I2CS_STOP:
+		cmd = 0;
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		break;
+	default:
+		dev_dbg(i2c_bus->dev, "unhandled slave isr case %x, sts %x\n", sts,
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
+static void ast2600_i2c_slave_packet_buff_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	int slave_rx_len = 0;
+	u32 cmd = 0;
+	u8 value;
+	int i;
+
+	/* due to master slave is common buffer, so need force the master stop not issue */
+	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & GENMASK(15, 0)) {
+		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
+		i2c_bus->cmd_err = -EBUSY;
+		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		complete(&i2c_bus->cmd_complete);
+	}
+
+	/* Handle i2c slave timeout condition */
+	if (AST2600_I2CS_INACTIVE_TO & sts) {
+		writel(SLAVE_TRIGGER_CMD, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_ISR);
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		i2c_bus->slave_operate = 0;
+		return;
+	}
+
+	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
+
+	if (sts & AST2600_I2CS_SLAVE_MATCH)
+		i2c_bus->slave_operate = 1;
+
+	switch (sts) {
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
+		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_SLAVE_PENDING |
+		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+	case AST2600_I2CS_SLAVE_PENDING |
+		 AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_STOP:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		fallthrough;
+	case AST2600_I2CS_SLAVE_PENDING |
+		 AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_SLAVE_MATCH:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		cmd = SLAVE_TRIGGER_CMD;
+		if (sts & AST2600_I2CS_RX_DONE) {
+			slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+							       AST2600_I2CC_BUFF_CTRL));
+			for (i = 0; i < slave_rx_len; i++) {
+				value = readb(i2c_bus->buf_base + 0x10 + i);
+				i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+			}
+		}
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) & AST2600_I2CS_RX_BUFF_EN)
+			cmd = 0;
+		else
+			cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
+
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		break;
+	case AST2600_I2CS_WAIT_RX_DMA | AST2600_I2CS_RX_DONE:
+		cmd = SLAVE_TRIGGER_CMD;
+		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+						       AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < slave_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		cmd |= AST2600_I2CS_RX_BUFF_EN;
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		break;
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_WAIT_RX_DMA |
+				AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		cmd = SLAVE_TRIGGER_CMD;
+		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < slave_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		cmd |= AST2600_I2CS_RX_BUFF_EN;
+		writel(AST2600_I2CC_SET_RX_BUF_LEN(i2c_bus->buf_size),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		break;
+	case AST2600_I2CS_SLAVE_PENDING | AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		cmd = SLAVE_TRIGGER_CMD;
+		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < slave_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		/* workaround for avoid next start with len != 0 */
+		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		break;
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_STOP:
+		cmd = SLAVE_TRIGGER_CMD;
+		slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+								 AST2600_I2CC_BUFF_CTRL));
+		for (i = 0; i < slave_rx_len; i++) {
+			value = readb(i2c_bus->buf_base + 0x10 + i);
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+		}
+		/* workaround for avoid next start with len != 0 */
+		writel(BIT(0), i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		break;
+	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_SLAVE_MATCH:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		writeb(value, i2c_bus->buf_base);
+		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_TX_DMA | AST2600_I2CS_RX_DONE:
+	case AST2600_I2CS_WAIT_TX_DMA:
+		if (sts & AST2600_I2CS_SLAVE_MATCH)
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+
+		if (sts & AST2600_I2CS_RX_DONE) {
+			slave_rx_len = AST2600_I2CC_GET_RX_BUF_LEN(readl(i2c_bus->reg_base +
+							AST2600_I2CC_BUFF_CTRL));
+			for (i = 0; i < slave_rx_len; i++) {
+				value = readb(i2c_bus->buf_base + 0x10 + i);
+				i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+			}
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
+		} else {
+			i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
+		}
+		writeb(value, i2c_bus->buf_base);
+		writel(AST2600_I2CC_SET_TX_BUF_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_TX_BUFF_EN;
+		break;
+	/* workaround : trigger the cmd twice to fix next state keep 1000000 */
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		cmd = SLAVE_TRIGGER_CMD | AST2600_I2CS_RX_BUFF_EN;
+		writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		break;
+
+	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
+	case AST2600_I2CS_STOP:
+		cmd = SLAVE_TRIGGER_CMD;
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
+		break;
+	default:
+		dev_dbg(i2c_bus->dev, "unhandled slave isr case %x, sts %x\n", sts,
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
+		i2c_bus->slave_operate = 0;
+}
+
+static void ast2600_i2c_slave_byte_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	u32 i2c_buff = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+	u32 cmd = AST2600_I2CS_ACTIVE_ALL;
+	u8 byte_data;
+	u8 value;
+
+	switch (sts) {
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+		/* first address match is address */
+		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
+		break;
+	case AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_RX_DMA:
+		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_WRITE_RECEIVED, &byte_data);
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE | AST2600_I2CS_WAIT_TX_DMA:
+		cmd |= AST2600_I2CS_TX_CMD;
+		byte_data = AST2600_I2CC_GET_RX_BUFF(i2c_buff);
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_REQUESTED, &byte_data);
+		writel(byte_data, i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+		break;
+	case AST2600_I2CS_TX_ACK | AST2600_I2CS_WAIT_TX_DMA:
+		cmd |= AST2600_I2CS_TX_CMD;
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_READ_PROCESSED, &byte_data);
+		writel(byte_data, i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+		break;
+	case AST2600_I2CS_STOP:
+	case AST2600_I2CS_STOP | AST2600_I2CS_TX_NAK:
+		i2c_slave_event(i2c_bus->slave, I2C_SLAVE_STOP, &value);
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
+static int ast2600_i2c_slave_irq(struct ast2600_i2c_bus *i2c_bus)
+{
+	u32 ier = readl(i2c_bus->reg_base + AST2600_I2CS_IER);
+	u32 isr = readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
+
+	if (!(isr & ier))
+		return 0;
+
+	/*
+	 * Slave interrupt coming after Master package done
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
+			ast2600_i2c_slave_packet_dma_irq(i2c_bus, isr);
+		else
+			ast2600_i2c_slave_packet_buff_irq(i2c_bus, isr);
+	} else {
+		ast2600_i2c_slave_byte_irq(i2c_bus, isr);
+	}
+
+	return 1;
+}
+#endif
+
 static int ast2600_i2c_setup_dma_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
 {
 	struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
@@ -682,6 +1073,20 @@ static void ast2600_i2c_master_package_irq(struct ast2600_i2c_bus *i2c_bus, u32
 		}
 		break;
 	case AST2600_I2CM_RX_DONE:
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/*
+		 * Workaround for master/slave package mode enable rx done stuck issue
+		 * When master go for first read (RX_DONE), slave mode will also effect
+		 * Then controller will send nack, not operate anymore.
+		 */
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS) & AST2600_I2CS_PKT_MODE_EN) {
+			u32 slave_cmd = readl(i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+
+			writel(0, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+			writel(slave_cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		}
+		fallthrough;
+#endif
 	case AST2600_I2CM_RX_DONE | AST2600_I2CM_NORMAL_STOP:
 		/* do next rx */
 		if (i2c_bus->mode == DMA_MODE) {
@@ -810,6 +1215,12 @@ static irqreturn_t ast2600_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct ast2600_i2c_bus *i2c_bus = dev_id;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL) & AST2600_I2CC_SLAVE_EN) {
+		if (ast2600_i2c_slave_irq(i2c_bus))
+			return IRQ_HANDLED;
+	}
+#endif
 	return IRQ_RETVAL(ast2600_i2c_master_irq(i2c_bus));
 }
 
@@ -827,12 +1238,30 @@ static int ast2600_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msg
 			return ret;
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (i2c_bus->mode == BUFF_MODE) {
+		if (i2c_bus->slave_operate)
+			return -EBUSY;
+		/* disable slave isr */
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) || i2c_bus->slave_operate) {
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
+	/* avoid race condication slave is wait and master wait 1st slave operate */
+	if (i2c_bus->mode == BUFF_MODE)
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+#endif
 	if (ret)
 		goto master_out;
 	timeout = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
@@ -844,7 +1273,26 @@ static int ast2600_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msg
 			readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF));
 		writel(0, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
 		writel(ctrl, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		if (ctrl & AST2600_I2CC_SLAVE_EN) {
+			u32 cmd = SLAVE_TRIGGER_CMD;
 
+			if (i2c_bus->mode == DMA_MODE) {
+				cmd |= AST2600_I2CS_RX_DMA_EN;
+				writel(i2c_bus->slave_dma_addr,
+				       i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
+				writel(i2c_bus->slave_dma_addr,
+				       i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
+				writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+				       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+			} else if (i2c_bus->mode == BUFF_MODE) {
+				cmd = SLAVE_TRIGGER_CMD;
+			} else {
+				cmd &= ~AST2600_I2CS_PKT_MODE_EN;
+			}
+			writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		}
+#endif
 		if (i2c_bus->multi_master &&
 		    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
 		    AST2600_I2CC_BUS_BUSY_STS))
@@ -888,7 +1336,80 @@ static void ast2600_i2c_init(struct ast2600_i2c_bus *i2c_bus)
 
 	/* Clear Interrupt */
 	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CM_ISR);
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* for memory buffer initial */
+	if (i2c_bus->mode == DMA_MODE) {
+		i2c_bus->slave_dma_buf =
+			dmam_alloc_coherent(i2c_bus->dev, I2C_SLAVE_MSG_BUF_SIZE,
+					    &i2c_bus->slave_dma_addr, GFP_KERNEL);
+		if (!i2c_bus->slave_dma_buf)
+			return;
+	}
+
+	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CS_ISR);
+
+	if (i2c_bus->mode == BYTE_MODE) {
+		writel(GENMASK(15, 0), i2c_bus->reg_base + AST2600_I2CS_IER);
+	} else {
+		/* Set interrupt generation of I2C slave controller */
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+	}
+#endif
+}
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int ast2600_i2c_reg_slave(struct i2c_client *client)
+{
+	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(client->adapter);
+	u32 cmd = SLAVE_TRIGGER_CMD;
+
+	if (i2c_bus->slave)
+		return -EINVAL;
+
+	dev_dbg(i2c_bus->dev, "slave addr %x\n", client->addr);
+
+	writel(0, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+	writel(AST2600_I2CC_SLAVE_EN | readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL),
+	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+
+	/* trigger rx buffer */
+	if (i2c_bus->mode == DMA_MODE) {
+		cmd |= AST2600_I2CS_RX_DMA_EN;
+		writel(i2c_bus->slave_dma_addr, i2c_bus->reg_base + AST2600_I2CS_RX_DMA);
+		writel(i2c_bus->slave_dma_addr, i2c_bus->reg_base + AST2600_I2CS_TX_DMA);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_SLAVE_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+	} else if (i2c_bus->mode == BUFF_MODE) {
+		cmd = SLAVE_TRIGGER_CMD;
+	} else {
+		cmd &= ~AST2600_I2CS_PKT_MODE_EN;
+	}
+
+	writel(cmd, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+	i2c_bus->slave = client;
+	/* Set slave addr. */
+	writel(client->addr | AST2600_I2CS_ADDR1_ENABLE,
+	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+
+	return 0;
+}
+
+static int ast2600_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct ast2600_i2c_bus *i2c_bus = i2c_get_adapdata(slave->adapter);
+
+	/* Turn off slave mode. */
+	writel(~AST2600_I2CC_SLAVE_EN & readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL),
+	       i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+	writel(readl(i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL) & ~AST2600_I2CS_ADDR1_MASK,
+	       i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+
+	i2c_bus->slave = NULL;
+
+	return 0;
 }
+#endif
 
 static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
 {
@@ -898,6 +1419,10 @@ static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
 static const struct i2c_algorithm i2c_ast2600_algorithm = {
 	.master_xfer = ast2600_i2c_master_xfer,
 	.functionality = ast2600_i2c_functionality,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = ast2600_i2c_reg_slave,
+	.unreg_slave = ast2600_i2c_unreg_slave,
+#endif
 };
 
 static int ast2600_i2c_probe(struct platform_device *pdev)
@@ -933,6 +1458,9 @@ static int ast2600_i2c_probe(struct platform_device *pdev)
 		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DIV_CTRL);
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	i2c_bus->slave_operate = 0;
+#endif
 	i2c_bus->dev = dev;
 	i2c_bus->mode = BUFF_MODE;
 
-- 
2.34.1

