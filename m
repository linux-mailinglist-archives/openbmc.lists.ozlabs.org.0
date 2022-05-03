Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D445181A3
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 11:49:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KswCf2kcZz3bdW
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 19:49:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TbX6Fdko;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TbX6Fdko; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ksw9z0lkWz2yQ9
 for <openbmc@lists.ozlabs.org>; Tue,  3 May 2022 19:47:50 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id t13so13627502pgn.8
 for <openbmc@lists.ozlabs.org>; Tue, 03 May 2022 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lY25J+l/icZWfRE50l9wwwRurDxjv0Qr8rloIw54cc0=;
 b=TbX6FdkoycdYFlSNFajYF5tae4wW4Zurp4/QOSdDJt/IGUh2HZ3W9dkZ+NOYGHCh6d
 MUcrDJavsmR6dGcNGmB8vOXzkPqQ081nBERORAEJV8ozDwsVfnk0/Ks76f6bou8Iv33r
 kkTYnzZS2NGySX9eK4l48pfxEi46Eona8n4wgCkg2crpmUtPS/SJIzKSyhOXnu6Y8xUi
 kl92GhNy92q4p5UUaU+K6IQtrBMuFv9gIPxjAuAyTcTG+P2s8qhKKkJZTJ4VypeFKM/2
 ROnHVkB7fEeIR957jU3A0NRd5a8Qt3Z8dNcZOjVT1FBw+kkG8SO23W9a2vnP3u2L7rbp
 5mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lY25J+l/icZWfRE50l9wwwRurDxjv0Qr8rloIw54cc0=;
 b=MCSUVjwnUtLn4BnaFSA5Ja9nBYIyO7rg8IpMsR0kMCnsAH57K6gqghWH4WSBprYakD
 ZlzkXER0baA7ZSUcOap3KQEC/6Cxvl0/HFFVWc9EiyndeKGVEjoC9skC5kp/ZXvHQckK
 ADekU6YMey/+KlNtgmcAvl3T/h24pMD3vgIZ8Bpjw96UgUu/EBbEWjbpzBjQ9fBqx8jN
 Ux9mh4Et9f/KABLOQ7aEpNnGeZQKUvNvcAMN2TUnWxLzE+5jpM1ggY4UTghyWBicfw/L
 MsaMEEYAfq5v27QwU69KEfhPafIj78L8jflHAPdw8rTfq1E9ak9iZsuhd7/XeSc6jEWH
 asPQ==
X-Gm-Message-State: AOAM530B162aIdqf00Sl34OS7q8XlVU+9ba+IoKHxrQbmooc0lx6x1UG
 w8zyIoqoIM6B3vzlGykVzspvd6f7HajhCw==
X-Google-Smtp-Source: ABdhPJwVmlVZS/kHbZn9fs3ztG1QIUFV61PnYoDZ0gmvpkylrtQ2sj7NN/mD3+liMaMufXVXGT0HTA==
X-Received: by 2002:a63:1117:0:b0:399:2df0:7fb9 with SMTP id
 g23-20020a631117000000b003992df07fb9mr13617574pgl.40.1651571268903; 
 Tue, 03 May 2022 02:47:48 -0700 (PDT)
Received: from cs20-buildserver.lan ([180.217.147.224])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090a421300b001d90c8b6141sm1015222pjg.53.2022.05.03.02.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 02:47:48 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v8 2/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Tue,  3 May 2022 17:47:27 +0800
Message-Id: <20220503094728.926-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220503094728.926-1-ctcchien@nuvoton.com>
References: <20220503094728.926-1-ctcchien@nuvoton.com>
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
Reviewed-by: Borislav Petkov <bp@alien8.de>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reviewed-by: Rob Herring <robh@kernel.org>
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

