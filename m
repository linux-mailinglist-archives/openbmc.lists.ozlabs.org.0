Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C8129E282
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 03:17:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM8GT2X59zDqYk
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 13:17:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cciPlgmY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM8Cw3Z9qzDqKg
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 13:15:08 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T21ATV149405; Wed, 28 Oct 2020 22:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0g2koY/vcTUcafuMPvgOSHLgxSloNAtPWF+RLRBYuJI=;
 b=cciPlgmYlILqaF4/7cEX7VvAa+/C6AnnNEHqeIYNsVO7Si0bsORbevWeNmAAYRrBVYJm
 ZuW6labr/95iLQUXiCytF4d2jriIQtRDNWxXfHNItTpSk531JC/WfL+pr/wVlOJ+Iorv
 lysplv9DqlOAE8lGgz9CUUXmAqCguNSWnszzJXtkA/SoFgtesLGH/lA1bvqytkOY9wau
 hZFTEM2NGjGmuS/prJNm/Way4p8diSe+EN9vLeDHQV+VYuDikWKulueTblyoZ14TurFJ
 NTBxWxCEZY1k7NuPpYzyOjDdC3v8Cuhw9UDU3XyJx210GDduCMrseMUNYnWJnMDx3lvi 8A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34f6ufw08u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 22:15:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T2Cb8W031059;
 Thu, 29 Oct 2020 02:15:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 34etf94p62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 02:15:04 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09T2Et5550790888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 02:14:55 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D97B6A047;
 Thu, 29 Oct 2020 02:15:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB6776A063;
 Thu, 29 Oct 2020 02:15:02 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.85.168.238])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Oct 2020 02:15:02 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc v2 1/3] ARM: dts: Aspeed:
 Tacoma and Rainier: Add eMMC nodes and parameters
Date: Wed, 28 Oct 2020 21:14:48 -0500
Message-Id: <20201029021450.12118-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029021450.12118-1-eajames@linux.ibm.com>
References: <20201029021450.12118-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=830 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 suspectscore=13 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010290007
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the necessary eMMC/SDHC nodes and information to use the eMMC
from SPL and U-Boot.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/dts/ast2600-rainier.dts | 8 ++++++++
 arch/arm/dts/ast2600-tacoma.dts  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index ce530eb92b..67e177baf1 100755
--- a/arch/arm/dts/ast2600-rainier.dts
+++ b/arch/arm/dts/ast2600-rainier.dts
@@ -18,6 +18,7 @@
 	};
 
 	aliases {
+		mmc0 = &emmc_slot0;
 		spi0 = &fmc;
 		spi1 = &spi1;
 	};
@@ -89,9 +90,16 @@
 	};
 };
 
+&emmc {
+	u-boot,dm-pre-reloc;
+	timing-phase = <0x700ff>;
+};
+
 &emmc_slot0 {
+	u-boot,dm-pre-reloc;
 	status = "okay";
 	bus-width = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emmc_default>;
+	sdhci-drive-type = <1>;
 };
diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
index 22b9f39fa2..85d1e3902b 100755
--- a/arch/arm/dts/ast2600-tacoma.dts
+++ b/arch/arm/dts/ast2600-tacoma.dts
@@ -18,6 +18,7 @@
 	};
 
 	aliases {
+		mmc0 = &emmc_slot0;
 		spi0 = &fmc;
 		spi1 = &spi1;
 	};
@@ -80,9 +81,16 @@
 	};
 };
 
+&emmc {
+	u-boot,dm-pre-reloc;
+	timing-phase = <0x700ff>;
+};
+
 &emmc_slot0 {
+	u-boot,dm-pre-reloc;
 	status = "okay";
 	bus-width = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_emmc_default>;
+	sdhci-drive-type = <1>;
 };
-- 
2.26.2

