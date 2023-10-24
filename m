Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF147D4B92
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 11:08:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LLj7Dgfr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF5nm0Ny5z3cRc
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 20:08:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LLj7Dgfr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF5mB0kSFz2xTP
	for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 20:07:05 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c9b1e3a809so27009665ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 02:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698138423; x=1698743223; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=palBtRjhdsNKVFR4Z7sz7xV1QIa2igJzdiqlgzEfdQo=;
        b=LLj7DgfrYW2A99IG5eNMXsy5sbeI+Cs1Eyb5VQaVXLwUA2za/XlRVbzFzGOu+0tZXN
         9W1c4IqIF80I7RoPngatgupvoeeEGwy+jM7uETCCBnKfSAodMqFuBd81OGBGDD4u3Ybc
         oU5IKj7CbYcmApKxkxSbdkNF5xSG07JhHC7NIj1KmG7UX/SDcMwVmhlHIhyIBtBdS6fF
         +RmXfbwIwE72eN4dQwlbCeMb9T7t9XRmo9sxeA/I4tH1Wfu59fr8CfiYFfRkwslQk8nx
         Up8yx0ZsdeZpj7eXEa8A7J2TvTnTh71832oZfcKh96s8mq21BHNBWA0A8j+fS/Y/smxE
         aOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698138423; x=1698743223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=palBtRjhdsNKVFR4Z7sz7xV1QIa2igJzdiqlgzEfdQo=;
        b=spkIP8EW5+uWbnlQnOPfXtwo1UOCfa886omppmRaYGX/JDPx/kuqf9lJVWRyDdnUIS
         +7XihQlrySMob9XOcJLydG1H6/OOmILK5we5iSIhhj6A3B+3ACrA9nrDGHrDk1EJZuhe
         PtKma7Lu7ePLzRMnNyQE2nq1FxT018yxAOGIoc4FnAkqfR4uUkMLwoFmXIs0NYW601pa
         J1ssd0d1jgy17FY1cyOcCTDevOy1Ks942oA2Olxf76xF3FjuhkVjETKUNgrROjXJCeRL
         QROvOtWsofaxjX3MiIAr+O9MROpYeJnRXWjyynIg+4xQE/sgDKKqSYee5KNqD4WBoxfC
         dyyA==
X-Gm-Message-State: AOJu0YwEXRSbWR+FNNX7IOBl008y9Mt2VLPQz/VLSxLgcEDswQQkyrUG
	yYSY83ZBQtIfeMHD/7sCfZg=
X-Google-Smtp-Source: AGHT+IFMziS3HBLi9OJgEgkfNJsIqawPXjSb6QqV0/hxIOzzXcDksvrVKwZFXLi5IPFJ4/3Vx4THHg==
X-Received: by 2002:a17:903:1c8:b0:1c9:d6f8:1902 with SMTP id e8-20020a17090301c800b001c9d6f81902mr9932828plh.15.1698138422955;
        Tue, 24 Oct 2023 02:07:02 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.144.223])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b001c9ab91d3d7sm7055324plz.37.2023.10.24.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:07:02 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	linus.walleij@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	brgl@bgdev.pl
Subject: [PATCH v6 1/3] dt-bindings: gpio: add NPCM sgpio driver bindings
Date: Tue, 24 Oct 2023 17:06:29 +0800
Message-Id: <20231024090631.3359592-2-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231024090631.3359592-1-jim.t90615@gmail.com>
References: <20231024090631.3359592-1-jim.t90615@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add dt-bindings document for the Nuvoton NPCM7xx sgpio driver

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v6:
   - Drop quotes for $ref
   - Add and drop '|' for description
   - Add space after 'exposed.'
   - remove status
Changes for v5:
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
 .../bindings/gpio/nuvoton,sgpio.yaml          | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
new file mode 100644
index 000000000000..ddf01a77b8f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nuvoton,sgpio.yaml
@@ -0,0 +1,86 @@
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
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The numbers of GPIO's exposed. GPIO lines is only for gpi.
+    minimum: 0
+    maximum: 64
+
+  nuvoton,output-ngpios:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The numbers of GPIO's exposed. GPIO lines is only for gpo.
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

