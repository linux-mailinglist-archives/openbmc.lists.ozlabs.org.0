Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F08D4DABF
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 21:53:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VCDP3y64zDr83
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2019 05:53:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VC7x5qVJzDrJt
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2019 05:49:33 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 12:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,398,1557212400"; d="scan'208";a="154232474"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga008.jf.intel.com with ESMTP; 20 Jun 2019 12:49:29 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 C?ric Le Goater <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [RFC PATCH dev-5.1 3/6] irqchip/aspeed-i2c-ic: add I2C SRAM enabling
 control
Date: Thu, 20 Jun 2019 12:49:19 -0700
Message-Id: <20190620194922.15093-4-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
References: <20190620194922.15093-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds I2C SRAM enabling control for AST2500 SoC to
support buffer mode and DMA mode transfer. The SRAM is enabled by
default in AST2400 SoC.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/irqchip/irq-aspeed-i2c-ic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index f20200af0992..99985b22a9fa 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -18,6 +18,9 @@
 #include <linux/of_irq.h>
 #include <linux/io.h>
 
+/* I2C Global Control Register (AST2500) */
+#define ASPEED_I2C_GLOBAL_CTRL_REG	0xc
+#define  ASPEED_I2C_SRAM_BUFFER_EN	BIT(0)
 
 #define ASPEED_I2C_IC_NUM_BUS 14
 
@@ -100,6 +103,11 @@ static int __init aspeed_i2c_ic_of_init(struct device_node *node,
 	irq_set_chained_handler_and_data(i2c_ic->parent_irq,
 					 aspeed_i2c_ic_irq_handler, i2c_ic);
 
+	/* Enable I2C SRAM buffer in case of AST2500 */
+	if (of_device_is_compatible(node, "aspeed,ast2500-i2c-ic"))
+		writel(ASPEED_I2C_SRAM_BUFFER_EN,
+		       i2c_ic->base + ASPEED_I2C_GLOBAL_CTRL_REG);
+
 	pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_irq);
 
 	return 0;
-- 
2.22.0

