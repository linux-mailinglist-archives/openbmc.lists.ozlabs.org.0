Return-Path: <openbmc+bounces-997-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D626ACB5336
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmS50MMQz2yFg;
	Thu, 11 Dec 2025 19:47:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442853;
	cv=none; b=W7/w50CQNYyFWqxUOHEC877Ue++Ph1Q1KrjYrlm7ia6ErsyvZxKqCAz+MCiJA3DaA9Qo/fS4TFDcONPz74JlPMav9OFD5iOX0V5iu4S4rU7s9r50e/h+VrMDEciKgtbgUqdFxdupg5lbCIm9HKvDvhcPFtkVOYAkItQTjAtni4JHuVg+T+IfXgdrGmHjFrgVXUODYLsmrBK65oG/z0nApV/4rlQbpENtKdeJALwuHeqJWwWV38LWwOms3pVUXbvsWvNd9Bfu3LUsfuV1t0tQaF1vCq0irYedehGGp2xZ7SCB1Jc1GoJLDFQNfRaJh6sf24Er/vdvub1/Uu0tT1eheA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442853; c=relaxed/relaxed;
	bh=8PfQPChFD52EYAoiUYy2MTDPMEeHwuPds4q02w/3Uek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G/rRKVlimzRVD9gAo89X9T8d+UQ0BmSH1/3/WmGdy8rFGb4+3qijmBSDIWuHQ89DzNOU18bFQqz0Su7oq/FV1SWM6jaNSC3U9zvtueA4jQKbTnTLXVU3CkhIA5czxJOWokPhrwYeWsfzX2YNJWRVSNZtxZe9Vgf8uiv9e3qQLKYadDSUAwcIoTEyQ0egooxdurNvYFMJYMqKtP/kVPl/pdlj4Wsi7Rfr0rgpGCl8tbsL3UymnyreB2MQqzxjRxdSwAr9eVLZ4aKAg5z+ID0UFPWo7DljlMRZWGoWzOW5aIEXYVCFibarCZbiMaZ+RnmCP/tXhO2DodWvjzC6+pG6sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CkaARP7q; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CkaARP7q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmS44HBdz2yDk;
	Thu, 11 Dec 2025 19:47:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442852;
	bh=8PfQPChFD52EYAoiUYy2MTDPMEeHwuPds4q02w/3Uek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=CkaARP7q2FmBiS7MCWrjA+CSe0QJl56qQarhnVOQmEXNG5vcqit2PYUaIBPtvFfR6
	 ITOJR4pCktJRSIlEmgryphRbHnb2xYBJTxcTNsLb9j5fuI5deRF1y6sfSO7LGuewoq
	 L6196eAJAaLbsmoF0t7LGKbmUtfT/h7j3eS6pR0oDP61d7l4NBgKZoAfwZq/4XSrg3
	 F34Sj+1lOGUEyduANOL8lIOucie7DQJLjzjIGhGyAkdqIf12Wz+jDJQ0JFl0TVQ5fo
	 Xm5env2vkbKE0/3XTSrzBj9GckURcubpBEHdejk/F7aN6RAHt5GNJ0opZwB4ycjrzW
	 u1n1ylv7thhkA==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1AA457D6BB;
	Thu, 11 Dec 2025 16:47:26 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:54 +0900
Subject: [PATCH RFC 12/16] ARM: dts: aspeed: g6: Drop unspecified
 aspeed,ast2600-udma node
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
Message-Id: <20251211-dev-dt-warnings-all-v1-12-21b18b9ada77@codeconstruct.com.au>
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

There's neither a binding defined nor a driver that matches on the
compatible, so drop it from the devicetree until someone is motivated to
solve the problems.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts | 4 ----
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi                   | 9 ---------
 2 files changed, 13 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
index ea1bf6f402bd..2aff21442f11 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dts
@@ -1293,10 +1293,6 @@ &mac3 {
 	use-ncsi;
 };
 
-&udma {
-	status = "okay";
-};
-
 &uart1 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 86b30e38fa25..4583c68748c2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -861,15 +861,6 @@ fsim1: fsi@1e79b100 {
 				interrupt-controller;
 				status = "disabled";
 			};
-
-			udma: dma-controller@1e79e000 {
-				compatible = "aspeed,ast2600-udma";
-				reg = <0x1e79e000 0x1000>;
-				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
-				dma-channels = <28>;
-				#dma-cells = <1>;
-				status = "disabled";
-			};
 		};
 	};
 };

-- 
2.47.3


