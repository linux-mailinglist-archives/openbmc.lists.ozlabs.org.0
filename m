Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82C84AB540
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 07:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JscMt2KdNz30RD
	for <lists+openbmc@lfdr.de>; Mon,  7 Feb 2022 17:55:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LBn9w0cS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LBn9w0cS; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsbvM703sz30MQ
 for <openbmc@lists.ozlabs.org>; Mon,  7 Feb 2022 17:33:51 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso4545191pjg.0
 for <openbmc@lists.ozlabs.org>; Sun, 06 Feb 2022 22:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QBjevVYgAFUaqu2ou5cnYl7E+U1e8F1wDuqgm7AMw48=;
 b=LBn9w0cSUzERiY6ujaumE79mxBrkeyAje0CePw/59SYwNqP8/Vzp4jaG1rQQcB1lSO
 b7e2Q2tysdOwBH3ZrXcnYHcpmKVORWxuFw/UQx6zUesXziUED8UOeKgAIcuk5UEW6xE0
 L5EO/CU6H2aIvqh53wVzDen6K5qrcK33Hs5BB7wCqT0vSbWYIlTl2gtOPC2YFZtY8Mec
 mSFErbcz+h2sIwLr50YE2rMZJ9SefQvEsCK03T42+m5xbnfJ1gOIGQU/q4E3+cuovEP3
 RCvquvxvLIgLFqeWZImqOQ6qXCETok7U9akCecv0i1cQUjuM7p7oyCcJDHyMlmS2o1hy
 qgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QBjevVYgAFUaqu2ou5cnYl7E+U1e8F1wDuqgm7AMw48=;
 b=K6NmxGrqBiY2FnqwCEIzR3mQ7zgTMZrIhnrVFLvVw7bEBp9zn7raJIqB89WsrtJApg
 f1VZBDf9S7SbaWkp3g0bkoiyGfJJ4ys8yFTzbIhq4DIjmWCnZM3bD25H9HY+q+kI07bp
 2OEbsDtnDXlZsekB6wfTwFxg1Lru+TusIaTPKLPDe4JDBPU8+BJR8vRpEYhMrBOnGDhx
 jHGH1X/90IaE0mWUWH/qz0KJVFn/G6RPqzf7ZjK8u0KEIM74HaAtmftn0VgCCc1GQt60
 J+BZthVJA1xIUXY2us+vAZJPKGaoU5e+ZrWYLk0AgWBMm3UfUWneU4ZdEe2rjmVsZQVn
 4QXw==
X-Gm-Message-State: AOAM533JA65cBfYmQf7ubomiltIn3yGw5MxHb4/TUO20yVC39z7Nt/Y3
 ntSyDjPwc2OCVgs0KRDCEg==
X-Google-Smtp-Source: ABdhPJwHh6DxuukPHPzXF5UTpQFRyEmYEcTqkhT3otIl+T/man141s1iK/4Ndqw6yd0EMoacpqdoVg==
X-Received: by 2002:a17:902:e54c:: with SMTP id n12mr14424plf.60.1644215629404; 
 Sun, 06 Feb 2022 22:33:49 -0800 (PST)
Received: from localhost ([2401:e180:8894:9737:7848:1ec7:b697:7d50])
 by smtp.gmail.com with ESMTPSA id g8sm10666389pfc.193.2022.02.06.22.33.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 06 Feb 2022 22:33:49 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Date: Mon,  7 Feb 2022 14:33:33 +0800
Message-Id: <20220207063338.6570-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220207063338.6570-1-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 07 Feb 2022 17:54:48 +1100
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

This commit adds compatible and syscon description for NPCM845 i2c module.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..05e58f44b03a 100644
--- a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -7,17 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
 
 description: |
-  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
-  both master and slave mode. Each controller can switch between master and slave
-  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
-  RX.
+  The NPCM7XX includes sixteen I2C bus controllers and the NPCM8XX includes
+  twenty-seven I2C bus controllers. NPCM8XX controllers 24-26 are connected on I2C
+  pins in parallel to controllers 8-10.
+  All controllers support both master and slave mode.
+  Each controller can switch between master and slave at run time (i.e. IPMB mode).
+  NPCM7XX I2C controller has two 16 byte HW FIFO for TX and RX and NPCM8XX I2C
+  controller has two 32 byte HW FIFO for TX and RX.
 
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
@@ -36,11 +41,16 @@ properties:
     default: 100000
     enum: [100000, 400000, 1000000]
 
+  syscon:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of system manager register node.
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
+  - syscon
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
@@ -57,6 +67,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        syscon = <&gcr>;
     };
 
 ...
-- 
2.17.1

