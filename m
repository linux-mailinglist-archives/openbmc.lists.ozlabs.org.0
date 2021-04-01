Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 863CD350B77
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 02:58:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9lDv3yNQz3btg
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 11:58:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Qw0d/+b7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Qw0d/+b7; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9lCf4Gkwz309y;
 Thu,  1 Apr 2021 11:57:50 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3B062ADE;
 Wed, 31 Mar 2021 17:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617238669;
 bh=VeSdxtND3tSvk8Zkgif2XWXT/Is3+dLyTKL7yc7Qvoc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qw0d/+b7JOOOzLuE0outZCZECFMgfxfVMs0LradvxSyvSqCYckRGnvUOytFASHby/
 nvFgoetdI4403Wy/K+GX26I48WvL7XsyEeMTRwGdzn23gHUEQkepDyi28Oc/cxXZev
 Wv5fooTglZjs1VKGHJbGL3pTqaRMuSbkpFNFuSyE=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 3/3] dt-bindings: serial: 8250: add aspeed, sirq-active-high
Date: Wed, 31 Mar 2021 19:57:02 -0500
Message-Id: <20210401005702.28271-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401005702.28271-1-zev@bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
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

This provides a simpler, more direct alternative to the deprecated
aspeed,sirq-polarity-sense property for indicating the polarity of
the Aspeed VUART's SIRQ line.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 491b9297432d..e79bb6ab9d2c 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -12,8 +12,9 @@ maintainers:
 allOf:
   - $ref: /schemas/serial.yaml#
   - if:
-      required:
-        - aspeed,sirq-polarity-sense
+      anyOf:
+        - required: [ aspeed,sirq-active-high ]
+        - required: [ aspeed,sirq-polarity-sense ]
     then:
       properties:
         compatible:
@@ -190,6 +191,12 @@ properties:
       applicable to aspeed,ast2500-vuart.
     deprecated: true
 
+  aspeed,sirq-active-high:
+    type: boolean
+    description: |
+      Set to indicate that the SIRQ polarity is active-high (default
+      is active-low).  Only applicable to aspeed,ast2500-vuart.
+
 required:
   - reg
   - interrupts
@@ -228,7 +235,7 @@ examples:
         interrupts = <8>;
         clocks = <&syscon ASPEED_CLK_APB>;
         no-loopback-test;
-        aspeed,sirq-polarity-sense = <&syscon 0x70 25>;
+        aspeed,sirq-active-high;
     };
 
 ...
-- 
2.31.1

