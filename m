Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF440466D27
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 23:46:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4rfk4QLzz3bsp
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 09:46:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PkTuv4bY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PkTuv4bY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4rdV2n4zz2yPV
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 09:45:33 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2MGxVk029745; 
 Thu, 2 Dec 2021 22:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EpwzfzfCbqjmF4vQ5HUv4JcP7UW/KJN62a2mrgkjLdA=;
 b=PkTuv4bYrEbz0BZuvoX5e8f01WbQtKNU9IoiR0MZwwghDBqWTQiBnRZcvaCcNn5GbPPv
 q4NrC3g504D02rsAYfYXLJEenX7B1pCU3IFmJxFPLJWOa/P+7MjAlrAxD//Oog4NAYbK
 SE2LLoFZ9pEY7qlx1dfT64Py9qf/HHZteQHRbuaJhqz6mq5GG6X9m7kBlQg6E/zAPiwT
 mKk1WW8eYIEoPfG0/QZDIto3YrbgsUc5cPJ2RXuV7wIBLDIBJkWeVZIV7catGO7oB3/t
 O/lRuTNj6Ur1PmK5XWm4BGtk97LZPLNoWYy2nCctmPKV5Z5TguYTydj0/aj+dEmtU1s6 gA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq6t5gq0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 22:45:29 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2MZ8Bp006503;
 Thu, 2 Dec 2021 22:45:28 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3ckcad0n11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 22:45:28 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2MjRiV27918638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 22:45:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D66A112069;
 Thu,  2 Dec 2021 22:45:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0B72112061;
 Thu,  2 Dec 2021 22:45:26 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.127.216])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 22:45:26 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15] ARM: dts: aspeed: Everest and Rainier: Enable
 ftrace in ramoops buffer
Date: Thu,  2 Dec 2021 16:45:25 -0600
Message-Id: <20211202224525.29178-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t6zYYmhb4Wr5VE3Cawp5bUxlgPtBaGJ2
X-Proofpoint-GUID: t6zYYmhb4Wr5VE3Cawp5bUxlgPtBaGJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_15,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=726 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020137
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Increase the size of the buffer and set the ftrace-size property in order
to collect event tracing during a crash.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 3 ++-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index f42e2d776ba8..ceb7c1ad95ef 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -171,9 +171,10 @@ flash_memory: region@b8000000 {
 		/* 48MB region from the end of flash to start of vga memory */
 		ramoops@bc000000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x180000>; /* 16 * (3 * 0x8000) */
+			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
+			ftrace-size = <0x8000>;
 			pmsg-size = <0x8000>;
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 866f32cdccea..66f15e3aa742 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -102,9 +102,10 @@ flash_memory: region@b8000000 {
 
 		ramoops@bc000000 {
 			compatible = "ramoops";
-			reg = <0xbc000000 0x180000>; /* 16 * (3 * 0x8000) */
+			reg = <0xbc000000 0x200000>; /* 16 * (4 * 0x8000) */
 			record-size = <0x8000>;
 			console-size = <0x8000>;
+			ftrace-size = <0x8000>;
 			pmsg-size = <0x8000>;
 			max-reason = <3>; /* KMSG_DUMP_EMERG */
 		};
-- 
2.27.0

