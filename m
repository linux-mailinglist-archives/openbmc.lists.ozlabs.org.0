Return-Path: <openbmc+bounces-580-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA98B42610
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:58:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j3201Vz2xgp;
	Thu,  4 Sep 2025 01:58:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915111;
	cv=none; b=M2IfKwDmeEqcnYdn0GhsINgYmdWS6LQV/4ciXxJ+p7clu/n6vbGJgwmpqQgijOEgfDyd6Laj1mncoSQr8eXoNhEOpsUddtL1MsL7QM/juHmmoGibU3b9OHtmNAOh4NaWFOFrqhmDl6ngpt54M4Lq9Eub+iJ+YSPFqNfHMHAtBUHhbrqRxzOtXwx3gOoTlcQS+SO+VfKg1CUATK0A712TXlxptkeHhx8WDts513qtLc+OeWFEbN5vqpMsOTqrfuiGgH31aF/84UJHQjAiudIBsP3CmHn1w+MF5Ei6Xv2bJ8ibZ70k+EQYQzLEpU35C7uDUpVKqqpxKeqt7e/O5SSAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915111; c=relaxed/relaxed;
	bh=hENgbfP8JWopVobBoLfj7cegerr3C9fBXVxRHibouW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwT2X8015tvUCYCB7R9F1R21b35JcdmHIuzseBRfaqqqrQq74lDk9OmZ26V7JEaKcd9uqK8UEycRFMIB+lfyBRVgPBjPH3NgETqNrbLKkR+TcQRTgQVZyTy9M69z+3gXps36ll4MnN+Ftd/zKJxslGG+SZSeSe00NmVjHVoHN+d6ZetF9/ofqCEbJZAuOWwCY8KMSKp/8kper9FusQnsGtfpIHn8T6lInLTqnTcY0PlP8rgUnrzFZdJvE1L59QqR8fRJV4anW4HkibN39fBgMXHRchGR/m4AYr+zjkO5owP/MZa+q+d07+5E0++KnK3YV4V9U0Hx6oXhQtxT9BmC7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFJVmUIU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kFJVmUIU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j15vPyz2ykc
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:29 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AMVLO006549;
	Wed, 3 Sep 2025 15:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hENgbfP8JWopVobBo
	Lfj7cegerr3C9fBXVxRHibouW4=; b=kFJVmUIUG7T3pdh66qukClo/T/B5LX/B/
	OGwg5ywPYcAlE3Hqg69doZCEBeNOjwggYVQMAuclkGf/4bt0pf3PNikw3h5KAx46
	vgcH2/gONmVlXAODaLaVc5upMy9WVfnKUiaugodwQwqwQUZwrF4n9OAONP5mKrsl
	FwKZJs5yCUmnTdzZxYxeQeYmcY1/Kb1UUSombQ4NJTGXK4gWVZovZZFVq4CA0yC2
	DLlWEZo7ocx81dAiUPI8m918w7BUc67odtls49ZtB5oiVQcOdgZAQgJmXKyT7Fws
	4pqyIgkLCEJ7VvWyb2dsuh1r03LDiQ2qTkB8V66s4HZ9cbEn7gauw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usur5bdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583FNnCW014145;
	Wed, 3 Sep 2025 15:58:14 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3fw9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:14 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwDvA7209674
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:13 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65D1158056;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 027C95803F;
	Wed,  3 Sep 2025 15:58:13 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:12 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-6.12 v2 1/6] soc: aspeed: Add XDMA Engine Driver
Date: Wed,  3 Sep 2025 10:58:03 -0500
Message-ID: <20250903155810.2839634-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903155810.2839634-1-ninad@linux.ibm.com>
References: <20250903155810.2839634-1-ninad@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMCBTYWx0ZWRfX+96G5zT1rDDj
 K+q8E7y+9XhC58j9L0pBXzLOK9nLvsm4ugWthLi+CQlKVrngyxumgVggLTGA8YLYFBXuLIakD5B
 /xF6DfKcHDq0BOLBdm8nDDNtkmnoyc7niI8fYl2nZXxu53VJQR1q2ZdCRXdgPtAh9a2tWH28Y9i
 b9UZYfgNJIcqdt5x7Xq3bxQsDmG1bMtS6vfJNFaoMjF83XdQpOr9V3suMNj5e3fXAIg5S2LP2lj
 6AtUbMo3a+5vgel+Zhd2n8MhpcCEwr+lpR8DGvceb+EuyE48S1VjsN470zQJd3GuLHSfoVNbFQ8
 qOVI/GaWByAqmoGjbl8ndNK1hJZuaXdV3vgW5+mCYj5vRVBbDmVG9faNY7IKKwS9LM4hfEvvfc7
 ROFNldQU
X-Proofpoint-GUID: zLglOYGlxFPw7ncpTyl75ZcGUAILc4KW
X-Proofpoint-ORIG-GUID: zLglOYGlxFPw7ncpTyl75ZcGUAILc4KW
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=68b86597 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8
 a=pGLkceISAAAA:8 a=Q7IzsAq5SB1tJ58OEZ4A:9 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300030
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eddie James <eajames@linux.ibm.com>

The XDMA engine embedded in the AST2500 and AST2600 SOCs performs PCI
DMA operations between the SOC (acting as a BMC) and a host processor
in a server.

This commit adds a driver to control the XDMA engine and adds functions
to initialize the hardware and memory and start DMA operations.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/1588697905-23444-3-git-send-email-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 MAINTAINERS                      |   2 +
 drivers/soc/aspeed/Kconfig       |  11 +
 drivers/soc/aspeed/Makefile      |   1 +
 drivers/soc/aspeed/aspeed-xdma.c | 915 +++++++++++++++++++++++++++++++
 include/uapi/linux/aspeed-xdma.h |  38 ++
 5 files changed, 967 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-xdma.c
 create mode 100644 include/uapi/linux/aspeed-xdma.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8026b0337a0b1..cc6791d023ea7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3464,6 +3464,8 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/aspeed/xdma.yaml
