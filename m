Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1222D733A14
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 21:39:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxNQ1b78;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTyM6pVgz3bTk
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 05:39:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gxNQ1b78;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjTvf6v5gz30N3
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 05:37:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686944255; x=1718480255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IcfMzTHAajGJU+lRqGTMYcm+Pml1cruuLEihKHcs/7s=;
  b=gxNQ1b78dAaMbaMlP1T5dg82mIRcvEUY9Whnr55dbNEezrNEwZAIGexp
   7KKEOSJyWdniAyfRlMM5AhSkFT8cX/wLa2Ky7YRiDkJnN78Vg4G/AuT4F
   wx1jLADMr3cRWurIX+E1iR74tTnBRWU0dQVwtgddZqokg2fWVu4MlrApZ
   3fM+jzDLSy+e4dVG7AyrWae2OY3vDNbBOqsfy5jILDgi2GXCeVKn5lzUu
   uCIst7PSb9gLUuoxYtIrTjBzmP0NAkJJ5kzfk05oRzLgq3GryvEvK6Or/
   QECEqkSubdJeY+DclmmD7s8qlgReMp8+rHODoE18grhn4tpXaDxmy6Q5Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="361831131"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="361831131"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:36:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="690362183"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="690362183"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO localhost) ([10.249.144.95])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:36:28 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	Tomer Maimon <tmaimon77@gmail.com>,
	kfting <warp5tw@gmail.com>
Subject: [RFT PATCH 3/4] ARM: dts: nuvoton: Add PECI controller node
Date: Fri, 16 Jun 2023 21:34:49 +0200
Message-Id: <20230616193450.413366-4-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616193450.413366-1-iwona.winiarska@intel.com>
References: <20230616193450.413366-1-iwona.winiarska@intel.com>
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
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add PECI controller node with all required information.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..cccc33441050 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
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

