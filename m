Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF8050979D
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 08:30:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KkSN53Xbqz2xtQ
	for <lists+openbmc@lfdr.de>; Thu, 21 Apr 2022 16:30:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BQIf9Pht;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BQIf9Pht; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkSL34Hfjz2ygB
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2022 16:28:59 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id x191so3834334pgd.4
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 23:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xp8JbitFpwmkimxt2q3dNIEPhYraj/7nc8LE+MNCmNk=;
 b=BQIf9PhtP9A9t8eaL04Ijm3/UDNTUix2u87de70fIvkTHHvr/U3KrkwxxLKx2sYYEi
 R0pkPpmxQp8xGNamgCDZS3+b+55Op47tLgNRgp8xmGCnL+98yLqJ22CvaJCvXs/DIspT
 IaAQnYdeckwxzBPwNrF8vZMlKzbBQ/0hM/6jGRKLyL9JSe5E4p9IY2W1h5FbP8i/sUbS
 HnUlkitnOahm/E7E9b4+ICQQhFxiKQQpnG5BzWND12sOYjKIx8CRPIsSZ4o/GKRHjBXE
 7usf2xozu4FE3eAGNbddouOGy0MbC14c7qSjhdH0vzWij8QmZTbj7cdGhOdLS27puKTA
 0atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xp8JbitFpwmkimxt2q3dNIEPhYraj/7nc8LE+MNCmNk=;
 b=LbxgnE2Dp3L6IUeWMq7eWZXQPX6Aa/6rdTPQd5cQdQNGhFohoeMlagelEOeto4RU8W
 RRrzRMyK2XR2BcFayMpdFxR4gfC3yTB9uNgDZaGPgdK/HIwzdJ2iHPTnv8hvY3nJbBf3
 avCrfP+4ZqFp/kFftC3QUy121JbJ4W9F5lqKO8cuho1piggGXBvlfo2J/xgk9fktgKJ7
 Tri+jcPUiov0hyky5M6tszKuwtqm6+Y6o5VYTVEwxK+ucLI8zh07NK3OTwRRMsLO9hV+
 qbfTmRu0VuXs4ucAic3QUhL8+4shaBd/yxGq3gamH5tk8Q1tAWiAEoLYBE/hHh3epPFd
 3cyQ==
X-Gm-Message-State: AOAM531HPg/ImupehRaZtgkvusnBL7u+667IO60utT/uffbHsbkkqaO5
 UeStoYmGRia8FMOJccCh9b8=
X-Google-Smtp-Source: ABdhPJz06+QbuMKznzphUqCaDVd9ogFZ4uAti5aoj2GfsRB7NdK2JdPRpJKFolhy8vxoz6mZBMGI5Q==
X-Received: by 2002:a63:e709:0:b0:3a9:f988:c595 with SMTP id
 b9-20020a63e709000000b003a9f988c595mr16643366pgi.435.1650522536952; 
 Wed, 20 Apr 2022 23:28:56 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.153.245])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a17090adf9700b001d6e0fe8d28sm273305pjv.22.2022.04.20.23.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:28:56 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: rric@kernel.org, james.morse@arm.com, tony.luck@intel.com,
 mchehab@kernel.org, bp@alien8.de, robh+dt@kernel.org,
 benjaminfair@google.com, yuenn@google.com, venture@google.com,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, ctcchien@nuvoton.com
Subject: [PATCH v7 2/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Thu, 21 Apr 2022 14:28:35 +0800
Message-Id: <20220421062836.16662-3-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421062836.16662-1-ctcchien@nuvoton.com>
References: <20220421062836.16662-1-ctcchien@nuvoton.com>
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
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..b6ba7778c1eb
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
\ No newline at end of file
-- 
2.17.1

