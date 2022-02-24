Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E14004C39CB
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 00:42:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Tvx1mjpz30QR
	for <lists+openbmc@lfdr.de>; Fri, 25 Feb 2022 10:42:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dm0ptBvz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Dm0ptBvz; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45vs1gw7z2x9b
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 19:40:39 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id x193so1796511oix.0
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 00:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pvhTNW6ZF5aiQvYvNOuVOU64LQHqiZfNbJXRvi8CCvs=;
 b=Dm0ptBvzy6N62bQkkICsiqIgImQSUtHYIyzM5AuBjZ3soDdcXQ3dS9h23M7FZ1FUUp
 tvjqc/7+rwZExI0ExomBpbogCKxUYDsoQyXxPvnVqQ0/NCz5l2B4iQugUSMu8vEg7rXq
 G7pbhuPI2k/gGCYz14DOl+XeUUx9p+8PIwiRXJyK1YeBcsB2Xe8+wK8S3gZTXFVkOC2U
 PdTPi/us1NaeG/p2zww+qz3DGzXX551uMhkaUgbGROOngwA2ZdMADtvRoPFQQwlJyrb9
 LA8SKCi6TZiLmVhTOxA9mscr9ycETwlE+6n7lYgGBaCOI5qQxLfqzByXVs3fFE1r3OKR
 QErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pvhTNW6ZF5aiQvYvNOuVOU64LQHqiZfNbJXRvi8CCvs=;
 b=celCYSbopLmCB7GWDe4LwjsAxuAuDLz0Q+ByX5mHJl/c+F6t/WQACwXggLax5SWXbd
 4t6i/rM+sWW/62sIQw00yV4AaTPfwBQjIk/2yLna0aIUg4g+YHrqQ86Na7l9RlMvrleO
 y8w3aFhTIniMszEzxkcXnX0UbGXsygI0YuAlSaKF+yhf7xxFr9Y8YDIXPthlLUhJayS9
 mycaf2GhuOXTZI65bYTH6WYFfI5qVI4FJyrFQdmG3mAlkln+F/VC/TqJBJo1AT/0t4Fx
 e6iy2HRUDyBGIiNAc0XjzXBGXOg2zbMamfybV5mPhXnHOlffASYHP1p+wnNPMuMYyJmR
 56Cw==
X-Gm-Message-State: AOAM530T21SpqbF84r+79LQeC1AVZNSJoIcapfn7dhGjL7YwHRuHry/J
 pYkCxPss81vxsdvoozr9H6WYDLgAhPeh4A==
X-Google-Smtp-Source: ABdhPJyPSahfoResPHUOIHrZRCs5akM2EEtv4OFSYv6SOi5I05lLOhiVd92EsKsdu1xgBDOLlEhk/Q==
X-Received: by 2002:a17:90a:d494:b0:1bc:54d7:9e80 with SMTP id
 s20-20020a17090ad49400b001bc54d79e80mr13180169pju.4.1645688880885; 
 Wed, 23 Feb 2022 23:48:00 -0800 (PST)
Received: from localhost.localdomain ([112.78.94.140])
 by smtp.gmail.com with ESMTPSA id z21sm1616839pgv.21.2022.02.23.23.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 23:48:00 -0800 (PST)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com
Subject: [PATCH v1 2/3] dt-bindings: edac: npcm-edac.yaml
Date: Thu, 24 Feb 2022 15:47:28 +0800
Message-Id: <20220224074729.5206-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224074729.5206-1-ctcchien@nuvoton.com>
References: <20220224074729.5206-1-ctcchien@nuvoton.com>
X-Mailman-Approved-At: Fri, 25 Feb 2022 10:40:00 +1100
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
 Medad CChien <ctcchien@nuvoton.com>, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the device tree bindings for the EDAC driver npcm-edac.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 .../devicetree/bindings/edac/npcm-edac.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/npcm-edac.yaml

diff --git a/Documentation/devicetree/bindings/edac/npcm-edac.yaml b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
new file mode 100644
index 000000000000..228ace1025dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/npcm-edac.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/npcm-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller EDAC
+
+maintainers:
+  - Medad CChien <ctcchien@nuvoton.com>
+
+description: |
+  EDAC node is defined to describe on-chip error detection and correction for
+  Nuvoton NPCM Memory Controller.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm8xx-edac
+      - nuvoton,npcm7xx-edac
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
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
+            #address-cells = <2>;
+            #size-cells = <2>;
+            reg = <0x0 0xf0824000 0x0 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+            compatible = "nuvoton,npcm7xx-edac";
+        };
+    };
+
-- 
2.17.1

