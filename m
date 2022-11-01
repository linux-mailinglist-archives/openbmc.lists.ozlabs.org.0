Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA01961544B
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 22:33:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N23DJ4SMCz3cJg
	for <lists+openbmc@lfdr.de>; Wed,  2 Nov 2022 08:33:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9BB3l0v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9BB3l0v;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N23Bv4DdRz3cNR
	for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2022 08:32:23 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A1JiYlx021750;
	Tue, 1 Nov 2022 21:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=1QKJ9XLOHfaQ92Ibo5rkHkB7d50FOWJISZIWDpDmG3Y=;
 b=a9BB3l0vnZutbjXDnS5VTuPVjRdZNlYYE/tB0VAW67KN4QG1E8+H1xv7r5DedLDUyA5+
 mohWpMgaTkrWxWRYMMghRdlTfDXQuiePjjqe1rf5ROpS8LKmrVv/EtiAlJdTxz2T9gEY
 iNsY+TACAhf7YO8GhEweX8IXn1RiVTZNvso5Wf4PeCS2N1853hK1f6KY7E5qdzHI8VVo
 Ti8zunY1PYFty0ngPFk8gZUdDn9JGDDL8tERIkbZLf2HHFn6MDSivqQAwJXsTwFN6nb4
 gOhODzdhsPCm0QcxLBoQwDtk+xTsFdT6J5Yjn+w+qzeGA1Vc363xARiEk0IJ9MwrXZFo 8Q== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kjrugvvj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 21:32:17 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A1LLb0w013580;
	Tue, 1 Nov 2022 21:32:17 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma01dal.us.ibm.com with ESMTP id 3kgutam58k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Nov 2022 21:32:17 +0000
Received: from smtpav05.wdc07v.mail.ibm.com ([9.208.128.117])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A1LWFoS1245858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Nov 2022 21:32:15 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26F1958063;
	Tue,  1 Nov 2022 21:32:15 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80E4E58065;
	Tue,  1 Nov 2022 21:32:14 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.92.229])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Nov 2022 21:32:14 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0] ARM: dts: aspeed: p10bmc: Add occ-hwmon nodes
Date: Tue,  1 Nov 2022 16:32:12 -0500
Message-Id: <20221101213212.643472-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zzv3AtBwDtoe3PA9Na-5qhluf_kutfZW
X-Proofpoint-ORIG-GUID: zzv3AtBwDtoe3PA9Na-5qhluf_kutfZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-01_10,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=792 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010147
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the occ-hwmon nodes in order to specify that the occ-hwmon driver
should not poll the OCC during initialization.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 10 +++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 40 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 20 ++++++++++
 3 files changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 6789c1ec286a..72b687f45ebf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -334,6 +334,11 @@ sbefifo@2400 {
 
 			fsi_occ0: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -478,6 +483,11 @@ sbefifo@2400 {
 
 			fsi_occ1: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index fcc890e3ad73..1448ea895be4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2550,6 +2550,11 @@ sbefifo@2400 {
 
 			fsi_occ0: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -2694,6 +2699,11 @@ sbefifo@2400 {
 
 			fsi_occ1: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -2838,6 +2848,11 @@ sbefifo@2400 {
 
 			fsi_occ2: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -2982,6 +2997,11 @@ sbefifo@2400 {
 
 			fsi_occ3: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -3126,6 +3146,11 @@ sbefifo@2400 {
 
 			fsi_occ4: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -3270,6 +3295,11 @@ sbefifo@2400 {
 
 			fsi_occ5: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -3414,6 +3444,11 @@ sbefifo@2400 {
 
 			fsi_occ6: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -3558,6 +3593,11 @@ sbefifo@2400 {
 
 			fsi_occ7: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4879da4cdbd2..4edaa62e3afb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -444,6 +444,11 @@ sbefifo@2400 {
 
 			fsi_occ0: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -588,6 +593,11 @@ sbefifo@2400 {
 
 			fsi_occ1: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -732,6 +742,11 @@ sbefifo@2400 {
 
 			fsi_occ2: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
@@ -876,6 +891,11 @@ sbefifo@2400 {
 
 			fsi_occ3: occ {
 				compatible = "ibm,p10-occ";
+
+				occ-hwmon {
+					compatible = "ibm,p10-occ-hwmon";
+					ibm,no-poll-on-init;
+				};
 			};
 		};
 
-- 
2.31.1

