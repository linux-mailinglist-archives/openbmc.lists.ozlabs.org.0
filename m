Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A93EE0FD
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 02:35:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpXBC1JQvz3bXk
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:35:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lJHkShlV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jlwright@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lJHkShlV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpJmr2bBLz2yxB;
 Tue, 17 Aug 2021 02:01:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GFYbYs016518; Mon, 16 Aug 2021 12:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=FK5S68FFmWdnv3IEsnkTuW+HaHt16EmtTZt1DppVTkI=;
 b=lJHkShlVXWEbDuTr9KvKNom1/o9n+8KC+lNrElGV2wZ23sOs7HC5XAEOP0DtRvNPMgZy
 vsJB7kpRc4apYV9LOyyrao6XsBlIF/jit9wW5j2/MKtewSzHm3PlCIO3hNyJNoD8TH1U
 vcdLyYiY/HyFZAwHKh5Zh87Wb2RYJckG4FKVpp887sKY8u7d6w6n0rMK2kN4CeW2ESJL
 N54uQ5G9QQpDyW6HKWBydOF4RzL7u4szrao3ZDaNJLerYg0k+gufM4sn+2YOH1jQKhHP
 6jcvJ6gGEgYLuFJ1fIQXWSssLAwt/uUpULE5y5YtUSMdiP8yoeEcq8Z6kKzxQZqOP7wG Gw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aeud8m87n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 12:01:08 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17GFw27t030145;
 Mon, 16 Aug 2021 16:01:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3ae5fc5b9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 16:01:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17GG0x4331588676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:00:59 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 192E76A047;
 Mon, 16 Aug 2021 16:00:59 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 063F26A063;
 Mon, 16 Aug 2021 16:00:58 +0000 (GMT)
Received: from gfwr705.rchland.ibm.com (unknown [9.10.239.37])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 16 Aug 2021 16:00:58 +0000 (GMT)
Received: by gfwr705.rchland.ibm.com (Postfix, from userid 527496)
 id 875C66017E; Mon, 16 Aug 2021 11:00:58 -0500 (CDT)
From: Jim Wright <jlwright@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: aspeed: p10bmc: Add power control
 pins
Date: Mon, 16 Aug 2021 11:00:02 -0500
Message-Id: <20210816160002.18645-1-jlwright@us.ibm.com>
X-Mailer: git-send-email 2.32.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2HOaWEXnOPIoYo8yUgdc4BR7bsCbe2jn
X-Proofpoint-ORIG-GUID: 2HOaWEXnOPIoYo8yUgdc4BR7bsCbe2jn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_05:2021-08-16,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160098
X-Mailman-Approved-At: Tue, 17 Aug 2021 10:32:43 +1000
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
Cc: Jim Wright <jlwright@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add to p10bmc systems the GPIO line names used in chassis power on / off
control and chassis power good monitoring. Names used are as documented at [1].

[1] https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

Signed-off-by: Jim Wright <jlwright@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 01a0b2b03ddd..941efff7c943 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -253,7 +253,7 @@ &gpio0 {
 	/*O0-O7*/	"","","","","","","","",
 	/*P0-P7*/	"","","","","led-pcieslot-power","","","",
 	/*Q0-Q7*/	"","","","","","","","",
-	/*R0-R7*/	"","","","","","I2C_FLASH_MICRO_N","","",
+	/*R0-R7*/	"","power-chassis-control","power-chassis-good","","","I2C_FLASH_MICRO_N","","",
 	/*S0-S7*/	"","","","","","","","",
 	/*T0-T7*/	"","","","","","","","",
 	/*U0-U7*/	"","","","","","","","",
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index f87bc5dc8aba..605ad80ef967 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -243,7 +243,7 @@ &gpio0 {
 	/*O0-O7*/	"","","","usb-power","","","","",
 	/*P0-P7*/	"","","","","pcieslot-power","","","",
 	/*Q0-Q7*/	"cfam-reset","","","","","","","",
-	/*R0-R7*/	"","","","","","","","",
+	/*R0-R7*/	"","power-chassis-control","power-chassis-good","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
 				"","","","",
 	/*T0-T7*/	"","","","","","","","",
-- 
2.32.0

