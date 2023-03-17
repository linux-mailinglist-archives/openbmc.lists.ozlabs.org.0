Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C56BF683
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 00:37:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdgWv1MSrz3f68
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 10:36:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.181; helo=mail-il1-f181.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdgWY3S8Pz3cdj
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 10:36:41 +1100 (AEDT)
Received: by mail-il1-f181.google.com with SMTP id bp11so3566783ilb.3
        for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2023 16:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679096199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iGoAOKSmHCVth67NMGeLxQ5fWD4kKekoVqDyGCZvnM=;
        b=N7AkZb2vUbAMmRUH/pN+EI8mFBHkBkS4b6Dsvwek54ct+Dn9/QSEWKnSIvmnusMf4a
         mwqlqpc3kRDteoj9CdJqW+lEOl1sufmbYqDBRRZ+xvj/vM3vYOX0km9nwRcN4NIdElya
         V5FTaPM0VsXaxNFgwHEl43HvYB/3OcRX1xTTAzR6c6wVE2W2apmFaONnKET0n+HuIaOo
         U8jEocCeQMToZHKnzH8A33AOEVwoXDE1kpzlJzJPWCHwnYjfBIYRsJn/ZsgBwrtpTHxi
         VPhJVYVphEqR1chkPO1uAOBvTiPO9ePKf2NAX4b0b9PKMFwK/vLpoertBcx+kJCRpnMr
         Q4Sw==
X-Gm-Message-State: AO0yUKWn4ZjTsaqHJUpoVdq/vcqs2BlarkdUpvucZ3jU89rqJiBgrZQb
	lrdYvN3ooJ+LLLqpdgemdw==
X-Google-Smtp-Source: AK7set+JoUicm/oF7GJeMM55kcKyXre09MpcMZog4f8IHA1Wk0/B7NJvctRD3Mrq1AyTv2BcnI1yqg==
X-Received: by 2002:a92:c14b:0:b0:319:e144:80dd with SMTP id b11-20020a92c14b000000b00319e14480ddmr215094ilh.27.1679096198674;
        Fri, 17 Mar 2023 16:36:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id c11-20020a023f4b000000b003c449a192cdsm1070848jaf.73.2023.03.17.16.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 16:36:38 -0700 (PDT)
Received: (nullmailer pid 3968777 invoked by uid 1000);
	Fri, 17 Mar 2023 23:36:35 -0000
From: Rob Herring <robh@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH] dt-bindings: rtc: Drop unneeded quotes
Date: Fri, 17 Mar 2023 18:36:33 -0500
Message-Id: <20230317233634.3968656-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml      | 2 +-
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 2 +-
 .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 2 +-
 .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml        | 2 +-
 .../devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml       | 2 +-
 Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml   | 4 ++--
 .../devicetree/bindings/rtc/microcrystal,rv3032.yaml          | 2 +-
 Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml   | 2 +-
 Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml   | 2 +-
 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml        | 2 +-
 Documentation/devicetree/bindings/rtc/rtc-mxc.yaml            | 2 +-
 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml         | 2 +-
 Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml         | 4 ++--
 Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml       | 2 +-
 Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml          | 2 +-
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml        | 2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
index dede49431733..054e1e397fc8 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Allwinner A10 RTC
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 04947e166cef..4531eec568a6 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -61,7 +61,7 @@ properties:
         - the Internal Oscillator, at index 2.
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
index 0e5f0fcc26b0..4d2bef15fb7a 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Atmel AT91 RTC
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
index b5cd20e89daf..b80b85c394ac 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml
@@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Atmel AT91 RTT
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
diff --git a/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml b/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml
index c6c57636c729..c5e5c5aec74e 100644
--- a/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml
+++ b/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml
@@ -15,7 +15,7 @@ description:
   optionally generate RTC alarm interrupts.
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
index 056d42daae06..b1c1a0e21318 100644
--- a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
+++ b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
@@ -38,8 +38,8 @@ properties:
 
   clock-names:
     items:
-      - const: "PCLK"
-      - const: "EXTCLK"
+      - const: PCLK
+      - const: EXTCLK
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
index dd6eebf06ea6..27a9de10f0af 100644
--- a/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
+++ b/Documentation/devicetree/bindings/rtc/microcrystal,rv3032.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Microchip RV-3032 RTC
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
diff --git a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
index 585c185d1eb3..af4a31cd0954 100644
--- a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mstar MSC313e RTC
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Daniel Palmer <daniel@0x0f.com>
diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
index 7a1857f5caa8..4f9b5604acd9 100644
--- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
+++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NUVOTON NCT3018Y Real Time Clock
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Medad CChien <ctcchien@nuvoton.com>
diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
index a1148eb22c24..bcb230027622 100644
--- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP PCF2127 Real Time Clock
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml b/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
index 4f263fa6fd0d..a14b52178c4b 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Real Time Clock of the i.MX SoCs
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Philippe Reynes <tremyfr@gmail.com>
diff --git a/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml
index 2d1a30663d72..e50131c26dc6 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml
+++ b/Documentation/devicetree/bindings/rtc/rtc-mxc_v2.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: i.MX53 Secure Real Time Clock (SRTC)
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 maintainers:
   - Patrick Bruenn <p.bruenn@beckhoff.com>
diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
index b04b87ef6f33..a16c355dcd11 100644
--- a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
@@ -34,8 +34,8 @@ properties:
 
   interrupt-names:
     items:
-      - const: 'rtc 1Hz'
-      - const: 'rtc alarm'
+      - const: rtc 1Hz
+      - const: rtc alarm
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
index 9e66ed33cda4..4703083d1f11 100644
--- a/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 1
 
   st,syscfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
       minItems: 3
       maxItems: 3
diff --git a/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml b/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml
index d995ef04a6eb..df5b4f77f6fb 100644
--- a/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml
@@ -13,7 +13,7 @@ description: |
   This RTC appears in the AM62x family of SoCs.
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index eb75861c28c3..a3603e638c37 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -15,7 +15,7 @@ description: |
   possibly an interrupt line.
 
 allOf:
-  - $ref: "rtc.yaml#"
+  - $ref: rtc.yaml#
 
 properties:
   compatible:
-- 
2.39.2

