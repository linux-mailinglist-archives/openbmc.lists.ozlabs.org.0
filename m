Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903492B8F6
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 14:02:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UvsCA02h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJKPJ5Ktnz3cBK
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 22:02:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UvsCA02h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJKMW4KRjz3bbW
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jul 2024 22:01:11 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fb457b53c8so31935615ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2024 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720526465; x=1721131265; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXQBxijXm1PNNJ1n+aKqHfIBNXlZeHsIPayLSHZfeTY=;
        b=UvsCA02hyJb09la4AXzy9edX/rRcoVPkXQqgbCPlDh2HUfWBkjxKs1yx6ktrMrRjXP
         niCyhOFulQI3Xfuv9bR7D/eoCUFoDou+xnzlNSwEEF5n+itQCBiuEM7NTNFlAqBYUa2f
         HTyaglrd+MCT6vJNpa1TRRIJFL2eQqKoDAyvvdZKdra8/m1u+3R/8y/O47A+44sibrd5
         ZTh8mYW2MV61Axs1y1msPgRxGVjE5D021T43MxGKdamlrb59GAXxzuGMO/NPxtYVOlcU
         swyv2mAM7PMF1+X6fNYVaymlBrsswXSs8lIHMvhta8q4HYI3iSRgS1iB+otOu5X8YIQf
         5w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720526465; x=1721131265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXQBxijXm1PNNJ1n+aKqHfIBNXlZeHsIPayLSHZfeTY=;
        b=umXIAKcInSgYarXv7JqSX5k0i7B/O5oiyfN+4Q9G6zCM1ED+F5sFCMKQf8+xINQpbJ
         oUoJm531Na3XZN8H3AptkyH+fT+cttsxM190pobKza7SXJ2pX9Ijwyibs7BvbzNm1uE8
         fTc5j6Y017nLiQjILvSPnxwGdlOvikIqdOdCI3Wjcje2c4/ArthGLIl4StomLF3gsbI9
         fGu8ob9ukXDA+iJUZm91XPpJ8DN0Y6Kew1lpotIIkuiqCFYxv803bJ6HxXaKzJlq8LcN
         aoR0n1zkmxa0cBNjs+4gbI51lsaQoxJDWnveC7Jso/hEwyB/EPM8zr0hn2T+qrAxQTC4
         JNAg==
X-Gm-Message-State: AOJu0Yx2SRUeHvytdtoD4mGpa37jpHqeiK5YzOZfgDCPfCks6r98nO1M
	s8sdrqogbbxpMp2nzCApZhXJgBCU1Dmhni4g5+fNoFqdUwKLVCp74V0RYfiR
X-Google-Smtp-Source: AGHT+IESKhPq40nWKlthH0Prc/OaNi1uAXBqGoLFXKglJdRD14p7d/zm12xeHE2rxC1dM0raRgoWmQ==
X-Received: by 2002:a17:902:f541:b0:1fb:1faa:96af with SMTP id d9443c01a7336-1fbb6ee18d5mr17843295ad.43.1720526464748;
        Tue, 09 Jul 2024 05:01:04 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6acf780sm14495165ad.252.2024.07.09.05.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:01:04 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
Date: Tue,  9 Jul 2024 19:58:54 +0800
Message-Id: <20240709115855.17623-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240709115855.17623-1-potin.lai.pt@gmail.com>
References: <20240709115855.17623-1-potin.lai.pt@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>

Add a device tree bindings for ltc4286 device.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/hwmon/lltc,ltc4286.yaml          | 50 +++++++++++++++++++
 MAINTAINERS                                   | 10 ++++
 2 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
new file mode 100644
index 0000000000000..98ca163d34868
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LTC4286 power monitors
+
+maintainers:
+  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+
+properties:
+  compatible:
+    enum:
+      - lltc,ltc4286
+      - lltc,ltc4287
+
+  reg:
+    maxItems: 1
+
+  adi,vrange-low-enable:
+    description:
+      This property is a bool parameter to represent the
+      voltage range is 25.6 volts or 102.4 volts for this chip.
+      The default is 102.4 volts.
+    type: boolean
+
+  shunt-resistor-micro-ohms:
+    description:
+      Resistor value micro-ohms.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-monitor@40 {
+            compatible = "lltc,ltc4286";
+            reg = <0x40>;
+            adi,vrange-low-enable;
+            shunt-resistor-micro-ohms = <300>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ad588e67f140..693d4c2ef6636 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12494,6 +12494,16 @@ S:	Maintained
 F:	Documentation/hwmon/ltc4261.rst
 F:	drivers/hwmon/ltc4261.c
 
+LTC4286 HARDWARE MONITOR DRIVER
+M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
+F:	Documentation/devicetree/bindings/hwmon/ltc4286.rst
+F:	drivers/hwmon/pmbus/Kconfig
+F:	drivers/hwmon/pmbus/Makefile
+F:	drivers/hwmon/pmbus/ltc4286.c
+
 LTC4306 I2C MULTIPLEXER DRIVER
 M:	Michael Hennerich <michael.hennerich@analog.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.31.1

