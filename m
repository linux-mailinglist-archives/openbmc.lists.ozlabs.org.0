Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DEC578971
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 20:19:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmqxf08QSz3c3T
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 04:19:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmqxH2b1Pz3bXZ
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 04:19:27 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26IIJJAX027506
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 21:19:19 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 18 Jul
 2022 21:19:18 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 19 Jul
 2022 02:19:16 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 19 Jul 2022 02:19:16 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id C948663A20; Mon, 18 Jul 2022 21:19:15 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <tony@atomide.com>, <felipe.balbi@linux.intel.com>, <jgross@suse.com>,
        <lukas.bulwahn@gmail.com>, <arnd@arndb.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 1/3] usb: host: npcm7xx: remove USB EHCI host reset sequence
Date: Mon, 18 Jul 2022 21:18:40 +0300
Message-ID: <20220718181842.61040-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220718181842.61040-1-tmaimon77@gmail.com>
References: <20220718181842.61040-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Remove USB EHCI host controller reset sequence from NPCM7XX USB EHCI
host probe function because it is done in the NPCM reset driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/host/ehci-npcm7xx.c | 50 ---------------------------------
 1 file changed, 50 deletions(-)

diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index 6b5a7a873e01..1d2e2c3c0bf0 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -22,19 +22,9 @@
 
 #include "ehci.h"
 
-#include <linux/regmap.h>
-#include <linux/mfd/syscon.h>
-
 #define DRIVER_DESC "EHCI npcm7xx driver"
 
 static const char hcd_name[] = "npcm7xx-ehci";
-
-#define  USB2PHYCTL_OFFSET 0x144
-
-#define  IPSRST2_OFFSET 0x24
-#define  IPSRST3_OFFSET 0x34
-
-
 static struct hc_driver __read_mostly ehci_npcm7xx_hc_driver;
 
 static int __maybe_unused ehci_npcm7xx_drv_suspend(struct device *dev)
@@ -60,52 +50,12 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
 {
 	struct usb_hcd *hcd;
 	struct resource *res;
-	struct regmap *gcr_regmap;
-	struct regmap *rst_regmap;
 	const struct hc_driver *driver = &ehci_npcm7xx_hc_driver;
 	int irq;
 	int retval;
 
 	dev_dbg(&pdev->dev,	"initializing npcm7xx ehci USB Controller\n");
 
-	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
-	if (IS_ERR(gcr_regmap)) {
-		dev_err(&pdev->dev, "%s: failed to find nuvoton,npcm750-gcr\n",
-			__func__);
-		return PTR_ERR(gcr_regmap);
-	}
-
-	rst_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
-	if (IS_ERR(rst_regmap)) {
-		dev_err(&pdev->dev, "%s: failed to find nuvoton,npcm750-rst\n",
-			__func__);
-		return PTR_ERR(rst_regmap);
-	}
-
-	/********* phy init  ******/
-	// reset usb host
-	regmap_update_bits(rst_regmap, IPSRST2_OFFSET,
-			(0x1 << 26), (0x1 << 26));
-	regmap_update_bits(rst_regmap, IPSRST3_OFFSET,
-			(0x1 << 25), (0x1 << 25));
-	regmap_update_bits(gcr_regmap, USB2PHYCTL_OFFSET,
-			(0x1 << 28), 0);
-
-	udelay(1);
-
-	// enable phy
-	regmap_update_bits(rst_regmap, IPSRST3_OFFSET,
-			(0x1 << 25), 0);
-
-	udelay(50); // enable phy
-
-	regmap_update_bits(gcr_regmap, USB2PHYCTL_OFFSET,
-			(0x1 << 28), (0x1 << 28));
-
-	// enable host
-	regmap_update_bits(rst_regmap, IPSRST2_OFFSET,
-			(0x1 << 26), 0);
-
 	if (usb_disabled())
 		return -ENODEV;
 
-- 
2.33.0

