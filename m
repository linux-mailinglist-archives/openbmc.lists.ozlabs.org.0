Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3E50C043
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 21:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlPRp2nwLz3bky
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 05:22:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlPRQ2c3Jz3bWG;
 Sat, 23 Apr 2022 05:21:52 +1000 (AEST)
Received: by mail-ot1-f47.google.com with SMTP id
 s21-20020a0568301e1500b006054da8e72dso6155133otr.1; 
 Fri, 22 Apr 2022 12:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOuZ8W1MJjibB6swPo2RkQCIeQZ1wridYdEDKveCnMw=;
 b=l9YmDqCDovYuq5b9bJ4aOLqL1qKwHo7QL5gFnUGfc37aNzWrNtovNnrsjEpSnsgj1H
 KlfVRadDVXH0o9yMCBi5fMcGP+U1U/uXd9+P7MbFaSd0U8UzNHNoP7cJGL74Khu1nubg
 GkEXLmwQ/ECS5gOeV6WHt1PMysjyp1iVJIsDSivGrE8P+H/ezpvcPcraXeiWAxapQEmi
 Gy7zMidNKiePZuglHkM5Y+ofGfXp0crDAPA7+GSx+VrWnAc/lYwEZaypeTAxx8mDzlmX
 9VbRQPe3sPZPM9EXRxkNx3eYuk7BsQ1Y2DwoxbNo+h9qSD8fEnNn1SwA8gZHCEavRE/Z
 28PA==
X-Gm-Message-State: AOAM532xu72BtEH+0mWYfmvWb+9ZVRtghldLsSMPxtYIKANFD4GZD9WX
 t66jBpcWTdBVtN03Krrwxg==
X-Google-Smtp-Source: ABdhPJwYLw7ezcsEnAXRaBNaeuhKHOPAF+WazY3gcKcmVgQTsP9d3MdUusPnK8wJQL/5J1SzRjWOlw==
X-Received: by 2002:a9d:3624:0:b0:5e9:5778:d0c6 with SMTP id
 w33-20020a9d3624000000b005e95778d0c6mr2399677otb.367.1650655308747; 
 Fri, 22 Apr 2022 12:21:48 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 x24-20020a056870a79800b000e2e53716fbsm1044094oao.31.2022.04.22.12.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 12:21:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in
 examples
Date: Fri, 22 Apr 2022 14:21:38 -0500
Message-Id: <20220422192139.2592632-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The additional nodes in the example referenced from the pinctrl node
'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
or not documented with a schema (aspeed,ast2500-gfx). There's no need to
show these nodes as part of the pinctrl example, so just remove them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/aspeed,ast2500-pinctrl.yaml       | 81 ++++---------------
 1 file changed, 16 insertions(+), 65 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
index 7c25c8d51116..9db904a528ee 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml
@@ -76,73 +76,24 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
-    apb {
-        compatible = "simple-bus";
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges;
-
-        syscon: scu@1e6e2000 {
-            compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
-            reg = <0x1e6e2000 0x1a8>;
-            #clock-cells = <1>;
-            #reset-cells = <1>;
-
-            pinctrl: pinctrl {
-                compatible = "aspeed,ast2500-pinctrl";
-                aspeed,external-nodes = <&gfx>, <&lhc>;
-
-                pinctrl_i2c3_default: i2c3_default {
-                    function = "I2C3";
-                    groups = "I2C3";
-                };
-
-                pinctrl_gpioh0_unbiased_default: gpioh0 {
-                    pins = "A18";
-                    bias-disable;
-                };
+    scu@1e6e2000 {
+        compatible = "aspeed,ast2500-scu", "syscon", "simple-mfd";
+        reg = <0x1e6e2000 0x1a8>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        pinctrl: pinctrl {
+            compatible = "aspeed,ast2500-pinctrl";
+            aspeed,external-nodes = <&gfx>, <&lhc>;
+
+            pinctrl_i2c3_default: i2c3_default {
+                function = "I2C3";
+                groups = "I2C3";
             };
-        };
-
-        gfx: display@1e6e6000 {
-            compatible = "aspeed,ast2500-gfx", "syscon";
-            reg = <0x1e6e6000 0x1000>;
-            reg-io-width = <4>;
-            clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
-            resets = <&syscon ASPEED_RESET_CRT1>;
-            interrupts = <0x19>;
-            syscon = <&syscon>;
-            memory-region = <&gfx_memory>;
-        };
-    };
-
-    lpc: lpc@1e789000 {
-        compatible = "aspeed,ast2500-lpc", "simple-mfd";
-        reg = <0x1e789000 0x1000>;
-
-        #address-cells = <1>;
-        #size-cells = <1>;
-        ranges = <0x0 0x1e789000 0x1000>;
-
-        lpc_host: lpc-host@80 {
-            compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
-            reg = <0x80 0x1e0>;
-            reg-io-width = <4>;
 
-            #address-cells = <1>;
-            #size-cells = <1>;
-            ranges = <0x0 0x80 0x1e0>;
-
-            lhc: lhc@20 {
-                   compatible = "aspeed,ast2500-lhc";
-                   reg = <0x20 0x24>, <0x48 0x8>;
+            pinctrl_gpioh0_unbiased_default: gpioh0 {
+                pins = "A18";
+                bias-disable;
             };
         };
     };
-
-    gfx_memory: framebuffer {
-        size = <0x01000000>;
-        alignment = <0x01000000>;
-        compatible = "shared-dma-pool";
-        reusable;
-    };
-- 
2.32.0

