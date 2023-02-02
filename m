Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E14D68828C
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 16:32:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P72pz1BqBz3f5f
	for <lists+openbmc@lfdr.de>; Fri,  3 Feb 2023 02:32:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kOG4AskI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kOG4AskI;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P72pN5JSSz3c7l
	for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2023 02:32:12 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312EGr9O029897;
	Thu, 2 Feb 2023 15:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Or4kp/6WDkGECyPZfGhbGea3+xtuTbuSAF8oNUJWcDw=;
 b=kOG4AskIKDTQ0P/8Q13TUMJ1mdwvZ8YlSo4OMgat5oTWsDex+0FMxkK+8jBPmaZo5ILr
 MIRFnj03fXZti7tTxKxeHKi5CmUhovzArjtK0JqznPBLm/LfgBijcdFrlwU3BcIwKpVe
 KKVRWi9ST9zPps/v8SfG8CuqmFMTb/8qLktJCjkmHwnH9yGsfpTMlp83JsEsT44krk/d
 xruG/ym/uPFDAe6BuvGN+jNXJDGpeCmFrRWQQfcsxu5qT7Pk0b62v9OB+AGhEe8GIkmX
 AveO//9rS65nanvO9lSEjdKmsZ/BFIGU3d9/b7E7IxCVfQFcewAkELrqKDeZaZUay64r ug== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngesvt40b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 15:32:06 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312FN3Z8005050;
	Thu, 2 Feb 2023 15:32:06 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3ncvv2458u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 15:32:06 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312FW5Km43451094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 15:32:05 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11B1B58060;
	Thu,  2 Feb 2023 15:32:05 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8204B5804E;
	Thu,  2 Feb 2023 15:32:04 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.65.214.66])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 15:32:04 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0 v2] arm: dts: aspeed: p10bmc: Enable UART2
Date: Thu,  2 Feb 2023 09:32:03 -0600
Message-Id: <20230202153203.67547-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4cuQ1NZGLQbdDqKjOrpIbMZm9oRcQB2q
X-Proofpoint-ORIG-GUID: 4cuQ1NZGLQbdDqKjOrpIbMZm9oRcQB2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=760 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020135
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The APSS can be accessed over the second uart on these systems.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Changes since v1:
  - Use quotes around "okay"... 

 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index e2a9a18bda57..b967665fbb91 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -855,6 +855,10 @@ &i2c15 {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &vuart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1448ea895be4..456ca2830a31 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -3649,6 +3649,10 @@ &ibt {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &vuart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 20ef958698ec..e1b5d44308fe 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -2352,6 +2352,10 @@ led@7 {
 	};
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &vuart1 {
 	status = "okay";
 };
-- 
2.31.1

