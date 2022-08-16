Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3D5956FB
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 11:48:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6RDQ04ltz3bhK
	for <lists+openbmc@lfdr.de>; Tue, 16 Aug 2022 19:48:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VUj/qPg9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VUj/qPg9;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6RBh3VqKz30LS
	for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 19:47:08 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id r14-20020a17090a4dce00b001faa76931beso216261pjl.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2022 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=EV5sK3QQtGgn7So87fXJ03JNW1+XthKqQRby1y0/cak=;
        b=VUj/qPg97/Aym7V7pQMhB1tQQp0Q1hE9MgTiSxCePvmuvEzFzM18gqPRk0JBuRKTi1
         eDP0UvlsiqOK6XlXgzMErEy/SieDfOE+sz0DhjETl/6IAloIQcVC2T4Zk8020C5WbZan
         rovVumk0nMBnhUfZtNnnkBCf4LywMKnedsU+IhzuFjnEQ1HsscVqfkuG8aKP7gbSNWTD
         xiYRc39HMHXMHB5nbvJqd0JM2t2+j7iajceVM/R43Dj0KJI6TnzCj1gx61YJL312GUCa
         oCvHZJFuKSr7MLZ3AUDA4d5yzvlx4miOnkdRrDSnssrBf5OAitRu/9nE77GMlCppWgfx
         v4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=EV5sK3QQtGgn7So87fXJ03JNW1+XthKqQRby1y0/cak=;
        b=vBX8vdR+i/U+psATLmap2txW8nDlW5rq9RvjGqB1lHm86ZM0zUnUpX1HyFXqMwsN6w
         uJh7sUegKMqlq8viN1C8wj1vPnhIyjJ6fj24LgrocGJGhpaGL12OEOV1hQ5beu9g/9Yb
         3cmjbCjdqgiS2ifXsxOk9qXbSce64WCFuT2SMWV5YLR0DtqNImoUEM1QNBVxyi+Bgqq5
         vtEKnb9v9EmyJNFC0jD9e1Iqi3UlmGMWo5X+GZuiC2476LD9K9MMrLq7rlaUmemDHZrV
         sT/x74odS4OV54sBkTUi+NUNI9W7kkFmzJvbDt4d3taStz68uPZzMfnQQMZqQFKp3lDC
         /X1g==
X-Gm-Message-State: ACgBeo0oa9VKh5c7fvnvwVZ5+Rdrd/7xyKuWFrQqaftWDnofx+SFeHF/
	qjkutCZ8rNmVtvC5st7W5Gc=
X-Google-Smtp-Source: AA6agR6CBTT93XajfwIxe6VR4/Aw1ACc0P0Iib3jKiNRtPezhumdNiwtMYXSWsl4CDUBFe7q3AlmFg==
X-Received: by 2002:a17:90b:3ec1:b0:1f5:15a6:aaf5 with SMTP id rm1-20020a17090b3ec100b001f515a6aaf5mr22866488pjb.123.1660643226167;
        Tue, 16 Aug 2022 02:47:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902e98c00b0016bee668a5asm8578767plb.161.2022.08.16.02.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:47:05 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: linux-edac@vger.kernel.org,
	rric@kernel.org,
	james.morse@arm.com,
	tony.luck@intel.com,
	mchehab@kernel.org,
	bp@alien8.de,
	robh+dt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 2/3] dt-bindings: edac: nuvoton: Add document for NPCM memory controller
Date: Tue, 16 Aug 2022 17:46:40 +0800
Message-Id: <20220816094641.8484-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220816094641.8484-1-milkfafa@gmail.com>
References: <20220816094641.8484-1-milkfafa@gmail.com>
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

