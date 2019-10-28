Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18CE759E
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 16:55:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471zpB3RRDzDrTf
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 02:55:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 471zn04sKHzDr2d
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 02:54:41 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x9SFs5EE001374;
 Mon, 28 Oct 2019 17:54:05 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 3A38960327; Mon, 28 Oct 2019 17:54:05 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: p.zabel@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com,
 yuenn@google.com, venture@google.com, benjaminfair@google.com,
 avifishman70@gmail.com, joel@jms.id.au
Subject: [PATCH v2 2/3] dt-bindings: reset: Add binding constants for NPCM7xx
 reset controller
Date: Mon, 28 Oct 2019 17:54:02 +0200
Message-Id: <20191028155403.134126-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191028155403.134126-1-tmaimon77@gmail.com>
References: <20191028155403.134126-1-tmaimon77@gmail.com>
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
 .../dt-bindings/reset/nuvoton,npcm7xx-reset.h | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 include/dt-bindings/reset/nuvoton,npcm7xx-reset.h

diff --git a/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h b/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
new file mode 100644
index 000000000000..7b7e870eac35
--- /dev/null
+++ b/include/dt-bindings/reset/nuvoton,npcm7xx-reset.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2019 Nuvoton Technology corporation.
+
+#ifndef _DT_BINDINGS_NPCM7XX_RESET_H
+#define _DT_BINDINGS_NPCM7XX_RESET_H
+
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
+#define NPCM7XX_RESET_MFT0		32
+#define NPCM7XX_RESET_MFT1		33
+#define NPCM7XX_RESET_MFT2		34
+#define NPCM7XX_RESET_MFT3		35
+#define NPCM7XX_RESET_MFT4		36
+#define NPCM7XX_RESET_MFT5		37
+#define NPCM7XX_RESET_MFT6		38
+#define NPCM7XX_RESET_MFT7		39
+#define NPCM7XX_RESET_MMC		40
+#define NPCM7XX_RESET_SDHC		41
+#define NPCM7XX_RESET_GFX_SYS		42
+#define NPCM7XX_RESET_AHB_PCIBRG	43
+#define NPCM7XX_RESET_VDMA		44
+#define NPCM7XX_RESET_ECE		45
+#define NPCM7XX_RESET_VCD		46
+#define NPCM7XX_RESET_OTP		48
+#define NPCM7XX_RESET_SIOX1		50
+#define NPCM7XX_RESET_SIOX2		51
+#define NPCM7XX_RESET_3DES		53
+#define NPCM7XX_RESET_PSPI1		54
+#define NPCM7XX_RESET_PSPI2		55
+#define NPCM7XX_RESET_GMAC2		57
+#define NPCM7XX_RESET_USB_HOST		58
+#define NPCM7XX_RESET_GMAC1		60
+#define NPCM7XX_RESET_CP		63
+#define NPCM7XX_RESET_PWM_M1		160
+#define NPCM7XX_RESET_SMB12		161
+#define NPCM7XX_RESET_SPIX		162
+#define NPCM7XX_RESET_SMB13		163
+#define NPCM7XX_RESET_UDC0		164
+#define NPCM7XX_RESET_UDC7		165
+#define NPCM7XX_RESET_UDC8		166
+#define NPCM7XX_RESET_UDC9		167
+#define NPCM7XX_RESET_PCI_MAILBOX	169
+#define NPCM7XX_RESET_SMB14		172
+#define NPCM7XX_RESET_SHA		173
+#define NPCM7XX_RESET_SEC_ECC		174
+#define NPCM7XX_RESET_PCIE_RC		175
+#define NPCM7XX_RESET_TIMER_10_14	176
+#define NPCM7XX_RESET_RNG		177
+#define NPCM7XX_RESET_SMB15		178
+#define NPCM7XX_RESET_SMB8		179
+#define NPCM7XX_RESET_SMB9		180
+#define NPCM7XX_RESET_SMB10		181
+#define NPCM7XX_RESET_SMB11		182
+#define NPCM7XX_RESET_ESPI		183
+#define NPCM7XX_RESET_USB_PHY_1		184
+#define NPCM7XX_RESET_USB_PHY_2		185
+
+#endif
-- 
2.22.0

