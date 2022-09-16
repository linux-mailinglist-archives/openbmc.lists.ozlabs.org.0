Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448EB5BB30E
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 21:56:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTlFC6ZLYz3bmc
	for <lists+openbmc@lfdr.de>; Sat, 17 Sep 2022 05:56:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BK6ak24V;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BK6ak24V;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTlDk1h48z3bf5
	for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2022 05:55:49 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GJhQtw035618;
	Fri, 16 Sep 2022 19:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o7AQCSR5lvrlu+n83PuEk2IDFV47E1+juONyy0A4l3U=;
 b=BK6ak24VNQmjd5nMnFW4p0HfuJK/DnCtf04gpsj6AdsFmc+AVWQMe5RrNJ+yJd+L0dls
 bL3emmlZbqkJevhnteH66McT5u20irORmkJoW6xVhV1fYU1iPfXIe9mL1l4fAFq78879
 H47W4EoK5z8NWYGGqltj7fORlcDqL3LTguKiGw/StKR7oXvem5Zu63elHwDUH5s787bK
 vW9IQF8UowKAXCMUlFYBZcj5l1On6ZRmMIH1wvkpeUlSt2IeHuu8X8AEVtN5DGadFMCJ
 8VQsquam8apYKkFvZfvzulVC7TtNE3T6GhgeC8Kd2mur4szNoper09y7KUxG2CF6xmgz fQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmyj1raf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 19:55:39 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GJopWY012517;
	Fri, 16 Sep 2022 19:55:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma02dal.us.ibm.com with ESMTP id 3jm9178jdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 19:55:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GJtbfN11535046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 19:55:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B06AAE060;
	Fri, 16 Sep 2022 19:55:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42CC1AE05C;
	Fri, 16 Sep 2022 19:55:37 +0000 (GMT)
Received: from gfwa826.aus.stglabs.ibm.com (unknown [9.3.84.13])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 19:55:37 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v2] ARM: dts: rainier,everest: Move reserved memory regions
Date: Fri, 16 Sep 2022 14:55:35 -0500
Message-Id: <20220916195535.1020185-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4a2f1f13-cd98-4a0f-8e4a-b297cb81a382@www.fastmail.com>
References: <4a2f1f13-cd98-4a0f-8e4a-b297cb81a382@www.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K-fWv5I3OaprAEF8pSw8HNY-3uKCmG70
X-Proofpoint-ORIG-GUID: K-fWv5I3OaprAEF8pSw8HNY-3uKCmG70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_12,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=842 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160140
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
enabled. ECC takes 1/9th of memory.

Running on HW with ECC off, u-boot prints:
DRAM:  already initialized, 1008 MiB (capacity:1024 MiB, VGA:16 MiB, ECC:off)

And with ECC on, u-boot prints:
DRAM:  already initialized, 896 MiB (capacity:1024 MiB, VGA:16 MiB, ECC:on, ECC size:896 MiB)

This implies that MCR54 is configured for ECC to be bounded at the
bottom of a 16MiB VGA memory region:

1024MiB - 16MiB (VGA) = 1008MiB
1008MiB / 9 (for ECC) = 112MiB
1008MiB - 112MiB = 896MiB (available DRAM)

The flash_memory region currently starts at offset 896MiB:
0xb8000000 (flash_memory offset) - 0x80000000 (base memory address) = 0x38000000 = 896MiB

This is the end of the available DRAM with ECC enabled and therefore it
needs to be moved.

Since the flash_memory is 64MiB in size and needs to be 64MiB aligned,
it can just be moved up by 64MiB and would sit right at the end of the
available DRAM buffer.

The ramoops region currently follows the flash_memory, but it can be
moved to sit above flash_memory which would minimize the address-space
fragmentation.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 17 ++++++++---------
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 16 +++++++++-------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1bba5ad7378e..3bdd79506704 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -162,16 +162,9 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		/* LPC FW cycle bridge region requires natural alignment */
-		flash_memory: region@b8000000 {
-			no-map;
-			reg = <0xb8000000 0x04000000>; /* 64M */
-		};
-
-		/* 48MB region from the end of flash to start of vga memory */
-		ramoops@bc000000 {
+		ramoops@b3e00000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x8000>;
@@ -179,6 +172,12 @@ ramoops@bc000000 {
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
 
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b4000000 {
+			no-map;
+			reg = <0xb4000000 0x04000000>; /* 64M */
+		};
+
 		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 8bd2f441b159..e1cb3c88368a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -95,14 +95,9 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		flash_memory: region@b8000000 {
-			no-map;
-			reg = <0xb8000000 0x04000000>; /* 64M */
-		};
-
-		ramoops@bc000000 {
+		ramoops@b3e00000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
+			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
 			ftrace-size = <0x8000>;
@@ -110,6 +105,13 @@ ramoops@bc000000 {
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
 
+		/* LPC FW cycle bridge region requires natural alignment */
+		flash_memory: region@b4000000 {
+			no-map;
+			reg = <0xb4000000 0x04000000>; /* 64M */
+		};
+
+		/* VGA region is dictated by hardware strapping */
 		vga_memory: region@bf000000 {
 			no-map;
 			compatible = "shared-dma-pool";
-- 
2.25.1

