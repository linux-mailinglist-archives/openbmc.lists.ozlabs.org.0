Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ACE2405A4
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 14:14:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQFHy2dXVzDqTM
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 22:14:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=tteq7dhG; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQFGz59bbzDqQt
 for <openbmc@lists.ozlabs.org>; Mon, 10 Aug 2020 22:13:12 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2FD874C89B;
 Mon, 10 Aug 2020 12:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1597061584; x=
 1598875985; bh=bU7ug0SgBjL8PwNbvRh5+PzCf6qzBFDqBsJe4CQmANo=; b=t
 teq7dhGZaK4LFLIWKQK/d0BMVOTHD+8LMuKktdr6Vo89gidQsLtCK7H5ruusODZi
 PPrclEa9HDCI+eZADLA8GyOqFoVh1TOHVJAWhzwRtg7Tce5M0poGGW4hhazqGb6g
 eaOvCqrP3seUQ1MSNRtExaewCOrOabY+jF6iogNsFI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhX7i_ZSLZCg; Mon, 10 Aug 2020 15:13:04 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 05AB14C164;
 Mon, 10 Aug 2020 15:13:04 +0300 (MSK)
Received: from bbwork.com (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Aug 2020 15:13:03 +0300
From: Alexander Filippov <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot v2016.07-aspeed-openbmc] drivers: ftgmac100: use
 hardware MAC by default
Date: Mon, 10 Aug 2020 15:12:20 +0300
Message-ID: <20200810121220.3220-1-a.filippov@yadro.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.14.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alexander Filippov <a.filippov@yadro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

During the network interface initialization in ast_g5_phy based
configurations the original hardware MAC address is ignored and the
actual value is filled with zeros until the appropriate environment
variable is set.
Probably, others PHY-based configurations are also affected.
For example: The MAC addresses specified in command line arguments for
qemu are ignored and all ethernet interfaces have randomly generated MAC
addresses.

This commit makes ftg100 driver to read the hardware MAC address during
device initialization and do not fill it with zeros if the environment
has no definitions for this interface.

Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
---
 drivers/net/ftgmac100.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 5779057ba8..5aaad533e5 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -481,6 +481,23 @@ static void ftgmac100_set_mac(struct eth_device *dev,
 	__raw_writel(laddr, &ftgmac100->mac_ladr);
 }
 
+/*
+ * Get actual MAC address
+ */
+static void ftgmac100_get_hw_mac(struct eth_device *dev)
+{
+	struct ftgmac100 *ftgmac100 = (struct ftgmac100 *)dev->iobase;
+	unsigned int maddr = __raw_readl(&ftgmac100->mac_madr);
+	unsigned int laddr = __raw_readl(&ftgmac100->mac_ladr);
+
+	dev->enetaddr[0] = (maddr >>  8) & 0xFF;
+	dev->enetaddr[1] = (maddr >>  0) & 0xFF;
+	dev->enetaddr[2] = (laddr >> 24) & 0xFF;
+	dev->enetaddr[3] = (laddr >> 16) & 0xFF;
+	dev->enetaddr[4] = (laddr >>  8) & 0xFF;
+	dev->enetaddr[5] = (laddr >>  0) & 0xFF;
+}
+
 static void ftgmac100_set_mac_from_env(struct eth_device *dev)
 {
 #ifdef CONFIG_SYS_I2C_MAC_OFFSET
@@ -513,7 +530,9 @@ static void ftgmac100_set_mac_from_env(struct eth_device *dev)
 
 	ftgmac100_set_mac(dev, dev->enetaddr);
 #else
-	eth_getenv_enetaddr_by_index("eth", dev->index, dev->enetaddr);
+	unsigned char enetaddr[6];
+	if (eth_getenv_enetaddr_by_index("eth", dev->index, enetaddr))
+		memcpy(dev->enetaddr, enetaddr, sizeof(enetaddr));
 //	eth_getenv_enetaddr("ethaddr", dev->enetaddr);
 	ftgmac100_set_mac(dev, dev->enetaddr);
 #endif
@@ -794,6 +813,7 @@ int ftgmac100_initialize(bd_t *bd)
 		ftgmac100_reset(dev);
 
 		/* set the ethernet address */
+		ftgmac100_get_hw_mac(dev);
 		ftgmac100_set_mac_from_env(dev);
 
 		card_number++;
-- 
2.21.3

