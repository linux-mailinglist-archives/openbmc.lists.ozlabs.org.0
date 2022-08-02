Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8C587CF2
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 15:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxwZT4S2Fz3cH1
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 23:19:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxwXp2GPPz3035
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 23:18:13 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 272DI3LZ021459
	for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2022 16:18:03 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 2 Aug
 2022 16:18:02 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Tue, 2 Aug 2022
 21:18:01 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 2 Aug 2022 21:18:00 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 209CA63A20; Tue,  2 Aug 2022 16:18:00 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 3/5] USB: host: npcm: Add NPCM8XX support
Date: Tue, 2 Aug 2022 16:17:55 +0300
Message-ID: <20220802131757.234026-4-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220802131757.234026-1-tmaimon77@gmail.com>
References: <20220802131757.234026-1-tmaimon77@gmail.com>
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

Modify NPCM USB EHCI host controller configuration to support all NPCM
BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/usb/host/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index c4736d1d020c..a8deea323d19 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -205,12 +205,12 @@ config USB_EHCI_FSL
 	  Variation of ARC USB block used in some Freescale chips.
 
 config USB_EHCI_HCD_NPCM7XX
-	tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
-	depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
-	default y if (USB_EHCI_HCD && ARCH_NPCM7XX)
+	tristate "Support for Nuvoton NPCM on-chip EHCI USB controller"
+	depends on (USB_EHCI_HCD && ARCH_NPCM) || COMPILE_TEST
+	default y if (USB_EHCI_HCD && ARCH_NPCM)
 	help
 	  Enables support for the on-chip EHCI controller on
-	  Nuvoton NPCM7XX chips.
+	  Nuvoton NPCM chips.
 
 config USB_EHCI_HCD_OMAP
 	tristate "EHCI support for OMAP3 and later chips"
-- 
2.33.0

