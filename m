Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD85294C7
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 01:13:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2FS43z3Bz3bXn
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 09:13:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OdN4wM8M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OdN4wM8M; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzNf96gt7z3bcj
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 17:27:45 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 31so3831438pgp.8
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xTHRu8kouNwhCxQDkX6+/ir1de51U8hSVFEEAos2UZc=;
 b=OdN4wM8Mb3KbVJVyo5/ZT4Ve97E3N6JtVsYFOVpMZ3pdbubWh8RpgDxOzLi3UGRPeb
 wL1u3lEAvhO4g+nXyvQ4kN2z024WQjLlh68QRej/VJflosEW7RnWr0K13p5vfB++tZCr
 WHppO+GsUg6RyaZwGD7+srrCfZ73uK1ZMs2xnRBt14pNxwSTI1qCTCC9hapmJa0QJP16
 j2BwFWBro1jvx3WMd9VGM7B/EIYUCT8pinkPe8AO2VmZIcy4aIjVlsB/3uijUpx8+mfo
 W/ECm/fCpmqHYH6VI/v1bTvTx2dxBbdMaaSttif06SjZg5u0/2iUXz9Bx71SzxKSKPGZ
 CeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xTHRu8kouNwhCxQDkX6+/ir1de51U8hSVFEEAos2UZc=;
 b=TvG7KAtrFk/jWfPovxGBuZzfWgo0WWgnYgbgRfMQxvUAgWXWi1loAjXDWE0cdholqm
 v3Ib1GS2kc35t64mYoY6w9xAablNak2paHx5KQLyKbszPZcXLDJhkkFlreg/JbpI3s8g
 +x2iQ68YURNWhVAIDUqOP31V+hqnLdkKWUc/cY0fFBP3pHHxK0t5LzkcZtt6CK9+Pfl2
 qFsLFIFpPXRSPvsSFBa35N7oIcjtc9vZ2jtPHdjNv93Wb9z7TJpofZdC/eAxWY7cFrBS
 Jbi1ajJUUpukTya1zJFpt4TSevQtuDrKEz11uUUFVZPjoCf9smCyZO6ojRp40fOIyecj
 V9jA==
X-Gm-Message-State: AOAM533yVllZe30+RUQ1Oxlq8zOzMQEBdb/0Qmg0ErAoIGR+32aHJd6L
 2pPJe6OyXfKM8VvEq32uJ4Xx/QrNMGIEEQ==
X-Google-Smtp-Source: ABdhPJwNO9Dm9dN8+IOZ5WxUnWOlu+WOfNoj1zFH4ybZ85dk3mXkSmiHefjlsuS3pn2sLeq6XiznZA==
X-Received: by 2002:a63:1a12:0:b0:3c6:870:e878 with SMTP id
 a18-20020a631a12000000b003c60870e878mr23889607pga.291.1652340463410; 
 Thu, 12 May 2022 00:27:43 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020aa79e49000000b0050dc762813csm3082779pfq.22.2022.05.12.00.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 00:27:42 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics
 Core Information
Date: Thu, 12 May 2022 15:27:20 +0800
Message-Id: <20220512072722.25005-4-kflin@nuvoton.com>
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

Add dt-bindings document for Graphics Core Information (GFXI) node. It is
necessary for the NPCM Video Capture/Encode Engine driver to retrieve
Graphics core information.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
---
 .../bindings/arm/npcm/nuvoton,gfxi.yaml       | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml

diff --git a/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
new file mode 100644
index 000000000000..5b785bda5739
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/npcm/nuvoton,gfxi.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/npcm/nuvoton,gfxi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Graphics Core Information block in Nuvoton SoCs
+
+maintainers:
+  - Joseph Liu <kwliu@nuvoton.com>
+  - Marvin Lin <kflin@nuvoton.com>
+
+description:
+  The Graphics Core Information (GFXI) are a block of registers in Nuvoton SoCs
+  that analyzes Graphics core behavior and provides inforomation in registers.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nuvoton,npcm750-gfxi
+          - nuvoton,npcm845-gfxi
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gfxi: gfxi@e000 {
+      compatible = "nuvoton,npcm750-gfxi", "syscon", "simple-mfd";
+      reg = <0xe000 0x100>;
+    };
-- 
2.17.1

