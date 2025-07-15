Return-Path: <openbmc+bounces-356-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3FB06A2E
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 01:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhbh633vLz3bkL;
	Wed, 16 Jul 2025 09:56:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752551021;
	cv=none; b=QOS2Pu6W/MtCq/dZ1R951QFQzt50VHHPFramX9ZZQGpctWDXj0G8nT/wVVLN/9rltiF6znWYXjm7mj22JoXVbLJ56S4J46s8DVjH+EyjC9UdvvwEEnZMVWT5AMTYB+/J7xOBTH2Xgw91RK3QE6RVX8G2MaGXx816C7ha8LNX1WY4jLJZwlkVWBAkRDG5nlYxYn9QpA634f4ginjB+PGpnYuUtp58O1mEys7nwQMcktTV/ZzIrl8jB8vUNElPj7cXWCQ2nD0Ox9VWOOzJslEjh8XMhBzBdpKEG3MkioOrbap7JCP7P2ePFOvsaQPR0uV7RHWII90k2wCNn62kfsErzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752551021; c=relaxed/relaxed;
	bh=oQh6vV240tnImvumdSacIM1S/td0hkqCP9jGtPpAdBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B80nEiL4zz3ljxTf53dR7+uxhJ8pT+40PsyxMTtdk//IwzTYq/TS8k5gXzgSOLjkzVci5DcvRmZ2jZAKaVYc3pqrlr7sKE9adU3RSDSk0/7EpV7B9MH3GsIkb+x+MxPixJkXNUMFSeH9mslKSeGWjn795eZ8OxHTCVjqoI2PSqOLnQM4pTfPUZ8phuMiQ4+v7im5cC3VuuMDOUbQCgxLW8RgZEG25N+GlXtUXDGpoqZ/EyYnKaPdhOGnT78DCZyOaBwFuDtkP2IoDfkL01P+PC+n4j+hKHscF6K4GJ52CFHeOOTWS31iU3MAToKJ5gVk/iJBgqgfcUdI4fD/h/HHgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bh4mF1hwKz3c52;
	Tue, 15 Jul 2025 13:43:41 +1000 (AEST)
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
Subject: [PATCH v2 01/10] dt-bindings: soc: aspeed: Add ASPEED PCIe Config support
Date: Tue, 15 Jul 2025 11:43:11 +0800
Message-ID: <20250715034320.2553837-2-jacky_chou@aspeedtech.com>
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

Add the ASPEED PCIe configuration syscon block. This shared register
space is used by multiple PCIe-related devices to coordinate and manage
common PCIe settings. The binding describes the required compatible
strings and register space for the configuration node.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 .../bindings/soc/aspeed/aspeed,pcie-cfg.yaml  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-cfg.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-cfg.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-cfg.yaml
new file mode 100644
index 000000000000..6b282f06b914
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-cfg.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/aspeed,pcie-cfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED PCIe Configuration
+
+maintainers:
+  - Jacky Chou <jacky_chou@aspeedtech.com>
+
+description: |
+  The ASPEED PCIe configuration syscon block provides a set of registers shared
+  by multiple PCIe-related devices within the SoC. This node represents the
+  common configuration space that allows these devices to coordinate and manage
+  shared PCIe settings, including address mapping, control, and status
+  registers. The syscon interface enables for various PCIe devices to access
+  and modify these shared registers in a consistent and centralized manner.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,pcie-cfg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@1e770000 {
+      compatible = "aspeed,pcie-cfg", "syscon";
+      reg = <0x1e770000 0x80>;
+    };
-- 
2.43.0


