Return-Path: <openbmc+bounces-987-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AFDCB52A0
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:47:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmR1600lz2yFY;
	Thu, 11 Dec 2025 19:46:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442797;
	cv=none; b=AgFCkEnMeEMh4mYaoUkOExnGhiMceYy/8kq+R8mSkJsq0bRhqbVtFcoAJYmRMQmTg/94s9OIYsq7SsTPyBnJlQLQy8KFK31vJRZEamCbm2cJvk1UkY7dsOV1qocSEt0m/aRpA9wfOFJPyelHuGkXhSL4PH3H2vPxRk3X3ZyUffkVt2tJq1oL4Q9Cp+sjr6TdgUvJEn1nzQRVe1b7dcF6EMGvgwSLtXWK3srF22lcBL3ARFzX/Q2C9hE4ghKFD2OCRtr9uS4p+X9zFPnFM68FSoGGzOEXTTBRbD0wNFxaL1W5mUAMITGzx7luQb6gWaM/scBlK55I1JQUAyC50HlDww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442797; c=relaxed/relaxed;
	bh=OktlR9bq9mtEJ084n35uOYN2zYX8CCRfSb1l9l6A6kk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxIY1OGOFJBWHtXWotZhpcty5a18mqHMtCtmDSmdXw810FxTCHNbNejMYV9DNZpEVxwt3xbBV+k2khaBLDTDiW1GIMlxykvR8OzWiNja3PglCUTSY6wwJfkRnN4RZwqkYni19LxCYavwHXbSDcnfSKRoBJ4eSvjUKX1YViqB++9L7aSKW8Uw1j3SZcLQyiE7YPy/yK+RicUFRBw9EwngVPUieXDHGdqoM00QCDYZlP82EhWoLnenSFTD/kD8AFoM0ZLZMvZ9/XCgjD9vl9D3pT0TJxBFA6xSxMUFxDUWrkFQvoK2c5rrZtEN3wj7kywxWPG9uNG3u/gdDpXsLPohMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Mm0oV692; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Mm0oV692;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmR12sG4z2xLR;
	Thu, 11 Dec 2025 19:46:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442796;
	bh=OktlR9bq9mtEJ084n35uOYN2zYX8CCRfSb1l9l6A6kk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Mm0oV6927NtwXJE3mZ5NmG0zvn3PLYLkzuH2SuFBs0ZLXJGI6nAlarUCDa4g3xQnK
	 kt3dxwj0rntoJLRQiItErW2OtnnEgXTXgbd8I9EwVeckhHKjStFY2OKQ72oa0603xf
	 ysq6gJFwro2BzOitoUv/fcH77fmag4NGvMSMI4/2a3RdTPyWAmSp/MOgleNxfrstqN
	 mNxmn93DegF3TrrLKt6hYW8isRz367469Xx5DYNwqZacGzZsgGwCDzcJSfy38wgFXH
	 AF8EwEXPZJ4/XWy/VSfTbcp/Y6TdJg2ExjtCJCuMd5Eo17JeoMIwk6XG9zn79e0urP
	 sltPCG4O5FxbQ==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C64A97D6B0;
	Thu, 11 Dec 2025 16:46:31 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:44 +0900
Subject: [PATCH RFC 02/16] pinctrl: aspeed: g5: Constrain LPC binding
 revision workaround to AST2500
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
Message-Id: <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
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

Discovering a phandle to an AST2400 or AST2600 LPC node indicates an
error for the purpose of the AST2500 pinctrl driver.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index 792089628362..d4c364d19d64 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2654,9 +2654,7 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
 		if (np) {
-			if (!of_device_is_compatible(np->parent, "aspeed,ast2400-lpc-v2") &&
-			    !of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2") &&
-			    !of_device_is_compatible(np->parent, "aspeed,ast2600-lpc-v2"))
+			if (!of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2"))
 				return ERR_PTR(-ENODEV);
 
 			map = syscon_node_to_regmap(np->parent);

-- 
2.47.3


