Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF85BD9D0
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 04:04:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlGz4Z5Bz3bSW
	for <lists+openbmc@lfdr.de>; Tue, 20 Sep 2022 12:04:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWlGd1Mkbz2xgN;
	Tue, 20 Sep 2022 12:04:23 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 28K1gpFj087853;
	Tue, 20 Sep 2022 09:42:51 +0800 (GMT-8)
	(envelope-from chiawei_wang@aspeedtech.com)
Received: from Chiawei-PC03.aspeed.com (192.168.2.66) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Sep
 2022 10:03:36 +0800
From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
To: <minyard@acm.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <openipmi-developer@lists.sourceforge.net>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
Subject: [PATCH] ipmi: kcs: aspeed: Update port address comments
Date: Tue, 20 Sep 2022 10:03:33 +0800
Message-ID: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.66]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28K1gpFj087853
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

Remove AST_usrGuide_KCS.pdf as it is no longer maintained.

Add more descriptions as the driver now supports the I/O
address configurations for both the KCS Data and Cmd/Status
interface registers.

Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index cdc88cde1e9a..19c32bf50e0e 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -207,17 +207,24 @@ static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask,
 }
 
 /*
- * AST_usrGuide_KCS.pdf
- * 2. Background:
- *   we note D for Data, and C for Cmd/Status, default rules are
- *     A. KCS1 / KCS2 ( D / C:X / X+4 )
- *        D / C : CA0h / CA4h
- *        D / C : CA8h / CACh
- *     B. KCS3 ( D / C:XX2h / XX3h )
- *        D / C : CA2h / CA3h
- *        D / C : CB2h / CB3h
- *     C. KCS4
- *        D / C : CA4h / CA5h
+ * We note D for Data, and C for Cmd/Status, default rules are
+ *
+ * 1. Only the D address is given:
+ *   A. KCS1/KCS2 (D/C: X/X+4)
+ *      D/C: CA0h/CA4h
+ *      D/C: CA8h/CACh
+ *   B. KCS3 (D/C: XX2/XX3h)
+ *      D/C: CA2h/CA3h
+ *   C. KCS4 (D/C: X/X+1)
+ *      D/C: CA4h/CA5h
+ *
+ * 2. Both the D/C addresses are given:
+ *   A. KCS1/KCS2/KCS4 (D/C: X/Y)
+ *      D/C: CA0h/CA1h
+ *      D/C: CA8h/CA9h
+ *      D/C: CA4h/CA5h
+ *   B. KCS3 (D/C: XX2/XX3h)
+ *      D/C: CA2h/CA3h
  */
 static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2], int nr_addrs)
 {
-- 
2.25.1

