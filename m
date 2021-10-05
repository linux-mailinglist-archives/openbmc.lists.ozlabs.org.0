Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAE54230BA
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 21:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP6tl1nMgz2yg6
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 06:23:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qS+pVncP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qS+pVncP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP6tC441mz2xX8;
 Wed,  6 Oct 2021 06:22:42 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 195IGSoG029152; 
 Tue, 5 Oct 2021 15:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=IxD25rDbm/u5c/0cZr2UhQqHUCON5rxL3c1FpfqnLRI=;
 b=qS+pVncPzIs7Vz+3KYnoIu3hbYN6epwOMvUZadmEtorq53xNh1COgZyYwl0VbFoC80Q0
 n1nJLlV3g0IwmDTqeriS4zhtVgWd1fELR1PQiBlFWweCBPdMS2OQGpYas44MofLLu0Nz
 l/Gl3aKZ9LHhLNZFE+AOGlP0Fl+xgo7BOPLOet+qnmx6aI0zHULEqzSu1YsZF1Oxc6ab
 OgcLm7DNbU8jUQTYXc8kd8VsaCpd7g+tZctrEIWr1O/zccuey0aQIMigwfCKyZxlkJh8
 +USMHC45D41aAGair58wH2X8WZnWKHIrfHjlGF1bxdpZMVl0kufZMddp3/u/X10rt/Mf eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bguu8sh8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 15:22:34 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 195IpSHB020591;
 Tue, 5 Oct 2021 15:22:34 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bguu8sh89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 15:22:34 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 195JICxs002209;
 Tue, 5 Oct 2021 19:22:33 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3bef2d9j44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Oct 2021 19:22:33 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 195JMSLN18940312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Oct 2021 19:22:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9417FB206C;
 Tue,  5 Oct 2021 19:22:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC6DCB2064;
 Tue,  5 Oct 2021 19:22:27 +0000 (GMT)
Received: from fstone01p1.aus.stglabs.ibm.com (unknown [9.3.116.196])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Oct 2021 19:22:27 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
To: joel@jms.id.au, eajames@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v3] ARM: dts: aspeed: rainier: Add power-config-full-load gpio
Date: Tue,  5 Oct 2021 19:22:26 +0000
Message-Id: <20211005192226.213539-1-anoo@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uKKUgnI4RP0iibHenc-3QdLTjJvlEZoI
X-Proofpoint-GUID: 0-FZWjGJrQ_ZknfIephQA9Y0N0F01dny
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-05_04,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 phishscore=0 mlxlogscore=991 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050112
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
Cc: spinler@us.ibm.com, derekh@us.ibm.com, openbmc@lists.ozlabs.org,
 Adriana Kobylak <anoo@us.ibm.com>, bjwyman@gmail.com, shawnmm@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Adriana Kobylak <anoo@us.ibm.com>

Add the power-config-full-load described in:
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md#power-config-full-load

The power-config-full-load gpio is designed to be used to specify how
many power supplies the system should have, in rainier it is 2 or 4.  If
enough power supplies fail so that the system no longer has redundancy
(no longer n+1), the hardware will signal to the Onboard Chip Controller
that the system may be oversubscribed, and performance may need to be
reduced so the system can maintain it's powered on state.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
---

v2: Update commit message.
v3: Updated gpio name to power-config-full-load to match design doc.

 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 33fae8ad1305..10bde77fb847 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1998,6 +1998,19 @@ eeprom@51 {
 		reg = <0x51>;
 	};
 
+	pca_pres3: pca9552@60 {
+		compatible = "nxp,pca9552";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+			"", "", "", "", "", "", "", "",
+			"", "", "", "", "", "", "power-config-full-load", "";
+	};
+
 	pca_pres2: pca9552@61 {
 		compatible = "nxp,pca9552";
 		reg = <0x61>;
-- 
2.25.1

