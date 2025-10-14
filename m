Return-Path: <openbmc+bounces-737-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18DBDA61F
	for <lists+openbmc@lfdr.de>; Tue, 14 Oct 2025 17:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmJ706gt1z30M0;
	Wed, 15 Oct 2025 02:29:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760455788;
	cv=none; b=YsvL5Ou2Z8ryYV4+XXBWZEXCLICTSISdR+gf9xcoeVhbtUhPCzHp7hZr7p0XUGXNqUQlVJuY9P3bTQDFDVS7FoiWlzGyExvxbh9puWjzggSJ3/gMFa5uTAKHdw1NLwK0rvSyG8qr8ZX0oklL1j1FmFHzm1KFgmBujpF4FItDE9r6MFECsMrSDYrlCe+5DIDl2SHJyjoInKgEYCJRcC+CiQjRe0SoXQfoPsUYbHSwJNovRzQj9KBTRMpYXEH+oCJfSo7ppXwQxXte6YVXqxmJPTvMW7lblxgXEu33JqXACp+xQdxXAflCxp5me9VEOFP3jDYbSHY0yJxqpzq62b7E6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760455788; c=relaxed/relaxed;
	bh=1tjjJZTPucC0/IqLn+TggSumRZ38XQb/kTlvPmf+FTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bt0uZBIRcDuDb3LyrXY8vFiZ4iaoooG2lZZApb4KkiQr4PhwqIm9ECMNDpvNDYfTF6WyvrkL/rz6rGs7H9pckBK1us7ni1eG6FhH8lfT2ZvxoG8q3VnZPWQXRQrWcySLhBkNVVCBphIU08p9BXBy7w+92NrhvlYQ83xB7Cj/PPLI98dGv7zQv/49/V4uqWkMQaJSEhOPRy9Nsu6NjVHX+tVa14z/ORiv6jQd98do3OSjHU5Jr2Z5J8Kio6vtDyqoXjleaSWW7rQy+8eB4wqqneOZXJjF3PVA+H3PTgeIDzzdPLI2Mebv09HFTey9e0TahzgtyzzaEMGk5tInSCMcRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ui+5zuIW; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ui+5zuIW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmJ6z0Fy3z2yrZ
	for <openbmc@lists.ozlabs.org>; Wed, 15 Oct 2025 02:29:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48F1045263;
	Tue, 14 Oct 2025 15:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D838AC4CEE7;
	Tue, 14 Oct 2025 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760455784;
	bh=BCLZnlFtfyfyqV95kvnr8DLzhbdzdFCeJdir6zX5uTc=;
	h=From:To:Cc:Subject:Date:From;
	b=Ui+5zuIWnH9o2ODiPohYBuH53HAXcp05rYdTb2k/l4FZoTMYVTi/zn2mHtu4w/lxw
	 4DU9Ds3qR9LCrH7/YQhG3qZKpC0uS9r88ZG//Xe/U7h5UnivDsuLe8gDRQqdqSBC1b
	 KQzYtLhIYs3yF0eT9UYpeOySOWVQKuhQ99brGjB4ZuTiTUUO+DqSGvumpszs7kE5CV
	 uNGFXL7ivKgcEL+L7Z668sMoxp8Y9RHnwP5EVJcaN9vYxuvQC1GA6yKTpTuD/s/avo
	 0zWtljnka2dgEzaAkYjQ8wcfF2tOSt9fsYmE5RWHhLKm2YHMMNsTVBCFerys4sxb7v
	 1/o2JHyUIXgZw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Corey Minyard <corey@minyard.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ipmi: Convert nuvoton,npcm750-kcs-bmc to DT schema
Date: Tue, 14 Oct 2025 10:29:34 -0500
Message-ID: <20251014152935.3782463-1-robh@kernel.org>
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

Convert the nuvoton,npcm750-kcs-bmc binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/ipmi/npcm7xx-kcs-bmc.txt         | 40 --------------
 .../ipmi/nuvoton,npcm750-kcs-bmc.yaml         | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
 create mode 100644 Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml

diff --git a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
deleted file mode 100644
index 4fda76e63396..000000000000
--- a/Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Nuvoton NPCM KCS (Keyboard Controller Style) IPMI interface
-
-The Nuvoton SOCs (NPCM) are commonly used as BMCs
-(Baseboard Management Controllers) and the KCS interface can be
-used to perform in-band IPMI communication with their host.
-
-Required properties:
-- compatible : should be one of
-    "nuvoton,npcm750-kcs-bmc"
-    "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc"
-- interrupts : interrupt generated by the controller
-- kcs_chan : The KCS channel number in the controller
-
-Example:
-
-    lpc_kcs: lpc_kcs@f0007000 {
-        compatible = "nuvoton,npcm750-lpc-kcs", "simple-mfd", "syscon";
-        reg = <0xf0007000 0x40>;
-        reg-io-width = <1>;
-
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges = <0x0 0xf0007000 0x40>;
-
-        kcs1: kcs1@0 {
-            compatible = "nuvoton,npcm750-kcs-bmc";
-            reg = <0x0 0x40>;
-            interrupts = <0 9 4>;
-            kcs_chan = <1>;
-            status = "disabled";
-        };
-
-        kcs2: kcs2@0 {
-            compatible = "nuvoton,npcm750-kcs-bmc";
-            reg = <0x0 0x40>;
-            interrupts = <0 9 4>;
-            kcs_chan = <2>;
-            status = "disabled";
-        };
-    };
diff --git a/Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml b/Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml
new file mode 100644
index 000000000000..fc5df1c5e3bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/ipmi/nuvoton,npcm750-kcs-bmc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ipmi/nuvoton,npcm750-kcs-bmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM KCS BMC
+
+maintainers:
+  - Avi Fishman <avifishman70@gmail.com>
+  - Tomer Maimon <tmaimon77@gmail.com>
+  - Tali Perry <tali.perry1@gmail.com>
+
+description:
+  The Nuvoton SOCs (NPCM) are commonly used as BMCs (Baseboard Management
+  Controllers) and the KCS interface can be used to perform in-band IPMI
+  communication with their host.
+
+properties:
+  compatible:
+    oneOf:
+      - const: nuvoton,npcm750-kcs-bmc
+      - items:
+          - enum:
+              - nuvoton,npcm845-kcs-bmc
+          - const: nuvoton,npcm750-kcs-bmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  kcs_chan:
+    description: The KCS channel number in the controller
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 3
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - kcs_chan
+
+additionalProperties: false
+
+examples:
+  - |
+    kcs@0 {
+        compatible = "nuvoton,npcm750-kcs-bmc";
+        reg = <0x0 0x40>;
+        interrupts = <9 4>;
+        kcs_chan = <1>;
+    };
-- 
2.51.0


