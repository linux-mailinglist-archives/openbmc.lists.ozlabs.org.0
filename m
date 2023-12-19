Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBF819325
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 23:05:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EqLeMzS4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvrN41t85z3cQH
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 09:05:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EqLeMzS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvTdn5SFMz3vjk
	for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 19:00:45 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d3ab37d0d1so11144255ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 00:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702972843; x=1703577643; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOZzSaVaMqP62u8mgxMvUWOQQW2RgidzNjoPhxKi9x4=;
        b=EqLeMzS4TtWRgq0sWeJiOpfrnAJblwHePbheFmvwuVJHXCfqhnDPHMnqvUsegdR4dT
         V5xrYgwiq9NdJGj50dSwVtZ/BVuhmKvXb61bg9MTfnNvmhpLLJvhYSaJsP9DZCtiW69b
         q8taCTDvO/pbzlnnWAkZnZrxzM373oicKKTDTCtedVT5YR48r13hwyVn8E1cjRiJ2QQt
         I6PkQrb0KyvW8dtOrG5mhcIijIjsuTWCKQVQ2/yDjnCFwTs6zpMvRi8Ru5TUh6nCKzPu
         CXZt43QbHLhx56DfHaew4XfM8CdkPw9n+7BAYHByFnliwE1Ru7Bk2nIalO8C4Jt56oXO
         IbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702972843; x=1703577643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOZzSaVaMqP62u8mgxMvUWOQQW2RgidzNjoPhxKi9x4=;
        b=hcCLbspfNuZ1WYmGro1MsNk92V8bTrZIsRRcXqyM3w3a4QbDJJz4Q+mvdjn6qATJx1
         r+7KEJaiLqWv8DB0/jZvIFEs5aJsMO6SvdeW1O4wA55sdF7QZaDxBfO14Eryc6yo9Tja
         gqbzKbn+hRL8FhFxwdo75ERE44azTYovZ74HBO/iBRgewruRK6lkIxuyIGoMmMHfiqT5
         xta0oNRsxOEtebTWiHknhWK59xNh4BjMxFDccYMbLHDEfETnQGYPcOt8Emkn258afm0t
         KsJaMvoZ42OKbapSzINOlBOmJHqLRUvCEZX4aagsm2v1QktdMoAJVWZDdyC8e2YW5WHz
         AA6Q==
X-Gm-Message-State: AOJu0YxJJkp3maVf+tirEqG6LRrV9Jy0/fp2JDkMeLVpoAx3GaWOZDgd
	O9KTuldooVTbT94MWWIHSwo=
X-Google-Smtp-Source: AGHT+IH0VvfqWms+bmMT/nn3hC6lX6XQ1orzmhbBntVAfT7H3tgAEtsA7iwQmmLCXnbugb3HBZ9FYg==
X-Received: by 2002:a17:902:e5c5:b0:1d0:90bf:cba2 with SMTP id u5-20020a170902e5c500b001d090bfcba2mr10415906plf.73.1702972843261;
        Tue, 19 Dec 2023 00:00:43 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id jl13-20020a170903134d00b001d0b410271fsm20261005plb.218.2023.12.19.00.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 00:00:42 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Tue, 19 Dec 2023 16:00:20 +0800
Message-Id: <20231219080021.2048889-2-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219080021.2048889-1-kcfeng0@nuvoton.com>
References: <20231219080021.2048889-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Dec 2023 09:03:45 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

Adding bindings for the Nuvoton NCT7363Y Fan Controller

Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 .../bindings/hwmon/nuvoton,nct7363.yaml       | 62 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
new file mode 100644
index 000000000000..8928e0757f24
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
@@ -0,0 +1,62 @@
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
+  The NCT7363Y is a Fan controller which provides up to 16 independent
+  FAN input monitors, and up to 16 independent PWM output with SMBus interface.
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,nct7363
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
index 9104430e148e..c4081a45445e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14838,6 +14838,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
 F:	drivers/hwmon/nct6775-i2c.c
 
+NCT736X HARDWARE MONITOR DRIVER
+M:	Ban Feng <kcfeng0@nuvoton.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml
+
 NETDEVSIM
 M:	Jakub Kicinski <kuba@kernel.org>
 S:	Maintained
-- 
2.34.1

