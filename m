Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA934ACC8F
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 00:18:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jt29y2qtqz3bZG
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 10:17:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VkAuoi7F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VkAuoi7F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jt25B1TKwz2ymg
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 10:13:50 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217KTI6P025941; 
 Mon, 7 Feb 2022 23:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IC7AWPKwYLZyQGENxMz+yYumlmC9sy49bVfY/88Udyg=;
 b=VkAuoi7FOCZ5jbKHSxdVVowa9+6GE43hlFlQ5O4KoykhmJVBv53EHkDy07cP/Fa1BSB3
 Qec+AKvaqF56liVzphcxFoWPR+KNl8/cId5WLfAR01lVMvxJrYq5fRuYoR/a73YX1faO
 y3xzjA5nQ8i9zqzvBGVdSQhR82hayrGT4xCkWrHo5l29ig18I3nHkUeKXKYQVfcpKKIq
 TZXmStFGsp30YTzPoCYe1GEeoOJ4cYcgEBQwbIbjwBX2+F5jVL3U5VHmeOzndTzDxCAI
 fhCuAVjhZ7qrB3DAASNjjRoP0TbqQ+HiGKrr0VgDAoL/Pt18OEhSXPbeTOt4tF7Y/6OO 5Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st9ny5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:45 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217NCSQa022113;
 Mon, 7 Feb 2022 23:13:44 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3e1gvat9vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 23:13:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217NDhf936897234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 23:13:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1620FAE063;
 Mon,  7 Feb 2022 23:13:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32773AE067;
 Mon,  7 Feb 2022 23:13:42 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 23:13:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v4 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
Date: Mon,  7 Feb 2022 17:13:34 -0600
Message-Id: <20220207231334.59845-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220207231334.59845-1-eajames@linux.ibm.com>
References: <20220207231334.59845-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZkFLcDRsGf455a7HTg3_fZpKrAe_Ce7-
X-Proofpoint-ORIG-GUID: ZkFLcDRsGf455a7HTg3_fZpKrAe_Ce7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_07,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=931 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070126
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hog the GPIO pin to reset the TPM.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/dts/ast2600-rainier.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index aae507b4c2..d0e82d1512 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -108,3 +108,14 @@
 	u-boot,dm-pre-reloc;
 	status = "okay";
 };
+
+&gpio0 {
+	u-boot,dm-pre-reloc;
+
+	tpm_reset {
+		u-boot,dm-pre-reloc;
+		gpio-hog;
+		output-high;
+		gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+	};
+};
-- 
2.27.0

