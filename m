Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF0733A15
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 21:40:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QdGIEWqN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTzS74rpz3bY7
	for <lists+openbmc@lfdr.de>; Sat, 17 Jun 2023 05:40:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QdGIEWqN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=iwona.winiarska@intel.com; receiver=lists.ozlabs.org)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjTwG6ysrz3bpq
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2023 05:38:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686944287; x=1718480287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WeEGqpvtDT+7iTCOG+Fl7R/2EclFppBGdUDQfhYalbc=;
  b=QdGIEWqNmfWJM6d7Z7xVLplVaFaOAtCreEA9AHd2ws5pF65uKDjZAMEJ
   bh/KHEOwnXSvGgw3rlse8Vepj4sMw6qPQ2CuAGEA9KZc9IdOCQCmT5V1i
   pzOLUZznuqCP5QjE8+MNUA/EPu710S9NkBx1T0+b+XgW4jAx1lT8wOFB7
   y8QZr66sqYD1vrXLxOfpLmfo0+6BZCdM86o9olSUdMh8Q53X75flyUyMa
   nHECyk0Z1shjpO18ZxY1+d+wU4xv4tWrOyU60WF4750epe0hywTeuTe3e
   qzA98OQpSRXqvU0s6E2buqHKt9aMkY5ScmAYcq7V20LqKMy5Yd6Bkme2n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="361831250"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="361831250"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="887220724"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="887220724"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO localhost) ([10.249.144.95])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:37:00 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: openbmc@lists.ozlabs.org,
	Tomer Maimon <tmaimon77@gmail.com>,
	kfting <warp5tw@gmail.com>
Subject: [RFT PATCH 4/4] arm64: dts: nuvoton: Add PECI controller node
Date: Fri, 16 Jun 2023 21:34:50 +0200
Message-Id: <20230616193450.413366-5-iwona.winiarska@intel.com>
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
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index aa7aac8c3774..b8326bbe9fde 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -68,6 +68,15 @@ apb {
 			ranges = <0x0 0x0 0xf0000000 0x00300000>,
 				<0xfff00000 0x0 0xfff00000 0x00016000>;
 
+			peci0: peci-controller@100000 {
+				compatible = "nuvoton,npcm845-peci";
+				reg = <0x100000 0x1000>;
+				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk NPCM8XX_CLK_APB3>;
+				cmd-timeout-ms = <1000>;
+				status = "disabled";
+			};
+
 			timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.40.1

