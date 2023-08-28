Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDF678D26E
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 05:19:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=APgsTUkT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rb8dz60q8z30PY
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 13:19:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=APgsTUkT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RYyK34DlLz2yjD
	for <openbmc@lists.ozlabs.org>; Mon, 28 Aug 2023 14:30:14 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1bf55a81eeaso11537465ad.0
        for <openbmc@lists.ozlabs.org>; Sun, 27 Aug 2023 21:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693197011; x=1693801811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3IFgN8dUtyDdMCS+9ANZAbxkW+t8iG0THaIs3BGEh4=;
        b=APgsTUkTuTsGbTBRx2zO2FfipCAsc8YRKKg+/OPcb/9OcfKbxkhlg0OfEAQi70onaH
         gDT+pYv0n7n0wXacgqgjsCGZlt5nhVvVTFlsjFaNvhHNkps+MYVoJzKewXdHWxBcViFt
         xXf8NV1DR7EX5WZHw/M52RcXGwLAti3o7VmQl/eEvabhW1oSB/XGlvuGcz3G6fZSKVTv
         By0h/TOPENH53HuKDR+sdEMBLmLta6ml+HBLzpGiCsIrwReMl8aXWI8MMZyTYkfXiCRm
         PCxXp0xkW3DWexpw6L+aJ89lqMj61DPHIAgq3RoW7yt7FCtdNbTJjQ8HWgKFemtIfg/+
         Hzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693197011; x=1693801811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3IFgN8dUtyDdMCS+9ANZAbxkW+t8iG0THaIs3BGEh4=;
        b=KR47O2o7TaZOrM1sfuazceLfEbn8Y014QET1cD89ITCEbugmGOKPt59dLv0C7CscvE
         SGgYedEgqn3xoxfYctxWZe2Gjf9fAW6c2oaiImtNCncEpWMqqrqxoDBZLfDPQg3mBt+C
         +EMBEfT1WFm2FcKJNCSL5zo16co7d8UigOsMDAfHkAbFEWHQH5K1rDvBpYZwcXs36zaD
         vcY0RHGz4XrrVaV6GZrET3QbzDd5kci4UmG9t0RzQCZuvsgxrfBWCkl2sarO7rGYJKKu
         CSbOZ9/L605LVqXd6XwVctLKeTwljdN8VtEBBBvnWFc8vRGvwJrCl5bfu79c/0t6mDD0
         6GCg==
X-Gm-Message-State: AOJu0YzKlcLunVk8GE6c7u+09l5Ekq5x+Mtzgnfr1uUcKKLQTqs0HWza
	K7RqT3Rz10XazbdlhOomPVz0BYoq7e5vsQ==
X-Google-Smtp-Source: AGHT+IE56XAJwY0UADKGTKuCU3s2HUEq49O4M52siIPwt2l/sKEXBSLZWlVaM21Oby5BJFzt4EDZvw==
X-Received: by 2002:a17:902:ec83:b0:1bc:4f04:17f9 with SMTP id x3-20020a170902ec8300b001bc4f0417f9mr25900486plg.9.1693197010756;
        Sun, 27 Aug 2023 21:30:10 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm6198379plb.245.2023.08.27.21.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 21:30:10 -0700 (PDT)
From: peteryin <peteryin.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	patrick@stwcx.xyz
Subject: [PATCH 1/2] Title:Add board for Meta openbmc Minerva.
Date: Mon, 28 Aug 2023 12:28:05 +0800
Message-Id: <20230828042806.150698-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Aug 2023 13:18:35 +1000
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
Cc: peteryin <peter.yin@quantatw.com>, peteryin <peteryin.openbmc@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: peteryin <peter.yin@quantatw.com>

Create minerva initial file.

Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
---
 arch/arm/mach-aspeed/ast2600/Kconfig          |   8 ++
 board/aspeed/meta_ast2600/Kconfig             |  13 ++
 board/aspeed/meta_ast2600/Makefile            |   1 +
 .../meta_ast2600/meta_minerva_ast2600.c       | 130 ++++++++++++++++++
 4 files changed, 152 insertions(+)
 create mode 100644 board/aspeed/meta_ast2600/Kconfig
 create mode 100644 board/aspeed/meta_ast2600/Makefile
 create mode 100644 board/aspeed/meta_ast2600/meta_minerva_ast2600.c

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index f5852afa77..444990e2e3 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -51,6 +51,13 @@ config TARGET_QUALCOMM_DC_SCM_V1
 	  QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
 	  equipped with AST2600.
 
