Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 118014AC2B4
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 16:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsqRY4xt2z30RD
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 02:14:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IHg2zdga;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IHg2zdga; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsqMH06GNz3bPD
 for <openbmc@lists.ozlabs.org>; Tue,  8 Feb 2022 02:10:18 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217ENiFl029562; 
 Mon, 7 Feb 2022 15:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IC7AWPKwYLZyQGENxMz+yYumlmC9sy49bVfY/88Udyg=;
 b=IHg2zdgaCpWNJkPfiaE2X+73jpyf4zH/fiSls6VgMbK5cAIvt/LKir6qYq/r1/wu0Gy+
 ZBaXTLZeKyaPRna4RPzgMgq2iiSLD/zbXlvTnsA8fPQ1lZLdixZBNJl3ZVdCP19LX6E6
 JFeKZU3aP3hyBtEc/svNLJ567eyDRXOkwxV41VLvECZgfq5EnZ4YdJ9NWiH23IKo2FSY
 d+mC3p9ODqjMFcJTuhXfxTiSiYvB84G8y9jHg6bTgnCI+Whw5e+Xhe02lOt5C+7onkRX
 MeZ7uGTC8tInd2qLWHpsds9lzRbjsWUwle4UyNulz9W1zIestZx1mFlf9cSZTHJ8/su/ Sg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e355a956n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:10:15 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217F28Li029477;
 Mon, 7 Feb 2022 15:10:15 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3e1gvaf0uj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 15:10:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217FADJ734931184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 15:10:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8FEA1AE07B;
 Mon,  7 Feb 2022 15:10:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2B9DAE060;
 Mon,  7 Feb 2022 15:10:12 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.55.47])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 15:10:12 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
Date: Mon,  7 Feb 2022 09:10:04 -0600
Message-Id: <20220207151004.15146-7-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220207151004.15146-1-eajames@linux.ibm.com>
References: <20220207151004.15146-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4FFOobrAyg2neDADorZ5gUj2G6IPIOtm
X-Proofpoint-ORIG-GUID: 4FFOobrAyg2neDADorZ5gUj2G6IPIOtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070097
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

