Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFB91EB2E3
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 03:12:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bYt92gYSzDqFJ
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 11:12:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bentyner@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bNlL058yzDqKK
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 04:20:45 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051I3an9004450; Mon, 1 Jun 2020 14:20:41 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bm077jeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 14:20:41 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051IF00U002815;
 Mon, 1 Jun 2020 18:20:40 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 31bf48nt92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 18:20:40 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 051IKdx652494732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 18:20:39 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D7C82805C;
 Mon,  1 Jun 2020 18:20:39 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E16F28059;
 Mon,  1 Jun 2020 18:20:39 +0000 (GMT)
Received: from xubuntu.austin.rr.com (unknown [9.65.200.226])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jun 2020 18:20:39 +0000 (GMT)
From: bentyner@linux.ibm.com
To: openbmc@lists.ozlabs.org
Subject: [PATCH] arm: dts: aspeed: tacoma: remove checkstop gpio-key
Date: Mon,  1 Jun 2020 13:20:22 -0500
Message-Id: <20200601182022.4031-1-bentyner@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_12:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=580 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 cotscore=-2147483648 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=1 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006010136
X-Mailman-Approved-At: Tue, 02 Jun 2020 11:08:13 +1000
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

Attention handler will monitor the checkstop gpio via the character
device interface so it needs to not be defined.

Signed-off-by: Ben Tyner <ben.tyner@ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index ba1f4cb7e..d2850956c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -39,12 +39,6 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		checkstop {
-			label = "checkstop";
-			gpios = <&gpio0 ASPEED_GPIO(E, 3) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(E, 3)>;
-		};
-
 		ps0-presence {
 			label = "ps0-presence";
 			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
-- 
2.20.1

