Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E3651DDD
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 10:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbsBp0X4Cz3cg0
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 20:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hJX97MJD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hJX97MJD;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbs6M67SDz3fDD
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 20:41:47 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id w26so8123791pfj.6
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 01:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEq1Xvo7TP+/RkzCozMEE+yHkXadjfTkZE3mVm9oT9I=;
        b=hJX97MJDpk6dol+gxHK7BWJGD+1yFrwYTRqFYOU/2iF5lu+bLmR9h+spT9QDClr6z7
         5KQXdJ2rOeDLsadWplAKgJgsRTuPsJ71q4xu3HxLhzmGkfo7WIf9h029B1lW5tz9pNXf
         dgSdELhFF1wO2aO4CzbBMiZHuNbEizZPTyLHa829ybKZX/3IpjzwLwSv8qr5TMlFE4QR
         0g/dbMIVLHIgJelqyk5aXve1HXgOVxxCDj22Io8qgEkpZPOLsDk8+N6h+6lqrRYepHvg
         Gw6aZ2XJksxag1ar7zSvYpacCNiWIS0zQ+jIku/QUd5N6/PPrX/HJSutAe+Mbmdunrt6
         pDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEq1Xvo7TP+/RkzCozMEE+yHkXadjfTkZE3mVm9oT9I=;
        b=KpbTENeEPOziYxKV16C5V65vtjFnm0A6Gpwj6OoB3HMpobhnzE927uhf63PY+1JkDE
         3GyKtmZBceVU2YXCtmTvhJbV60XuzpqdKxuFN6GdRndXgu7ljzTvdKZM3fHKUjkv3pSG
         B3g6tSCyre46UdCxdzgm0XUhaCFlX2RC+qsqshBrJ3/kOo0wNfJZVe/H060gSIwp/WEK
         BuurTn3gXyCvFq50qz3IwIySf6Y7O9lJjTvRSpgTmZ6inCiyjWikyl+l6LBDrRKFvW/N
         Y9igK2mxW+H64UQQt0DS701OQDcz4DhJYwMRkCfjpFoGj9GcyjqgTM6EBaJSGl88hXtv
         PDBA==
X-Gm-Message-State: ANoB5pm0duYYplo6BzxgbBaVlCsDzCXRKl71ysXWZy5DRdlXk6NYlrwx
	Yo/pJPMOrqSwPZ1wf5sy3As=
X-Google-Smtp-Source: AA0mqf4nO88TS9Ril5ywXIoiLe4H5qgAjOx0d7y20leNoCHwVd7XR2mebTf3bAlKx7TrOVX4bYnHFg==
X-Received: by 2002:a05:6a00:705:b0:566:900e:1023 with SMTP id 5-20020a056a00070500b00566900e1023mr42629863pfl.3.1671529305475;
        Tue, 20 Dec 2022 01:41:45 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm8210230pfb.63.2022.12.20.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 01:41:45 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andrzej.p@collabora.com
Subject: [PATCH v9 2/7] media: dt-binding: nuvoton: Add NPCM VCD and ECE engine
Date: Tue, 20 Dec 2022 17:40:50 +0800
Message-Id: <20221220094055.3011916-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221220094055.3011916-1-milkfafa@gmail.com>
References: <20221220094055.3011916-1-milkfafa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kflin@nuvoton.com, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-binding document for Video Capture/Differentiation Engine (VCD)
and Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../bindings/media/nuvoton,npcm-ece.yaml      | 43 +++++++++++
 .../bindings/media/nuvoton,npcm-vcd.yaml      | 72 +++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
 create mode 100644 Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml

diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
new file mode 100644
index 000000000000..b47468e54504
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-ece.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nuvoton,npcm-ece.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Encoding Compression Engine
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description: |
+  Video Encoding Compression Engine (ECE) present on Nuvoton NPCM SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-ece
+      - nuvoton,npcm845-ece
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+
+    ece: video-codec@f0820000 {
+        compatible = "nuvoton,npcm750-ece";
+        reg = <0xf0820000 0x2000>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+    };
diff --git a/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml b/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
new file mode 100644
index 000000000000..c885f559d2e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nuvoton,npcm-vcd.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nuvoton,npcm-vcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Video Capture/Differentiation Engine
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description: |
+  Video Capture/Differentiation Engine (VCD) present on Nuvoton NPCM SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-vcd
+      - nuvoton,npcm845-vcd
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to access GCR (Global Control Register) registers.
+
+  nuvoton,sysgfxi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to access GFXI (Graphics Core Information) registers.
+
+  nuvoton,ece:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle to access ECE (Encoding Compression Engine) registers.
+
+  memory-region:
+    maxItems: 1
+    description:
+      CMA pool to use for buffers allocation instead of the default CMA pool.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - nuvoton,sysgcr
+  - nuvoton,sysgfxi
+  - nuvoton,ece
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/nuvoton,npcm7xx-reset.h>
+
+    vcd: vcd@f0810000 {
+        compatible = "nuvoton,npcm750-vcd";
+        reg = <0xf0810000 0x10000>;
+        interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>;
+        nuvoton,sysgcr = <&gcr>;
+        nuvoton,sysgfxi = <&gfxi>;
+        nuvoton,ece = <&ece>;
+    };
-- 
2.34.1

