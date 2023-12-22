Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B148224FA
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:52:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=aJIkNmrK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4SmG1bNwz3cRt
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:52:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aJIkNmrK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8wq2ffFz30Pg
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 12:34:35 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5e7f0bf46a2so14746797b3.1
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703208873; x=1703813673; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVgzMXP11LrFfyI5S4+LWhcoLDmSWl1PH5/HxIr6Ztw=;
        b=aJIkNmrKZOOnST2NAUlQD3a+hPjwCriUaOOKuYC2mpAxDLBnd+VRAzn6qbfTCuH0t6
         scT3vrb37TK99LOo/iTNQVXnbj+Ne7efymliB2If6g2AT8oKK2Mb5Llgw7bEGBp9g3oZ
         1zpLFsUfmMpg1HqWqzprMaMUY80xpTmdyffRbUvvjmNe7nuwTAv8gOQjz5JN4S9ePgmV
         jhSTzMOd6HlXFZOJeW/fh5cU9sfILVh2VezjqbOsaPQr5h9SwKD/QqJwuPVJXJJO7gqd
         +8+Rp0VX1Xn7jkFfSfAumyjkOSSIh0z1bHo+KUIXzi7MeGDi4S4Dc4mSiL/lE0kKu5ja
         bylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208873; x=1703813673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVgzMXP11LrFfyI5S4+LWhcoLDmSWl1PH5/HxIr6Ztw=;
        b=dvFIBwofHCD7M4IBonUFGmAlS90R+Y2kWSuw+Y32yzAcBY25yCkkpC6V8fBSgOz2/L
         0d0KB9+42kZ84UVK++ssq0vuPLXWsRuhcOXCTfMN+XYbxiX9wDugM32ZdQh//XS8Olu/
         +qGhgAf45lTF1tGXcSFiI4o28l5W3QlzPR1WC95AUWMe3opk+LatqGLNo5RLcysCEwgW
         MxcyLDYMSR8A4nmHS78O3lZHUyyjopdHD1OVykEdkQ1my9076WzKfYjcF6kNjO6GfI01
         zbOX5ZG9dptj+esISKfys+9Zg15XPir+H52WVGWj79sUXl67u720dJNd8g3cOotod+cZ
         oFFQ==
X-Gm-Message-State: AOJu0YwMmyuRrTD+P6h5ciOS2qSZwUdjHrRGDGTOzcAp0SoeHg7gLioR
	mICe5o7JeLQvWl+PB/SdeHM=
X-Google-Smtp-Source: AGHT+IGJHyrDDghHjMV1+PxgJpumFV+4V/gMc+gpLKGafiPq9YwuKWa6MU4o8e5UaXu8G0QDI/oJzA==
X-Received: by 2002:a81:ad41:0:b0:5d9:1524:e315 with SMTP id l1-20020a81ad41000000b005d91524e315mr654410ywk.17.1703208872997;
        Thu, 21 Dec 2023 17:34:32 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b001d3d8e718c6sm2258634plg.282.2023.12.21.17.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:34:32 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v3 2/3] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Fri, 22 Dec 2023 09:33:51 +0800
Message-Id: <20231222013352.3873689-3-kcfeng0@nuvoton.com>
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

From: Ban Feng <kcfeng0@nuvoton.com>

Adding bindings for the Nuvoton NCT7363Y Fan Controller

Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
---
 .../bindings/hwmon/nuvoton,nct7363.yaml       | 63 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
new file mode 100644
index 000000000000..1a9d9a5d614e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
@@ -0,0 +1,63 @@
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
index 7cef2d2ef8d7..53cfcc629aa1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14837,6 +14837,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
 F:	drivers/hwmon/nct6775-i2c.c
 
+NCT736X HARDWARE MONITOR DRIVER
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

