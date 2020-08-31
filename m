Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B411D258186
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 21:05:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgKRG6ldRzDqVF
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 05:05:46 +1000 (AEST)
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
 header.s=pp1 header.b=C9HIMUWr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgKLd22s8zDqTs
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 05:01:44 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07VJ12BZ125702; Mon, 31 Aug 2020 15:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=inQUh5zc4Q4DLjNReCpvy90FVlzyy9ByP5Hfu9oTEvs=;
 b=C9HIMUWrTqctsMh+KiYNXSpHmnqIZyHyafEnLI9/lEma/kGHs7j8VHRZVjdAyzUrK8vK
 H4fnMmYvZemQLPv2n1zM+dOlk55miJ43Q5VFQvPnydo8kxDXNwZbMEa61BjpfMwD4Qh3
 PtYd6VjHA2SpST6aNHC8Vk7hVpGNQeSgkjB40AFJ1F++POoVbF81rocuK39sQjNPHnjb
 dntTbH+DUvR67GHVJ5mQUMNSfx59EcMncHyCJ95u4T9BX2ifru0L46C8NAQDX0Mwthnc
 uqGUvEtMP4k3uAP3tuhlegAxW0CUWVzlr5cOW4fHEJY+aCDKGb5UMZW1XrVswZiIbABU uw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3395dt2hjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 15:01:42 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07VIukce010555;
 Mon, 31 Aug 2020 19:01:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 337en927gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Aug 2020 19:01:42 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07VJ1frR54526418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 19:01:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2770AE060;
 Mon, 31 Aug 2020 19:01:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EF55AE05C;
 Mon, 31 Aug 2020 19:01:41 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.163.23.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Aug 2020 19:01:41 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 4/5] ARM: dts: Aspeed: Tacoma
 and Rainier: Add eMMC nodes and parameters
Date: Mon, 31 Aug 2020 14:01:29 -0500
Message-Id: <20200831190130.47060-5-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200831190130.47060-1-eajames@linux.ibm.com>
References: <20200831190130.47060-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-31_09:2020-08-31,
 2020-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 suspectscore=13 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=715 priorityscore=1501
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008310110
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
---
 arch/arm/dts/ast2600-rainier.dts | 8 ++++++++
 arch/arm/dts/ast2600-tacoma.dts  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
index ce530eb92b..67e177baf1 100644
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
index 22b9f39fa2..85d1e3902b 100644
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

