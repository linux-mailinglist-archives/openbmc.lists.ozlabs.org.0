Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0C3267F24
	for <lists+openbmc@lfdr.de>; Sun, 13 Sep 2020 12:08:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bq4vl36p5zDqfC
	for <lists+openbmc@lfdr.de>; Sun, 13 Sep 2020 20:08:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
X-Greylist: delayed 978 seconds by postgrey-1.36 at bilbo;
 Sun, 13 Sep 2020 20:08:11 AEST
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bq4tz4zwvzDqTP
 for <openbmc@lists.ozlabs.org>; Sun, 13 Sep 2020 20:08:11 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 08D9pYDu001983;
 Sun, 13 Sep 2020 12:51:34 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 85E2C639D3; Sun, 13 Sep 2020 12:51:34 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [dev-5.7 v1 1/4] net: npcm-emc: modify check mac_address function
Date: Sun, 13 Sep 2020 12:51:23 +0300
Message-Id: <20200913095126.119727-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
index 9872da33fa5d..f07449e2f68d 100644
--- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
+++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
@@ -1752,7 +1752,7 @@ static void get_mac_address(struct net_device *dev)
 
 	mac_address = of_get_mac_address(np);
 
-	if (mac_address != 0)
+	if (!IS_ERR(mac_address))
 		ether_addr_copy(dev->dev_addr, mac_address);
 
 	if (is_valid_ether_addr(dev->dev_addr)) {
-- 
2.22.0

