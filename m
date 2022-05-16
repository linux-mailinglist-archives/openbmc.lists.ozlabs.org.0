Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A20527D88
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 08:24:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1q3P4N1Pz3c8V
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 16:24:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=phJ7f7es;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=phJ7f7es; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1q2Z4Byvz2ypn
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 16:23:50 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24FJ6lwe019750
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=ohna0kSQZNJYA8/UiEi0oGFEMePnigdNLHozp+5/CjM=;
 b=phJ7f7esmezM2QgQ8KV5+McWHflr3z5bNqBa70QFuO2Y6dWmQd2MtD5PVjM0MybOl03n
 xIklh44Lif1/4rEo5TQ0dzFtQNwhPTFnCQM/pzp6ab7KXbAoXYLex03H7jICs6dejQNk
 tmy6dznE+Nzsp51PRXPt+04VfSjiAM1TAt8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g29xxf9yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:47 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:36 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 0684264DCAC4; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
Subject: [PATCH v2 1/5] hw: aspeed: Add missing UART's
Date: Sun, 15 May 2022 23:23:24 -0700
Message-ID: <20220516062328.298336-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: uC2rz3Fe-Ad8bkEcQymRVfVvYDvzB3wp
X-Proofpoint-ORIG-GUID: uC2rz3Fe-Ad8bkEcQymRVfVvYDvzB3wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
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
Cc: peter.maydell@linaro.org, zev@bewilderbeest.net, andrew@aj.id.au,
 irischenlj@fb.com, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pdel@fb.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This adds the missing UART memory and IRQ mappings for the AST2400, AST25=
00,
AST2600, and AST1030.

This also includes the new UART interfaces added in the AST2600 and AST10=
30
from UART6 to UART13. The addresses and interrupt numbers for these two
later chips are identical.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c     | 24 ++++++++++++++++++++++++
 hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
 hw/arm/aspeed_soc.c         |  6 ++++++
 include/hw/arm/aspeed_soc.h |  8 ++++++++
 4 files changed, 57 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 9ae9efaac1..fa2cc4406c 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -33,14 +33,38 @@ static const hwaddr aspeed_soc_ast1030_memmap[] =3D {
     [ASPEED_DEV_SBC]       =3D 0x7E6F2000,
     [ASPEED_DEV_GPIO]      =3D 0x7E780000,
     [ASPEED_DEV_TIMER1]    =3D 0x7E782000,
+    [ASPEED_DEV_UART1]     =3D 0x7E783000,
+    [ASPEED_DEV_UART2]     =3D 0x7E78D000,
+    [ASPEED_DEV_UART3]     =3D 0x7E78E000,
+    [ASPEED_DEV_UART4]     =3D 0x7E78F000,
     [ASPEED_DEV_UART5]     =3D 0x7E784000,
+    [ASPEED_DEV_UART6]     =3D 0x7E790000,
+    [ASPEED_DEV_UART7]     =3D 0x7E790100,
+    [ASPEED_DEV_UART8]     =3D 0x7E790200,
+    [ASPEED_DEV_UART9]     =3D 0x7E790300,
+    [ASPEED_DEV_UART10]    =3D 0x7E790400,
+    [ASPEED_DEV_UART11]    =3D 0x7E790500,
+    [ASPEED_DEV_UART12]    =3D 0x7E790600,
+    [ASPEED_DEV_UART13]    =3D 0x7E790700,
     [ASPEED_DEV_WDT]       =3D 0x7E785000,
     [ASPEED_DEV_LPC]       =3D 0x7E789000,
     [ASPEED_DEV_I2C]       =3D 0x7E7B0000,
 };
=20
 static const int aspeed_soc_ast1030_irqmap[] =3D {
+    [ASPEED_DEV_UART1]     =3D 47,
+    [ASPEED_DEV_UART2]     =3D 48,
+    [ASPEED_DEV_UART3]     =3D 49,
+    [ASPEED_DEV_UART4]     =3D 50,
     [ASPEED_DEV_UART5]     =3D 8,
+    [ASPEED_DEV_UART6]     =3D 57,
+    [ASPEED_DEV_UART7]     =3D 58,
+    [ASPEED_DEV_UART8]     =3D 59,
+    [ASPEED_DEV_UART9]     =3D 60,
+    [ASPEED_DEV_UART10]    =3D 61,
+    [ASPEED_DEV_UART11]    =3D 62,
+    [ASPEED_DEV_UART12]    =3D 63,
+    [ASPEED_DEV_UART13]    =3D 64,
     [ASPEED_DEV_GPIO]      =3D 11,
     [ASPEED_DEV_TIMER1]    =3D 16,
     [ASPEED_DEV_TIMER2]    =3D 17,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 4161a0cc4b..f3ecc0f3b7 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -61,7 +61,18 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_DEV_IBT]       =3D 0x1E789140,
     [ASPEED_DEV_I2C]       =3D 0x1E78A000,
     [ASPEED_DEV_UART1]     =3D 0x1E783000,
