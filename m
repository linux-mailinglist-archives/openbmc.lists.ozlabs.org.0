Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB60218948
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 15:37:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B20j773s1zDqjb
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 23:37:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B20h75R5czDqc8
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 23:36:22 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068DUe66062464; Wed, 8 Jul 2020 09:36:19 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325ew2rjnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 09:36:19 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068DaBlv008584;
 Wed, 8 Jul 2020 13:36:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 322hd98ef4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 13:36:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068DaF3j9437782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 13:36:15 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC3E67805E;
 Wed,  8 Jul 2020 13:36:16 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DBC17805C;
 Wed,  8 Jul 2020 13:36:16 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.211.88.162])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 13:36:16 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2] leds: pca955x: Add an IBM software
 implementation of the PCA9552 chip
Date: Wed,  8 Jul 2020 08:36:14 -0500
Message-Id: <20200708133614.20693-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_11:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 cotscore=-2147483648 malwarescore=0 clxscore=1015
 adultscore=0 spamscore=0 suspectscore=1 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080095
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

IBM created an implementation of the PCA9552 on a PIC16F
microcontroller. The I2C device addresses are different from the
hardware PCA9552, so add a new compatible string and associated
platform data to be able to probe this device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 drivers/leds/leds-pca955x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 4037c504589c..bf7ead45f66b 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -65,6 +65,7 @@ enum pca955x_type {
 	pca9550,
 	pca9551,
 	pca9552,
+	pca9552_ibm,
 	pca9553,
 };
 
@@ -90,6 +91,11 @@ static struct pca955x_chipdef pca955x_chipdefs[] = {
 		.slv_addr	= /* 1100xxx */ 0x60,
 		.slv_addr_shift	= 3,
 	},
+	[pca9552_ibm] = {
+		.bits		= 16,
+		.slv_addr	= /* 0110xxx */ 0x30,
+		.slv_addr_shift	= 3,
+	},
 	[pca9553] = {
 		.bits		= 4,
 		.slv_addr	= /* 110001x */ 0x62,
@@ -101,6 +107,7 @@ static const struct i2c_device_id pca955x_id[] = {
 	{ "pca9550", pca9550 },
 	{ "pca9551", pca9551 },
 	{ "pca9552", pca9552 },
+	{ "pca9552-ibm", pca9552_ibm },
 	{ "pca9553", pca9553 },
 	{ }
 };
@@ -412,6 +419,7 @@ static const struct of_device_id of_pca955x_match[] = {
 	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
 	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
 	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
+	{ .compatible = "nxp,pca9552-ibm", .data = (void *)pca9552_ibm },
 	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
 	{},
 };
-- 
2.24.0

