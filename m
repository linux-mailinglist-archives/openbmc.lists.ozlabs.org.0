Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFE620F9A7
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 18:41:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x98p3QmZzDqqY
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 02:40:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x90f4WqSzDqlp
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jul 2020 02:33:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05UGVSXo093305; Tue, 30 Jun 2020 12:33:51 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3207tj2jss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 12:33:51 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05UGKQig027835;
 Tue, 30 Jun 2020 16:33:51 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 31wwr8hgam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 16:33:51 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05UGXoWh50856330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 16:33:50 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 880992805A;
 Tue, 30 Jun 2020 16:33:50 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE15928058;
 Tue, 30 Jun 2020 16:33:49 +0000 (GMT)
Received: from talon7.ibm.com (unknown [9.211.132.68])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 16:33:49 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ARM: dts: Aspeed: Tacoma:
 Run NOR at 40MHz
Date: Tue, 30 Jun 2020 11:33:44 -0500
Message-Id: <1593534824-1767-2-git-send-email-eajames@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593534824-1767-1-git-send-email-eajames@linux.ibm.com>
References: <1593534824-1767-1-git-send-email-eajames@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_06:2020-06-30,
 2020-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=13 mlxlogscore=930
 adultscore=0 priorityscore=1501 phishscore=0 classifier=spam adjust=0
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

The Tacoma card is designed to run the NOR chip at 40MHz.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/dts/ast2600-tacoma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 22b9f39..a148aa7 100644
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -66,7 +66,7 @@
 		// TODO: what compatible strings should be here?
 		compatible = "spi-flash", "sst,w25q256";
 		status = "okay";
-		spi-max-frequency = <50000000>;
+		spi-max-frequency = <40000000>;
 		spi-tx-bus-width = <2>;
 		spi-rx-bus-width = <2>;
 	};
@@ -74,7 +74,7 @@
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