+    [ASPEED_DEV_UART2]     =3D 0x1E78D000,
+    [ASPEED_DEV_UART3]     =3D 0x1E78E000,
+    [ASPEED_DEV_UART4]     =3D 0x1E78F000,
     [ASPEED_DEV_UART5]     =3D 0x1E784000,
+    [ASPEED_DEV_UART6]     =3D 0x1E790000,
+    [ASPEED_DEV_UART7]     =3D 0x1E790100,
+    [ASPEED_DEV_UART8]     =3D 0x1E790200,
+    [ASPEED_DEV_UART9]     =3D 0x1E790300,
+    [ASPEED_DEV_UART10]    =3D 0x1E790400,
+    [ASPEED_DEV_UART11]    =3D 0x1E790500,
+    [ASPEED_DEV_UART12]    =3D 0x1E790600,
+    [ASPEED_DEV_UART13]    =3D 0x1E790700,
     [ASPEED_DEV_VUART]     =3D 0x1E787000,
     [ASPEED_DEV_I3C]       =3D 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     =3D 0x80000000,
@@ -78,6 +89,14 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_DEV_UART3]     =3D 49,
     [ASPEED_DEV_UART4]     =3D 50,
     [ASPEED_DEV_UART5]     =3D 8,
+    [ASPEED_DEV_UART6]     =3D 57,
+    [ASPEED_DEV_UART7]     =3D 58,
+    [ASPEED_DEV_UART8]     =3D 59,
+    [ASPEED_DEV_UART9]     =3D 60,
+    [ASPEED_DEV_UART10]    =3D 61,
+    [ASPEED_DEV_UART11]    =3D 62,
+    [ASPEED_DEV_UART12]    =3D 63,
+    [ASPEED_DEV_UART13]    =3D 64,
     [ASPEED_DEV_VUART]     =3D 8,
     [ASPEED_DEV_FMC]       =3D 39,
     [ASPEED_DEV_SDMC]      =3D 0,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c339b5c74d..96bc060680 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -48,6 +48,9 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
     [ASPEED_DEV_ETH1]   =3D 0x1E660000,
     [ASPEED_DEV_ETH2]   =3D 0x1E680000,
     [ASPEED_DEV_UART1]  =3D 0x1E783000,
+    [ASPEED_DEV_UART2]  =3D 0x1E78D000,
+    [ASPEED_DEV_UART3]  =3D 0x1E78E000,
+    [ASPEED_DEV_UART4]  =3D 0x1E78F000,
     [ASPEED_DEV_UART5]  =3D 0x1E784000,
     [ASPEED_DEV_VUART]  =3D 0x1E787000,
     [ASPEED_DEV_SDRAM]  =3D 0x40000000,
@@ -80,6 +83,9 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
     [ASPEED_DEV_ETH1]   =3D 0x1E660000,
     [ASPEED_DEV_ETH2]   =3D 0x1E680000,
     [ASPEED_DEV_UART1]  =3D 0x1E783000,
+    [ASPEED_DEV_UART2]  =3D 0x1E78D000,
+    [ASPEED_DEV_UART3]  =3D 0x1E78E000,
+    [ASPEED_DEV_UART4]  =3D 0x1E78F000,
     [ASPEED_DEV_UART5]  =3D 0x1E784000,
     [ASPEED_DEV_VUART]  =3D 0x1E787000,
     [ASPEED_DEV_SDRAM]  =3D 0x80000000,
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 3789f38603..709a78285b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -105,6 +105,14 @@ enum {
     ASPEED_DEV_UART3,
     ASPEED_DEV_UART4,
     ASPEED_DEV_UART5,
+    ASPEED_DEV_UART6,
+    ASPEED_DEV_UART7,
+    ASPEED_DEV_UART8,
+    ASPEED_DEV_UART9,
+    ASPEED_DEV_UART10,
+    ASPEED_DEV_UART11,
+    ASPEED_DEV_UART12,
+    ASPEED_DEV_UART13,
     ASPEED_DEV_VUART,
     ASPEED_DEV_FMC,
     ASPEED_DEV_SPI1,
--=20
2.30.2

