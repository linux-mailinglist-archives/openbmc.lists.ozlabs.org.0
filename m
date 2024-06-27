Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8582B91B283
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:08:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DHgQZrVK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dkr73llz3d94
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:08:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DHgQZrVK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdP4GM0z2xjL
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:09 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1faad409ca7so1597765ad.1
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469926; x=1720074726; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2tr1hBMLOFEF51USZXCVOmyouauly2LVBpam53aFYQ=;
        b=DHgQZrVKs8rn18ZJyh/Q5K1X3cqJIDmtsACZpZZwsQbO7HPZ6wM3958+37hGC62evo
         9TDHkI2Ql+KIII2avdW+eiiqG8Pg2Ijab4/b5+YtoS6Z5ljvG7gcdbV1eWyT6L1E5x1D
         iqRf6e9ZvrIq0pAXd5Bd/5l+POn+CCUeJTmfbj+QeufRxl7cgStGGimBG22PHHaErBVg
         lfXzoTs0sSUYFNxYSSkfNbCoc9xkQq0U6enPXh9Yk6IVQYV4JsnB5Qu9stgcEB7BrH+T
         oFUkm1Gg1OakBP9PtowTZ+brj/Xwalgafgkv4B1r2Qs6RuQVLLK67SJGGn7kQb/e3SIe
         cpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469926; x=1720074726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2tr1hBMLOFEF51USZXCVOmyouauly2LVBpam53aFYQ=;
        b=RyyNcFLOm5SSpbHlsBQacDJVmWDd0kPx/ICeVi+AL+VkAlEv89tQ3D1lQG3Rx6YiGX
         NrCIkyg3AHCfatBYdwnH3IXjf03BdaaPZPNROLVkzGFXY3hcUmPiyy9qtRIenuZqdwGJ
         cWnXdZ9UaZCA2jB8nT14WQ9Eq7zwdND+4q6zlvaj+3tZGsFC1EVToXUTRCayByv0X/AB
         zaHcO/GiH3V8YMAOR4CKS9DqFdvVUecLPhE6MsWcKH+o0+Bt+YlZKQObRMUH6BSM3thU
         jNMRp8Crpnc+9TsMcgCVn0ckiJtkzsFkleYJ2RLa/oJotvbhIvzriR9gaWYlEHsjclJQ
         LV3g==
X-Gm-Message-State: AOJu0Yx2KiEvxsrWqCRrZCiJLS+mLLBVDH3tBUqtH/3oYub97clM7xyX
	lukVWFO/+m9sJsu2XmtGR0bb4AWmqMyarbwbNX4Pu+u6N3FQF3wXMe9aTcJu
X-Google-Smtp-Source: AGHT+IEjmXeMZ98T5D0qPJ14A8r4KgOvN5AaqbBjUJykCPI3fRLCMsjwQlT8MaWAH8GcZQ84Y2sDnA==
X-Received: by 2002:a17:902:e889:b0:1fa:918e:ec4 with SMTP id d9443c01a7336-1fa918e1130mr46911195ad.59.1719469926570;
        Wed, 26 Jun 2024 23:32:06 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:06 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 05/17] ARM: dts: aspeed: minerva: enable mdio3
Date: Thu, 27 Jun 2024 14:29:39 +0800
Message-Id: <20240627062951.936256-6-yangchen.openbmc@gmail.com>
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

Change usage of I2C bus 11 to mdio3.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index cd321482aa09..13819bc166cc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -78,6 +78,10 @@ fixed-link {
 	};
 };
 
+&mdio3 {
+	status = "okay";
+};
+
 &fmc {
 	status = "okay";
 	flash@0 {
@@ -315,10 +319,6 @@ &i2c10 {
 	status = "okay";
 };
 
-&i2c11 {
-	status = "okay";
-};
-
 &i2c12 {
 	status = "okay";
 };
-- 
2.34.1

