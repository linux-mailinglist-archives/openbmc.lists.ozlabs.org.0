Return-Path: <openbmc+bounces-55-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F1ABCBED
	for <lists+openbmc@lfdr.de>; Tue, 20 May 2025 02:11:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1Zj04Xynz30Wh;
	Tue, 20 May 2025 10:11:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747670071;
	cv=none; b=Gj8cIu/G8UiwFdcuUCDmwXru1B38UvnsdHRgRxIakl9MsbBAzvA8jHungG+cIylDT8BlXRiVvzeyGec9QGRDAv9rXqPfOGApRrT/YwKS/5s1rZrmon4FZhwqC2mJ1JQc9dF1O1EJG3kQyywvpOCoVXTEt/zyLPn+Sbj2iHkoS03+Q3oSsQGicd84xaAElD1nEmmvXfsTDZlO6eTASGIEfgOOgs+cnB3KWqejpFk6EPwbtURN4uTUKw78sOCdVlKsm4DsWd9ovSjLLiaeHICjFJSqzDpJdtIYeY14TOsA9GBvXLVHxMLT994hLPSt3XKcwmt25GdA2SUFXiwLRtUBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747670071; c=relaxed/relaxed;
	bh=Eq6RLdHz68YLdr0bBQgd4HZGmp0YB9HW9inPA2P5EuI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPuSlC3DQ2PyFcp7fhOCLXcSqNYXyuv+TdZ4tjvhs1UePSKDqgFpOgzqEmbbuwlyJm2KrYsrWxNBNd613BCHWWZtx1nHmS7XNvGTFslaTT/eAfNmkF0zknBq6rNUQ8U/Q/s0LQoofRSnWO4R8QROrYT8co46LBMd7afvnjZJBmE52PTVFshC27S3Gh2PuyVcPVa4XaitspXFixwVYdojGox4eVWtvtPNR30Ww3pW/EEehsh2+CI2N8yDdUCyCWB1EuJHJcLIfOIfzlFRJPr1ufC31tvcC3WKarxRJt8bPkZ40DDow+x5ali26o8hEVLrTz+51QnVwxZ1XYQDbyMfEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R+b02PND; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=bhung2011@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R+b02PND;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=bhung2011@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Mgn5WTRz2yhV
	for <openbmc@lists.ozlabs.org>; Tue, 20 May 2025 01:54:28 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2322d8316f6so1620445ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 19 May 2025 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747670064; x=1748274864; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq6RLdHz68YLdr0bBQgd4HZGmp0YB9HW9inPA2P5EuI=;
        b=R+b02PNDwVlaHV+MO2c5sLTULxnBCY1x7bGNKnUkSkjZqbQOKnkzdcdeqpXGbS4TvU
         s97/AmN7cZ/sFpK6Gd/0XkFzI/yYR1hoJsUXWzfc9rFRLhk7lLmOjBl+0vp4uXB97/0z
         KvtDBi7WnQsJ3lmnaSYI1MymBXrvGwko61CQFx599wj1bXF4eRQ/fV+tsT0OwR2uXnNW
         IGSk6D0gM8VMqd3r22hmDGYDMXUtJ1B0h20339lbYoW/WMSjQt1YtFAKLXdTJMnqL51W
         YSzbRocLFpMMqqw8KVff28MMWKp15sC1dVKCUrHvAMPfKsXS5UhcXaTzB6ONA2PDaTak
         B5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670064; x=1748274864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq6RLdHz68YLdr0bBQgd4HZGmp0YB9HW9inPA2P5EuI=;
        b=O8mO7mACOW8oZE7MB9u8gdmLXNnb9oPSN6MLkpR6+iJCqbFlF0jEPnzBYN8isy+4R7
         G9xtvpIY5crUncxOGZcI1gjIDS4g362ZRj5hRi9EG/E5vkF24+lzHkEE99ACe8YB4HO8
         FEivHPKj0Jinr0ns46h32EJ5ifI/RryUp75b9P0ti86+xXe6Jl6SQEv53yxAP/OgyIEg
         3H4dsM+6OQjp+XCrC7ff9rqQeNBvVKTYDGo7avwxw75g3dKERz59McHy7wzNX8hpuZQG
         11CdTjTfpmduKyEQ91AEmRU10oXzZysmDhIdfOrQYZno2+NWgWKHTgvMqQV9uestbdVZ
         V1XQ==
