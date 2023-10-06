Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CAB7BBDC6
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 19:31:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mfeVks/3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2FpG6TcQz3dfg
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 04:31:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mfeVks/3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2Fkc0cvVz3ccQ
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 04:28:07 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396HRlGw017891;
	Fri, 6 Oct 2023 17:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BzB/APy2EhaCLgrrAAXogHFhFdQPLzZK8MM0EiX6MRY=;
 b=mfeVks/338+pxZAo45T/kU/V+aP7/pmrApE+Q4VKrqs1d4p3zj+D9h7pED9IPcqL70dV
 kWK30lKZDmVxl9q5bgXWkVWhcIzJMFWWb3KBkc/j9DgfVnYtwcBYD6BqvJb74YjK4mvH
 VGbgwUg1iheFSG6b7V1x7XIv15RNRGxs71Nz0S+oQNYUoWIbdOONMzdhqOyZc/WImqX7
 OLJ89pXoxzUCkPcXz6F4fb0KylVw79wQ+/RC1fxLPsaa967p+MkFpSaR0VUZGaphpKWc
 OGp3wCzo8bEp8aPmVttCOCeZ+s8KHD0TMfA3ujj0mWV7YW0hiGtMwu+1alB228T8F1c7 aA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjpndg05q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:28:03 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396GxuV9005859;
	Fri, 6 Oct 2023 17:28:02 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0uasbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:28:02 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396HRwf130540250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 17:27:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD4345805E;
	Fri,  6 Oct 2023 17:27:58 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ACEE58059;
	Fri,  6 Oct 2023 17:27:58 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.60.170])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 17:27:58 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 3/4] ARM: dts: aspeed: Bonnell: Add fan controller properties
Date: Fri,  6 Oct 2023 12:27:34 -0500
Message-Id: <20231006172735.420566-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231006172735.420566-1-eajames@linux.ibm.com>
References: <20231006172735.420566-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 21Vib9MRyl-f2G5vbYpJejiEYaioiye7
X-Proofpoint-ORIG-GUID: 21Vib9MRyl-f2G5vbYpJejiEYaioiye7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_13,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060130
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
Cc: Eddie James <eajames@us.ibm.com>, Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eddie James <eajames@us.ibm.com>

Bonnell uses the same dual rotor fans as Rainier 2U.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
index cad1b9aac97b..29d68d7e876f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts
@@ -280,12 +280,26 @@ fan0: fan@0 {
 			compatible = "pmbus-fan";
 			reg = <0>;
 			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
 		};
 
 		fan1: fan@1 {
 			compatible = "pmbus-fan";
 			reg = <1>;
 			tach-pulses = <2>;
+			maxim,fan-rotor-input = "tach";
+			maxim,fan-pwm-freq = <25000>;
+			maxim,fan-dual-tach;
+			maxim,fan-no-watchdog;
+			maxim,fan-no-fault-ramp;
+			maxim,fan-ramp = <2>;
+			maxim,fan-fault-pin-mon;
 		};
 	};
 
-- 
2.39.3

