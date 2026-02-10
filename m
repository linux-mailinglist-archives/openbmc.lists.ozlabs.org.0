Return-Path: <openbmc+bounces-1349-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KMUOV5Vi2k1UAAAu9opvQ
	(envelope-from <openbmc+bounces-1349-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 16:57:18 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E4A11CD57
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 16:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9R5j5Lhtz2xN5;
	Wed, 11 Feb 2026 02:57:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770739033;
	cv=none; b=Z6qu2HftYy5AZoAPTyCN/ASRSo1BhfQT8Kv5KYK+4L1SuLi6pykc3ANBGMInHZKrQZXMVeCZKPBML/bTFRfnNpKTvIkDUNStVVd/PxvTsF8S9laySubyLDELRKUqMXUBFaVBNrCMAGF7xCR6qf6kzMv7IOr7cA/Zjj2XARMlZxCXgSpjsfgp8O31Sn4P6xfz01746eUT5sx5wGnl1xlD9tG3HYnIxDM4DqA6LBybFWzoxA+YeitQtJgy0D3SsREego58LwvIeldgbdqgXCXfEZ+ZowyQa8bqH+Nv7Kx4CZQ46l8AmzPShun9YXRswSq66gXKQdvcGvz0DNGclHOTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770739033; c=relaxed/relaxed;
	bh=KDxHw3Hq9zG9KAhSV/T4bFN5OhynGtCKzUgVN+dy8Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZKos9oVnh45Kd5wAt42VfivCFQuNYgWMn5zWp0/LzWSdm5vity/VGXtaK/cwn+QrsXqxt4zDyUFAmZz+DxvIZebgmOS7KrPsdceFY74dpKOjW6xye8MKtnx5ylKBHUFTocXd56FLWOA/oc5S3b9sxQVFP2EIAUh2PQdHp1X7HtPjxqZU4kTHQn6uPCMujaIck6QoHCTvyEScSfe5rmewABVT3AbALnRkm108PbbQW1r/46wzja4mOVzm8xfR33ZlV5pEJRHjbftZuNvKL53mSLZX8MCjS01DS86ArvshY17wkaCr3cCmRKvWVtIDnU9He2dUIIt11ZdlE8ME8cYaKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aOeKICEF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aOeKICEF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9R5g2351z2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 02:57:10 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so54486265e9.3
        for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 07:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770739025; x=1771343825; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDxHw3Hq9zG9KAhSV/T4bFN5OhynGtCKzUgVN+dy8Fc=;
        b=aOeKICEF22QuKQtlrRvQKgZYpOHHaLWUs4MiIKQwmFfJXFEGrjhTG9LW+MAD2m3Ump
         /7nw6BtwkWHywXCXWyHHNOgvIOtlwG89+i0u4rKKPerQVHZ0awz3uCgkgWlkbSi6MBSp
         +f3zc0rEp+yfzTR9Vf0bXRhNaso2I5XQZz6qnS9orRQgzn1amF4gZqwQOAvepHRli5Ee
         CV3HJacv2KfQYcGYfjQG8MEByOXCdhqEYr+hEFbZHbJglhmwk+SbbaO/JQ5WB3Op7zFK
         vcM1Uc/EGkQn9l5/4ie5wjl70tpJ12vzQCoF7wZKPAn3J4F0aRVtZRzaGAs5cx1bBdXn
         FDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739025; x=1771343825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDxHw3Hq9zG9KAhSV/T4bFN5OhynGtCKzUgVN+dy8Fc=;
        b=Fke+AbRAZ1RAVG0UFjNYPhX/09iXi6IeB67Hft1jAwhJeSAZ/Ex1YEQB/fwg5eHYUZ
         LOWdQ6ACjrOJ05nErqzU3+HNmRPHcvS6yckxG7ESW4b4JaDftJSE6ry2i0LQK0787jqq
         VtT1LjtUs0i0GwepMuWlmGHDSQXG4ki70YoDrUmgV/xcOQqnMUR/lv1hHtR1v2XOpNCF
         vIn0zwf4ZDBA7IcCCpskKX9z7uOB1ZR4oNFYepUXD5KrowA7rFCqYFTbt/uWgEZCCQPy
         lTyjCIJnHcRrFn7rM7Q/c0M0ay28HSdX6q/RyE6MAGLOqXHX4GF+NRRHheRZfyeODWZ1
         n//g==
X-Forwarded-Encrypted: i=1; AJvYcCUnhWSma6cgFTotQFGuFWEeORNpla3PanZsURA0DNBzXVezzSPvRBuhA9L5Cemot2xb4RZ3+n6C@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznHgY3SLQDMvvGpEP8IKWjxyEmm2sbIv8lgl7BAO2EUdEt0GSk
	PcjLcthbIswUN4ebuq82o33YZbBiWMGQt7/YiB+7gc7lYqqZpviNb59h
X-Gm-Gg: AZuq6aKruIW7EMd8UVUsdSo/jJenAqVD+QsMC3URmrqWzfm88uSBrmNybz327VDG7Of
	IauWtXYC3TkcbAeoEhSykIj/zcqdRveedrbugOaYrvfABH5KYKGJadaNgiwui0Y7AlAeVk8JqYp
	QjbQVzB8aZ7wLuIwfCLXksbad/lUbSofayuaddgiopgYoF8UQBAKw2FtEQwu/YAVe82d0NRHtbq
	O9kqaGFE5lt2DlvZE/fGhil8XXIrxgAC8OpxXPCvUo+N7HCABAC1wPwZMNNu+VNEVlisF5HUGjm
	z4PrMTgHqanRJrgUtPYiWcSLHAKL8bGhVhcBCJZ1sRPhgEOrQHAmASFfNZ5qoCpz9wWZZvQv6OZ
	zWBRC1wSeb88hE+IM/RFGeyUk8/VC6ubb9EYpehlx8I1X52QP2x2xNUqx0z/3Z/5ULhRfqtPsDQ
	IMpluaoIj3hK9D91EhqPIrxkj6I75+T++Zmw==
X-Received: by 2002:a05:6000:2010:b0:437:71cc:a246 with SMTP id ffacd0b85a97d-43771cca558mr10374442f8f.10.1770739024825;
        Tue, 10 Feb 2026 07:57:04 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376806626fsm22051809f8f.37.2026.02.10.07.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:57:04 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1] dt-bindings: hwmon: convert npcm750-pwm-fan to DT schema
