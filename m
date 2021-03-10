Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572EE334533
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 18:33:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwfLX2dZNz3cTp
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 04:33:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNyUI30R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hNyUI30R; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwfKV2qWpz30Jn
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 04:32:29 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12AHU55O096400; Wed, 10 Mar 2021 12:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Yb/AU1SxofUercM/G+1D3eiUBtBc7+p3RtyLB1TwFyA=;
 b=hNyUI30RVf/5OuAUWwEi6rldlTjamb88vv5DlfiOwWRfFlGxTMzxy0kpu3pcAtkHpJH9
 Om9iFmQYE8Wu6oJSnhlPK458f9xaWjgrClwuRvQqA5baQcQOVvft0tNAWYxNSTLbkbK4
 gwmiZcLLZU0XTEMaVJ5uYRVJz0jHnJzRUAWA79qJkJbD8v5O3O9o+Xze/yivlsajMUhT
 jBlmRJXO3XIc/HpFMLLedanGkeSeqdos5ctDc5QcaxKMDb4DweZ7uMyoHYAoHklhZRxr
 QubA5OVH2gOeOOa6hoHVJAp+sBJAge2+ebofVyPRFONocyd0RPsVAI0uigaT7Z2WLyMI HA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3772jq02ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 12:32:25 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12AHREpR020017;
 Wed, 10 Mar 2021 17:32:24 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3768mh1mh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 17:32:24 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12AHWOe328049800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Mar 2021 17:32:24 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E44AC062;
 Wed, 10 Mar 2021 17:32:24 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80D19AC064;
 Wed, 10 Mar 2021 17:32:23 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.115.36])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Mar 2021 17:32:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 1/3] ARM: dts: aspeed: rainier: Enable fan
 watchdog
Date: Wed, 10 Mar 2021 11:32:20 -0600
Message-Id: <20210310173222.17556-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_10:2021-03-10,
 2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100083
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

Set watchdog 1 to pulse the fan watchdog circuit that drives the FAULT
pin of the MAX31785, resulting in fans running at full speed, if at
any point the BMC stops pulsing it, such as a BMC reboot at runtime.
Enable watchdog 2 for BMC reboots.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 85fb60d16fdf..9f34136ec40f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -3193,6 +3193,20 @@ flash@0 {
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
+&wdt2 {
+	status = "okay";
+};
+
 &xdma {
 	status = "okay";
 	memory-region = <&vga_memory>;
-- 
2.27.0

