Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DCD599904
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 11:49:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8H6P43fNz3drS
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 19:49:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8H673hF4z3cBF;
	Fri, 19 Aug 2022 19:49:32 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 27J9UF08093759;
	Fri, 19 Aug 2022 17:30:15 +0800 (GMT-8)
	(envelope-from chin-ting_kuo@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Aug
 2022 17:49:11 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <BMC-SW@aspeedtech.com>,
        <linux-watchdog@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
        <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <Bonnie_Lo@wiwynn.com>
Subject: [PATCH] watchdog: aspeed_wdt: Reorder output signal register configuration
Date: Fri, 19 Aug 2022 17:49:05 +0800
Message-ID: <20220819094905.1962513-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 27J9UF08093759
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

If the output driving type is push-pull mode, the output
polarity should be selected in advance. Otherwise, an unexpected
value will be output at the moment of changing to push-pull mode.
Thus, output polarity, WDT18[31], must be configured before
changing driving type, WDT18[30].

Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/watchdog/aspeed_wdt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 436571b6fc79..a03e4ff812a2 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -325,18 +325,18 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
 		reg &= config->ext_pulse_width_mask;
-		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
-			reg |= WDT_PUSH_PULL_MAGIC;
+		if (of_property_read_bool(np, "aspeed,ext-active-high"))
+			reg |= WDT_ACTIVE_HIGH_MAGIC;
 		else
-			reg |= WDT_OPEN_DRAIN_MAGIC;
+			reg |= WDT_ACTIVE_LOW_MAGIC;
 
 		writel(reg, wdt->base + WDT_RESET_WIDTH);
 
 		reg &= config->ext_pulse_width_mask;
-		if (of_property_read_bool(np, "aspeed,ext-active-high"))
-			reg |= WDT_ACTIVE_HIGH_MAGIC;
+		if (of_property_read_bool(np, "aspeed,ext-push-pull"))
+			reg |= WDT_PUSH_PULL_MAGIC;
 		else
-			reg |= WDT_ACTIVE_LOW_MAGIC;
+			reg |= WDT_OPEN_DRAIN_MAGIC;
 
 		writel(reg, wdt->base + WDT_RESET_WIDTH);
 	}
-- 
2.25.1

