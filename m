Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AAA172C1F
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 00:15:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T7n34WWPzDqLX
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 10:15:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bO5AUqx1; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T7Yj6YMtzDr7m;
 Fri, 28 Feb 2020 10:05:29 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p11so409793plq.10;
 Thu, 27 Feb 2020 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FOie+PWiSZiMJEo9veE/haA09vAP/gyvQzP/mDUUeLo=;
 b=bO5AUqx1exL98VPqoOr9m2rBzqwx+JG6jnpcqWyILDxgpHRf9ZyyeJMEyJ9U1ayxHn
 9juw1tR+uimsqKeNkLWZuoxdjCnRpdAjgKZfrwPUgSd+sxyGs9W67TF9JHGJgL//k3e+
 i6kdkjOemNfRQI0DiVYX0rtXpXnRdhkChqzzyZQjz+Oa4TfRtJ05kgvekhiUc8x5n4Rf
 Rqckjln5HiyBQJ66PntsPedMg052N+nOwUDKD1ormFdLCA3PxkXbNymHnJOmuxF7mNit
 JKAN2R4bzJqsRyGmZ3366Dy0WF9zIUmbqXuEVJd5eQ7OHKECLEktI90Rd1v/zXQQHffG
 TUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FOie+PWiSZiMJEo9veE/haA09vAP/gyvQzP/mDUUeLo=;
 b=m5nxGKKcfFWgT1jTSD+1oKdhEdm0XsEj+2yr4blSypKCfCrjCI13hommB+cMd6LGnF
 30LdCdpWfM8aKu3LvVKrUJ2ocXA76ty1NLMNZLQ46r6iouEFdIb9bA+wbvCmB9ThnRbw
 q09WsGYfAWocV1jT9fyxL59TFqpxQiludrPAsrXZxW9geqzbnFYGTCtnK4QkAFazWJEt
 sGzgeMsn6VmFLsV0Bap74YFGD6MhvCqn+a8awH2mU+xY/FeC+2O4Rnc1VhTFnBFLcoXz
 nuZQPiEzRhTPZB+ZRRH0kLWn1nfcwT6ns3C3WEFgYMj+XLVtSG0eJ72VVHgCXoEXy2QD
 UBxw==
X-Gm-Message-State: APjAAAW1vn2K5Lov1VsmCQTROEViaeWbdYy9uRmm/kSCuBWgIj2XVcZm
 Cqm9MFJq5PkhsFQTNxDpAJg=
X-Google-Smtp-Source: APXvYqxiM0Y8rvFyRXJfym2JxQVAYv9iF3d+OIytDy03RQI9STBUoMnSgqGcf++mM8Q/F4ywJd9n0Q==
X-Received: by 2002:a17:902:6504:: with SMTP id
 b4mr1072914plk.291.1582844727819; 
 Thu, 27 Feb 2020 15:05:27 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id w2sm8275975pfw.43.2020.02.27.15.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 15:05:27 -0800 (PST)
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
Subject: [PATCH v5 7/7] dt-bindings: usb: add documentation for aspeed usb-vhub
Date: Thu, 27 Feb 2020 15:05:07 -0800
Message-Id: <20200227230507.8682-8-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227230507.8682-1-rentao.bupt@gmail.com>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
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
 Changes in v5:
   - updated maintainer to Ben.
   - refined patch description per Joel's suggestion.
 No change in v2/v3/v4:
   - the patch is added to the patch series since v4.

 .../bindings/usb/aspeed,usb-vhub.yaml         | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
new file mode 100644
index 000000000000..b8b1700c2423
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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
+    description: Common configuration registers
+
+  clocks:
+    maxItems: 1
+    description: The Virtual Hub Controller clock gate
+
+  interrupts:
+    maxItems: 1
+
+  aspeed,vhub-downstream-ports:
+    description: Number of downstream ports supported by the Virtual Hub
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  aspeed,vhub-generic-endpoints:
+    description: Number of generic endpoints supported by the Virtual Hub
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
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
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_usb2ad_default>;
+    };
-- 
2.17.1

