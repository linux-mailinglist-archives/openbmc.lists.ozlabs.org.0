Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2D4CB90F
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PQ90QDWz3bpf
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:33:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PYzW0wLj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PYzW0wLj; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNT4BGhz3by6
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:31:53 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 132so3906540pga.5
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fQpyb1xRORaJV/DufaNl+38HQWPZYtiWclCn3fUkzf4=;
 b=PYzW0wLj9FixipL/QF2CIOANDUyFs1yK5UAbx00qEvtO2rBrWp1uzz3GssZ1ZW/KZ9
 slOoZQHUscZKFf+N1UPTrIcs2vSX5g6qyqADdu/OfTIuDDLFEpE+DQYsyC46goMGF1k9
 5hMdJdlHiTEdzTeaUJ9La9VOrSDATRSKhuJ6OD+vu/Y8jYpgytLosvEiYBhwIvNt7ZtZ
 aADob6EGXUPD3/txGdZX6LHssopScZvNtG1XZJW05eV1RL03wavRjRdzlCx8w5mckHi0
 WpGs3vtFMYQhqojtVsiidGgKCbBDHUW1+1AAZk75z/gV/NKk/lepLJ1h+RVfbmcgTRaY
 PqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fQpyb1xRORaJV/DufaNl+38HQWPZYtiWclCn3fUkzf4=;
 b=zN0Xfmt+TA7mVPzRJR4Y5KuDS7HuJTsQByPgtyqwGtUBojEevfmE5WYeEFzff8snHn
 BsCGM+eTKJWgZKGGanF6gPbORxqKDNimCm15DrWO8Tv4ZK50c+Y1TITwgetwhjwXpZD8
 rVcKy7jt9QIDWMq3iD0OeIu77dIiRSWxeN4YTR9P/Ev5TIffw0l90WDdes4ZfZ6CpVPO
 D+VZEXZDQ6DKIS7/m8WwuTdTgQUZ9KTO/Q2o0P10TZWC7IWBdxCSkH3a027btuI2Sx1a
 GTai6iKxm+RET4AIXHESDzp4yXrnB5bC+Z5ixS3HAMnVjNQPOoiaCqXgNE3t8uL5HrP8
 GX/A==
X-Gm-Message-State: AOAM533y3HeMz4lTCkaps2kiYrt/G3S4JlOLDhTIqQAnU9pjw0SSrAIQ
 ni/X7z6NTy5unXFngFrhYw==
X-Google-Smtp-Source: ABdhPJze89CGaMasQnOXZQIxTN/3aDGe/s8xXpxmQ391InTv4sf4WsJq91pwoniorPop+SUBVbaMaQ==
X-Received: by 2002:aa7:909a:0:b0:4e1:6d4:5905 with SMTP id
 i26-20020aa7909a000000b004e106d45905mr37141907pfa.34.1646296312106; 
 Thu, 03 Mar 2022 00:31:52 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a63ff07000000b00372dc67e854sm1392521pgi.14.2022.03.03.00.31.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:31:51 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 02/11] dt-bindings: i2c: npcm: support NPCM845
Date: Thu,  3 Mar 2022 16:31:32 +0800
Message-Id: <20220303083141.8742-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
index 128444942aec..37976ddcf406 100644
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
@@ -44,6 +49,16 @@ required:
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const:
+              - nuvoton,npcm845-i2c
+
+    then:
+      required:
+        - nuvoton,sys-mgr
 
 unevaluatedProperties: false
 
@@ -57,6 +72,7 @@ examples:
         clock-frequency = <100000>;
         interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
         compatible = "nuvoton,npcm750-i2c";
+        nuvoton,sys-mgr = <&gcr>;
     };
 
 ...
-- 
2.17.1

