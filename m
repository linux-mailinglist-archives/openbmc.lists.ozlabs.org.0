Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4327D176F7F
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 07:33:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WnJV4YRYzDqGL
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 17:33:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gftyhLtY; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wn5p1b5YzDqYV;
 Tue,  3 Mar 2020 17:23:58 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id l8so888507pjy.1;
 Mon, 02 Mar 2020 22:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tPHP3U0sPqM0DsBy+RwsfJsD5yoax7+mg4Fx4kOx2W4=;
 b=gftyhLtY6oe+dn0zlfQ7x0MmGSUQca0tvt55/8WA2xk/vxzdERSYbaaz8E7aT0Yzmc
 Adg+2vx9e5GRvHOpcYixr0DG0yNktt0MCMoVHyibSNWapnAe0mxYH212d3T36PRdmG04
 DKGN0o7KELYMVsglOonaLIMkNWl8dP+ASS+61GpSDm1sxGeS/whvaZB22vzRBodOMLP5
 YT7dZRH3xz+3VZa1OrXjnSdyWzhcxtBElsvXFLKQXVr4GL7YNc6tnUlM3w8vKEzLMXpm
 nKcpSxR/ccgRxRPcSwAQS00famorFheSDrWLOhTjCd/3FqA3fW8HqKuUnu7K10LABHWY
 IyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tPHP3U0sPqM0DsBy+RwsfJsD5yoax7+mg4Fx4kOx2W4=;
 b=qB2Xe7p38CX4YkriTi+lGDt+BPGoEEdah0GcnFUVIZsh/UyjvSk8HqlvGaHV2zkFvO
 g6DyReviLj4KR2vliOYysyZDEWoezTmZec5G7M4Xlu17oY8qW8qZu0cRuSzVXDxvkCpw
 DKSaL2WiyiDR76fpBQaXUzCU8y52/TY7mSBi71zjvtru9XeIMUM306fp1LjAuHWJAvnT
 kRFPlQobix/BTONe3ZTFFc2dN+p6gKyOd+X3TDRxJ5rMIRIcE2q3exiaWivmwICNwDf2
 7jZCkKTXKB63R6WyGvYPi72C0HnVjoDeOaPpmswHfoM1XcZ7NU18QKkchjr5ewTMW6GR
 E2ww==
X-Gm-Message-State: ANhLgQ02ZSdewl6ns/rm7ttjWVVmbZUwpcxtywW+f7SdyusY7pClZvFz
 Eo2UBnymkZdKNJ6dsVCZRC0=
X-Google-Smtp-Source: ADFU+vswS8WZqh3XC80WYcxue2Wxbx8TtqPDEj+caARAlRMTrLaMq4b71T3x6WkBwXt9L3CUtE3sYw==
X-Received: by 2002:a17:90a:9a89:: with SMTP id
 e9mr2411465pjp.116.1583216635621; 
 Mon, 02 Mar 2020 22:23:55 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id k5sm7453526pfp.66.2020.03.02.22.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 22:23:55 -0800 (PST)
From: rentao.bupt@gmail.com
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v7 7/7] dt-bindings: usb: add documentation for aspeed usb-vhub
Date: Mon,  2 Mar 2020 22:23:36 -0800
Message-Id: <20200303062336.7361-8-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303062336.7361-1-rentao.bupt@gmail.com>
References: <20200303062336.7361-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Add device tree binding documentation for the Aspeed USB 2.0 Virtual HUb
Controller.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 Changes in v7:
   - updated to dual license.
   - removed description for "reg" and "clocks" properties.
   - Added constraints (minimum/maximum/default) for vendor specific
     properties.
 Changes in v6:
   - added 2 required properties into example and passed "make
     dt_binding_check".
 Changes in v5:
   - updated maintainer to Ben.
   - refined patch description per Joel's suggestion.
 No change in v2/v3/v4:
   - the patch is added to the patch series since v4.

 .../bindings/usb/aspeed,usb-vhub.yaml         | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
new file mode 100644
index 000000000000..06399ba0d9e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 Facebook Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/aspeed,usb-vhub.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED USB 2.0 Virtual Hub Controller
+
+maintainers:
+  - Benjamin Herrenschmidt <benh@kernel.crashing.org>
+
+description: |+
+  The ASPEED USB 2.0 Virtual Hub Controller implements 1 set of USB Hub
+  register and several sets of Device and Endpoint registers to support
+  the Virtual Hub's downstream USB devices.
+
+  Supported number of devices and endpoints vary depending on hardware
+  revisions. AST2400 and AST2500 Virtual Hub supports 5 downstream devices
+  and 15 generic endpoints, while AST2600 Virtual Hub supports 7 downstream
+  devices and 21 generic endpoints.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2400-usb-vhub
+      - aspeed,ast2500-usb-vhub
+      - aspeed,ast2600-usb-vhub
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  aspeed,vhub-downstream-ports:
+    description: Number of downstream ports supported by the Virtual Hub
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - default: 5
+        minimum: 1
+        maximum: 7
+
+  aspeed,vhub-generic-endpoints:
+    description: Number of generic endpoints supported by the Virtual Hub
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - default: 15
+        minimum: 1
+        maximum: 21
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - aspeed,vhub-downstream-ports
+  - aspeed,vhub-generic-endpoints
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/aspeed-clock.h>
+    vhub: usb-vhub@1e6a0000 {
+            compatible = "aspeed,ast2500-usb-vhub";
+            reg = <0x1e6a0000 0x300>;
+            interrupts = <5>;
+            clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+            aspeed,vhub-downstream-ports = <5>;
+            aspeed,vhub-generic-endpoints = <15>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_usb2ad_default>;
+    };
-- 
2.17.1

