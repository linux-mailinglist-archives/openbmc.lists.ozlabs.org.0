Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B83524B1
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 02:49:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBLzj6DJVz3c2P
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 11:49:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JzRnOyxo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=JzRnOyxo; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBLxP4bxnz3bwk;
 Fri,  2 Apr 2021 11:47:37 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3CEDFAE5;
 Thu,  1 Apr 2021 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617324456;
 bh=mG1Dm2fW2UwoboBnU+wIfFXTMY9ejhypOdNwoGlLiJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JzRnOyxoFrgmrZpc90OW3tWruXxmmEeL2tIVxWU1Qh2TPsVmB03UcdGZFtj+uO+XU
 aViEnKHRLtefBzI7Su5d+tf8B82XRHJAtPz7mV7SaVtIPzYrVqonHoNDHXZ0YRSYQB
 6OPt1iKp1UuYFqOVDPrAFH0O+OJmpGyhd5mWXNJ0=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 4/4] dt-bindings: serial: 8250: add aspeed,
 lpc-address and aspeed, sirq
Date: Thu,  1 Apr 2021 19:47:16 -0500
Message-Id: <20210402004716.15961-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210402004716.15961-1-zev@bewilderbeest.net>
References: <20210402004716.15961-1-zev@bewilderbeest.net>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These correspond to the existing lpc_address, sirq, and sirq_polarity
sysfs attributes; the second element of aspeed,sirq provides a
replacement for the deprecated aspeed,sirq-polarity-sense property.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../devicetree/bindings/serial/8250.yaml      | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 491b9297432d..a6e01f9b745f 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -12,8 +12,13 @@ maintainers:
 allOf:
   - $ref: /schemas/serial.yaml#
   - if:
-      required:
-        - aspeed,sirq-polarity-sense
+      anyOf:
+        - required:
+            - aspeed,lpc-address
+        - required:
+            - aspeed,sirq
+        - required:
+            - aspeed,sirq-polarity-sense
     then:
       properties:
         compatible:
@@ -190,6 +195,20 @@ properties:
       applicable to aspeed,ast2500-vuart.
     deprecated: true
 
+  aspeed,lpc-address:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: |
+      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+
+  aspeed,sirq:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 2
+    maxItems: 2
+    description: |
+      A 2-cell property describing the VUART SIRQ number and SIRQ
+      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
+      applicable to aspeed,ast2500-vuart.
+
 required:
   - reg
   - interrupts
@@ -221,6 +240,7 @@ examples:
     };
   - |
     #include <dt-bindings/clock/aspeed-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
     serial@1e787000 {
         compatible = "aspeed,ast2500-vuart";
         reg = <0x1e787000 0x40>;
@@ -228,7 +248,8 @@ examples:
         interrupts = <8>;
         clocks = <&syscon ASPEED_CLK_APB>;
         no-loopback-test;
-        aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
+        aspeed,lpc-address = <0x3f8>;
+        aspeed,sirq = <4 IRQ_TYPE_LEVEL_LOW>;
     };
 
 ...
-- 
2.31.1

