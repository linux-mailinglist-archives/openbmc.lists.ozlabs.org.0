Return-Path: <openbmc+bounces-909-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4AC641B4
	for <lists+openbmc@lfdr.de>; Mon, 17 Nov 2025 13:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d96kR53L3z30Vf;
	Mon, 17 Nov 2025 23:39:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763383151;
	cv=none; b=Sa/ywuo8ER1R6NAm3pc/SiYSoa8foB9JV4qV5+r/kUGynjOwWWbdauXnPOsI78Lick8TsiXpQ15nTRB7V+JwPsyLnqMR8t1NCAboUSjAFnhZzsR8oK82vCr47dpGATiyr0hRQK5s638tdkrY893blibvP8Z9pXb6PZ3ERlNufleOOPOzTgHkH3uroM0vEAxL9ulxGHsJD6YvBzJLivDsGS+pjdNBN5v0nJpbJHe7ZfmV1BSoDv8y/C06Y91BbS0sWdzCQg3efUSuEnBpl9MCZPQMWADQD2NcrRW9gVOD6eIhmZzo2ypqoJsizqNW7erccDdJ7qkbNGVdhNJoNKhHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763383151; c=relaxed/relaxed;
	bh=YDfG+k1bfMBfzYDx8oY+ojasDozysccBiv5dRopA6jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gug0KK7rLZBuXUESsiBwRMcrch02mGehtEGVe6uAoVlK3nKnskEOew0JRKeOB+KlA7Dhrz6ZZWzP1CB59/m4roe+OyIB8y9jqam5puYX9hUeZyzywXVsb5MbC4wdiEIsulpsIK9K3eV+TPXbVC9/bMmv1H/Htl753I5Q0DU1tZz9yAZPnKcXuWtrhGn0ucdzrmMrs7lckklHXxbFvL9j+NcSpW+MIWI3uq0UIvQG4fbP2TKl/CPn+gTb9XxUndfeye3csrOXQKb4v3pK3+gG6PV3M++9Q019m/tYhGMm2J4a8YmX27V/dWtk472nn9EawzpqcWykUmPPvu5CyWUIUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d96kR12mhz30V3;
	Mon, 17 Nov 2025 23:39:11 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 20:38:52 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 20:38:52 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Mon, 17 Nov 2025 20:37:50 +0800
Subject: [PATCH v5 3/8] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add
 PCIe RC PERST# group
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251117-upstream_pcie_rc-v5-3-b4a198576acf@aspeedtech.com>
References: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
In-Reply-To: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763383131; l=996;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=eCwurs+etNk9IZUbL4gYRtCoD7wND5BKbITNEzmXYdo=;
 b=sPosEZ/wkjdf29OY69lw7oC2/zenr2ThFF2d7ELCddl9NPYar33vYegkwz8XC2M31mQFY24aO
 qNJhq6sJSMxBLhO1h+IUkfVCCQ4cby4+19CRo5+rlf16S2J4WXBRHzz
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add PCIe PERST# group to support for PCIe RC.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 80974c46f3ef..af8979af9b45 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -141,6 +141,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1
@@ -369,6 +370,7 @@ additionalProperties:
         - NRTS3
         - NRTS4
         - OSCCLK
+        - PCIERC1
         - PEWAKE
         - PWM0
         - PWM1

-- 
2.34.1


