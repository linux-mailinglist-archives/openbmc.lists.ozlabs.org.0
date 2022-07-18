Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29189578975
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 20:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmqy404PWz3c2b
	for <lists+openbmc@lfdr.de>; Tue, 19 Jul 2022 04:20:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmqxH2YC2z3bVt
	for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 04:19:29 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 26IIJM8l027512
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 21:19:22 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 18 Jul
 2022 21:19:21 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Tue, 19 Jul
 2022 02:19:19 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 19 Jul 2022 02:19:19 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id EDAA063A20; Mon, 18 Jul 2022 21:19:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
        <tony@atomide.com>, <felipe.balbi@linux.intel.com>, <jgross@suse.com>,
        <lukas.bulwahn@gmail.com>, <arnd@arndb.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/3] USB: host: npcm: Add NPCM8XX support
Date: Mon, 18 Jul 2022 21:18:42 +0300
Message-ID: <20220718181842.61040-4-tmaimon77@gmail.com>
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

Modify NPCM USB EHCI host controller configuration to support all NPCM
BMC SoC.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/usb/host/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 682b3d2da623..bcd595e30811 100644
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

