Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCDA59E571
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 16:57:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBslk4mrPz3btQ
	for <lists+openbmc@lfdr.de>; Wed, 24 Aug 2022 00:57:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.180; helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBslT0mfgz2xJR
	for <openbmc@lists.ozlabs.org>; Wed, 24 Aug 2022 00:57:24 +1000 (AEST)
Received: by mail-oi1-f180.google.com with SMTP id a133so8511364oif.4
        for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 07:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=h0CnVKrOjJedjISgP9+nhkN7E189WcSV8KiZ+ezPrBE=;
        b=TWuihqC4OHofAcjksZ78Fngxf1x/qIBo7bjizeTsGRIsVw4B/Fa5khrzPzj4OBoJi/
         S+Ghqk83Yg4ZdN57TlUdb2vfEi6NEzkmohRHwVDIsTxEHR/vj2+t+Oki66xa8pz2llxx
         6RyrU+UUxZWu9y6VWfYSU3/JFKAr3Dv9rNhz7xXHvruhtspQIIMnN319Tk1+SAw5OCo3
         BhVC3UQ/+caV9i9NY1FmYWoO1nF4LJZjs7t0ZLUBebmVO0jsYbY9mflzEHhrdMp24D9m
         rGXWaf9GN6UcM1cOLT8vvl/59R580I/pMMLx/to8gCrGl097L/t49xUHpVMIunncg8hL
         mf5g==
X-Gm-Message-State: ACgBeo3CjujYSzoCci8cfu5NHPi+kK5rgkzY55xKhIMYxIVO3TU+6WK6
	siV1n4kE9AtfgEBP7TMkoQ==
X-Google-Smtp-Source: AA6agR5OARvxdnc8BmaUXFTmBiSwYZaPHP9yws/NVD55WI4mBLuEUcY0qCEgGgE0JHMJhoGGEYBTzg==
X-Received: by 2002:aca:f054:0:b0:345:7285:1147 with SMTP id o81-20020acaf054000000b0034572851147mr1505615oih.108.1661266640082;
        Tue, 23 Aug 2022 07:57:20 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.googlemail.com with ESMTPSA id t1-20020a056870600100b0011c65559b04sm3840637oaa.34.2022.08.23.07.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 07:57:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andy Teng <andy.teng@mediatek.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH] dt-bindings: pinctrl: Add missing (unevaluated|additional)Properties on child nodes
Date: Tue, 23 Aug 2022 09:56:37 -0500
Message-Id: <20220823145649.3118479-6-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In order to ensure only documented properties are present, node schemas
must have unevaluatedProperties or additionalProperties set to false
(typically).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml      | 1 +
 .../devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml     | 1 +
 .../devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml  | 1 +
 .../devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml       | 1 +
 .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml   | 2 ++
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml   | 1 +
 .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml        | 1 +
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 3 +++
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 .../devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml  | 1 +
 10 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
index 175a992f15e1..8a9fb9b433ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
@@ -23,6 +23,7 @@ patternProperties:
   '-pins$':
     type: object
     $ref: pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       function:
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
index 5e99d79499b4..846651ff77c9 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-keembay.yaml
@@ -44,6 +44,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
 
     description:
       Child nodes can be specified to contain pin configuration information,
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
index 0ec476248f21..6f30b5337ca2 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,pinctrl-thunderbay.yaml
@@ -42,6 +42,7 @@ properties:
 patternProperties:
   '^gpio@[0-9a-f]*$':
     type: object
+    additionalProperties: false
 
     description:
       Child nodes can be specified to contain pin configuration information,
diff --git a/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
index a651b2744caf..491f67e7cc4f 100644
--- a/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/marvell,ac5-pinctrl.yaml
@@ -24,6 +24,7 @@ patternProperties:
   '-pins$':
     type: object
     $ref: pinmux-node.yaml#
+    additionalProperties: false
 
     properties:
       marvell,function:
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index e7601c0f5a69..840f649e36ce 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -76,6 +76,8 @@ required:
 patternProperties:
   '-[0-9]*$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '-pins*$':
         type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 7a11beb8f222..7b7f840ffc4c 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -30,6 +30,7 @@ patternProperties:
 
   "^gpio@[0-7]$":
     type: object
+    additionalProperties: false
 
     description:
       Eight GPIO banks (gpio@0 to gpio@7), that each contain between 14 and 18
diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
index 8ed4b98a1628..9083040c996a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
@@ -41,6 +41,7 @@ required:
 patternProperties:
   "^gpio-[0-9]*$":
     type: object
+    additionalProperties: false
 
     description:
       Each port of the r7s72100 pin controller hardware is itself a GPIO
diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 3a65c66ca71d..d006a940c7c6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -97,6 +97,9 @@ patternProperties:
         additionalProperties: false
 
   "^(initial|sleep)-state$":
+    type: object
+    additionalProperties: false
+
     patternProperties:
       "^(pin-[a-z0-9-]+|[a-z0-9-]+-pin)$":
         $ref: samsung,pinctrl-pins-cfg.yaml
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index d35dcc4f0242..53c952d93ea2 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -115,9 +115,12 @@ patternProperties:
 
   '-[0-9]*$':
     type: object
+    additionalProperties: false
+
     patternProperties:
       '^pins':
         type: object
+        additionalProperties: false
         description: |
           A pinctrl node should contain at least one subnode representing the
           pinctrl group available on the machine. Each subnode will list the
diff --git a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
index 306524885a2b..98b4663f9766 100644
--- a/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/toshiba,visconti-pinctrl.yaml
@@ -36,6 +36,7 @@ patternProperties:
       pins it needs, and how they should be configured, with regard to muxer
       configuration, pullups, drive strength.
     $ref: "pinmux-node.yaml"
+    additionalProperties: false
 
     properties:
       function:
-- 
2.34.1

