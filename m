Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABAA577DEE
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbHN19l9z3c2m
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 18:49:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MIc9pbE0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MIc9pbE0;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmbFb0zpRz2y8Q
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 18:47:46 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id o31-20020a17090a0a2200b001ef7bd037bbso11991464pjo.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UR8vfJwi1JHeYXJ5rvJbe3Bu5zdg9NFprU1ttfUHBmg=;
        b=MIc9pbE0Sw+pzwOQmKunh9BuSE7tQZSxqDJ9OT/ZYs4KzV4QPWi8g/fyWZca8ss0wx
         gRcxwS+JYJIF8z2YDBGo75hia1oJUeApgiWPjvCfOlUgpIcc5YwECj+3vNK18L06PET8
         8yW9TLe6rzP0vvjo6GEi6ikbbRSklGlVR1SeRpFJh8QnBSLSlExE3hN4lezPexnVmMWw
         BnoCD/7bUuDDSVzh/QOmLKTNiBae7tHUCyi8h4CJJNp4UF9qM5Ur76Ri9rp4JEu/CXrN
         jeEvWRJPxxofOo7WNsRGvTsAIin/mEeGiFcsn900qNNeCJ/rkGRnl7EXjHtiaVsVp6W/
         A3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=UR8vfJwi1JHeYXJ5rvJbe3Bu5zdg9NFprU1ttfUHBmg=;
        b=xYKpWdC1h+cMojlnoTkb04N78DT3+j2mzbUDX1/XwhvYx/qzPCgggJVnWMcNQkubae
         yRXrQNrvmfw523zFraexa8EOnY+WMTfwOjUhlc8CqbT5ej5Fs0SVsfmU+w0BZYHmm/Cp
         ks0gwLMMdsPvKtYkBRaYB5OWUyhllAsLKdKpbXYOIn6mpUCaXNHN0TEz/HJ+ew9gZDME
         VvymCkJI+VJclXLYCwnRvoOHtHdHPZORIZnwphx44Yi9mXvGsXnNZeHIxmwL2pKG0/ny
         +aYbHCM/Su5RAGrOSz24ZOwjyoQgsjwSm2Vbq9pbQtTbbplkcxD47qw82U2rt/+cTlVL
         mfIw==
X-Gm-Message-State: AJIora9xdaK+53uBq42NC7QyiiDWiPE6TERiaYnNXr+K2GCF0emL2Mr8
	zOBrvWWc2VgdQcrKi4LfZdm006VsSdE=
X-Google-Smtp-Source: AGRyM1uMfKCQT7dgi/L6slGWvmIGRgOoxmA2/gpvL1BCmwQffMWIgdul6OZOakIyQJzhGWZON5IzuQ==
X-Received: by 2002:a17:903:3011:b0:16c:3dba:37e4 with SMTP id o17-20020a170903301100b0016c3dba37e4mr26782732pla.122.1658134064247;
        Mon, 18 Jul 2022 01:47:44 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id i28-20020a056a00225c00b005289521b656sm8806095pfu.92.2022.07.18.01.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:47:43 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/5] cmd/otp: Use any MOD_EXP driver
Date: Mon, 18 Jul 2022 18:17:25 +0930
Message-Id: <20220718084728.1140108-3-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220718084728.1140108-1-joel@jms.id.au>
References: <20220718084728.1140108-1-joel@jms.id.au>
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Instead of requesting the ACRY driver specifically, ask for the first
DM device that implements MOD_EXP.

Selecting RSA ensures that one of the MOD_EXP drivers will be built in.
On Aspeed platforms this will be either the ACRY or the software
implementation; Kconfig logic stops both from being built in.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 cmd/otp.c   | 4 ++--
 cmd/Kconfig | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/cmd/otp.c b/cmd/otp.c
index 4e901fbff996..049c217d6048 100644
--- a/cmd/otp.c
+++ b/cmd/otp.c
@@ -2642,9 +2642,9 @@ static int otp_verify_boot_image(phys_addr_t addr)
 	int i;
 	int pass = 0;
 
-	ret = uclass_get_device_by_driver(UCLASS_MOD_EXP, DM_GET_DRIVER(aspeed_acry), &mod_exp_dev);
+	ret = uclass_get_device(UCLASS_MOD_EXP, 0, &mod_exp_dev);
 	if (ret) {
-		printf("RSA engine: Can't find aspeed_acry\n");
+		printf("RSA: Can't find RSA driver\n");
 		return OTP_FAILURE;
 	}
 
diff --git a/cmd/Kconfig b/cmd/Kconfig
index 1df26de5ed23..ff90a5d99acc 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -622,7 +622,6 @@ config CMD_OTP
 	select SHA384
 	select SHA256
 	select RSA
-	select ASPEED_ACRY
         default y
 
 config CMD_RNG
-- 
2.35.1

