Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19023521098
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCBp6kxvz2xgJ
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:18:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WK+1dCxQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WK+1dCxQ; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyC9y6B38z3c7f
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:17:42 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so1626931pji.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=shmi7ND9fR66WvWBxG9J4t0FsEK855sUikZM1vvu/TI=;
 b=WK+1dCxQ6uDMCB8QzgTr4qQijeHD39WkX9/fvL6LzB2jp3LG4rH6ynCbYQ2j7yfTb+
 Q9eL9FP2/bPEB6Pzq/QTEzzeIMJ69xpg/n4v4DWI2cQQxjFldH6Zb6hTueRKd2WDP5i4
 wGKPklCrwXo67U8JdFbSceIPLVCltP/lEPBzLuyax6Yvwih40fqUR6KYf6WaDZB6r/4q
 YjCyhGXBaYOWo6tNTdxD4xLrsJnLMWdruxct+9vspN5fl8+SNFUWjuE889IpmT5LwdxV
 MmG5boc9Am/GdfyU8AriItMOpAhqvvpPjgWWhkpqOHPi4KXoue+MOZ6LyoWyHm5ZK63A
 9eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=shmi7ND9fR66WvWBxG9J4t0FsEK855sUikZM1vvu/TI=;
 b=4tIuq/od8gRYnEceHymep8xBjRN+6EJdMrwZ+dcQ/u+eOle8gw+Q/v6kX7SeSfsww5
 cp7pPGWiC7orJAWH75kNNnjKQb1KwxordAXzuFGJMjg1afrNP7g9YqFoqlyrvcYBQeHS
 QnGX/17t6m1RkcoDu2INfHn9G0K+lbs9EtkgEyXv+G1NM/OLZaVJApI5fvr+iV0bp5J8
 gyBm0ClRgDDqUKAl0QUsz7l0VKncLWzwESwB+GjJ3CnUqLwzuCcyzP0b4LOh4oYwwI6I
 r3VJLhwtC2YJoUTZYcMZFjVOnL14Ser7cKK411uup+/kNCjv4ifvTr2pvH7JzDAChcdF
 7uxw==
X-Gm-Message-State: AOAM5302EWYalgaG3uHWnn/JANc4xndR3GATBYYlMKNIsuvQNzSwyR2L
 gLsk0GELQBaI+j4du9LiDA==
X-Google-Smtp-Source: ABdhPJzr0tXNMS0wKDerD01zsfSs4v7SZyhKYvmEIBtwzDgIEcsrGnZUYSdfPsgWx9hD1aeHlTF4bA==
X-Received: by 2002:a17:902:ce8d:b0:15e:a95d:b4b0 with SMTP id
 f13-20020a170902ce8d00b0015ea95db4b0mr20350284plg.153.1652174260237; 
 Tue, 10 May 2022 02:17:40 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a170902d2cf00b0015ee60ef65bsm1474149plc.260.2022.05.10.02.17.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:17:39 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
Date: Tue, 10 May 2022 17:16:46 +0800
Message-Id: <20220510091654.8498-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tyrone Ting <kfting@nuvoton.com>

Add compatible and nuvoton,sys-mgr description for NPCM i2c module.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..99fae8489771 100644
--- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -7,17 +7,18 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
 
 description: |
-  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
-  both master and slave mode. Each controller can switch between master and slave
-  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
-  RX.
+  I2C bus controllers of the NPCM series support both master and
+  slave mode. Each controller can switch between master and slave at run time
+  (i.e. IPMB mode). HW FIFO for TX and RX are supported.
 
 maintainers:
   - Tali Perry <tali.perry1@gmail.com>
 
 properties:
   compatible:
-    const: nuvoton,npcm750-i2c
+    enum:
+      - nuvoton,npcm750-i2c
+      - nuvoton,npcm845-i2c
 
   reg:
     maxItems: 1
@@ -36,6 +37,10 @@ properties:
     default: 100000
     enum: [100000, 400000, 1000000]
 
+  nuvoton,sys-mgr:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of system manager register node.
+
 required:
   - compatible
   - reg
@@ -44,6 +49,15 @@ required:
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,npcm845-i2c
+
+    then:
+      required:
+        - nuvoton,sys-mgr
 
 unevaluatedProperties: false
 
@@ -57,6 +71,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        nuvoton,sys-mgr = <&gcr>;
     };
 
 ...
-- 
2.17.1

