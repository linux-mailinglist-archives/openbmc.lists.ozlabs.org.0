Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BDC307459
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 12:04:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHfz28P8zDr2w
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 22:04:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XebFLL7W; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRHQG63HzzDr9W
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 21:53:42 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id o7so4060753pgl.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 02:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46YKsp2YBTtarousU/eVRcjeMfOBTotKeAkqawdQwxY=;
 b=XebFLL7WKQCnuyBhUKKEKihPiHgWXcEAn278RO7SEVlzyUZHmkce5XtxQDCqvpCMCW
 rdJ7dIVytrioBywEDdWk0bPda5wQSJh4fAiubGhf8OEc4Ybn7YYT18J1WnSlpPQ91bMS
 QLX57lVTsrrrW+0WGQofFgJZZ5fIxp2c9Ah+5xiwKuVumKpzzxlTuWazH2nz31zLksGW
 LJc9LBU9Lvjkqg/JtlYONQMVbj7YhwdUDqsINiAF+0PbNJJFoWHmBQjBSZ/yCA3AoJce
 BS95y7zhgvbWTjLJB8kel+RJxS3qBYPsIhRGKm9elhNjglPi2B8+2LGOBJT1M/mfJSZW
 qJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=46YKsp2YBTtarousU/eVRcjeMfOBTotKeAkqawdQwxY=;
 b=D5FKJARwMT5x0EN7U3dzuc+MNAoDUKL5sAdrNGgQqClhTfWPf5Yx0oFzzMYVfCYrcj
 ZCXKJ4/9v9wG9y5svjWvzIvlUif1KKi3wp77MNvO18GYt11NBZNl0c7xok5bLP8okqMd
 q1EPoSEXXb/6oMEGkjeDLZsn+e3PPWooaY3pZfw82+EqZAQ4WaruF6tAqXiqkMf0dPuV
 o5omUuI5ZdmyYyGTFl5pkZ5afypP+JOete1t7vBagCyiERU0Ao99SE32x71nXl9ig3pg
 E498PRETqj0bjD1lUwqTN6GZU4TDd9jcftsUQplx6lsPFOH3jIbLvluUwN4JKZVo6jM2
 eT5Q==
X-Gm-Message-State: AOAM532FfXgkUioAlLMOBNTYkm879ehshww/ByOSon3h+0S4QVVaX/sh
 +/YLVKzUzdBJNUwoEv6lWxRf3z3B7do=
X-Google-Smtp-Source: ABdhPJwSfD7eYzO1R5NMgbUDz178oYNbLwm8tCgles+jECA3UWUkKqhnkiU2mBMRafR50yrr0bf3nw==
X-Received: by 2002:a63:4b0f:: with SMTP id y15mr16154102pga.398.1611831219620; 
 Thu, 28 Jan 2021 02:53:39 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id q197sm5102748pfc.155.2021.01.28.02.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 02:53:38 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 6/7] common: hash: Remove a
 debug printf statement
Date: Thu, 28 Jan 2021 21:23:03 +1030
Message-Id: <20210128105304.401058-7-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128105304.401058-1-joel@jms.id.au>
References: <20210128105304.401058-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Harald Seiler <hws@denx.de>

Remove a left-over debug printf that was introduced with SHA512 support.

Fixes: d16b38f42704 ("Add support for SHA384 and SHA512")
Signed-off-by: Harald Seiler <hws@denx.de>
(cherry picked from commit 7a81989b7b04bd87d1e684f2bafdc92a9c16fecc)
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 common/hash.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/common/hash.c b/common/hash.c
index d32cd9fa1c18..c00ec4d36c41 100644
--- a/common/hash.c
+++ b/common/hash.c
@@ -136,8 +136,6 @@ static int hash_finish_sha512(struct hash_algo *algo, void *ctx, void
 	if (size < algo->digest_size)
 		return -1;
 
-	printf("hello world\n");
-
 	sha512_finish((sha512_context *)ctx, dest_buf);
 	free(ctx);
 	return 0;
-- 
2.29.2

