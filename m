Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5732436F3
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 10:53:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS0jR0zdCzDqc8
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 18:53:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jbDNlcW3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS0hR2RqKzDqbk
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 18:52:54 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8X7WX088463; Thu, 13 Aug 2020 04:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=Q+hBQwZsC0cZi1hTvcJxUDb7y17o1nNFDijqVcZT/js=;
 b=jbDNlcW3S3Z+nx5gQWKeqi5BnUiqpywWpmro8W03t8/lJ/+a89LAsKksbGjqF0fwkW1Y
 FWFQfN2Id1ID2+pcDi+lqVvWElZ+SP97R/Sdp/2vwXzrYngGNjG804a3t5ooo5lcwLm5
 d3BTSBHr/xYx4hsA8jGRc64vIryGbhpEPlCLCj4qR3t+sKSEaqyWsqZqsxUrO7HOo+EP
 4cum69wvcoguj1fNcL1S9dsWjTpeahrbWbsrucXQ239W+SMNb5xfcXn0xwLb8/thJYWK
 sFw9FBiQYbq3VnOnYMw1PXwrhy7g9O9x8+hIh3aO9oSkVSusizemeiQwTdbZyiior/6R Eg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32vqcph19w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 04:52:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D8j336030796;
 Thu, 13 Aug 2020 08:52:50 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 32skp9jpe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 08:52:50 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07D8qnLo50725288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 08:52:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3EE5112065;
 Thu, 13 Aug 2020 08:52:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6240112062;
 Thu, 13 Aug 2020 08:52:49 +0000 (GMT)
Received: from gfw170.aus.stglabs.ibm.com (unknown [9.3.62.224])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 08:52:49 +0000 (GMT)
Received: by gfw170.aus.stglabs.ibm.com (Postfix, from userid 298080)
 id 5E9CC35E; Thu, 13 Aug 2020 03:52:49 -0500 (CDT)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.8 1/2] ARM: dts: aspeed: Add LEDs that are off
 9551 on Operator Panel
Date: Thu, 13 Aug 2020 03:52:47 -0500
Message-Id: <1597308767-31538-1-git-send-email-vishwa@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=1
 lowpriorityscore=0 mlxlogscore=925 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130064
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
Cc: openbmc@lists.ozlabs.org, Vishwanatha Subbanna <vishwa@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Vishwanatha Subbanna <vishwa@linux.ibm.com>

These are LEDs that are controlled by 9551

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index c3ff672..573fe1a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -120,6 +120,38 @@
 			reg = <3>;
 		};
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		/* System ID LED that is at front on Op Panel */
+		front-sys-id0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System Attention Indicator ID LED that is at front on Op Panel */
+		front-check-log0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure Fault LED that is at front on Op Panel */
+		front-enc-fault1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System PowerOn LED that is at front on Op Panel */
+		front-sys-pwron0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &ehci1 {
@@ -831,6 +863,56 @@
 		};
 	};
 
+	pca1: pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 	dps: dps310@76 {
 		compatible = "infineon,dps310";
 		reg = <0x76>;
-- 
1.8.3.1

