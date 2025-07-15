Return-Path: <openbmc+bounces-354-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C81B06A28
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 01:57:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhbgZ4Ccfz30VV;
	Wed, 16 Jul 2025 09:56:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752551022;
	cv=none; b=YCjbXMGh2WXzVXkCwjfO7doSKuNJMpPAE0Ds+AvO1aP2V0SNbm5beFAyUF7+AQ9sSr8VEGiQvdjk9pNjpuulO49l/dRgOnQicvASYbt4XpcsYaqbVJW6WaXz17vM/n5P8MIVhufTJ5ppKrZuajhYVpV07ytiJQdQ30wZ5xA7HsQmTi76hJsxMv4+AcBe+VyYUhXRLFb8BjSkjVeuizWnkjxxilfsXkK+/Gzpn6inn7hS80jpcEmrs1xxfwIA7cDf27aSh2YpCFxD6C26qd6SDhlRJco8XYzfU8kNxHcGTQVXHM8+FeLD0u6i51iBQbK15EU98eWkvL+ULsamXQ126w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752551022; c=relaxed/relaxed;
	bh=k+i/3ki+17xe64ShCyYC+Nb82F7gDLReZhUkgpHwvUk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkwO9T8GRgjaodfBhf0enAMqfrJdZxZFAU9bK0cxKnJQcjfCK+Qyt1O33gcsW8/Wx+TPO5Hxw8m06FHtSLewuKzxtgpBXXu0OUTjehYQW/FrStYqvX9qOGPrxokFTdkL/MhjdQKYHKho/oy6oWqbZMZIzogWQxkUo3LpWpu6XZhDXmjaVGGv9THJxjc2iEKsC96YCbReQ43uiDAn83zK+/FLiEquixZ/ZqFTmt+b0pntG4iQcRiGTXr1APUvIPweGCSdSdReNbNBUwI7hXE4yplvDWOs006gNz/3WOT4gRrA0MnRe6c1sWpKy2ADXMkjYPztCT46iqiZKuFh0ia0mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bh4mG0klqz3c5N;
	Tue, 15 Jul 2025 13:43:42 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 11:43:20 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 11:43:20 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 02/10] dt-bindings: soc: aspeed: Add ASPEED PCIe PHY support
Date: Tue, 15 Jul 2025 11:43:12 +0800
Message-ID: <20250715034320.2553837-3-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
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

This PHY is used by many modules. In our design, our
PCIe has RC and EP funcitons. On the different function,
each driver will use configure and get some information
from the PHY interface to do somting that it wants to.
Getting link status, setting syscon credits and so on.
Therefore, define it as syscon for all modules.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/soc/aspeed/aspeed,pcie-phy.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
new file mode 100644
index 000000000000..5fa585d63ca6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/aspeed,pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe PHY
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description:
+  The ASPEED PCIe PHY provides the physical layer interface for PCIe
+  controllers in the SoC. This node represents the register block for the PCIe
+  PHY, which is typically accessed by PCIe Root Complex or Endpoint drivers
+  via syscon. It is used to configure and get the status of the PCIe PHY
+  hardware, including power management, link training, and other PHY-specific
+  operations.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,pcie-phy
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1e6ed200 {
+      compatible = "aspeed,pcie-phy", "syscon";
+      reg = <0x1e6ed200 0x100>;
+    };
-- 
2.43.0


