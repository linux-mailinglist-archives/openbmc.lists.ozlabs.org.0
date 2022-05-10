Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D7520BCB
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 05:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky34k4bNPz3cC8
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 13:12:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l2ohVwoc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l2ohVwoc; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky33B2JRKz3bxR
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 13:11:18 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id fv2so14750706pjb.4
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 20:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cs5AJiUrtPIin+3SFfYWSrLnTMbQJ1lpN7zepgpEgDM=;
 b=l2ohVwocRz0FsilHfQ2ykS4ogqV2+gSA0DhzyOKftoD5Eptf77mLNFMTtOn9ubPN4+
 uYbDPQnWoFnpqjHfmblBph23d9e8E/S4aN/PRTakBGaceqGJr6niNSP00CCdldSzf2FQ
 1MVqEd3yb+BSS0R7ImH9PrlJUUI8OVxOxV5pugvEwbg5Rc8CarRjB3j39SAyjW8CWQ/Y
 Ol6gBnWQWkZkCyrsEUPT6gvwZ5fgQQPa+6gFA3jXQiNynM0L27QBXLQzWaadIIZGpWzN
 7N1R8f8jMReEKiS1ahvSDXlFkRJxYJMSmly13XvTYfUV98Vk/x0zeOf6sDCLlNMUbYm6
 O2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cs5AJiUrtPIin+3SFfYWSrLnTMbQJ1lpN7zepgpEgDM=;
 b=QE3y6r9ftx0UCwvSWKpDzVqJFTnseuwY1FNsGy+QYXl9npiBXlP/8p/dhCYycw1/3r
 n3BHVsB5P7Yd8PAE4Q/utzJbXaAlW/1FksQUx7t9AbhGbbmsy6/D3Ekfm00C8GreL9+G
 F0Rzs2tVP0+lpNiOv7fZsW7dINjepCGNUXTTdnjPhHRAGU/QjgRYwpaj4t/zKZkhgq3x
 Hd5HIXklZQZfUL0LtIFPXGnWhHkVUBbwXTiSwfYXZTG80IAU1n2PUxShFyxUVIhueXrn
 003iIeVjHdP+Lf4BV6mH3O5hIltno+nwjaEGJ9HflLwALMGXWjr0d8e7AWuv/VV7TCmI
 LqRQ==
X-Gm-Message-State: AOAM530IRC2SEfJzRSejfHT0p3fekxceJhPbCKxd9h1dC1jRl/Sd7aYd
 oRC0fhk9QEJchzJh/4EtMR8=
X-Google-Smtp-Source: ABdhPJzKn9d1USsne6qNHYXmJOXaqA7jhQ7vVNWjL8Tphw/i6EToB7UrzQZJeisP0Nwai+u6sDRJNg==
X-Received: by 2002:a17:90b:3b84:b0:1dc:970d:bc1b with SMTP id
 pc4-20020a17090b3b8400b001dc970dbc1bmr20492178pjb.147.1652152276252; 
 Mon, 09 May 2022 20:11:16 -0700 (PDT)
Received: from cs20-buildserver.lan ([112.78.91.252])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170902c38d00b0015e8d4eb248sm648824plg.146.2022.05.09.20.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 20:11:15 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v9 2/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Tue, 10 May 2022 11:10:55 +0800
Message-Id: <20220510031056.1657-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510031056.1657-1-ctcchien@nuvoton.com>
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document devicetree bindings for the Nuvoton BMC NPCM memory controller.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..6f37211796a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller
+
+maintainers:
+  - Medad CChien <ctcchien@nuvoton.com>
+
+description: |
+  The Nuvoton BMC SoC supports DDR4 memory with and without ECC (error
+  correction check).
+
+  The memory controller supports single bit error correction, double bit
+  error detection (in-line ECC in which a section (1/8th) of the memory
+  device used to store data is used for ECC storage).
+
+  Note, the bootloader must configure ECC mode for the memory controller.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-memory-controller
+      - nuvoton,npcm845-memory-controller
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: uncorrectable error interrupt
+      - description: correctable error interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: ue
+      - const: ce
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    ahb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        mc: memory-controller@f0824000 {
+            compatible = "nuvoton,npcm750-memory-controller";
+            reg = <0x0 0xf0824000 0x0 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.17.1

