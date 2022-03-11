Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DA24D5780
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 02:44:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF7yv17zHz30H5
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 12:44:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LVNOPTeq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LVNOPTeq; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF7xV0t6Tz30Hr
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 12:43:25 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id s8so6628923pfk.12
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 17:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KOp9n98NAfhyBKNJ48in3QCgAV2shS6ukPZvu9G+Pnk=;
 b=LVNOPTeq7yVHxuiYXioKJHB9ftbJssD3GUhDTaUUQvwJVaOwD7Effmc/GApFA9qRQc
 3JUjSyBADkxNqqar/3xfJRKqrlOQFfO2TNUHKMHuU2zD0Cidcs97hUa32b/pWLQ1LPy3
 KJiQkjuKFzB4Vj2bJU2Tji6O5+7FI8jbNOwo04aoH0pquwW6TWiUWOL3MR0QWBce8zl2
 V78dSkfGBG41e/WaJsD9ctEoV85V5VBfiZAl5yCiGaO/nfm4NMZZp5vW9WGyTBmmgNNR
 YrNMVrrmQ1E009r3QvGYjl1RsinRnMAIjMGcZNFeY9yB+HdoG2EPw/wBfhX9YehF8Gau
 iUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KOp9n98NAfhyBKNJ48in3QCgAV2shS6ukPZvu9G+Pnk=;
 b=AAZh2Vu7Z1uI9IbRHjHa7AcgBXrLqlTPzyblpyUy7FlA4/RZHnwVPkqrP6dJxoxENz
 t22R6HiZPx7O4ApolVCjWkXJhv9C9Vb2B95ehnLiqrTsYeDwEmia+0MOog0I+ZPnWkSe
 RjknBWducMHe5qCPKpT+vg+vgMLg6p9DzFoSSfd5JBj0gQGLGXu9wJNs9VnNsWpi8L0W
 vLRnw3LGDL3T1WqyukYG/pAGvgS3vqU1kQYuVKtDz8l8fe09nE6YsG2KM9e3hKxIYse9
 4f/NUPAUt3vOnYhjp7GwN9qoo+BWgXvbOxr/srlAPRbzQY4RcyEBXDzNVek4AS1bpOX/
 lJmg==
X-Gm-Message-State: AOAM530uXWSOnCP6x4hncB/HItIUDZQ5TFqIZN5UWqZnDZCrqTkW3gs4
 pN00Jkk9Zm7Um40nCmjI6hU=
X-Google-Smtp-Source: ABdhPJz0xp+1E5o5x66MsQoneXrCITG2vLyKkPzvEBWwEiFnnp9pgISelPf0lGRATlCjqDxliHoikQ==
X-Received: by 2002:a62:be1a:0:b0:4f4:c50:4209 with SMTP id
 l26-20020a62be1a000000b004f40c504209mr7642691pff.64.1646962998996; 
 Thu, 10 Mar 2022 17:43:18 -0800 (PST)
Received: from localhost.localdomain ([116.89.135.255])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b001bf564e624esm7194383pjj.39.2022.03.10.17.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 17:43:18 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v3 2/3] dt-bindings: edac: nuvoton, npcm-memory-controller.yaml
Date: Fri, 11 Mar 2022 09:42:44 +0800
Message-Id: <20220311014245.4612-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311014245.4612-1-ctcchien@nuvoton.com>
References: <20220311014245.4612-1-ctcchien@nuvoton.com>
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

Add device tree bindings for NPCM memory controller.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..46f61b0806ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#
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
+  error detection (in-line ECC in which a section (1/8th) of the
+  memory device used to store data is used for ECC storage).
+
+  Note, the bootloader must configure ECC mode for the memory controller.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm845-memory-controller
+      - nuvoton,npcm750-memory-controller
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
+
-- 
2.17.1

