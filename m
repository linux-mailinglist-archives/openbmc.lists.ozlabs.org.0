Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19418224F8
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:51:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=m54O/YhU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Sl94bmCz3cRt
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:51:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m54O/YhU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8wm5kxWz2xYk
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 12:34:32 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d04c097e34so10299045ad.0
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703208870; x=1703813670; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETRSFur40AfpBaI78BUa335OqHgbVSXvF5B1Xe3sqDk=;
        b=m54O/YhUyyIdYfSRMIR1Psnj5/3tBeEQG2gklFgk6DV/dhZUd+Bq8fucsegLByByUt
         GK+l+E9sj75DIeX6h2xS65uWga5ABRdmUc77jdFMzLm7/VPWK48HoNGzSgWEe8l83TgE
         82Xf4GcPiZKYI1GWjz1fPoroFTDJIFFHAPcBIk+Am+QCzgvq4gonGGFs0niW9pAz8xtZ
         e2TP4fbgyeRClPf9ja09UEFww6qYRyKjelulLyiniUTF2yu0gZTDsCPvOTmF0QjMq0Fs
         lQD5tyAPfSe5nT4jA0dzhCNNMwRZQ9vIFkdwFsoLyTvPKZx6DXQHbKOsrOxkoMUgG3A5
         TwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208870; x=1703813670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETRSFur40AfpBaI78BUa335OqHgbVSXvF5B1Xe3sqDk=;
        b=O5Fo7owVj8VuBJP7c7hkaomlhnEswDWwlFFVLH71C5dU4BKEd1tUeJqj2xCV86nTEb
         4UjbzuYEvFa/wtDAX7RAeZjXZt+4ksJLBOfOnSNsQ5tJACrf8EooQZTuoIrvuyZK8w2+
         aPg0vu3g01jYhYJn6RAPTXit+kjPCjVRqWJF/dC0d2Jr1O25a74AuP/U/9KihqFD0pIq
         xl18nLHE1wmZXXQGt59Y+2ZXcK1LS+PrM7k4LiQMC9jSz8zSXtcA0tjmrLNlkfK0PRoM
         uj+zfv+O+ZzhqEyhElUc7YcX8Hi3B5sQPX95Zy07rUVreV8eKgx56vfO79ARvwNHDWyr
         qlqA==
X-Gm-Message-State: AOJu0YwbRd49pVN++0fHrhkRRplNbGMp53YSwqwKpsivSxMEYApgJBq7
	KGh68lm1NKMc/dAAkzgDE6w=
X-Google-Smtp-Source: AGHT+IHA5GhnBx6vZ62Xk1DYmpIi3B6wwdjPCvbgiKHKyfskJ0cBoGCKQVf5H9xa6q5hyNGxkGvfig==
X-Received: by 2002:a17:902:7245:b0:1d4:8d6:13b with SMTP id c5-20020a170902724500b001d408d6013bmr1532940pll.39.1703208870104;
        Thu, 21 Dec 2023 17:34:30 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001d3d8e718c6sm2258634plg.282.2023.12.21.17.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:34:29 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v3 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
Date: Fri, 22 Dec 2023 09:33:50 +0800
Message-Id: <20231222013352.3873689-2-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:46:15 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com
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

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 .../devicetree/bindings/hwmon/fan-common.yaml | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
new file mode 100644
index 000000000000..ba7d6531f01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
@@ -0,0 +1,76 @@
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
-- 
2.34.1

