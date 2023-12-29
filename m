Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0214481FDDB
	for <lists+openbmc@lfdr.de>; Fri, 29 Dec 2023 08:46:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ieJRKsGv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T1csD5cJxz3cHf
	for <lists+openbmc@lfdr.de>; Fri, 29 Dec 2023 18:46:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ieJRKsGv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T1cqd4npnz2xdg
	for <openbmc@lists.ozlabs.org>; Fri, 29 Dec 2023 18:45:33 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dbd990ad852so4749612276.1
        for <openbmc@lists.ozlabs.org>; Thu, 28 Dec 2023 23:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703835930; x=1704440730; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEGAxLf4IsKoqwzjcok3JRGPJ70voZ7ZjL8ngt195yA=;
        b=ieJRKsGvKxR4aR8IuoKYklnoZnglKJpwCY5+C9sSgd21IVbgm+4C32JvcIcA6Pl9T0
         7ZyZKbQbXkNCKb/5PClTxN3BsGdgqJ9mpn0O2xXHFjZyJYYpRM+DlwkwCgCX31nsMpZH
         TJUumHQnyZ9ia3xqh5w3/5bFQlHUeCXSDVAUH1YOyhIJTVBnJavL5u03mCifstEevZk5
         8Cv9QIdYdVyxJ9GYpvT0G3ZXmr7ayCDiv9VjU5ra66H8hK78G7lvlYbZBdNjCsb5kLzA
         yKbhlNf+uhxnshB1mu12j1RrHwILQjCl3Y8Ysl4OIZVACUcs8MXc6eI54xdDZvIzATfF
         9i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703835930; x=1704440730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEGAxLf4IsKoqwzjcok3JRGPJ70voZ7ZjL8ngt195yA=;
        b=DiiQ+II/kD2cvsLtKXpDJRDqVediOYpSpYatGJC5jP/aYslgJnGncZc6ZYZm5hqKWI
         UY5hpDgmL5CFuhILht1M9d2+Diyhi3DFl1LYxoehPe0w5OQamFFxODfFjUMMUyRMnjQZ
         t8E57CFsWwPmE7YNoSVnnL+RUPxDjtnAKgMhwm6Km+B8CoSa97R5tgfFjsV1+bBNPPQj
         0Q1XA8hGDAzgZmjStjMq1imsQsH+Ybpl6YRFb+04D1jZ9HB+rIGlYnKfOppIrNPtP8Do
         SXTBoN/4OSMIKY+/DZnn2loMWD7mRJBac3olpItVjCEDPW+gVcyQmkKrBjGMMQk9VwPO
         sJuA==
X-Gm-Message-State: AOJu0YyQy8HJIqezDwP9307QITIWPTLf6SGBlFWHSRHeZoxNLv5k7mMj
	7Oal+Wn5xuwisGlj+GzgY9E=
X-Google-Smtp-Source: AGHT+IGU6rlyzKFUXt2uV0qU7Ku9PkDDI4wAMUvhgBjSVCDz4vqA9CFCVZ1s108SqYFGYMxlr5tcRA==
X-Received: by 2002:a25:69c5:0:b0:dbd:38c:e612 with SMTP id e188-20020a2569c5000000b00dbd038ce612mr6841255ybc.84.1703835930106;
        Thu, 28 Dec 2023 23:45:30 -0800 (PST)
Received: from localhost.localdomain ([1.200.140.173])
        by smtp.gmail.com with ESMTPSA id s188-20020a6377c5000000b005c683937cc5sm10305186pgc.44.2023.12.28.23.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 23:45:29 -0800 (PST)
From: jim.t90615@gmail.com
X-Google-Original-From: JJLIU0@nuvoton.com
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	jim.t90615@gmail.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	andy@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Subject: [PATCH v10 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Date: Fri, 29 Dec 2023 15:45:06 +0800
Message-Id: <20231229074508.2709093-2-JJLIU0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
References: <20231229074508.2709093-1-JJLIU0@nuvoton.com>
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
Cc: Rob Herring <robh@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jim Liu <JJLIU0@nuvoton.com>

Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver

Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
Changes for v10:
   - modify error words
Changes for v9:
   - no changed
Changes for v8:
   - no changed
---
 .../bindings/gpio/nuvoton,sgpio.yaml          | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
new file mode 100644
index 000000000000..9e32e54aeb24
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
+description: |
+  This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC and detailed
+  information is in the NPCM7XX/8XX SERIAL I/O EXPANSION INTERFACE section.
+  Nuvoton NPCM7xx SGPIO module is combines a serial to parallel IC (HC595)
+  and a parallel to serial IC (HC165).
+  Clock is a division of the APB3 clock.
+  This interface has 4 pins (D_out , D_in, S_CLK, LDSH).
+  NPCM7xx/NPCM8xx have two sgpio modules. Each module can support up
+  to 64 output pins, and up to 64 input pins, the pin is only for GPI or GPO.
+  GPIO pins can be programmed to support the following options
+  - Support interrupt option for each input port and various interrupt
+    sensitivity options (level-high, level-low, edge-high, edge-low)
+  - ngpios is number of nuvoton,input-ngpios GPIO lines and nuvoton,output-ngpios GPIO lines.
+    nuvoton,input-ngpios GPIO lines is only for GPI.
+    nuvoton,output-ngpios GPIO lines is only for GPO.
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The numbers of GPIO's exposed. GPIO lines are only for GPI.
+    minimum: 0
+    maximum: 64
+
+  nuvoton,output-ngpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The numbers of GPIO's exposed. GPIO lines are only for GPO.
+    minimum: 0
+    maximum: 64
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
+    };
-- 
2.25.1

