Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30673338F
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 16:26:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZuwCFX7m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjM1D2fBPz3bnL
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 00:26:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZuwCFX7m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjM0c1nS5z2ygG
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 00:26:23 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GEHlJU018583;
	Fri, 16 Jun 2023 14:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2yXstbu3hmJ5fx+JjdPnanCxaPV6yp0lEpOJxJHm4fI=;
 b=ZuwCFX7m42SIUdETXIURMfbuXDXt+h5bS5/q3lT8L3m9toQpKHAOj+ODCMj2AoKB+WHe
 znOhtaAUE7GwaqnAnQ1POoGEjayzaHbaxst70lFwrKYATs/yZ5B5IEwAVBilnzWAn/cl
 uK8rt7QLbc1f/eS2WfXCvR8cGTNM31xuQUcGO6q5n/gPIcBarWB0wKhAGttXB5jf3qTy
 pDYarRc0dmEk1/rig4j02qYMM8FaXM3QfWgcbToUfoutFOfUltKDLUBN+dKjT66cg7za
 BeSdOaMHs6Vy4xTNIe65yXrOjueaZ4xs3YWr5MNh1oZ8eoWLDXXbPgypwFyfpcdxBMMm cQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8sc8g6bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 14:26:17 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35GCPksI027186;
	Fri, 16 Jun 2023 14:26:16 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3r4gt6j0kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 14:26:16 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GEQEY631588890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 14:26:14 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2FA558065;
	Fri, 16 Jun 2023 14:26:13 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7A1C58063;
	Fri, 16 Jun 2023 14:26:13 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.27.6])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 14:26:13 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.1] ARM: dts: aspeed: bonnell: Add reserved memory for TPM event log
Date: Fri, 16 Jun 2023 09:26:10 -0500
Message-Id: <20230616142610.356623-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RIg49AO9-LAD4AEJ_dsegqLDRWvdhkmA
X-Proofpoint-ORIG-GUID: RIg49AO9-LAD4AEJ_dsegqLDRWvdhkmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_09,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=894 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160127
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

Trusted boot support requires the platform event log passed up
from the bootloader. In U-Boot, this can now be accomplished with
a reserved memory region, so add a region for this purpose to the
Bonnell BMC devicetree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index 79516dc21c01..c65688aed661 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -61,6 +61,11 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
+		event_log: tcg_event_log@b3d00000 {
+			no-map;
+			reg = <0xb3d00000 0x100000>;
+		};
+
 		ramoops@b3e00000 {
 			compatible = "ramoops";
 			reg = <0xb3e00000 0x200000>; /* 16 * (4 * 0x8000) */
@@ -788,8 +793,9 @@ &i2c12 {
 	status = "okay";
 
 	tpm@2e {
-		compatible = "nuvoton,npct75x";
+		compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
+		memory-region = <&event_log>;
 	};
 
 	eeprom@50 {
-- 
2.39.3

