Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC3417C44
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 22:17:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGNcK3ww8z305W
	for <lists+openbmc@lfdr.de>; Sat, 25 Sep 2021 06:17:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=erRWvKzK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=erRWvKzK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGNbq5hTGz2ynr
 for <openbmc@lists.ozlabs.org>; Sat, 25 Sep 2021 06:16:54 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OIx5ng006209; 
 Fri, 24 Sep 2021 16:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MeeaML7jvd+CardvOExswzwcO2Z1i3qu/fz9YcBlbIA=;
 b=erRWvKzKDFp9sF3dAlcwydaJYrh8JI8KqMAyu7PJ9aJoA3sbbHnjz5q8zSMGKeUZLQWm
 1lqh702t5c0KeZWGTz0dkgu6q29x19OOFyjtMD5jM+tNi0V8LRn5K05aBzgRyN5W1BdU
 9IVFdiPQawsWN2EXLt7VvN/Ccdez+pGsHq4O4wFVcRPAlZHZzbSo8MWkLLtj38Bk7OTl
 07tbuoY8bqlnHvYO2B/oHaOuaomk026+UtAK0Q629qAVvDZYK8nbz7MtMvRl0/qpdge+
 4Yeh94EJ1Wc8T8MuNF4GkNt9Dmi7JEaMu0acPw9YfF+S45xXOEx0Cz6FaVqdpOb6zWHJ pw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9med9c31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:16:45 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OK2KJD007160;
 Fri, 24 Sep 2021 20:16:44 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3b93gdh9yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:16:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OKGgeH13763006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 20:16:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3A9D78063;
 Fri, 24 Sep 2021 20:16:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68C2C7806A;
 Fri, 24 Sep 2021 20:16:37 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.36.208])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Sep 2021 20:16:37 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] ARM: dts: aspeed: Fix ADC iio-hwmon battery
 node name
Date: Fri, 24 Sep 2021 15:16:36 -0500
Message-Id: <20210924201636.27837-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SxGe-e8K1-itPwnCFX0syFboh_4RP4Xb
X-Proofpoint-GUID: SxGe-e8K1-itPwnCFX0syFboh_4RP4Xb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=886
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240123
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

In keeping with previous systems, call the iio-hwmon bridge node
"iio-hwmon-battery" to distinguish it as the battery voltage
sensor.

Fixes: 9eefd58fb7 ("ARM: dts: aspeed: Add ADC for AST2600 and enable for Rainier and Everest")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 9d04d195b718..0acf9edb3d6d 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -244,7 +244,7 @@ led-pcieslot-power {
 		};
 	};
 
-	iio-hwmon {
+	iio-hwmon-battery {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 27806deaca66..f7f4973318da 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -219,7 +219,7 @@ fan5-presence {
 		};
 	};
 
-	iio-hwmon {
+	iio-hwmon-battery {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
-- 
2.27.0

