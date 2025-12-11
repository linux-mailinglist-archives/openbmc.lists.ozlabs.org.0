Return-Path: <openbmc+bounces-996-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34449CB5330
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRz2rmNz2yFx;
	Thu, 11 Dec 2025 19:47:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442847;
	cv=none; b=IxzMjKM3OBltDFxM/2JukExVJtrVwO/jAn0K8zHBDcNZI5qqPZadYrvSePbOrN4N/WHmFW7Yakmc8Qcan/Obz9xEvqU86p3LjllOuNwpc3+IeVUGEIHcaCg0RgwVrXqhOD0V2qGidH2c/rHTxA3olZawZ8YWyu8ZjlTcAYH0y/rSl0qkQdxDCL4ZZ8H6zHHXB383WwnlPqrNa//e7WLdVNf62/DvNTLeGNzypqoYeuiBprnl/+UBHU7MxA4taRsnGzo+GvFRNC1ob2+5NpvqjWk0KOe0bqR/aOdRDbYgxz0ETYiVC16CL3K65IUINdcgqwtkqR6ilRqAFoGg+Sv5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442847; c=relaxed/relaxed;
	bh=DfE7RBxeKysNsLYVJ2cwyFMHF548EzarJueuQZE4RQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lDl62H0t27WLFHsGCwDhsrWidN+/rsk05Ir7rg/0hmD25nqfzjST50Ln5Y8N1QiV4V4BbFVTeIWUP9CHjo8JPFfWYrIjOKH2Yhmu1Zw8uffnVQpp0LXzYh4vPbM0RxWjoUgrxkiNXpvFDa+cESjtIXgDESq91T3XYUn1BOh2w5OVLVZ4e6Qm4fT1rMHKeaq/79rHuBYIj1crjJVItEyY2Gde8Ww/vPlHpEprUvlIBYhMDIxxzADJMYsQgxB8Apazr02BH6F8s2Rzo1KyySKpPJ7HTWlLS1gf0w2pLHgx8sgtxi0WzInMUYANHTKFy8Jj3vswqQ0gMYjqXiWVBgv0LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RJemCfSd; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=RJemCfSd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRy6rpsz2yDk;
	Thu, 11 Dec 2025 19:47:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442846;
	bh=DfE7RBxeKysNsLYVJ2cwyFMHF548EzarJueuQZE4RQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RJemCfSdq0JXdxkb7HL2R50Lv5PpvyLoZ8fHKRLKyk8aD/UfEDsVm0BfbxMYHJ1Q7
	 UiZAw1YI0JCxH8fMqCfxXFJhqnt0SwO/YNM6bnuH2g+hHRaT86bD9nd4TuhBK5dSBA
	 uYn9mX0CnuoMj7+jtMKJl8Q10shUS6xqmz/1+ULToRO8+7GJtOIupkMCMfoU7hgrVW
	 ZjFPKIIeWlwdMtbMP7D0u6w/zWKS/AgRfVXwuAXJp6w9xF+ugiHBgm1l7at3LMNqG7
	 2o9gNHEPDJO0vII0adr4LWdlc1kI/Xwqru00aTS1k2TZfCxUizynayTdIX3YLJaJ/0
	 6pqGngsMgpuVg==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8D6A87D6B0;
	Thu, 11 Dec 2025 16:47:21 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:53 +0900
Subject: [PATCH RFC 11/16] ARM: dts: aspeed: Drop syscon compatible from
 EDAC in g6 dtsi
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
Message-Id: <20251211-dev-dt-warnings-all-v1-11-21b18b9ada77@codeconstruct.com.au>
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

Its presence is not required by the binding, its addition was not
discussed in commit aac82707fa45 ("ARM: dts: aspeed: Add AST2600 EDAC
into common devicetree"), and its inconsistent with the g4 and g5
dtsis.

Further, the corresponding driver instantiates its own regmap rather
than fetching the syscon regmap, in theory breaking any users of the
syscon, but of which there appear to be none in-tree.

Drop it for now, and we can add it back with the necessary rework if
it's ever required.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 1ae816087f6b..86b30e38fa25 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -74,7 +74,7 @@ timer {
 	};
 
 	edac: sdram@1e6e0000 {
-		compatible = "aspeed,ast2600-sdram-edac", "syscon";
+		compatible = "aspeed,ast2600-sdram-edac";
 		reg = <0x1e6e0000 0x174>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	};

-- 
2.47.3


