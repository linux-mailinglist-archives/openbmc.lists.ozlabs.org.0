Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D97BBDC0
	for <lists+openbmc@lfdr.de>; Fri,  6 Oct 2023 19:30:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LEsCTDxw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2FnF3C44z3cgk
	for <lists+openbmc@lfdr.de>; Sat,  7 Oct 2023 04:30:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LEsCTDxw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2FkX5tsRz3ccQ
	for <openbmc@lists.ozlabs.org>; Sat,  7 Oct 2023 04:28:04 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396HRMX4029542;
	Fri, 6 Oct 2023 17:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=oKzEGTi3bEnmhbFedPS063e/wcQ0jgUo7NrqJaKlbtY=;
 b=LEsCTDxwMC4cYAkVvd2EApDdZlKaq5CiuQUfQYGGjfMHXTCACHCrJhBmvpS3UGFB8ZnZ
 m8UiSG9bvdo0C5QR95ozsIYJNvvP+Cn17t0qNTUnZG7p69705L9OTaDq27N9gdPgH9aP
 tgwLV4lQ9opMz3J84M1PGCV2NzPcqZvsRgQvDvHBhUmqKOI0BsgvAkKgS80F1ls3k69h
 U6qRQ1mdzD/dig5HLAvdj75jkpX2Vjptcy1di4B8XYmzgGOg1mcRBdxI1UomCYU1V2Cm
 jB/hZY5u1ICKveIMRs0CReL6J1wwEEVV3ohkuFzuIUCTHFJKi8aoMzMJD+ta8G9UPfKM ag== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjpnc00d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:28:00 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396GseTv010931;
	Fri, 6 Oct 2023 17:27:59 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf0q3a03t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:27:59 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396HRv0u38076754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 17:27:58 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC80658058;
	Fri,  6 Oct 2023 17:27:57 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E9785805B;
	Fri,  6 Oct 2023 17:27:57 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.60.170])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 17:27:57 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.5 2/4] ARM: dts: aspeed: Everest: Add fan controller properties
Date: Fri,  6 Oct 2023 12:27:33 -0500
Message-Id: <20231006172735.420566-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231006172735.420566-1-eajames@linux.ibm.com>
References: <20231006172735.420566-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 79lxoUGFo0rG2rTNUG5E4zUZ0NygMxWP
X-Proofpoint-GUID: 79lxoUGFo0rG2rTNUG5E4zUZ0NygMxWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_13,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the necessary Max chip specific fan properties.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
index 1f59ab28d29b..fdb3ccaf0cb5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts
@@ -2042,24 +2042,52 @@ fan@0 {
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
2.39.3

