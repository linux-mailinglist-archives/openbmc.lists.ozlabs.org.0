Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F886A691
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 03:31:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Shhuzuka;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkyyZ6QlHz3d40
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 13:31:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Shhuzuka;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkJwh0xTmz3cBK
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 11:57:08 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d93edfa76dso32119215ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 26 Feb 2024 16:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708995426; x=1709600226; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXi+EZVID4E8b+CXe/Hk7KUMrKmNyfrWhdCErmZSb3c=;
        b=ShhuzukafbstWllRIbJbB3QOyKoxt4Md8psjVBcO1ny1blDMnn0iK3tr9er8xfZdcN
         2LWzpEkaenw13JKIT5PyRoh6Ivy2gPi5L0exxxO1rqCNRNMzR4PGzI6lI9t9ypPDmLxo
         9IRRiYIxwwkxmbPO311DMcPq1FxXjEj+ufw5z2Ok2gErydM/t9JhoFiztsRysAl3F8o7
         RGd6nZRuylxGfgahhYwaOeY+PbIaUSe7oXWkOhjsN5KBF8ekHovzk6m7TIdj1ja1EhQ/
         HSe8cUUMPlApnc++YzeZOWEHDcs1ffNuUdKmMKJw9CpbtFeEAceVjiJq5+ZMBXs2nMeb
         cSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708995426; x=1709600226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXi+EZVID4E8b+CXe/Hk7KUMrKmNyfrWhdCErmZSb3c=;
        b=jiWjntq1e/ffughyL/H7sGhf313MJZ3Q2y2bu6acFGVVS5T/GIaoP+ZZhtqqbU9XCh
         YcZdKx2kwyR7uBxpFFZCQ8I1BhxWNKSTywf3z6QvT2Cf/iPciT+SYWhWvOQwhQqEjwpZ
         HF+GU6BzuQWEMi/geAeojIQkv6Wlr1+p20DVWEG6sW2BdR4ZWwqaPx8TkG+VnlLIpDfJ
         hsNEc12wKjMmld1J6qm2vkrznVr2phQAhDwupxBbVGQPXutmk76hiVYls6evPL3YRJqh
         3WTqmAoript3wZqfm+0kpL8QgLLZutyF+9zvUjKHRQQUEdlECkN+Lri6DdbRrOlSX6da
         DKXw==
X-Forwarded-Encrypted: i=1; AJvYcCXdy0QFwhzPNb4iY0IIkyD3GbZtiXiC/FZxSxdjZMmAFwKYH79Z0gglqugzLN/PUF5W8dGSKLSX82+3ulZntLtIacAe3LtbBec=
X-Gm-Message-State: AOJu0YyhCJfis+OlcQ442Jrfcgt2wlNBC4DzT1gJlejLIvQ9b+SVCEwE
	TWsXAdOChpozkxQvEsx1FWwCr2pbedXtFMaUuC+0/yEJS2ALjxi1
X-Google-Smtp-Source: AGHT+IHDBTU4B4bE7MuqoWsW27RTpEY/9wt/RxmXQVQMaJSAcikh2aYtV708TQUXqUm3AxWoac/KEA==
X-Received: by 2002:a17:902:7786:b0:1dc:cf0:555 with SMTP id o6-20020a170902778600b001dc0cf00555mr8453758pll.10.1708995425703;
        Mon, 26 Feb 2024 16:57:05 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id t12-20020a170902e84c00b001db3361bc1dsm289253plg.102.2024.02.26.16.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:57:05 -0800 (PST)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v4 2/3] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Tue, 27 Feb 2024 08:56:05 +0800
Message-Id: <20240227005606.1107203-3-kcfeng0@nuvoton.com>
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

From: Ban Feng <kcfeng0@nuvoton.com>

Adding bindings for the Nuvoton NCT7363Y Fan Controller

Reviewed-by: Rob Herring <robh@kernel.org>
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
index 2ecaaec6a6bf..7b1efefed7c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15084,6 +15084,12 @@ S:	Maintained
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

