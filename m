Return-Path: <openbmc+bounces-995-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE0CB532A
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRs70Dkz2ySq;
	Thu, 11 Dec 2025 19:47:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442841;
	cv=none; b=k8vJIVP6JAzXAYBwHGBfD/xu1wcrQo9H6B95w1SVY6YqKdebEld1brHTW+S3PRJ3s8vIgoR9CCzBg7q0mVWkAb1iPhwYWaND4GzPbONi513SH9WChWgP4PGJD8oy+J+fEzpjLxNzW1KC4k+ZzNoj3mwu9fA7YzuiwPi1C1Fu3oSrq4fDG6TSQrUSnEqvjJm3Kn6r4p08PW0spEb3gmT02MftS120w7tBwQnc97cJ1NQLDOP+nlIPNQtbmC83tfPoW2ecLG2UHrqm08lYapqUcm9vfF8KOQb05Ao7brGfuWPlv35Hj+eqfz8Abc0aFGGcshG/NEpFuNaiudxtVwjt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442841; c=relaxed/relaxed;
	bh=scUXHBA8U36RhFOiHgBOHOnbtB8kt5qA5NvPIcX39Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnfPZyOuopQWewt6jyxNY/Afo8SWgrzEOu/zp6z7daE9o4PLFK9X0fs71tchgt8RHd3pFO8A6ZRma6Fl6w0VMARdZg15ZXBCOUGBKF7+/T0qJ4FRuUN4p2xzBXS3eP26fRjw2MeGAZCNHn4BlN3tcjJPuQLBsIfQWazoNNVB2pSTsGxX2k48vFwjExRONJ/wbu1WOW0jeboAv0hhxY7xHt0K+jFyk8UvqMjder15kSRR8M8x4HPGZniQ5CXB3ZFzghIIZyMpmlxM0LuBcWJA9AIu/EJLPsGfpcu0O7nQXcVq4/H5CDy6pwmImsGSzYaRL1ABdZZIxhyEWNjeZv/rOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Kbl6jMAR; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Kbl6jMAR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRs3PCKz2ySb;
	Thu, 11 Dec 2025 19:47:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442840;
	bh=scUXHBA8U36RhFOiHgBOHOnbtB8kt5qA5NvPIcX39Ts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Kbl6jMARUYr9p3EhuRIx7DFr993blzu2iTSvxCBzC3fcoeeUKB+9dEEGIjvFgrC0o
	 699wvbd4O/UbmujPS7oflU1iFRhNWEToKfk+Vp1mY6yY6s5tL5XTf61LjTW49Imt0d
	 /e7f2n+Si4v0YguWCG1wYgpyRyFqcsGg5Dn/1LI1qMteB5gDQn5X9mZUpno7EACIu2
	 gd5EueGuo8iBbwcEkaEjWHim/XQb9BiSKFABt992wnwtnry/uL81BXUNwibzSeVP9s
	 jGZvAtr7yYywK4Yy+6GvHqtljVdtsLA/M/Xcd+M1mKP2OtgSBYKPCGP25M89RjZotV
	 Zz+JFpjGUR8kg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 24FF57D6BB;
	Thu, 11 Dec 2025 16:47:15 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:52 +0900
Subject: [PATCH RFC 10/16] dt-bindings: crypto: Document aspeed,ahbc
 property for Aspeed ACRY
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
Message-Id: <20251211-dev-dt-warnings-all-v1-10-21b18b9ada77@codeconstruct.com.au>
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

The g6 DTSI already provides the property and the driver errors out if
the AHB controller's syscon can't be located, so define the property and
mark it as required.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
index b18f178aac06..0dac6ee5043e 100644
--- a/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
+++ b/Documentation/devicetree/bindings/crypto/aspeed,ast2600-acry.yaml
@@ -30,11 +30,17 @@ properties:
   interrupts:
     maxItems: 1
 
+  aspeed,ahbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the AHB controller node, which must be a syscon
+
 required:
   - compatible
   - reg
   - clocks
   - interrupts
+  - aspeed,ahbc
 
 additionalProperties: false
 
@@ -46,4 +52,5 @@ examples:
         reg = <0x1e6fa000 0x400>, <0x1e710000 0x1800>;
         interrupts = <160>;
         clocks = <&syscon ASPEED_CLK_GATE_RSACLK>;
+        aspeed,ahbc = <&ahbc>;
     };

-- 
2.47.3


