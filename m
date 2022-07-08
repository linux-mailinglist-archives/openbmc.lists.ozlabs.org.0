Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163B56BBA8
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 16:27:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfbFz2hkjz3c6y
	for <lists+openbmc@lfdr.de>; Sat,  9 Jul 2022 00:27:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=AV6UwDDR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=199.106.114.38; helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=AV6UwDDR;
	dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfbFZ0S6lz3c3D
	for <openbmc@lists.ozlabs.org>; Sat,  9 Jul 2022 00:26:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657290418; x=1688826418;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J5O7hRlNJA2SU9AiSL/COVAhaRLqSTEBDUWaevF5i7M=;
  b=AV6UwDDRFIRV1+CVWkVRbxPUomvkBpSWLycm7NyEbcJC7qcm9/TWqLkU
   r6rRLiRiQ9LO37R767jkKXsyQObmwfVxovg3661AGdoWrmyAGPhQJ9Vqd
   d2lrgVNF3XqIg1SPl39HIey9cU5z5eTGa55QZU3QLtTkZ0pGUGg/P9kV5
   w=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jul 2022 07:26:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 07:26:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 8 Jul 2022 07:26:47 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 8 Jul 2022
 07:26:47 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.15] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
Date: Fri, 8 Jul 2022 07:25:29 -0700
Message-ID: <20220708142529.2727969-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Graeme Gregory <quic_ggregory@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
name in the file.

Fixes: 7b46aa7c008d ("ARM: dts: aspeed: Add Nuvia DC-SCM BMC")
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20220523175640.60155-1-quic_jaehyoo@quicinc.com
Link: https://lore.kernel.org/r/20220624070511.4070659-1-joel@jms.id.au'
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
It's a backporting patch from upstream. Please apply it as it's needed for
making a bitbake machine target in OpenBMC yocto build.

Thanks,
Jae

 arch/arm/boot/dts/Makefile                                    | 2 +-
 ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index dc225e354791..134cdcdec271 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1487,7 +1487,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
-	aspeed-bmc-nuvia-dc-scm.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mihawk.dtb \
 	aspeed-bmc-opp-mowgli.dtb \
@@ -1500,6 +1499,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
+	aspeed-bmc-qcom-dc-scm-v1.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-quanta-s6q.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
similarity index 97%
rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
index f4a97cfb0f23..259ef3f54c5c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
@@ -6,8 +6,8 @@
 #include "aspeed-g6.dtsi"
 
 / {
-	model = "Nuvia DC-SCM BMC";
-	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
+	model = "Qualcomm DC-SCM V1 BMC";
+	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
 
 	aliases {
 		serial4 = &uart5;
-- 
2.25.1

