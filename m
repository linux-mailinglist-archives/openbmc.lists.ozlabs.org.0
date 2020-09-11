Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E33542658A6
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 07:18:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnkYx2Z9NzDqfJ
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 15:18:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 5435 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Sep 2020 15:17:52 AEST
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnkXw6YLRzDqf5;
 Fri, 11 Sep 2020 15:17:52 +1000 (AEST)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 08B3TBUa083957;
 Fri, 11 Sep 2020 11:29:11 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 08B3SNip083856;
 Fri, 11 Sep 2020 11:28:23 +0800 (GMT-8)
 (envelope-from chiawei_wang@aspeedtech.com)
Received: from ChiaWeiWang-PC.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Sep 2020 11:46:33 +0800
From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
To: <robh+dt@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <minyard@acm.org>, <linus.walleij@linaro.org>,
 <haiyue.wang@linux.intel.com>, <cyrilbur@gmail.com>,
 <rlippert@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: [PATCH 3/4] ipmi: kcs: aspeed: Fix LPC register offsets
Date: Fri, 11 Sep 2020 11:46:30 +0800
Message-ID: <20200911034631.8473-4-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
References: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 08B3SNip083856
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
Cc: ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The LPC register offsets are fixed to adapt to the LPC DTS change,
where the LPC partitioning is removed.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index a140203c079b..8843cf867a5d 100644
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
-- 
2.17.1

