Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E711A688228
	for <lists+openbmc@lfdr.de>; Thu,  2 Feb 2023 16:28:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P72kF5Phzz3f5t
	for <lists+openbmc@lfdr.de>; Fri,  3 Feb 2023 02:28:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTfP6A8i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTfP6A8i;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P72jj0FQZz3f4v
	for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2023 02:28:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312F5xma036551;
	Thu, 2 Feb 2023 15:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wzvigu+eWLk1tLjDrG4JWMi16YHEVct2Oasya48ToE0=;
 b=UTfP6A8id6/8PaipOwBdmIwtYpuB9+v08H7DrUgYmh8BgF5omBFB1Dtwu0+yA4YphDR1
 RQkmEBBsekbS/bim8133s4K1saioumoJzxXBqCSXr4sGo5R56XJXPHud8HMhqgD/Pfgz
 bUtrhhUOgBX7B8NiypOMM/2iFhGLE5ylYML97J/m/0H7HGxKAbOn2cd7OxOEkk5ZaX1O
 ppuAn4dzowd00xvxmlZe0sMS77lbeMIc69fYMKu04YdOIKpO6IXiwj97Zne68PAcOzwb
 p6Z/bR1p6PEbkdwCja7TzYE7cR/PBHCTDzhkPPTECahX8zYFkd3ppEokWrjYi4L6PzH+ Vw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngeuthn14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 15:28:03 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312FDFwS026774;
	Thu, 2 Feb 2023 15:28:02 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtnc4as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 15:28:02 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312FS1C78848098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 15:28:01 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13DB358058;
	Thu,  2 Feb 2023 15:28:01 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 896E258054;
	Thu,  2 Feb 2023 15:28:00 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.65.214.66])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 15:28:00 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.0] ARM: dts: aspeed: p10bmc: Update battery node name
Date: Thu,  2 Feb 2023 09:27:59 -0600
Message-Id: <20230202152759.67069-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: j7WWucEcfKhj9sbQl4TZZ34Sft_167im
X-Proofpoint-GUID: j7WWucEcfKhj9sbQl4TZZ34Sft_167im
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxlogscore=901 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020135
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The ADC sensor for the battery needs to be named "iio-hwmon" for
compatibility with user space applications.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index e2a9a18bda57..04f7dde6bcea 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -122,7 +122,7 @@ fan1-presence {
 		};
 	};
 
-	iio-hwmon-battery {
+	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1448ea895be4..8ad5fe9c2990 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -244,7 +244,7 @@ led-pcieslot-power {
 		};
 	};
 
-	iio-hwmon-battery {
+	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 20ef958698ec..a3c55a0cc833 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -220,7 +220,7 @@ event-fan5-presence {
 		};
 	};
 
-	iio-hwmon-battery {
+	iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc1 7>;
 	};
-- 
2.31.1

