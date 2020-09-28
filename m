Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C311927B648
	for <lists+openbmc@lfdr.de>; Mon, 28 Sep 2020 22:29:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0YzR6qqbzDqQW
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 06:29:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Saw1VBId; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0YxJ51y7zDqMw
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 06:28:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SKREnL045887; Mon, 28 Sep 2020 16:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RmeDAJQpxNO156S5rhRRavAzFAAPuSOfL8uOpvUp/8w=;
 b=Saw1VBIdectBu72J84aSDqnATeNkWC9tAaxTP5Z98T7UXrD6mzobX35NY1uz/wk2Ef7N
 aNBSwejIfVVZvLBUhcxakMt1BwJxgP/9hYoBi4tfuQBsjAuwiqa5+6yGCf33rDNRFF68
 hNsYrUv3mywiND1kxdW6LGRxX4PH6mWvy8Kcj0CnpAwoJW5mNs+25r1s186ZIuYrbNn8
 QtXM1S1VITQ3gvd0fage6PpQwBspVJCxpVdybaRC3co9MNcmYjeqbTElVXBGmqOg2kQD
 LGueZ+29OLgj6em1LM3I/ILcyOVYbSJKynAwMxJjWNZoR9Wyx5jv1wglxt3cd3LFQSpI mg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33upamrxd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 16:28:00 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SKRHiE030914;
 Mon, 28 Sep 2020 20:27:59 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 33sw993nht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 20:27:59 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SKRwYu55116032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 20:27:58 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D36C7B2066;
 Mon, 28 Sep 2020 20:27:58 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62528B2067;
 Mon, 28 Sep 2020 20:27:58 +0000 (GMT)
Received: from SHADE6A.ibmuc.com (unknown [9.211.158.203])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 20:27:58 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH U-Boot v2019.04-aspeed-openbmc 1/3] ARM: dts: Aspeed: Tacoma
 and Rainier: Add eMMC nodes and parameters
Date: Mon, 28 Sep 2020 15:27:51 -0500
Message-Id: <20200928202753.58351-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928202753.58351-1-eajames@linux.ibm.com>
References: <20200928202753.58351-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_22:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=13 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=723 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009280153
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

