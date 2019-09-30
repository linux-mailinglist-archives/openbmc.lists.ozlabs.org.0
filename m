Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 270EDC1EE0
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 12:24:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hdmc669szDqKw
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2019 20:24:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.47.167; helo=11.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 11.mo5.mail-out.ovh.net (11.mo5.mail-out.ovh.net
 [46.105.47.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hdm43pbhzDqDG
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 20:23:47 +1000 (AEST)
Received: from player779.ha.ovh.net (unknown [10.109.143.183])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D4AED250A0D
 for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2019 12:06:16 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 35FCCA45D73A;
 Mon, 30 Sep 2019 10:06:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/3] mtd: spi-nor: aspeed: Disable zero size segments on the
 AST2600
Date: Mon, 30 Sep 2019 12:05:55 +0200
Message-Id: <20190930100556.26489-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930100556.26489-1-clg@kaod.org>
References: <20190930100556.26489-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15246936541461842690
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

A disabled segment for a CS should have a zero value in its segment
register. The driver was generating an incorrect value which
overlapped with segment CS0. Accesses to the flash were blocked and
Linux hung.

Fixes: 3635b880313a ("mtd: spi-nor: aspeed: add initial support for ast2600")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index ad9e04fdb8ad..ff367c70001d 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -347,8 +347,12 @@ static u32 aspeed_smc_segment_end_ast2600(
 static u32 aspeed_smc_segment_reg_ast2600(
 	struct aspeed_smc_controller *controller, u32 start, u32 end)
 {
-    return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
-	    ((end - 1) & AST2600_SEG_ADDR_MASK);
+	/* disable zero size segments */
+	if (start == end)
+		return 0;
+
+	return ((start & AST2600_SEG_ADDR_MASK) >> 16) |
+		((end - 1) & AST2600_SEG_ADDR_MASK);
 }
 
 /*
-- 
2.21.0

