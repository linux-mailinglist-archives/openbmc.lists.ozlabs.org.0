Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E63CA5294C2
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FRM5vP0z3bfc
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:13:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fq8DQqUi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Fq8DQqUi; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzNf72Dsjz3bdC
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 17:27:43 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id a11so4057926pff.1
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 00:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dtvS7FlIf6tiGDrDOHrDDb05Y2i6bh3qVCm0jbGaTfc=;
 b=Fq8DQqUiuTeBvjwMLN4ijRYR6zk7T3iscOZPOZpo7V/inYN1tARpbUpr9GcKrcWCtr
 xTcOAKcWGO8lgl7f6wQWzigNULVyeagQQ4hKrV9mwjh8BXMwVEhm8CMajdPGK50VPz3G
 2h/mi+I7Z6Eh4do3Rt53TT0xs8xLKehv7tWuDi98Iv3pD/fbQxskTjj6HbwaCCC4QHpy
 so4EoVeEbXLmDFOEZ16we9MwMbeNofGc+qgqRlkQDoHyFDtyTkgIndqLdzz08Uf7Tujl
 1O1/iXf4DcDzx3nZbsajrvMEWbzI3hl70ckN+sHthY00xk58ldQIovF/6a2D+mEe1QwT
 a1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dtvS7FlIf6tiGDrDOHrDDb05Y2i6bh3qVCm0jbGaTfc=;
 b=r9iAzCYuXMTkq1JGTrZNBw1E9PCyEA7YyHwzq14ViTp673pGx4qTRmbPMk0oBweZXS
 B+f1VmGouyl8kEtKVUDOhYmopxQtnK93rhrLd9ASUoxaKDb+iAln4IjdvNO34giVnmXp
 FviFgRITgVH1PXrplIANmn4rEZYhpmR/SqqvyCf60lfkHRWq0iyLDzmGrzcG3MRO4djP
 kB4v4LBBS3ZCxuLwwgPSG4sJlV0jVWD6pGjgNZIDMtaB8Aef+ydAshW7LVl0mAxsivGj
 aLjkJECV7mbRnZuNuHazjmk1ceRbLPKGgTyBJCKBPtzMLRxqPm+oYWMt9ArPMjXrISjJ
 MMzw==
X-Gm-Message-State: AOAM533b2lzFCk7Hsi0vmqPabIRIB5piIEGmFw/QVqNnZ6DKh/6UJfZ9
 PUkjUCyyOKOKXam1JKsMHAA=
X-Google-Smtp-Source: ABdhPJzm+l7FZcdP7tr/TRaL9GcPdCoZClzkN7Do+4ZC93DqeO6ejV4QY6JXCMUuOVRs7H1YWO+O8Q==
X-Received: by 2002:a63:5619:0:b0:3ab:aac3:8e86 with SMTP id
 k25-20020a635619000000b003abaac38e86mr24565301pgb.300.1652340460930; 
 Thu, 12 May 2022 00:27:40 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020aa79e49000000b0050dc762813csm3082779pfq.22.2022.05.12.00.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:27:40 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] dt-bindings: media: Add dt-bindings for NPCM Video
 Capture/Encode Engine
Date: Thu, 12 May 2022 15:27:19 +0800
Message-Id: <20220512072722.25005-3-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220512072722.25005-1-kflin@nuvoton.com>
References: <20220512072722.25005-1-kflin@nuvoton.com>
X-Mailman-Approved-At: Tue, 17 May 2022 09:10:20 +1000
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for NPCM Video Capture/Encode Engine.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
---
 .../bindings/media/nuvoton,npcm-video.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml

diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
new file mode 100644
index 000000000000..b5be7ef09038
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-video.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nuvoton,npcm-video.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Video Capture/Encode Engine Device Tree Bindings
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description: |
+  Video Capture/Differentiation Engine (VCD) and Encoding Compression Engine
+  (ECE) present on Nuvoton NPCM SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-video
+      - nuvoton,npcm845-video
+
+  reg:
+    items:
+      - description: VCD registers
+      - description: ECE registers
+
+  reg-names:
+    items:
+      - const: vcd
+      - const: ece
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: VCD reset control
+      - description: ECE reset control
+
+  reset-names:
+    items:
+      - const: vcd
+      - const: ece
+
+  nuvoton,syscon-gcr:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description: Phandle to the Global Control Register DT node
+
+  nuvoton,syscon-gfxi:
+    $ref: /schemas/types.yaml#definitions/phandle
+    description: Phandle to the Graphics Core Information DT node
+
+  memory-region:
+    description:
+      CMA pool to use for buffers allocation instead of the default CMA pool.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - resets
+  - reset-names
+  - nuvoton,syscon-gcr
+  - nuvoton,syscon-gfxi
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+
+    video: video@f0810000 {
+        compatible = "nuvoton,npcm750-video";
+        reg = <0xf0810000 0x10000>,
+              <0xf0820000 0x2000>;
+        reg-names = "vcd", "ece";
+        interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>,
+                 <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+        reset-names = "vcd", "ece";
+        nuvoton,syscon-gcr = <&gcr>;
+        nuvoton,syscon-gfxi = <&gfxi>;
+    };
-- 
2.17.1

