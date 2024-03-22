Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23804887613
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 01:27:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CtCS3blq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1g4x6SCsz3vjL
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 11:27:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CtCS3blq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1FS50hCGz3dXM
	for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 19:12:35 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e74aa08d15so1220265b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2024 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711095150; x=1711699950; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2twXgqk/JJH1iFtYUNR8nPJ8pAL7XuG13GUJFxIX6E=;
        b=CtCS3blqCy/jBMSusz8j8d8inXiMTtimMWdvvI7N4HSvRq29zxwWdFe73GOLsd/Zhm
         ZEqKDuyldVpfF1Ng36TkHeU6Rh/OacLblrQeQ5cT7B4GwlPZPu5SotQVERGRUKhckTa0
         pNN1k76iUbbl8paLyNbbi2GiuMt6VOrO9Nz0P/o8kTjhab3IhtNoKP/qFsRYtbWpiHCI
         17boRNLtNKDmcHuhGboVAgz4W64LHk5TO0CxelAIA2O1SZ1UHLzs4mQyE8ifkdHR8kCb
         vxl5THTy8UAigpp/Fxs647XQRNoXZZkQnBwhIn5eDsaY6ui6rTKkiyeNq/V+xvfT7bon
         ATVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711095150; x=1711699950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2twXgqk/JJH1iFtYUNR8nPJ8pAL7XuG13GUJFxIX6E=;
        b=KgZ5vH/5ZiMCIzfuRXcdOxtAW/ThqXs40VtuUWC0rGMjAA8BF3MtHY3C7ml4NeZf+u
         Ws5UCea/J2AabA90LuLYbjXtVXTFffiPLLIKYsv4NKpUaobWliB4JcglOUs/3dMArjLF
         a2SMuWpKzjJjYGhi3MS21pLC0SK8FSTVs/2tsI9xw9RVHHtvV2EpREh28ZC7JlSTxoUS
         pZU1vtgaoFWhxboxrK6Q2CWSX9pCYzamQYMBR2hQOT7RbcZ0mQonz9KdNMiZS3W3C34I
         pzaFVwDHGPYKrwBg3t8rsRah+HS5zAiD/GzF3Un+RwYMj8rly5BZyxE8Jsntfb/WIHVw
         aEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW43vSQOHBlrAEbtFin2I/Tw7UVItfOIews4ZPtSmDghCcKdN+xQjByR+9ggf8KHOvmx1NBARD1HM0C8j9ol8jbjtcrIypon+c=
X-Gm-Message-State: AOJu0YzDNPn3ENAONnVHkkcBdk08nDMUxADF0DWvyV+KvpNBWu8s3cgl
	ouVaMMMqIDlLNb+UIyA3cUlz6wj9bc+eoFjtVTzLynQm1KMIuVdc
X-Google-Smtp-Source: AGHT+IHau1QP+QER+BhNbYRjwpexZyV9kw4kLmibA11HZHIoAFd/J+EJOM3PS5pH/y+83Y1YTec3sQ==
X-Received: by 2002:a05:6a00:1142:b0:6e7:1b3d:4dbf with SMTP id b2-20020a056a00114200b006e71b3d4dbfmr1808324pfm.2.1711095150423;
        Fri, 22 Mar 2024 01:12:30 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s128-20020a625e86000000b006e749161d40sm1132564pfb.113.2024.03.22.01.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 01:12:30 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Fri, 22 Mar 2024 16:11:57 +0800
Message-Id: <20240322081158.4106326-2-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 23 Mar 2024 11:26:13 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, Rob Herring <robh@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

Add bindings for the Nuvoton NCT7363Y Fan Controller

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 .../bindings/hwmon/nuvoton,nct7363.yaml       | 66 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
new file mode 100644
index 000000000000..c1e5dedc2f6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton NCT7363Y Hardware Monitoring IC
+
+maintainers:
+  - Ban Feng <kcfeng0@nuvoton.com>
+
+description: |
+  The NCT7363Y is a fan controller which provides up to 16 independent
+  FAN input monitors, and up to 16 independent PWM outputs with SMBus interface.
+
+  Datasheets: Available from Nuvoton upon request
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7363
+      - nuvoton,nct7362
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+patternProperties:
+  "^fan-[0-9]+$":
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+    required:
+      - pwms
+      - tach-ch
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon: hwmon@22 {
+            compatible = "nuvoton,nct7363";
+            reg = <0x22>;
+            #pwm-cells = <2>;
+
+            fan-0 {
+                pwms = <&hwmon 0 50000>;
+                tach-ch = /bits/ 8 <0x00>;
+            };
+            fan-1 {
+                pwms = <&hwmon 1 50000>;
+                tach-ch = /bits/ 8 <0x01>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index de6a64b248ae..2705e44ffc0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15216,6 +15216,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
 F:	drivers/hwmon/nct6775-i2c.c
 
+NCT7363 HARDWARE MONITOR DRIVER
+M:	Ban Feng <kcfeng0@nuvoton.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
+
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
 S:	Maintained
-- 
2.34.1

