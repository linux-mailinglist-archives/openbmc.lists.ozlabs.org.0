Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AEF31625
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 22:32:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fx2g284bzDqZ1
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 06:32:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fx210JwVzDqc3
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 06:31:51 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VKRFgL096771
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 16:31:47 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2su8m3whyx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 16:31:47 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Fri, 31 May 2019 21:31:46 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 31 May 2019 21:31:43 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4VKVfAh38928686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2019 20:31:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C90ABB206A;
 Fri, 31 May 2019 20:31:41 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E3A9B2064;
 Fri, 31 May 2019 20:31:41 +0000 (GMT)
Received: from habcap11p1.aus.stglabs.ibm.com (unknown [9.41.164.53])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 31 May 2019 20:31:41 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, msbarth@linux.ibm.co, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.1] ARM: dts: aspeed: swift: Add VDD (IR35219) devices
Date: Fri, 31 May 2019 15:31:40 -0500
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19053120-0040-0000-0000-000004F72BB0
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011192; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01211374; UDB=6.00636512; IPR=6.00992411; 
 MB=3.00027135; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-31 20:31:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19053120-0041-0000-0000-0000090346EF
Message-Id: <1559334700-51970-1-git-send-email-anoo@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=881 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905310124
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

Add the VDD (IR35219) devices to the Swift device tree.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index 270c923..8590e6b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -723,6 +723,11 @@
 		reg = <0x4c>;
 	};
 
+	ir35219@70 {
+		compatible = "infineon,ir35219";
+		reg = <0x70>;
+	};
+
 	ir35221@71 {
 		compatible = "infineon,ir35221";
 		reg = <0x71>;
@@ -820,6 +825,11 @@
 		reg = <0x4c>;
 	};
 
+	ir35219@70 {
+		compatible = "infineon,ir35219";
+		reg = <0x70>;
+	};
+
 	ir35221@71 {
 		compatible = "infineon,ir35221";
 		reg = <0x71>;
-- 
1.8.3.1

