Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4493B5F0
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2024 19:28:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FF3i3b1m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTgwR249Hz3dFL
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2024 03:28:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FF3i3b1m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTgpr0RD0z3d2S
	for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2024 03:23:47 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1fd65aaac27so8024465ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2024 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721841825; x=1722446625; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8YNv9jZ6su9XQ/7rCuViyDwvKks7OLl6+sy8Vh+AunY=;
        b=FF3i3b1mODC32oHtdB+d8l4MwiCFx6qracT82CEA+eoaVaqdAdle1uZut5I4cr6I4e
         pCDZzFOuuRggSLHdJVNjB6KaljW3MrfSVfhTI9LXcwpRQ52bna4M/2Rj+kW4TSQHqnM7
         wL6/kl9yZWONP3CPmvKWQU2ZRRQ7RrCwtDW3zxrxlI/K4xo0d8CcU74nF/7xH1eJshD4
         JKd89xot+rRyTkZ7wyc7wJX3WP5vG5zx55/E2BHeannTqUFYlrPZRoSyQ5q1UAFNBM6w
         eSdOfbsuvu6lu1TZp+K/+eM+zgfU9bCAN4WyZOJLrA+IzccLN/YiotPODGgKFmxp+UIj
         ZOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841825; x=1722446625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YNv9jZ6su9XQ/7rCuViyDwvKks7OLl6+sy8Vh+AunY=;
        b=aZVEyGmp+HCYkrTAhmezjB6PJEYiEo3V/wkcw4gKiQnRTnyWUH2lM7rIT6QpjdVU1j
         DllQgQpaNRV9EGf6dKyliKKvqIyjoxX0MrNQxD2nFgVO4aE0DEya+FHmTmVssAF6HgzO
         fTwPwcPO/x0zh9Zrj1DlmT77qQI4Ihkm2LnUcvvJz/o8eVxkhBcWrKSsipwXpsZtRw1M
         D5gLZYW4eAyRJ9wvhQGtTyIR/XHeCwWaYmTLORW0AMGgnHQE0TQSbEBLv4tf8wgetIkp
         jme9kFUyZ6ZD/WxeQ7pJ8JKSLyWRue+HzBjY2bGniK7nUCla/92YyZTbcTQB9k9/R5Kt
         GpRg==
X-Gm-Message-State: AOJu0YwKAFOk+z5j6W/mNUJ2XBAJDPx4pWNeWnAR5Ol7y8FfrZDQvnZw
	TH+yLOI8pJAW0KjzhOOY5GPviFBseCNO6wA6k+ANjitta042m35xHn1syg==
X-Google-Smtp-Source: AGHT+IGJtXo68pcxjIdkAi84Aj94DZOG2uO3sfJF/yI+cbXGyit5aTgkc8zZ5Qwqw9DDoYH7MKgMvQ==
X-Received: by 2002:a17:903:1d0:b0:1fd:96c7:24f5 with SMTP id d9443c01a7336-1fdd6d73db2mr36807165ad.5.1721841824679;
        Wed, 24 Jul 2024 10:23:44 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f318457sm96830945ad.134.2024.07.24.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:23:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH linux dev-6.6 5/5] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 25 Jul 2024 01:21:29 +0800
Message-Id: <20240724172129.3064490-6-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
References: <20240724172129.3064490-1-potin.lai.pt@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Based on the NCSI pin table (Table 181) in NCSI spec[1], the reference
clock output pin (RMIIXRCLKO) is not needed on the management controller
side.

To optimize pin usage, add new NCSI pin group that excludes RMIIXRCLKO,
reducing the number of required pins.

LINK: [1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.2.0a.pdf

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
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

