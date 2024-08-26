Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74695EA19
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 09:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wshgp0Jlcz3cXp
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 17:12:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.199.177.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724656316;
	cv=none; b=nq3qwJJAcb8M7QSivLFbO3DyQTV0p6+den7RtymiiGjZaUoCEjTUWTodhwyrvCCXHZGM1CJbvkZYRbpX1gjq/faSPqSsni+bnZDmbFsnUaESP96pSZI5DMeEuEQiVwj6TUm6SrvNAL48PCX7rtHhUrJ1E92+0VbfMS2h/ojKhBy4rOW7mn5HhNfO4tnMe9AEL4v/LQnreeZfFiCJhmDJMzK9wLqMCSYZ+4Q92IDR2DWp2j115/l/VBM5VLiCB23NKpYtQR/LvXnKbp0FOiNwowpg84U8J0VORTGEG5X5DvdEIn+Kqq1vtV9hFZMmnv9RFrYpSF+HG4JnxDHabBs/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724656316; c=relaxed/relaxed;
	bh=Bsp6Fu2EwmNWI4JUeaL8+uK9d/eheOZNExD2CIqLPZk=;
	h=Received:Received:Received:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NotSetDelaration; b=FUWsCFAuRJw6o/G8JaJEtbLaj0yE/cYVE1jLqs6wqepqkQpi0mJ12UE39EkJEWfrHtO54aSABlU1VnADZesANx3vYODgpiPacaHHpdP55i69boMpBH0FAYVCvZ+s7+qsuiYXD4eWOa9gN4Fod6jHq0HeY/X9SM4t41oqP+qCGnC2RCPQ7ATdoGNOrK148SHlCL/LZSTOtxgxNCgWuaaRoX5LTwb4TTo88oIdpmpf0kS1BkvP9UnqkP+YiRRa5i+nAmZ8dtbWcUyb4J5loiuG8RJnSXXpAKYjjtUt2LUS/P4f0M37M5NEWq/AiGPsOCF2TlfP67Tl+GCE6YGnOw7DnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=none (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org) smtp.mailfrom=taln60.nuvoton.co.il
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WshgW1Pklz2y2B
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 17:11:49 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 47Q7BcVJ027581
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 10:11:38 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 10:11:37 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Aug
 2024 15:11:33 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 26 Aug 2024 15:11:33 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 867665F5D4;
	Mon, 26 Aug 2024 10:11:31 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 831E1DC11B1; Mon, 26 Aug 2024 10:11:31 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [linux dev-6.6 v2 1/3] dt-bindings: reset: npcm: add clock properties
Date: Mon, 26 Aug 2024 10:11:26 +0300
Message-ID: <20240826071128.3030154-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826071128.3030154-1-tmaimon77@gmail.com>
References: <20240826071128.3030154-1-tmaimon77@gmail.com>
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

