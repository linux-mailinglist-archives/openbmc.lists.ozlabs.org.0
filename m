Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0745586A35
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 14:13:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxH8s4zYZz3dy3
	for <lists+openbmc@lfdr.de>; Mon,  1 Aug 2022 22:13:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxH3G22pMz3bxC
	for <openbmc@lists.ozlabs.org>; Mon,  1 Aug 2022 22:08:57 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 271C8Tqu020988
	for <openbmc@lists.ozlabs.org>; Mon, 1 Aug 2022 15:08:29 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 1 Aug
 2022 15:08:28 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.2; Mon, 1 Aug 2022
 20:08:26 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 1 Aug 2022 20:08:26 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4E54963A2A; Mon,  1 Aug 2022 15:08:23 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 13/16] arm64: npcm: Add support for Nuvoton NPCM8XX BMC SoC
Date: Mon, 1 Aug 2022 15:08:16 +0300
Message-ID: <20220801120819.113533-14-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220801120819.113533-1-tmaimon77@gmail.com>
References: <20220801120819.113533-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds support for the Nuvoton NPCM8XX Board Management
controller (BMC) SoC family.

The NPCM8XX based quad-core Cortex-A35 ARMv8 architecture.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 MAINTAINERS                  |  3 +++
 arch/arm64/Kconfig.platforms | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ef6f5484f54..be3a3197700f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2297,11 +2297,14 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/arm/npcm/*
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
+F:	arch/arm64/boot/dts/nuvoton/
 F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+F:	include/dt-bindings/clock/nuvoton,npcm8xx-clk.h
 
 ARM/NUVOTON WPCM450 ARCHITECTURE
 M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d7772a4c34fe..55df64fb418a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -209,6 +209,17 @@ config ARCH_MXC
 	  This enables support for the ARMv8 based SoCs in the
 	  NXP i.MX family.
 
+config ARCH_NPCM
+	bool "Nuvoton NPCM Architecture"
+	select PINCTRL	
+	select GPIOLIB
+	select NPCM7XX_TIMER
+	select RESET_CONTROLLER
+	select MFD_SYSCON
+	help
+	  General support for NPCM8xx BMC (Arbel).
+	  Nuvoton NPCM8xx BMC based on the Cortex A35.
+
 config ARCH_QCOM
 	bool "Qualcomm Platforms"
 	select GPIOLIB
-- 
2.33.0

