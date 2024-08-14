Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A643095113B
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 02:55:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk8tg4YSBz2ygG
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 10:55:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk8sr67lnz2y8m;
	Wed, 14 Aug 2024 10:54:40 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 14 Aug
 2024 08:54:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 14 Aug 2024 08:54:21 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <pmenzel@molgen.mpg.de>, <krzk@kernel.org>
Subject: [PATCH v4 1/2] ARM: dts: aspeed: Add properties of scu and gfx for video
Date: Wed, 14 Aug 2024 08:54:20 +0800
Message-ID: <20240814005421.3362441-2-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
References: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

To have video support capture from SoC display(GFX), these properties
are added to allow video to control related registers.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7fb421153596..9f122717dfe3 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -451,6 +451,8 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				aspeed,scu = <&syscon>;
+				aspeed,gfx = <&gfx>;
 				status = "disabled";
 			};
 
-- 
2.25.1

