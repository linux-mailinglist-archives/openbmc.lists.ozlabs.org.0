Return-Path: <openbmc+bounces-1366-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIa1HgD2kWl4ogEAu9opvQ
	(envelope-from <openbmc+bounces-1366-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 17:36:16 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A793413F1B2
	for <lists+openbmc@lfdr.de>; Sun, 15 Feb 2026 17:36:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDWkK6fqpz2xlw;
	Mon, 16 Feb 2026 03:36:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771173369;
	cv=none; b=eKwnR4YSj3j5AVK+TaNjxUDM7xrxj54wI6F8NJEXaTOGCGfcBxg5lQnE3b0TOuRBwQE3yC1MjctnuaUGsHWZx2D+TPCOP56e+F6/ZtLqUlKBY9zr+1kEV8knFwALsaHg8mV0m4ZiMSk1Zhd/Lj2BUKl3JW/I885jzHobUxA7pxDh9DFLswATln4PODfXubPENv7RanYkiHwbIa4r24RvQAyeoYCqGCPWKLyayQjbCV7TroIo0x3WoO5f4uxlTbwepAws0eHqn1Z0nLVbhABIu68xnnZPzhBzTBOEGxQ15DTNb3gw2tegs2eWtG0iDLOh10rZQFqXHzWR0Jq7Mdv7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771173369; c=relaxed/relaxed;
	bh=Rkgk08i2VDNmIlHOtwetmTzX3cu5OCSN90qqnNHKmCo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XbX6gD0pHaxBxMvdc8eBmhnrdaHV8qdRQUIA9mbhuSt6krD9p1g5w0aUBB3vYHsTkf3oDqqOoFoQLLHiQ2tBp0MXZQ8W+nM6AUEYrX6ICWrR4Z52JrnqOtZ0AGKrWzgGrxVWALpqfUvbJLJs5+8MR44DTFHK0YCrcNbEvYaQvURWfRFdpFmPAn5af9WBdGxZ8mJTBCyL6/ZtHD80jD0Bu5XEScpcVd1FnonvGVaMJESXY9+lJkQs+ZxCFQVARWG4LRVcqaMRkxkoUPf/VPJDfeZlMCLvQKfeYzIufuT4WzsU/FTTQvkdCAdcFNavWDFWawdP3HqU+upoyfsZfxde2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NL/aBeaY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NL/aBeaY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDWkH4Yhvz2xlm
	for <openbmc@lists.ozlabs.org>; Mon, 16 Feb 2026 03:36:06 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-436309f1ad7so1975746f8f.3
        for <openbmc@lists.ozlabs.org>; Sun, 15 Feb 2026 08:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771173358; x=1771778158; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkgk08i2VDNmIlHOtwetmTzX3cu5OCSN90qqnNHKmCo=;
        b=NL/aBeaYYSziAD2k0SYTYpAhpy2v8pOjb9ZkitovZbmuJ7Pmrw7/zBfQdswGQ0WLjz
         1wNJ6HlYOYZt4K/vmJ6Or4X7a+IeeSl8amzvY/A6AyFdaKAlINxprJlHCFwqnKxyug9h
         bwuJPR3g/OGmxgSkwVlqZau67KQSHhonLOqS3ZJEgaYnXC6jOlATVwIQaXvU7K5WW7Qd
         HNDEVqKKv7KJUK1NvPggz03NowzopttSa+QM6+/EeU9ttKD0Cw24yJCXebOrO+VF4Z75
         GOr0e9xlkp+bxmyFaW7qVkhmjDgFrdclRXR22bB2X6pRm4f2RKuthSG1nSWmHQH0kjhQ
         3opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771173358; x=1771778158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkgk08i2VDNmIlHOtwetmTzX3cu5OCSN90qqnNHKmCo=;
        b=Z/Efowireja6o6FEuqqTYAXLZ8U+kQ3cVC3A/jFfwuuU0b4IOPku7AVDr+To5nrBSI
         ziDdjbo/Se7Fi5QmIrnpXW6jFXysbkQxRb9HOlcf+Ql+CL4XLXHhUGIAH/oG5XTrwwPs
         FqCn/zAmlr6dvcDybWJlQTBrgDMmuwM42ewVC+gpBS5/+TTzeW4KZU622cULoM4G8i/g
         zsTKE+9nYM92JEFsdKpVvZIOq8Jcwur8+Dk+9Mn5+4oMtxfH6ayjfb7HB/ARnk/DpWks
         31iGS5dIAcVlgRdkIFPMp8OnYQVm6Uk/5taOyvzspOk/SGCoAqVyoBMtU9GBU/4dZCIN
         7fvg==
X-Forwarded-Encrypted: i=1; AJvYcCUBjIoRdNxVAwzbc9AfWdy+8hcEoEc2/NrnacnheEwj6+qz595bu3Eti8oUR0xN9aigpgRROhsm@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1y3HzSOcEuAnbF29Sx3NzSzpt7DzO6vX+3NnaDxmSv3Wfr7z1
	EgwVCPDcw2wgym+CbShcO/njHan+HPzKaVRwB1TrqTySQA3VssIU3sQc
X-Gm-Gg: AZuq6aIV3I7DVXCo1L8kaF1JRTWAFSVEu44F16RzgMzOfjoiYugWhd3jmDW0r6JSCxy
	5X9sNNJySkJwErk3wxS+hLeZF9FGvojDY8I0g1F35JbOif5Ez9oh2NJvW+NwyRy/FRI5Zo+1Izd
	kmvzNH5RuNL2ycbWl5fJtQNvXX/eql2Sbp7bne8LgCTSiHP8D5TP/BMURpcfmJrBykPEtd8Jfmh
	B3M2+crQMfWrIypq0JUfFDrq9BczCRwUcXGleI+AXDV8VF2z7RfVEuc+XdfRhgdF18fObwAXqmL
	z4mGde8MCvjZwDygdVjjQsjjUTOjpy3jRvSZCMD35yeSp22RtL/FQ+x0hC/re3f+BwLr047ByZN
	2YlOAkssBI4jSKqCDyGbkgO5RboPflMwOdnf13iHta4bP3/2ik48vvL3Z6+9JvEr0OZ6ISOOW7n
	4DUT6Hbe/uxB1Ay2d2ciIorlvq9Y1KuBCHeQ==
X-Received: by 2002:a05:6000:2901:b0:435:7154:2a7 with SMTP id ffacd0b85a97d-4379db3411emr7986116f8f.6.1771173357710;
        Sun, 15 Feb 2026 08:35:57 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8209sm22085970f8f.30.2026.02.15.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 08:35:57 -0800 (PST)
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
Subject: [PATCH v2] dt-bindings: hwmon: convert npcm750-pwm-fan to DT schema
Date: Sun, 15 Feb 2026 18:35:53 +0200
Message-Id: <20260215163553.1334475-1-tmaimon77@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-1366-lists,openbmc=lfdr.de];
	FREEMAIL_CC(0.00)[google.com,lists.ozlabs.org,vger.kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.146.88:email,0.0.0.1:email,devicetree.org:url,0.0.0.0:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A793413F1B2
X-Rspamd-Action: no action

Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
format.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---=0D
Addressed comments from:=0D
 - Rob Herring : https://www.spinics.net/lists/kernel/msg6047623.html=0D
=0D
Changes since version 1:=0D
 - Modify yaml file.=0D
 - Remove unnecessary symbols.=0D
 - Add items.=0D

 .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 -----------
 .../hwmon/nuvoton,npcm750-pwm-fan.yaml        | 139 ++++++++++++++++++
 2 files changed, 139 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan=
.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,npcm750=
-pwm-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt b/=
Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
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
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-Under fan subnode can be upto 8 child nodes, each child node representing =
a fan.
-Each fan subnode must have one PWM channel and at least one Fan tach chann=
el.
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
-	#address-cells =3D <1>;
-	#size-cells =3D <0>;
-	compatible =3D "nuvoton,npcm750-pwm-fan";
-	reg =3D <0x103000 0x2000>,
-		<0x180000 0x8000>;
-	reg-names =3D "pwm", "fan";
-	clocks =3D <&clk NPCM7XX_CLK_APB3>,
-		<&clk NPCM7XX_CLK_APB4>;
-	clock-names =3D "pwm","fan";
-	interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
-			<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
-	pinctrl-names =3D "default";
-	pinctrl-0 =3D <&pwm0_pins &pwm1_pins &pwm2_pins
-			&fanin0_pins &fanin1_pins &fanin2_pins
-			&fanin3_pins &fanin4_pins>;
-	fan@0 {
-		reg =3D <0x00>;
-		fan-tach-ch =3D /bits/ 8 <0x00 0x01>;
-		cooling-levels =3D <127 255>;
-	};
-	fan@1 {
-		reg =3D <0x01>;
-		fan-tach-ch =3D /bits/ 8 <0x02 0x03>;
-	};
-	fan@2 {
-		reg =3D <0x02>;
-		fan-tach-ch =3D /bits/ 8 <0x04>;
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fa=
n.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.ya=
ml
new file mode 100644
index 000000000000..73464af3078e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.yaml
@@ -0,0 +1,139 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/nuvoton,npcm750-pwm-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NPCM7xx/NPCM8xx PWM and Fan Tach Controller
+
+maintainers:
+  - Tomer Maimon <tmaimon77@gmail.com>
+
+description:
+  The NPCM7xx/NPCM8xx family includes a PWM and Fan Tachometer controller.
+  The controller provides up to 8 (NPCM7xx) or 12 (NPCM8xx) PWM channels a=
nd up
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
+    description:
+      Contains the Fan interrupts with flags for falling edge.
+      For NPCM7XX, 8 interrupt lines are expected (one per PWM channel).
+      For NPCM8XX, 12 interrupt lines are expected (one per PWM channel).
+
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
+        description:
+          Specify the PWM output channel. Integer value in the range 0-7 f=
or
+          NPCM7XX or 0-11 for NPCM8XX, representing the PWM channel number.
+
+        maximum: 11
+
+      fan-tach-ch:
+        $ref: /schemas/types.yaml#/definitions/uint8-array
+        description:
+          The tach channel(s) used for the fan.
+          Integer values in the range 0-15.
+
+        items:
+          maximum: 15
+
+      cooling-levels:
+        description:
+          PWM duty cycle values in a range from 0 to 255 which
+          correspond to thermal cooling states. This property enables
+          thermal zone integration for automatic fan speed control
+          based on temperature.
+
+        items:
+          maximum: 255
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
+        compatible =3D "nuvoton,npcm750-pwm-fan";
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        reg =3D <0x103000 0x2000>, <0x180000 0x8000>;
+        reg-names =3D "pwm", "fan";
+
+        clocks =3D <&clk NPCM7XX_CLK_APB3>, <&clk NPCM7XX_CLK_APB4>;
+        clock-names =3D "pwm", "fan";
+
+        interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names =3D "default";
+        pinctrl-0 =3D <&pwm0_pins &fanin0_pins>;
+
+        fan@0 {
+            reg =3D <0>;
+            fan-tach-ch =3D <0 1>;
+            cooling-levels =3D <64 128 192 255>;
+        };
+
+        fan@1 {
+            reg =3D <1>;
+            fan-tach-ch =3D <2>;
+        };
+    };
--=20
2.34.1


