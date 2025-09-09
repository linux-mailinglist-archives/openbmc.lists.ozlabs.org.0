Return-Path: <openbmc+bounces-607-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A35EB4FF39
	for <lists+openbmc@lfdr.de>; Tue,  9 Sep 2025 16:22:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLmH61GsVz3cfj;
	Wed, 10 Sep 2025 00:22:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757427730;
	cv=none; b=X+JeMJOYc0VNicnefrAIqh7s2d20zs3we0UPIFtFAPb0mEudJ9fM5Wamh9EF6jLFlgacSr5WoHdbnTkusqY+9HKKRLwNH4EX43r9LoPHFnUnY32JlCMWlljcq6LaGmaoFBA1k2Mz+O+diyke3qfC91EGj4T/wFsLgRbBthEzd1AOArtbFHCYDiTeT5MmmlRNv20mG2RcwyqC8DH+/Szc8tW2zS6ugTiKeAux3uPrKQE4p/HFifef4hNmDAZJN3sgZJS7H7XI9Qyp2xkmMJqXET8ltyoJbkw+HX9QtfxiEgtQtvfmOZwaRY0J22ItNAtwRQGxj/o1/HQjvUIozIny2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757427730; c=relaxed/relaxed;
	bh=Fh6I4DhLpoSWw3prPBBpsVZdYmWxETB/jEQuet0Wa6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQZ8GjFFh+hgPnJrbW6yWE3ezfKNKQvdT0ZWU58JL0xIGYkWlDueymK5XPX6zab+XKme7geZJ/ICDycOZXjsNI4NXEN4+5fOJpJQRzE1xhYem8qG2+p2wSdApaSHyB5UfhgH5eyQogxDKeI7zu+8+OUCuCxwQllfmgLLuBekUr8W3WjCvr5+co73oEDFzcdG97dg+/eIC5omLClkm+K2bR8kwZeiF9AdEWvdCZZkuo2VFpik0qVdO0psF/MLCQgdfCd9/fyqgxE5+lmKc5ZzjDFbCapjDDtCWD5tplSK5d8/KuOan96knvAFZp5+GAkd2mgKq0SXGkDwpMjGPkpYXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lijg5Xxh; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lijg5Xxh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLmH51Bp6z3cfg
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 00:22:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E897E60224;
	Tue,  9 Sep 2025 14:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6D0C4CEF4;
	Tue,  9 Sep 2025 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757427726;
	bh=hcsO+0CDu8ebk5l7xQEiuvFomx6Jn3bzyePgBxbYNfA=;
	h=From:To:Cc:Subject:Date:From;
	b=Lijg5Xxhk1ndqA8YsuTfBeLqkWzIrQloB4O6QQHsC7UOsWD/DnAW4cfZ7CSNrBgPh
	 TMjyuG7AKDCV/XwzIBXauLf1RDk7g34JLK03efmZyFBF6l5Jm5af+1T1+L2cHUWd9q
	 EtcGOys1wz0Mmb0pB3f9HTm5hXixAl/55644e0PTGR+/yLdlZi45KFBzhdKRF04ZNt
	 0jmryVkcm2SPC63DgbVuPwzOCw84RPbvcBHTIDL2l793Tdtwv+gZsihhlzKwCZxEHL
	 8hvA7ydUlWyRYf0v2Dc5rpBtH/A64D/ESUQCjZo5VIooHXPh6DL9hz3F6sfbmQ2NWj
	 ra68COBXtoOxg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT schema
Date: Tue,  9 Sep 2025 09:21:59 -0500
Message-ID: <20250909142201.3209482-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Convert the Nuvoton watchdog binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 ----------
 .../watchdog/nuvoton,npcm750-wdt.yaml         | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
deleted file mode 100644
index 866a958b8a2b..000000000000
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Nuvoton NPCM Watchdog
-
-Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
-The watchdog supports a pre-timeout interrupt that fires 10ms before the
-expiry.
-
-Required properties:
-- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
-                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon), or
-                    "nuvoton,npcm845-wdt" for NPCM845 (Arbel).
-- reg             : Offset and length of the register set for the device.
-- interrupts      : Contain the timer interrupt with flags for
-                    falling edge.
-
-Required clocking property, have to be one of:
-- clocks          : phandle of timer reference clock.
-- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
-                    timer (usually 25000000).
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds
-
-Example:
-
-timer@f000801c {
-    compatible = "nuvoton,npcm750-wdt";
-    interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
-    reg = <0xf000801c 0x4>;
-    clocks = <&clk NPCM7XX_CLK_TIMER>;
-};
diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
new file mode 100644
index 000000000000..7aa30f5b5c49
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/nuvoton,npcm750-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Watchdog
+
+maintainers:
+  - Joel Stanley <joel@jms.id.au>
+
+description:
+  Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
+  The watchdog supports a pre-timeout interrupt that fires 10ms before the
+  expiry.
+
+allOf:
+  - $ref: watchdog.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nuvoton,npcm750-wdt
+          - nuvoton,wpcm450-wdt
+      - items:
+          - enum:
+              - nuvoton,npcm845-wdt
+          - const: nuvoton,npcm750-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description: Frequency in Hz of the clock that drives the NPCM timer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+
+    watchdog@f000801c {
+        compatible = "nuvoton,npcm750-wdt";
+        interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+        reg = <0xf000801c 0x4>;
+        clocks = <&clk NPCM7XX_CLK_TIMER>;
+    };
-- 
2.51.0


