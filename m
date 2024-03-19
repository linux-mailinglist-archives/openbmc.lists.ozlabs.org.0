Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCA187FAF6
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 10:39:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nRCBCiGv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzRWm4Kbvz3vYr
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 20:39:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nRCBCiGv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=manojkiran.eda@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzRRP47QFz3dXG;
	Tue, 19 Mar 2024 20:35:45 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e0189323b4so15336535ad.1;
        Tue, 19 Mar 2024 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840943; x=1711445743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpO3XyTMYrNp26rIW9VgOyOw5H/JJ52pteRLCcl6qlU=;
        b=nRCBCiGvD5bCcqjUbNX80a3gzp1iuhKpNsBeB3qsVizaALerNJLyQroTi1NkotomBr
         VIp/WcRb3LQNGV07NYk3RZN4ub8hgRrhrhwfEDPc3nQYq32PIuglXZu856dYct2K9XWi
         CYhv1dhJKpswxbSQd2bh48U7pIxSjrSLDeEcH1BHzCN2Gz8AMXtopJzeaGTxs4Kipfgp
         V49UJViBykMxXVVdO5y6Ld2XPSbaD4U9bj9II9uNg2qEEGA4ewW2bt4HaJV9wcfdyIMs
         oQpafg/wJEgSfmTHYI6632jgNYA8lNbi6TmqA+8OHXUyGNKWUPllaZmItzGLYMsf341L
         2lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840943; x=1711445743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpO3XyTMYrNp26rIW9VgOyOw5H/JJ52pteRLCcl6qlU=;
        b=bGqhRKIm4u3HSnwiUw7AoS48tn/6sKk2Nh1pSGghp2vRswhSyl21T0aDbli2bJ/kTS
         H6QDVQ8R3/s9aejTsKanWTTsXKFxJ0FdCdESpN39RiUsofEkHuwAm46e9rzNJufSUWcn
         PkfGk/b89dLAdXyT3bq1BOhU5JMcf8GbswiFnw2e5Z620DCaGUUC0PM3oC5etzLSaMAM
         gz7HETqRAQFpUg3l/1LVfJusMisyfI/6hebVxA+a+wAIBbkPCdI3ZNoIXBS+eJjpbzgP
         QmZMuUEcOsNKkNv2gs1QsQbxhfzP5ygpvObxCQvnI6Y9LqVakzJ3arVw0bNCXbGtgM4u
         24og==
X-Forwarded-Encrypted: i=1; AJvYcCVmjmjDHND11JAT2FLJ6YromQ4PIkyFdbbKR6mDS7AmDGQPEbsSvgKvTd/hhMIv0HaaAA+rUJ19BIITMmbh8xj9PIqMm5Ty06NcH8tjn423g0lBSYbMNWDUHwo7Pc3g7iI+mMkU4dOf
X-Gm-Message-State: AOJu0YxTdx5+j73KWiRtugW83kp9G3nbI0UQ8JKP748VTyA/itvLOhuq
	335lsEEY+fWQaera/dJrIQhTwBv8JlWzs65x5wnSwbIZ+DOXDfBh
X-Google-Smtp-Source: AGHT+IHryBKHJ+MSwjp/1byfMt0hDod5YQF/OmkAgxcU2UHV4h3fLG6PWHn1lTiV9EhL0mWJM96Kow==
X-Received: by 2002:a17:902:e88a:b0:1e0:2c80:2aaf with SMTP id w10-20020a170902e88a00b001e02c802aafmr5518425plg.44.1710840942841;
        Tue, 19 Mar 2024 02:35:42 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:42 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 4/4] dt-bindings: aspeed: Add eSPI controller
Date: Tue, 19 Mar 2024 15:04:05 +0530
Message-Id: <20240319093405.39833-5-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
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
Cc: conor+dt@kernel.org, vigneshr@ti.com, richard@nod.at, openbmc@lists.ozlabs.org, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com, jk@codeconstruct.com.au, manojkiran.eda@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds the device tree bindings for aspeed eSPI
controller.

Although aspeed eSPI hardware supports 4 different channels,
this commit only adds the support for flash channel, the
bindings for other channels could be upstreamed when the driver
support for those are added.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 .../bindings/soc/aspeed/aspeed,espi.yaml      | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml

diff --git a/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
new file mode 100644
index 000000000000..3d3ad528e3b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/aspeed,espi.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# # Copyright (c) 2024 IBM Corporation.
+# # Copyright (c) 2021 Aspeed Technology Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/aspeed,espi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed eSPI Controller
+
+maintainers:
+  - Manojkiran Eda <manojkiran.eda@gmail.com>
+  - Patrick Rudolph <patrick.rudolph@9elements.com>
+  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+  - Ryan Chen <ryan_chen@aspeedtech.com>
+
+description:
+  Aspeed eSPI controller implements a device side eSPI endpoint device
+  supporting the flash channel.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2500-espi
+          - aspeed,ast2600-espi
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "^espi-ctrl@[0-9a-f]+$":
+    type: object
+
+    description: Controls the flash channel of eSPI hardware
+
+    properties:
+      compatible:
+        items:
+          - enum:
+              - aspeed,ast2500-espi-ctrl
+              - aspeed,ast2600-espi-ctrl
+
+      interrupts:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+
+    required:
+      - compatible
+      - interrupts
+      - clocks
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/ast2600-clock.h>
+
+    espi: espi@1e6ee000 {
+        compatible = "aspeed,ast2600-espi", "simple-mfd", "syscon";
+        reg = <0x1e6ee000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0x1e6ee000 0x1000>;
+
+        espi_ctrl: espi-ctrl@0 {
+            compatible = "aspeed,ast2600-espi-ctrl";
+            reg = <0x0 0x800>,<0x0 0x4000000>;
+            reg-names = "espi_ctrl","espi_flash";
+            interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+        };
+    };
-- 
2.40.1

