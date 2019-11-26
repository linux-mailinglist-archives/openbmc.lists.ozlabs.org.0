Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA8810A681
	for <lists+openbmc@lfdr.de>; Tue, 26 Nov 2019 23:27:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Mz6Q1n18zDql5
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 09:27:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Mz5Y6hb3zDq7d
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 09:26:21 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAQMMmJV194722; Tue, 26 Nov 2019 17:26:15 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wh9k5eknt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 17:26:15 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAQMO2UU035277;
 Tue, 26 Nov 2019 17:26:14 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wh9k5ekmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 17:26:14 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAQMKIFs015305;
 Tue, 26 Nov 2019 22:26:13 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 2wevd6q250-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Nov 2019 22:26:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAQMQBT537814694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 22:26:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 388CDBE04F;
 Tue, 26 Nov 2019 22:26:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0B8FBE054;
 Tue, 26 Nov 2019 22:26:10 +0000 (GMT)
Received: from MSBARTH-P50.rch.stglabs.ibm.com (unknown [9.10.99.82])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 26 Nov 2019 22:26:10 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Matt Spinler <spinler@us.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Brandon Wyman <bjwyman@gmail.com>
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Set initial MAX31785
 config
Date: Tue, 26 Nov 2019 16:25:58 -0600
Message-Id: <1574807158-14734-1-git-send-email-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_07:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911260189
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

Set the MAX31785 properties in the Rainier device tree for the 4U model
with the currently known settings.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 56 ++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0288709..b4adc57 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -240,25 +240,73 @@
 		fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
 		};
 
 		fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
 		};
 
 		fan@2 {
 			compatible = "pmbus-fan";
 			reg = <2>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
 		};
 
 		fan@3 {
 			compatible = "pmbus-fan";
 			reg = <3>;
-			tach-pulses = <2>;
+			tach-pulses = <4>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@4 {
+			compatible = "pmbus-fan";
+			reg = <4>;
+			tach-pulses = <4>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
+		};
+
+		fan@5 {
+			compatible = "pmbus-fan";
+			reg = <5>;
+			tach-pulses = <4>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
 		};
 	};
 
-- 
2.7.4

