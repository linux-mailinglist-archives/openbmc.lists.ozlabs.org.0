Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A5525A2D
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 05:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzvTW5NT0z3c7D
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 13:37:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TvFxDavU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TvFxDavU; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzvS04sZyz3c87
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 13:35:44 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id a19so6141973pgw.6
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 20:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dtvS7FlIf6tiGDrDOHrDDb05Y2i6bh3qVCm0jbGaTfc=;
 b=TvFxDavUOSETDp5c86O/FIw5P8NfWt6jFC4qzzhfL3zt2e8xuK/a6bpi/UDtmgqFb7
 CL4qpR6I9Xhos8Qnn4w3u1MxRoDR5ye+XgrvW/d0mVesmWcvEHpKuimCRrUhxXu4dtdS
 wQpZQMZYh1ZwVC0oBSb6GNBc8DRM/efsxGUnfhMToewGziuQWfZUC71gMP59yRAio7I0
 lXVLHet7/dgfSpTAP9tCTlacge2WqcpbWOH/nOIFAuYnGV6oAYd0lOIxiKJgqb5lEu32
 Qmfp1zkMYMgnZQ7hUbNxm57J2eC/jajFMGqSx3hxxoicUalK6eftOePhYJRygxY2QWeH
 9xLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dtvS7FlIf6tiGDrDOHrDDb05Y2i6bh3qVCm0jbGaTfc=;
 b=qq4MlIf40dusT70K/sxrW1q0/x0sdGHmzglMIfiKEs99+xrU9HQ097/k5cpQSVTAzi
 QtmhMARXaVeIYsOmJ+IKJ+WADJCSHDs3N+wEeI9N+dc+7zrQwL/eJxouOeUrMdKo5toN
 WUOtzeIVxLHFEAczLRJ87CPqZhlvh5w6gy+XFwvcb+opw3JLtXfR+zeqC39A/5aR14/a
 5AZc8c1KIsPUw3ayvRsHx/1kzGdNRipg9h/m4NhyBkRZBierHWqBYAmyLc6S2XINLUzg
 ucSaXR9c18Uu4PEtoDqVsKRLCs0xb8EVne4cn0LID1Qxq7g1mWHc/b1Xh4Bjx9cV4LKH
 kX8w==
X-Gm-Message-State: AOAM532hvIVi71x8wkaF1oYzpWeGvxMwKIL9dj4Yc0QHPCshQsog7LL/
 J/2FuG3iM41eEzWOyWQXZ+LXbQLfmosurw==
X-Google-Smtp-Source: ABdhPJykSY+x5DFPM60jcPqnYTCfDkB4gpF/skCH5s7NCx5DG3m6bI3WtiRCjCI8qJ572g7oYPUL/w==
X-Received: by 2002:a62:1ad4:0:b0:510:c635:e516 with SMTP id
 a203-20020a621ad4000000b00510c635e516mr2807623pfa.42.1652412942346; 
 Thu, 12 May 2022 20:35:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a1709027e0700b0015e8d4eb1c7sm685133plm.17.2022.05.12.20.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 20:35:38 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: media: Add dt-bindings for NPCM Video
 Capture/Encode Engine
Date: Fri, 13 May 2022 11:34:47 +0800
Message-Id: <20220513033450.7038-3-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513033450.7038-1-kflin@nuvoton.com>
References: <20220513033450.7038-1-kflin@nuvoton.com>
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

