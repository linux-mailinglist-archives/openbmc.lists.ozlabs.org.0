Return-Path: <openbmc+bounces-303-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0271AF06EF
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 01:26:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWzg352C7z2yQH;
	Wed,  2 Jul 2025 09:26:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751370347;
	cv=none; b=U2YXi6SOwAxsubV4oLBZ87EgkZddM3NAV0HK9ZhS/cd2kmeearhxf4HnnflSpZrseUcRfESM+ibPB9EXQY7y/ha/pNFSTvrIthh7l4R8s1eTUcq6Y+UvCa7nbhKruu70+jcAx2hPGVLVIDjNBhanR+XURtKTY8PguQYO8RJACDN+3Pt6UOZ49aN3BZX4URTYOncUQbnlnixs+PktF9j5eoxiB6iy6RzhvojNcYRwHNZ1m5LlmkEymOXXz0ElOFewHQPAn8HZZ2oefZJLKfm8IlMhq81GForU6QUQgDdCUQTeKYvVa7NUWG0OqJPSK1UO0m4ufzLTC3qTxj96spK33w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751370347; c=relaxed/relaxed;
	bh=DYvkuajmv5na43d8cQ8VjOTN17kku93U+UVVhEImi/c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NPbrP1G+YQAzRNi+Tl9CqVhX8sDJIN8E7khblrQk7A8+II2hDSTOm3MtD7Rk2lPIYy2qLt88RX5SumYKWwSytZ0l4SMLDYDwF0uyj6AYpua1NIBLiQzCnQHPiBt82jccIDRrytj7MEyDB+qxhDy2hdt6yiFk81mWHfKFD5Zaq+QmUTstVhxM08bVPy+HDxmHFE3xtyoaLZYnZ2meCypcjFxBL6g5AOF/pm1E2W0cpiH0che8sob+o+Q9jS2mUOjixuiz5C3MZ3eewtBTgJTR9yIz0BqRr6DrdWh8nNHQ9lOb0LeXBvK4M+b9H9v+uSe2tURlFXsRpE1UZcneHdgr3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B/DtrPDa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B/DtrPDa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=fredchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWh6y2cG8z2xHT
	for <openbmc@lists.ozlabs.org>; Tue,  1 Jul 2025 21:45:45 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-235ef62066eso67122425ad.3
        for <openbmc@lists.ozlabs.org>; Tue, 01 Jul 2025 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751370343; x=1751975143; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DYvkuajmv5na43d8cQ8VjOTN17kku93U+UVVhEImi/c=;
        b=B/DtrPDaOaeyo8ql60vexh1JlLIejqhwPq6H7IyT/sdX63PrEpW4HYoD89YbY8vDY/
         tmqqklPcAHthzCRQ14IlXNT0MjxGDquFotujdFpVr6th0gjKrWHB37ICkq7qwK++iKAC
         Ko5hTjgAUehyw+IWop4au/yjiKoAHRe85kT4ty1RFCCXENNVfxFHovRQMjgSKpKpdZwQ
         pa9atMbK4ZJ78qktEgU3Mcruyl9COg4qZYwc1xiVLBwKSqGak/9xUasBM+FZIA/7vnI1
         McKbpHRQMzQucZOhCke1UeVVwOe2clOWxo9ahQP4quhWx5R7URbgp0CFzpwRmNHusEpn
         nWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370343; x=1751975143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYvkuajmv5na43d8cQ8VjOTN17kku93U+UVVhEImi/c=;
        b=D+v3IkOAkXOiGmX0xb/jBgq8NxY14GHD4tHFeKEq7uaqrunkS72vzvw/WCNJFNBxev
         6pb+ZwSZyS0EErjGwWQhEd190YJsEPmojan+NUds2Ad4JBz048FkO95tNEddnfi9pNWA
         GEV83u06Ty3nwhtagVsdZHliskROntHQqhYHV4+c08eUj6Qg9g0anBQ9a59kyyX7D2R8
         ctJBHIEby0Co7Sc4nEJ5OFgreeyy9tLzDHTpwn19PtJlOnXyrPuKCvYtgtioa3UB/OOQ
         zCRYFsQPBERRjD4nZHG7Kj1OO3Mq8NbAxQ8is9rO8FqeCOzNDqu8nvDROYVMBZX0CXAP
         4+fA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Z2xjb1Pn6YR5BfPR+z5NY9uNCiIi/8W3v4t+K5T6hrCkKrJFX942HzuRguhrhPMxr1Im/spl@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzUWXduyVZ9XVq+R7rh6uKyKSdc5M3yYvqr8GI398E3IYOcGHpG
	qlHj5iqbz4LaE+Y3RS4afJKkoe0YeKFzHhryM2lI7zVg662Khx6X3ifv
