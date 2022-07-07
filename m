Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98156AE79
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 00:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfB542r21z3c93
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 08:33:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=HLCHRfNz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.38; helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=HLCHRfNz;
	dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfB401scvz304j
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 08:32:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657233136; x=1688769136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ue8qHZhaduVkCsCWtWJsNIYfgNvWmdsCQoEBciBb8A=;
  b=HLCHRfNzhzZamVm5dEWYaXHrZ9Vbutunyv8USoVI6NQOydntV+wAyI9n
   QD88y9+rhfJXXva7RWkIe/9FF1TB6AAd+9rWZPp0+sjbGSDjaDn2SZ94S
   4LO03WV9uTV1YQtGFL6qVduk7cdTItxpbFLcsTDgx50YGO96s+W7LbaKN
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Jul 2022 15:32:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 15:32:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 7 Jul 2022 15:32:09 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 7 Jul 2022
 15:32:08 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 2/2] board: qualcomm: dc-scm-v1: add initial version of Qualcomm DC-SCM V1 board
Date: Thu, 7 Jul 2022 15:30:58 -0700
Message-ID: <20220707223058.2722999-3-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
References: <20220707223058.2722999-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

Add initial version of Qualcomm DC-SCM V1 board. It has BMC_OK GPIO
initialization code as an initial commit.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* Changed GPIO handling using GPIO driver. (Joel)
* Moved board specific code to the manufacturer folder. (Joel)

 arch/arm/mach-aspeed/ast2600/Kconfig |  8 ++++++
 board/qualcomm/dc-scm-v1/Kconfig     | 15 ++++++++++
 board/qualcomm/dc-scm-v1/Makefile    |  1 +
 board/qualcomm/dc-scm-v1/dc-scm-v1.c | 42 ++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 board/qualcomm/dc-scm-v1/Kconfig
 create mode 100644 board/qualcomm/dc-scm-v1/Makefile
 create mode 100644 board/qualcomm/dc-scm-v1/dc-scm-v1.c

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index 46cc1ad1dbd9..713bdf37d83f 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
 	  AST2600-INTEL is an Intel Eagle Stream CRB with
 	  AST2600 as the BMC.
 
+config TARGET_QUALCOMM_DC_SCM_V1
+	bool "QUALCOMM-DC-SCM-V1"
+	depends on ASPEED_AST2600
+	help
+	  QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
+	  equipped with AST2600.
+
 endchoice
 
 source "board/aspeed/evb_ast2600/Kconfig"
@@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
 source "board/aspeed/slt_ast2600/Kconfig"
 source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
+source "board/qualcomm/dc-scm-v1/Kconfig"
 
 endif
diff --git a/board/qualcomm/dc-scm-v1/Kconfig b/board/qualcomm/dc-scm-v1/Kconfig
new file mode 100644
index 000000000000..57e311a20729
--- /dev/null
+++ b/board/qualcomm/dc-scm-v1/Kconfig
@@ -0,0 +1,15 @@
+if TARGET_QUALCOMM_DC_SCM_V1
+
+config SYS_BOARD
+	default "dc-scm-v1"
+
+config SYS_VENDOR
+	default "qualcomm"
+
+config SYS_SOC
+	default "ast2600"
+
+config SYS_CONFIG_NAME
+	default "evb_ast2600a1_spl"
+
+endif
diff --git a/board/qualcomm/dc-scm-v1/Makefile b/board/qualcomm/dc-scm-v1/Makefile
new file mode 100644
index 000000000000..cb2aae7f9298
--- /dev/null
+++ b/board/qualcomm/dc-scm-v1/Makefile
@@ -0,0 +1 @@
+obj-y += dc-scm-v1.o
diff --git a/board/qualcomm/dc-scm-v1/dc-scm-v1.c b/board/qualcomm/dc-scm-v1/dc-scm-v1.c
new file mode 100644
index 000000000000..4b81eac46bdf
--- /dev/null
+++ b/board/qualcomm/dc-scm-v1/dc-scm-v1.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <common.h>
+#include <asm/gpio.h>
+
+#define BMC_OK_GPIO "gpio@1e780000171"
+
+static void gpio_init(void)
+{
+	struct gpio_desc desc;
+	int ret;
+
+	ret = dm_gpio_lookup_name(BMC_OK_GPIO, &desc);
+	if (ret)
+		return;
+	ret = dm_gpio_request(&desc, "bmc_ok");
+	if (ret)
+		return;
+	ret = dm_gpio_set_dir_flags(&desc, GPIOD_IS_OUT);
+	if (ret)
+		goto free_exit;
+
+	dm_gpio_set_value(&desc, 0);
+
+free_exit:
+	dm_gpio_free(desc.dev, &desc);
+}
+
+int board_early_init_f(void)
+{
+	return 0;
+}
+
+int board_late_init(void)
+{
+	gpio_init();
+
+	return 0;
+}
-- 
2.25.1

