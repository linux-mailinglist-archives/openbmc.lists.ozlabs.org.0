Return-Path: <openbmc+bounces-1001-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F255BCB5366
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmSV56zZz2yhD;
	Thu, 11 Dec 2025 19:47:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442874;
	cv=none; b=Z/rMnaoBriF8xO48EaoncMq7qkr6Kaurk7QaGzKCyM2dIMVjD2awDkdzFm5Yy1BZC/LTw6j1M6R4h/2M3sEx4w/zxCkhJrCbjUlVOrBAdgDC0C+eXLo9sRTfGufOO3cLRqzxILfl9bUtdsNtESw2rsTcKlfFxFYYt8qXhmLwyOFZsWz4JYf5I90Gztyxot4Jv64lCV5jmN5Zz+x/QTu9yeYsIQO8AFbtSB1P7nQTRRqPEJ+3qs2YWGr3u8pDMC6klWarwD8lHH6iaucvg3vcmx0bHebUIPKICOGftGPw/K6Gn6CJrCX9H+RpMY6VqzK2IGc+4clDiSt2Rr5vSo/ZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442874; c=relaxed/relaxed;
	bh=4YuQt/ViTsd3OTZlMf2fjHbcSpDjnD7vrDHlgaLMC7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejyUisso//pEJ4ICtlnUeBr7iuLLAOD2Ivq38neEbILvROTckS5Isr38GPrJzZSDvOyapTY9nVuvD9+My3fkKWqA8d98Os3yBWetv7piM2JUsIHrDxdilwKuRCobHQaM0GTXDNarBeNLH17CYlmER+ASkFXCH63xw0WK1OCexNGf+usW3nds416JuKUL9F9b9TV8UK8zVm6D8sElRNVj4KG6xgTfS9zx1z3Tyr9wxL9gbjBoSCDiTpVvFbDwBuDRkFhknIMPSqBfhoj57xDRbMvpixWXrmSLNhkbl2btLFG+gZBAVkGDLRW+Kno+ODhn8stJ2NsD0EF9FLaFXReagA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DtLZgl/p; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DtLZgl/p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmSV2qbsz2yFq;
	Thu, 11 Dec 2025 19:47:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442873;
	bh=4YuQt/ViTsd3OTZlMf2fjHbcSpDjnD7vrDHlgaLMC7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DtLZgl/pzLlAKfeYBIFJAGq+mv8J6I5TrFfyrELEqhyHJG09MbGTKdzaI0m92ywHx
	 2MQRN0ioXDZBYRrhbN/rfR6CIR+I47pP4z+Lkvli+gD3eYeV3xdvkokIhn6fZCYShX
	 /L6U0sF/Ht/XcG4wFFgWZVLd3Bzsuwt9SqbdM5VV1leb0cZVX+WWNd/GNHx6Y5hhTu
	 Rjp2LmxLo83y96h8HPz6nVv2bNjBzSpIZgYi48iW0I7y/eETOqkoWOBQOj2Gd2WE4j
	 11CxHJJ9ct6uQO1CIWocS6QRvCseG26HsU4KGYFGemSoCE3BLGBJpCYPr00sOiwKyy
	 R6QQN/Jr1usPA==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 05A557D6BB;
	Thu, 11 Dec 2025 16:47:48 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:58 +0900
Subject: [PATCH RFC 16/16] dt-bindings: mfd: Document smp-memram node for
 AST2600 SCU
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
Message-Id: <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
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

The platform initialisation code for the AST2600 implements the custom
SMP bringup protocol, and searches for the relevant compatible. As a
consequence, define the requisite node and the compatible string, which
in-turn tidies up the dtb check results.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
index da1887d7a8fe..3406b98c4d0b 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
@@ -130,6 +130,24 @@ patternProperties:
           - description: silicon id information registers
           - description: unique chip id registers
 
+  '^smp-memram@[0-9a-f]+$':
+    description: Memory region used for the AST2600's custom SMP bringup protocol
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: "aspeed,ast2600-smpmem"
+
+      reg:
+        description:
+          The SMP memory region
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+
 required:
   - compatible
   - reg

-- 
2.47.3


