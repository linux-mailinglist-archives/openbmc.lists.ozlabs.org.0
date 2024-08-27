Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052F960C2E
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 15:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtT7t6ctrz3ccL
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 23:35:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724765729;
	cv=none; b=cydmjTkpqc2kcQTP5g4avBHWWL2SpjFaB2HhQSwIjIfdok+xkKRcRy6+iZXFpI4q3JGiWctZ7nYUU4XKp6pOV+tpjIsBjsbQViTdEIf3SoYZFX5bHnaQ4Y+x+iXde2oJzamLE8wlZzyvKPcQAhUXLOFxYU8vs73+OT2vCp89SQozQsbvONGaeYHLgSzvKmucWZf3jYHZVkR12SSm5+XXdKBN4U79IbnhM5lNls6eD7Cz9OM51ZSKY3rRhsM0M6gDbTk7IS+ScPCcOfDMj3huUaE3mnf9yz6+cp9s97JadA0DlBN0R59lY+x1O5HKb8U28ZXjR4M8TsokSy8aJihWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724765729; c=relaxed/relaxed;
	bh=Bsp6Fu2EwmNWI4JUeaL8+uK9d/eheOZNExD2CIqLPZk=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NotSetDelaration; b=lljNGzbsEAiRPoR9UrV0Zmk+N6LqA6Us2FYEy9Hil/ZR8uxdHZhYVvDLnHUdiAZLG6oT4aHu14Kz9HTX++VgxDIbM4/QEZJJf2AajhA11kU3wTrTqW7LTysrjKmUeO/pLVf1rbxQojidrqslkbsAu65CqzIOtGy5POLzGTzCT1B3/ZgeCfRALnFqLJTnIVvUiuA8fLxL7vdYEogPmBIOxaaoPS9JQXzR8YJkG3rIKXtkmAFBS98tsZZxxVzBPP3eAx1AnlSj39ScNTC5RM3yFPiHkVOngT7o6IJn4rK5zXHDKwgXp2FUJKUdo3mdpr0LBuAGvWox3Jej9jAewETlrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtT7b55xxz2yV8
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 23:35:21 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47RDZ7OO032611
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 16:35:07 +0300
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 16:35:06 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 21:35:04 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 27 Aug 2024 21:35:04 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id DE6195F604;
	Tue, 27 Aug 2024 16:35:03 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id DBAA2DC13C0; Tue, 27 Aug 2024 16:35:03 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v3 1/3] dt-bindings: reset: npcm: add clock properties
Date: Tue, 27 Aug 2024 16:34:59 +0300
Message-ID: <20240827133501.3451302-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827133501.3451302-1-tmaimon77@gmail.com>
References: <20240827133501.3451302-1-tmaimon77@gmail.com>
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

