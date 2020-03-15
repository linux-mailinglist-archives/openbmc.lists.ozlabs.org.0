Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D853185F93
	for <lists+openbmc@lfdr.de>; Sun, 15 Mar 2020 20:24:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gTrT6rVgzDqS4
	for <lists+openbmc@lfdr.de>; Mon, 16 Mar 2020 06:24:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YLGpToUO; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gTh500TGzDqHk;
 Mon, 16 Mar 2020 06:16:52 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id j20so6889323pll.6;
 Sun, 15 Mar 2020 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QWPsdEuJoivN766vayf9ZE52PL5bRfQfO8yDnpnpf80=;
 b=YLGpToUOVh3x/T3ca5Ku8LUvtlGg/mn9uDKg38pRDzUwGgZXJb8tGa0GGOPvsWFdMf
 mZd5tqxB422axuWgaufL7EmQEjw5RQwVD9s3NzGvyfqMA4krbmIvAClbW2HX3kKJ2JMm
 CVP6iXWti5VDFOYIT2elJBcf8xMrAaIg2ufWPnwKfoXTjUiM/up7rMEJYlidVPjy5UEu
 QyKoKUR06GJ0assWVYuG8pjwzWQ7oMkR5ldrFRSvE4KL3Bfh/aoHmVkvEixds7fQQawa
 rqGIrCK9BOyWlfI61kycfL7SJvjPxBdD7XNhyOwOV4TcJsZIZeobTAKULDIoXyCBZYSi
 pSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QWPsdEuJoivN766vayf9ZE52PL5bRfQfO8yDnpnpf80=;
 b=NnQACv2M51pN1hOK0EjJDjcIpszS7RHmWGAQ7OPjUIgOENRqyGswp2SOn8vEliF3Ng
 HdIy/6mU0KEumJxyo7L3vIWe0vfKh6mq/20/Xi5fOg7xoxShxy8thmyyIT5vA3WJB+oO
 92MAJTJkpM6Thpc5bbSjwy9gG/8FN+9MyOa9YKyCLQgpiiuFTeKN6mMxw0DR5kLZW7yz
 0pVelsHIJ5x0+aRpO+0gcImFjWx3iV5lJpPoOOMuxlgmXJm6MrqQW6EvUpMeL9DQ/Xmh
 A4IM0HZ4IR6ss0di6POKJ9MnEHPhECAQ000zhHfPmwimCtnJiNJONxLQp0Vdlt4FEvy7
 yPBA==
X-Gm-Message-State: ANhLgQ1f8Do/l+XsWLG3RrQAvLgdE1ZI7Xuh07kk/bCDcIn+SWp0/+8y
 b3Tz0vnT+SXjqoxjcTFPqLA=
X-Google-Smtp-Source: ADFU+vvc/zMCOFtXWvlFmafRLLAhKGqwy8p4BQG+HR/PLdDqKpEPagGalL4+6egi+jCXG4xF5oyHvA==
X-Received: by 2002:a17:90b:3742:: with SMTP id
 ne2mr21417380pjb.144.1584299809762; 
 Sun, 15 Mar 2020 12:16:49 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 13sm61431882pgo.13.2020.03.15.12.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 12:16:49 -0700 (PDT)
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
Subject: [PATCH v2 6/6] dt-bindings: usb: document aspeed vhub device
 ID/string properties
Date: Sun, 15 Mar 2020 12:16:32 -0700
Message-Id: <20200315191632.12536-7-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200315191632.12536-1-rentao.bupt@gmail.com>
References: <20200315191632.12536-1-rentao.bupt@gmail.com>
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

Update device tree binding document for aspeed vhub's device IDs and
string properties.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 No change in v2:
   - the patch is added into the series since v2.

 .../bindings/usb/aspeed,usb-vhub.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 06399ba0d9e4..5b2e8d867219 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -52,6 +52,59 @@ properties:
         minimum: 1
         maximum: 21
 
+  vhub-vendor-id:
+    description: vhub Vendor ID
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 65535
+
+  vhub-product-id:
+    description: vhub Product ID
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 65535
+
+  vhub-device-revision:
+    description: vhub Device Revision in binary-coded decimal
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - maximum: 65535
+
+  vhub-strings:
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^string@[0-9a-f]+$':
+        type: object
+        description: string descriptors of the specific language
+
+        properties:
+          reg:
+            maxItems: 1
+            description: 16-bit Language Identifier defined by USB-IF
+
+          manufacturer:
+            description: vhub manufacturer
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/string
+
+          product:
+            description: vhub product name
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/string
+
+          serial-number:
+            description: vhub device serial number
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/string
+
 required:
   - compatible
   - reg
@@ -74,4 +127,19 @@ examples:
             aspeed,vhub-generic-endpoints = <15>;
             pinctrl-names = "default";
             pinctrl-0 = <&pinctrl_usb2ad_default>;
+
+            vhub-vendor-id = <0x1d6b>;
+            vhub-product-id = <0x0107>;
+            vhub-device-revision = <0x0100>;
+            vhub-strings {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                string@0409 {
+                        reg = <0x0409>;
+                        manufacturer = "ASPEED";
+                        product = "USB Virtual Hub";
+                        serial-number = "0000";
+                };
+            };
     };
-- 
2.17.1

