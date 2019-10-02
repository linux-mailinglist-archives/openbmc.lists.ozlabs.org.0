Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 989D3C87F7
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:08:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jvzw5yfLzDqXK
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:08:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 307 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Oct 2019 16:18:14 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jmCq5VwZzDqQh;
 Wed,  2 Oct 2019 16:18:14 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id x925vD0s005819;
 Wed, 2 Oct 2019 13:57:13 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x925uGgu005678;
 Wed, 2 Oct 2019 13:56:16 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 2 Oct
 2019 14:12:13 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <jae.hyun.yoo@linux.intel.com>
Subject: [PATCH 1/2] peci: aspeed: Add AST2600 compatible string
Date: Wed, 2 Oct 2019 14:11:59 +0800
Message-ID: <20191002061200.29888-2-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX01.aspeed.com (192.168.0.23) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x925uGgu005678
X-Mailman-Approved-At: Wed, 02 Oct 2019 22:06:34 +1000
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jason.m.bills@linux.intel.com, chiawei_wang@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2600 SoC contains the same register set as AST25xx.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/peci/peci-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/peci/peci-aspeed.c b/drivers/peci/peci-aspeed.c
index 51cb2563ceb6..4eed119dc83b 100644
--- a/drivers/peci/peci-aspeed.c
+++ b/drivers/peci/peci-aspeed.c
@@ -485,6 +485,7 @@ static int aspeed_peci_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_peci_of_table[] = {
 	{ .compatible = "aspeed,ast2400-peci", },
 	{ .compatible = "aspeed,ast2500-peci", },
+	{ .compatible = "aspeed,ast2600-peci", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_peci_of_table);
-- 
2.17.1

