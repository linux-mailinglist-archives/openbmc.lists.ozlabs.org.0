Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72220F99D
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 18:39:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x96r35wCzDqlK
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 02:39:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x90c006VzDqlp
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 02:33:51 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05UGWT3C012410; Tue, 30 Jun 2020 12:33:48 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3203vpbmu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 12:33:48 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05UGKpS6015218;
 Tue, 30 Jun 2020 16:33:48 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 31wwr8sexp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 16:33:48 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05UGXlJ231916498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 16:33:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D78B28059;
 Tue, 30 Jun 2020 16:33:47 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0D572805A;
 Tue, 30 Jun 2020 16:33:46 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.211.132.68])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 16:33:46 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ARM: dts: Aspeed: Rainier:
 Run NOR at 40MHz
Date: Tue, 30 Jun 2020 11:33:43 -0500
Message-Id: <1593534824-1767-1-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_06:2020-06-30,
 2020-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 cotscore=-2147483648 suspectscore=13
 adultscore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300115
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

The BMC card for the Rainier system is designed to run the NOR chip at
40MHz.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/dts/ast2600-rainier.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index ce530eb..3799cca 100644
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -75,7 +75,7 @@
 		// TODO: what compatible strings should be here?
 		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <40000000>;
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
 	};
@@ -83,7 +83,7 @@
 	flash@1 {
 		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <40000000>;
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
 	};
-- 
1.8.3.1

