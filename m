Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B288F765D4D
	for <lists+openbmc@lfdr.de>; Thu, 27 Jul 2023 22:26:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1i+dlig;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBj2k4Gyvz3cPR
	for <lists+openbmc@lfdr.de>; Fri, 28 Jul 2023 06:26:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1i+dlig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBhzj2q0pz3cQ4
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2023 06:23:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690489409; x=1722025409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dkGJm5iG8le/XoYOxBxQniOIy2iGaYjjjM3wmjqRvPs=;
  b=j1i+dlig/TVrnH4gHR3PJuq7EusMudMD9qIBaUaswaKDA6gQlyCf084I
   KgYVD3wib5fM3mypVbTWPKRGT0TPvU+u10gfwsOKn40k/mcB3EHAz8bLa
   ejg9rgW7qCYw397LXWoqzs7jn5XTL1Mk13/0c1vkZDpx3qDcKpiO5nAjb
   Vs2hwGYofHiCK4bSK9QPjzTPNYWJzAA/qks2TDY+bks2Z5ac/R7h+e9rM
   pIxMp/d2AxQMzEomA81zDR8kfYJyGj6eTvQGvHJr+DNcEPsfUcAxOhVUF
   0ia2G0+K+D5eM2b6tUZTU2qKAQzqsI6aU++Ah8o8/MtXjSAZ5e2/z2XNB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368442783"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="368442783"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 13:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="900980512"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="900980512"
Received: from mtyszka-mobl1.ger.corp.intel.com (HELO localhost) ([10.249.133.203])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 13:23:22 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] ARM: dts: nuvoton: Add PECI controller node
Date: Thu, 27 Jul 2023 22:21:25 +0200
Message-Id: <20230727202126.1477515-4-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230727202126.1477515-1-iwona.winiarska@intel.com>
References: <20230727202126.1477515-1-iwona.winiarska@intel.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Conor Dooley <conor+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Iwona Winiarska <iwona.winiarska@intel.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>
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