+F:	drivers/soc/aspeed/aspeed-xdma.c
+F:	include/uapi/linux/aspeed-xdma.h
 
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 7a2a5bed8bc57..084c91eb301dc 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -59,6 +59,17 @@ config ASPEED_SBC
 	  Say yes to provide information about the secure boot controller in
 	  debugfs.
 
+config ASPEED_XDMA
+	tristate "ASPEED XDMA Engine Driver"
+	select REGMAP
+	select MFD_SYSCON
+	depends on HAS_DMA
+	help
+	  Enables support for the XDMA Engine found on the ASPEED BMC
+	  SoCs. The XDMA engine can perform PCIe DMA operations between the BMC
+	  and a host processor. The driver provides ioctl() interface to reset
+	  and initialize engine.
+
 endmenu
 
 endif
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index 042235ffa05b2..5f61bb4cc36cf 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
 obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
+obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
new file mode 100644
index 0000000000000..947e19323a1b5
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-xdma.c
@@ -0,0 +1,915 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright IBM Corp 2019
+
+#include <linux/aspeed-xdma.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/fs.h>
+#include <linux/genalloc.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/poll.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+
+#define DEVICE_NAME				"aspeed-xdma"
+
+#define SCU_AST2600_MISC_CTRL			0x0c0
+#define  SCU_AST2600_MISC_CTRL_XDMA_BMC		BIT(8)
+
+#define SCU_AST2600_DEBUG_CTRL			0x0c8
+#define  DEBUG_CTRL_XDMA_DISABLE		BIT(2)
+
+#define SCU_AST2500_PCIE_CONF			0x180
+#define SCU_AST2600_PCIE_CONF			0xc20
+#define  SCU_PCIE_CONF_VGA_EN			 BIT(0)
+#define  SCU_PCIE_CONF_VGA_EN_MMIO		 BIT(1)
+#define  SCU_PCIE_CONF_VGA_EN_LPC		 BIT(2)
+#define  SCU_PCIE_CONF_VGA_EN_MSI		 BIT(3)
+#define  SCU_PCIE_CONF_VGA_EN_MCTP		 BIT(4)
+#define  SCU_PCIE_CONF_VGA_EN_IRQ		 BIT(5)
+#define  SCU_PCIE_CONF_VGA_EN_DMA		 BIT(6)
+#define  SCU_PCIE_CONF_BMC_EN			 BIT(8)
+#define  SCU_PCIE_CONF_BMC_EN_MMIO		 BIT(9)
+#define  SCU_PCIE_CONF_BMC_EN_MSI		 BIT(11)
+#define  SCU_PCIE_CONF_BMC_EN_MCTP		 BIT(12)
+#define  SCU_PCIE_CONF_BMC_EN_IRQ		 BIT(13)
+#define  SCU_PCIE_CONF_BMC_EN_DMA		 BIT(14)
+
+#define SCU_AST2500_BMC_CLASS_REV		0x19c
+#define SCU_AST2600_BMC_CLASS_REV		0xc68
+#define  SCU_BMC_CLASS_REV_XDMA			 0xff000001
+
+#define XDMA_CMDQ_SIZE				PAGE_SIZE
+#define XDMA_NUM_CMDS				\
+	(XDMA_CMDQ_SIZE / sizeof(struct aspeed_xdma_cmd))
+
+/* Aspeed specification requires 100us after disabling the reset */
+#define XDMA_ENGINE_SETUP_TIME_MAX_US          1000
+#define XDMA_ENGINE_SETUP_TIME_MIN_US          100
+
+#define XDMA_CMD_AST2500_PITCH_SHIFT		3
+#define XDMA_CMD_AST2500_PITCH_BMC		GENMASK_ULL(62, 51)
+#define XDMA_CMD_AST2500_PITCH_HOST		GENMASK_ULL(46, 35)
+#define XDMA_CMD_AST2500_PITCH_UPSTREAM		BIT_ULL(31)
+#define XDMA_CMD_AST2500_PITCH_ADDR		GENMASK_ULL(29, 4)
+#define XDMA_CMD_AST2500_PITCH_ID		BIT_ULL(0)
+#define XDMA_CMD_AST2500_CMD_IRQ_EN		BIT_ULL(31)
+#define XDMA_CMD_AST2500_CMD_LINE_NO		GENMASK_ULL(27, 16)
+#define XDMA_CMD_AST2500_CMD_IRQ_BMC		BIT_ULL(15)
+#define XDMA_CMD_AST2500_CMD_LINE_SIZE_SHIFT	4
+#define XDMA_CMD_AST2500_CMD_LINE_SIZE		\
+	GENMASK_ULL(14, XDMA_CMD_AST2500_CMD_LINE_SIZE_SHIFT)
+#define XDMA_CMD_AST2500_CMD_ID			BIT_ULL(1)
+
+#define XDMA_CMD_AST2600_PITCH_BMC		GENMASK_ULL(62, 48)
+#define XDMA_CMD_AST2600_PITCH_HOST		GENMASK_ULL(46, 32)
+#define XDMA_CMD_AST2600_PITCH_ADDR		GENMASK_ULL(30, 0)
+#define XDMA_CMD_AST2600_CMD_64_EN		BIT_ULL(40)
+#define XDMA_CMD_AST2600_CMD_IRQ_BMC		BIT_ULL(37)
+#define XDMA_CMD_AST2600_CMD_IRQ_HOST		BIT_ULL(36)
+#define XDMA_CMD_AST2600_CMD_UPSTREAM		BIT_ULL(32)
+#define XDMA_CMD_AST2600_CMD_LINE_NO		GENMASK_ULL(27, 16)
+#define XDMA_CMD_AST2600_CMD_LINE_SIZE		GENMASK_ULL(14, 0)
+#define XDMA_CMD_AST2600_CMD_MULTILINE_SIZE	GENMASK_ULL(14, 12)
+
+#define XDMA_AST2500_QUEUE_ENTRY_SIZE		4
+#define XDMA_AST2500_HOST_CMDQ_ADDR0		0x00
+#define XDMA_AST2500_HOST_CMDQ_ENDP		0x04
+#define XDMA_AST2500_HOST_CMDQ_WRITEP		0x08
+#define XDMA_AST2500_HOST_CMDQ_READP		0x0c
+#define XDMA_AST2500_BMC_CMDQ_ADDR		0x10
+#define XDMA_AST2500_BMC_CMDQ_ENDP		0x14
+#define XDMA_AST2500_BMC_CMDQ_WRITEP		0x18
+#define XDMA_AST2500_BMC_CMDQ_READP		0x1c
+#define  XDMA_BMC_CMDQ_READP_RESET		 0xee882266
+#define XDMA_AST2500_CTRL			0x20
+#define  XDMA_AST2500_CTRL_US_COMP		 BIT(4)
+#define  XDMA_AST2500_CTRL_DS_COMP		 BIT(5)
+#define  XDMA_AST2500_CTRL_DS_DIRTY		 BIT(6)
+#define  XDMA_AST2500_CTRL_DS_SIZE_256		 BIT(17)
+#define  XDMA_AST2500_CTRL_DS_TIMEOUT		 BIT(28)
+#define  XDMA_AST2500_CTRL_DS_CHECK_ID		 BIT(29)
+#define XDMA_AST2500_STATUS			0x24
+#define  XDMA_AST2500_STATUS_US_COMP		 BIT(4)
+#define  XDMA_AST2500_STATUS_DS_COMP		 BIT(5)
+#define  XDMA_AST2500_STATUS_DS_DIRTY		 BIT(6)
+#define XDMA_AST2500_INPRG_DS_CMD1		0x38
+#define XDMA_AST2500_INPRG_DS_CMD2		0x3c
+#define XDMA_AST2500_INPRG_US_CMD00		0x40
+#define XDMA_AST2500_INPRG_US_CMD01		0x44
+#define XDMA_AST2500_INPRG_US_CMD10		0x48
+#define XDMA_AST2500_INPRG_US_CMD11		0x4c
+#define XDMA_AST2500_INPRG_US_CMD20		0x50
+#define XDMA_AST2500_INPRG_US_CMD21		0x54
+#define XDMA_AST2500_HOST_CMDQ_ADDR1		0x60
+#define XDMA_AST2500_VGA_CMDQ_ADDR0		0x64
+#define XDMA_AST2500_VGA_CMDQ_ENDP		0x68
+#define XDMA_AST2500_VGA_CMDQ_WRITEP		0x6c
+#define XDMA_AST2500_VGA_CMDQ_READP		0x70
+#define XDMA_AST2500_VGA_CMD_STATUS		0x74
+#define XDMA_AST2500_VGA_CMDQ_ADDR1		0x78
+
+#define XDMA_AST2600_QUEUE_ENTRY_SIZE		2
+#define XDMA_AST2600_HOST_CMDQ_ADDR0		0x00
+#define XDMA_AST2600_HOST_CMDQ_ADDR1		0x04
+#define XDMA_AST2600_HOST_CMDQ_ENDP		0x08
+#define XDMA_AST2600_HOST_CMDQ_WRITEP		0x0c
+#define XDMA_AST2600_HOST_CMDQ_READP		0x10
+#define XDMA_AST2600_BMC_CMDQ_ADDR		0x14
+#define XDMA_AST2600_BMC_CMDQ_ENDP		0x18
+#define XDMA_AST2600_BMC_CMDQ_WRITEP		0x1c
+#define XDMA_AST2600_BMC_CMDQ_READP		0x20
+#define XDMA_AST2600_VGA_CMDQ_ADDR0		0x24
+#define XDMA_AST2600_VGA_CMDQ_ADDR1		0x28
+#define XDMA_AST2600_VGA_CMDQ_ENDP		0x2c
+#define XDMA_AST2600_VGA_CMDQ_WRITEP		0x30
+#define XDMA_AST2600_VGA_CMDQ_READP		0x34
+#define XDMA_AST2600_CTRL			0x38
+#define  XDMA_AST2600_CTRL_US_COMP		 BIT(16)
+#define  XDMA_AST2600_CTRL_DS_COMP		 BIT(17)
+#define  XDMA_AST2600_CTRL_DS_DIRTY		 BIT(18)
+#define  XDMA_AST2600_CTRL_DS_SIZE_256		 BIT(20)
+#define XDMA_AST2600_STATUS			0x3c
+#define  XDMA_AST2600_STATUS_US_COMP		 BIT(16)
+#define  XDMA_AST2600_STATUS_DS_COMP		 BIT(17)
+#define  XDMA_AST2600_STATUS_DS_DIRTY		 BIT(18)
+#define XDMA_AST2600_INPRG_DS_CMD00		0x40
+#define XDMA_AST2600_INPRG_DS_CMD01		0x44
+#define XDMA_AST2600_INPRG_DS_CMD10		0x48
+#define XDMA_AST2600_INPRG_DS_CMD11		0x4c
+#define XDMA_AST2600_INPRG_DS_CMD20		0x50
+#define XDMA_AST2600_INPRG_DS_CMD21		0x54
+#define XDMA_AST2600_INPRG_US_CMD00		0x60
+#define XDMA_AST2600_INPRG_US_CMD01		0x64
+#define XDMA_AST2600_INPRG_US_CMD10		0x68
+#define XDMA_AST2600_INPRG_US_CMD11		0x6c
+#define XDMA_AST2600_INPRG_US_CMD20		0x70
+#define XDMA_AST2600_INPRG_US_CMD21		0x74
+
+struct aspeed_xdma_cmd {
+	u64 host_addr;
+	u64 pitch;
+	u64 cmd;
+	u64 reserved;
+};
+
+struct aspeed_xdma_regs {
+	u8 bmc_cmdq_addr;
+	u8 bmc_cmdq_endp;
+	u8 bmc_cmdq_writep;
+	u8 bmc_cmdq_readp;
+	u8 control;
+	u8 status;
+};
+
+struct aspeed_xdma_status_bits {
+	u32 us_comp;
+	u32 ds_comp;
+	u32 ds_dirty;
+};
+
+struct aspeed_xdma;
+
+struct aspeed_xdma_chip {
+	u32 control;
+	u32 scu_bmc_class;
+	u32 scu_misc_ctrl;
+	u32 scu_pcie_conf;
+	unsigned int queue_entry_size;
+	struct aspeed_xdma_regs regs;
+	struct aspeed_xdma_status_bits status_bits;
+	unsigned int (*set_cmd)(struct aspeed_xdma *ctx,
+				struct aspeed_xdma_cmd cmds[2],
+				struct aspeed_xdma_op *op, u32 bmc_addr);
+};
+
+struct aspeed_xdma_client;
+
+struct aspeed_xdma {
+	struct kobject kobj;
+	const struct aspeed_xdma_chip *chip;
+
+	int irq;
+	int pcie_irq;
+	struct clk *clock;
+	struct device *dev;
+	void __iomem *base;
+	resource_size_t res_size;
+	resource_size_t res_start;
+	struct reset_control *reset;
+	struct reset_control *reset_rc;
+
+	/* Protects current_client */
+	spinlock_t client_lock;
+	struct aspeed_xdma_client *current_client;
+
+	/* Protects engine configuration */
+	spinlock_t engine_lock;
+	struct aspeed_xdma_cmd *cmdq;
+	unsigned int cmd_idx;
+	bool in_reset;
+	bool upstream;
+
+	/* Queue waiters for idle engine */
+	wait_queue_head_t wait;
+
+	struct work_struct reset_work;
+
+	u32 mem_phys;
+	u32 mem_size;
+	void *mem_virt;
+	dma_addr_t mem_coherent;
+	dma_addr_t cmdq_phys;
+	struct gen_pool *pool;
+};
+
+struct aspeed_xdma_client {
+	struct aspeed_xdma *ctx;
+
+	bool error;
+	bool in_progress;
+	void *virt;
+	dma_addr_t phys;
+	u32 size;
+};
+
+static u32 aspeed_xdma_readl(struct aspeed_xdma *ctx, u8 reg)
+{
+	u32 v = readl(ctx->base + reg);
+
+	dev_dbg(ctx->dev, "read %02x[%08x]\n", reg, v);
+	return v;
+}
+
+static void aspeed_xdma_writel(struct aspeed_xdma *ctx, u8 reg, u32 val)
+{
+	writel(val, ctx->base + reg);
+	dev_dbg(ctx->dev, "write %02x[%08x]\n", reg, val);
+}
+
+static void aspeed_xdma_init_eng(struct aspeed_xdma *ctx)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->engine_lock, flags);
+	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_endp,
+			   ctx->chip->queue_entry_size * XDMA_NUM_CMDS);
+	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_readp,
+			   XDMA_BMC_CMDQ_READP_RESET);
+	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_writep, 0);
+	aspeed_xdma_writel(ctx, ctx->chip->regs.control, ctx->chip->control);
+	aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_addr, ctx->cmdq_phys);
+
+	ctx->cmd_idx = 0;
+	spin_unlock_irqrestore(&ctx->engine_lock, flags);
+}
+
+static unsigned int aspeed_xdma_ast2500_set_cmd(struct aspeed_xdma *ctx,
+						struct aspeed_xdma_cmd cmds[2],
+						struct aspeed_xdma_op *op,
+						u32 bmc_addr)
+{
+	unsigned int rc = 1;
+	unsigned int pitch = 1;
+	unsigned int line_no = 1;
+	unsigned int line_size = op->len >>
+		XDMA_CMD_AST2500_CMD_LINE_SIZE_SHIFT;
+	u64 cmd = XDMA_CMD_AST2500_CMD_IRQ_EN | XDMA_CMD_AST2500_CMD_IRQ_BMC |
+		XDMA_CMD_AST2500_CMD_ID;
+	u64 cmd_pitch = (op->direction ? XDMA_CMD_AST2500_PITCH_UPSTREAM : 0) |
+		XDMA_CMD_AST2500_PITCH_ID;
+
+	dev_dbg(ctx->dev, "xdma %s ast2500: bmc[%08x] len[%08x] host[%08x]\n",
+		op->direction ? "upstream" : "downstream", bmc_addr, op->len,
+		(u32)op->host_addr);
+
+	if (op->len > XDMA_CMD_AST2500_CMD_LINE_SIZE) {
+		unsigned int rem;
+		unsigned int total;
+
+		line_no = op->len / XDMA_CMD_AST2500_CMD_LINE_SIZE;
+		total = XDMA_CMD_AST2500_CMD_LINE_SIZE * line_no;
+		rem = (op->len - total) >>
+			XDMA_CMD_AST2500_CMD_LINE_SIZE_SHIFT;
+		line_size = XDMA_CMD_AST2500_CMD_LINE_SIZE;
+		pitch = line_size >> XDMA_CMD_AST2500_PITCH_SHIFT;
+		line_size >>= XDMA_CMD_AST2500_CMD_LINE_SIZE_SHIFT;
+
+		if (rem) {
+			u32 rbmc = bmc_addr + total;
+
+			cmds[1].host_addr = op->host_addr + (u64)total;
+			cmds[1].pitch = cmd_pitch |
+				((u64)rbmc & XDMA_CMD_AST2500_PITCH_ADDR) |
+				FIELD_PREP(XDMA_CMD_AST2500_PITCH_HOST, 1) |
+				FIELD_PREP(XDMA_CMD_AST2500_PITCH_BMC, 1);
+			cmds[1].cmd = cmd |
+				FIELD_PREP(XDMA_CMD_AST2500_CMD_LINE_NO, 1) |
+				FIELD_PREP(XDMA_CMD_AST2500_CMD_LINE_SIZE,
+					   rem);
+			cmds[1].reserved = 0ULL;
+
+			print_hex_dump_debug("xdma rem ", DUMP_PREFIX_OFFSET,
+					     16, 1, &cmds[1], sizeof(*cmds),
+					     true);
+
+			cmd &= ~(XDMA_CMD_AST2500_CMD_IRQ_EN |
+				 XDMA_CMD_AST2500_CMD_IRQ_BMC);
+
+			rc++;
+		}
+	}
+
+	cmds[0].host_addr = op->host_addr;
+	cmds[0].pitch = cmd_pitch |
+		((u64)bmc_addr & XDMA_CMD_AST2500_PITCH_ADDR) |
+		FIELD_PREP(XDMA_CMD_AST2500_PITCH_HOST, pitch) |
+		FIELD_PREP(XDMA_CMD_AST2500_PITCH_BMC, pitch);
+	cmds[0].cmd = cmd | FIELD_PREP(XDMA_CMD_AST2500_CMD_LINE_NO, line_no) |
+		FIELD_PREP(XDMA_CMD_AST2500_CMD_LINE_SIZE, line_size);
+	cmds[0].reserved = 0ULL;
+
+	print_hex_dump_debug("xdma cmd ", DUMP_PREFIX_OFFSET, 16, 1, cmds,
+			     sizeof(*cmds), true);
+
+	return rc;
+}
+
+static unsigned int aspeed_xdma_ast2600_set_cmd(struct aspeed_xdma *ctx,
+						struct aspeed_xdma_cmd cmds[2],
+						struct aspeed_xdma_op *op,
+						u32 bmc_addr)
+{
+	unsigned int rc = 1;
+	unsigned int pitch = 1;
+	unsigned int line_no = 1;
+	unsigned int line_size = op->len;
+	u64 cmd = XDMA_CMD_AST2600_CMD_IRQ_BMC |
+		(op->direction ? XDMA_CMD_AST2600_CMD_UPSTREAM : 0);
+
+	if (op->host_addr & 0xffffffff00000000ULL ||
+	    (op->host_addr + (u64)op->len) & 0xffffffff00000000ULL)
+		cmd |= XDMA_CMD_AST2600_CMD_64_EN;
+
+	dev_dbg(ctx->dev,
+		"xdma %s ast2600: bmc[%08x] len[%08x] host[%016llx]\n",
+		op->direction ? "upstream" : "downstream",
+		bmc_addr, op->len, op->host_addr);
+
+	if (op->len > XDMA_CMD_AST2600_CMD_LINE_SIZE) {
+		unsigned int rem;
+		unsigned int total;
+
+		line_no = op->len / XDMA_CMD_AST2600_CMD_MULTILINE_SIZE;
+		total = XDMA_CMD_AST2600_CMD_MULTILINE_SIZE * line_no;
+		rem = op->len - total;
+		line_size = XDMA_CMD_AST2600_CMD_MULTILINE_SIZE;
+		pitch = line_size;
+
+		if (rem) {
+			u32 rbmc = bmc_addr + total;
+
+			cmds[1].host_addr = op->host_addr + (u64)total;
+			cmds[1].pitch =
+				((u64)rbmc & XDMA_CMD_AST2600_PITCH_ADDR) |
+				FIELD_PREP(XDMA_CMD_AST2600_PITCH_HOST, 1) |
+				FIELD_PREP(XDMA_CMD_AST2600_PITCH_BMC, 1);
+			cmds[1].cmd = cmd |
+				FIELD_PREP(XDMA_CMD_AST2600_CMD_LINE_NO, 1) |
+				FIELD_PREP(XDMA_CMD_AST2600_CMD_LINE_SIZE,
+					   rem);
+			cmds[1].reserved = 0ULL;
+
+			print_hex_dump_debug("xdma rem ", DUMP_PREFIX_OFFSET,
+					     16, 1, &cmds[1], sizeof(*cmds),
+					     true);
+
+			cmd &= ~XDMA_CMD_AST2600_CMD_IRQ_BMC;
+
+			rc++;
+		}
+	}
+
+	cmds[0].host_addr = op->host_addr;
+	cmds[0].pitch = ((u64)bmc_addr & XDMA_CMD_AST2600_PITCH_ADDR) |
+		FIELD_PREP(XDMA_CMD_AST2600_PITCH_HOST, pitch) |
+		FIELD_PREP(XDMA_CMD_AST2600_PITCH_BMC, pitch);
+	cmds[0].cmd = cmd | FIELD_PREP(XDMA_CMD_AST2600_CMD_LINE_NO, line_no) |
+		FIELD_PREP(XDMA_CMD_AST2600_CMD_LINE_SIZE, line_size);
+	cmds[0].reserved = 0ULL;
+
+	print_hex_dump_debug("xdma cmd ", DUMP_PREFIX_OFFSET, 16, 1, cmds,
+			     sizeof(*cmds), true);
+
+	return rc;
+}
+
+static void aspeed_xdma_done(struct aspeed_xdma *ctx, bool error)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->client_lock, flags);
+	if (ctx->current_client) {
+		ctx->current_client->error = error;
+		ctx->current_client->in_progress = false;
+		ctx->current_client = NULL;
+	}
+	spin_unlock_irqrestore(&ctx->client_lock, flags);
+
+	wake_up_interruptible_all(&ctx->wait);
+}
+
+static irqreturn_t aspeed_xdma_irq(int irq, void *arg)
+{
+	struct aspeed_xdma *ctx = arg;
+	u32 status;
+
+	spin_lock(&ctx->engine_lock);
+	status = aspeed_xdma_readl(ctx, ctx->chip->regs.status);
+
+	if (status & ctx->chip->status_bits.ds_dirty) {
+		aspeed_xdma_done(ctx, true);
+	} else {
+		if (status & ctx->chip->status_bits.us_comp) {
+			if (ctx->upstream)
+				aspeed_xdma_done(ctx, false);
+		}
+
+		if (status & ctx->chip->status_bits.ds_comp) {
+			if (!ctx->upstream)
+				aspeed_xdma_done(ctx, false);
+		}
+	}
+
+	aspeed_xdma_writel(ctx, ctx->chip->regs.status, status);
+	spin_unlock(&ctx->engine_lock);
+
+	return IRQ_HANDLED;
+}
+
+static void aspeed_xdma_reset(struct aspeed_xdma *ctx)
+{
+	unsigned long flags;
+
+	reset_control_assert(ctx->reset);
+	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+		     XDMA_ENGINE_SETUP_TIME_MAX_US);
+	reset_control_deassert(ctx->reset);
+	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+		     XDMA_ENGINE_SETUP_TIME_MAX_US);
+
+	aspeed_xdma_init_eng(ctx);
+
+	aspeed_xdma_done(ctx, true);
+
+	spin_lock_irqsave(&ctx->engine_lock, flags);
+	ctx->in_reset = false;
+	spin_unlock_irqrestore(&ctx->engine_lock, flags);
+
+	wake_up_interruptible(&ctx->wait);
+}
+
+static void aspeed_xdma_reset_work(struct work_struct *work)
+{
+	struct aspeed_xdma *ctx = container_of(work, struct aspeed_xdma,
+					       reset_work);
+
+	aspeed_xdma_reset(ctx);
+}
+
+static irqreturn_t aspeed_xdma_pcie_irq(int irq, void *arg)
+{
+	struct aspeed_xdma *ctx = arg;
+
+	dev_dbg(ctx->dev, "PCI-E reset requested.\n");
+
+	spin_lock(&ctx->engine_lock);
+	if (ctx->in_reset) {
+		spin_unlock(&ctx->engine_lock);
+		return IRQ_HANDLED;
+	}
+
+	ctx->in_reset = true;
+	spin_unlock(&ctx->engine_lock);
+
+	schedule_work(&ctx->reset_work);
+	return IRQ_HANDLED;
+}
+
+static int aspeed_xdma_init_scu(struct aspeed_xdma *ctx, struct device *dev)
+{
+	struct regmap *scu = syscon_regmap_lookup_by_phandle(dev->of_node,
+							     "aspeed,scu");
+
+	if (!IS_ERR(scu)) {
+		u32 selection;
+		bool pcie_device_bmc = true;
+		const u32 bmc = SCU_PCIE_CONF_BMC_EN |
+			SCU_PCIE_CONF_BMC_EN_MSI | SCU_PCIE_CONF_BMC_EN_IRQ |
+			SCU_PCIE_CONF_BMC_EN_DMA;
+		const u32 vga = SCU_PCIE_CONF_VGA_EN |
+			SCU_PCIE_CONF_VGA_EN_MSI | SCU_PCIE_CONF_VGA_EN_IRQ |
+			SCU_PCIE_CONF_VGA_EN_DMA;
+		const char *pcie = NULL;
+
+		if (!of_property_read_string(dev->of_node,
+					     "aspeed,pcie-device", &pcie)) {
+			if (!strcmp(pcie, "vga")) {
+				pcie_device_bmc = false;
+			} else if (strcmp(pcie, "bmc")) {
+				dev_err(dev,
+					"Invalid pcie-device property %s.\n",
+					pcie);
+				return -EINVAL;
+			}
+		}
+
+		if (pcie_device_bmc) {
+			selection = bmc;
+			regmap_write(scu, ctx->chip->scu_bmc_class,
+				     SCU_BMC_CLASS_REV_XDMA);
+		} else {
+			selection = vga;
+		}
+
+		regmap_update_bits(scu, ctx->chip->scu_pcie_conf, bmc | vga,
+				   selection);
+
+		if (ctx->chip->scu_misc_ctrl) {
+			regmap_update_bits(scu, ctx->chip->scu_misc_ctrl,
+					   SCU_AST2600_MISC_CTRL_XDMA_BMC,
+					   SCU_AST2600_MISC_CTRL_XDMA_BMC);
+
+			/* Allow XDMA to be used on AST2600 */
+			regmap_update_bits(scu, SCU_AST2600_DEBUG_CTRL,
+					   DEBUG_CTRL_XDMA_DISABLE, 0);
+		}
+	} else {
+		dev_warn(dev, "Unable to configure PCIe: %ld; continuing.\n",
+			 PTR_ERR(scu));
+	}
+
+	return 0;
+}
+
+static void aspeed_xdma_kobject_release(struct kobject *kobj)
+{
+	struct aspeed_xdma *ctx = container_of(kobj, struct aspeed_xdma, kobj);
+
+	if (ctx->pcie_irq >= 0)
+		free_irq(ctx->pcie_irq, ctx);
+
+	gen_pool_free(ctx->pool, (unsigned long)ctx->cmdq, XDMA_CMDQ_SIZE);
+
+	gen_pool_destroy(ctx->pool);
+
+	dma_free_coherent(ctx->dev, ctx->mem_size, ctx->mem_virt,
+			  ctx->mem_coherent);
+
+	if (ctx->reset_rc)
+		reset_control_put(ctx->reset_rc);
+	reset_control_put(ctx->reset);
+
+	clk_put(ctx->clock);
+
+	free_irq(ctx->irq, ctx);
+
+	iounmap(ctx->base);
+	release_mem_region(ctx->res_start, ctx->res_size);
+
+	kfree(ctx);
+}
+
+static const struct kobj_type aspeed_xdma_kobject_type = {
+	.release = aspeed_xdma_kobject_release,
+};
+
+static int aspeed_xdma_iomap(struct aspeed_xdma *ctx,
+			     struct platform_device *pdev)
+{
+	resource_size_t size;
+	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res)
+		return -ENOMEM;
+
+	size = resource_size(res);
+	if (!request_mem_region(res->start, size, dev_name(ctx->dev)))
+		return -ENOMEM;
+
+	ctx->base = ioremap(res->start, size);
+	if (!ctx->base) {
+		release_mem_region(res->start, size);
+		return -ENOMEM;
+	}
+
+	ctx->res_start = res->start;
+	ctx->res_size = size;
+
+	return 0;
+}
+
+static int aspeed_xdma_probe(struct platform_device *pdev)
+{
+	int rc;
+	struct aspeed_xdma *ctx;
+	struct reserved_mem *mem;
+	struct device *dev = &pdev->dev;
+	struct device_node *memory_region;
+	const void *md = of_device_get_match_data(dev);
+
+	if (!md)
+		return -ENODEV;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->chip = md;
+	ctx->dev = dev;
+	platform_set_drvdata(pdev, ctx);
+	spin_lock_init(&ctx->client_lock);
+	spin_lock_init(&ctx->engine_lock);
+	INIT_WORK(&ctx->reset_work, aspeed_xdma_reset_work);
+	init_waitqueue_head(&ctx->wait);
+
+	rc = aspeed_xdma_iomap(ctx, pdev);
+	if (rc) {
+		dev_err(dev, "Failed to map registers.\n");
+		goto err_nomap;
+	}
+
+	ctx->irq = platform_get_irq(pdev, 0);
+	if (ctx->irq < 0) {
+		dev_err(dev, "Failed to find IRQ.\n");
+		rc = ctx->irq;
+		goto err_noirq;
+	}
+
+	rc = request_irq(ctx->irq, aspeed_xdma_irq, 0, DEVICE_NAME, ctx);
+	if (rc < 0) {
+		dev_err(dev, "Failed to request IRQ %d.\n", ctx->irq);
+		goto err_noirq;
+	}
+
+	ctx->clock = clk_get(dev, NULL);
+	if (IS_ERR(ctx->clock)) {
+		dev_err(dev, "Failed to request clock.\n");
+		rc = PTR_ERR(ctx->clock);
+		goto err_noclk;
+	}
+
+	ctx->reset = reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(ctx->reset)) {
+		dev_err(dev, "Failed to request reset control.\n");
+		rc = PTR_ERR(ctx->reset);
+		goto err_noreset;
+	}
+
+	ctx->reset_rc = reset_control_get_exclusive(dev, "root-complex");
+	if (IS_ERR(ctx->reset_rc)) {
+		dev_dbg(dev, "Failed to request reset RC control.\n");
+		ctx->reset_rc = NULL;
+	}
+
+	memory_region = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!memory_region) {
+		dev_err(dev, "Failed to find memory-region.\n");
+		rc = -ENOMEM;
+		goto err_nomem;
+	}
+
+	mem = of_reserved_mem_lookup(memory_region);
+	of_node_put(memory_region);
+	if (!mem) {
+		dev_err(dev, "Failed to find reserved memory.\n");
+		rc = -ENOMEM;
+		goto err_nomem;
+	}
+
+	ctx->mem_phys = mem->base;
+	ctx->mem_size = mem->size;
+
+	rc = of_reserved_mem_device_init(dev);
+	if (rc) {
+		dev_err(dev, "Failed to init reserved memory.\n");
+		goto err_nomem;
+	}
+
+	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (rc) {
+		dev_err(dev, "Failed to mask DMA.\n");
+		goto err_nomem;
+	}
+
+	ctx->mem_virt = dma_alloc_coherent(dev, ctx->mem_size,
+					   &ctx->mem_coherent, __GFP_NOWARN);
+	if (!ctx->mem_virt) {
+		dev_err(dev, "Failed to allocate reserved memory.\n");
+		rc = -ENOMEM;
+		goto err_nomem;
+	}
+
+	ctx->pool = gen_pool_create(ilog2(PAGE_SIZE), -1);
+	if (!ctx->pool) {
+		dev_err(dev, "Failed to setup genalloc pool.\n");
+		rc = -ENOMEM;
+		goto err_nopool;
+	}
+
+	rc = gen_pool_add_virt(ctx->pool, (unsigned long)ctx->mem_virt,
+			       ctx->mem_phys, ctx->mem_size, -1);
+	if (rc) {
+		dev_err(ctx->dev, "Failed to add memory to genalloc pool.\n");
+		goto err_pool_scu_clk;
+	}
+
+	rc = aspeed_xdma_init_scu(ctx, dev);
+	if (rc)
+		goto err_pool_scu_clk;
+
+	rc = clk_prepare_enable(ctx->clock);
+	if (rc) {
+		dev_err(dev, "Failed to enable the clock.\n");
+		goto err_pool_scu_clk;
+	}
+
+	if (ctx->reset_rc) {
+		rc = reset_control_deassert(ctx->reset_rc);
+		if (rc) {
+			dev_err(dev, "Failed to clear the RC reset.\n");
+			goto err_reset_rc;
+		}
+		usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+			     XDMA_ENGINE_SETUP_TIME_MAX_US);
+	}
+
+	rc = reset_control_deassert(ctx->reset);
+	if (rc) {
+		dev_err(dev, "Failed to clear the reset.\n");
+		goto err_reset;
+	}
+	usleep_range(XDMA_ENGINE_SETUP_TIME_MIN_US,
+		     XDMA_ENGINE_SETUP_TIME_MAX_US);
+
+	ctx->cmdq = gen_pool_dma_alloc(ctx->pool, XDMA_CMDQ_SIZE,
+				       &ctx->cmdq_phys);
+	if (!ctx->cmdq) {
+		dev_err(ctx->dev, "Failed to genalloc cmdq.\n");
+		rc = -ENOMEM;
+		goto err_pool;
+	}
+
+	aspeed_xdma_init_eng(ctx);
+
+	/*
+	 * This interrupt could fire immediately so only request it once the
+	 * engine and driver are initialized.
+	 */
+	ctx->pcie_irq = platform_get_irq(pdev, 1);
+	if (ctx->pcie_irq < 0) {
+		dev_warn(dev, "Failed to find PCI-E IRQ.\n");
+	} else {
+		rc = request_irq(ctx->pcie_irq, aspeed_xdma_pcie_irq,
+				 IRQF_SHARED, DEVICE_NAME, ctx);
+		if (rc < 0) {
+			dev_warn(dev, "Failed to request PCI-E IRQ %d.\n", rc);
+			ctx->pcie_irq = -1;
+		}
+	}
+
+	kobject_init(&ctx->kobj, &aspeed_xdma_kobject_type);
+	return 0;
+
+err_pool:
+	reset_control_assert(ctx->reset);
+err_reset:
+	if (ctx->reset_rc)
+		reset_control_assert(ctx->reset_rc);
+err_reset_rc:
+	clk_disable_unprepare(ctx->clock);
+err_pool_scu_clk:
+	gen_pool_destroy(ctx->pool);
+err_nopool:
+	dma_free_coherent(ctx->dev, ctx->mem_size, ctx->mem_virt,
+			  ctx->mem_coherent);
+err_nomem:
+	if (ctx->reset_rc)
+		reset_control_put(ctx->reset_rc);
+	reset_control_put(ctx->reset);
+err_noreset:
+	clk_put(ctx->clock);
+err_noclk:
+	free_irq(ctx->irq, ctx);
+err_noirq:
+	iounmap(ctx->base);
+	release_mem_region(ctx->res_start, ctx->res_size);
+err_nomap:
+	kfree(ctx);
+	return rc;
+}
+
+static void aspeed_xdma_remove(struct platform_device *pdev)
+{
+	struct aspeed_xdma *ctx = platform_get_drvdata(pdev);
+
+	reset_control_assert(ctx->reset);
+	if (ctx->reset_rc)
+		reset_control_assert(ctx->reset_rc);
+	clk_disable_unprepare(ctx->clock);
+
+	aspeed_xdma_done(ctx, true);
+
+	kobject_put(&ctx->kobj);
+}
+
+static const struct aspeed_xdma_chip aspeed_ast2500_xdma_chip = {
+	.control = XDMA_AST2500_CTRL_US_COMP | XDMA_AST2500_CTRL_DS_COMP |
+		XDMA_AST2500_CTRL_DS_DIRTY | XDMA_AST2500_CTRL_DS_SIZE_256 |
+		XDMA_AST2500_CTRL_DS_TIMEOUT | XDMA_AST2500_CTRL_DS_CHECK_ID,
+	.scu_bmc_class = SCU_AST2500_BMC_CLASS_REV,
+	.scu_misc_ctrl = 0,
+	.scu_pcie_conf = SCU_AST2500_PCIE_CONF,
+	.queue_entry_size = XDMA_AST2500_QUEUE_ENTRY_SIZE,
+	.regs = {
+		.bmc_cmdq_addr = XDMA_AST2500_BMC_CMDQ_ADDR,
+		.bmc_cmdq_endp = XDMA_AST2500_BMC_CMDQ_ENDP,
+		.bmc_cmdq_writep = XDMA_AST2500_BMC_CMDQ_WRITEP,
+		.bmc_cmdq_readp = XDMA_AST2500_BMC_CMDQ_READP,
+		.control = XDMA_AST2500_CTRL,
+		.status = XDMA_AST2500_STATUS,
+	},
+	.status_bits = {
+		.us_comp = XDMA_AST2500_STATUS_US_COMP,
+		.ds_comp = XDMA_AST2500_STATUS_DS_COMP,
+		.ds_dirty = XDMA_AST2500_STATUS_DS_DIRTY,
+	},
+	.set_cmd = aspeed_xdma_ast2500_set_cmd,
+};
+
+static const struct aspeed_xdma_chip aspeed_ast2600_xdma_chip = {
+	.control = XDMA_AST2600_CTRL_US_COMP | XDMA_AST2600_CTRL_DS_COMP |
+		XDMA_AST2600_CTRL_DS_DIRTY | XDMA_AST2600_CTRL_DS_SIZE_256,
+	.scu_bmc_class = SCU_AST2600_BMC_CLASS_REV,
+	.scu_misc_ctrl = SCU_AST2600_MISC_CTRL,
+	.scu_pcie_conf = SCU_AST2600_PCIE_CONF,
+	.queue_entry_size = XDMA_AST2600_QUEUE_ENTRY_SIZE,
+	.regs = {
+		.bmc_cmdq_addr = XDMA_AST2600_BMC_CMDQ_ADDR,
+		.bmc_cmdq_endp = XDMA_AST2600_BMC_CMDQ_ENDP,
+		.bmc_cmdq_writep = XDMA_AST2600_BMC_CMDQ_WRITEP,
+		.bmc_cmdq_readp = XDMA_AST2600_BMC_CMDQ_READP,
+		.control = XDMA_AST2600_CTRL,
+		.status = XDMA_AST2600_STATUS,
+	},
+	.status_bits = {
+		.us_comp = XDMA_AST2600_STATUS_US_COMP,
+		.ds_comp = XDMA_AST2600_STATUS_DS_COMP,
+		.ds_dirty = XDMA_AST2600_STATUS_DS_DIRTY,
+	},
+	.set_cmd = aspeed_xdma_ast2600_set_cmd,
+};
+
+static const struct of_device_id aspeed_xdma_match[] = {
+	{
+		.compatible = "aspeed,ast2500-xdma",
+		.data = &aspeed_ast2500_xdma_chip,
+	},
+	{
+		.compatible = "aspeed,ast2600-xdma",
+		.data = &aspeed_ast2600_xdma_chip,
+	},
+	{ },
+};
+
+static struct platform_driver aspeed_xdma_driver = {
+	.probe = aspeed_xdma_probe,
+	.remove = aspeed_xdma_remove,
+	.driver = {
+		.name = DEVICE_NAME,
+		.of_match_table = aspeed_xdma_match,
+	},
+};
+
+module_platform_driver(aspeed_xdma_driver);
+
+MODULE_AUTHOR("Eddie James");
+MODULE_DESCRIPTION("ASPEED XDMA Engine Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/linux/aspeed-xdma.h b/include/uapi/linux/aspeed-xdma.h
new file mode 100644
index 0000000000000..2efaa6067c39b
--- /dev/null
+++ b/include/uapi/linux/aspeed-xdma.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/* Copyright IBM Corp 2019 */
+
+#ifndef _UAPI_LINUX_ASPEED_XDMA_H_
+#define _UAPI_LINUX_ASPEED_XDMA_H_
+
+#include <linux/types.h>
+
+/*
+ * aspeed_xdma_direction
+ *
+ * ASPEED_XDMA_DIRECTION_DOWNSTREAM: transfers data from the host to the BMC
+ *
+ * ASPEED_XDMA_DIRECTION_UPSTREAM: transfers data from the BMC to the host
+ */
+enum aspeed_xdma_direction {
+	ASPEED_XDMA_DIRECTION_DOWNSTREAM = 0,
+	ASPEED_XDMA_DIRECTION_UPSTREAM,
+};
+
+/*
+ * aspeed_xdma_op
+ *
+ * host_addr: the DMA address on the host side, typically configured by PCI
+ *            subsystem
+ *
+ * len: the size of the transfer in bytes
+ *
+ * direction: an enumerator indicating the direction of the DMA operation; see
+ *            enum aspeed_xdma_direction
+ */
+struct aspeed_xdma_op {
+	__u64 host_addr;
+	__u32 len;
+	__u32 direction;
+};
+
+#endif /* _UAPI_LINUX_ASPEED_XDMA_H_ */
-- 
2.48.1