X-Gm-Message-State: AOJu0Yy+L0i6Lu9VPJMllGCduICimAr26G2DxDycIC4Dqax6n7/I0XHn
	LOk1EW+I5mC0TvyHs/lfyrMlhDDzvfT51YM65omWcKl5/cppQkudktqgAepqtgL4
X-Gm-Gg: ASbGncsqzG51JHsJLcX0uFLNe6V3GLwMMQJ0m5Z60a2JOHZ1FKOk7HZ3J7zEXQ+Q4KL
	125ohZkoYkRjTsbCLaJZueCWaPnDB3dIj3g3uXWP7kLyzCtyo7mgdFnZAFfU2m6Ky+X1ZFJ4TSm
	MOzyJkLcmS9ajfoMlBYxz1XiJSdrtUjOCElIfWZz+no5IG4TsFiqaev9fu4B6xQbH1Hp8geXZFD
	/Q3U09XIzPIblRez8+mJjEbnBThanQxovXQbtWflf2qN0t1W/USuF9RHzb3CJfQEFl+u+NTTDF/
	SrWrzPbGaHQf6kY4whu9RAVcIFez1ufwl4cxnX8WKL155YuL/MHMrtzX7Wq1QG/tWkwx5YAurlC
	0/AXCB8cgmIYG2Z+E3ofmrDV/yQsoRCH/pS4P
X-Google-Smtp-Source: AGHT+IFpeG+M5cfuyJSH0+BSwDYLU6A/LNtF7tQh+FyCkveA9/ypEWM1RBO2mwXdkwnHtI/4SFnIIg==
X-Received: by 2002:a17:902:e786:b0:223:f9a4:dc25 with SMTP id d9443c01a7336-231d452f749mr68051515ad.14.1747670064131;
        Mon, 19 May 2025 08:54:24 -0700 (PDT)
Received: from f7e558999891.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed4815sm61041445ad.232.2025.05.19.08.54.23
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 08:54:23 -0700 (PDT)
From: Bruce Hung <bhung2011@gmail.com>
X-Google-Original-From: Bruce Hung <bruce.jy.hung@fii-foxconn.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: Aspeed: Add Clemente into Facebook DTS
Date: Mon, 19 May 2025 23:54:13 +0800
Message-ID: <20250519155413.1235110-1-bruce.jy.hung@fii-foxconn.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509085741.114733-1-bruce.jy.hung@fii-foxconn.com>
References: <20250509085741.114733-1-bruce.jy.hung@fii-foxconn.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce Meta Clemente system with Aspeed 2600 BMC.

Signed-off-by: Bruce Hung <bruce.jy.hung@fii-foxconn.com>
---
 arch/arm/dts/ast2600-facebook.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/dts/ast2600-facebook.dts b/arch/arm/dts/ast2600-facebook.dts
index c742ac1dc3..5be7838589 100644
--- a/arch/arm/dts/ast2600-facebook.dts
+++ b/arch/arm/dts/ast2600-facebook.dts
@@ -6,7 +6,11 @@
 
 / {
 	model = "Facebook BMC";
-	compatible = "facebook,harma-bmc", "facebook,minerva-bmc", "facebook,catalina-bmc", "aspeed,ast2600";
+	compatible = "aspeed,ast2600",
+		"facebook,catalina-bmc",
+		"facebook,clemente-bmc",
+		"facebook,harma-bmc",
+		"facebook,minerva-bmc";
 
 	memory {
 		device_type = "memory";
-- 
2.43.0


