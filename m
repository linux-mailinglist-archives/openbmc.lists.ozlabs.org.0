Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C539A5BA232
	for <lists+openbmc@lfdr.de>; Thu, 15 Sep 2022 23:09:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MT8w85K50z3bkk
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 07:09:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwkzGPyC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwkzGPyC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MT8vh0cTYz306K
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 07:09:03 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FKC5LC004618;
	Thu, 15 Sep 2022 21:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=vWAd2ixFFAzgepDcIQw3W/xztUlK2HH1YF+ZQjYshRc=;
 b=nwkzGPyCdflqadiQNLlnitsTOHN+n384LveYf6q5gAM9CmWCSusBn01yNyW389wilc1A
 eoM/lMKzFxOnQmOGSp0mV/WNEHnfV5jVoi+Ye5xsZhJJh+x5O+hKjLZRGZ8FkgJZztSS
 MYPl2xGvsSaXNAwx27G696YxN0WQlKt4Pp660DOG3nXKqP5Ky6b1zDpl1KKh9k+twlh0
 QXSM7LEROUkn+yF6Sfe4sEk8Ndy3HVRid+oSk53pERwEmXqaWr3gV46SgafPFYhuCmQX
 7RNTtCA0u4SJf6jEjx/1+nDAJ3dlXYl9IR/P5ljgsQpWo6Syf/EwN6M7wuYKxXQdbOT1 jQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmavc9na8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 21:08:56 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28FL6JpW023563;
	Thu, 15 Sep 2022 21:08:55 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03wdc.us.ibm.com with ESMTP id 3jm91w0u38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Sep 2022 21:08:55 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28FL8tel61931974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Sep 2022 21:08:55 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2179A28059;
	Thu, 15 Sep 2022 21:08:55 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC3E928058;
	Thu, 15 Sep 2022 21:08:54 +0000 (GMT)
Received: from gfwa826.aus.stglabs.ibm.com (unknown [9.3.84.13])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 15 Sep 2022 21:08:54 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: rainier,everest: Move reserved memory regions
Date: Thu, 15 Sep 2022 16:08:52 -0500
Message-Id: <20220915210852.858170-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GfJOiwPCwkD61f3oXVq7tH6Jm8JHDLVP
X-Proofpoint-GUID: GfJOiwPCwkD61f3oXVq7tH6Jm8JHDLVP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=703 impostorscore=0
 phishscore=0 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209150131
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

Move the reserved regions to account for a decrease in DRAM when ECC is
enabled. ECC takes 1/9th of memory, bringing the size down from 1024MiB
to 912MiB (minus 16MiB for VGA) for a total of 896MiB available DRAM.

Move the regions by 128MiB since the flash_memory region needs to be
aligned to 64MiB. This change doesn't affect the host if ECC is not
enabled.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 11 ++++++-----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 12 ++++++++----
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1bba5ad7378e..9a09301dd79e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -163,15 +163,16 @@ reserved-memory {
 		ranges;
 
 		/* LPC FW cycle bridge region requires natural alignment */
-		flash_memory: region@b8000000 {
+		flash_memory: region@b0000000 {
 			no-map;
-			reg = <0xb8000000 0x04000000>; /* 64M */
+			reg = <0xb0000000 0x04000000>; /* 64M */
 		};
 
-		/* 48MB region from the end of flash to start of vga memory */
-		ramoops@bc000000 {
+		/* 176MB region from the end of flash to start of vga memory */
+
+		ramoops@b4000000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			reg = <0xb4000000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x8000>;
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 8bd2f441b159..01e7d8f46dc7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -95,14 +95,17 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@b8000000 {
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b0000000 {
 			no-map;
-			reg = <0xb8000000 0x04000000>; /* 64M */
+			reg = <0xb0000000 0x04000000>; /* 64M */
 		};
 
-		ramoops@bc000000 {
+		/* 176MB region from the end of flash to start of vga memory */
+
+		ramoops@b4000000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			reg = <0xb4000000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x8000>;
@@ -110,6 +113,7 @@ ramoops@bc000000 {
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
 
+		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
 			compatible = "shared-dma-pool";
-- 
2.25.1

