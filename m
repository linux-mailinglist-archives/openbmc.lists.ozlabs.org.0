Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6C2FC39D
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 23:40:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL3WM4T4zzDqNk
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 09:39:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL3PC5lFwzDqQS
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 09:34:35 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 10JMYJKJ008280;
 Wed, 20 Jan 2021 00:34:19 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 7692263A17; Wed, 20 Jan 2021 00:34:20 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 v1 4/4] watchdog: npcm: Modify get reset status
 function
Date: Wed, 20 Jan 2021 00:34:12 +0200
Message-Id: <20210119223412.223492-5-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210119223412.223492-1-tmaimon77@gmail.com>
References: <20210119223412.223492-1-tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Tomer Maimon <tmaimon77@gmail.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Once the syscon phandle not found the WD reset
status will not supported and return to the
function caller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index a93180d0a6f4..f87cfadd8d9b 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -202,8 +202,10 @@ static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
 	u32 rstval;
 
 	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
-	if (IS_ERR(gcr_regmap))
+	if (IS_ERR(gcr_regmap)) {
 		dev_warn(dev, "Failed to find gcr syscon, WD reset status not supported\n");
+		return;
+	}
 
 	regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
 	if (!rstval) {
-- 
2.22.0

