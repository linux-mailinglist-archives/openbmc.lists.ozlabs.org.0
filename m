Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB25355E6
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 00:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8MLl39mKz3bqR
	for <lists+openbmc@lfdr.de>; Fri, 27 May 2022 08:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TTKq/28o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TTKq/28o;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8ML30Hgyz3blZ
	for <openbmc@lists.ozlabs.org>; Fri, 27 May 2022 07:59:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24QLhUBc021083;
	Thu, 26 May 2022 21:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HeP4hjGYcitAL7TBBY4feaR3zZo5zw3ZW2IUzs7qWXY=;
 b=TTKq/28ov5QPxI58/n193FXjMWeLgtFnc1LFLeS4/Qx0ugvywrRQjXGnF2tWSEZgum6z
 Ncpa0EojD0kKtXX9Vrz6iK5HKUXGr9AaO6KF3ONiezMu9VFFq3AfzlLeh4coxQgpVpm0
 2vsYgtyXD5geuJCkPkoeQoEKHA8BFf9IANAZ+og8pAJ9vV2IGkUQB7YoHMvQ4s0tW6x4
 V8JiiqsVgItRs95YnCKjsSre/xcIkaJzk+FJamGlbEtjjAaDpuAnyqbaYUHak5bizzuz
 8v3U66cj4QDPAEkApyKN4g+8P5onVXIaOwZunSZUv++YzeX4FddRdzq/+5CjEk/gK9Mu JA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gahqb06qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 21:59:51 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24QLoZaf021323;
	Thu, 26 May 2022 21:59:50 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01wdc.us.ibm.com with ESMTP id 3gaas1as78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 May 2022 21:59:50 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24QLxnjX10748660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 May 2022 21:59:49 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0F47136060;
	Thu, 26 May 2022 21:59:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 675FB13604F;
	Thu, 26 May 2022 21:59:49 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.46.254])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 26 May 2022 21:59:49 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] board: ast2600-ibm: Add AST2600 BMC based POWER10+ servers
Date: Thu, 26 May 2022 16:59:45 -0500
Message-Id: <20220526215945.70791-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e1i5XDkvXsf7Eze3vWJLe0EP2N7np4Hw
X-Proofpoint-ORIG-GUID: e1i5XDkvXsf7Eze3vWJLe0EP2N7np4Hw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-26_11,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205260100
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Support IBM-specific options for POWER10+ servers built on AST2600
BMC.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Changes since v1:
  - Drop the defconfig in favor of yocto fragment
  - remove __weak for board init
  - select BOARD_LATE_INIT

 arch/arm/mach-aspeed/ast2600/Kconfig |  9 ++++++
 board/aspeed/ast2600_ibm/Kconfig     | 13 +++++++++
 board/aspeed/ast2600_ibm/Makefile    |  1 +
 board/aspeed/ast2600_ibm/ibm.c       | 43 ++++++++++++++++++++++++++++
 4 files changed, 66 insertions(+)
 create mode 100644 board/aspeed/ast2600_ibm/Kconfig
 create mode 100644 board/aspeed/ast2600_ibm/Makefile
 create mode 100644 board/aspeed/ast2600_ibm/ibm.c

diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
index fcdc425de5..46cc1ad1db 100644
--- a/arch/arm/mach-aspeed/ast2600/Kconfig
+++ b/arch/arm/mach-aspeed/ast2600/Kconfig
@@ -31,6 +31,14 @@ config TARGET_SLT_AST2600
 	help
 	  SLT-AST2600 is Aspeed SLT board for AST2600 chip.
 
+config TARGET_AST2600_IBM
+	bool "AST2600-IBM"
+	select BOARD_LATE_INIT
+	select TPM
+	select TPM2_TIS_I2C
+	help
+	  AST2600-IBM is IBM boards for AST2600 BMC based P0WER10+ servers
+
 config TARGET_AST2600_INTEL
 	bool "AST2600-INTEL"
 	depends on ASPEED_AST2600
@@ -43,6 +51,7 @@ endchoice
 source "board/aspeed/evb_ast2600/Kconfig"
 source "board/aspeed/fpga_ast2600/Kconfig"
 source "board/aspeed/slt_ast2600/Kconfig"
+source "board/aspeed/ast2600_ibm/Kconfig"
 source "board/aspeed/ast2600_intel/Kconfig"
 
 endif
diff --git a/board/aspeed/ast2600_ibm/Kconfig b/board/aspeed/ast2600_ibm/Kconfig
new file mode 100644
index 0000000000..38ee579ed7
--- /dev/null
+++ b/board/aspeed/ast2600_ibm/Kconfig
@@ -0,0 +1,13 @@
+if TARGET_AST2600_IBM
+
+config SYS_BOARD
+	default "ast2600_ibm"
+
+config SYS_VENDOR
+	default "aspeed"
+
+config SYS_CONFIG_NAME
+	string "board configuration name"
+	default "ast2600_ibm"
+
+endif
diff --git a/board/aspeed/ast2600_ibm/Makefile b/board/aspeed/ast2600_ibm/Makefile
new file mode 100644
index 0000000000..ae1aded893
--- /dev/null
+++ b/board/aspeed/ast2600_ibm/Makefile
@@ -0,0 +1 @@
+obj-y += ibm.o
diff --git a/board/aspeed/ast2600_ibm/ibm.c b/board/aspeed/ast2600_ibm/ibm.c
new file mode 100644
index 0000000000..37f469435f
--- /dev/null
+++ b/board/aspeed/ast2600_ibm/ibm.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2022 IBM Corp.
+ */
+
+#include <common.h>
+#include <dm/uclass.h>
+#include <tpm-common.h>
+#include <tpm-v2.h>
+
+int board_late_init(void)
+{
+	int rc;
+	struct udevice *dev;
+	/*
+	 * The digest is just an arbitrary sequence for now to ensure that the
+	 * TPM gets "poisoned."
+	 */
+	const unsigned char digest[32] = {
+		0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x00, 0x01,
+		0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
+		0xa0, 0xb1, 0xc2, 0xd3, 0xe4, 0xf5, 0x06, 0x17,
+		0x28, 0x39, 0x4a, 0x5b, 0x6c, 0x7d, 0x8e, 0x9f
+	};
+
+	rc = uclass_first_device_err(UCLASS_TPM, &dev);
+	if (rc)
+		return 0;
+
+	rc = tpm_init(dev);
+	if (rc)
+		return 0;
+
+	rc = tpm2_startup(dev, TPM2_SU_CLEAR);
+	if (rc)
+		return 0;
+
+	rc = tpm2_pcr_extend(dev, 0, digest);
+	if (!rc)
+		printf("TPM: PCR0 extended.\n");
+
+	return 0;
+}
-- 
2.27.0

