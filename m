Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2851498C15
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 20:19:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjKYd4WTmz3bPR
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 06:19:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H7GYqJR3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H7GYqJR3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjKSL0BnDz3Wtt
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 06:15:13 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OJBWWY018643; 
 Mon, 24 Jan 2022 19:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NVTQF4631AqZzVFtzDvJjzJo3wVlj1XIVpqvlzrA3BY=;
 b=H7GYqJR3TKttrk7rsRzTa4Lsh6w4y7gQJjTeCEsivEarl6rs6vE2gtIIN3dD9l4Ky+Rq
 mkwbd1X4LyjZ//O3W5jw1+jRj3WueI5KIb2EuWmxZY+9/Gt4h9NFDu4VfPbKPdbZXbtm
 4vX6BSYImMvWq9Pe/Ygk0CyFosIN7y3FZ0EowdZHmfJ7+0UIRYmI5PcaoK1XwzH7GFMG
 UA4BZNuT9WLf33TKGxg6Pai7zRa/UvadkQ/gg3sdVzZE068CUB+10XofLT+lthy5FOZ7
 /SsH/qX6YTSTyBQdsQh9a20JPGcbZrI6NIHhjcD/zC6gycWrXBSp4MUHO/mfbben6DBV /w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt225825y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:07 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OJ7LS5008987;
 Mon, 24 Jan 2022 19:15:07 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 3dr9j9w68t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:07 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OJF6ZO31392010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 19:15:06 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DDBCC605F;
 Mon, 24 Jan 2022 19:15:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C3F0C6055;
 Mon, 24 Jan 2022 19:15:06 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.14.245])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 19:15:05 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 5/6] Add GPIO hogging support
 for AST2600 openbmc config
Date: Mon, 24 Jan 2022 13:15:02 -0600
Message-Id: <20220124191503.88452-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220124191503.88452-1-eajames@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2HzIP95PSN1cW4kxWmesloL8eeNN-Lkf
X-Proofpoint-ORIG-GUID: 2HzIP95PSN1cW4kxWmesloL8eeNN-Lkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240125
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Enable GPIO support in the SPL and hog the GPIOs in the SPL only. Also
increase the size of the malloc size in the SPL to get the GPIO driver
loaded.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 configs/ast2600_openbmc_spl_emmc_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600_openbmc_spl_emmc_defconfig
index 344a4d8f9c..5f50298a58 100644
--- a/configs/ast2600_openbmc_spl_emmc_defconfig
+++ b/configs/ast2600_openbmc_spl_emmc_defconfig
@@ -11,6 +11,7 @@ CONFIG_SYS_TEXT_BASE=0x81000000
 CONFIG_ASPEED_AST2600=y
 # CONFIG_ASPEED_LOADERS is not set
 CONFIG_TARGET_EVB_AST2600A1=y
+CONFIG_SPL_GPIO_SUPPORT=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
 CONFIG_SYS_MALLOC_F_LEN=0x2000
@@ -19,7 +20,7 @@ CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_ENV_SIZE=0x10000
 CONFIG_ENV_OFFSET=0x5000
-CONFIG_SPL_SYS_MALLOC_F_LEN=0x800
+CONFIG_SPL_SYS_MALLOC_F_LEN=0x1000
 CONFIG_SPL=y
 CONFIG_SPL_STACK_R_ADDR=0x90300000
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
@@ -94,6 +95,7 @@ CONFIG_CLK=y
 CONFIG_SPL_CLK=y
 CONFIG_ASPEED_HACE=y
 CONFIG_DM_GPIO=y
+CONFIG_SPL_GPIO_HOG=y
 CONFIG_ASPEED_GPIO=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_ASPEED=y
-- 
2.27.0

