Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3449790FF4C
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 10:48:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gsi+xw75;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4Yzj5wX0z3cp1
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 18:48:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gsi+xw75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4Yx45PL5z30Wc;
	Thu, 20 Jun 2024 18:46:00 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3cabac56b38so313757b6e.3;
        Thu, 20 Jun 2024 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718873159; x=1719477959; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=gsi+xw75pqDQn2BobzS7PAUrnsPFFgE0p65V7n+UU2FGqNDwy0sMNU+APSdlXmnDEt
         P7IVd8rgdNz76FnBbgc4JmQxzxTyldsv/blwW0wcXEoEygYGn5WlGGXDJv17rptYoGye
         rYNbh3nLZ3e+BJwHVOUjg37ZwrM3csGHFRwOb5UZ+d+w+rKQvMejQZJAgVKxoIcEoyeE
         4hRy8eW0WIksnbKk60T7Q/GhC8s772CU+M1sqUAzjMBvmoNBeda/h6dFcSJdFhnXOlB/
         lTRMBpmbApFw74KealMjdcJCBTJGmf1Gpf3+HYf3zQkzBt9kfIsatWdXJ4y5j7GXga2M
         g7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873159; x=1719477959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=I4I2zmBAm1mYfRAkLPpsdMgMNsioFGVHK5zjMLdvezk5Kferxv0d42yHMRF/1tp3Z/
         eGsRv8gXhrWD/L+2j9M5pYlit/sfr7DStvX117z4PrTP5U2SbRPIHKGP4F5v7V4d67QK
         Au8q1+hFkfgdo7g4ZLtwOhDdPih/7H++zPCOlWGWurBhx8/vTr7llbuODiUaVy0fN8mj
         90GyYZaLAXogOlACZ42wgd3VxXvkNvzU14y4t1BmQcxt2YIYMZxXWf75kkCTvxAUbEHs
         OnYsZh304c3npzzn0BLdZ26baFKq6jRQJqHxRHPen6skNSh1hwwFavWjKonij9vqBnYu
         IXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6AUlJ4wCV9lu7BphjxDBvcbPgc6lpRQR5V0lPeRvFJSooKsggswfWdZ4NY0nyIv4maVLtgUdNmgKgYhpyxtP2BR4LYcY6jCo=
X-Gm-Message-State: AOJu0YzkebkvH9jFpdyU8oJUiPq/9frYXsEOWKoUppq6LpHIvYUaBkFJ
	kD6KzKdEzBValbGvJHDzGQdeBmRSViS5XGNmLitJ8kaVL3UbSMY4
X-Google-Smtp-Source: AGHT+IGhGDKSgAv0T6Xql5g7csBDAeTCcq8i/P2W7WhnsCqa2jWpcloUNmsMrFYRH/C43jnjpNWvwg==
X-Received: by 2002:a05:6808:199c:b0:3d2:1e98:cb04 with SMTP id 5614622812f47-3d51b9824c4mr5393367b6e.7.1718873157886;
        Thu, 20 Jun 2024 01:45:57 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b9besm11895592b3a.165.2024.06.20.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:45:57 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 2/2] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 20 Jun 2024 16:43:37 +0800
Message-Id: <20240620084337.3525690-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Based on the NCSI pin table (Table 181) in NCSI spec[1], the reference
clock output pin (RMIIXRCLKO) is not needed on the management controller
side.

To optimize pin usage, add new NCSI pin group that excludes RMIIXRCLKO,
reducing the number of required pins.

LINK: [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.2.0a.pdf

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 7938741136a2c..31e4e0b342a00 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -249,7 +249,9 @@ PIN_DECL_2(E26, GPIOD3, RGMII3RXD3, RMII3RXER);
 
 FUNC_GROUP_DECL(RGMII3, H24, J22, H22, H23, G22, F22, G23, G24, F23, F26, F25,
 		E26);
-FUNC_GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
+GROUP_DECL(RMII3, H24, J22, H22, H23, G23, F23, F26, F25, E26);
+GROUP_DECL(NCSI3, J22, H22, H23, G23, F23, F26, F25, E26);
+FUNC_DECL_2(RMII3, RMII3, NCSI3);
 
 #define F24 28
 SIG_EXPR_LIST_DECL_SESG(F24, NCTS3, NCTS3, SIG_DESC_SET(SCU410, 28));
@@ -355,7 +357,9 @@ FUNC_GROUP_DECL(NRTS4, B24);
 
 FUNC_GROUP_DECL(RGMII4, F24, E23, E24, E25, D26, D24, C25, C26, C24, B26, B25,
 		B24);
-FUNC_GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
+GROUP_DECL(RMII4, F24, E23, E24, E25, C25, C24, B26, B25, B24);
+GROUP_DECL(NCSI4, E23, E24, E25, C25, C24, B26, B25, B24);
+FUNC_DECL_2(RMII4, RMII4, NCSI4);
 
 #define D22 40
 SIG_EXPR_LIST_DECL_SESG(D22, SD1CLK, SD1, SIG_DESC_SET(SCU414, 8));
@@ -1976,6 +1980,8 @@ static const struct aspeed_pin_group aspeed_g6_groups[] = {
 	ASPEED_PINCTRL_GROUP(MDIO2),
 	ASPEED_PINCTRL_GROUP(MDIO3),
 	ASPEED_PINCTRL_GROUP(MDIO4),
+	ASPEED_PINCTRL_GROUP(NCSI3),
+	ASPEED_PINCTRL_GROUP(NCSI4),
 	ASPEED_PINCTRL_GROUP(NCTS1),
 	ASPEED_PINCTRL_GROUP(NCTS2),
 	ASPEED_PINCTRL_GROUP(NCTS3),
-- 
2.31.1

