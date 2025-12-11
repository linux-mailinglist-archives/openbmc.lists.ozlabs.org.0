Return-Path: <openbmc+bounces-989-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFCCCB52C1
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 09:47:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRmRD21Zsz2yGD;
	Thu, 11 Dec 2025 19:46:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765442808;
	cv=none; b=C2saItCFWZRPhvTL6x+ZB26KHMrrU1TKfrFVVqYaeCguWG18bViXF6HaG73TCplHjvVhrAhU3Wt50V4tCYlfeXHhtpX8Hujds8nEn9D2J346g65fvyCTEiK3d4X9eYO3q4qsmA4mjF9Ho9Js3KIOo9iUZrGymSxWu1u6F2Yznp0MtPhYCzhXrWqM9J4Wfn2eabgtakL59A64jb7BiMvkkt4COzX6Ku2l0ibSKtAqwAFkYmkw00KUTarLVZDQMNffzffn1mV/4LqVPV4spfLug8H8vYECnIhXXbAwI5hFhYlRIjpeZfYPhHGlzZhNxyiqp9UFpHpcAAsh1lCTwNUxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765442808; c=relaxed/relaxed;
	bh=64vyUWdNJftGuOm7IF2XaSwKPBkVJqodvt65O40/0gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaiWDeykBEzLMBEXTwStv9TngbhCQkEc1LcSLZXNzeNF2gbbseoAZ0y6ESXQXzege7KrEKhH0TrcZm9SfeGMdLeg25G+FasNgdwbrJtN/9EfORimXsfL6Qnmxj4SKpCA96DVzlBWA5CeYPDfFRHWQYq5ycWkClHxBUDQuMrtCtspUc78vbuhDUmnCHWKiQEX/LGERAZMMsfmp6F9IXXQYV0BCYlm5OCsI5HhmGAonktNqeX3ZNhHZpnB6qMrh9VQcTEQ66oFwDmw3fmutSb79Dkr0yx88LlBn+ypyKxw9HL6Ct5jtUGXS2/HaDaNQ+94tSo1ei/kYTURUUyTzTEeHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NOPKQ5h5; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NOPKQ5h5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRmRC6qh8z2xqr;
	Thu, 11 Dec 2025 19:46:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765442807;
	bh=64vyUWdNJftGuOm7IF2XaSwKPBkVJqodvt65O40/0gY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NOPKQ5h57DpM3vqHy81icDlrF63oyfNJcef/hUzn3NKElWk3qOLQggAftbYFRRIZp
	 nr93F74IYe1LigaTyenaCOjJPFMHRIGWWSv4VsDY81q5pIHdcEHSMq6aN0JqM7k73B
	 ayIoYa+pA5hSNsFS7mWVQnmhI+gjiFu2XXBvrhbupO7QRXeON5QsLIvOdwKy7pTR/t
	 zaaVcXEz5HkF/uoSOYHqGVJylkJ4G8bXmMz5wni4RDF6CdfjUIOk+FH6YfaqQRt23i
	 9ui0jkpD4X4IjsxSkQtsE3CBE2lhHehLuiNk4qsC79QHXFKITRqp6/IW6mwu4rWgbS
	 xrZborwCkR4JQ==
Received: from [127.0.1.1] (fs98a57d9c.tkyc007.ap.nuro.jp [152.165.125.156])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE9BE7D6BF;
	Thu, 11 Dec 2025 16:46:42 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 11 Dec 2025 17:45:46 +0900
Subject: [PATCH RFC 04/16] ARM: dts: aspeed: g5: Use LPC phandle for
 pinctrl aspeed,external-nodes
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
Message-Id: <20251211-dev-dt-warnings-all-v1-4-21b18b9ada77@codeconstruct.com.au>
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

The LPC host controller has no binding specified, and the pinctrl driver
can now determine whether its been provided a phandle to the LPC host
controller or the parent LPC controller. Switch to using the LPC node
phandle to avoid specifying a binding for the LPC host controller for
the moment.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 39500bdb4747..1456f04c2139 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -251,7 +251,7 @@ silicon-id@7c {
 				pinctrl: pinctrl@80 {
 					compatible = "aspeed,ast2500-pinctrl";
 					reg = <0x80 0x18>, <0xa0 0x10>;
-					aspeed,external-nodes = <&gfx>, <&lhc>;
+					aspeed,external-nodes = <&gfx>, <&lpc>;
 				};
 			};
 

-- 
2.47.3


