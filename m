Return-Path: <openbmc+bounces-990-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2645CB52CD
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:47:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRL0R6Yz2yKp;
	Thu, 11 Dec 2025 19:46:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442813;
	cv=none; b=YRvOWH/uC/8iWqw0oUYdD8kuZ3UpToSxuroOn3MFxziq+U5Of37QnfXc7v1rIFl/M/gFvFH0/tmCjh2YgaJCKnDsiQ8VxQfvbhbsN5zmUlLQedpqkqlMntWJzjAX3+KwU/XJA0Vupqqb4hWTQYbcUNpQDJl/GW2b7lIuvEnRSP151GFEP++FOEtJThuBSzh6d8YhoE+es1/fTWpGCWQibnef+0h6FSsOeYcGK8nhXvbJsIhmeslD2r1+hhzqa45GTZeYs9/vDn6nPClOFcfNgXcSPeFYyiq63ogG9SYTl1N0S8pQwKqr/DQ+3Iya1NGqXHLAfviCxXm6H4epxOW1oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442813; c=relaxed/relaxed;
	bh=tp+xzlgYB5DRkmyHW/VuZG10lptnHgB70xDH+2/3gdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jFR8FloyM7HvKaSktpCJQmIVpKPd6kJ6eQkI8AYh4pePFyZKhveqVgdMG/C9LgMznlKjhGHIk7wlWAQeU5RIyNwkEsvqAsFTXl35JkUbItbGTxHQ5CV3GUPnkmBHI+VlHBOypcdCss+MO+LhPRwyNLri3xj3saYbXkF7RPD53HYIa2C2tVsOVtujpmsbQG0I/aUg+JKKTVpCBqQt30AokNvFvy0mEJyajiS4uFLl4IXUIERpDVvmo/N5oWacNX6z3HvYHx7pmeULr8qFuegKkjxbykh5Brd0vodv06ObcrSEHOIxkM9I3j6uBFdJe0gXe3C0wpDO2cDUVlKCC+rhpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=duP9PMvK; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=duP9PMvK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRK3QGxz2yK7;
	Thu, 11 Dec 2025 19:46:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442813;
	bh=tp+xzlgYB5DRkmyHW/VuZG10lptnHgB70xDH+2/3gdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=duP9PMvK5GwXWyss9okc3SXr+1TPANiqlHeKr1pIcDNebI76EnIRJoe1HinIal1sI
	 7qjvvNw/7Amqs0F2nXOEfHVXufshRdqFWffjz8KfKSGPPfYr6xjiLJnLxcOS/uRrWq
	 suwou0ffSYhYm+9pkLElVuzPCBcuIAmVaBO7j+vCKgTPmlBjMZYhDDHlV9GxgdK69c
	 LW+LfzvrgNnazyvAtd0vJBGxdouZj1sImF0bg0/LVRh2dlVt/wqheIZfPhwNWBD7SX
	 a3G1Z0IP1XspE4UlxZw6EBVtECvtAfCtFc5frTpqgeyZojhjYHKQjBDV+U/krni48E
	 kGJNsTsn5N3dw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 018157D6B0;
	Thu, 11 Dec 2025 16:46:47 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:47 +0900
Subject: [PATCH RFC 05/16] ARM: dts: aspeed: Remove unspecified LPC host
 controller node
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
Message-Id: <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
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

For the AST2500 the node was used for pinctrl purposes, and while the
hardware capability is also present in the AST2400 and AST2600, the
their pinctrl no relationship to it. Further, there's no corresponding
binding, remove the node for now to
eliminate the warnings.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 5 -----
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 6 ------
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 5 -----
 3 files changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index c3d4d916c69b..c0a4057fa53f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -376,11 +376,6 @@ lpc_snoop: lpc-snoop@90 {
 					status = "disabled";
 				};
 
-				lhc: lhc@a0 {
-					compatible = "aspeed,ast2400-lhc";
-					reg = <0xa0 0x24 0xc8 0x8>;
-				};
-
 				lpc_reset: reset-controller@98 {
 					compatible = "aspeed,ast2400-lpc-reset";
 					reg = <0x98 0x4>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 1456f04c2139..086c40fd12b8 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -504,12 +504,6 @@ uart_routing: uart-routing@9c {
 					status = "disabled";
 				};
 
-				lhc: lhc@a0 {
-					compatible = "aspeed,ast2500-lhc";
-					reg = <0xa0 0x24 0xc8 0x8>;
-				};
-
-
 				ibt: ibt@140 {
 					compatible = "aspeed,ast2500-ibt-bmc";
 					reg = <0x140 0x18>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index f8662c8ac089..1ae816087f6b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -624,11 +624,6 @@ lpc_snoop: lpc-snoop@80 {
 					status = "disabled";
 				};
 
-				lhc: lhc@a0 {
-					compatible = "aspeed,ast2600-lhc";
-					reg = <0xa0 0x24 0xc8 0x8>;
-				};
-
 				lpc_reset: reset-controller@98 {
 					compatible = "aspeed,ast2600-lpc-reset";
 					reg = <0x98 0x4>;

-- 
2.47.3


