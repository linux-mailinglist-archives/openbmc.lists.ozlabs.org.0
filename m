Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B116859804C
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 10:46:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7dlV3dkzz3c2M
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 18:46:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oUhIciU8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oUhIciU8;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7djP6gBxz3cBL
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 18:44:25 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id a8so1035225pjg.5
        for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=v6u6ZCAUBeiU9zOMNHx6Ko5vfr7de6LNNbJuCSeTs2o=;
        b=oUhIciU8kuBzu3qFrVFaGIn2KJRrjpjNH+i4Idc2xocfvXrGTJ7iFfpxxXlSPS3Fpm
         +JZl4h9t1dA0aN+hF3ZvztzAQRf5Jrg5nC7F8fI6x7Tnd30SBMOliIV7sulTUYqNSou4
         mo7+IKvF+xY0KQta+rpPye1IGOp0ctR1++QfQ71UB1q23XzeqxP+KJrqGR0AzZ+tv6/a
         zsvcXbHdQbUvQwG5+O8YWlQ3LbgqLTc/aSGx7wr9GZesttDZ4qISK3tCaOJjiZ/Jp/pP
         6YIqgRwDnGAe4VuiF6Ri1PN1QGuVLHx9MwcXzv0f9+/NDrI9vPKGzpc9tUNF2cybV5xC
         oF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=v6u6ZCAUBeiU9zOMNHx6Ko5vfr7de6LNNbJuCSeTs2o=;
        b=J+ijtr6qjLMNIDgfzOFX83i8KQ4UTYqsBD3yuTKxasR1Rr86jDdFtJrcMsnZPk8Qlu
         Kj4YAovwGaPviJkEelw8AgX/wtz4WnnnabDm/obPS8thvkte7IcXZS1sSuqhVA1awdVW
         Ywhj6d6jbcYAUszrAWa2sI+cCA2usiPjU4glXa3lces2vggYbUHFmk2G1pvKTh3nVasm
         XCtRYVJIOBBQndrcg+ZVgW3gQhQb3BG5hWOKs5Vc0RXcg5OTn9eR/+uhHjSGepTuGoxH
         WLTE10KWGeuqrITVAgEkQ7MoXAuJVEEGltFHi+xNTD+Ek5TSrl+yHGFrMphmhTQ/Ct8L
         TAsg==
X-Gm-Message-State: ACgBeo2M6YEmV0K8GT6xsLAAq/YSWXM7wHtiBJo+ic14Wppdi1fwGSaU
	VZV0tA4sRvxMAB4RVuL728uim7pkltA=
X-Google-Smtp-Source: AA6agR7ElOOGhNflWYRxs51/T+xe9KtYX5wv/gvvXtmIrzJbW+qEHS/v45jWiSDg7C6L0LQSTZpV1Q==
X-Received: by 2002:a17:902:f54e:b0:170:9fdb:46ea with SMTP id h14-20020a170902f54e00b001709fdb46eamr1763407plf.153.1660812263395;
        Thu, 18 Aug 2022 01:44:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0016c09a0ef87sm833402plg.255.2022.08.18.01.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 01:44:22 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.15 v1 2/3] dt-bindings: edac: nuvoton: Add document for NPCM memory controller
Date: Thu, 18 Aug 2022 16:43:59 +0800
Message-Id: <20220818084400.19931-3-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818084400.19931-1-milkfafa@gmail.com>
References: <20220818084400.19931-1-milkfafa@gmail.com>
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

Add dt-bindings document for Nuvoton NPCM memory controller.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../edac/nuvoton,npcm-memory-controller.yaml  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml

diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
new file mode 100644
index 000000000000..eb525dd848b2
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
+        #address-cells = <2>;
+        #size-cells = <2>;
+        mc: memory-controller@f0824000 {
+            compatible = "nuvoton,npcm750-memory-controller";
+            reg = <0x0 0xf0824000 0x0 0x1000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
-- 
2.17.1

