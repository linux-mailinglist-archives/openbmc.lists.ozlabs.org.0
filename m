Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052E58DA17
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 16:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2FK94dRQz3bqT
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 00:08:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2FJT3YGKz2ypf
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 00:07:35 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 279E7TfG006490
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 17:07:29 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 9 Aug
 2022 17:07:28 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 9 Aug 2022
 22:07:26 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 9 Aug 2022 22:07:26 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 3D9E863A0A; Tue,  9 Aug 2022 17:07:25 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 2/2] misc: npcm7xx-pci-mbox: Add NPCM845 PCI MBOX support
Date: Tue, 9 Aug 2022 17:07:21 +0300
Message-ID: <20220809140721.28958-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220809140721.28958-1-tmaimon77@gmail.com>
References: <20220809140721.28958-1-tmaimon77@gmail.com>
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

Add Nuvoton BMC NPCM845 NPCM PCI Mail Box support support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/misc/Kconfig  | 10 +++++-----
 drivers/misc/Makefile |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 79cc23fbfac9..1174ad7a15a7 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -478,12 +478,12 @@ config NPCM_LPC_BPC
 	  interface which allows the BMC to monitoring and save
 	  the data written by the host to an arbitrary LPC I/O port.
 
-config NPCM7XX_PCI_MBOX
-	tristate "NPCM7xx PCI Mailbox Controller"
-	depends on (ARCH_NPCM7XX || COMPILE_TEST) && REGMAP && MFD_SYSCON
+config NPCM_PCI_MBOX
+	tristate "NPCM PCI Mailbox Controller"
+	depends on (ARCH_NPCM || COMPILE_TEST) && REGMAP && MFD_SYSCON
 	help
-	  Expose the NPCM750/730/715/705 PCI MBOX registers found on
-	  Nuvoton SOCs to userspace.
+	  Expose the NPCM BMC PCI MBOX registers found on Nuvoton SOCs
+	  to userspace.
 
 config NPCM7XX_JTAG_MASTER
 	tristate "NPCM7xx JTAG Master driver"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index b6e9b550bb41..0400bfee295f 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -60,5 +60,5 @@ obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
 obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
 obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
 obj-$(CONFIG_NPCM_LPC_BPC)	+= npcm7xx-lpc-bpc.o
-obj-$(CONFIG_NPCM7XX_PCI_MBOX)	+= npcm7xx-pci-mbox.o
+obj-$(CONFIG_NPCM_PCI_MBOX)	+= npcm7xx-pci-mbox.o
 obj-$(CONFIG_NPCM7XX_JTAG_MASTER)	+= npcm7xx-jtag-master.o
-- 
2.33.0

