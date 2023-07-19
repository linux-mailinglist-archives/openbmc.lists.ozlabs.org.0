Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94E175A184
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 00:13:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt1FunkB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5qpW5Z2xz3bX2
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 08:13:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mt1FunkB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5qkn1y3Wz3bWj
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 08:10:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689804625; x=1721340625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dkGJm5iG8le/XoYOxBxQniOIy2iGaYjjjM3wmjqRvPs=;
  b=mt1FunkB7lX097isR1CU00ZKQGgPyQhnjr1OOfr8Wf/lRFf5qrxuZwqR
   1ddP7FNijizxzz/O7i2KQkuPk/Zka2Ie2h8L5RPb2AX0AJyCFVAhIiRRz
   7ZK/rXOemT9W9r1IbimTbw8QdjDPOtB81EX1l9INVZQaNzPFresbtZirK
   Vpn2KstixMcC6GC+tbeOuGLwo8iHfcA+HZvIxb6F4Jm7FsyaXUXNATdyE
   wOyH8PgGZ8TCGRh7A8thSzQj54D0w9PcZKS9UugJufMpq+phx01O27YKE
   B5u+ZcViArrfuiR4tB/4rH38PmoVZ5W6qmxL7aqlrPGWxMQPgVBLXKBOv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="366617249"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="366617249"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 15:10:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="753846315"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="753846315"
Received: from patroagn-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.131.68])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 15:10:18 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: nuvoton: Add PECI controller node
Date: Thu, 20 Jul 2023 00:08:52 +0200
Message-Id: <20230719220853.1029316-4-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719220853.1029316-1-iwona.winiarska@intel.com>
References: <20230719220853.1029316-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add PECI controller node with all required information.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..cccc33441050 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -220,6 +220,15 @@ kcs3: kcs3@0 {
 				};
 			};
 
+			peci0: peci-controller@f0100000 {
+				compatible = "nuvoton,npcm750-peci";
+				reg = <0xf0100000 0x200>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 			spi0: spi@200000 {
 				compatible = "nuvoton,npcm750-pspi";
 				reg = <0x200000 0x1000>;
-- 
2.40.1

