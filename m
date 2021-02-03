Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA8530E600
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 23:25:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWGTf4JLnzDwnG
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 09:25:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d0DGH0ll; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWGSs6QPDzDwn8
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 09:24:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 113M2CcW168057; Wed, 3 Feb 2021 17:24:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=b1hcUgdye2FvYufuIJG0TCOoE6ej//sZFGXrakKZHMQ=;
 b=d0DGH0llEnNpc/zi92y9mdLRPtXdkloORfYs513ZRMqfb4qFYvPxBVFxmnwoT2VGFoEP
 O+zexiR3PB9v1CXnvfq/+ytQnwSqPKWfSAQFWQAzrtSWgGsSXn3qIf9XsWxfg/HSn1gt
 IqjgXBehoeKNagwozk4sX2G9eF8HAEJB+fqQ72Udkmql39Ft0u6ZnRFyQKaycQu6/Ty3
 02PltvdhmJsvKXZ6XAsBdm8HdUGeOmfxf1FSpmk8ipAWKbM+kMTqDiISX1tSdXK+YsJi
 aFc72kn7Xr9svRsEaxq9x5JexlGXrI+ZH5SQrEBtYMF1ziGiYSSwTrOfNYUsEaxdhWcj ew== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36g3te9jrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 17:24:41 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 113MM4NA026533;
 Wed, 3 Feb 2021 22:24:41 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 36f3kvfxhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 22:24:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 113MOd8l26345896
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 22:24:39 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5254FC605A;
 Wed,  3 Feb 2021 22:24:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DF66C6055;
 Wed,  3 Feb 2021 22:24:38 +0000 (GMT)
Received: from MSBARTH-P50.aus.stglabs.ibm.com (unknown [9.163.45.205])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  3 Feb 2021 22:24:38 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: rainier: Enable fan watchdog
Date: Wed,  3 Feb 2021 16:24:36 -0600
Message-Id: <20210203222436.2469871-1-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_08:2021-02-03,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030130
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
Cc: mspinler@linux.ibm.com, eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Set watchdog 1 to pulse the fan watchdog circuit that drives the FAULT
pin of the MAX31785, resulting in fans running at full speed if at any
time the BMC stops pulsing the circuit, such as during a BMC reboot at
runtime.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index bcc4568d8521..e78a2d673dd4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1188,6 +1188,16 @@ eeprom@50 {
 	};
 };
 
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
+
 &vuart1 {
 	status = "okay";
 };
-- 
2.29.2

