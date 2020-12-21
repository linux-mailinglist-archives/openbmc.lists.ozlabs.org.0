Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB322DF90C
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 06:59:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czpgk1HTwzDqLd
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 16:58:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czpfg3Z3vzDqKw;
 Mon, 21 Dec 2020 16:57:58 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0BL5qWvD013664;
 Mon, 21 Dec 2020 13:52:36 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Dec 2020 13:56:09 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linus.walleij@linaro.org>, <minyard@acm.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH v3 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
Date: Mon, 21 Dec 2020 13:56:21 +0800
Message-ID: <20201221055623.31463-4-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201221055623.31463-1-chiawei_wang@aspeedtech.com>
References: <20201221055623.31463-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BL5qWvD013664
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
Cc: BMC-SW@aspeedtech.com, cyrilbur@gmail.com, haiyue.wang@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add check against LPC device v2 compatible string to
ensure that the fixed device tree layout is adopted.
The LPC register offsets are also fixed accordingly.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 35 ++++++++++++++++++------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a140203c079b..6283bfef4ea7 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -27,7 +27,6 @@
 
 #define KCS_CHANNEL_MAX     4
 
-/* mapped to lpc-bmc@0 IO space */
 #define LPC_HICR0            0x000
 #define     LPC_HICR0_LPC3E          BIT(7)
 #define     LPC_HICR0_LPC2E          BIT(6)
@@ -52,15 +51,13 @@
 #define LPC_STR1             0x03C
 #define LPC_STR2             0x040
 #define LPC_STR3             0x044
-
-/* mapped to lpc-host@80 IO space */
-#define LPC_HICRB            0x080
+#define LPC_HICRB            0x100
 #define     LPC_HICRB_IBFIF4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
-#define LPC_LADR4            0x090
-#define LPC_IDR4             0x094
-#define LPC_ODR4             0x098
-#define LPC_STR4             0x09C
+#define LPC_LADR4            0x110
+#define LPC_IDR4             0x114
+#define LPC_ODR4             0x118
+#define LPC_STR4             0x11C
 
 struct aspeed_kcs_bmc {
 	struct regmap *map;
@@ -345,15 +342,25 @@ static int aspeed_kcs_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct kcs_bmc *kcs_bmc;
-	struct device_node *np;
+	struct device_node *kcs_np;
+	struct device_node *lpc_np;
 	int rc;
 
-	np = pdev->dev.of_node;
-	if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc") ||
-			of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc"))
+	kcs_np = dev->of_node;
+	lpc_np = kcs_np->parent;
+
+	if (!of_device_is_compatible(lpc_np, "aspeed,ast2400-lpc-v2") &&
+	    !of_device_is_compatible(lpc_np, "aspeed,ast2500-lpc-v2") &&
+	    !of_device_is_compatible(lpc_np, "aspeed,ast2600-lpc-v2")) {
+		dev_err(dev, "unsupported LPC device binding\n");
+		return -ENODEV;
+	}
+
+	if (of_device_is_compatible(kcs_np, "aspeed,ast2400-kcs-bmc") ||
+			of_device_is_compatible(kcs_np, "aspeed,ast2500-kcs-bmc"))
 		kcs_bmc = aspeed_kcs_probe_of_v1(pdev);
-	else if (of_device_is_compatible(np, "aspeed,ast2400-kcs-bmc-v2") ||
-			of_device_is_compatible(np, "aspeed,ast2500-kcs-bmc-v2"))
+	else if (of_device_is_compatible(kcs_np, "aspeed,ast2400-kcs-bmc-v2") ||
+			of_device_is_compatible(kcs_np, "aspeed,ast2500-kcs-bmc-v2"))
 		kcs_bmc = aspeed_kcs_probe_of_v2(pdev);
 	else
 		return -EINVAL;
-- 
2.17.1

