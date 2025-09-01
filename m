Return-Path: <openbmc+bounces-545-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0756B3D94D
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 08:01:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFdW266w3z301n;
	Mon,  1 Sep 2025 15:59:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756706382;
	cv=none; b=LRo09Q+rmA8pZqO/ipfJ2ZEP7ML/d0i+jd6Kqkbbjz6eEv1sjl3jHleZPkON8sL1Wt1pLFsIjKcg6PCNf0ov3QDnDb85E24NAPz/URsqwGPxQfxbRzFnVGdfoRljnnzbvn9kRSYudWDhXPOrKT9dVJptBN/fOMgnpFym80yANPooqc6hm7KXFX54cMmu1ognpj9a5vipKPE9V2zuPVPArLUDrwTUR+niaqYiCkwEjXf522njccqj1Jj2baNOJSewbJDF0ocmPYR9w48zAiotjX0EoYTZRmdWWZffbNg0sSt6zKnAU2dGYILLow6jH/fHXM2alfObzqU+Z0Pdz/wstA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756706382; c=relaxed/relaxed;
	bh=KK1+3po0lpD6XTjsRxyqO5W6xZmY+U5UmFlcUZ2ALoQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TqpTSoyighaNJyYe/K110RWlmEov+VSY1R2e1ee6zFerV44BcR7UxuC5xizx5cHly2OvcnJvys4gBUZ9ZJdRvby9CV43GVy6t3I9rWBiOhlkfr0nkXLkKq5XVgOnrbe5osNYEsm1oS5iR7+LgSDsRLH2lptE8byKYSNj+gXLoyR0O1Thtw3jdtugDeBe5P8LgW2fIneFZ8i8jsIgklFWXGi6tWrQPH7qOmY2DPaGX3vXUw+gtupC31xBoyNYBmwr3Y1DDJICZPOAsdY7jY54hVBFI+34qVpuE0p49Po9QzC52gOiSXbczdL7VzTvOip4XLe6GWYhRxcZ/xaY4fwpvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFdW228tfz303d;
	Mon,  1 Sep 2025 15:59:42 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:23 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:23 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 05/10] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
Date: Mon, 1 Sep 2025 13:59:17 +0800
Message-ID: <20250901055922.1553550-6-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
References: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add pinctrl support for PCIe RC PERST#.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index 289668f051eb..ea879f086c25 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -2,6 +2,11 @@
 // Copyright 2019 IBM Corp.
 
 &pinctrl {
+	pinctrl_pcierc1_default: pcierc1-default {
+		function = "PCIERC1";
+		groups = "PCIERC1";
+	};
+
 	pinctrl_adc0_default: adc0_default {
 		function = "ADC0";
 		groups = "ADC0";
-- 
2.43.0


