Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EE857825B
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 14:30:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmhBc2Vfqz3c1k
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 22:30:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmh9t3rTvz3050
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 22:29:50 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26ICTfGI020559
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 15:29:41 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 18 Jul
 2022 15:29:40 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 18 Jul
 2022 20:29:38 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 18 Jul 2022 20:29:37 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 17E6363A4C; Mon, 18 Jul 2022 15:29:37 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <tony@atomide.com>, <felipe.balbi@linux.intel.com>, <jgross@suse.com>,
        <lukas.bulwahn@gmail.com>, <arnd@arndb.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 1/3] usb: host: npcm7xx: remove USB EHCI host reset sequence
Date: Mon, 18 Jul 2022 15:29:20 +0300
Message-ID: <20220718122922.9396-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220718122922.9396-1-tmaimon77@gmail.com>
References: <20220718122922.9396-1-tmaimon77@gmail.com>
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

Due to it, NPCM7XX EHCI driver configuration is dependent on NPCM reset.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/usb/host/Kconfig        |  2 +-
 drivers/usb/host/ehci-npcm7xx.c | 47 ---------------------------------
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 682b3d2da623..e05e2cf806f8 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -206,7 +206,7 @@ config USB_EHCI_FSL
 
 config USB_EHCI_HCD_NPCM7XX
 	tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
-	depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
+	depends on (USB_EHCI_HCD && ARCH_NPCM7XX && RESET_NPCM) || COMPILE_TEST
 	default y if (USB_EHCI_HCD && ARCH_NPCM7XX)
 	help
 	  Enables support for the on-chip EHCI controller on
diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index 6b5a7a873e01..955e7c8f3db8 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -28,13 +28,6 @@
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
@@ -60,52 +53,12 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
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

