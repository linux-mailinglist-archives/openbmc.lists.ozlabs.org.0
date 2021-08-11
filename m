Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1B73E94FB
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDjV0Vvpz2xvN
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:47:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZwcWV3tc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZwcWV3tc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl5SJ6z301B
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFY37r132441; Wed, 11 Aug 2021 11:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xyiy2RMdo6p9xPL0ldQieymS01kfbdcm5pY0DUCM/I0=;
 b=ZwcWV3tcm9It4ImAn2Ro1h9v43AlQ6EcHx664U2QIcEOUaWQ3W+TqXckANPUbWnAKYx9
 j33UKW6R/p1G3p34AWZPi8hgeizXp3QXE+TIw+HQrV31R05N0kPFZ4/DnmQ7yntZ+J9T
 p56nfBI3L1wkedBHpOLeTLj3i7TKWqAxV4ZBtbS9Gd8qPVlipCv0GyhFXOLFzheqXGHt
 ol46T5NHP+r89Te5C+lVvnCLJdILpSUV24+2IVSRELXEtlucVOF2dmrDWS3N+oWxa7R9
 Gf6eIpWfqHbxM9Nfnew66kaCapUvln+WNSLGkqJTTkusZyYuV/eD8DN4DaXVWwEMtb9y Xg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3acgpms63m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:39 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFXc3q002794;
 Wed, 11 Aug 2021 15:42:38 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3a9htdensx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:38 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgaXr32768300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:36 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C13226A04D;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97D156A04F;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:36 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 09/14] ARM: dts: aspeed: Everest: Add fan
 controller properties
Date: Wed, 11 Aug 2021 10:42:27 -0500
Message-Id: <20210811154232.12649-10-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9IHYGn-2otl32xiAQIIhQpnPE7_RWjsV
X-Proofpoint-ORIG-GUID: 9IHYGn-2otl32xiAQIIhQpnPE7_RWjsV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110104
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

Add the necessary Max chip specific fan properties.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 28 ++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 01a0b2b03ddd..83fc29309154 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2510,24 +2510,52 @@ fan@0 {
 					compatible = "pmbus-fan";
 					reg = <0>;
 					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
 				};
 
 				fan@1 {
 					compatible = "pmbus-fan";
 					reg = <1>;
 					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
 				};
 
 				fan@2 {
 					compatible = "pmbus-fan";
 					reg = <2>;
 					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
 				};
 
 				fan@3 {
 					compatible = "pmbus-fan";
 					reg = <3>;
 					tach-pulses = <2>;
+					maxim,fan-rotor-input = "tach";
+					maxim,fan-pwm-freq = <25000>;
+					maxim,fan-dual-tach;
+					maxim,fan-no-watchdog;
+					maxim,fan-no-fault-ramp;
+					maxim,fan-ramp = <2>;
+					maxim,fan-fault-pin-mon;
 				};
 			};
 
-- 
2.27.0

