Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1014AC318
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:24:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsqh71kSdz30Mn
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:24:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fRFW/bd9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fRFW/bd9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsqdY01GYz30L4
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:22:40 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217Duh4U009716; 
 Mon, 7 Feb 2022 15:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IC7AWPKwYLZyQGENxMz+yYumlmC9sy49bVfY/88Udyg=;
 b=fRFW/bd9+LcgbRZoJxfNy84v9QdY5FB5DnQ2KFD35v1bL2RiawVcmSdKn63rifUQdhcs
 YVcR7y5+7xCmoLls2wDDKICRa4HqbKDVA36P9ei3kST2FnQXhQeuRkiB0hHVmiaJGZEv
 VAgSKMTJiUs6pKKf3sJDhl3QxH2kjUyknJzco61y/qVcBMFXN8YAyfUfd4MdFQtfTpwQ
 UTtFrDmUBZgISqZuT9OdvqGnpZGj7/FF0jmjjI5voaqz3yxf89wFgb6DFTvvuvRhmxxm
 qbdzPALEqh4RS4D2lSlu0FRAbCoFaLuoB1t8JtA2fWPxo0Gs1+nMoyhLKQmrgJdLNS0v Cw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22q0ycmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:22:37 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217FDpdm017533;
 Mon, 7 Feb 2022 15:22:37 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3e1gvafca1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:22:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217FMZhG17826156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:22:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7236BC6063;
 Mon,  7 Feb 2022 15:22:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42401C6069;
 Mon,  7 Feb 2022 15:22:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 15:22:35 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-oepnbmc v3 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
Date: Mon,  7 Feb 2022 09:22:32 -0600
Message-Id: <20220207152232.25745-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220207152232.25745-1-eajames@linux.ibm.com>
References: <20220207152232.25745-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PAApxkX-kEs75i886Xf0hj_iqs44tJ-2
X-Proofpoint-ORIG-GUID: PAApxkX-kEs75i886Xf0hj_iqs44tJ-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202070097
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

