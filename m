Return-Path: <openbmc+bounces-993-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC5CB5306
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:48:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRf6V3vz2yFW;
	Thu, 11 Dec 2025 19:47:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442830;
	cv=none; b=a2PCkPIDJT559kd95fF500FWXt/pbI5h5pSa6rc6gx22i82BQuN7xjh2CMKBJSusxzkzTWtm1PSGNpeMd90CePAhvWOXkS5Zc5ZFFP9/AtceFAEPhb4Ad0AyRzbCH7O6MuboBJE17FodkJpai2RgVQL7c6DKqdOJyMZbVJFx+Si+jaeP259BNRnD2/d/R4sp+3BZfHQMn/OoWGAAPuRGw6he/FK5Zg2Xp9wCwigAeKBDHzMHnVQhsuwZHkxSXfIH0D+dQWRCWlaWdFBIgWRbHyjt/GzedifeWNvtBToQMwpoqeFoy+vqYtk3/wy1V1TDPJQJuLZ3EchHv7HNpykdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442830; c=relaxed/relaxed;
	bh=QgrHDw2+1vxkomBSkN6qpychebIEg4g+gGr8/vvCI1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BvjSMx3E/2qZkYduPK6/3cY1HWN0iGxtUvatbe0TsAt4kq+9kZhMhCJ4VrsEOEYfUnB34jANcOO+F2KNsEIPb4f75sKO1vG1axq8ygJNgB6oV7JTaSRK5AEUuU5BuwsuEyN0BbCDgFVYiOGyVPyge6KWu2f/0tq9dK57KQATRwqJZWdrNyJGp5yqNol0HvfRTnHxHR9CIyQjYAIz6mNWAiDvrROIf+rnj+dIsnh9MYJ71tvXSr1pujwIj/K91XhQNRLIQuqyTX/aHOQUSrcAd18NY2lSAFzn2Mhdkf1fAf6IXvXuwTDlpuOG6w6ego7+qhKlZZvxc7UAOYlOOPcOrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ORolPD+l; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ORolPD+l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRf3LlCz2xLR;
	Thu, 11 Dec 2025 19:47:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442830;
	bh=QgrHDw2+1vxkomBSkN6qpychebIEg4g+gGr8/vvCI1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ORolPD+lNijN6SbxVyOiH5cJlcepdpMKA94aBXhai5xR8KzOe/a5aWs+SSlO+UGt5
	 JQnbglvjce0z3jI770cy0oO4Q+YU2ze1O9MBqJW8+6g8FPAec1Jx8Akd0feqREU0xj
	 8Yu3HJSBSh+mDPELPzwBjO2xEZrngqzCpDmiETlkVxZxAHRW+X3VFPXxicFf0GnBYX
	 zfc5NMRh7pxU+wfdrDymAVGM4OVnd6GVcJee+tqmxAW8Qlmlv/qB2YKdfH8NRpNVP4
	 1rkMu4ZfsFzZZPNl4eQvexVUNemUemdoJrIxCrBXF2f0NT7wqzf3HC/FUuZEpXMVbu
	 iyiDKfemDBe1g==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1669D7D6BB;
	Thu, 11 Dec 2025 16:47:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:50 +0900
Subject: [PATCH RFC 08/16] ARM: dts: aspeed: Use specified wp-inverted
 property for AST2600 EVB
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
Message-Id: <20251211-dev-dt-warnings-all-v1-8-21b18b9ada77@codeconstruct.com.au>
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

While sdhci-pltfm supports sdhci,wp-inverted, it also supports
the un-prefixed and specified wp-inverted property. Switch the EVB
devicetree to use the specified property to remove warnings when
checking the DTB.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
index 3eba676e57f1..c51977dcb56b 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
@@ -315,7 +315,7 @@ &sdhci0 {
 	bus-width = <4>;
 	max-frequency = <100000000>;
 	sdhci-caps-mask = <0x7 0x0>;
-	sdhci,wp-inverted;
+	wp-inverted;
 	vmmc-supply = <&vcc_sdhci0>;
 	vqmmc-supply = <&vccq_sdhci0>;
 	clk-phase-sd-hs = <7>, <200>;
@@ -326,7 +326,7 @@ &sdhci1 {
 	bus-width = <4>;
 	max-frequency = <100000000>;
 	sdhci-caps-mask = <0x7 0x0>;
-	sdhci,wp-inverted;
+	wp-inverted;
 	vmmc-supply = <&vcc_sdhci1>;
 	vqmmc-supply = <&vccq_sdhci1>;
 	clk-phase-sd-hs = <7>, <200>;

-- 
2.47.3


