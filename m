Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68190663B
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2024 10:11:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PAS1P5yX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0FV83zq1z3cWm
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2024 18:11:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PAS1P5yX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0FTX4M28z3bpN;
	Thu, 13 Jun 2024 18:10:38 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f65a3abd01so6582835ad.3;
        Thu, 13 Jun 2024 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718266234; x=1718871034; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=PAS1P5yXa//wvoTx45g3n7EuH0IW/d+NBwOUJY/1BASVA6WHIRRmJikUOnV93Yt7Dk
         elkNIryv+8YKnQjtVGg2UhJ2BckgVW8CF2WaMrp+kzoO/XMH4hu8kNCTJEkcYCIIFkrq
         Ix5nT3qOTX9QXX10bLvlgddiQ0TQAdZGgnavAYPGx4uguEE/JgieMyVdiBZXZkZPDCNH
         iSSn1NDN/ByX8IGoSinetqTqFhB1UuLZHgRne0F42KNZeLrLuYzfASgN/qbPZ/qmZob5
         +XWbMbknec6/hRaRUQKAgzn6lzE3HSyOxfWVQgSyK2LS18ecFa561LCpsqyA+5/tClC4
         YFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266234; x=1718871034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=bhVhK7gKK4d4vjP/EHzWi9cE9hu5vHCaHqT8bVTTAyVuJcqyJqjwm2zT5Yx1b/e1vg
         BBAWXSyRd/1oDIK8toDjlKAvMd97QyrzkT/cLSQmLz1jyY+kiwxuG0FFHvzUDdl2xOYw
         r5j2QhBbjJQ5SGhVIjLQK2rZrxcmlMWHFhoY06TJJpmxH5IkUd7rZ49gXq4YQ/zlzaTZ
         dbv/2+Zape5yHFv+d2HyRWPkGFFXGjX7mPGHyblhGBkW87sj8wJT/w5kX/2J4a5562J1
         93Nn6YXTn8kPOqDuYEnn8U2zqwf/7OVbvlY9fnZTA8HXjFlDuA2Pk4vUgPvqR6UbkdIw
         moqw==
X-Forwarded-Encrypted: i=1; AJvYcCWJj2UwidTyEUCwWvHwLNfGVvLnbHeaZYWflz7PgvA0U9TTrpmw3bS4CWii22l7bWz7g1k6RMhTt0fF7aa1jh3JSPmHkR4wdYM=
X-Gm-Message-State: AOJu0YwvR4TR1++nu/LNQWSDpHMpC/T5VdhHAxmQjb2LI1rUB2byM6ZQ
	pouQyDzLamV1ZyS4NMIdwTQpru71QMVeeWqooNy4zwlNV6ifTT9c
X-Google-Smtp-Source: AGHT+IFLEywWphtgn3X1PQp/3zfnSwArZcK1HQZIowNQFjRIz2BcmZ5KhpvO9dq6/2QAxDHqyog4wA==
X-Received: by 2002:a17:902:ccc2:b0:1f7:2135:ce71 with SMTP id d9443c01a7336-1f83b566d82mr47972065ad.11.1718266234189;
        Thu, 13 Jun 2024 01:10:34 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e74c49sm7572965ad.104.2024.06.13.01.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 01:10:33 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/1] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 13 Jun 2024 16:07:25 +0800
Message-Id: <20240613080725.2531580-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In the NCSI pin table, the reference clock output pin (RMIIXRCLKO) is not
needed on the management controller side.

To optimize pin usage, add new NCSI pin groupis that excludes RMIIXRCLKO,
reducing the number of required pins.

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

