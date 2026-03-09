Return-Path: <openbmc+bounces-1454-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHlEJ9NurmnCEAIAu9opvQ
	(envelope-from <openbmc+bounces-1454-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 09 Mar 2026 07:55:15 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47E234805
	for <lists+openbmc@lfdr.de>; Mon, 09 Mar 2026 07:55:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTnml2F6Lz3cDT;
	Mon, 09 Mar 2026 17:54:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773039255;
	cv=none; b=VyJ2KwLpw8kjSdPSPzwbnOYNnPWMivLjptp7Too83XkVrqjmiye89/7jDE5HOsCcBp0wACHh9Y2mKogZ2SXLIV6YTECazsqpbgMLADmIUiK5nH87jtSGgtybGBH/iwSoL+B9IsDGlsScgoh6fsNMO+5pfi8i5MJtUD9QquoTHGKcr8NhXDAIqxoihqJjT6uNTwnubcojz2MfdRiwBu2JhfD34yInCNuv6h7HT6E+x6PjMjFBKlTGysDlwLGZVq0D0jjrZ17Yomlwv5Om+LEV0QtwUTiHpWgTPY0oYQANhkkin7XKl7vWme8Jb/xd0UcMJOATfsWZ4rQ6Hgu6qdGpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773039255; c=relaxed/relaxed;
	bh=2XsfIEruXBf9swYqJu0f+W7tZ9qG9ctQ7TwzSzZu3vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SBs66AYtHd40IITiQcGTLhMUky+c54TATvxBj2OOihHGdZwYjJ2i6Z1DnxS+3OS5rOiVxfo4U93IZicbia533ZPl/EFTZpHRNBf/m1HCgBJKm1/0GMyi9x3IgL6BfCm8RjvD9wFMjIyzp+MH16VI9v8XqkhDkQM+InPWP+eeB3fI6Xla17RNFdHzd/rEKdWWl6xrO/1rHZIF7jI2vDsBy2wIjLie0vn595qbSSPW8kPxd6A94FhCkcu34sNqrqL3L2IH3Ts6a+WRNaf0S+jBK5y/Kis662q0KfqO3P2oy2fpNyTRMGgUxHffB6JLykLNKVdR5N2hiVbcdYGr9bSc6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=ryan_chen@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTnmk2JSRz3cCr;
	Mon, 09 Mar 2026 17:54:14 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 9 Mar
 2026 14:53:53 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 9 Mar 2026 14:53:53 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Mon, 9 Mar 2026 14:53:55 +0800
Subject: [PATCH v26 4/4] i2c: ast2600: Add target mode support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260309-upstream_i2c-v26-4-5fedcff8ffe8@aspeedtech.com>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
In-Reply-To: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
To: <jk@codeconstruct.com.au>, <andriy.shevchenko@linux.intel.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Rayn Chen
	<rayn_chen@aspeedtech.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Ryan Chen
	<ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773039232; l=26291;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=9OiffUXbJl1OcICMg8+Vhl1Wsf64ZZwoUtrHAb3DW7g=;
 b=KJ4bWa3uhDoPQF3Yn6FmeIYCWI235RI2hzgVoK2VcTTYcpFR7RY+GlcXHxXwaFnIZkC3tFc0Z
 MwgPZd/zErVCP3gK3UUVw6Eq/u/CnkYmgMOpgmg2o/46qnIrPrJkJFh
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: EA47E234805
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,aspeedtech.com:mid,aspeedtech.com:email];
	FROM_NEQ_ENVFROM(0.00)[ryan_chen@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1454-lists,openbmc=lfdr.de];
	NEURAL_HAM(-0.00)[-0.054];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Action: no action

Add target mode support to the AST2600 I2C driver.

Target mode features implemented include:
- Add target interrupt handling
- Address match and response logic
- Separate Tx/Rx DMA address and length configuration

This complements the existing controller-mode support, enabling
dual-role capability.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Changes in v26:
- change int to bool target_operate
- rename target_operate to target_active
- use i2c_bus->target replace require IO
- use WRITE_ONCE replace target_operate write.
---
 drivers/i2c/busses/i2c-ast2600.c | 565 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 564 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-ast2600.c
