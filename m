Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8B3604ABC
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 17:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsvLW35SMz3cSh
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 02:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lG95kE3y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lG95kE3y;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsvGs0xxCz2yQg
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 02:07:32 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JEpLsG011393;
	Wed, 19 Oct 2022 15:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sTFXHrPFXZaFnzzjyGGfHguH2D/xXW+gCHzGxErsvc8=;
 b=lG95kE3yXSLR+UtJLCNiC0dC9vSH5dnrH3yYa+Nh2ZteS0ACoq7fyxmkExvscLu7zDOP
 uDXstaQ5UmO46n0/CKnYSgEX4jGU4MmNidLcJBSU+e3f0NmLIwcohwArP51o44LFn7VY
 jeTVmiPacm9tFgSsuXaB0K+CydcN8vcK07Wwz3+FoRKYZPrzouob9Wgw8ZhuvVIzdjBa
 6T8MiIl6GeJ3MWRQHlX6MlJEACal/cqlJtQlIt14syuaVjyEv1c/6mQMEnBFLyE9iGKJ
 6HXz58NrGZYN/K3A6HMmZJC0/thjyY+YSxfOyjwSAEV2b66je2EnBpzPkLtfWLwhCq5F 1A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kakc9gk4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:28 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JEpe3M014214;
	Wed, 19 Oct 2022 15:07:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma02wdc.us.ibm.com with ESMTP id 3k7mga6pgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Oct 2022 15:07:27 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29JF7Owi23790212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Oct 2022 15:07:25 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4989C58055;
	Wed, 19 Oct 2022 15:07:26 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4F5B58043;
	Wed, 19 Oct 2022 15:07:25 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.7.147])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Oct 2022 15:07:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0 3/3] ARM: dts: aspeed: p10bmc: Set watchdog pre-timeout interrupt
Date: Wed, 19 Oct 2022 10:07:14 -0500
Message-Id: <20221019150714.606390-4-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221019150714.606390-1-eajames@linux.ibm.com>
References: <20221019150714.606390-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eVmY0RpEoL-QyohbaenaQAZAtE4i-kMw
X-Proofpoint-GUID: eVmY0RpEoL-QyohbaenaQAZAtE4i-kMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_08,2022-10-19_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=827 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190081
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

Specify the pre-timeout interrupt time to enable the interrupt on
P10 BMC systems.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 1 +
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 6789c1ec286a..7acdda8791a0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -889,6 +889,7 @@ &wdt1 {
 };
 
 &wdt2 {
+	aspeed,pre-timeout-irq-us = <600000>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index fcc890e3ad73..6d2e68e3fddf 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -3653,6 +3653,7 @@ &wdt1 {
 };
 
 &wdt2 {
+	aspeed,pre-timeout-irq-us = <600000>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 4879da4cdbd2..8fd63df3959c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -2376,6 +2376,7 @@ &wdt1 {
 };
 
 &wdt2 {
+	aspeed,pre-timeout-irq-us = <600000>;
 	status = "okay";
 };
 
-- 
2.31.1

