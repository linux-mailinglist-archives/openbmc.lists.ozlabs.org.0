Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3AD3C7A61
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 02:04:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPd5W3nPVz30N5
	for <lists+openbmc@lfdr.de>; Wed, 14 Jul 2021 10:03:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LZ3ba+vD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LZ3ba+vD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPVMC2Dyvz2yxm
 for <openbmc@lists.ozlabs.org>; Wed, 14 Jul 2021 05:00:22 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DIXGKQ172808
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 15:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=U6esWSZwnGqt7DTzzR52mRrI5LcjG/5AM29dRjPBFa4=;
 b=LZ3ba+vDysqAO9CuSiMGkiT3XrSZHeF/AD06tgmVuaviVqn8pbGKRxhF6QRtIakTSimf
 2DOcdUKR85g7GIQ8fpKhxBLxKFLcNisiEKq5Ys/V51tE7sWc8BU9a6do9fdYJkPz83hc
 rxKZ2HiBHBlvB2ApLIIrDBUcZt4i2KsbbTl32Kk4KaN1e4fZXoSz/UiqM3rQ5aQiVI7D
 2Ym6CnI5MwxqiMPEqIeyut8mINCU8lO6wkJVadj3pulXT1bJZR/NncvFYWMlqlGNKqW+
 wj46aJ+TgSkiZJTfST46x5KtUDfCNJr2/lABR3/WdrXLUTNwb6iy79H0F/yOjuQnfa9c AQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sdkmecfq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 15:00:19 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16DIxkMK003956
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 19:00:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 39rkguj0e7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 19:00:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16DJ0HgL34931164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 19:00:17 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 446F62806D;
 Tue, 13 Jul 2021 19:00:17 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0560228067;
 Tue, 13 Jul 2021 19:00:17 +0000 (GMT)
Received: from xubuntu.austin.rr.com (unknown [9.77.159.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 19:00:16 +0000 (GMT)
From: Ben Tyner <bentyner@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 1/3] ARM: dts: rainier: Define name for gpio
 line Q2
Date: Tue, 13 Jul 2021 14:00:12 -0500
Message-Id: <20210713190014.8142-1-bentyner@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YKQ4VaIgyZ9m9cZ5ESAm27wSkMJ-Zeg-
X-Proofpoint-ORIG-GUID: YKQ4VaIgyZ9m9cZ5ESAm27wSkMJ-Zeg-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_10:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=978
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130117
X-Mailman-Approved-At: Wed, 14 Jul 2021 10:03:01 +1000
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
Cc: Ben Tyner <ben.tyner@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ben Tyner <ben.tyner@ibm.com>

gpio-line-names Q2 set to vrm-fault-standby

Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 671d0a797000..50a1f5e20e89 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -270,7 +270,7 @@ &gpio0 {
 	/*N0-N7*/	"","","","","","","","",
 	/*O0-O7*/	"","","","usb-power","","","","",
 	/*P0-P7*/	"","","","","pcieslot-power","","","",
-	/*Q0-Q7*/	"cfam-reset","","","","","","","",
+	/*Q0-Q7*/	"cfam-reset","","vrm-fault-standby","","","","","",
 	/*R0-R7*/	"","","","","","","","",
 	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
 				"","","","",
-- 
2.25.1

