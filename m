Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A950022BA06
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 01:11:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCSkX0bVvzDrcW
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 09:11:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NNsqvlR3; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCScM0091zDrP7;
 Fri, 24 Jul 2020 09:05:54 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id k27so4074302pgm.2;
 Thu, 23 Jul 2020 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lVepU+ZwtLg61EekGifFvcWIHx8/75YvPPQTkYbwJr8=;
 b=NNsqvlR3R/ebOXczP2pa2IDEyMN0WNJyDr9UhwB/4qENFd+cLas/Dgp5yds2vqV8w5
 8wZrsTnhFfLyN40fhTbzZrb/1NCwNjK67Dvh5cWniM/F8I6u9MwtScNx3mBjcJ5G1/mP
 tgWTMtKnfVcIm6opPG/3h0K/16DXVJ3KaN2fHxs9VMRbDCHoEVztRo1pinCryuZtXw+R
 kpPuvWQH71NWFAkLdvsbfVB4E9DxT0NpohOQeNq7ssE7Yu2upjLR55OR9Vxh0dEFxgwk
 6EWQayW6LYAy53OcOTl3SYnZUkjO0qj7uq3KzdLkr90Aa8A0KabDJp4ZnuUaobeHtI9m
 2Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lVepU+ZwtLg61EekGifFvcWIHx8/75YvPPQTkYbwJr8=;
 b=EIKIwRweLyAfH643wM1PLrV8wJQoFkEdqqYQisYJAitwOwecpeXT+y22McZsiA2p3O
 99V0foiOpimPpflzFou5XZn1fXp4QUK3nnt3VG+BENK2sGPcUAsJ6IjZ9KmwIISlJK/r
 qCMnRkjXJyq5RXDO7+cTDAUNta9g8VtBiXTkdh8tfw+mQ6qlxtOFf8+cSmVBYemkmDB0
 NR7RKaUPxhMaSntigIBe7ZUTSIM7/EguVLhx8jF6q7PwjJ7AbAmslR6wgqNwJAnN5WKo
 nutN4hVV6tTPh3eAUmYCeBQTv41SACK24OyShgFQbfZr4AIGDWTeVBhXKkx+0Yg8+7yK
 Gsng==
X-Gm-Message-State: AOAM532h/tFocB74MrQD0kEE1EI8fuWtr+bd9Yp4YWC9iVsYgJbcHOew
 FVqe/v/9TebdJYNY1W0ngf0=
X-Google-Smtp-Source: ABdhPJx4kMBNnslf9Qu63+wKCjksfkfXgOJnn1caCxGQDWIOybaTSq5CmdnP2Xv5ovGfX7C2Gd/ucg==
X-Received: by 2002:a62:3246:: with SMTP id y67mr5914578pfy.131.1595545552160; 
 Thu, 23 Jul 2020 16:05:52 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id gn5sm3644742pjb.23.2020.07.23.16.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 16:05:51 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 3/3] ARM: dts: aspeed: wedge40: enable pwm_tacho device
Date: Thu, 23 Jul 2020 16:05:39 -0700
Message-Id: <20200723230539.17860-4-rentao.bupt@gmail.com>
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

Enable pwm_tacho device for fan control and monitoring in Wedge40.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
   - Nothing changed. Resending the patch just in case the previous
     email was not delivered.

 .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 1049cfa80ac2..8ac23ff6b09e 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -135,3 +135,32 @@
 &adc {
 	status = "okay";
 };
+
+&pwm_tacho {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm0_default
+		     &pinctrl_pwm1_default
+		     &pinctrl_pwm6_default
+		     &pinctrl_pwm7_default>;
+
+	fan@0 {
+		reg = <0x00>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x00 0x01>;
+	};
+
+	fan@1 {
+		reg = <0x01>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x02 0x03>;
+	};
+
+	fan@6 {
+		reg = <0x06>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x04 0x05>;
+	};
+
+	fan@7 {
+		reg = <0x07>;
+		aspeed,fan-tach-ch = /bits/ 8 <0x06 0x07>;
+	};
+};
-- 
2.17.1

