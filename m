Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE7510D99
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 03:03:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp0ql4L0xz3bd7
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 11:03:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gafOJure;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gafOJure; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp0pm3SVpz2xy4
 for <openbmc@lists.ozlabs.org>; Wed, 27 Apr 2022 11:02:40 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id E9170531;
 Tue, 26 Apr 2022 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651021358;
 bh=KjNq5t3ZggJMTEA4a0oXHVCceTPLdKxXT7fm3v60f1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gafOJureGwkGdS7oF7iP8Cp1CJP2vVttE+zYcskh3RqjGczu0rfVyAJoxigGTN8Wj
 aY1Hk/8JX2e8n29X59ujcrOWe7B7t4aZEkLa2vKUfQ1nRucOnxnJZGsFhjpwSKEl7R
 nUs2CGHnWyZdpRZigyon5Gz2eR70mQAbaRrz3NWI=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: hwmon: Add nuvoton,nct6775
Date: Tue, 26 Apr 2022 18:01:48 -0700
Message-Id: <20220427010154.29749-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427010154.29749-1-zev@bewilderbeest.net>
References: <20220427010154.29749-1-zev@bewilderbeest.net>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These Super I/O chips have an i2c interface that some systems expose
to a BMC; the BMC's device tree can now describe that via this
binding.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../bindings/hwmon/nuvoton,nct6775.yaml       | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
new file mode 100644
index 000000000000..418477374fdb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct6775.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT6775 and compatible Super I/O chips
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct6106
+      - nuvoton,nct6116
+      - nuvoton,nct6775
+      - nuvoton,nct6776
+      - nuvoton,nct6779
+      - nuvoton,nct6791
+      - nuvoton,nct6792
+      - nuvoton,nct6793
+      - nuvoton,nct6795
+      - nuvoton,nct6796
+      - nuvoton,nct6797
+      - nuvoton,nct6798
+
+  reg:
+    maxItems: 1
+
+  nuvoton,tsi-channel-mask:
+    description:
+      Bitmask indicating which TSI temperature sensor channels are
+      active.  LSB is TSI0, bit 1 is TSI1, etc.
+    maximum: 0xff
+    default: 0
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        superio@4d {
+            compatible = "nuvoton,nct6779";
+            reg = <0x4d>;
+            nuvoton,tsi-channel-mask = <0x03>;
+        };
+    };
-- 
2.36.0

