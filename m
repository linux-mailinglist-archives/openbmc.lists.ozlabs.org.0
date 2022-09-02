Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C625AAB67
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 11:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJt135fhnz30Hm
	for <lists+openbmc@lfdr.de>; Fri,  2 Sep 2022 19:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JPPVPAy9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JPPVPAy9;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsyR0HZRz3010
	for <openbmc@lists.ozlabs.org>; Fri,  2 Sep 2022 19:27:42 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id jm11so1255737plb.13
        for <openbmc@lists.ozlabs.org>; Fri, 02 Sep 2022 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SmFkFrSKnE5UGV/FeBagKO6cow8ZrY/ENIxZIsA8ZEo=;
        b=JPPVPAy9UNFiVUlP+UFd+zM78yy8UFlS3Qx8bY4NlbVZanWPDp72C1jlWmv8OBJ44S
         gk6w2Ltg4sbMzCqMuvGFAkGX+vOAQ9rFj9VThzsYlyqSwYtEuvCmszflX94bFbrqjbDH
         eBSLSeE7hmkNY5NHyC1JRm0x5VdAzKSIlh1NwS4eX5NCl2XuAHYOU+mwAbOno7S9h4D6
         BZFlngScsyxnovNyUUBvv8oyaenZgtI4oq0/fR3RDpmPwmnbsVQQdtpEF4QzSmUfMmCY
         umjsC9C8cVQLyw9R6b10JKu+KCu3asO3i309yi8kLMyBMznjVs6acbvj/w2DFK0RAeml
         KbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SmFkFrSKnE5UGV/FeBagKO6cow8ZrY/ENIxZIsA8ZEo=;
        b=uLf4pK+osanwcwg4tquERSxjBqJPMXce6wGp9yzzx9NiqMcqZ/oRwzRsgmtwF06LqH
         qUAk1NgqWlb3GlcUxxKDiFxGQRcskUxn0R3ymCxkP/WlCfdTajbWe/wVc5k5noCVH4AF
         2H1J7ZE4A2W7AxQfTmz1wbU2N7VeZ0URWc79mZv1/KAjTtDbQ11puVkxTnCJV86nynY1
         BFfxjq56YEPe8qIFK2NO7A85JFjNsq2DjqsTW+8RYFfvjqcIlVtI+e57RmRh6IUjPigB
         cn4Pkmsjv89lX8JbecAGDRZ53ABAiwhdLXoYcCYvtLN5YMKjXbgQW1ZTmZfmg0G4mNbM
         nKYQ==
X-Gm-Message-State: ACgBeo0vlzr3BDOvvqOvvTNJ+69RZdS1u/xUJPNZS3auyWTsmTLoD2AJ
	m8nWQLAbpGHO/yI35IdNEv8=
X-Google-Smtp-Source: AA6agR4eh9GVTn9g/d67M2zV2BYl8ri3bbUUBrZDx3R8mcVlM8dYa2tgAhYGJ9LwzpGLIUsFNfqlKQ==
X-Received: by 2002:a17:903:2102:b0:174:4d5f:8abf with SMTP id o2-20020a170903210200b001744d5f8abfmr32079734ple.11.1662110860684;
        Fri, 02 Sep 2022 02:27:40 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s62-20020a625e41000000b005350ea966c7sm1169315pfb.154.2022.09.02.02.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:27:39 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v15 2/3] dt-bindings: edac: nuvoton: Add document for NPCM memory controller
Date: Fri,  2 Sep 2022 17:27:13 +0800
Message-Id: <20220902092714.3683980-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902092714.3683980-1-milkfafa@gmail.com>
References: <20220902092714.3683980-1-milkfafa@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Nuvoton NPCM memory controller.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../memory-controllers/nuvoton,npcm-mc.yaml   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
new file mode 100644
index 000000000000..0e752a673453
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/nuvoton,npcm-mc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/nuvoton,npcm-mc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller
+
+maintainers:
+  - Marvin Lin <kflin@nuvoton.com>
+  - Stanley Chu <yschu@nuvoton.com>
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
+    maxItems: 1
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
+        #address-cells = <1>;
+        #size-cells = <1>;
+        mc: memory-controller@f0824000 {
+            compatible = "nuvoton,npcm750-memory-controller";
+            reg = <0xf0824000 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.34.1

