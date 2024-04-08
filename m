Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5D89BD94
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 12:53:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nm1XEP+Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCmCm6Qy2z3vX8
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 20:53:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nm1XEP+Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCm9P65NMz3bXk
	for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2024 20:51:21 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e0878b76f3so34180815ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2024 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712573478; x=1713178278; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi3G+9078Q1MpGGuB4NvO/TctsJEyuqwS3BP7vrm41I=;
        b=Nm1XEP+QbkFpIIHgiqmpmtHhxsu2sqbF0UdaROntJ32olYb/IKtJE03Tv5ZYQF6W3t
         aAWCOc01OaLntHkvvjn9JpSxLhFVcmKYXxfgpJ/Bd2m0NmA1SA3wlFdhox/vD4A6HHWm
         jbIQMPDABqrXJpcqep7JFabcAjF2cOGp05iaXNAyMFQX6dl0JzN6Fx7zVxGVtXf/rXmm
         Yd1BoKB7f1DsIM33xeXW94zlSMT7qilKyV/B/1awv2o94hUvXDgMYCxpAEwQIeUCQTzY
         4V7peQGMMBZ+Ud3CaO8wYUo+Xo12D9OdKrjF8p3e3U0CHD2O5funJd3pA/mGJX6S9VCn
         COFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712573478; x=1713178278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wi3G+9078Q1MpGGuB4NvO/TctsJEyuqwS3BP7vrm41I=;
        b=smnuSOIpv9VoySzlVa6JfRBmCKPUp1QbYPK9I65XZHBe+AkuaidWd4ZLmQUweJmrUi
         hfqogRpvB+llEvzLj1J9tP81XRp6nZA6C924wpj+ST+RosQSdYF7RT52AKYKGHm3gf+/
         OkeAYKvDTq73OV6nTOLRlE8aaMnZPM75xHCBJ01XQt4Fs1eo9ZTp5zSd4TPTDjVdUilU
         tucCUg7FkdMQuTGglilGrnnwfhfy9vvYLSNK0+Xh3K8wco1tPDGmVXzfWTrtAm1MZpDs
         rtKWjSXyHC8SKn9HjNzew9YNM/BFUq9IK94iova+FoiggWGm6qxbRdxBQJ/Q/Y5EUEeT
         kc1w==
X-Gm-Message-State: AOJu0YxIGMZZedxUt7oY2C4rMgAIikqDQ4YhMq3ZrFX7LFP+A9nMP4vw
	qLs6XY9IbGD0CC6M+hEhTY1ht1/5jepvgh4bq+a0lafC3xnSxG2OR2XjXOn9
X-Google-Smtp-Source: AGHT+IE60C1FVRfwcU6eUrD5DSY8sqj+pbNv0yDFSSkyF3txfaF9RQY2sgjS7M/+9dn9JoTnceVoRA==
X-Received: by 2002:a17:902:da87:b0:1e0:1f53:a164 with SMTP id j7-20020a170902da8700b001e01f53a164mr11546641plx.0.1712573478092;
        Mon, 08 Apr 2024 03:51:18 -0700 (PDT)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b001e2a484db76sm6818026pln.56.2024.04.08.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:51:17 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 2/3] dt-bindings: hwmon: Support Aspeed g6 PWM TACH Control
Date: Mon,  8 Apr 2024 18:50:59 +0800
Message-Id: <20240408105100.2946497-3-potin.lai@quantatw.com>
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

From: Billy Tsai <billy_tsai@aspeedtech.com>

Document the compatible for aspeed,ast2600-pwm-tach device, which can
support up to 16 PWM outputs and 16 fan tach input.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/hwmon/aspeed,g6-pwm-tach.yaml    | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
new file mode 100644
index 000000000000..9e5ed901ae54
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2023 Aspeed, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/aspeed,g6-pwm-tach.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED G6 PWM and Fan Tach controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  The ASPEED PWM controller can support up to 16 PWM outputs.
+  The ASPEED Fan Tacho controller can support up to 16 fan tach input.
+  They are independent hardware blocks, which are different from the
+  previous version of the ASPEED chip.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pwm-tach
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+patternProperties:
+  "^fan-[0-9]+$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+    required:
+      - tach-ch
+
+required:
+  - reg
+  - clocks
+  - resets
+  - "#pwm-cells"
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    pwm_tach: pwm-tach-controller@1e610000 {
+      compatible = "aspeed,ast2600-pwm-tach";
+      reg = <0x1e610000 0x100>;
+      clocks = <&syscon ASPEED_CLK_AHB>;
+      resets = <&syscon ASPEED_RESET_PWM>;
+      #pwm-cells = <3>;
+
+      fan-0 {
+        tach-ch = /bits/ 8 <0x0>;
+        pwms = <&pwm_tach 0 40000 0>;
+      };
+
+      fan-1 {
+        tach-ch = /bits/ 8 <0x1 0x2>;
+        pwms = <&pwm_tach 1 40000 0>;
+      };
+    };
-- 
2.31.1

