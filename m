Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE55267EF
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FZ75RXYz3c97
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:12:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zqn7n+63;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zqn7n+63; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSY3mjWz3c7y
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:25 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DEwQa4005753;
 Fri, 13 May 2022 17:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+i/izaS2tUeCZ1i5HZRZvDpuKxbejNCoQsOm4vY08Ic=;
 b=Zqn7n+63a3b1rleSdNfUxFyYpJH23+yzmg6mrveuHCOlfOsb24htCR7QSbAC0legqzAF
 HoVFkv1T9XxQJzVSlnPlBqtx6CnjJ/Mtj56a5OZ3bwACct5LwKcIr7g8e6+S7ABVbyFp
 /prrd2wDNxzrNgFAG5uPnLtKPjfvXzWRhAvoS000eOxdQkqitU1CXeenqU4cyyL0yfQ5
 jyOiINQ1p/5dKel+x7XYKey/V4+CxAlBisQahx5n9bxTClZMYu/5WQeyGitR7EOE9bVB
 BkoTSLCFBaIEsiVW8lDo5mUORpbJan4kWdOYLstZQf9nVfsIdciitwg51wUvZjqVGXX/ Kw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1sjkafy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:22 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DGhZbr005871;
 Fri, 13 May 2022 17:07:22 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3fwgdakrmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7LAp60490196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5223BAC059;
 Fri, 13 May 2022 17:07:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF948AC062;
 Fri, 13 May 2022 17:07:20 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:20 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 8/9] arm: dts:
 ast2600-rainier: Add NPCT75X TPM
Date: Fri, 13 May 2022 12:07:14 -0500
Message-Id: <20220513170715.43475-9-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YxTiK2Zg5IgtDfUZ9Ud7U561AI6iyE7K
X-Proofpoint-ORIG-GUID: YxTiK2Zg5IgtDfUZ9Ud7U561AI6iyE7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=818
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205130073
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
Cc: cjengel@us.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the TPM device on I2C bus 12.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/dts/ast2600-rainier.dts | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index 8a44fd8a0a..aa91b12ed3 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -106,12 +106,14 @@
 
 &gpio0 {
 	u-boot,dm-pre-reloc;
+};
+
+&i2c12 {
+	status = "okay";
 
-	tpm_reset {
-		u-boot,dm-pre-reloc;
-		gpio-hog;
-		output-high;
-		gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
+	tpm@2e {
+		compatible = "nuvoton,npct75x";
+		reg = <0x2e>;
 	};
 };
 
-- 
2.27.0

