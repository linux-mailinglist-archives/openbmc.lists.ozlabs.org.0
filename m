Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927B651C28
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 09:05:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbpzJ1M7xz2xZp
	for <lists+openbmc@lfdr.de>; Tue, 20 Dec 2022 19:05:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bC5WPILq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bC5WPILq;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbpvG6YcTz3bYS
	for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 19:02:02 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d3so11466707plr.10
        for <openbmc@lists.ozlabs.org>; Tue, 20 Dec 2022 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAhkp0InTgU68d121ZiU7XlrosaqquvStPHnwrA29z4=;
        b=bC5WPILqfiUNWIv9u/ks5N5N5oeqPvabMgKlYff+DyW6W09Mm48wpfVICLYqZP1P7J
         z34I/ss/TCt4MtiJ2Sr2cZbOTuv1AHOS2PQrnEK5Wva1mw8/Z4ppYsLHdPBi2OProZrO
         r3Y53HGmIurtAqSQgaVZEonPlHrWzq4BoybuZJGl0gryagSQkIH9tqv7tKZUIFZvtIAM
         e2nuULgtDrr+pgeOC27VS4+D8LpQBXmkWb0wCdmnF2W401iIpJ3PSSqxX3/Q29pnXZsu
         GHuu8ZhTkK0lNP2KaraTuVvQQ+W0fj458X7FSmOQizhWn3siJzunmya3XuTqyQrW3AGA
         GDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAhkp0InTgU68d121ZiU7XlrosaqquvStPHnwrA29z4=;
        b=OJc8RFXkc9uF8REZQr+z4orAwc23vvgBm3+ZRN1NdlUKY5w7+P1QLoVc8/rl72I+zQ
         eElK0qkdnfuYJFiN/AVysHxXuTyZFVQiyCqemIxgwZokpbsbTvB/Hbm3QlyI/CmxqDon
         vNoAS0jOZFc542zsfrOInxB8orKRo6WHoguMKrTfgFZQYB8paH64I09jZSSvKgjCg2sT
         gOHBKhI9f7hO4v0Mse052rVMl9xiu+sWt3HcMHseyEuobAP7aEMuW6tbDKa/cOSl5+Zy
         vGIYDRrVTEy9Gaf6bCbnHuZSAVx1Ny3HqlRtCLJDkF4H8iwVTjw6m/pKzckK1MJGLke1
         aQHw==
X-Gm-Message-State: ANoB5pl5j2c7WKRrEjzRs+uNipf68Ksjy6XF8NXZqy2++q6D4FEqqW9g
	gAKHSThI3t8oCmODGraYDmI=
X-Google-Smtp-Source: AA0mqf65FeV1zQJUKDGZB88+1MWZK7pVvXTbj+AThHkMQNGdpkgcWMtGNpMaQliox7RalI4/GbiC0g==
X-Received: by 2002:a05:6a20:94cd:b0:aa:3c1:46d with SMTP id ht13-20020a056a2094cd00b000aa03c1046dmr55852642pzb.57.1671523322415;
        Tue, 20 Dec 2022 00:02:02 -0800 (PST)
Received: from localhost.localdomain ([180.217.146.214])
        by smtp.gmail.com with ESMTPSA id u15-20020a65670f000000b00476d1385265sm7559179pgf.25.2022.12.20.00.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 00:02:02 -0800 (PST)
From: Jim Liu <jim.t90615@gmail.com>
X-Google-Original-From: Jim Liu <JJLIU0@nuvoton.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 3/3] dt-bindings: gpio: add npcm7xx sgpio driver bindings
Date: Tue, 20 Dec 2022 16:01:39 +0800
Message-Id: <20221220080139.1803-4-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220080139.1803-1-JJLIU0@nuvoton.com>
References: <20221220080139.1803-1-JJLIU0@nuvoton.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for the NPCM7xx sgpio driver

Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
---
Changes for v3:
   - modify description
   - modify in/out property name 
Changes for v2:
   - modify description
---
 .../bindings/gpio/nuvoton,sgpio.yaml          | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
new file mode 100644
index 000000000000..673535314cff
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nuvoton,sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton SGPIO controller
+
+maintainers:
+  - Jim LIU <JJLIU0@nuvoton.com>
+
+description:
+  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
+  Nuvoton NPCM7xx SGPIO module is combine serial to parallel IC (HC595)
+  and parallel to serial IC (HC165), and use APB3 clock to control it.
+  This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
+  NPCM7xx/NPCM8xx have two sgpio module each module can support up
+  to 64 output pins,and up to 64 input pin, the pin is only for gpi or gpo.
+  GPIO pins have sequential, First half is gpo and second half is gpi.
+  GPIO pins can be programmed to support the following options
+  - Support interrupt option for each input port and various interrupt
+    sensitivity option (level-high, level-low, edge-high, edge-low)
+  - Directly connected to APB bus and its shift clock is from APB bus clock
+    divided by a programmable value.
+  - ngpios is number of nuvoton,input-ngpios GPIO lines and nuvoton,output-ngpios GPIO lines.
+    nuvoton,input-ngpios GPIO lines is only for gpi.
+    nuvoton,output-ngpios GPIO lines is only for gpo.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-sgpio
+      - nuvoton,npcm845-sgpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nuvoton,input-ngpios: true
+
+  nuvoton,output-ngpios: true
+
+  bus-frequency: true
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - nuvoton,input-ngpios
+  - nuvoton,output-ngpios
+  - clocks
+  - bus-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    gpio8: gpio@101000 {
+        compatible = "nuvoton,npcm750-sgpio";
+        reg = <0x101000 0x200>;
+        clocks = <&clk NPCM7XX_CLK_APB3>;
+        interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        bus-frequency = <16000000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        nuvoton,input-ngpios = <64>;
+        nuvoton,output-ngpios = <64>;
+        status = "disabled";
+    };
-- 
2.17.1

