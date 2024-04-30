Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CF8B80AB
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 21:37:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=Y6qkihPR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTVpQ2Fl9z3cbX
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 05:37:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=Y6qkihPR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.27; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTVnq4jvQz2ygY
	for <openbmc@lists.ozlabs.org>; Wed,  1 May 2024 05:37:00 +1000 (AEST)
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 1tGXsqFYLGyax1tGXss3dW; Tue, 30 Apr 2024 21:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714505751;
	bh=skKo5kEoG79r6I+m+tXF3MUHJgIN3Agmwa3aOsSEA5o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Y6qkihPRSdTI4mGkFmI3rkql6GZAFYWajX5CbOBz7NPrpMB0fZaaMx1OU0j4milP/
	 nBPv4d1a3bzLe6GaH6/mVP6jypYcEFUD9oI9eQVNlwEoSzipjv6GzGh2ZxUZ0HdL+b
	 soQNlzkUmREM+hqL4f8iYZjoEkOUDVKz+3FEhTyDaVCJn2hrtCH5lV/+yz1SiYf6PO
	 wcilfOX7XPFSrqVWGPPUb5ilCM6jtGv6DV+b7QHBrB4DAmK871udognHxQV57EZXxS
	 We9vC8Pzli4CGyFrum4lO/Lyo4Zn2qE7KT3mPfVSyM9dTRVyVJd4b96TJy9Knh/eX6
	 DXiY6czAp7JQw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 30 Apr 2024 21:35:51 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/2] hwmon: (npcm750-pwm-fan) Remove an unused field in struct npcm7xx_cooling_device
Date: Tue, 30 Apr 2024 21:35:37 +0200
Message-ID: <74eee8aa739f94b8c6425ce3e37a427ca92243ea.1714505655.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
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
Cc: linux-hwmon@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In "struct npcm7xx_cooling_device", the 'fan_clk_freq' field is unused.
Remove it.

Found with cppcheck, unusedStructMember.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This field was added in the initial commit f1fd4a4db777 ("hwmon: Add
NPCM7xx PWM and Fan driver") but was never used.
---
 drivers/hwmon/npcm750-pwm-fan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 904816abb7c4..6d92a3b89198 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -197,7 +197,6 @@ struct npcm7xx_pwm_fan_data {
 	void __iomem *fan_base;
 	int pwm_modules;
 	unsigned long pwm_clk_freq;
-	unsigned long fan_clk_freq;
 	struct clk *pwm_clk;
 	struct clk *fan_clk;
 	struct mutex pwm_lock[NPCM7XX_PWM_MAX_MODULES];
-- 
2.44.0

