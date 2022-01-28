Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141DF4A0332
	for <lists+openbmc@lfdr.de>; Fri, 28 Jan 2022 22:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jlrj566YTz2xs7
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 08:50:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ILBh52yf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ILBh52yf; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jlrh04nL2z2yN3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 08:49:04 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SL63QH015128; 
 Fri, 28 Jan 2022 21:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XXZsQbkFAFc5HlnFubgZ7msbZ7m7yHpSrB3KXuC/k3w=;
 b=ILBh52yfyTHhfjPcL26xORVgeBHbuZPgz22XDCvbqwSLV+F930SQ/jUvU4liHVx9xQlr
 QSIY1KaQJuEVVL6utV6qv0ZSEJcN2yeta4gtUEdfnLFODfkuDj8v4AyUqcv5jdB9tREw
 rUbJmiPsvpgcQrRvgR4sXOwUDnYdl7w5c/lAyGRLm3PCOK/VdQRQ424+aro053YtGgEm
 aaNtDWtdTcqfpvynVdYZEi0AOL3zhX/yry8hMVLQEIT16CJTLNKdUUTl4eDC/Ry3JaPV
 nD1zmNjOc7ZgGkA45ieFobVGvexOG5Zxp95ZAag09Pel5Zotu6YUTwR3glC9FRlUEAzL mA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvpentbyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 21:49:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SLWpNT006582;
 Fri, 28 Jan 2022 21:49:01 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr9jcj7ay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 21:49:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SLmx7Q15597942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 21:49:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD7957806E;
 Fri, 28 Jan 2022 21:48:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 846C078063;
 Fri, 28 Jan 2022 21:48:59 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.120.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 21:48:59 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 3/3] arm: dts: Aspeed: Rainier and Everest:
 Enable UHCI
Date: Fri, 28 Jan 2022 15:48:52 -0600
Message-Id: <20220128214852.21551-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128214852.21551-1-eajames@linux.ibm.com>
References: <20220128214852.21551-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dzeUzQTFSCpwk4c228b9XaerzeyhOfjR
X-Proofpoint-ORIG-GUID: dzeUzQTFSCpwk4c228b9XaerzeyhOfjR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=793 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280123
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

The UHCI controller is necessary to talk to slower, USB1.1 devices, so
enable the UHCI controller in the device tree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 4 ++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 7256b8cbd552..547c71bfdfa7 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2394,6 +2394,10 @@ &ehci1 {
 	status = "okay";
 };
 
+&uhci {
+	status = "okay";
+};
+
 &emmc_controller {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 652c866c14dc..b0fad1153e76 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -239,6 +239,10 @@ &ehci1 {
 	status = "okay";
 };
 
+&uhci {
+	status = "okay";
+};
+
 &gpio0 {
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
-- 
2.27.0

