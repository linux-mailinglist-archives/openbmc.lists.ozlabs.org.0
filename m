Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C040CF09
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 23:50:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8v5d0GRfz2yNZ
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 07:50:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T8T9bqGt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T8T9bqGt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8v2p1TSgz2yK4
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 07:47:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FJT8Sd026149;
 Wed, 15 Sep 2021 17:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pth3xdQVOwJUA02+AVvXpX9fdRXz/r6z3SFZCNK4qyA=;
 b=T8T9bqGtTuHgybWS/lGdvG41b4vAKgBgjktYiW76DjrKOzc//rD//dZ/XjZv8HEbWER1
 1b4fKVJZ+xE6+MtgHN+YBXvdAYBTc3XlibFQ158kYAUDL2HjIKQc+go2qHVNCFhCgcAm
 MhM1zVAZU6g9oG5t0PpdO7GhHRhIKwZ8tL59UwMQOSXVZw6nBu0uaM5BQxT5ldkGG5Gc
 L6HCAecMQpIENcMw267CsQ5cCD51+T8t3gxqVdZGZJxGPqaoCaXwt96cgzK0QvX+N8yX
 r8PAujZrJQJCQtz62iYs5qg41ltaXQfD2ed9/Hfo/TIDv+74xJhkP1z8m0rXssjDYQow +A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b3q1g2bnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 17:47:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FLcUed007723;
 Wed, 15 Sep 2021 21:47:42 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3b0m3ca564-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 21:47:42 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FLle3u48038154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 21:47:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BABCC6055;
 Wed, 15 Sep 2021 21:47:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72B10C605D;
 Wed, 15 Sep 2021 21:47:40 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.152.249])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 21:47:40 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 v2 4/4] ARM: dts: aspeed: Rainier: Remove gpio
 hog for GPIOP7
Date: Wed, 15 Sep 2021 16:47:38 -0500
Message-Id: <20210915214738.34382-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210915214738.34382-1-eajames@linux.ibm.com>
References: <20210915214738.34382-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d-IQCFhaJOMr3OC6f-9Fl9lCpVnJ-l3K
X-Proofpoint-ORIG-GUID: d-IQCFhaJOMr3OC6f-9Fl9lCpVnJ-l3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=881
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150110
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Only the pass 1 Ingraham board (Rainier system) had a micro-controller
wired to GPIOP7 on ball Y23. Pass 2 boards have this ball wired to the
heartbeat LED, so remove the hog and add it to the pass 1 devicetrees.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts | 9 +++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts    | 9 +++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 7 -------
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
index e35a3efd9d22..b7ec83848750 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u-p1.dts
@@ -22,6 +22,15 @@ aliases {
 	};
 };
 
+&gpio0 {
+	pin_mclr_vpp {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
+		output-high;
+		line-name = "mclr_vpp";
+	};
+};
+
 &i2c4 {
 	/delete-node/ pca9546@70;
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
index b3c923f1838b..d650dbebe5d2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-p1.dts
@@ -22,6 +22,15 @@ aliases {
 	};
 };
 
+&gpio0 {
+	pin_mclr_vpp {
+		gpio-hog;
+		gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
+		output-high;
+		line-name = "mclr_vpp";
+	};
+};
+
 &i2c4 {
 	/delete-node/ pca9546@70;
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 2b6bb20dfd82..9250d9465407 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -254,13 +254,6 @@ &gpio0 {
 	/*Y0-Y7*/	"","","","","","","","",
 	/*Z0-Z7*/	"","","","","","","","";
 
-	pin_mclr_vpp {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(P, 7) GPIO_OPEN_DRAIN>;
-		output-high;
-		line-name = "mclr_vpp";
-	};
-
 	i2c3_mux_oe_n {
 		gpio-hog;
 		gpios = <ASPEED_GPIO(G, 6) GPIO_ACTIVE_LOW>;
-- 
2.27.0

