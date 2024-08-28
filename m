Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB3C96284E
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 15:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wv4Y075dgz3cVM
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2024 23:11:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724850653;
	cv=none; b=WqmGDzVNm7iy+57r8HeZikUjBBk7+O6cG0xMn9U3qIfdy9mbQ04iR2Is/nTf4NpfcV+06+2qaJfFIL9tqSeL6dryy77JwpT82rhDnSxZ97hnYJUMb6MRG9KKfskxHvH60DYXfkzyWPwUrFznb0GGVC4joCcbICK2dxPI2vI5lvd+h2v7koEBigQagFHS9PbQ2lF2+y1+GWpJxkntYpHuqCi8XaBtwmGFF+8xNQPw/r+67c9t2L6QjRn82G1x77XaZNE2l1aqC+76ZbCJXlCtJr+Rs5zEHLiaKZoT5QZSnDf4WCCfgZLNK2g7X2Dj/xOyLqOjB+oA1Z2EmiOv5nndRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724850653; c=relaxed/relaxed;
	bh=Bsp6Fu2EwmNWI4JUeaL8+uK9d/eheOZNExD2CIqLPZk=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NotSetDelaration; b=C7glUzcB1k1dmNIgbXN8SDQSRZfgImtqNe9S8wq/8e146vV/xcze8kPcyLjYp4MDlvntDAs9HvheRdkA2gqHh/6Xnqvzo77QZnbD9xYQl3cDGLwqVYRbQmTvk4Fwwv+jeKP95OTzaZalzHTwom5+cQqvkHyMmNpulVvfFh8/yRgqjxZaS4/doy1pT0BDDPHsYRCU7WfOx+GcxNYM6Heom1p9THiaRoqWpVHi6ZPDmmSjQ7IQz83QjrLR4TjustnyrucfA3rsWUdV29wSre8HYPzCfECUKvSCroPndzivQlev9BItzyXiAIDCh0I45UmxzxWyhEEn5wb6VTuOZStAXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wv4Xl2yL8z2yhP
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 23:10:44 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47SDAZ3Q029383
	for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2024 16:10:35 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 16:10:34 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 21:10:32 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 Aug 2024 21:10:32 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 9108B5F613;
	Wed, 28 Aug 2024 16:10:31 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 8F25DDC11B1; Wed, 28 Aug 2024 16:10:31 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v4 1/3] dt-bindings: reset: npcm: add clock properties
Date: Wed, 28 Aug 2024 16:10:27 +0300
Message-ID: <20240828131029.3720213-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828131029.3720213-1-tmaimon77@gmail.com>
References: <20240828131029.3720213-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: Rob Herring <robh@kernel.org>, Joel Stanley <joel@jms.id.au>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds a 25MHz reference clock and clock-cell properties to
the NPCM reset document. The addition is necessitated by the integration
of the NPCM8xx clock auxiliary bus device into the NPCM reset driver.

The inclusion of the NPCM8xx clock properties in the reset document is
crucial as the reset block also serves as a clock provider for the
NPCM8xx clock. This enhancement is intended to facilitate the use of the
NPCM8xx clock driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/nuvoton,npcm750-reset.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
index d82e65e37cc0..72523f1bbc18 100644
--- a/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/nuvoton,npcm750-reset.yaml
@@ -21,6 +21,13 @@ properties:
   '#reset-cells':
     const: 2
 
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    items:
+      - description: specify external 25MHz reference clock.
+
   nuvoton,sysgcr:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: a phandle to access GCR registers.
@@ -39,6 +46,17 @@ required:
   - '#reset-cells'
   - nuvoton,sysgcr
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - nuvoton,npcm845-reset
+then:
+  required:
+    - '#clock-cells'
+    - clocks
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