+config TARGET_META_MINERVA_AST2600
+	bool "META-MINERVA-AST2600"
+	depends on ASPEED_AST2600
+	help
+	  META-MINERVA-AST2600 is META openbmc minerva board for AST2600A3 chip.
+
+
 endchoice
 
 source "board/aspeed/evb_ast2600/Kconfig"
@@ -59,5 +66,6 @@ source "board/aspeed/slt_ast2600/Kconfig"
 source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
 source "board/qualcomm/dc-scm-v1/Kconfig"
+source "board/aspeed/meta_ast2600/Kconfig"
 
 endif
diff --git a/board/aspeed/meta_ast2600/Kconfig b/board/aspeed/meta_ast2600/Kconfig
new file mode 100644
index 0000000000..adc5b58733
--- /dev/null
+++ b/board/aspeed/meta_ast2600/Kconfig
@@ -0,0 +1,13 @@
+if TARGET_META_MINERVA_AST2600
+
+config SYS_BOARD
+	default "meta_ast2600"
+
+config SYS_VENDOR
+	default "aspeed"
+
+config SYS_CONFIG_NAME
+	string "board configuration name"
+	default "meta_minerva_ast2600"
+
+endif
diff --git a/board/aspeed/meta_ast2600/Makefile b/board/aspeed/meta_ast2600/Makefile
new file mode 100644
index 0000000000..b5a526efa5
--- /dev/null
+++ b/board/aspeed/meta_ast2600/Makefile
@@ -0,0 +1 @@
+obj-y += meta_minerva_ast2600.o
diff --git a/board/aspeed/meta_ast2600/meta_minerva_ast2600.c b/board/aspeed/meta_ast2600/meta_minerva_ast2600.c
new file mode 100644
index 0000000000..d0b3720da3
--- /dev/null
+++ b/board/aspeed/meta_ast2600/meta_minerva_ast2600.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) ASPEED Technology Inc.
+ */
+#include <common.h>
+#include <asm/io.h>
+
+#define SCU_BASE                   (0x1e6e2000)
+#define ESPI_BASE                  (0x1e6ee000)
+#define LPC_BASE                   (0x1e789000)
+#define LPC_HICR5                  (LPC_BASE + 0x80)
+#define LPC_HICR6                  (LPC_BASE + 0x84)
+#define LPC_SNPWADR                (LPC_BASE + 0x90)
+#define LPC_HICRB                  (LPC_BASE + 0x100)
+#define LPC_PCCR0                  (LPC_BASE | 0x130)
+
+#define SCU_MUTI_FN_PIN_CTRL5      (SCU_BASE | 0x414)
+#define SCU_MUTI_FN_PIN_CTRL7      (SCU_BASE | 0x41C)
+#define SCU_MUTI_FN_PIN_CTRL9      (SCU_BASE | 0x434)
+#define SCU_MUTI_FN_PIN_CTRL15     (SCU_BASE | 0x454)
+#define SCU_PIN_CONTROL8_REG       (SCU_BASE | 0x430)
+#define SCU_HW_STRAP2_SET_REG      (SCU_BASE | 0x510)
+#define SCU_HW_STRAP2_CLR_REG      (SCU_BASE | 0x514)
+#define SCU_HW_STRAP3_REG          (SCU_BASE | 0x51C)
+
+#define ENABLE_GPIO_PASSTHROUGH    BIT(9)
+#define GPIO_BASE                  (0x1e780000)
+#define GPIO_ABCD_BASE_REG         (GPIO_BASE | 0x000)
+#define GPIO_ABCD_DATA_REG         (GPIO_ABCD_BASE_REG)
+#define GPIO_ABCD_DIR_REG          (GPIO_BASE | 0x004)
+
+#define GPIO_EFGH_BASE_REG         (GPIO_BASE | 0x020)
+#define GPIO_EFGH_DATA_REG         (GPIO_EFGH_BASE_REG)
+#define GPIO_EFGH_DIR_REG          (GPIO_BASE | 0x024)
+
+#define GPIO_IJKL_BASE_REG         (GPIO_BASE | 0x070)
+#define GPIO_IJKL_DATA_REG         (GPIO_IJKL_BASE_REG)
+#define GPIO_IJKL_DIR_REG          (GPIO_BASE | 0x074)
+
+#define GPIO_MNOP_BASE_REG         (GPIO_BASE | 0x078)
+#define GPIO_MNOP_DATA_REG         (GPIO_MNOP_BASE_REG)
+#define GPIO_MNOP_DIR_REG          (GPIO_BASE | 0x07C)
+#define GPIO_MNOP_CMD_SOURCE0      (GPIO_BASE | 0x0E0)
+#define GPIO_MNOP_CMD_SOURCE1      (GPIO_BASE | 0x0E4)
+
+#define GPIO_QRST_BASE_REG         (GPIO_BASE | 0x080)
+#define GPIO_QRST_DATA_REG         (GPIO_QRST_BASE_REG)
+#define GPIO_QRST_DIR_REG          (GPIO_BASE | 0x084)
+
+#define GPIO_UVWX_BASE_REG         (GPIO_BASE | 0x088)
+#define GPIO_UVWX_DATA_REG         (GPIO_UVWX_BASE_REG)
+#define GPIO_UVWX_DIR_REG          (GPIO_BASE | 0x08C)
+
+#define GPIO_NAME(base, pin)       (1 << (pin + (base - 'A') % 4 * 8))
+#define GPIO_GROUP(base, val)      (val << ((base - 'A') % 4 * 8))
+#define SIO_ADDR_4E                (0x4E)
+#define SIO_ADDR_2E                (0x2E)
+
+static void __maybe_unused el_espi_init(void)
+{
+	u32 value = 0;
+
+	//SCU514: SCU514: Hardware Strap2 Clear Register (default)
+	//SCU510 [6]:0 eSPI mode
+	setbits_le32(SCU_HW_STRAP2_CLR_REG, BIT(6));
+
+	//SCU434: Multi-function Pin Control #9 (default)
+	setbits_le32(SCU_MUTI_FN_PIN_CTRL9, 0xFF << 16);
+
+	//SCU454: Multi-function Pin Control #15
+	value  = readl(SCU_MUTI_FN_PIN_CTRL15);
+	value &= 0x00FFFFFF;  //Clear BIT[31:24]
+	value |= 0xAA000000;  //BIT[31:24] = LAD3ESPID3~0 Driving Strength
+	writel(value, SCU_MUTI_FN_PIN_CTRL15);
+
+	//ESPI000: Engine Control
+	setbits_le32(ESPI_BASE, 1 << 4);
+}
+
+// SNOOP SET
+void el_port80_init(u32 reg_dir, u32 reg_val,
+		    u32 cmd_source0, u32 cmd_source1)
+{
+	u32 value = 0;
+
+	//GPIO Output Settings
+	setbits_le32(reg_dir, reg_val);
+
+	//Command Source0 = 1
+	//Command Source1 = 0
+	setbits_le32(cmd_source0, BIT(8));
+	clrbits_le32(cmd_source1, BIT(8));
+
+	//SNPWADR(0x90): LPC Snoop Address Register
+	value  = readl(LPC_SNPWADR);
+	value &= 0xFFFF0000;  //BIT[15:0] - clear;
+	value |= 0x00000080;  //BIT[15:0] - set;
+	writel(value, LPC_SNPWADR);
+	//HICR5(0x80): Host Interface Control Register 5
+	value  = readl(LPC_HICR5);
+	value |= 1;       //Enable snooping address #0
+	value &= ~0xA;
+	writel(value, LPC_HICR5);
+
+	//HICRB(0x100): Host Interface Control Register B
+	//EnSNP0D: Enable ACCEPT response code for snoop #0 commands,
+	//defined in HICR5[0], in eSPI mode.
+	setbits_le32(LPC_HICRB, BIT(14));
+
+	writel(0, LPC_PCCR0);
+}
+
+//Super IO Settings
+void el_superio_decoder(uint8_t addr)
+{
+	//Enable LPC to decode SuperIO 0x2E/0x4E address
+	setbits_le32(SCU_HW_STRAP2_CLR_REG, BIT(2));
+
+	//SuperIO configuration address selection (0 = 0x2E(Default) / 1 = 0x4E)
+	if (addr == 0x4E)
+		setbits_le32(SCU_HW_STRAP2_SET_REG, BIT(2));
+}
+
+int board_early_init_f(void)
+{
+	clrbits_le32(SCU_HW_STRAP3_REG, ENABLE_GPIO_PASSTHROUGH);
+	el_espi_init();
+	el_superio_decoder(SIO_ADDR_2E);
+	return 0;
+}
-- 
2.25.1

