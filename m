Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B2252CCDD
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 09:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3hH619tFz30Jp
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:26:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jZzhFSYQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jZzhFSYQ; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3hG04P4Mz302c
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 17:25:12 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so4426259pjh.4
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 00:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=izhcXDphxsSYMgLi7WOIxwg7ve9I4BtGghSY1eoBQEs=;
 b=jZzhFSYQ6xCZWQ48bdsBqBDao2zARJZkZyDZsUfdzMeDDlGumxtck1+YKCQVqhOiwn
 zzWbwYkxaOrsQSp52OnMaLSG80Kz+x8GL3kyJJ0cVGc7kyQU7uCwQfPJF4Avk0KuCMYd
 vDGTVqQUNFa83s4j8Pm0YxbfhwEDkje/lPcSgsyK6vkjd+u2dQuyckvBZnFBAHrHLT9s
 Eh/40tmJitMVYZkEJBUC+q8QLiZVn+Go8EtS5x/iCKhb3Tt0EpSQhib0cLLtuzuj7wHH
 jx2826dhlVarBTt6wtB8eDqqsBZHqrT+Mbaki/HCwiHKTJfdhqWO0aXDHqi8BCeAepP4
 gMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=izhcXDphxsSYMgLi7WOIxwg7ve9I4BtGghSY1eoBQEs=;
 b=UfR97Rh2J7bUbF9vr1We3h3iwetjGryru/7ilLGt5NbN0cyK9hr/eSlgXr/vJan7Cz
 L23Ti1q22pRBfDQHG4yAthM+FiSEsyEv4SzB6l0z1UGZOutaTOSaW3haWETw48c26hDH
 lq0wWx4XgDBQjshVYsdx1hGjBH8eo/G5P0eaI6YQuJYxOg5wCpcCAKO7XldU2AUGV9Hs
 d6qCuZaj64neZTnBrx5rz4Oi83wmlA4X8IJ0x1SbyYa5kT3OdezBViN2sKkLwoIYu4+8
 XZkIk0ia549IEOPDoH0DziDNZvY06/9SArhW0o1hHXTX2zkzS+RXZuwmSTvjDfLP2f/4
 WxaQ==
X-Gm-Message-State: AOAM532z4jG/7WD+R92gtDt7Z0lfOZ5WSq1zPkv/s3IQmx1lWdA9GNtK
 GGnfrpHKoKJg+dwf6txr27U=
X-Google-Smtp-Source: ABdhPJxRWMLiPZC1hEmCnRDpsE1fl+ZNEr/v7kfplga+jDdVtU/2eIrwAPw+PI8xO0UejtD6e40BnQ==
X-Received: by 2002:a17:903:4044:b0:161:823e:6f93 with SMTP id
 n4-20020a170903404400b00161823e6f93mr3501687pla.172.1652945109335; 
 Thu, 19 May 2022 00:25:09 -0700 (PDT)
Received: from localhost.localdomain ([116.89.141.50])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a170902650c00b00161ac982b9esm2974159plk.185.2022.05.19.00.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:25:08 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v10 1/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Thu, 19 May 2022 15:24:52 +0800
Message-Id: <20220519072454.24063-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220519072454.24063-1-ctcchien@nuvoton.com>
References: <20220519072454.24063-1-ctcchien@nuvoton.com>
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
 .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..a5c8d332d1c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,62 @@
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
+  - Stanley Chu <yschu@nuvoton.com>
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

