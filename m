Return-Path: <openbmc+bounces-994-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58208CB5312
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRm38T8z2yRM;
	Thu, 11 Dec 2025 19:47:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442836;
	cv=none; b=ZaBEI7NPJ4G34Hb12k3eNhilGLXU9WjMzyx8lcezEptSrubLYLJo96kEKPVmyq+6FGYp3OHd+JBo1dlZo+dwdovvrcEAeiPq1ZhKF9MPYHlU7dTvv7k/SKyg4wLDhIi5JDNuvajiIb29t6fERmYscC36AkCGc6+NvIjmXqDha/SFHk1Z7bDRv37VMQY3l9gH011O/muns0aNYLusWM/qxE9Nfk1KK4GbVUwUqDLf3w0gO/sSDbJQDYYFQq4/5dr4DFVLauZQHM3aHvk49JpB8H08V82KguQxKgjNts4UGHrEvj8wIqLW40DnNFNPHS+9VSk27HU7QI9Ga1PIFLsXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442836; c=relaxed/relaxed;
	bh=rj6Ys4VgfF3wMgOB5TKYV5h47MurR6kyE683c2NwUxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eP3hKLPCGprgnvefYrM7tRJX+2fvK+NlnGVkNat8HQgDxSAUaE4/Yg4GMoZZh1cLBKKysyi/FiOq0NgVS3PGbZ1OMYesSft7TsejqijqhbE2agNTpPh2MCEp0vZGDtqhcc29eG21JtiL0p0m7it9ibH/57ctaXV5dxaaHe6AYp8uhU82dmQH+NPbj0pFTO20ipw2YY7TxfLhHqNkM7U0n6r99JrlKaID0B29XG6yZgo37/mKdKLLlqtpIMUsAdBqO1ENTYzD26tQviexJIDIQ7zj7OZSVQ2GGxs4e0LDNRlrwT0G2NUwv03Y6afyKDLxygttG92znvfDuooUp/uMUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R43nVcAK; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R43nVcAK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRm03vGz2yCL;
	Thu, 11 Dec 2025 19:47:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442835;
	bh=rj6Ys4VgfF3wMgOB5TKYV5h47MurR6kyE683c2NwUxE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R43nVcAKmIKmxxY1afGyp9269WBa1/8ZZKA+sg0CL2QCovXOLQQNNbE9YrcjlFRI8
	 B9pl3odOOTH1Uj0p5s9Xl8amMl4qDAiIdyw29hJ3y7b+G9guO5eBvwcgnhL1Xnufku
	 AYVFDK/A1c/U/b183kKSt7OiPuAs40vEX31hd+s2J5U6kIpKBnJEd0pvNL1FwGwxt0
	 Z52kjXnDZ/iYjw9OXeIDtR2It23x0ZpOxg5eXo6rUbkhybScMIxffFvF27TsmkUTEz
	 xNceCv2Q66+QhHI4Wt30EEKTQ2ly8bvqJeCtdeWZ2QXophArnQLbSX2+v0li5m/+PW
	 ujK2cRoGriX/A==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 839517D6B0;
	Thu, 11 Dec 2025 16:47:10 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:51 +0900
Subject: [PATCH RFC 09/16] dt-bindings: bus: aspeed: Require syscon for
 AST2600 AHB controller
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-dev-dt-warnings-all-v1-9-21b18b9ada77@codeconstruct.com.au>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
In-Reply-To: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-iio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The AST2600's ACRY (eliptic curve and RSA crypto engine) requires access
to configuration exposed by the AHB controller. The devicetree already
describes the AHB controller node as a syscon, so require this in the
binding to satisfy the ACRY relationship.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
index 2894256c976d..77e60b32d52e 100644
--- a/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
+++ b/Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml
@@ -17,8 +17,10 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - aspeed,ast2600-ahbc
+    items:
+      - enum:
+          - aspeed,ast2600-ahbc
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -32,6 +34,6 @@ additionalProperties: false
 examples:
   - |
     ahbc@1e600000 {
-        compatible = "aspeed,ast2600-ahbc";
+        compatible = "aspeed,ast2600-ahbc", "syscon";
         reg = <0x1e600000 0x100>;
     };

-- 
2.47.3


