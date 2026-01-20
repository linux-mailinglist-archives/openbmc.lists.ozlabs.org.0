Return-Path: <openbmc+bounces-1248-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eB+TLxOhb2ntCgAAu9opvQ
	(envelope-from <openbmc+bounces-1248-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 16:36:51 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1644637E
	for <lists+openbmc@lfdr.de>; Tue, 20 Jan 2026 16:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwQSY5MMWz30Sv;
	Tue, 20 Jan 2026 22:43:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768909405;
	cv=none; b=N94+IyJzIK5Jm8I0HMTlC9DUVRmwMO/vcZdGowysVWNa26dEyTbeX7R45Yd+Ep6IZBRXawtQKgfQNkMqIvPZOgHvisJJNbXTy2+YcLlBODhNZ86Ca4/064Jb/UgNFbKq0Qd8tAXkcGxlY7EysqTGmMav2UIS7lnTYgQZJkHlOJ3Yc/4ZQFhKSGM/etXz+Pv8kdC96eCVffPiK5HAH6GTw3McUKrljUtYjuUDwG92D5TlRFBjALEPhR6KiYT+tftBnRBcZtOkw/yujpW4l2FIIDC1qXEUnZgIVwj1ILZqYCg8rwwRyExoZKN6Zcfw7m0v3ZhmqY8/CNzCUHfmedNOoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768909405; c=relaxed/relaxed;
	bh=lHRH2PzNA5e7bSpim7EQt2hZ6Eupsbp/2jcQWZDGT4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OL24yR7qzBggygQpEkT+itUCWQKw9xlAy9jnCd7D7HAcsxY6a89FFRGKNX8OIevR2ytl/6iYzrYC3LVFR9mtOr05hBbnVu7Hkev1XXY0/CjFxOAjDRgNj2Ma4ZIjqHC8ujYJznI1BJfDfYiJcB2b50CY1A/UuJoP4zEZ87ob8YGTwjPb22yP0cfG33deuuQ/C4yCqzT7WLVXuLJ3eTiJ89x4L1/lYASP/AP1ynKLkCAiI3ifPYK35v6t9y3akihRKYtKLu29VJbBaTc03vI2ViY26KWUvKZ6hR6fSA7sY3RYP1aASIB6XZbiXNe3/JYHQt5EgA9h6A0Catqbnm57/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwQSX4R6Kz2x99;
	Tue, 20 Jan 2026 22:43:24 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 20 Jan
 2026 19:43:05 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 20 Jan 2026 19:43:05 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 20 Jan 2026 19:43:06 +0800
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: aspeed: Add support for
 AST27xx
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
Message-ID: <20260120-upstream_pinctrl-v3-2-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
In-Reply-To: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Linus Walleij" <linusw@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>,
	"Bartosz Golaszewski" <brgl@kernel.org>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, <bmc-sw@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768909385; l=5436;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=MrVRNKm/mjltzAWngdN4v+Ffyd7xxroQ3hNrDmuuTjU=;
 b=lFnzFI3T2fdX4n4eQ4/F2ICFdre8wOEtRMhqeD6VfFGt/HNoMFRnIuy/V+ZMLU5zH5KHTK/Yr
 S3jQnwoRCfYBZPKhdfKHaAFShqiq4Vh7mZrFWo02UC2gILYzLORDkpC
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [1.50 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,openbmc@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-1248-lists,openbmc=lfdr.de];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0C1644637E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for the pin controller found in ASPEED AST27xx SoCs.

The AST2700 SoC consists of two interconnected SoC instances, each
with its own pin controller register block managed by a separate
System Control Unit (SCU).

Introduce the "aspeed,ast2700-soc0-pinctrl" compatible string to
describe the SoC0 pin controller, which is not compatible with
existing ASPEED pinctrl bindings.

The SoC1 pin controller follows a regular and predictable register
layout and can be described using an existing generic pinctrl
binding, therefore no dedicated AST2700-specific compatible string
is introduced for it.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../bindings/mfd/aspeed,ast2x00-scu.yaml           |  27 +++++
 .../pinctrl/aspeed,ast2700-soc0-pinctrl.yaml       | 130 +++++++++++++++++++++
 2 files changed, 157 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index ff6cf8f63cbc..7eda8fddc560 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -164,4 +164,31 @@ examples:
             reg = <0x7c 0x4>, <0x150 0x8>;
         };
     };
