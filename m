Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9FE90FAF4
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 03:29:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a+W07OdG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4NDp2tX7z3dTV
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 11:28:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a+W07OdG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4NC95Fwpz3cT2;
	Thu, 20 Jun 2024 11:27:32 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f480624d0dso3006005ad.1;
        Wed, 19 Jun 2024 18:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718846847; x=1719451647; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=a+W07OdGY0tOu1nejkItoUhpLmxTSkpo8wocH8IcRCdc6g0noG/rYfnzppkzFK/HcZ
         Md54Q7tqUcUN0+9djppXYQzoG8hscvHxwzLI3+r6CCVh6+jhmHr0HYCjaDUpcWTHCZ0t
         K9i3KW0WjqyRVqBVQQApbA9yPHtyXVVmW9/ejZVrHRGRtxGPdgpz6CwY7qcYoYXBq8ze
         6dKO+19wOtUV8syUzJF5tUXqXGS4XgMJKx99G70JHV/+6h1AuGqdrc1VbHrQTGR0VidF
         ubpy+OVahhyR/azykb+/Hg7yEouASXRzi6M/SXh6muExf7WEahxazQAk1WP6qO4KR5UT
         NHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718846847; x=1719451647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6rW4gRbF4g9rE66bFyc4+9ecA/29lBg9GnRQwb9/4M=;
        b=RQst1daEW7T1wAIOnFpH1Fv0xTDrisFO0zmFzGYjNdhaw/koPabysybiQqxYBdJ7TI
         qX26FXzFAZJM7tMI2B2geckjyjrIyan3mE9XN8WW4urUoXL1sIq4+pfUjL3rOHvgWz+0
         iGOI2tweTBHj79zgqp/9hiqdCMvxwS9gLAEyfu/fzT9+0RB+4SE41laluLpuKohNg9KI
         TpY0m1YZTGur5y7kg474if5esJVzin2Juh2G+zeRAN8kf/ozFicIdFGozy4/pgzk3DrH
         oLQkuRMTeBkIo9diNKSb7+xgEvr/1n9wf3a+WcQ6zJxtAYXSFx52tdY8QtH3hUSWkgku
         /FPg==
X-Forwarded-Encrypted: i=1; AJvYcCVoW7bvJ4CqK+BMrawGYjM1OrrqfpzVJbrkZ+IfVX6GFjcLkQ2/hgIrywReif/GksGBuMXQGYIuzAhyKGc66fWyToeMHoxBlv0=
X-Gm-Message-State: AOJu0YxClXCk703Yd88tBeyn2kZBc3agdfltW3eerC0t9i8P+0KueDWO
	58JuVxhSQ1IdNX7QIaCvprjzmwJro8ktyf6e7Pbpf8TW3QJ+aE0HXyMbG8h7
X-Google-Smtp-Source: AGHT+IFHltDAazsMVth4tkcJZ+j2/bVyouoA9oII0f88tUI4qTUzL/WWNrangeocByNlrlSB2hmB2w==
X-Received: by 2002:a17:902:daca:b0:1f8:67e4:3985 with SMTP id d9443c01a7336-1f9aa45eaa7mr51151795ad.49.1718846846933;
        Wed, 19 Jun 2024 18:27:26 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9d021b98fsm105855ad.33.2024.06.19.18.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 18:27:26 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 1/2] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Thu, 20 Jun 2024 09:25:11 +0800
Message-Id: <20240620012512.3109518-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
References: <20240620012512.3109518-1-potin.lai.pt@gmail.com>
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

