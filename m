Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C05A5960
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 04:24:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGrjY1nNZz3brF
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 12:24:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mz5dVPkG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mz5dVPkG;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGrgr5LTHz2xs1
	for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2022 12:23:04 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id s206so9395677pgs.3
        for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2022 19:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=XHgIC24nGh94CW9lLVRVV+s+suVxXv3u7A1PnS3bpdU=;
        b=mz5dVPkGXspdc01ahJi3pe4nwSdGdmCCAiV5zdZ/c24L3yUynKA+3QSL0YJZsOxQA6
         vIt4/9AylC8jqmZj8UCSirF2FoBdhZCs/1HdfP69Aocd87rRzn4Jhr8dltOOyLBR1wZN
         XrEFw2wzBCT64+PEUMjJM8ZWW86QQ254ieDe3MoSZrRcQJzUa4IASYGnnUJFjSS/a0Ax
         KEHmh01UDFwoL3LQJjOezKucQ6tyTnTzi0YiT2gG6pm+lPTQIAf1kc2NW6rJXVuBP6vO
         yLZ1KmunyqZS5G5ubbA+Qga1slWEDlNtcskIEjLtfbGHMv9bJ5GqwDXJ0oF2ifjhgMw3
         nPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=XHgIC24nGh94CW9lLVRVV+s+suVxXv3u7A1PnS3bpdU=;
        b=sWqIp2nsVwcJq4Twt/LAeXvar5HjXelWjyGBQBK3pGN9zC9Wmo/eEa34oc/BXdwzAs
         Y/iqb7R4+oKudGTkgEzhpC5zUvR/Q84b3nPOVZKM2nQnyFHj2B+dfHmTVzpDW4+oME3F
         R4DP3/IIR/75GPLVhKvZe28IzO3XOB1uwQiMM/4stBpd59FegZ8m4kfB9T82Aoh+UH1e
         uQy1mITTiv+AXIX3GFQlIzl7vJ2/cCBhL/UyH6PEO4L/bzI2/owux0Z8dpY/ISuX89rE
         uelW8asd5+X5Hab2DJ6NntW4ZTnopUzHS8W08NYKBJRi/WV8u9pd+WP8smRu8IgxeCsT
         hW1Q==
X-Gm-Message-State: ACgBeo1e8wnxLCyJgYFSDjIV4nDypO+WTBWkGRkaaC85pluEYHp3cpkL
	ttbN09xUOmEdgV3vjVbXAGc=
X-Google-Smtp-Source: AA6agR4VbUFdVtaOW9jiMcmOPGsiZnPyrTwA6EPvk5CCZ9amrx84GTi35pVPOFgr2cg9l4YEowwOCw==
X-Received: by 2002:a05:6a00:1356:b0:538:1bf1:7cd with SMTP id k22-20020a056a00135600b005381bf107cdmr9830253pfu.32.1661826182086;
        Mon, 29 Aug 2022 19:23:02 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c78-20020a621c51000000b00536531536adsm7916841pfc.47.2022.08.29.19.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 19:23:01 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 2/3] dt-bindings: edac: nuvoton: Add document for NPCM memory controller
Date: Tue, 30 Aug 2022 10:22:37 +0800
Message-Id: <20220830022238.28379-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220830022238.28379-1-milkfafa@gmail.com>
References: <20220830022238.28379-1-milkfafa@gmail.com>
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, benjaminfair@google.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, KFTING@nuvoton.com, JJLIU0@nuvoton.com, tali.perry1@gmail.com, ctcchien@nuvoton.com, kflin@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for Nuvoton NPCM memory controller.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..d5ef7e7a65f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM Memory Controller Device Tree Bindings
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
2.17.1

