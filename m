Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F8D52A220
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bgQ6GjPz3c7n
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:54:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pFloAIsa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pFloAIsa; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3N1dxzz3bqG
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:11:59 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id a11so16481524pff.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
 b=pFloAIsahv1LwGSPVFyN6dinFSmhbMza4Vj8W2MJNhWmxS2b9/L6hWtqpbRrWkaTVI
 /KJ7EX8tq2oiwEpZA1GT1FCRreo8J8rZ57OjbOk+r2oIV0tJozfD2UGqQ9MVFBbxMv4u
 pat9rZAwUgwEnR3M7OIzK2z1LI3trsh6u5wHkGtla9OnrTpzuHkAPQS/2ilDPm2+vcnt
 pkx+fL20/OuALewWgpgaB00fxyLRIWvAwtLpkMDMC3sE3OehpYT3IgTiS/GchsV0rg5S
 QsniY+nwgp56xJGCMdHNzAZiF/rlqsYysxJAt2D3FP98kCwzem8qI8XzLIk2+vDmcZPl
 B6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
 b=09pZr0NwdEsY357bMT0Egs2P0P4aOFEyZSff9F0sPWbUZIpHtrukQvRfM8fgu7YncN
 7PB46K81xHveL7NoorrAWxTeBewv2av7dW5qwNnQjjltcKQngDh3M5calFDgYS6juBX9
 CFQzXUpmqNcR1q4uRW1tLc7t0CtEiqweJM4ItR0WG1DnnK5Mg4VF4Ht+Uq+tUw6RU/rS
 ADAXHigI1A7CcNcZ8s+hM4kk8Q+MN2LZ6qyrfpdeLHE9hnHvyDXIQlkkctjRsgk1Gj2k
 nP0Kactpsg+FsbButtJj39Hx7y44rpbwClLftYr6yGEicZ0Py5oYydRZxpmandgRek//
 9z9A==
X-Gm-Message-State: AOAM53254fqW8u8zcx9GZgspoSPsLj/Sa9H+9Sknimr9bFkc4ZNTADrx
 pJk1XJnbtjV7QZdMPwW16w==
X-Google-Smtp-Source: ABdhPJzxvdrgUgkR++3q5wIQdY+NCisWO/v8qM2lIGnIGECEDfN/2e7awdGf+ibdbfFc5k3MyvQKrg==
X-Received: by 2002:a05:6a00:996:b0:505:b6d2:abc8 with SMTP id
 u22-20020a056a00099600b00505b6d2abc8mr21562749pfg.11.1652782317854; 
 Tue, 17 May 2022 03:11:57 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 br22-20020a17090b0f1600b001df82551cf2sm1225548pjb.44.2022.05.17.03.11.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:11:57 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v5 01/10] dt-bindings: i2c: npcm: support NPCM845
Date: Tue, 17 May 2022 18:11:33 +0800
Message-Id: <20220517101142.28421-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 25 +++++++++++++++----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..09d2591e1fa3 100644
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
+    $ref: /schemas/types.yaml#/definitions/phandle
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

