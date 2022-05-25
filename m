Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2B5335C2
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 05:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7GfJ06Wgz303k
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 13:25:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hm5LlEOq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Hm5LlEOq; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7GdJ5bq9z2xKh
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 13:24:20 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so3871130pjf.5
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 20:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
 b=Hm5LlEOqZKRdMEJ7rR3UUsd0kmUPrw/9YZ1mxm2xfajaeZt9jGE8zamIJlJdCAPkt3
 VfMesPwd2acs2hYX1HTcVCeOD9Dii0Krkg+zZ44JxkTanTuzVi6In3rKxfqlDcsp+Z/2
 c5huv57tYpvfCtJandPFSMQg4bxP+WVoh+T4sa8T4zz+TXsLqPMCBFbmgV8KFSfebYDv
 7Lf8Y9x41x/0e5pIe+YaBr2PZCs+3A0rFVwPrztTRdjUaBErkl6xbzbjE2Vvgg7wQUeZ
 q1FgA+B0TTjlp7N/DiB1ojDVJ7J5gC4/P5vQenBgbTn+SiTEgJvOPFnZGqtRN9elaq+6
 nDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MM5thYIrVi5i+cbkS2jxRX5IeuN8MkqxSCa5bh/mFUY=;
 b=mt1bj+Zbh8wv8NtLfeHHczsqUKesaRoiG8sAIj+fqfD8PIFDmMCk69oxn6dFdpfw6B
 uylXVv0l2K4JiBL9mGA/oHiejfPZyPg1p2Pxh4YummEEF2QF64F6GbxPYymMiBkOg4/K
 lATmHkOL7KtJMik6GKZ1A4AqynnpjI93NrHlznkKlT2KOrE5996paW6Pz/wAbt5qzpST
 Ie/5qS0LMGM8+JsK514CJ+BqxpLpu7EmwQlBkpAO8OkPawJiruy3OXx72c8V79Hjvg/4
 l7b6LIGkEVXuJDKd5KWgP8R30cyMLMGPdbtkULPRO3UtqHtbfmBpXaNQjuJ5UTdfIHEP
 8gJg==
X-Gm-Message-State: AOAM5337BT2k2EQGywM/RGf6StLCUi65rjpGgnaV82YBxQ4mE8QVpd+G
 zMBE5augmVSIOsBnNd0Cww==
X-Google-Smtp-Source: ABdhPJzJfJSQYDPh4Yk/ZMRkRZvA2bfaM9uQZ22E296JR5L5v5r+FkeTB87jGcpTcqLEzIUMainZ/A==
X-Received: by 2002:a17:90a:4803:b0:1dc:b4c9:1958 with SMTP id
 a3-20020a17090a480300b001dcb4c91958mr7872647pjh.61.1653449058229; 
 Tue, 24 May 2022 20:24:18 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 q14-20020a17090a178e00b001df3a251cc2sm322188pja.4.2022.05.24.20.24.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 May 2022 20:24:17 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
 sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v6 1/5] dt-bindings: i2c: npcm: support NPCM845
Date: Wed, 25 May 2022 11:23:37 +0800
Message-Id: <20220525032341.3182-2-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220525032341.3182-1-warp5tw@gmail.com>
References: <20220525032341.3182-1-warp5tw@gmail.com>
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

