Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F924BD4FB
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:13:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29Rz2ZbPz3cCt
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:13:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eUWV62m2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eUWV62m2; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1WpV2lH8z30Dy
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:06 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id b8so11941322pjb.4
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EHVv67KSR6zDSWz8cwXw0lmEsHGkvf35iFMIN1Dv6lw=;
 b=eUWV62m2mWgNEygve3r4gAQGgbtJC8vfCn8Je+GAOVzGcyLmyzaKr/KtgkITk1/SgQ
 wz0ZBYFcfP8mPxXg1cUEI5eQbbqSYZxwOGYQTaw1agnvUU1e/3IrfGCdnkvfCRxzuVFp
 hX/6JGhzM9IQ3x/zvcwma7WNSs3S7z9wvj0X7MfvuwoGNlW/v1xgjlnWN0RNUFBdUyMN
 CVmX5D7OvoH4AWi1gIH2kawP3FTsroqNJpwmbUUVs8+yiZmjH8AR+CXcjO06FYJpwrmt
 bxfJeniM0d9Jxc0Ni+ut/UbhGE6wyysqJYp0P/00HKEMAPGMTNCBJshwTsn4Qpz+OO0j
 l8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EHVv67KSR6zDSWz8cwXw0lmEsHGkvf35iFMIN1Dv6lw=;
 b=W7Wu93ZWiNDuVuBrri7JY4fvYUMul8dYm39ZmWO+PzocgtEz0IqiYhGxAbP7SSdycQ
 Quna1p0jqnqT/dfXpVtxT2DO9teL3xGNYZ4KVnjUSF1f8/eCZaf+ojWdQb5Gfm5YTFlq
 qUO47Gtn4jX+dS4x6KyunP1EhXlXWhJtAzpBTfa8bWuiV1lg1GOaJBKNXQ8vKXi1i9td
 GTHug1iDXPUhX6T5W5qseiEj46QSNHIl6NHZQHUcWA7DhnUIyXegvIewF8n7Rp0SRlM/
 ReRXndfz4xcfHxHdmpLqZwmDk7kq3nsX5Aqw8/x/x2e5cFon1/34aZfL7N8NpsdfmIvc
 U/1w==
X-Gm-Message-State: AOAM533B31js59c605sYN/VyrWIL88r6m+EFPBEhpHjGDYppKR4jMt4Q
 NifLxfiKY7cD8FHBSMzJhw==
X-Google-Smtp-Source: ABdhPJz9OY16LTtX2vHBLEbctEpEm6VpfzTvfP02ftY0JmhIZEclV4d9bO7Bmto1PlmWqBBW9TkJlg==
X-Received: by 2002:a17:90b:4a85:b0:1b9:d80d:bff with SMTP id
 lp5-20020a17090b4a8500b001b9d80d0bffmr19706270pjb.67.1645329424649; 
 Sat, 19 Feb 2022 19:57:04 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id ck20sm3497136pjb.27.2022.02.19.19.57.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:04 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
Date: Sun, 20 Feb 2022 11:53:12 +0800
Message-Id: <20220220035321.3870-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..809c51ac32fe 100644
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
+     enum:
+      - nuvoton,npcm750-i2c
+      - nuvoton,npcm845-i2c
 
   reg:
     maxItems: 1
@@ -36,11 +37,16 @@ properties:
     default: 100000
     enum: [100000, 400000, 1000000]
 
+  nuvoton,sys-mgr:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of system manager register node.
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
+  - nuvoton,sys-mgr
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
@@ -57,6 +63,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        nuvoton,sys-mgr = <&gcr>;
     };
 
 ...
-- 
2.17.1

