Return-Path: <openbmc+bounces-301-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66FAEEAE8
	for <lists+openbmc@lfdr.de>; Tue,  1 Jul 2025 01:26:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWMkC6MZ1z2yVV;
	Tue,  1 Jul 2025 09:26:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751326003;
	cv=none; b=RtkUcyCMv/5wScD9HCn5MciWVkwK3N8iADZwfgjxDMDKnmmYhmWbnLRlkOz/eFrBligEQBme4EvC0BQNxa2gNqtj9yTRFrRgOYBFiTYJ3nBMFLw71pP6KkUHjCAiWMXdo5gGp9B2DiZ2N3kBKLKpChLLwv7Hkg/d8M1NYE6svDeKJsPXFMj0/dxq+oarcDpmreT1qb6Ihj0yeYGkKKai72fSWVQf3zzfZMZt7KCAF3hJYpSJqmC9FrqMZ5cdnvbclamSTkfuiryM2XcW30RNKg01DhmXkfM4HHSKb0RuJ4pVWUu+ZM5LYg4ptudNdFROz0mYwxGT115fVa08P7LyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751326003; c=relaxed/relaxed;
	bh=n2EkIivhM4BN34oY1t/mqzMf731TPaXvKVFvdipUHxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XrhK2sRxhtJ3LUUXu4sqtTDsqQ9evvLrlaLOj1555OnTwmvYZPsMpDo03gWoRdf6SE+sFoMuHYrzOgM6w9c5Nz+vMFoyXD0Z8IY/Ns5BV6AJPW8IK3WmsHfeBqGzzlDga0fQuoFYCKHH4/YSIHpw279rmBYIcXdqz0EBZXmVlFt3andSSPVSTQ+gmI/OTxNUe+Te0L05/dxK00JMNRc/rCODlAmuqeNzx9aRO1H3Df57cd4nvkEdOnqISUN1+HFc9EGkLYsnTiS3AL4eJZ0a+RbBYR5FzroSWR/XvFcdF9qXY+lbXp2Jkua4mr1GrGPbWkkXHeaU2tgQnBNKpodXkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qpo71Zc1; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qpo71Zc1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWMkB1YK6z2ySY
	for <openbmc@lists.ozlabs.org>; Tue,  1 Jul 2025 09:26:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A57445C42;
	Mon, 30 Jun 2025 23:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CC1C4CEE3;
	Mon, 30 Jun 2025 23:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751326000;
	bh=dPy4FTclmyey5C/UXVRXo0shEX5PkEkUjxtYrWNFLjw=;
	h=From:To:Cc:Subject:Date:From;
	b=qpo71Zc1siywcNs3uogPdQV4RdCgsFoXML9VNJ4izMd1MfHVuRcLQ9XDBsKs1kWPQ
	 vnn8Kvff/1zXfdJ5OjyNFXaJx0X1EYlLDTkgpiUgE1oAkIPBix40FRNEt9V+YTtToq
	 YzWxCvaygkNsT9UhH6MgKY/wdqQOoiQtVvcM7tcX4YDrFovUsUfJeEjeEPgyIi248T
	 pffu8+5pxK+LAz2ih12uDrP6JEdxzv5LGmAUj7wfPwIf+u2s2YFPWh+ycH5pCRkDKY
	 f97vkulYJAIS/C0dCeIt7MiHHt3XYPlCyvSqOLCDnKkx+VMXCmt9om3nFG35GtIxjz
	 OwecLDMnH8LEg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: Convert nuvoton,npcm750-clk to DT schema
Date: Mon, 30 Jun 2025 18:26:36 -0500
Message-ID: <20250630232637.3700584-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/nuvoton,npcm750-clk.txt    | 100 ------------------
 .../bindings/clock/nuvoton,npcm750-clk.yaml   |  66 ++++++++++++
 2 files changed, 66 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
