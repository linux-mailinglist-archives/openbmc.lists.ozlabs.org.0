Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FCEA33504
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 02:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtdWt3Fw0z3cVk
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2025 12:54:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739411639;
	cv=none; b=J2ADvwi4rdpjPdJAxTZU9L2uMtNbq/iWoy3irxAoDxLTeJOxNYid3HIvlzD4CVEMhJX50FaPz96mDkoyT17Wt/Rmj4eQOE1HYdtJdIarC6lkcC+VSwAIFK/4/vNLoVnbt3tuEYaUvE2+rR2tG7wBD3Gn4WUOWJyYAdImKcKFMOdLYxL0qFH0j25J26K3F7FRoOUtFd7Yz3Bd1ozWBiDvpAkkHxCw9KXwmLuvwgT2Ku1ttj2C7QGnAhnCKa0wTHiUztyp+tzyo/T45tkqnS61p1c2ojPlKa5qJemlqehUvXKe3TCWNgLkdKZN/g32CZYk1s//k0HKvM2+I0Wjbj9FUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739411639; c=relaxed/relaxed;
	bh=9ZYy09ZqAcaR5fXTakTZhj4w+UVTSjGFOES9CslsiBw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yp1tmiD4o75uqohJP2tl3X15iBDt1ngiB0QWPQT9On15tHCjvxkqcHoPDPZ7kK0UWpqD1fSuLGZKLgwJr6PMKCi/1sSCtjoKU4ckoSixV5ai9kRUMZJFPh4EZ5Gu5pqgfgdvSbID3noOn+d/va1PX5D1vlxLJFyCY6xU+yPQ7NxG37czqa9lT7GUD//B48JrzwVfOXoNyHaaTrRAJn4x5fhDg7Q+fRVHkGlanK1LEOgvZr+jNIWFpLtbOBxuYnK9RXa2x0rJWRE/eqAGoPXEiEpEiw/+FRXu4O6GP4SC302LJPyib2lxh9Be+WAnVrPsIOp72KkAqCCAZpymiW1IRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtdWn0cW6z2yK7;
	Thu, 13 Feb 2025 12:53:55 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Feb
 2025 09:53:39 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Feb 2025 09:53:39 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to json schema
Date: Thu, 13 Feb 2025 09:53:38 +0800
Message-ID: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert aspeed-video.txt to yaml format.
Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v6:
  - Remove new properties in example.

 v5:
  - Don't put additional changes in this commit.

 v4:
  - Keep | after phandle description to fix dt_binding_check error.

 v3:
  - Add Additional changes into comments.
  - Remove | after phandle description

 v2:
  - Update patch subject
  - Add NOTE for false positive warning
---
 .../bindings/media/aspeed,video-engine.yaml   | 70 +++++++++++++++++++
 .../bindings/media/aspeed-video.txt           | 33 ---------
 MAINTAINERS                                   |  2 +-
 3 files changed, 71 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt

diff --git a/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
new file mode 100644
index 000000000000..682bba20778c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/aspeed,video-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED Video Engine
+
+maintainers:
+  - Eddie James <eajames@linux.ibm.com>
+
+description:
+  The Video Engine (VE) embedded in the ASPEED SOCs can be configured to
+  capture and compress video data from digital or analog sources.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-video-engine
+      - aspeed,ast2500-video-engine
+      - aspeed,ast2600-video-engine
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: vclk
+      - const: eclk
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Phandle to the reserved memory nodes to be associated with the
+      VE. VE will acquires memory space for 3 purposes:
+        1. JPEG header
+        2. Compressed result
+        3. Temporary transformed image data
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    video@1e700000 {
+        compatible = "aspeed,ast2600-video-engine";
+        reg = <0x1e700000 0x1000>;
+        clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
+                 <&syscon ASPEED_CLK_GATE_ECLK>;
+        clock-names = "vclk", "eclk";
+        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
deleted file mode 100644
index d2ca32512272..000000000000
--- a/Documentation/devicetree/bindings/media/aspeed-video.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Device tree bindings for Aspeed Video Engine
-
-The Video Engine (VE) embedded in the Aspeed AST2400/2500/2600 SOCs can
-capture and compress video data from digital or analog sources.
-
-Required properties:
- - compatible:		"aspeed,ast2400-video-engine" or
-			"aspeed,ast2500-video-engine" or
-			"aspeed,ast2600-video-engine"
- - reg:			contains the offset and length of the VE memory region
- - clocks:		clock specifiers for the syscon clocks associated with
-			the VE (ordering must match the clock-names property)
- - clock-names:		"vclk" and "eclk"
- - resets:		reset specifier for the syscon reset associated with
-			the VE
- - interrupts:		the interrupt associated with the VE on this platform
-
-Optional properties:
- - memory-region:
-	phandle to a memory region to allocate from, as defined in
-	Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
-
-Example:
-
-video-engine@1e700000 {
-    compatible = "aspeed,ast2500-video-engine";
-    reg = <0x1e700000 0x20000>;
-    clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
-    clock-names = "vclk", "eclk";
-    resets = <&syscon ASPEED_RESET_VIDEO>;
-    interrupts = <7>;
-    memory-region = <&video_engine_memory>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..7e59daa1e89d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3549,7 +3549,7 @@ M:	Eddie James <eajames@linux.ibm.com>
 L:	linux-media@vger.kernel.org
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/aspeed-video.txt
+F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
 F:	drivers/media/platform/aspeed/
 
 ASUS EC HARDWARE MONITOR DRIVER

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.25.1