+
+  - |
+    syscon@12c02000 {
+        compatible = "aspeed,ast2700-scu0", "syscon", "simple-mfd";
+        reg = <0x0 0x12c02000 0x0 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x0 0x12c02000 0x1000>;
+
+        pinctrl0: pinctrl@400 {
+            compatible = "aspeed,ast2700-soc0-pinctrl";
+            reg = <0x400 0x600>;
+
+            emmc-state {
+                function = "EMMC";
+                groups = "EMMCG1";
+            };
+
+            emmcclk-driving-state {
+                pins = "AC14";
+                drive-strength = <2>;
+            };
+        };
+    };
 ...
diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
new file mode 100644
index 000000000000..f52dfe0cb4c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC0 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC0.
+
+  The SoC0 pin controller manages pin functions including eMMC, VGA DDC,
+  dual USB3/USB2 ports (A and B), JTAG, and PCIe root complex interfaces.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc0-pinctrl
+
+patternProperties:
+  '-state$':
+    type: object
+    $ref: pinmux-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - EMMC
+          - VB
+          - TSPRSTN
+          - UFSCLKI
+          - VGADDC
+          - USB3AXHD
+          - USB3AXHPD
+          - USB3AXH
+          - USB3AXHP
+          - USB3AXH2B
+          - USB3AXHP2B
+          - USB3BXHD
+          - USB3BXHPD
+          - USB3BXH
+          - USB3BXHP
+          - USB3BXH2A
+          - USB3BXHP2A
+          - USB2AXHD1
+          - USB2AXHPD1
+          - USB2AXH
+          - USB2AXHP
+          - USB2AXH2B
+          - USB2AXHP2B
+          - USB2AD1
+          - USB2AHPD0
+          - USB2AH
+          - USB2AHP
+          - USB2AD0
+          - USB2BXHD1
+          - USB2BXHPD1
+          - USB2BXH
+          - USB2BXHP
+          - USB2BXH2A
+          - USB2BXHP2A
+          - USB2BD1
+          - USB2BHPD0
+          - USB2BH
+          - USB2BHP
+          - USB2BD0
+          - JTAGPSP
+          - JTAGSSP
+          - JTAGTSP
+          - JTAGDDR
+          - JTAGUSB3A
+          - JTAGUSB3B
+          - JTAGPCIEA
+          - JTAGPCIEB
+          - JTAGM0
+          - PCIERC0PERST
+          - PCIERC1PERST
+
+      groups:
+        enum:
+          - EMMCG1
+          - EMMCG4
+          - EMMCG8
+          - EMMCWPN
+          - EMMCCDN
+          - VGADDC
+          - VB1
+          - VB0
+          - TSPRSTN
+          - UFSCLKI
+          - USB3A
+          - USB3AAP
+          - USB3ABP
+          - USB3B
+          - USB3BAP
+          - USB3BBP
+          - USB2A
+          - USB2AAP
+          - USB2ABP
+          - USB2ADAP
+          - USB2AH
+          - USB2AHAP
+          - USB2B
+          - USB2BBP
+          - USB2BAP
+          - USB2BDBP
+          - USB2BH
+          - USB2BHBP
+          - JTAG0
+          - PCIERC0PERST
+          - PCIERC1PERST
+
+    pins:
+      $ref: /schemas/types.yaml#/definitions/string-array
+    drive-strength:
+      minimum: 0
+      maximum: 15
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false

-- 
2.34.1


