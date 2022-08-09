Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB758DA0D
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 16:05:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2FGD2nnLz3c7p
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 00:05:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2FFS5MK5z2ywJ
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 00:04:59 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 279E4q06006460
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 17:04:52 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 9 Aug
 2022 17:04:51 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 9 Aug 2022
 22:04:49 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 9 Aug 2022 22:04:49 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id C535663A0A; Tue,  9 Aug 2022 17:04:48 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 2/2] misc: npcm7xx-lpc-bpc: Add NPCM845 LPC BPC support
Date: Tue, 9 Aug 2022 17:04:44 +0300
Message-ID: <20220809140444.28753-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220809140444.28753-1-tmaimon77@gmail.com>
References: <20220809140444.28753-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton BMC NPCM845 NPCM LPC BIOS Post Code support support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/misc/Kconfig           | 8 ++++----
 drivers/misc/Makefile          | 2 +-
 drivers/misc/npcm7xx-lpc-bpc.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 13e3afdbcc40..79cc23fbfac9 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -470,11 +470,11 @@ config HISI_HIKEY_USB
 	  switching between the dual-role USB-C port and the USB-A host ports
 	  using only one USB controller.
 
-config NPCM7XX_LPC_BPC
-	tristate "NPCM7xx LPC BIOS Post Code support"
-	depends on (ARCH_NPCM7XX || COMPILE_TEST)
+config NPCM_LPC_BPC
+	tristate "NPCM LPC BIOS Post Code support"
+	depends on (ARCH_NPCM || COMPILE_TEST)
 	help
-	  Provides a NPCM7xx driver to control the LPC BIOS Post Code
+	  Provides a NPCM driver to control the LPC BIOS Post Code
 	  interface which allows the BMC to monitoring and save
 	  the data written by the host to an arbitrary LPC I/O port.
 
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 53726c86460c..b6e9b550bb41 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -59,6 +59,6 @@ obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
 obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
-obj-$(CONFIG_NPCM7XX_LPC_BPC)	+= npcm7xx-lpc-bpc.o
+obj-$(CONFIG_NPCM_LPC_BPC)	+= npcm7xx-lpc-bpc.o
 obj-$(CONFIG_NPCM7XX_PCI_MBOX)	+= npcm7xx-pci-mbox.o
 obj-$(CONFIG_NPCM7XX_JTAG_MASTER)	+= npcm7xx-jtag-master.o
diff --git a/drivers/misc/npcm7xx-lpc-bpc.c b/drivers/misc/npcm7xx-lpc-bpc.c
index e014e07cd4a4..5c90dfc5374b 100644
--- a/drivers/misc/npcm7xx-lpc-bpc.c
+++ b/drivers/misc/npcm7xx-lpc-bpc.c
@@ -352,7 +352,7 @@ static int npcm7xx_bpc_probe(struct platform_device *pdev)
 		}
 	}
 
-	pr_info("npcm7xx BIOS post code probe\n");
+	pr_info("NPCM BIOS Post Code probe\n");
 
 	return rc;
 }
-- 
2.33.0

