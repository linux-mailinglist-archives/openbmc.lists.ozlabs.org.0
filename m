Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D6E80BFE0
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:29:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YTfPsqE2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpS045mH4z3vjX
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:29:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YTfPsqE2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRhS3dpGz30QJ
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:15:35 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3b86f3cdca0so3065703b6e.3
        for <openbmc@lists.ozlabs.org>; Sun, 10 Dec 2023 19:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702264530; x=1702869330; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3QsPLbyBhalpeCT8ZCWUjA1czC86N1Fb7t3x26LhWyo=;
        b=YTfPsqE2kaW9Soz3HWx2GhQENcFp9WSAaKihAbQMBOjE2gx3Mnl5RnrpMASmyiN7oM
         yeOQNn54KBUNpRvUGZELG+2su9HUiGfQPB8tIgXqRkU+4F1TBpdG805N+FB/+wgNUqiR
         n+KdhrOkj7Ez/h979v6rDosFMVF1qAnt4mVx80c4utm1EKYlAJBtY0Fpvi+aIuneyvnt
         9QirvCAWlnn7IlbaPnsF97Pdg1w/dAjX7gnGxiCOnYnkzo/xPkmUpXi/2MUfSgdczghw
         6/88KeqJ1tjwND/GP3i/enf5CSjwN4C2OAKaPAvRLzTKHv9Cg0wmsNq26mh9pIdr9OMO
         +8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702264530; x=1702869330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QsPLbyBhalpeCT8ZCWUjA1czC86N1Fb7t3x26LhWyo=;
        b=TN9r96ZffXb8HTS5JioOQuUz6/aCFmuPXzQGDGmIJYF5atmspc8q+s7OYnb7hSxBjS
         ET5/RTTSs6AqXDJluf4xRcEM1cTJAK8Pm2/ZujOQT42XrrvDXcz6lXvDSJHQIT//GPqq
         iKGXy1h4hEWXZAuL0ElPfjULYdAsTNWdkXeIuBVQyBlpcymytGIadhDWgWA3EcW0Py/t
         APSQeChTtJXdzy6R5QOPFq9KpYgz3a3SmT2NruzYxf4LGVAPL/q/nji5w89uVWsR1r2g
         cuRfMby0FARF0kjdQt/QKVCYznwmpmpdh14p8ZHD3q0w9qY/ewjopiE6DqKJSfIpKYxO
         bSuQ==
X-Gm-Message-State: AOJu0YxUW2xM+yORBdBK63kLzTxF1FwNtBWTSNjI4fJyoUw5h3OKSFWm
	o257r5qcb/8T9J5x/wGOvHbO353WcB0=
X-Google-Smtp-Source: AGHT+IEipgnG44F1Iro4gOmV1Oss10cUM1JNF2anBMsyaSJ0Px8rr4EDysj1M6fpy3Kk8ER3kcA74w==
X-Received: by 2002:a05:6808:2225:b0:3b9:d75e:f972 with SMTP id bd37-20020a056808222500b003b9d75ef972mr4965697oib.85.1702264530187;
        Sun, 10 Dec 2023 19:15:30 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001d05456394csm5428080plg.28.2023.12.10.19.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 19:15:29 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 1/2] dt-bindings: iio: Add MCP9600 thermocouple EMF converter
Date: Mon, 11 Dec 2023 11:13:18 +0800
Message-Id: <20231211031319.3810692-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: potin.lai@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Hepp <andrew.hepp@ahepp.dev>

Add support for the MCP9600 thermocouple electromotive force converter. The sensor has  integrated cold junction compensation and a typical accuracy of 0.5 degrees Celsius. The driver supports a resolution of 0.0625 degrees Celsius.

Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/MCP960X-Data-Sheet-20005426.pdf
Signed-off-by: Andrew Hepp <andrew.hepp@ahepp.dev>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../iio/temperature/microchip,mcp9600.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml

diff --git a/Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml b/Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml
new file mode 100644
index 0000000000000..d2cafa38a5442
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/temperature/microchip,mcp9600.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/temperature/microchip,mcp9600.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip MCP9600 thermocouple EMF converter
+
+maintainers:
+  - Andrew Hepp <andrew.hepp@ahepp.dev>
+
+description:
+  https://ww1.microchip.com/downloads/en/DeviceDoc/MCP960X-Data-Sheet-20005426.pdf
+
+properties:
+  compatible:
+    const: microchip,mcp9600
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 6
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 6
+    items:
+      enum:
+        - open-circuit
+        - short-circuit
+        - alert1
+        - alert2
+        - alert3
+        - alert4
+
+  thermocouple-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Type of thermocouple (THERMOCOUPLE_TYPE_K if omitted).
+      Use defines in dt-bindings/iio/temperature/thermocouple.h.
+      Supported types are B, E, J, K, N, R, S, T.
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/iio/temperature/thermocouple.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@60 {
+            compatible = "microchip,mcp9600";
+            reg = <0x60>;
+            interrupt-parent = <&gpio>;
+            interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "open-circuit";
+            thermocouple-type = <THERMOCOUPLE_TYPE_K>;
+            vdd-supply = <&vdd>;
+        };
+    };
-- 
2.31.1

