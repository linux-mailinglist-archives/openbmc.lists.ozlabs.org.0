Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F33616B2
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 02:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLxVY4yYVz3bqs
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 10:12:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s1H68uyi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s1H68uyi; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLxVH3b0Rz302V;
 Fri, 16 Apr 2021 10:12:22 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id s14so8135807pjl.5;
 Thu, 15 Apr 2021 17:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uOD33pWWzSYPL/0r0lD9kRWmPd2Gntdg/sWshNtZopQ=;
 b=s1H68uyiA8xZr1m0pvhQEKXukTF7w0kdfEjKzTB7M0AslrsTUFnckgp6j5PjoMi0/V
 A8dClVXat85tcE1+h1Ph0Hw6PXrknoaUDXPzKC61pdls3wN9f0zxSent7iHTnrdPKFcn
 Q84fWDl6P8WNvpLENrboT274s5+HBcrh+Nbm8gkmR8QRXLo5Z8uokTjva9/txgahX9FT
 LjGeOYsbxQ4dgHZ81c6ejSDhWkGp6dJhFg9KYB37298PzoiDSVEWKfZf3qcflyZtcZZF
 mTr5EaoKarVxSTmYVAuxQXwdw44T/B1WdhxrF8ATzLdPusShyX3JHN4rB5eU2VsLUNIF
 tPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uOD33pWWzSYPL/0r0lD9kRWmPd2Gntdg/sWshNtZopQ=;
 b=UbJvx40vu7D3+L0WG0clVmsnA2yfIIwVTTiZ1K/35AAb3HEj8N35xpTqXHoin7ZZiK
 UirrTQAVWyom+lTbr66BzbflL+FOBE12pSwpTwr3CHBnsDYYtNbxzoIarNOYR0K7UXc5
 ymHY4uo2Jc2EFykm+AFESfjsN86n+SSvCNxm2tM6hmIpgVRnyur83zE33G0br1606Oxt
 M1uOvB9PG9Oe2gFtBznexf+Fu/B3XAWvpte2AgKhDNiYIaxWkhL0DFnZdexNuNGLU6Fx
 Ai2BGyIFJ+Emhmnvy3JgAtororcJmP65E1ujsHdF6/m5gkFs3if3nBTY2J55n5e8R2vR
 vkwQ==
X-Gm-Message-State: AOAM531d3LE1GIdNdFqvpCxmxHEXBE34ZEk0qhY/gf/58f61xZCcs98q
 TK5sC0Tryu05xMsBX3d1330=
X-Google-Smtp-Source: ABdhPJziviff8FmqFA3GpFk3TKqox3jUoOSSMevoRcrU2y1YmgbUbciZYiBwxLlCoVyAGMxBE42qVw==
X-Received: by 2002:a17:90a:352:: with SMTP id
 18mr6329781pjf.223.1618531939116; 
 Thu, 15 Apr 2021 17:12:19 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id p10sm3312611pgn.85.2021.04.15.17.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 17:12:18 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Tao Ren <taoren@fb.com>, Amithash Prasad <amithash@fb.com>
Subject: [PATCH] watchdog: aspeed: fix integer overflow in set_timeout handler
Date: Thu, 15 Apr 2021 17:12:08 -0700
Message-Id: <20210416001208.16788-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Fix the time comparison (timeout vs. max_hw_heartbeat_ms) in set_timeout
handler to avoid potential integer overflow when the supplied timeout is
greater than aspeed's maximum allowed timeout (4294 seconds).

Fixes: efa859f7d786 ("watchdog: Add Aspeed watchdog driver")
Reported-by: Amithash Prasad <amithash@fb.com>
Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/watchdog/aspeed_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index 7e00960651fa..9f77272dc906 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -145,9 +145,8 @@ static int aspeed_wdt_set_timeout(struct watchdog_device *wdd,
 	struct aspeed_wdt *wdt = to_aspeed_wdt(wdd);
 	u32 actual;
 
-	wdd->timeout = timeout;
-
-	actual = min(timeout, wdd->max_hw_heartbeat_ms * 1000);
+	actual = min(timeout, wdd->max_hw_heartbeat_ms / 1000);
+	wdd->timeout = actual;
 
 	writel(actual * WDT_RATE_1MHZ, wdt->base + WDT_RELOAD_VALUE);
 	writel(WDT_RESTART_MAGIC, wdt->base + WDT_RESTART);
-- 
2.17.1

