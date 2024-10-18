Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A679A3387
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 05:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XV9h823Mjz3cRP
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 14:50:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729223397;
	cv=none; b=kdyAfTGE585bPecvOfsyYqqAPgg7B5AafXCczfW0prP1ZF8FPxgxn+v3MTlsl/OaUN12BN/rhnj2Vq03Q549Qj8pRcA1AnlT+9y5SSNV1Xw05haBXzJ0NmQiKBdD9Rh+shz+sPU/LxIqXDVONAFPOJ0bC0RaHfuMyGAutGOAfQPgX2TCf4DXldiEGo28C9VJF1bLdoN7gmImDI1HH0tmotFquAN9dbrVhv95zjrNIeP5x5De4hBc6YcILies8j1hJjRj4B4CxEVN+hohEBm89iQ2BN/M4/oW0ZWEUwJP0CsNL6YJrxCmkko0foxBAwSZkYsbgVR5XsHbSqTKwSW9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729223397; c=relaxed/relaxed;
	bh=5GGhcXJb1lkCLyBtVHLgT6oBHiWzH5A0kRdwe2dPkh8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KZDG2Odh7LkvkEruYRFwC+iwYJ1gR+iwT+7QCX005DermSP7TTvHN6J0H6z6IzJIM3fivOUmMW9DuqVwLldk90Z3c2L/q+iuBwtfClNMFt9k5CvWXQ1xSpJOXLCLTEzZNt3r+udqAyeibKQyst9pZqCo4cDKDpjyI1qguverWJ6tpafsFaSf2k/n1NOMZy+VBOgDkr3XiDBSOqhrTVCTO1zehPujFFuYu4YDnSkt+W4o5heib1Sv60U79X8ttVZe1duE0ow2e59+kHOC7eZFKcJNApm7o6v+iHLxCG5siRh3P48IiO6wHcDoZzalsuJjL3Tj0bijEqqrYFBM/bXTHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (unknown [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XV9h33DGGz2yLB;
	Fri, 18 Oct 2024 14:49:45 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 18 Oct
 2024 11:49:19 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 18 Oct 2024 11:49:19 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: <brendanhiggins@google.com>, <benh@kernel.crashing.org>, <joel@jms.id.au>,
	<andi.shyti@kernel.org>
Subject: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Date: Fri, 18 Oct 2024 11:49:19 +0800
Message-ID: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the original code, the device reset would not be triggered
when the driver is set to multi-master and bus is free.
It needs to be considered with multi-master condition.

Fixes: <f327c686d3ba> ("i2c: aspeed: Reset the i2c controller when timeout occurs")

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index cc5a26637fd5..7639ae3ace67 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -716,14 +716,15 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 	if (time_left == 0) {
 		/*
 		 * In a multi-master setup, if a timeout occurs, attempt
-		 * recovery. But if the bus is idle, we still need to reset the
-		 * i2c controller to clear the remaining interrupts.
+		 * recovery device. But if the bus is idle,
+		 * we still need to reset the i2c controller to clear
+		 * the remaining interrupts or reset device abnormal condition.
 		 */
-		if (bus->multi_master &&
-		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
-		     ASPEED_I2CD_BUS_BUSY_STS))
-			aspeed_i2c_recover_bus(bus);
-		else
+		if ((readl(bus->base + ASPEED_I2C_CMD_REG) &
+			ASPEED_I2CD_BUS_BUSY_STS)){
+			if (bus->multi_master)
+				aspeed_i2c_recover_bus(bus);
+		} else
 			aspeed_i2c_reset(bus);
 
 		/*
-- 
2.25.1

