Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A152A86A690
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 03:30:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RZt+b6iJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkyxd1ks2z3dWS
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 13:30:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RZt+b6iJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkJwd46SWz3cCK
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 11:57:05 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d94b222a3aso38128625ad.2
        for <openbmc@lists.ozlabs.org>; Mon, 26 Feb 2024 16:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708995423; x=1709600223; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tla499i31FteRARO4yRBYIXYdMACpp2W1rRXAXvCyxw=;
        b=RZt+b6iJbAQgg1x0wWA3P9qTuPJS0COYtIMVLOb9FL6DOwxVCLPtnHHxcA8ulNIx2L
         /FdNCNFZxnCDvuSAZB9d0SD5zyj0XPZU84c3UHKq08jY0RpLWMhJKwcjdZYrBG9M6cQz
         8HvzYFFv3uk0Gn5sLIHpuy9Un7+mHSeHGtHVMIiXjh27R3PnpR1/uQnmyv62rNEeaAFs
         8CzCNCja2P3d299IBFfC8o5LsyqKFs2WQU8S3dHqZW/9JI1sSBAJM/IljB2ab5KdFOn3
         z89T19zplojPKMVazNoHXx+OCbogppsr6vguzHr5KO+U+lYMXe0Owx7YRxuf2MCLvSZv
         3+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708995423; x=1709600223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tla499i31FteRARO4yRBYIXYdMACpp2W1rRXAXvCyxw=;
        b=Cnqb7q30Ot+iriCACs9DIhON/bKeCODFE0NpT8kZb3EOw3K2FtbUD1w/cp2DiDynhY
         auJ+Y4T1lEi94xMmkfZoFNlheYQ3/ekJJXXGS496oTcu1A07XdqYp1iv/vHikAYvmOJ3
         pv65WsyAiumCksx9DXsEJE4z8ruRJX3Mr9S6juioVbEsbSEoD4NPCPHO2ChmVGZY/Qi+
         rd9CdwHDH3ZqXwqKRKmisuan/XnueDzSLTe4ttanJIXDAMJbSHnv9TyzWowpI5kG1j6i
         7dzWbLXeufHK5K9Eni9ZCfOzfovKOLkBGg0LnFX+sA54Ks47LN88WX9xC4vaTIJPOfIC
         I2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCU34jrR4NVl4AWw5BInjVKb/gu4QLkwMeA+MNODPUa0q/BQPpQbaECCT/u1ZgNvYGoTMeuat5UW+oZMDJ+vWj+QtCcg0ExLJWc=
X-Gm-Message-State: AOJu0Yw47KlRQJGzi2aOpM0Xmcwwd+zOXIs+EMnTA84a7kFvD282N/tg
	w7FNeYdyrHaNBARSvG0ciN4jXvvBjkxTOVzMMYPXE22ss3e77PAk
X-Google-Smtp-Source: AGHT+IGCy+oh/bhTmP6gkGaiFn4PrQOA8ZorBecG2+JPULAK9/O1vc3Sngfq2A/mk+7XsqD5Pb9Yyg==
X-Received: by 2002:a17:902:bf49:b0:1db:f371:dc90 with SMTP id u9-20020a170902bf4900b001dbf371dc90mr8777057pls.20.1708995422708;
        Mon, 26 Feb 2024 16:57:02 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b001db3361bc1dsm289253plg.102.2024.02.26.16.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:57:02 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date: Tue, 27 Feb 2024 08:56:04 +0800
Message-Id: <20240227005606.1107203-2-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Feb 2024 13:28:58 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, Rob Herring <robh@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Naresh Solanki <naresh.solanki@9elements.com>

Add common fan properties bindings to a schema.

Bindings for fan controllers can reference the common schema for the
fan

child nodes:

  patternProperties:
    "^fan@[0-2]":
      type: object
      $ref: fan-common.yaml#
      unevaluatedProperties: false

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..15c591c74545
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Fan Properties
+
+maintainers:
+  - Naresh Solanki <naresh.solanki@9elements.com>
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+properties:
+  max-rpm:
+    description:
+      Max RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 100000
+
+  min-rpm:
+    description:
+      Min RPM supported by fan.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 1000
+
+  pulses-per-revolution:
+    description:
+      The number of pulse from fan sensor per revolution.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 4
+
+  tach-div:
+    description:
+      Divisor for the tach sampling clock, which determines the sensitivity of the tach pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  target-rpm:
+    description:
+      The default desired fan speed in RPM.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  fan-driving-mode:
+    description:
+      Select the driving mode of the fan.(DC, PWM and so on)
+    $ref: /schemas/types.yaml#/definitions/string
+    enum: [ dc, pwm ]
+
+  pwms:
+    description:
+      PWM provider.
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+
+  cooling-levels:
+    description:
+      The control value which correspond to thermal cooling states.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  tach-ch:
+    description:
+      The tach channel used for the fan.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
+  label:
+    description:
+      Optional fan label
+
+  fan-supply:
+    description:
+      Power supply for fan.
+
+  reg:
+    maxItems: 1
+
+additionalProperties: true
+
-- 
2.34.1