deleted file mode 100644
index f82064546d11..000000000000
--- a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
+++ /dev/null
@@ -1,100 +0,0 @@
-* Nuvoton NPCM7XX Clock Controller
-
-Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
-generates and supplies clocks to all modules within the BMC.
-
-External clocks:
-
-There are six fixed clocks that are generated outside the BMC. All clocks are of
-a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
-clk_sysbypck are inputs to the clock controller.
-clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
-network. They are set on the device tree, but not used by the clock module. The
-network devices use them directly.
-Example can be found below.
-
-All available clocks are defined as preprocessor macros in:
-dt-bindings/clock/nuvoton,npcm7xx-clock.h
-and can be reused as DT sources.
-
-Required Properties of clock controller:
-
-	- compatible: "nuvoton,npcm750-clk" : for clock controller of Nuvoton
-		  Poleg BMC NPCM750
-
-	- reg: physical base address of the clock controller and length of
-		memory mapped region.
-
-	- #clock-cells: should be 1.
-
-Example: Clock controller node:
-
-	clk: clock-controller@f0801000 {
-		compatible = "nuvoton,npcm750-clk";
-		#clock-cells = <1>;
-		reg = <0xf0801000 0x1000>;
-		clock-names = "refclk", "sysbypck", "mcbypck";
-		clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
-	};
-
-Example: Required external clocks for network:
-
-	/* external reference clock */
-	clk_refclk: clk-refclk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <25000000>;
-		clock-output-names = "refclk";
-	};
-
-	/* external reference clock for cpu. float in normal operation */
-	clk_sysbypck: clk-sysbypck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <800000000>;
-		clock-output-names = "sysbypck";
-	};
-
-	/* external reference clock for MC. float in normal operation */
-	clk_mcbypck: clk-mcbypck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <800000000>;
-		clock-output-names = "mcbypck";
-	};
-
-	 /* external clock signal rg1refck, supplied by the phy */
-	clk_rg1refck: clk-rg1refck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-		clock-output-names = "clk_rg1refck";
-	};
-
-	 /* external clock signal rg2refck, supplied by the phy */
-	clk_rg2refck: clk-rg2refck {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-		clock-output-names = "clk_rg2refck";
-	};
-
-	clk_xin: clk-xin {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <50000000>;
-		clock-output-names = "clk_xin";
-	};
-
-
-Example: GMAC controller node that consumes two clocks: a generated clk by the
-clock controller and a fixed clock from DT (clk_rg1refck).
-
-	ethernet0: ethernet@f0802000 {
-		compatible = "snps,dwmac";
-		reg = <0xf0802000 0x2000>;
-		interrupts = <0 14 4>;
-		interrupt-names = "macirq";
-		clocks	= <&clk_rg1refck>, <&clk NPCM7XX_CLK_AHB>;
-		clock-names = "stmmaceth", "clk_gmac";
-	};
diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
new file mode 100644
index 000000000000..694dac68619c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/nuvoton,npcm750-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7XX Clock Controller
+
+maintainers:
+  - Tali Perry <tali.perry1@gmail.com>
+
+description: >
+  Nuvoton Poleg BMC NPCM7XX contains an integrated clock controller, which
+  generates and supplies clocks to all modules within the BMC.
+
+  External clocks:
+
+  There are six fixed clocks that are generated outside the BMC. All clocks are of
+  a known fixed value that cannot be changed. clk_refclk, clk_mcbypck and
+  clk_sysbypck are inputs to the clock controller.
+  clk_rg1refck, clk_rg2refck and clk_xin are external clocks suppling the
+  network. They are set on the device tree, but not used by the clock module. The
+  network devices use them directly.
+
+  All available clocks are defined as preprocessor macros in:
+  dt-bindings/clock/nuvoton,npcm7xx-clock.h
+  and can be reused as DT sources.
+
+properties:
+  compatible:
+    const: nuvoton,npcm750-clk
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clock-names:
+    items:
+      - const: refclk
+      - const: sysbypck
+      - const: mcbypck
+
+  clocks:
+    items:
+      - description: refclk
+      - description: sysbypck
+      - description: mcbypck
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@f0801000 {
+        compatible = "nuvoton,npcm750-clk";
+        #clock-cells = <1>;
+        reg = <0xf0801000 0x1000>;
+        clock-names = "refclk", "sysbypck", "mcbypck";
+        clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
+    };
-- 
2.47.2


