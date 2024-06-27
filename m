Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04A91B293
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:16:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SucCYcZm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dw145hVz3cW3
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:16:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SucCYcZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdh3LNZz3cPS
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:24 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7067a2e9607so3708752b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469943; x=1720074743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvFxbMreeuSo/wVfgiSYE826uiYtvaR7mJSAkGu1qGI=;
        b=SucCYcZmPkmZl2zxOplTY4KeepQ21zgGFYzIuMTWrb35Je4ZUC1xqKUGEqdUyKDw3N
         kvIrIwPbtplxtlQqg5IZvEjLYJBszPQgSw5XWkvi4/jwaoHd1BiN6ONmxLIhFg0qTVvK
         0liwkgk0fRrXt1y4NlnXyB0fwjHzkHF7WgtnRlEgEOvtuvketjAx4tyEqdrKBIJWQUKZ
         FXRaE2RHG8MSsjCy+1ct/ZR+PMYVy5mpGPNA21cRg27QOPlhb3MS75lpOB8pwdA/Lwad
         UUeUuT79lnRsKmniEpS+vMC87qGHCGhEJ6jSPjdoNtgrBawSSw0TNMHUEl0jnw4mO9It
         2eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469943; x=1720074743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvFxbMreeuSo/wVfgiSYE826uiYtvaR7mJSAkGu1qGI=;
        b=Pmh3NqsqySmokqpPjWunt/Sq9D2zqPR9AEbSLBubLAN4W+mIm95QDLglYmby4dfHBx
         BYMXQQpgIJlNQzYuAkm+jSez2YJueQrdzYwPdzeSFfGBtzKvMI9z8aXhovv4z0TgNfli
         bFqbfO31WrkRdI3L0h/4AAAKcwljnC69IKsrCbfj2s2hRIwi0QDbkK7VRuKytO/emzQm
         FbbQYNr+FWLCYcuZe52X2YkQLZDzLWFbv8EZv1ZNr4y8uPl+8Oqys8gwusGebmhGuZwu
         n5zf+Sc8SZT+gEejLzhJ4IeRAzXu3a8wuTKUO0q9huARxoWHg+ocYBxD2qywyPYgdY+a
         4YIA==
X-Gm-Message-State: AOJu0YxRBdN0K6t6WNXTP2b+RPp86lwLETcXdxRgZoRwVMVFVlbkSnWI
	1Wlyn9zWwsO5M2y7p6Y26Md6YKqlfNqWBmppJ/+1Up24xmbTJNBNtDxd/kZS
X-Google-Smtp-Source: AGHT+IGwim4c3neGGWYCtybpXs9IsP3ryvSRdJ1NowEA6ZN2/uuifxUsIFvbicuLUSdrx5YhSF8C3A==
X-Received: by 2002:a05:6a20:a820:b0:1bd:d5ba:e163 with SMTP id adf61e73a8af0-1bdd5bae1b7mr4079306637.26.1719469942991;
        Wed, 26 Jun 2024 23:32:22 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:22 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 14/17] ARM: dts: aspeed: minerva: Switch the i2c bus number
Date: Thu, 27 Jun 2024 14:29:48 +0800
Message-Id: <20240627062951.936256-15-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
References: <20240627062951.936256-1-yangchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jun 2024 09:03:24 +1000
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
Cc: Jerry.Lin@quantatw.com, yang.chen@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Yang Chen <yang.chen@quantatw.com>

Switch the i2c bus number to map the i2c tag according to the hardware design.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 7a790e347853..8f3f15a5c148 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -384,7 +384,7 @@ temperature-sensor@4b {
 			};
 		};
 
-		imux20: i2c@4 {
+		imux20: i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <4>;
@@ -430,7 +430,7 @@ temperature-sensor@4b {
 			};
 		};
 
-		imux21: i2c@5 {
+		imux21: i2c@4 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <5>;
-- 
2.34.1

