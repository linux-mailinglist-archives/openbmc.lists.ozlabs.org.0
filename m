Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 797765308AB
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65TB2Nx2z3bms
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=InOjKJS8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=InOjKJS8; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65Qv6Mlsz3bmg
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:26:15 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id n18so12107010plg.5
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
 b=InOjKJS8DtzGWYMxutlgKENhz4qFuLERtYlmjq9fnQFXa0d0V90lbi3toVIMrkN5rw
 E6mloFM2NrhVkI6+3dOMhZT81+4lMlFcqUlwVzd55b1tyKgX2+/unruVYNDYo/P3OqDP
 g0lrV/CJgpLUvvFguCLWrJFHjzfn255Jj6N8UBzzOzNyj1ofnHAevfyw2kgsg+yUsXOM
 /gO7n19Esuqk3U3xM8lkXwDajaur8Zt1p+4TmjVmOK/Ax2hfFSPnQrho0Nw9kIIzf4GF
 ifp/tN43q3nzTQlYE4ITL76ZtQWuSEpWYsxjgPcZW1WQe2Urlxub3Rh2GUmFQWZYTjdz
 K32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GEI1FA1mQ9xGFS7EtSwjOQXPWUXeFadWZPerzpqwRAc=;
 b=0iHsaYsroluRHY7e8Im1z8Ek4nxTh6LlFhkRfxvqBxivhCpNty2DtalVoxTY5LPmtj
 nCUYrtu7rpn0GaR0U6sONb2vJhb3bFxb6FmpA6yRrwla4hZvdurBJ6P2+J0mlSxsFSG4
 ZICbImiDDtisUNB8LhOOcy4oO2R8VPX7RcNFXqEz/0ihS7WTXlBnsYRQlXwCQaxiOOya
 XxVj+OlaZVCs7XmpfQDZ6HtM26ve1eS+lpXXqL0aDiiO/nUBXAjTXk5yL7XM2pz4ZTDj
 Mo2Ali81wLg2YOszLDZWExShcVo1Qpa4XVJMNq5/7uJTbrzJIMKCMxLsiaPyxzY1fTmq
 Cdeg==
X-Gm-Message-State: AOAM531p3za615NoIATQACDdFDd2PSCb0yrC4/kVSawog/5qgC5qQNpy
 2KJ+w9uixMICICB1GHSMzjk=
X-Google-Smtp-Source: ABdhPJwZwLq1fbudjoA8h0YcXQh5GalUCiWIZyfB0meQ76SgOPTx6Y4vqoKhJXWOdMn9KJZZhFz2BQ==
X-Received: by 2002:a17:90b:4c48:b0:1e0:74b:324e with SMTP id
 np8-20020a17090b4c4800b001e0074b324emr14471709pjb.134.1653283573470; 
 Sun, 22 May 2022 22:26:13 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a655285000000b003c14af50603sm3871523pgp.27.2022.05.22.22.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 22:26:11 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] dt-bindings: arm/npcm: Add dt-bindings for Graphics
 Core Information
Date: Mon, 23 May 2022 13:25:46 +0800
Message-Id: <20220523052548.28109-4-milkfafa@gmail.com>
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

Add dt-bindings document for Graphics Core Information (GFXI) node. It is
necessary for the NPCM Video Capture/Encode Engine driver to retrieve
Graphics core information.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
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