Date: Tue, 10 Feb 2026 17:41:17 +0200
Message-Id: <20260210154117.1126857-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:openbmc@lists.ozlabs.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tmaimon77@gmail.com,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[codeconstruct.com.au,gmail.com,roeck-us.net,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-1349-lists,openbmc=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,lists.ozlabs.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.1.146.88:email];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,devicetree.org:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 53E4A11CD57
X-Rspamd-Action: no action

Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 ------------
 .../bindings/hwmon/npcm750-pwm-fan.yaml       | 132 ++++++++++++++++++
 2 files changed, 132 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
deleted file mode 100644
index 18095ba87a5a..000000000000
--- a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Nuvoton NPCM PWM and Fan Tacho controller device
-
-The Nuvoton BMC NPCM7XX supports 8 Pulse-width modulation (PWM)
-controller outputs and 16 Fan tachometer controller inputs.
-
-The Nuvoton BMC NPCM8XX supports 12 Pulse-width modulation (PWM)
-controller outputs and 16 Fan tachometer controller inputs.
-
-Required properties for pwm-fan node
-- #address-cells : should be 1.
-- #size-cells	: should be 0.
-- compatible	: "nuvoton,npcm750-pwm-fan" for Poleg NPCM7XX.
-				: "nuvoton,npcm845-pwm-fan" for Arbel NPCM8XX.
-- reg			: specifies physical base address and size of the registers.
-- reg-names	: must contain:
-					* "pwm" for the PWM registers.
-					* "fan" for the Fan registers.
-- clocks		: phandle of reference clocks.
-- clock-names	: must contain
-					* "pwm" for PWM controller operating clock.
-					* "fan" for Fan controller operating clock.
-- interrupts	: contain the Fan interrupts with flags for falling edge.
-- pinctrl-names	: a pinctrl state named "default" must be defined.
-- pinctrl-0	: phandle referencing pin configuration of the PWM and Fan
-					controller ports.
-
-fan subnode format:
-===================
-Under fan subnode can be upto 8 child nodes, each child node representing a fan.
-Each fan subnode must have one PWM channel and at least one Fan tach channel.
-
-For PWM channel can be configured cooling-levels to create cooling device.
-Cooling device could be bound to a thermal zone for the thermal control.
-
-Required properties for each child node:
-- reg : specify the PWM output channel.
-	integer value in the range 0 through 7, that represent
-	the PWM channel number that used.
-
-- fan-tach-ch : specify the Fan tach input channel.
-		integer value in the range 0 through 15, that represent
-		the fan tach channel number that used.
-
-		At least one Fan tach input channel is required
-
-Optional property for each child node:
-- cooling-levels: PWM duty cycle values in a range from 0 to 255
-                  which correspond to thermal cooling states.
-
-Examples:
-
-pwm_fan:pwm-fan-controller@103000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "nuvoton,npcm750-pwm-fan";
-	reg = <0x103000 0x2000>,
-		<0x180000 0x8000>;
-	reg-names = "pwm", "fan";
-	clocks = <&clk NPCM7XX_CLK_APB3>,
-		<&clk NPCM7XX_CLK_APB4>;
-	clock-names = "pwm","fan";
-	interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pwm0_pins &pwm1_pins &pwm2_pins
-			&fanin0_pins &fanin1_pins &fanin2_pins
-			&fanin3_pins &fanin4_pins>;
-	fan@0 {
-		reg = <0x00>;
-		fan-tach-ch = /bits/ 8 <0x00 0x01>;
-		cooling-levels = <127 255>;
-	};
-	fan@1 {
-		reg = <0x01>;
-		fan-tach-ch = /bits/ 8 <0x02 0x03>;
-	};
-	fan@2 {
-		reg = <0x02>;
-		fan-tach-ch = /bits/ 8 <0x04>;
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml
new file mode 100644
index 000000000000..954ba7d38b93
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/npcm750-pwm-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx/NPCM8xx PWM and Fan Tach Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description: |
+  The NPCM7xx/NPCM8xx family includes a PWM and Fan Tachometer controller.
+  The controller provides up to 8 (NPCM7xx) or 12 (NPCM8xx) PWM channels and up
+  to 16 tachometer inputs. It is used for fan speed control and monitoring.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,npcm750-pwm-fan
+      - nuvoton,npcm845-pwm-fan
+
+  reg:
+    maxItems: 2
+    description: Register addresses for PWM and Fan Tach units.
+
+  reg-names:
+    items:
+      - const: pwm
+      - const: fan
+
+  clocks:
+    maxItems: 2
+    description: Clocks for the PWM and Fan Tach modules.
+
+  clock-names:
+    items:
+      - const: pwm
+      - const: fan
+
+  interrupts:
+    description: |
+      Contains the Fan interrupts with flags for falling edge.
+      For NPCM7XX, 8 interrupt lines are expected (one per PWM channel).
+      For NPCM8XX, 12 interrupt lines are expected (one per PWM channel).
+    minItems: 8
+    maxItems: 12
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^fan@[0-9a-f]+$":
+    type: object
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+        description: |
+          Specify the PWM output channel. Integer value in the range 0-7 for
+          NPCM7XX or 0-11 for NPCM8XX, representing the PWM channel number.
+
+      fan-tach-ch:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          The tach channel(s) used for the fan.
+          Integer values in the range 0-15.
+
+      cooling-levels:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: |
+          PWM duty cycle values in a range from 0 to 255 which
+          correspond to thermal cooling states. This property enables
+          thermal zone integration for automatic fan speed control
+          based on temperature.
+
+    required:
+      - reg
+      - fan-tach-ch
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pwm_fan: pwm-fan@103000 {
+        compatible = "nuvoton,npcm750-pwm-fan";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        reg = <0x103000 0x2000>, <0x180000 0x8000>;
+        reg-names = "pwm", "fan";
+
+        clocks = <&clk NPCM7XX_CLK_APB3>, <&clk NPCM7XX_CLK_APB4>;
+        clock-names = "pwm", "fan";
+
+        interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pwm0_pins &fanin0_pins>;
+
+        fan@0 {
+            reg = <0>;
+            fan-tach-ch = <0 1>;
+            cooling-levels = <64 128 192 255>;
+        };
+
+        fan@1 {
+            reg = <1>;
+            fan-tach-ch = <2>;
+        };
+    };
-- 
2.34.1


