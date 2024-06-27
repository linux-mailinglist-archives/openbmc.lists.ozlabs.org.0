Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8590491B298
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:17:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DlIBd+2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dx15tntz3cYj
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:17:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DlIBd+2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdj6SV9z30Wn
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:25 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1f9de13d6baso54437395ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469945; x=1720074745; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhe6DN+SBff5XTkDHWzhpS9fEwRiEep85mCGDZa7d1w=;
        b=DlIBd+2cwDBfrFcCVnrGHRSU0SxD8J34tD0mTuk3WfoNILBr/VrsbkzNqsU2iW15TM
         5skV7ydly0e3RON86Prv9svW3lF3aCwzKKmeiz+eC3+Sg7CMQeyGyu+njbzeij6bP1f6
         EyiJUH+ftLjQl3vZEpC8fIFmLQR5PM/UiBAZSgfyiPDsJiQXbdwa97NLxzRfFqgLE4kw
         DlLYRzbLN3Ijm1bQvEC3aAdxjJCXKnXc7z5u0feMVp8zVh0TOL3OU7QgLnNNV7sf4z//
         ZTqgXZ6TK0DX6QZ/1z9/e95OasmyVeNbynBjy8Db0PI9LZ+W+jI8ZOoxEEuoDvKL1+iU
         FS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469945; x=1720074745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhe6DN+SBff5XTkDHWzhpS9fEwRiEep85mCGDZa7d1w=;
        b=aIMOEqEv1TqcGFySr7nBFSwE0dHlJCh5MN1X2U5387cx00iH8QWhIQPhSeKpf5Ojad
         XN3QjJmHDNbZnzswBnRMDQ74Uwi/dY2oXckddTkHGtCUPXiR6wrRGE1d+wgwJy60jLzP
         cJvysSyqpwsimP+Xj8iJf3kLO8KX0bmmxD+p1WE5hfnlVV/L3Mv/HCvpCWwS9pmnOJwe
         oopGrXowqrhIgLS6sacovJhins9LcZ8kzrS/ZG02o+itPTLseq1tONRlhBH8x89iaUpf
         V3t9D/pSsoCCnb8WdDaBBFydmDvpEwIXJGXRIisxHXza36bwBnEeKFmLpwHIqiAUnnN1
         Irwg==
X-Gm-Message-State: AOJu0YxHc31A6+iWWP47l2JSotBuM7B3Mlm1E0TaeXyp+EERPoApz3jq
	2DUFiE2ts1ZKvEY4byXePDX0FMe3g/x9hN00qHz3GIMp0lTn7+/ofvpHMq3+
X-Google-Smtp-Source: AGHT+IGgb54tTasvnxt5oPcCab//04IlbeDdEGwHY/Gq3juR83rnXtGsEMZASKvnYR8ni3HmzuroCA==
X-Received: by 2002:a17:902:d2cc:b0:1fa:3428:53c2 with SMTP id d9443c01a7336-1fa3428591bmr127647655ad.63.1719469944809;
        Wed, 26 Jun 2024 23:32:24 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:32:24 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 15/17] ARM: dts: aspeed: minerva: remove unused power device
Date: Thu, 27 Jun 2024 14:29:49 +0800
Message-Id: <20240627062951.936256-16-yangchen.openbmc@gmail.com>
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

Remove unused power device.

Signed-off-by: Yang Chen <yangchen.openbmc@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index 8f3f15a5c148..093305b598dc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -144,16 +144,6 @@ power-monitor@41 {
 		shunt-resistor = <1000>;
 	};
 
-	power-monitor@67 {
-		compatible = "adi,ltc2945";
-		reg = <0x67>;
-	};
-
-	power-monitor@68 {
-		compatible = "adi,ltc2945";
-		reg = <0x68>;
-	};
-
 	power-monitor@43 {
 		compatible = "infineon,xdp710";
 		reg = <0x43>;
-- 
2.34.1