index c3e4abb426e2..5cb8bedbaad9 100644
--- a/drivers/i2c/busses/i2c-ast2600.c
+++ b/drivers/i2c/busses/i2c-ast2600.c
@@ -273,6 +273,13 @@ struct ast2600_i2c_bus {
 	void __iomem		*buf_base;
 	int (*setup_tx)(u32 cmd, struct ast2600_i2c_bus *i2c_bus);
 	int (*setup_rx)(u32 cmd, struct ast2600_i2c_bus *i2c_bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* target structure */
+	bool			target_active;
+	unsigned char	*target_dma_buf;
+	dma_addr_t		target_dma_addr;
+	struct i2c_client	*target;
+#endif
 };
 
 static void ast2600_i2c_ac_timing_config(struct ast2600_i2c_bus *i2c_bus)
@@ -356,6 +363,440 @@ static int ast2600_i2c_recover_bus(struct ast2600_i2c_bus *i2c_bus)
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
+	if (sts & AST2600_I2CS_INACTIVE_TO) {
+		/* Reset timeout counter */
+		u32 ac_timing = readl(i2c_bus->reg_base + AST2600_I2CC_AC_TIMING) &
+				AST2600_I2CC_AC_TIMING_MASK;
+
+		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
+		ac_timing |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
+		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
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
+		writel(AST2600_I2CS_SET_TX_DMA_LEN(1),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_TX_DMA_EN;
+		break;
+	case AST2600_I2CS_TX_NAK | AST2600_I2CS_STOP:
+		/* it just tx complete */
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		writel(AST2600_I2CS_SET_RX_DMA_LEN(I2C_TARGET_MSG_BUF_SIZE),
+		       i2c_bus->reg_base + AST2600_I2CS_DMA_LEN);
+		cmd = TARGET_TRIGGER_CMD | AST2600_I2CS_RX_DMA_EN;
+		break;
+	case AST2600_I2CS_SLAVE_MATCH | AST2600_I2CS_RX_DONE:
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_WRITE_REQUESTED, &value);
+		break;
+	case AST2600_I2CS_STOP:
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
+		WRITE_ONCE(i2c_bus->target_active, false);
+		return;
+	}
+
+	sts &= ~(AST2600_I2CS_PKT_DONE | AST2600_I2CS_PKT_ERROR);
+
+	if (sts & AST2600_I2CS_SLAVE_MATCH)
+		WRITE_ONCE(i2c_bus->target_active, true);
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
+		WRITE_ONCE(i2c_bus->target_active, false);
+}
+
+static void ast2600_i2c_target_byte_irq(struct ast2600_i2c_bus *i2c_bus, u32 sts)
+{
+	u32 i2c_buff = readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF);
+	u32 cmd = AST2600_I2CS_ACTIVE_ALL;
+	u8 byte_data;
+	u8 value;
+
+	/* Handle i2c target timeout condition */
+	if (sts & AST2600_I2CS_INACTIVE_TO) {
+		/* Reset timeout counter */
+		u32 ac_timing = readl(i2c_bus->reg_base + AST2600_I2CC_AC_TIMING) &
+				AST2600_I2CC_AC_TIMING_MASK;
+
+		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
+		ac_timing |= AST2600_I2CC_TTIMEOUT(i2c_bus->timeout);
+		writel(ac_timing, i2c_bus->reg_base + AST2600_I2CC_AC_TIMING);
+		writel(AST2600_I2CS_ACTIVE_ALL, i2c_bus->reg_base + AST2600_I2CS_CMD_STS);
+		writel(sts, i2c_bus->reg_base + AST2600_I2CS_ISR);
+		readl(i2c_bus->reg_base + AST2600_I2CS_ISR);
+		i2c_slave_event(i2c_bus->target, I2C_SLAVE_STOP, &value);
+		WRITE_ONCE(i2c_bus->target_active, false);
+		return;
+	}
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
+	 * Target interrupt coming after controller packet done
+	 * So need handle controller first.
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
@@ -627,6 +1068,20 @@ static void ast2600_i2c_controller_packet_irq(struct ast2600_i2c_bus *i2c_bus, u
 		}
 		break;
 	case AST2600_I2CM_RX_DONE:
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/*
+		 * Workaround for controller/target packet mode enable rx done stuck issue
+		 * When controller go for first read (RX_DONE), target mode will also effect
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
@@ -725,6 +1180,12 @@ static irqreturn_t ast2600_i2c_bus_irq(int irq, void *dev_id)
 {
 	struct ast2600_i2c_bus *i2c_bus = dev_id;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (i2c_bus->target) {
+		if (ast2600_i2c_target_irq(i2c_bus))
+			return IRQ_HANDLED;
+	}
+#endif
 	return IRQ_RETVAL(ast2600_i2c_controller_irq(i2c_bus));
 }
 
@@ -741,12 +1202,35 @@ static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct i2c_msg
 			return ret;
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (i2c_bus->mode == BUFF_MODE) {
+		if (i2c_bus->target_active)
+			return -EBUSY;
+		/**
+		 * In BUFF_MODE, controller and target share the same buffer register,
+		 * A target transaction can update buffer state asynchronously via IRQ,
+		 * so block controller transfers while target is active, otherwise we can
+		 * corrupt buffer.
+		 */
+		writel(0, i2c_bus->reg_base + AST2600_I2CS_IER);
+		if (readl(i2c_bus->reg_base + AST2600_I2CS_ISR) || i2c_bus->target_active) {
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
+	/* avoid race condication target is wait and controller wait 1st target operate */
+	if (i2c_bus->mode == BUFF_MODE)
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+#endif
 	if (ret)
 		goto controller_out;
 	timeout = wait_for_completion_timeout(&i2c_bus->cmd_complete, i2c_bus->adap.timeout);
@@ -764,7 +1248,7 @@ static int ast2600_i2c_controller_xfer(struct i2c_adapter *adap, struct i2c_msg
 		 * a master timeout. In multi-master mode, attempt bus recovery
 		 * if the bus is still busy.
 		 */
-		if (i2c_bus->multi_master &&
+		if (i2c_bus->multi_master && !i2c_bus->target_active &&
 		    (readl(i2c_bus->reg_base + AST2600_I2CC_STS_AND_BUFF) &
 		    AST2600_I2CC_BUS_BUSY_STS))
 			ast2600_i2c_recover_bus(i2c_bus);
@@ -812,8 +1296,80 @@ static int ast2600_i2c_init(struct ast2600_i2c_bus *i2c_bus)
 	/* Clear Interrupt */
 	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CM_ISR);
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* for memory buffer initial */
+	if (i2c_bus->mode == DMA_MODE) {
+		i2c_bus->target_dma_buf =
+			dmam_alloc_coherent(i2c_bus->dev, I2C_TARGET_MSG_BUF_SIZE,
+					    &i2c_bus->target_dma_addr, GFP_KERNEL);
+		if (!i2c_bus->target_dma_buf)
+			return -ENOMEM;
+	}
+
+	writel(GENMASK(27, 0), i2c_bus->reg_base + AST2600_I2CS_ISR);
+
+	if (i2c_bus->mode == BYTE_MODE)
+		writel(GENMASK(15, 0), i2c_bus->reg_base + AST2600_I2CS_IER);
+	else
+		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
+#endif
+
+	return 0;
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
+	u32 val;
+
+	/* Turn off target mode. */
+	val = readl(i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+	writel(val & ~AST2600_I2CC_SLAVE_EN, i2c_bus->reg_base + AST2600_I2CC_FUN_CTRL);
+	val = readl(i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+	writel(val & ~AST2600_I2CS_ADDR1_MASK, i2c_bus->reg_base + AST2600_I2CS_ADDR_CTRL);
+
+	i2c_bus->target = NULL;
+
 	return 0;
 }
+#endif
 
 static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
 {
@@ -823,6 +1379,10 @@ static u32 ast2600_i2c_functionality(struct i2c_adapter *adap)
 static const struct i2c_algorithm i2c_ast2600_algorithm = {
 	.xfer = ast2600_i2c_controller_xfer,
 	.functionality = ast2600_i2c_functionality,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_target = ast2600_i2c_reg_target,
+	.unreg_target = ast2600_i2c_unreg_target,
+#endif
 };
 
 static int ast2600_i2c_probe(struct platform_device *pdev)
@@ -861,6 +1421,9 @@ static int ast2600_i2c_probe(struct platform_device *pdev)
 		regmap_write(i2c_bus->global_regs, AST2600_I2CG_CLK_DIV_CTRL, I2CCG_DIV_CTRL);
 	}
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	WRITE_ONCE(i2c_bus->target_active, false);
+#endif
 	i2c_bus->dev = dev;
 	i2c_bus->multi_master = device_property_read_bool(dev, "multi-master");
 	i2c_bus->mode = BUFF_MODE;

-- 
2.34.1


