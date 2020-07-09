Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3BE219EF9
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 13:18:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2YZP3mGYzDqY3
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 21:18:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2YY92B36zDqsv
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 21:17:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069B30Sj168813; Thu, 9 Jul 2020 07:17:13 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 325r2cedg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 07:17:13 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069BFQgO009999;
 Thu, 9 Jul 2020 11:17:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 325mr2rs9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 11:17:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 069BFsDB32899568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 11:15:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC9BF4C044;
 Thu,  9 Jul 2020 11:15:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F9464C052;
 Thu,  9 Jul 2020 11:15:54 +0000 (GMT)
Received: from [9.85.95.123] (unknown [9.85.95.123])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Jul 2020 11:15:54 +0000 (GMT)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: [PATCH 1/2] rainier: Add leds that are off 9551 on Operator Panel
Message-Id: <F51AD272-73BB-412F-8FE0-55A54BCE6A32@linux.vnet.ibm.com>
Date: Thu, 9 Jul 2020 16:45:52 +0530
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_06:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=963
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090088
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


These are LEDs that are controlled by 9551

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 =
++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0b5c6cc..ecbce50 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -69,6 +69,38 @@
 		};
 	};
=20
+	leds {
+		compatible =3D "gpio-leds";
+
+		/* System ID LED that is at front on Op Panel */
+		front-sys-id0 {
+			retain-state-shutdown;
+			default-state =3D "keep";
+			gpios =3D <&pca1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System Attention Indicator ID LED that is at front on =
Op Panel */
+		front-check-log0 {
+			retain-state-shutdown;
+			default-state =3D "keep";
+			gpios =3D <&pca1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure Fault LED that is at front on Op Panel */
+		front-enc-fault1 {
+			retain-state-shutdown;
+			default-state =3D "keep";
+			gpios =3D <&pca1 2 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System PowerOn LED that is at front on Op Panel */
+		front-sys-pwron0 {
+				retain-state-shutdown;
+			default-state =3D "keep";
+			gpios =3D <&pca1 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 };
=20
 &gpio0 {
@@ -514,6 +546,56 @@
 		};
 	};
=20
+	pca1: pca9551@60 {
+		compatible =3D "nxp,pca9551";
+		reg =3D <0x60>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		gpio-controller;
+		#gpio-cells =3D <2>;
+
+		gpio@0 {
+			reg =3D <0>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg =3D <1>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg =3D <2>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg =3D <3>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg =3D <4>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg =3D <5>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg =3D <6>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg =3D <7>;
+			type =3D <PCA955X_TYPE_GPIO>;
+		};
+	};
+
 	dps: dps310@76 {
 		compatible =3D "infineon,dps310";
 		reg =3D <0x76>;
--=20
1.8.3.1


