Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FE67B8AA
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 18:34:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29vf2STcz3cfW
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 04:34:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6+FXkXj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6+FXkXj;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29pk2sthz3cLb
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 04:30:38 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PG7BW5019261;
	Wed, 25 Jan 2023 17:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=61JLiUjFEpq7uQ95BWgmRbzf20v+kygM2d96jIcj7qA=;
 b=m6+FXkXjcBzWAqefcsanQAyJmLqwTs6DK7HDUM/la/jMFtbeYEGTcSI4DHeA6XeJNcZn
 CY+yw7y9h6UTW1I9UxZKwvUyvNtt1OvvDzU9bSryEIh3D86mGJ1vvOEyLk+/s0Mqwc0d
 yhePY+8ppCWXi6DodwJ+CndtlkublluLiE+ivlI6DtQcFTBSP6/9IXgr6clZ0wWM3NsP
 W4BfrN83M7sleLPyZeJLPByvCoru3TlrK1e6e5JqUXkd85RzojlLuMnCH+YN71roGdOF
 HOjdECFRvpMCH1vVaroe+joOukacNDkKEjpCQz0GckeFlwJ4mkW6TUGaWcnFjXoYMxfm lQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nac214epe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:32 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30PH08K8004817;
	Wed, 25 Jan 2023 17:30:31 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3n87p879sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:31 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30PHUUJI30278276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:30:30 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D2405805D;
	Wed, 25 Jan 2023 17:30:30 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5C325805C;
	Wed, 25 Jan 2023 17:30:29 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.150.21])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 17:30:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] ast2600: Measure the boot
Date: Wed, 25 Jan 2023 11:30:25 -0600
Message-Id: <20230125173025.3725606-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230125173025.3725606-1-eajames@linux.ibm.com>
References: <20230125173025.3725606-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nfjlzmgbKD2datj4yDdYxS1qxbjqVktz
X-Proofpoint-ORIG-GUID: nfjlzmgbKD2datj4yDdYxS1qxbjqVktz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_11,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250147
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the configuration option for measured boot and add the
event log reserved memory to the device tree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/dts/ast2600-p10bmc.dts            | 22 ++++++++++++++
 board/aspeed/ast2600_ibm/ibm.c             | 34 ----------------------
 configs/ast2600_openbmc_spl_emmc_defconfig |  1 +
 3 files changed, 23 insertions(+), 34 deletions(-)

diff --git a/arch/arm/dts/ast2600-p10bmc.dts b/arch/arm/dts/ast2600-p10bmc.dts
index 1d0f88bf96..f6b5db5b50 100755
--- a/arch/arm/dts/ast2600-p10bmc.dts
+++ b/arch/arm/dts/ast2600-p10bmc.dts
@@ -13,6 +13,17 @@
 		reg = <0x80000000 0x40000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		event_log: tcg_event_log@b3d00000 {
+			no-map;
+			reg = <0xb3d00000 0x100000>;
+		};
+	};
+
 	chosen {
 		stdout-path = &uart5;
 	};
@@ -107,12 +118,23 @@
 	u-boot,dm-pre-reloc;
 };
 
+&i2c {
+	u-boot,dm-pre-reloc;
+};
+
+&i2cglobal {
+	u-boot,dm-pre-reloc;
+};
+
 &i2c12 {
+	u-boot,dm-pre-reloc;
 	status = "okay";
 
 	tpm@2e {
+		u-boot,dm-pre-reloc;
 		compatible = "nuvoton,npct75x";
 		reg = <0x2e>;
+		memory-region = <&event_log>;
 	};
 };
 
diff --git a/board/aspeed/ast2600_ibm/ibm.c b/board/aspeed/ast2600_ibm/ibm.c
index 3782bbdee2..7e402932a5 100644
--- a/board/aspeed/ast2600_ibm/ibm.c
+++ b/board/aspeed/ast2600_ibm/ibm.c
@@ -3,41 +3,7 @@
  * Copyright 2022 IBM Corp.
  */
 
-#include <common.h>
-#include <dm/uclass.h>
-#include <tpm-common.h>
-#include <tpm-v2.h>
-
 int board_late_init(void)
 {
-	int rc;
-	struct udevice *dev;
-	/*
-	 * The digest is just an arbitrary sequence for now to ensure that the
-	 * TPM gets "poisoned."
-	 */
-	const unsigned char digest[32] = {
-		0x6e, 0x65, 0x76, 0x65, 0x72, 0x67, 0x6f, 0x6e,
-		0x6e, 0x61, 0x67, 0x69, 0x76, 0x65, 0x79, 0x6f,
-		0x75, 0x75, 0x70, 0x6e, 0x65, 0x76, 0x65, 0x72,
-		0x67, 0x6f, 0x6e, 0x6e, 0x61, 0x6c, 0x65, 0x74
-	};
-
-	rc = uclass_first_device_err(UCLASS_TPM, &dev);
-	if (rc)
-		return 0;
-
-	rc = tpm_init(dev);
-	if (rc)
-		return 0;
-
-	rc = tpm2_startup(dev, TPM2_SU_CLEAR);
-	if (rc)
-		return 0;
-
-	rc = tpm2_pcr_extend(dev, 0, digest);
-	if (!rc)
-		printf("TPM: PCR0 extended.\n");
-
 	return 0;
 }
diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index cf2e937fe2..7d70521c0a 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -136,4 +136,5 @@ CONFIG_USE_TINY_PRINTF=y
 CONFIG_SPL_TINY_MEMSET=y
 CONFIG_TPM=y
 CONFIG_SPL_TPM=y
+CONFIG_MEASURED_BOOT=y
 # CONFIG_EFI_LOADER is not set
-- 
2.31.1

