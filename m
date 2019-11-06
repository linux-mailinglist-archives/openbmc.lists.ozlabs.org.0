Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E093FF194F
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 16:02:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477VBd1FG7zF3wm
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 02:02:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477V0v75YhzF3B4
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 01:54:05 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id xA6ErYHq026783;
 Wed, 6 Nov 2019 16:53:34 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 2A94D6032A; Wed,  6 Nov 2019 16:53:34 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Subject: [PATCH v5 2/3] dt-bindings: reset: Add binding constants for NPCM7xx
 reset controller
Date: Wed,  6 Nov 2019 16:53:30 +0200
Message-Id: <20191106145331.25740-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191106145331.25740-1-tmaimon77@gmail.com>
References: <20191106145331.25740-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add device tree binding constants for Nuvoton BMC NPCM7xx
reset controller.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../dt-bindings/reset/nuvoton,npcm7xx-reset.h | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 include/dt-bindings/reset/nuvoton,npcm7xx-reset.h

diff --git a/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h b/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
new file mode 100644
index 000000000000..df088e68a9ba
--- /dev/null
+++ b/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2019 Nuvoton Technology corporation.
+
+#ifndef _DT_BINDINGS_NPCM7XX_RESET_H
+#define _DT_BINDINGS_NPCM7XX_RESET_H
+
+#define NPCM7XX_RESET_IPSRST1		0x20
+#define NPCM7XX_RESET_IPSRST2		0x24
+#define NPCM7XX_RESET_IPSRST3		0x34
+
+/* Reset lines on IP1 reset module (NPCM7XX_RESET_IPSRST1) */
+#define NPCM7XX_RESET_FIU3		1
+#define NPCM7XX_RESET_UDC1		5
+#define NPCM7XX_RESET_EMC1		6
+#define NPCM7XX_RESET_UART_2_3		7
+#define NPCM7XX_RESET_UDC2		8
+#define NPCM7XX_RESET_PECI		9
+#define NPCM7XX_RESET_AES		10
+#define NPCM7XX_RESET_UART_0_1		11
+#define NPCM7XX_RESET_MC		12
+#define NPCM7XX_RESET_SMB2		13
+#define NPCM7XX_RESET_SMB3		14
+#define NPCM7XX_RESET_SMB4		15
+#define NPCM7XX_RESET_SMB5		16
+#define NPCM7XX_RESET_PWM_M0		18
+#define NPCM7XX_RESET_TIMER_0_4		19
+#define NPCM7XX_RESET_TIMER_5_9		20
+#define NPCM7XX_RESET_EMC2		21
+#define NPCM7XX_RESET_UDC4		22
+#define NPCM7XX_RESET_UDC5		23
+#define NPCM7XX_RESET_UDC6		24
+#define NPCM7XX_RESET_UDC3		25
+#define NPCM7XX_RESET_ADC		27
+#define NPCM7XX_RESET_SMB6		28
+#define NPCM7XX_RESET_SMB7		29
+#define NPCM7XX_RESET_SMB0		30
+#define NPCM7XX_RESET_SMB1		31
+
+/* Reset lines on IP2 reset module (NPCM7XX_RESET_IPSRST2) */
+#define NPCM7XX_RESET_MFT0		0
+#define NPCM7XX_RESET_MFT1		1
+#define NPCM7XX_RESET_MFT2		2
+#define NPCM7XX_RESET_MFT3		3
+#define NPCM7XX_RESET_MFT4		4
+#define NPCM7XX_RESET_MFT5		5
+#define NPCM7XX_RESET_MFT6		6
+#define NPCM7XX_RESET_MFT7		7
+#define NPCM7XX_RESET_MMC		8
+#define NPCM7XX_RESET_SDHC		9
+#define NPCM7XX_RESET_GFX_SYS		10
+#define NPCM7XX_RESET_AHB_PCIBRG	11
+#define NPCM7XX_RESET_VDMA		12
+#define NPCM7XX_RESET_ECE		13
+#define NPCM7XX_RESET_VCD		14
+#define NPCM7XX_RESET_OTP		16
+#define NPCM7XX_RESET_SIOX1		18
+#define NPCM7XX_RESET_SIOX2		19
+#define NPCM7XX_RESET_3DES		21
+#define NPCM7XX_RESET_PSPI1		22
+#define NPCM7XX_RESET_PSPI2		23
+#define NPCM7XX_RESET_GMAC2		25
+#define NPCM7XX_RESET_USB_HOST		26
+#define NPCM7XX_RESET_GMAC1		28
+#define NPCM7XX_RESET_CP		31
+
+/* Reset lines on IP3 reset module (NPCM7XX_RESET_IPSRST3) */
+#define NPCM7XX_RESET_PWM_M1		0
+#define NPCM7XX_RESET_SMB12		1
+#define NPCM7XX_RESET_SPIX		2
+#define NPCM7XX_RESET_SMB13		3
+#define NPCM7XX_RESET_UDC0		4
+#define NPCM7XX_RESET_UDC7		5
+#define NPCM7XX_RESET_UDC8		6
+#define NPCM7XX_RESET_UDC9		7
+#define NPCM7XX_RESET_PCI_MAILBOX	9
+#define NPCM7XX_RESET_SMB14		12
+#define NPCM7XX_RESET_SHA		13
+#define NPCM7XX_RESET_SEC_ECC		14
+#define NPCM7XX_RESET_PCIE_RC		15
+#define NPCM7XX_RESET_TIMER_10_14	16
+#define NPCM7XX_RESET_RNG		17
+#define NPCM7XX_RESET_SMB15		18
+#define NPCM7XX_RESET_SMB8		19
+#define NPCM7XX_RESET_SMB9		20
+#define NPCM7XX_RESET_SMB10		21
+#define NPCM7XX_RESET_SMB11		22
+#define NPCM7XX_RESET_ESPI		23
+#define NPCM7XX_RESET_USB_PHY_1		24
+#define NPCM7XX_RESET_USB_PHY_2		25
+
+#endif
-- 
2.22.0

