Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A0725B6F
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 12:19:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbjxc34CCz3dvx
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 20:19:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=UQcFsAPO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=UQcFsAPO;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbjx02gwZz3bkm
	for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2023 20:18:44 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 13008CFC;
	Wed,  7 Jun 2023 03:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1686133121;
	bh=Wi0tNbMeMIxnA5OELgarZDXHHas4dR4zF0TSjLM+/t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UQcFsAPOgEw0D/5m+IYx2uAnFOA9vOUQM/J1vHoGB4QVEnJYUF48kp4gy0+RJMu7J
	 W1JjgcqeawV/YqmKHrhx11mLag50cCb0hm5y8P353DlvYBJ1xSzGhi85q81xqW+HVt
	 N2bs5WjhQ741nN++oU2HPzEtzhY2mfE1xPlf/h5c=
From: Zev Weiss <zev@bewilderbeest.net>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: hwmon: Add Nuvoton NCT7362Y binding
Date: Wed,  7 Jun 2023 03:18:29 -0700
Message-ID: <20230607101827.8544-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607101827.8544-4-zev@bewilderbeest.net>
References: <20230607101827.8544-4-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This binding describes the NCT7362Y, a 16-channel fan/GPIO controller.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../bindings/hwmon/nuvoton,nct7362.yaml       | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
new file mode 100644
index 000000000000..630dcce7a14c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7362.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7362.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT7362Y fan controller
+
+maintainers:
+  - Zev Weiss <zev@bewilderbeest.net>
+
+description: |
+  The Nuvoton NCT7362Y is an I2C fan controller with 16 pins that can
+  be independently configured for PWM, fan tach, or GPIO
+  functionality.  Each pin's functionality is represented by a child
+  node.
+
+  The datasheet is not publicly available but can be requested from
+  Nuvoton via their web site.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7362
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 16
+
+patternProperties:
+  "^tach@([1-8]|1[0-7])$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+        description: The pin number.
+
+      nuvoton,pulses-per-revolution:
+        description: |
+          The number of tach pulses per revolution of the fan.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        default: 2
+
+    required:
+      - reg
+
+  "^pwm@([1-8]|1[0-7])$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+        description: The pin number.
+    required:
+      - reg
+
+  "^gpio@([1-8]|1[0-7])$":
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+        description: The pin number.
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      fanctl@22 {
+        compatible = "nuvoton,nct7362";
+        gpio-controller;
+        #gpio-cells = <2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x22>;
+        gpio-line-names = "", "", "", "", "", "", "", "",
+          "", "", "", "", "", "", "led1", "led2";
+
+        tach@1 {
+          reg = <1>;
+        };
+        tach@2 {
+          reg = <2>;
+          nuvoton,pulses-per-revolution = <1>;
+        };
+        pwm@10 {
+          reg = <10>;
+        };
+        pwm@11 {
+          reg = <11>;
+        };
+        gpio@16 {
+          reg = <16>;
+        };
+        gpio@17 {
+          reg = <17>;
+        };
+      };
+    };
-- 
2.40.0.5.gf6e3b97ba6d2.dirty

