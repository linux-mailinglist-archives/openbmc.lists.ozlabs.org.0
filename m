Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FB6B8EB1
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 10:27:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbSqZ0LYdz3cMj
	for <lists+openbmc@lfdr.de>; Tue, 14 Mar 2023 20:27:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CXMuCvp0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=jim.t90615@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CXMuCvp0;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbSl015HRz3cgm
	for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 20:23:55 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so5371361pjv.5
        for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2023 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678785833;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLzit+yPTB9EJ5lmdvzAMxMYaSZ/Ktnl1xMjwc4SSlY=;
        b=CXMuCvp0v6WBlK9hz3mgtXN2c2b4woTU15Owp7XJK+80pJQc14AwZ5maBfGMEle8af
         nUtc51oOukNMUD1h8OiZHLJwSE4aBZMrVghZbwxAy4qq77YWuIPR1X4UHSj6ovYorMTN
         R06KQ6P4M+Y0baxQUoMiJfeAF9lC/uNUAv8CeRJ6OqAES5XnIXNzoVXgULC8F6hUXTxu
         A4RsnRnnhHfuAZ3vZnMwFg7ayQW5Zqy4mJpOrrE+FeQiNs2z9dk2uwp3PALWv9S2JVyp
         MmmXpegHFsw+pwdvShAomv14DfSABTB62o7VvrKjnR5lPK8oOTnv/YUGrZ5m2HS3o/j7
         Vbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678785833;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLzit+yPTB9EJ5lmdvzAMxMYaSZ/Ktnl1xMjwc4SSlY=;
        b=OMLpWFXBFodmxcUAtcUijDI3ctwHH3egeaZ7vs3ISDsS39ZGKm/o5t+SSLuhKidnz6
         5dtqxmlyzWdLvrjgPQLiMsuTma1ipNiIx0jIvtHyRbsswhqwl+Vxgx7rO09Y7qs12eXv
         ep2PrHyrj246ViiSJiAHxrpCXXTNEyH25ZB36Mpw2fjiBu1xiYxtuWYi24V37+BwerTz
         PXiFGR8KC5ys1+y+cZcShgLMtvrrCP2nlH/a/4gJdAB2hBCGG/bBpIP5Pv8SWXVuouwT
         G+Gb2ArRXOwI+f6iEfUHp0hWK7nel1Xy04U3sEQy7jr/U5C2ioMskTwlLimwN2doDErM
         OW/A==
X-Gm-Message-State: AO0yUKUjNJ11L4oZFLkysR7y5OMMu+7IGlbW2sQ9FZVd99QBzK+vYQJv
	uBlj1HAqO3S4REpbFcLV5uK90NZzDU0=
X-Google-Smtp-Source: AK7set8LhfISBZ22sLdNVeNyLkSrxVBW4X7W2/h1qHmjDbgENTohk8c2ZjqAemREVy4xPUwQdxVlsA==
X-Received: by 2002:a05:6a20:4da7:b0:bc:a2a9:1aa with SMTP id gj39-20020a056a204da700b000bca2a901aamr34485023pzb.55.1678785833663;
        Tue, 14 Mar 2023 02:23:53 -0700 (PDT)
Received: from localhost.localdomain ([1.200.129.193])
        by smtp.gmail.com with ESMTPSA id f21-20020aa782d5000000b00592626fe48csm1120898pfn.122.2023.03.14.02.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:23:53 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	jim.t90615@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v5 3/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Date: Tue, 14 Mar 2023 17:23:11 +0800
Message-Id: <20230314092311.8924-4-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230314092311.8924-1-jim.t90615@gmail.com>
References: <20230314092311.8924-1-jim.t90615@gmail.com>
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

Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v4:
   - remove bus bus-frequency
   - modify in/out description
Changes for v4:
   - modify in/out property
   - modify bus-frequency property
Changes for v3:
   - modify description
   - modify in/out property name
Changes for v2:
   - modify description
---
 .../bindings/gpio/nuvoton,sgpio.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
new file mode 100644
index 000000000000..9237376eda18
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
@@ -0,0 +1,87 @@
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
+  nuvoton,input-ngpios:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: |
+      The numbers of GPIO's exposed.GPIO lines is only for gpi.
+    minimum: 0
+    maximum: 64
+
+  nuvoton,output-ngpios:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: |
+      The numbers of GPIO's exposed.GPIO lines is only for gpo.
+    minimum: 0
+    maximum: 64
+
+required:
+  - compatible
+  - reg
+  - clock
+  - gpio-controller
+  - '#gpio-cells'
+  - interrupts
+  - nuvoton,input-ngpios
+  - nuvoton,output-ngpios
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
+        gpio-controller;
+        #gpio-cells = <2>;
+        nuvoton,input-ngpios = <64>;
+        nuvoton,output-ngpios = <64>;
+        status = "disabled";
+    };
-- 
2.17.1

