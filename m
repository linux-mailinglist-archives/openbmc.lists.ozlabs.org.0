Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C230B5308AA
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65SV4plFz3blp
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=R6c2nl5K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R6c2nl5K; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65Qr213Xz3bfH
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:26:12 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so16479210pjb.2
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+FUdcVoA5R7wkkHkMVOX+IHghKx89t2KDXyDGNa8qBo=;
 b=R6c2nl5KrnhNEkove4KTx/BElMMIxh+E5gC3bJ7HHQApdDIuYooA4ni1kTCZVvScAi
 KxYc+BBZc7PSe387pUzYB8jc1pgu+/V5LCpCinqAoaRCiaI7b5WYeLEUUa82doZgGVC5
 n7E5PYFL1ePjLb9jXUVs8O+hvzFVF5pRPXi1imAVPt69rHKPDbUIlPfxOs+whSp5kybN
 pi2Xrkplbp40+4m61GpXuRjs2bKhr4/k8Qk45CuD6XF5Wj0ptTmKqvQ6qDmWvSL4mUQ9
 vCnlMKuMP8gM9F7sS6/ws3KZXxn0Hdchn9TN/pCzKTjjr8L5wqUF+nr+VZN8bLqktoda
 y0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+FUdcVoA5R7wkkHkMVOX+IHghKx89t2KDXyDGNa8qBo=;
 b=A5nD7wPvr8U+3smfDliGwcKlps7y+/sw0tl9z9+7hGcWUkuavHg/7Hawjxe7EO3Jg5
 C3EGcC20OrwhpxsuafcG1CwUsRCJI1mgp+798gtyVDOya8EiUraqYlSZCX7SUn09uBrT
 mfPb6nBnBlm0crMdvaTlYz8OYHz/GSyosmphQPvWOMr0/c3BBsgVrx41W+Q3MMhMonEM
 KW7saaUdgrKOg2sqgxONYFWx8THmL3+y9rVJ9h5xxFFa4KYLvBr/34RD3YuVHxW+c2Fk
 hS1XOEC/5Pqj/mb2of2goieUp3cCjOWbJDVXqRIHCRGYAzDGvMTgyTc4y14hm/cqzstE
 uSZQ==
X-Gm-Message-State: AOAM531ct6Cg4aUOEys8ksezMewrOu9rfssIXnchqNha6M3ECBKgxwpa
 VKd6bmPDXbn3v37WNZb8mD4=
X-Google-Smtp-Source: ABdhPJwElZ1Se0zVFBM1vSU46VJvvTa0wJKQ+UP3XEFK17g5rmdA54VOuQycyRZMx4fINr97R46TFA==
X-Received: by 2002:a17:902:b083:b0:161:e861:ebe3 with SMTP id
 p3-20020a170902b08300b00161e861ebe3mr17269183plr.7.1653283569909; 
 Sun, 22 May 2022 22:26:09 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a655285000000b003c14af50603sm3871523pgp.27.2022.05.22.22.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 22:26:09 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: media: Add dt-bindings for NPCM Video
 Capture/Encode Engine
Date: Mon, 23 May 2022 13:25:45 +0800
Message-Id: <20220523052548.28109-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523052548.28109-1-milkfafa@gmail.com>
References: <20220523052548.28109-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for NPCM Video Capture/Encode Engine.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
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

