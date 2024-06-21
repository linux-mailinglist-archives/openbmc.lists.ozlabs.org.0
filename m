Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F315D9120BD
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 11:35:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gvlpRVHi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5Bzm4Q51z3cbW
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 19:35:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gvlpRVHi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5By83c8mz3bsR;
	Fri, 21 Jun 2024 19:34:07 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f6da06ba24so13455265ad.2;
        Fri, 21 Jun 2024 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718962444; x=1719567244; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=gvlpRVHiLkgvO3gEn1NTpW/w5CNMFz/wAA6wJIRmBSfZSK+6gorhUETOcMVFAlNjl+
         wHccj7sY9pPaAsmD6ad8vidCPbvubquJRLQcBkHXeyBTP8Qt9kTfhU31nODuwC/hYj07
         BTURvaQjDXWFc8b4CKu+9m34Sr3aIDaErb5ZQJ5vG96UzdXaI8ocPzheYbadvkXrne3S
         U9dW97EC3ZSWnDOyxJuCAGnRgijifh+0BXueI3K6Pvk94WLGYnsXEmbW/QDZFxR08GkW
         4vkUXO+friLzR08D/WZG6dDXE4DJ0uun4rT/LDU/Vnbi5dbr77YTR5rCSRwTUlvAETW1
         tMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962444; x=1719567244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EiJfmKO8nNBSX1oUuFOSypNRXVZPBtzmshynKzoPzUw=;
        b=n0Q+GKgdtc37fTWPK6/Q/nbvf03zhPv8tmZBftxm/3VhCQgXQCG2ENpVYqpij05oOb
         3qZDS413IIt+pfY9QEQSE4sB9KYn+h2tOzoA1Pvjon7Ck2Bf5ssmr+ctwS/r3LoFtTFb
         5w7NdyWz+ldH4Up3C34Zur3JpreQM9xg21B+4l0nO35yNNywb9UTKbb/dmNKCIN/C6C9
         OjyxFTnByUET53afKATFTCbvHkZBkT+/peuZIwwN8eYop/4aWeMHbXGZAEcn7e4H+VPc
         o43AFuEC7U2EOlapowkV+Sx2XWk4iuiyxAi3qhqU5pmVYJzJnKdJpxSsYwqM+iJRO/eJ
         SvwA==
X-Forwarded-Encrypted: i=1; AJvYcCUrL3sy1diRgMzs7bFQKsatVhhcVue0cYbdyYWFnhlN59kt0vaEAX70dOsIIYyM0aGVMde/mmXFaaBFh9Hqueh9jURjePz3vP8=
X-Gm-Message-State: AOJu0Yye3ZW7QQM81HEQ7stg/EbDtkiZjrV+W0zGlmzZXTVFSUBBM3mj
	yzAzm5/mVnUBNLw+OQ44bt52xxaXPtCk9iqAEBQedMIB6vlk59+C
X-Google-Smtp-Source: AGHT+IFOKXrh2SxGVKHFT+5si9TabUQXPaizDpK8J7kyQ+x11v7jWslxqA6il5ABG6GwYYLtHI0tSA==
X-Received: by 2002:a17:902:d4c1:b0:1f6:7f8f:65c7 with SMTP id d9443c01a7336-1f9aa3e9e54mr90810285ad.26.1718962444561;
        Fri, 21 Jun 2024 02:34:04 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9ebbc72e9sm9810365ad.296.2024.06.21.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 02:34:04 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v4 2/2] pinctrl: aspeed-g6: Add NCSI pin group config
Date: Fri, 21 Jun 2024 17:31:42 +0800
Message-Id: <20240621093142.698529-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240621093142.698529-1-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, linux-arm-kernel@lists.infradead.org
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

