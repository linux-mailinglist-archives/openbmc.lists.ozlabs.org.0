Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D88E9AB9D4
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 01:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XY7771qfFz2yfm
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2024 10:05:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729574973;
	cv=none; b=ehDaFv5UlgQmWDXANrYkW/tc6b2Pl62F/pPR6DS9Q7tEs7YSIwsFAqstYn+KL3/5cvTbOHHVBlDsbHiayB9Zvuttns8nadOUSB1ExP0SxtVPNiOYW/aH2l2SLdoT7aLgcJ7DMOoXbNIOSz3FVYGle+1WQ4uy2NPXnDD0BgYzzkQW6z6tAhIz+yscUkubRCspjtfNJpyUNdKAjrmfWZh9bKCPwHins4kE4HlOyuPYwmjQ/xzMbZXdm74yFCAObabokZ+DWiQIMSeAmT/4oWDhXditkPpbdgdd1l3xVyRahRImQAP45EWS0fTxwfO4rI3YB71wvJBMSDK0E2NlIedWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729574973; c=relaxed/relaxed;
	bh=167i3gL3f9FJHwvcoDI4s7hogxThkzsLXjS2RB6NVLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AILfJ/xAt4jJYReser6TY0GL4ZjK+VkJEltzGg4irmLtV/tCaGxs0/HyhEOUFpsc8xH4VecJjupobvJ2zFJYFkiYAcqg9slWO+AffF9EoKQLM8uDsYBS+Z+3BmPmB1p2T7dR6Yuo3WForVVDPqT61hZWuE+8eHqJxTSwgKpoetRVFS3EB3flTcz/YbUDhuDUj2JCfgV1qqsQMrNkvp9y5RI4B/k68ngcy//8w5Lpukzcwn+ilPXJZ0J2XOe1IvCZNhmxdi2oWb4CPNqG1l06P1u7wksd/G0bRFQpNVb6ul11zUslrMxBEj0IAZSNLVncEfMfVuQrwQJcEb8wuCKjLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0AcG6Il; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0AcG6Il;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXgj75h2Vz2yVT
	for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2024 16:29:31 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71f5208217dso15404b3a.2
        for <openbmc@lists.ozlabs.org>; Mon, 21 Oct 2024 22:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729574969; x=1730179769; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=167i3gL3f9FJHwvcoDI4s7hogxThkzsLXjS2RB6NVLc=;
        b=W0AcG6IlAa7AFOGESzaiu2P4uYCcxWBr4RZgGFfH5VB69wTeXY4wGktNKYv3bEFZY+
         p4NMnoByvZtYsi8mPqHVfsIwc0SPvfjgT4rkkxIpfp5kNCEOlMuYa+E3NT6ot+60F3+/
         haIroLW4DuFnfmbRbssoLyDlaiyiB0D1kbuF+ikrjB4KQSre1kPKBa5nxhAgERxxM4/g
         XsKew8ZnoODW+YeIhZXNosYtQw1yN8VSmECg5lc0xdX1WdED0xRS+PLNU1HRAUcnZOk6
         NorO1i143eHlhn9j9oM1v1VWL/1xeJhbru7IzPCaXAMCavYyGgsnm0GpMVPjM3tlskFM
         pnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729574969; x=1730179769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=167i3gL3f9FJHwvcoDI4s7hogxThkzsLXjS2RB6NVLc=;
        b=n9BlrR/+cEj1KytSuJpH2ceuy/biNN1bS//IpVC6V7t2aiY79LYs7ZFNeEU2cPjN4l
         5Khoy32YZIbzm5BogUtPkuOh74KTvnSV8MIAKclxk5Dlct4E7D9THouw7CyQ7XsqXnx2
         EkzPMlXALRvgencwwZNPgpZi5fe4xzDTm5M+ytUH3yZM+hcdZdorbN7NbOADZ296fMoh
         HoBozFKV5QTCLAAVOJZWPOLsPol9D8zslKsCjXhWTwaVt6jdJhdzGpee8fgUrSSboeOg
         ZW9V41KcznHBaR/3MdORsVAOpBamSQ/3XKgOGsvjPEkoIfmlITm3zQ8TY9zgHQe3NJO8
         3tDA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ+6KkiQzU2cKxi0e+CrdZ/D7nPOJ7kMNUvO3Ort1NaWp+BJ6wXBZhVZZgTKobw3GKDhE3HtIF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzlPALrEGVpagQpUr3Yia/TJjWjgsXQtaxl3VW/xu8AShadZhKM
	X6lxuIB41hagKrs3/Exo400R91PS/okd1cXM/Niwmuv7S6CyZ8Lu
X-Google-Smtp-Source: AGHT+IF3sO4XRfDwYLFySORRia6UR/7WN7FmmQLcNkR/mgPiyBoVArailRvzQoy4IWgGcqg0jyxoFQ==
X-Received: by 2002:a05:6a00:3917:b0:71e:7ab6:8ea6 with SMTP id d2e1a72fcca58-71ea3354b33mr18248374b3a.25.1729574968932;
        Mon, 21 Oct 2024 22:29:28 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec141505bsm3845846b3a.219.2024.10.21.22.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 22:29:28 -0700 (PDT)
From: baneric926@gmail.com
X-Google-Original-From: kcfeng0@nuvoton.com
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
Date: Tue, 22 Oct 2024 13:29:04 +0800
Message-Id: <20241022052905.4062682-2-kcfeng0@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 23 Oct 2024 10:05:01 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, kcfeng0@nuvoton.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ban Feng <kcfeng0@nuvoton.com>

Add bindings for the Nuvoton NCT7363Y Fan Controller

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
index e9659a5a7fb3..86a65a7d9721 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15882,6 +15882,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
 F:	drivers/hwmon/nct6775-i2c.c
 
+NCT7363 HARDWARE MONITOR DRIVER
+M:	Ban Feng <kcfeng0@nuvoton.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
+
 NETCONSOLE
 M:	Breno Leitao <leitao@debian.org>
 S:	Maintained
-- 
2.34.1

