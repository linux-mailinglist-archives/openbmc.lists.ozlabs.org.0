Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF291B290
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:14:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jvbMVLDO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dt12G2kz3cYT
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:14:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jvbMVLDO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdc23Czz3cJl
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:20 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fa3bdd91c1so32848665ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469939; x=1720074739; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QMNZrdOhBJtXo/ncaekHBRhjTvNlqY+hHR6bexm0Kg=;
        b=jvbMVLDOBqq6oXqadgA9jGUE6qEW92uIO7BpTBWV/Vx6zhE9ISNaB1z50BNzLKbhhM
         OOPV7jbjw2g+2JPcFUBSwqG/o/l1xIadPYdT7ynUWpzKN+x8S6fF/t9s3wL5GfpIpfqB
         eHmf77ieaZAalZ8pX9y03XnaMUJkD4iI7gJYnqzfFysTZM2Q+h0dBeWFXoxQigeqMKe9
         irqeYGc0LsZ2O3vcnAcsTUSE93K0iQzOX3M7VmR3PYePFCkZQtNsuvFVj9YkVAukVAGu
         SrJ0W4GMge1c2KHSa6kkl9Tfx2Ir6I/32gYGuKUlEhKtEg5zexQ81sv4fb3JNiEdjv+1
         /aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469939; x=1720074739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QMNZrdOhBJtXo/ncaekHBRhjTvNlqY+hHR6bexm0Kg=;
        b=e5mPfLiTulHHutABLbC0Z2XMWoK6znn6PQ6e+U6rCaUtPd+DgBAWKamTRUlEdVhOQA
         gqSTctP8jjfrz587sxICMzrugz1kV6vXRwbbSoez/cxmo/eXMjEI8KnSnb2k+7IXlVUQ
         JLjcYZfMKRsfgE+NCesPfKCILRNJCXJtqo7/X3MelwbZqWyJCy+LEnIFSxk9xXqjzoHX
         Ee1gFfWsnNA0g7cgv15I0amzsNTD1FIluOkgXpzrePHog/zyrOdP3SHtPHQlUHh5GU+h
         ZdkKp7HWaSkbghGjYK6qZsjAYX4n8R/Eoz9NCRuDFZLy0eT/1WGe1ahmaECsx1pmMRng
         6UQg==
X-Gm-Message-State: AOJu0YxVie1rhGa1u5TN7dk0gh1PvO54fFFjPAU8dRnRuKdngbwbGBKS
	wSfunirm7ZeFC5KCRshei7FOFBwAHY+5dJ7ti30n9jP3nNt7F+M+/W+WmC/d
X-Google-Smtp-Source: AGHT+IGdX3HAtASmxeG1l3u8Me65wpqExLFfXM/YnWYDsqo+hWhlMVAfA6L2gB8B4gEDRqffqEJZwg==
X-Received: by 2002:a17:902:db10:b0:1fa:104b:36a7 with SMTP id d9443c01a7336-1fa23ec3e4fmr152936565ad.17.1719469939158;
        Wed, 26 Jun 2024 23:32:19 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:18 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 12/17] ARM: dts: aspeed: minerva: add power monitor xdp710
Date: Thu, 27 Jun 2024 14:29:46 +0800
Message-Id: <20240627062951.936256-13-yangchen.openbmc@gmail.com>
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

Add HSC xdp710 on i2c bus0.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 3d80993885b7..0c305ddf7011 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -154,6 +154,11 @@ power-monitor@68 {
 		reg = <0x68>;
 	};
 
+	power-monitor@43 {
+		compatible = "infineon,xdp710";
+		reg = <0x43>;
+	};
+
 	leds_gpio: gpio@19 {
 		compatible = "nxp,pca9555";
 		reg = <0x19>;
-- 
2.34.1

