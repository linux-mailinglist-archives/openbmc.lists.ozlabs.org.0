Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5ADBDE4F
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 14:51:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddGq20PnzDqjh
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 22:51:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.53.149; helo=2.mo2.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 341 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Sep 2019 22:49:29 AEST
Received: from 2.mo2.mail-out.ovh.net (2.mo2.mail-out.ovh.net [188.165.53.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddDT1wjGzDqlF
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:49:25 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.109.143.225])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 731711AE1BC
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:42 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id BA484A33E03B;
 Wed, 25 Sep 2019 12:43:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 09/13] mtd: spi-nor: aspeed: Check for disabled
 segments on the AST2600
Date: Wed, 25 Sep 2019 14:42:35 +0200
Message-Id: <20190925124239.27897-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6989023674974571266
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The segments can be disabled on the AST2600 (zero register value).
CS0 is open by default but not the other CS. This is closing the
access to the flash device in user mode and forbids scanning. For
multiple CS, we will need firmware or a DT property to reopen the
flash AHB window.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index 6c5ecea21882..ea9b4a157677 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -659,8 +659,15 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 	 * size, but take into account the possible overlap with the
 	 * previous segment
 	 */
-	if (!size)
-		size = info->segment_end(controller, seg_oldval) - start;
+	if (!size) {
+		end = info->segment_end(controller, seg_oldval);
+
+		/*
+		 * Check for disabled segment (AST2600).
+		 */
+		if (end != ahb_base_phy)
+			size = end - start;
+	}
 
 	/*
 	 * The segment cannot exceed the maximum window size of the
@@ -689,8 +696,8 @@ static u32 chip_set_segment(struct aspeed_smc_chip *chip, u32 cs, u32 start,
 		size = end - start;
 	}
 
-	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB",
-		 cs, start, end, size >> 20);
+	dev_info(chip->nor.dev, "CE%d window [ 0x%.8x - 0x%.8x ] %dMB%s",
+		 cs, start, end, size >> 20, size ? "" : " (disabled)");
 
 	return size;
 }
-- 
2.21.0

