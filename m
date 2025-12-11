Return-Path: <openbmc+bounces-992-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2ACB52F1
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRY4g3cz2xrM;
	Thu, 11 Dec 2025 19:47:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442825;
	cv=none; b=Tpzy/4aAAP11f29ddROUj964ERIWYitPC7b70NAWrirBSMiBzKLo+mfvAkrPIqFM9aMUKws4rK4Pt8ETmPWjMvT3hF6n7/wcTPkrrV2Yg4WowV0qQ9ppCibMfpoRuwtUqljl+DBxwgWHJTknidnL9i7AH1elow8bQAeNgRNS6a1jK8bo4BS+fiEulacA63CDvsspYpyB9NEzsldiIh4U9iNQ8+fq8FQjlPlsEgl/knpyYYE9s7fRkXJc5OkOnBBJ/MlELF27wZYPN2otEKHuzyaVm7fT1xVPKFRI9wU9YfRoXHIVbPYMk65rfiOTUmm5G1E0tvKAIM7ROqjGnxdX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442825; c=relaxed/relaxed;
	bh=wKc2i0CrPvuU1yF1mbUmVahRwUdSF7nDlBOZD6lUOdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGTI6oWLHGKJQbJ0BiACL+qP0uif6h8nnWGQLRizGcdsUW8gHLDxJ1ASsnCgzeaPXcO6OhPqtxwV8UgHntu0IeWA/dtC8XCIzaOBdMbj9Z62tW6Je3M80Oq3yVM79LSBkEt6x5Wb9xIkJunyc/y0yO1E7WktlSKKF0PT2ppboGPy3c6684jaBsLVHlyMJlw0rmCC/+PMIxdP6XIWnaliqjoYeSvv3tUiQpPJDpKbHGREqNMburnxk5yMhxEdjn/N5X/EPgIpVJuD3Z5k59r1PpEzSnESyFfi8Nf11MVjojlrqEZFL7Dixp5KkXRVQB6zACasCCdsPc2UjwLbyYFXtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B8t9I1BI; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=B8t9I1BI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRX6rGmz2xLR;
	Thu, 11 Dec 2025 19:47:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442824;
	bh=wKc2i0CrPvuU1yF1mbUmVahRwUdSF7nDlBOZD6lUOdk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B8t9I1BIs5UeAK2qrj6W0cam9GDEz9JQEsllJCfUXrNppjnaHgcRHhW/9sQOYq5Y5
	 Ebhpy5xshRlM30oEfH8+BHfvFLG19aZ98PEloPYo/q9BIbt/YWuDd9UNbUOPY3Ufgf
	 RQs4vTNHdEr+XKoqQF/5SZLFQA36B3Gy8a89R2AhJoXirgahN0C0IjoanRa8wV50pq
	 +Gj9Oy36Q+S4+jRIcknK8OtPGfypeQxD1dBkbHZ2oKjrsey6rUGHSa+OHLwggUKLYG
	 //JetDhyHkm+nCznnAMj+skz8xW533V6aGKRFJQzrd4OmBEiN6NBWEXIdfGYSA5WAq
	 Jw4xesDSSU43g==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7081A7D6B0;
	Thu, 11 Dec 2025 16:46:59 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:49 +0900
Subject: [PATCH RFC 07/16] ARM: dts: aspeed: Remove sdhci-drive-type
 property from AST2600 EVB
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
Message-Id: <20251211-dev-dt-warnings-all-v1-7-21b18b9ada77@codeconstruct.com.au>
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

The property isn't specified in the bindings and is not used by the
corresponding driver, so drop it.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index de83c0eb1d6e..3eba676e57f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -314,7 +314,6 @@ &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
 	max-frequency = <100000000>;
-	sdhci-drive-type = /bits/ 8 <3>;
 	sdhci-caps-mask = <0x7 0x0>;
 	sdhci,wp-inverted;
 	vmmc-supply = <&vcc_sdhci0>;
@@ -326,7 +325,6 @@ &sdhci1 {
 	status = "okay";
 	bus-width = <4>;
 	max-frequency = <100000000>;
-	sdhci-drive-type = /bits/ 8 <3>;
 	sdhci-caps-mask = <0x7 0x0>;
 	sdhci,wp-inverted;
 	vmmc-supply = <&vcc_sdhci1>;

-- 
2.47.3


