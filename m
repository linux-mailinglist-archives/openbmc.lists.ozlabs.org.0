Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1022B9FE
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 01:08:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCSgK6SCqzDrfh
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 09:08:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VjTbA6AX; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCScJ0D2mzDrcP;
 Fri, 24 Jul 2020 09:05:51 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t6so3392523plo.3;
 Thu, 23 Jul 2020 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F2Pqk4mRzkFzX9xFSRvFyyP3SBKlsXCsdPwtf6+8Ajo=;
 b=VjTbA6AXBoaB0RDzYmJ3E0ciocAanVmLtik4kiAq/W3OZ8a+Tk3/9TfQT7UZUKQ1FH
 0XMjd0X1PbRuix6Bd/doMNqBaQhPt8KpJCR4TQKZr0kpzi4DdrWCIDsRPwro4sol/rrC
 gLZMXonkP8qcFTn+SaHNNwJYEmsAAGJNliCU0Sil7g9HVd0NgnvUrqIHXVF4bKOwqR98
 y2+uW8U1pg60HJ7kI+7A746BawLg3pY9NOW2FB7i78gOZBkmqmyyM7h4HDLlsesIfX6p
 ctqj45kqdvxgF8iGptdR1pf1ZCK6EmHgd0FPa/tm570emRMcZCwhkUuLJZ1tKg21nwp1
 i84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F2Pqk4mRzkFzX9xFSRvFyyP3SBKlsXCsdPwtf6+8Ajo=;
 b=rX4PFIb5iBEN01/TRz4wGSFHTj4L+FjeCbqujusozqiJaLGuTTtZa71YbYDuw8P5Yd
 JzLs3iAXdbe8P+797LDZ+n8AtG3zNr/7G6rS391eFk6PdTmuoqXDdQOv8NuXGfI1D/Ve
 JfNFXYK1iPhOZRxYXPRk1ipNQfoMtKug3TApxk+o8GFnZTc9I8uj/9Isbx+8p8jsirG8
 OTz1jzeNxaqHLaJoJJBIEfmDBfALiMgAezjgeuMJCVZgSu4cMd01MJGFeB1wg9fin+Uz
 UpEHVvCX5avuNvbzSXNuiTNsRpqzX8iZTgV9DVU3NFHOyYHcj3fhGhNOavqxRw/LMW+r
 ORnw==
X-Gm-Message-State: AOAM5314cb2uOPsVgNvble7/pje0q14YlU9hJ54S7plenPJRgn6PBaA0
 snvxeZa4WAwD7HD5dvCo9EU=
X-Google-Smtp-Source: ABdhPJxz4fyUslV21YIicSuEUXWODmfGNTJc5KJGMBlAZ1KMU5eHtvAW2G8fxTbZHRjaRg8ywL8E2Q==
X-Received: by 2002:a17:902:b113:: with SMTP id
 q19mr5771431plr.170.1595545549701; 
 Thu, 23 Jul 2020 16:05:49 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id gn5sm3644742pjb.23.2020.07.23.16.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 16:05:49 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 1/3] ARM: dts: aspeed: wedge40: disable a few i2c
 controllers
Date: Thu, 23 Jul 2020 16:05:37 -0700
Message-Id: <20200723230539.17860-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723230539.17860-1-rentao.bupt@gmail.com>
References: <20200723230539.17860-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Disable i2c bus #9, #10 and #13 as these i2c controllers are not used on
Wedge40.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - Nothing changed. Resending the patch just in case the previous
     email was not delivered.

 arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 54e508530dce..aea23c313088 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -115,14 +115,6 @@
 	status = "okay";
 };
 
-&i2c9 {
-	status = "okay";
-};
-
-&i2c10 {
-	status = "okay";
-};
-
 &i2c11 {
 	status = "okay";
 };
@@ -131,10 +123,6 @@
 	status = "okay";
 };
 
-&i2c13 {
-	status = "okay";
-};
-
 &vhub {
 	status = "okay";
 };
-- 
2.17.1

