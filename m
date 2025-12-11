Return-Path: <openbmc+bounces-988-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE5CB52AF
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmR73FxHz2xNk;
	Thu, 11 Dec 2025 19:46:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442803;
	cv=none; b=UUBbTW3iDbxh4hh+LpJnLIVY7LOjWL2VcrSRFQYdJSvIQkVdeDWe8ydmAtkScbzUII/UyyZOq1OBFbbgynplt8uaRcfSHhP53kTvdszGLNG0R3hgu4wQnlKv9g7oopDWmSzzPKIEB9cdVLbmxmMEtgPNrVQFMl6hwQqMtofttbdKDryVN486GUbH1nwP+xiyrF76V5CKAX83oYs80tghh4BK6Ge5pwrN+zmZwL3kal6WB51sEiKzuB0R5yOVjkosN2D/TB/F/DDJDd+1VPDLUEO8yjtKlGDc3gF7mUVi7Fs9YCNHxkOZYIBZjdqsmpB2haTY/sp3H5RGHFq0m4SEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442803; c=relaxed/relaxed;
	bh=ZaCIgDIvXKFxlEh06PZUH9olbYn5peflfwgiHUXeKWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lM389Zq/wlbI2vYsDJWfcG51byIvx1jnLNqTt1zs7CBX25tzHgrOBFLj9Dhyhu6KGB6GNGzJAtq4SJmmDEm1XuAZVpqpvmJM6DcpaqKu8NFVlowhYvtMXkbNthjbZIg0KywLJzquuWUJkgqh0ZyGmlcHSDEz02rXNuj8cvOT5Tnw0/558U0/5D5A0toA3/Xgi6hbFZADO7ZDZX5k3JB8uZHKt0GlxCWMreiz/3wTuCavEtdyrPzwcKWuNkqdEplt6DQQuQXiPaxl2AJaxPjb9bSlMLejyEzKWJk6zlRrZ9hHy1hRC2EpcuKZbdqyUKW2oz7I1ddDFZ7LFhFfq7BkTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TWkruskj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TWkruskj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmR66cQbz2xLR;
	Thu, 11 Dec 2025 19:46:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442802;
	bh=ZaCIgDIvXKFxlEh06PZUH9olbYn5peflfwgiHUXeKWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TWkruskjvN7xj+MwWy10jjXI8sxa0fzMzbL6LBnv2B523ZUUvxFbWBWM2wCe00jbH
	 o0KiKfbCRlC7MsTUEs8PDWIINz5BZLriBTcb/D/OkEsNERjaYzeRe+2WUBSk6xWYyh
	 15LKTC2e3qhOlvQRf2dW+enVMbnkcKG8uRHJ605jPyOFgZmOlQ2SCZEeuqpdtodBt0
	 LUg6OJUfKZtSsb6Gx8lfRjOJqPtN4vmTtGLuHK4zjxooP/iZZZF/lJmbWmBXBSfdr6
	 CuGz5H4GA3zJoZJGURJgXXG1iLW9ozmv7i6cgoMeKsnP5iYw2w0TOvnLCtBQupmAc3
	 1BnOvhaK7Q7nw==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 85BCA7D6BB;
	Thu, 11 Dec 2025 16:46:37 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:45 +0900
Subject: [PATCH RFC 03/16] pinctrl: aspeed: g5: Allow use of LPC node
 instead of LPC host controller
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
Message-Id: <20251211-dev-dt-warnings-all-v1-3-21b18b9ada77@codeconstruct.com.au>
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

There's currently a wart where the Aspeed LPC host controller has no
binding specified, but the pinctrl binding depends on referencing its
node.

Allow specification of a phandle to the parent LPC controller instead.
Fall back to testing for a compatible parent node if the provided
phandle doesn't directly resolve to the LPC controller node.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
index d4c364d19d64..7d818b4da1e3 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c
@@ -2648,24 +2648,34 @@ static struct regmap *aspeed_g5_acquire_regmap(struct aspeed_pinmux_data *ctx,
 	}
 
 	if (ip == ASPEED_IP_LPC) {
-		struct device_node *np;
+		struct device_node *np, *rnp;
 		struct regmap *map;
 
 		np = of_parse_phandle(ctx->dev->of_node,
 					"aspeed,external-nodes", 1);
-		if (np) {
-			if (!of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2"))
-				return ERR_PTR(-ENODEV);
-
-			map = syscon_node_to_regmap(np->parent);
-			of_node_put(np);
-			if (IS_ERR(map))
-				return map;
-		} else
+		if (!np)
 			return ERR_PTR(-ENODEV);
 
+		if (of_device_is_compatible(np, "aspeed,ast2500-lpc-v2")) {
+			rnp = np;
+		} else if (of_device_is_compatible(np->parent, "aspeed,ast2500-lpc-v2")) {
+			/* Maintain compatibility with old aspeed,ast2500-lhc node */
+			rnp = np->parent;
+		} else {
+			map = ERR_PTR(-ENODEV);
+			goto put_external_node;
+		}
+
+		map = syscon_node_to_regmap(rnp);
+		if (IS_ERR(map))
+			goto put_external_node;
+
 		ctx->maps[ASPEED_IP_LPC] = map;
 		dev_dbg(ctx->dev, "Acquired LPC regmap");
+
+put_external_node:
+		of_node_put(np);
+
 		return map;
 	}
 

-- 
2.47.3


