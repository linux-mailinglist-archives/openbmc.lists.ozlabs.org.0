Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677AC69EC91
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 02:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLzfQ0k36z3c6V
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 12:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PNr4lhi3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PNr4lhi3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLzdm4Yygz3bgn
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 12:51:08 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M1hWQx024002;
	Wed, 22 Feb 2023 01:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=gZSfsSLm9fl2niQ83oDpnR7UKEdloo7CNWenZCynQZE=;
 b=PNr4lhi3zZNVzocD2EriBkriKFZtErvM+Pd0yOlLpXI0TfePGdKz0R2rVAKvtMjFNYD5
 Quawm5egtjA6x1TrexZSx5MJkl64BqD6v9X4JBoFpLMr+Z/Qkd/hPyZhh/p3/jdw1kI3
 N+wSPQdbMSYTJeyB3sZquYQ2jaifrs+nJ1U5wPtDe9sze5eqJL4zpldURwCDsLgIcJ3u
 lfXaT+l2VMMkjzbqN2oyaMozrbixFUQv7PbKSsd1jBEegiU0PvLvshafDtq5B7eOFmuR
 xHNpwkSssMx4MnXJmTFONgOFckuY8W9pxUoQ7UZl3yHlVPp4gqUrlXlf9UD729b89PnV dg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nw9mu03nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 01:51:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31M0j01m011420;
	Wed, 22 Feb 2023 01:51:00 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ntpa7k595-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 01:51:00 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M1owtN39059870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 01:50:58 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC6BC5803F;
	Wed, 22 Feb 2023 01:50:58 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CF505805A;
	Wed, 22 Feb 2023 01:50:58 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.160.165.73])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Feb 2023 01:50:58 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH dev-6.1] ARM: dts: aspeed: everest: Add reserved memory for TPM event log
Date: Tue, 21 Feb 2023 19:50:56 -0600
Message-Id: <20230222015056.3903734-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lUFFYB6MeNwWiHzIi4OMdFoL2Qc8NOSX
X-Proofpoint-ORIG-GUID: lUFFYB6MeNwWiHzIi4OMdFoL2Qc8NOSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_14,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=849 lowpriorityscore=0
 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220008
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
Everest BMC devicetree.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1448ea895be4..95d1ab6811ff 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -162,6 +162,11 @@ reserved-memory {
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
@@ -1887,6 +1892,7 @@ &i2c12 {
 	tpm@2e {
 		compatible = "nuvoton,npct75x", "tcg,tpm-tis-i2c";
 		reg = <0x2e>;
+		memory-region = <&event_log>;
 	};
 };
 
-- 
2.31.1

