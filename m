Return-Path: <openbmc+bounces-348-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C22B06A20
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 01:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhbfp2BWLz30Vl;
	Wed, 16 Jul 2025 09:55:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752551027;
	cv=none; b=Qp9fQdkGcToxfPwK1FLdUe2tYm1gI3wpAFI/LVSKNUQKWVlG7ZzuHARrkpIz7KjQffo0dMGc4EDJZdLmZISTOi/9Z1i17BsDxOlfLL9I5VcT7NUwWPf8o0cdPHrb5y/6yqCD8TaURR4YsWq03J1xLqY/j9ZtHoIINN/D/BOLeRSx9VYnrXvbqIwgwDs0SCM+4Y9nY1k6pfMG1bT7ynQJPGoft0np8ffHb6yETn3tPNF0ENYp9Od5rFW9b98f380fHjcGBpky2DreBpfWfceSKaX/1WRJP8yT4Yg91YcJjQhrDhKNSl9TXfxEOf/37l5+CmGGlCK7gQ/ZJZDfBHsEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752551027; c=relaxed/relaxed;
	bh=aK01aGUmIPVi7g/grbHmbwBzcBD/ZrD56IJJamDBcTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jhcgiC9mlBNOstuXcTd201IBT9DRciC+HqmIgBhYauI8rcdHA29hKdiSzbpG08QqZFOv68ShYvPyiMvRHeOokCGhuQr1fkA1ikT2QLcSwukqNsTqaSq6cgqxL9cI+hX215E5Gpx5Z/0+M5ndJ6NHWyWx0lqJmRZYrR3RZpY4T2mCnO7wwipTk7e1dwLmyW2En3+p9WOix8MEeQho5mbUlgKScUImhs0kj4ANW2sqwwLXGTBWTBJOMpg6IJU3UYjdiuoC5e4mHusIG4rfaZ72avJP6bielUcHTl9463sPJXk8MSUBz9UEM0vXLKe6xcsMKboqCbBnAguxYTg3KVNEfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bh4mL5cr7z3c5M;
	Tue, 15 Jul 2025 13:43:46 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 11:43:21 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 11:43:21 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 08/10] PCI: Add FMT and TYPE definition for TLP header
Date: Tue, 15 Jul 2025 11:43:18 +0800
Message-ID: <20250715034320.2553837-9-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

According to PCIe specification, add FMT and TYPE definition
for TLP header. And also add macro to combine FMT and TYPE to
1 byte.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 include/uapi/linux/pci_regs.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index a3a3e942dedf..700b915e00f5 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -1230,4 +1230,36 @@
 #define PCI_DVSEC_CXL_PORT_CTL				0x0c
 #define PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR		0x00000001
 
+/* Fmt[2:0] encoding for TLP Header */
+#define PCI_TLP_FMT_3DW_NO_DATA		0x0  // 3DW header, no data
+#define PCI_TLP_FMT_4DW_NO_DATA		0x1  // 4DW header, no data
+#define PCI_TLP_FMT_3DW_DATA		0x2  // 3DW header, with data
+#define PCI_TLP_FMT_4DW_DATA		0x3  // 4DW header, with data
+#define PCI_TLP_FMT_PREFIX		0x4  // Prefix header
+
+/* Type[4:0] encoding for TLP Header */
+#define PCI_TLP_TYPE_MEM_RD		0x00 // Memory Read Request
+#define PCI_TLP_TYPE_MEM_RDLK		0x01 // Memory Read Lock Request
+#define PCI_TLP_TYPE_MEM_WR		0x00 // Memory Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_IO_RD		0x02 // IO Read Request
+#define PCI_TLP_TYPE_IO_WR		0x02 // IO Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_CFG0_RD		0x04 // Config Type 0 Read Request
+#define PCI_TLP_TYPE_CFG0_WR		0x04 // Config Type 0 Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_CFG1_RD		0x05 // Config Type 1 Read Request
+#define PCI_TLP_TYPE_CFG1_WR		0x05 // Config Type 1 Write Request (Fmt must be with data)
+#define PCI_TLP_TYPE_MSG		0x10 // Message Request (see routing field)
+#define PCI_TLP_TYPE_MSGD		0x11 // Message Request with Data (see routing field)
+#define PCI_TLP_TYPE_CPL		0x0A // Completion without Data
+#define PCI_TLP_TYPE_CPLD		0x0A // Completion with Data (Fmt must be with data)
+#define PCI_TLP_TYPE_CPLLCK		0x0B // Completion Locked
+#define PCI_TLP_TYPE_CPLDLCK		0x0B // Completion with Data Locked (Fmt must be with data)
+#define PCI_TLP_TYPE_FETCH_ADD		0x0C // Fetch and Add AtomicOp Request
+#define PCI_TLP_TYPE_SWAP		0x0D // Unconditional Swap AtomicOp Request
+#define PCI_TLP_TYPE_CMP_SWAP		0x0E // Compare and Swap AtomicOp Request
+#define PCI_TLP_TYPE_LOCAL_PREFIX	0x00 // Local TLP Prefix (Fmt = 0x4)
+#define PCI_TLP_TYPE_E2E_PREFIX		0x10 // End-to-End TLP Prefix (Fmt = 0x4)
+
+/* Macro to combine Fmt and Type into the 8-bit field */
+#define PCIE_TLP_FMT_TYPE(fmt, type)   (((fmt) << 5) | ((type) & 0x1F))
+
 #endif /* LINUX_PCI_REGS_H */
-- 
2.43.0


