Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767189BD8C
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 12:51:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AkC0kZzR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCm9v6knJz3dVC
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 20:51:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AkC0kZzR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCm9M4xhrz3bn7
	for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2024 20:51:19 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5e152c757a5so2673839a12.2
        for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2024 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712573476; x=1713178276; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uCTOnZsK/zS9zwgu4cOL4xrH7dtplXyGv6RdHAgkJc=;
        b=AkC0kZzRH13gyJuzwUTpXNmZGuBbIFydi85/KfBg8/WamC1j7uMCr4hBegHhQZ/BbW
         sA+hINyX4u0/89CxKZS8tpxq+ULlKglcLGL0W/nkXMLWGZgfJHVWtQALXADIV+NNYGQh
         UpToDE6lsgI1tzeqW9yA7Nf6O1Mv/HVPKoWe/0T1i3BoCidYTBKV88eA0tRsci35YGC8
         6Qgz4Qmp2n/kabXHtQwb1QFZmlCbWNob2EuAaIWoPWMdYibbDmnxvwgj/ruPNiW9XkWR
         z3wlrc0uJqdsjc+WMq6C7aU4/iQveG3JEGanKscy2bYNVmV+M+G4o/Bi3ijwUxicT3MP
         Cvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712573476; x=1713178276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uCTOnZsK/zS9zwgu4cOL4xrH7dtplXyGv6RdHAgkJc=;
        b=YWxeHNA8aDSlOUZttYXe45ixCBJ019ArG5g2BQEdjBBmA8QEs5V50pS3xpoNeDDW/b
         h0zVk6bKaqboNxz7Ael7qay9FJRR0NcWCefrqYrsGG5LzQbg0KjXh8HfvyFdEFz+hlUu
         ER49I/h8XgsjWfg7IM7muHyg68lrrgECzRTsACibYOGojcKbFK6oDDz2OfnHheDRz48L
         8oNzyj835aHsOkH40OT1NQOpif4F3Zl2jmACH7GKYWtWWm097nOKDXjJ2/y36asXbcb3
         sv2XsxuBuUkQoXTQH5bZM1Y1DQLeCrV/uSleNGKps4XwFBSIFNzsJ4Zx2eYZtLqMMIGa
         IY1g==
X-Gm-Message-State: AOJu0YzrUWmxOhg9PvL6sqOTfS79PzphoZvhncZ7OepK6ngShRyEbpZX
	kVrfu1yaXPPAguKa4aiOKTQxcPeeqghAzB2HjSK7gO2KdoWlbM3dVlAUx0tm
X-Google-Smtp-Source: AGHT+IFWOgfs5wiuBZEJlzDwZ0gbbBv2AosSVC4bcoyAni4YZ6R2ne3VTPNNQ6KYN1mxTyaEQWBU4g==
X-Received: by 2002:a05:6a20:96ce:b0:1a7:1b6e:4d4 with SMTP id hq14-20020a056a2096ce00b001a71b6e04d4mr6527066pzc.23.1712573476475;
        Mon, 08 Apr 2024 03:51:16 -0700 (PDT)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b001e2a484db76sm6818026pln.56.2024.04.08.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:51:16 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date: Mon,  8 Apr 2024 18:50:58 +0800
Message-Id: <20240408105100.2946497-2-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240408105100.2946497-1-potin.lai@quantatw.com>
References: <20240408105100.2946497-1-potin.lai@quantatw.com>
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
Cc: billy_tsai@aspeedtech.com
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
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..0fb738081699
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,79 @@
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
+...
-- 
2.31.1

