Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C539450EE88
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQMb4KWYz2yZf
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:10:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=FxwvkB3H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=01100c5ac3=nick.hawkins@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=FxwvkB3H; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kkr5P46xwz2xZB
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 07:19:20 +1000 (AEST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23LEupRW006862;
 Thu, 21 Apr 2022 19:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject : date : message-id; s=pps0720;
 bh=uW4SyuiVw9PU+qPXtI1Whs651+gnq6HBqlXy5wzry7Q=;
 b=FxwvkB3HfcBg+F+Rx1j52gBdSYiMMeaZfn5XMKCTGUB5C2zGn/uc2WYPTZCMXu1KCV5B
 SZG4jP7kL2nXyq3wlm5ltaGRsF6qd/vD0HsryOz24xPMPLDnPdFbI1w0p6TIH43mf4lt
 fFS10w4PAdBzLbqV9/r9pgEq44tPlfR37HJeDSL9Mj6PvyDcxpglqO1cH9c9JGrUuWJT
 xKnNL+Aos7443VfTblT3OKlzmUHXAmil0LdSAPk65YyQ3NDUe1nr0UpUqBZ2r5306FoA
 zT5VdE13NTIxa8tO1LzQF09z5e59W6YC2P++d5UBbxrCeQ8kbSvhPC8/I3FsoVy9Kltr aw== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3fk9fkt6aj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 19:19:37 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net
 [16.220.97.129])
 by g9t5008.houston.hpe.com (Postfix) with ESMTP id 4454C56;
 Thu, 21 Apr 2022 19:19:36 +0000 (UTC)
Received: from hpe.com (cigateway-dev.us.rdlabs.hpecorp.net [10.14.73.30])
 by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 0AE494A;
 Thu, 21 Apr 2022 19:19:36 +0000 (UTC)
From: nick.hawkins@hpe.com
To: verdun@hpe.com, nick.hawkins@hpe.com, joel@jms.id.au, arnd@arndb.de,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 01/11] aach: arm: mach-hpe: Introduce the HPE GXP
 architecture
Date: Thu, 21 Apr 2022 14:21:21 -0500
Message-Id: <20220421192132.109954-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: Wsf7jUZk-JyPHzYZ0DFjRYcQZI3cyhvL
X-Proofpoint-ORIG-GUID: Wsf7jUZk-JyPHzYZ0DFjRYcQZI3cyhvL
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-21_04,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204210102
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
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
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Nick Hawkins <nick.hawkins@hpe.com>

The GXP is the HPE BMC SoC that is used in the majority
of HPE Generation 10 servers. Traditionally the asic will
last multiple generations of server before being replaced.
In gxp.c we reset the EHCI controller early to boot the asic.

Info about SoC:

HPE GXP is the name of the HPE Soc. This SoC is used to implement
many BMC features at HPE. It supports ARMv7 architecture based on
the Cortex A9 core. It is capable of using an AXI bus to which
a memory controller is attached. It has multiple SPI interfaces
to connect boot flash and BIOS flash. It uses a 10/100/1000 MAC
for network connectivity. It has multiple i2c engines to drive
connectivity with a host infrastructure. The initial patches
enable the watchdog and timer enabling the host to be able to
boot.

Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

---
v5:
* Fixed version log
v4:
* Removed unecessary code: restart, iomap, init_machine
* Reordered Kconfig depends
* Removed SPARSE_IRQ, MULTI_IRQ_HANDLER, IRQ_DOMAIN, PINCTL from
  Kconfig
v3:
* Put into proper patchset format
v2:
* No change
---
 arch/arm/Kconfig           |  2 ++
 arch/arm/Makefile          |  1 +
 arch/arm/mach-hpe/Kconfig  | 17 +++++++++++++++++
 arch/arm/mach-hpe/Makefile |  1 +
 arch/arm/mach-hpe/gxp.c    | 16 ++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 arch/arm/mach-hpe/Kconfig
 create mode 100644 arch/arm/mach-hpe/Makefile
 create mode 100644 arch/arm/mach-hpe/gxp.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e8091e2d8a8..13f77eec7c40 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -620,6 +620,8 @@ source "arch/arm/mach-highbank/Kconfig"
 
 source "arch/arm/mach-hisi/Kconfig"
 
+source "arch/arm/mach-hpe/Kconfig"
+
 source "arch/arm/mach-imx/Kconfig"
 
 source "arch/arm/mach-integrator/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a2391b8de5a5..97a89023c10f 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -179,6 +179,7 @@ machine-$(CONFIG_ARCH_FOOTBRIDGE)	+= footbridge
 machine-$(CONFIG_ARCH_GEMINI)		+= gemini
 machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
 machine-$(CONFIG_ARCH_HISI)		+= hisi
+machine-$(CONFIG_ARCH_HPE)		+= hpe
 machine-$(CONFIG_ARCH_INTEGRATOR)	+= integrator
 machine-$(CONFIG_ARCH_IOP32X)		+= iop32x
 machine-$(CONFIG_ARCH_IXP4XX)		+= ixp4xx
diff --git a/arch/arm/mach-hpe/Kconfig b/arch/arm/mach-hpe/Kconfig
new file mode 100644
index 000000000000..c075248b259e
--- /dev/null
+++ b/arch/arm/mach-hpe/Kconfig
@@ -0,0 +1,17 @@
+menuconfig ARCH_HPE
+	bool "HPE SoC support"
+	depends on ARCH_MULTI_V7
+	help
+	  This enables support for HPE ARM based SoC chips
+if ARCH_HPE
+
+config ARCH_HPE_GXP
+	bool "HPE GXP SoC"
+	depends on ARCH_MULTI_V7
+	select ARM_VIC
+	select GENERIC_IRQ_CHIP
+	select CLKSRC_MMIO
+	help
+	  Support for GXP SoCs
+
+endif
diff --git a/arch/arm/mach-hpe/Makefile b/arch/arm/mach-hpe/Makefile
new file mode 100644
index 000000000000..8b0a91234df4
--- /dev/null
+++ b/arch/arm/mach-hpe/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_ARCH_HPE_GXP) += gxp.o
diff --git a/arch/arm/mach-hpe/gxp.c b/arch/arm/mach-hpe/gxp.c
new file mode 100644
index 000000000000..e2f0c3ae6bd8
--- /dev/null
+++ b/arch/arm/mach-hpe/gxp.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P.*/
+
+#include <linux/of_platform.h>
+#include <asm/mach/arch.h>
+
+static const char * const gxp_board_dt_compat[] = {
+	"hpe,gxp",
+	NULL,
+};
+
+DT_MACHINE_START(GXP_DT, "HPE GXP")
+	.dt_compat	= gxp_board_dt_compat,
+	.l2c_aux_val = 0,
+	.l2c_aux_mask = 0,
+MACHINE_END
-- 
2.17.1

