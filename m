Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077385F72ED
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 04:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkCf35t52z2xJF
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 13:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NhGM+19v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NhGM+19v;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkCbQ4mc8z2ywm
	for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2022 13:55:14 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id l1so3357873pld.13
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 19:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivOKkRa7qoXlEHndiKqBlU8PgBKgYvM0wW8U6/YUkjE=;
        b=NhGM+19vGc4k828JHLkiS5YRY95DXwh1I3MlqYqwKkfk4So3DeqyD3u7JzfJqlFZMm
         hKylMrJ/805YUVtd0ngv3S0bomRYffEllg93vT6BGstc/0TGbFIzHaBZGDA84zyXBlGd
         oT3ITPYijLTUnUWVPNRfKpUMq6uotPg2apUdifG5qeOl6P1x1bXn19DPifawRhgyaEEE
         mnEaWJagKY2LZ8/iv5XfUk/gW7hopFP+S+OYyIXqR0z8ylcySPtjx0nKMVwELcarKjCx
         Z+h4jllob/w3h57ruurfwTrt+Nfc8g/KNxDZuSJ6bFxhVE9X/m4HUNzWxyTfV+vJhoTm
         D+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivOKkRa7qoXlEHndiKqBlU8PgBKgYvM0wW8U6/YUkjE=;
        b=zgTfu+5u7gZHIwVgQZ8y5uiimk1A+TDK6TI5Uf1euWipNrj/bxcslUr+HUalZO5wsU
         d0JwiXOOJqCrQBXBlZLEISJCcKkHxtYomur3bP7geO1yrYKxrZoRbQlZFWKkXRSPGCVJ
         jx9lMKawDDPdy29H/0D42EM+E8lWWZtiLbcSnDZ3lY7Au/Orbjg/QOXYocg+7Hk0w1QR
         Tlxlk7zFXWrMsrNYBCN7yHcga3UuIkFaDoFCpt8UjzcNrd7pSPaqkX57XuoMIysW3JUC
         /Xoddf7agr+SMza+XJ683njOlTpYjomOOVTcwn84SOwAseMFbso9JfgSTTWX3XyxoVTj
         lsIg==
X-Gm-Message-State: ACrzQf3FpG7XABYtHISN/e9l2cZjxHNx+BfcI+hWj3+ZZxx7gxsINklu
	F9mnjEtaPkpQxgxMiDdSJtEG7a7FX6x3LQ==
X-Google-Smtp-Source: AMsMyM4mEdfX1XqjhY2II8X2wOkJjLLVFln5d2DBxXChEjYdpfb3DNPOw7fzfvA+xofjHMplE9NKhA==
X-Received: by 2002:a17:903:32d0:b0:17f:9224:6e1f with SMTP id i16-20020a17090332d000b0017f92246e1fmr2885167plr.126.1665111312000;
        Thu, 06 Oct 2022 19:55:12 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id h12-20020a63574c000000b0041c0c9c0072sm476944pgm.64.2022.10.06.19.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:55:11 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v1 2/5] dt-bindings: media: Add dt-bindings for NPCM Video Capture/Encode Engine
Date: Fri,  7 Oct 2022 10:54:10 +0800
Message-Id: <20221007025413.3549628-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007025413.3549628-1-milkfafa@gmail.com>
References: <20221007025413.3549628-1-milkfafa@gmail.com>
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
Cc: andrew@aj.id.au, kflin@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, joel@jms.id.au, tmaimon77@gmail.com
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
2.34.1

