Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C29C51CAAC
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 22:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvQNb70vMz3brl
	for <lists+openbmc@lfdr.de>; Fri,  6 May 2022 06:32:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WWjDdTtf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WWjDdTtf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvQJX6qKJz3bxR
 for <openbmc@lists.ozlabs.org>; Fri,  6 May 2022 06:28:44 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245JJMOh009066;
 Thu, 5 May 2022 20:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UsrL84fARWGsl4XLD4sy3jMkQc+Ts//oGvRCxbUFx00=;
 b=WWjDdTtfwAt3KWh11QWQSB6yfnFYYx5bDaJKsr+csiiiafhHkTNAEr2EVhDAbsLau/zF
 b1oaVLC/61qjP8bob+jiQ2WcKbbRisnjRMvYs599TFHx+RfC8HykbjtOORQNHxDfelU5
 1uu5sVZ9mtN1BUb0tkWv1izbkjglF/5O6BxNCmEQlj6Gwg9xt/nWiaKvq1hdoI4htt51
 ZMgQtqovOLfoF7vkYeoJJpl5OVqvmAE+oeUbAmkKq5KRMOp70Ug6gZwms6xDmzyfTS9B
 eFcUdIBxWizeZ+mz9prdksOEs+C+L69/sJB6q259hM/s+I7b8QZR4cOsOpNV0niHynXq KA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvmmp96r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:38 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245KSUNj029161;
 Thu, 5 May 2022 20:28:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 3frvra3y2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 20:28:38 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245KSbT531719874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 20:28:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F013136059;
 Thu,  5 May 2022 20:28:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15DE3136060;
 Thu,  5 May 2022 20:28:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.0.208])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 20:28:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 5/5] aspeed: Add
 board_late_init to write TPM
Date: Thu,  5 May 2022 15:28:29 -0500
Message-Id: <20220505202829.31466-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220505202829.31466-1-eajames@linux.ibm.com>
References: <20220505202829.31466-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qvHoXFXDKZM0qCbxwJaQa4orm0jZPnF4
X-Proofpoint-ORIG-GUID: qvHoXFXDKZM0qCbxwJaQa4orm0jZPnF4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_08,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050132
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

If there is a TPM in the devicetree, use board_late_init to
extend PCR0 with some invalid digest. The purpose of this is to
prevent later undesired usage of the TPM.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 board/aspeed/evb_ast2600/evb_ast2600.c     | 34 ++++++++++++++++++++++
 configs/ast2600_openbmc_spl_emmc_defconfig |  1 +
 2 files changed, 35 insertions(+)

diff --git a/board/aspeed/evb_ast2600/evb_ast2600.c b/board/aspeed/evb_ast2600/evb_ast2600.c
index 72ecb18c15..e11fc6973d 100644
--- a/board/aspeed/evb_ast2600/evb_ast2600.c
+++ b/board/aspeed/evb_ast2600/evb_ast2600.c
@@ -3,6 +3,11 @@
  * Copyright (C) ASPEED Technology Inc.
  */
 #include <common.h>
+#if defined(CONFIG_TPM_V2)
+#include <dm/uclass.h>
+#include <tpm-common.h>
+#include <tpm-v2.h>
+#endif
 #include <asm/io.h>
 
 #define SCU_BASE	0x1e6e2000
@@ -122,6 +127,35 @@ static void __maybe_unused espi_init(void)
 	writel(reg, ESPI_BASE + 0x000);
 }
 
+__weak int board_late_init(void)
+{
+#if defined(CONFIG_TPM_V2)
+	int rc;
+	struct udevice *dev;
+	unsigned char digest[32] = {
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
+	tpm2_pcr_extend(dev, 0, digest);
+#endif
+	return 0;
+}
+
 int board_early_init_f(void)
 {
 #if 0
diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 3bb44280c7..b506bc5e55 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -39,6 +39,7 @@ CONFIG_SYS_CONSOLE_ENV_OVERWRITE=y
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_ARCH_EARLY_INIT_R=y
 CONFIG_BOARD_EARLY_INIT_F=y
+CONFIG_BOARD_LATE_INIT=y
 CONFIG_SPL_BOARD_INIT=y
 # CONFIG_SPL_LEGACY_IMAGE_SUPPORT is not set
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
-- 
2.27.0

