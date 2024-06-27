Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2B91B27A
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:05:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h7LP4+ne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9Dgl6KXKz3cmp
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 09:05:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h7LP4+ne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8pdH4HHtz2ysc
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 16:32:02 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-718b714d362so3975401a12.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 23:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719469919; x=1720074719; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwLRvqkTKJTXMBBbAKtuEYSjWz9CZpPrtmi6SvMMZc0=;
        b=h7LP4+nenRvjEWldlICiXHi0nl5S3LmjxtYZXy0Hutc859FH3tAEl6R2IbX5yv6LCl
         BA6bnnL/UqjNvgoBP72ORdxUg56QHN57JXB6a7QjhzATAbHzTrCqvE48xlWup3JPy9ai
         hccrOCKC4Xdem7l7uiJ7/blVA4j9AHJkPbeffR0+8AS4JDwMzk51Z8wp5x3zwMRrNYpG
         l8NGYvlWZP3FDVFrNtiPKC+nyWrAmiYu/R4wVHWrnEam9P92rlDkJHV7vq0TKddKN0YQ
         Od54XnGSQITonlIhb0SPt8/xMdFrQWw+rDbR5mBRhVbZqOkd2Fgxs0fpOCKv4APUKK+e
         nXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469919; x=1720074719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwLRvqkTKJTXMBBbAKtuEYSjWz9CZpPrtmi6SvMMZc0=;
        b=tAa6gWWmi8cN2qchTutqWUPnHHdcYRdY4+MBgth0ugrLxRjYO2jJBeG05lZKC3KUah
         7l3ldz2BgevCVgPBTTgtP3rsQxMRRIZH596XL5Tpu9C6F1DOCBK+DzwIwPXy0u1xhAa8
         DSj6GgCXViW7w6T/NJMgGbdGQd1zeXux3rA6JMKM/nVif5IXXfk1m1pHzUr74UW3fT9h
         kOboFQiknW6AuYBs48/+Wkj7CRgDaXjGnKyRrsk2azGdWu8AUNzmHvoHmml0Djzwd5jI
         SXTGY/hwQpH4KPJd5lN9V2RKiTnceRgekR+I8xA4A7Oq2iLZhNglkOVAC1fUNTWrxDUC
         JhVg==
X-Gm-Message-State: AOJu0YwTdXi/B9XejzC3cnuCKPygLkBRU4l7AH49i4ff101FPGb3Chv8
	GRGdHyMSjKayp1XhV43JfdpHr1gJMdAl74ffQKQwamQO3aUgyzJanisrYXze
X-Google-Smtp-Source: AGHT+IEiAB7Li/q5nA8hY+EFCk3/SrS+W/VoF1GFIkGwGXk+bGw8bP0VSL8dzHqVrqIgU3pStUI/ng==
X-Received: by 2002:a05:6a20:f12:b0:1bd:25bd:ef6a with SMTP id adf61e73a8af0-1bd25bdf152mr5170343637.22.1719469919499;
        Wed, 26 Jun 2024 23:31:59 -0700 (PDT)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac97a122sm5403235ad.176.2024.06.26.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 23:31:59 -0700 (PDT)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: openbmc@lists.ozlabs.org,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 02/17] ARM: dts: aspeed: minerva: change aliases for uart
Date: Thu, 27 Jun 2024 14:29:36 +0800
Message-Id: <20240627062951.936256-3-yangchen.openbmc@gmail.com>
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

Change and add aliases name for uart interface.

Signed-off-by: Yang Chen <yang.chen@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
index e20e31917d6c..ca3e417d2c7e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts
@@ -11,7 +11,8 @@ / {
 	compatible = "facebook,minerva-cmc", "aspeed,ast2600";
 
 	aliases {
-		serial5 = &uart5;
+		serial4 = &uart5;
+		serial5 = &uart6;
 		/*
 		 * PCA9548 (2-0077) provides 8 channels connecting to
 		 * 6 pcs of FCB (Fan Controller Board).
-- 
2.34.1