X-Gm-Gg: ASbGnctlMeWWlBXBWZkmyKXal2XQJCHNpLn7/sjb9UYY3u2t0xZB07fsfQYpl3cVpMM
	3tb6y6jvsyYv4UENcnQngwYh5qsE1DUNy243BN3Yy2HO3r9pjSRneqkK8fFyKquBhWMXBZy0Gc9
	st29NhrTxamZQKUFjGDk0oWhiJvrCpOyisH5zBCREQZGAhzsdHhBs7QdOqX+jXUVSuNMNJzptdA
	AdwIUVNDCPXZufPHvSdkhAXdm7hqpS+xcMwWq49jqjWwWZFHr5+972mYN9T7pdzorjV5WYDbogp
	xeDJ2u+jOyF7PNyxeVMYoIqlD1zDwpQ8YDU5OlMmGPWqAdD7lZI4dwt88CF3jPq7MPbBqO296pX
	N09GE3JGefxcMb3mfv8pdEa9hRNkBwZACjWEb48vZHHF+lTZCm8Bhl/c9Ror9FfauUJEi1fS+DZ
	eOASA72hzgYS3/ZTtiNimMZUbs
X-Google-Smtp-Source: AGHT+IGGCJ58jG5tPzRtMCAnvKy1oVPw54XsL4PKbvZgSSl/YWwzbkotxPAuP0KA6PHZE1X87NWofA==
X-Received: by 2002:a17:902:e784:b0:238:2437:ada8 with SMTP id d9443c01a7336-23ac487aeb5mr237827475ad.48.1751370342860;
        Tue, 01 Jul 2025 04:45:42 -0700 (PDT)
Received: from fred-System-Product-Name.. (2001-b400-e389-b6b2-52d0-167f-4c41-9344.emome-ip6.hinet.net. [2001:b400:e389:b6b2:52d0:167f:4c41:9344])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f0b63sm103987835ad.61.2025.07.01.04.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:45:42 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 1/2] dt-bindings: hwmon: pmbus: add ti tps25990 support
Date: Tue,  1 Jul 2025 19:45:38 +0800
Message-ID: <20250701114539.1463404-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add DT binding for the Texas Instruments TPS25990 eFuse

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20241105-tps25990-v4-6-0e312ac70b62@baylibre.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 2fc032ec1de485c64d8561dc7fa0de3f7acf147d)
---
 .../bindings/hwmon/pmbus/ti,tps25990.yaml     | 83 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
new file mode 100644
index 000000000000..f4115870e450
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TPS25990 Stackable eFuse
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+description:
+  The TI TPS25990 is an integrated, high-current circuit
+  protection and power management device with PMBUS interface
+
+properties:
+  compatible:
+    const: ti,tps25990
+
+  reg:
+    maxItems: 1
+
+  ti,rimon-micro-ohms:
+    description:
+      micro Ohms value of the resistance installed between the Imon pin
+      and the ground reference.
+
+  interrupts:
+    description: PMBUS SMB Alert Interrupt.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      list of regulators provided by this controller.
+
+    properties:
+      vout:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      gpdac1:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+
+      gpdac2:
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        unevaluatedProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ti,rimon-micro-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hw-monitor@46 {
+            compatible = "ti,tps25990";
+            reg = <0x46>;
+
+            interrupt-parent = <&gpio>;
+            interrupts = <42 IRQ_TYPE_LEVEL_LOW>;
+            ti,rimon-micro-ohms = <1370000000>;
+
+            regulators {
+                cpu0_vout: vout {
+                    regulator-name = "main_cpu0";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d3e42e21ef65..a56dd5b45487 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21363,6 +21363,12 @@ F:	include/linux/dma/k3-udma-glue.h
 F:	include/linux/dma/ti-cppi5.h
 X:	drivers/dma/ti/cppi41.c
 
+TEXAS INSTRUMENTS TPS25990 HARDWARE MONITOR DRIVER
+M:	Jerome Brunet <jbrunet@baylibre.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+
 TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
 M:	Robert Marko <robert.marko@sartura.hr>
 M:	Luka Perkov <luka.perkov@sartura.hr>
-- 
2.49.0


