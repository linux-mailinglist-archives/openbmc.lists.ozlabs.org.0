Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BB8545F8C
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKDzm0xWhz3bln
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c/XhrBKh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=medadyoung@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c/XhrBKh;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKDyh0DXYz2yxj
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:43:55 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id w21so23335696pfc.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8BinpoYpAj5+YbnUMIdRgheWrCsfK9f4139iiy8RFN8=;
        b=c/XhrBKhkMfgbYzQNN1cSM+1mGAXc418ORaVkct/ctrTy9VIuIp7Y9VDoZlPJ4BIe7
         SQi559COCxa/drLRpqeKa95TZY4rxltATjk0+E5QgtLanoowsHHu1biG3uGXZ6cVtoWQ
         NKMfmQ78Wr64gcJSS5uiFJuy3GjD6N2PKwhqEk9hyUW/qiXwftc1L6NqwiDP6Bp28Mr1
         MzbQNmAR6STG/yAuRWIO0qx3VdmhMD7HNvEfkDGfyygxOK1CNhjrZ9YlOn7T4lbEFqHT
         +yuVnfkO/NoD5xSoJSN8aHlntBkHOSt5SNb9xWgpo7qf7BQCPXpcuKHG1ZZK7Vf+ek3+
         TYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8BinpoYpAj5+YbnUMIdRgheWrCsfK9f4139iiy8RFN8=;
        b=1nlKTuC/WiC8JLfdVPx0+7vJkfAII57aJXVGVz5FPGcWuuGtNgDH9HnyeFCShqWBeQ
         hpr5M6ntHCO+QW8f+OyAJr7Lws15GnR8sDHSWlpI4bBqhupGJchAS0tTzTHWgQ+ezOdC
         EoDNCwiooWpVN32pPgsE1BpAp8VZjZpqDXWH2cJ724Dp0UBSVAtV1B+wrkix5JfnD3id
         FEsl1esEp7OUwBK7L674EFhIEGEiCpGoPrxyMNrcZ1++RYHX8D/9uX9tpaBzvDCkxFpA
         cMv4tQXOvr6ZASYLdcQ5v+yMkqeZnqofzIIjChHyyThuXdViWJkwSOFZOcafaM4aZtn7
         weqA==
X-Gm-Message-State: AOAM533964nIg5ZpurNhYpe5++yl7y4syOnRJWTNC8QJaajREmXHcMDW
	ZFeyQu8+eAhPSv54MjcqyLA=
X-Google-Smtp-Source: ABdhPJzdB4xwMzmg+uDv9DIOKt/Wd6Iu7dWq2cb34QW9s0pyIuAflbJsyYnSPJZG1WMApQRvAzwDJA==
X-Received: by 2002:a63:ec14:0:b0:401:9e3e:7d23 with SMTP id j20-20020a63ec14000000b004019e3e7d23mr5871023pgh.235.1654850633659;
        Fri, 10 Jun 2022 01:43:53 -0700 (PDT)
Received: from localhost.localdomain ([1.200.147.12])
        by smtp.gmail.com with ESMTPSA id c28-20020aa7953c000000b0051c01aa7d31sm11703568pfp.46.2022.06.10.01.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:43:53 -0700 (PDT)
From: medadyoung@gmail.com
X-Google-Original-From: ctcchien@nuvoton.com
To: rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	benjaminfair@google.com,
	yuenn@google.com,
	venture@google.com,
	KWLIU@nuvoton.com,
	YSCHU@nuvoton.com,
	JJLIU0@nuvoton.com,
	KFTING@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	ctcchien@nuvoton.com
Subject: [PATCH v12 1/3] dt-bindings: edac: nuvoton: add NPCM memory controller
Date: Fri, 10 Jun 2022 16:43:38 +0800
Message-Id: <20220610084340.2268-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220610084340.2268-1-ctcchien@nuvoton.com>
References: <20220610084340.2268-1-ctcchien@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Medad CChien <ctcchien@nuvoton.com>

Document devicetree bindings for the Nuvoton BMC NPCM memory controller.

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 62 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..a5c8d332d1c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
@@ -0,0 +1,62 @@
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 4383949ff654..7f832e6ed4e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2367,12 +2367,14 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/*/*/*npcm*
 F:	Documentation/devicetree/bindings/*/*npcm*
+F:	Documentation/devicetree/bindings/*/npcm-memory-controller.yaml
 F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
 F:	drivers/*/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 
+
 ARM/NUVOTON WPCM450 ARCHITECTURE
 M:	Jonathan Neuschäfer <j.neuschaefer@gmx.net>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
-- 
2.17.1

