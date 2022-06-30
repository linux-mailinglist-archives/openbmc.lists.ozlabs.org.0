Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D915623D0
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 22:05:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYq7c2CcSz3ch8
	for <lists+openbmc@lfdr.de>; Fri,  1 Jul 2022 06:05:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=yk1Je1/Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=yk1Je1/Z;
	dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYq666zG1z3dpG
	for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2022 06:03:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1656619439; x=1688155439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B3FiEnHTNx4BO7IHMvaID0TjbfQ5t94/QjmMQNsfRXc=;
  b=yk1Je1/ZxvEKNvdcaWixjZ3yAW57iEOdlYJE1idGIyHBX03Kw5v7Vdet
   FhsmoXfCsxoirNhH4tFpsShJneSkBt3ZVoK6+UklFsfValgqjYWwqj+MQ
   a15Cqee477p+3ImdE7+c+e7JkCfy1AHECSDw6OCtiv89uxqEKswXpVWoH
   U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 30 Jun 2022 13:02:55 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 13:02:54 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 30 Jun 2022 13:02:54 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 30 Jun
 2022 13:02:53 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/3] board: ast2600_qualcomm: add initial version of Qualcomm DC-SCM V1 board
Date: Thu, 30 Jun 2022 13:02:26 -0700
Message-ID: <20220630200227.2292079-3-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add initial version of Qualcomm DC-SCM V1 board to support Qualcomm
specific options.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 arch/arm/mach-aspeed/ast2600/Kconfig      |  8 ++++++
 board/aspeed/ast2600_qualcomm/Kconfig     | 15 +++++++++++
 board/aspeed/ast2600_qualcomm/Makefile    |  1 +
 board/aspeed/ast2600_qualcomm/dc-scm-v1.c | 33 +++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 board/aspeed/ast2600_qualcomm/Kconfig
 create mode 100644 board/aspeed/ast2600_qualcomm/Makefile
 create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1.c

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index 46cc1ad1dbd9..252458846a84 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
 	  AST2600-INTEL is an Intel Eagle Stream CRB with
 	  AST2600 as the BMC.
 
+config TARGET_AST2600_QUALCOMM_DC_SCM_V1
+	bool "AST2600_QUALCOMM_DC_SCM_V1"
+	depends on ASPEED_AST2600
+	help
+	  AST2600-QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
+	  equipped with AST2600.
+
 endchoice
 
 source "board/aspeed/evb_ast2600/Kconfig"
@@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
 source "board/aspeed/slt_ast2600/Kconfig"
 source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
+source "board/aspeed/ast2600_qualcomm/Kconfig"
 
 endif
diff --git a/board/aspeed/ast2600_qualcomm/Kconfig b/board/aspeed/ast2600_qualcomm/Kconfig
new file mode 100644
index 000000000000..3ede24c34dee
--- /dev/null
+++ b/board/aspeed/ast2600_qualcomm/Kconfig
@@ -0,0 +1,15 @@
+if TARGET_AST2600_QUALCOMM_DC_SCM_V1
+
+config SYS_BOARD
+	default "ast2600_qualcomm"
+
+config SYS_VENDOR
+	default "aspeed"
+
+config SYS_SOC
+	default "ast2600"
+
+config SYS_CONFIG_NAME
+	default "evb_ast2600"
+
+endif
diff --git a/board/aspeed/ast2600_qualcomm/Makefile b/board/aspeed/ast2600_qualcomm/Makefile
new file mode 100644
index 000000000000..cb2aae7f9298
--- /dev/null
+++ b/board/aspeed/ast2600_qualcomm/Makefile
@@ -0,0 +1 @@
+obj-y += dc-scm-v1.o
diff --git a/board/aspeed/ast2600_qualcomm/dc-scm-v1.c b/board/aspeed/ast2600_qualcomm/dc-scm-v1.c
new file mode 100644
index 000000000000..40bc85e068ad
--- /dev/null
+++ b/board/aspeed/ast2600_qualcomm/dc-scm-v1.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <common.h>
+#include <asm/io.h>
+
+/* GPIO registers */
+#define GPIO_BASE		0x1e780000
+#define GPIO_UVWX_VAL		(GPIO_BASE + 0x88)
+#define GPIO_UVWX_VAL_V3	BIT(11)
+#define GPIO_UVWX_DIR		(GPIO_BASE + 0x8c)
+#define GPIO_UVWX_DIR_V3	BIT(11)
+
+static void gpio_init(void)
+{
+	/* Set GPIOV3 (BMC_OK) as an output with value low explicitly. */
+	writel(readl(GPIO_UVWX_DIR) | GPIO_UVWX_DIR_V3, GPIO_UVWX_DIR);
+	writel(readl(GPIO_UVWX_VAL) & ~GPIO_UVWX_VAL_V3, GPIO_UVWX_VAL);
+}
+
+int board_early_init_f(void)
+{
+	gpio_init();
+
+	return 0;
+}
+
+int board_late_init(void)
+{
+	return 0;
+}
-- 
2.25.1

