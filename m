Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978E68B80AD
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 21:38:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=e9vL+6Zr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTVqN1mdwz3cVb
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 05:38:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=e9vL+6Zr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.80; helo=msa.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from msa.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTVnr63M2z30Np
	for <openbmc@lists.ozlabs.org>; Wed,  1 May 2024 05:37:04 +1000 (AEST)
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 1tGXsqFYLGyax1tGfss3e5; Tue, 30 Apr 2024 21:35:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1714505758;
	bh=KS+TeFbjBWX9rgIDk409K2MoYqtyjLkv3GQe1jxfQhU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=e9vL+6ZrgjJ68/ouUB/vmJWJpMlplejctB6eF/dWgiHgPT4QjCTGD5HI4dMFlX7qf
	 bea9axvhuGIBqjh92H+7+85/GE/lg+dGQrLXFRQsfrYhtnn0vod6lhglae4o+Phnml
	 /DUG0aTQvR2K+X4R6KSOONbyAR4j+L9dlTOFmFczhtO8ruaO9HuYHUOHvD52n07Fkd
	 dQ41jZV1e6kTI0OFmn54cQcKZc6LyR5GUA+7sfXNpo7W0Ye5BH1I4ohtPxsUgdX6wr
	 rzuDyr3xW8R8T6YE/NHSpHdgUsUQe9MziyZiJ3Ha4OpSEXS5bsru9oDj5pOCei5OdM
	 vsV9NjI9XVLmw==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 30 Apr 2024 21:35:58 +0200
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
Subject: [PATCH 2/2] hwmon: (npcm750-pwm-fan) Remove another unused field in struct npcm7xx_cooling_device
Date: Tue, 30 Apr 2024 21:35:38 +0200
Message-ID: <2ff738663d40ac5ae3d0b4d2e688ff7e36032be8.1714505655.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <74eee8aa739f94b8c6425ce3e37a427ca92243ea.1714505655.git.christophe.jaillet@wanadoo.fr>
References: <74eee8aa739f94b8c6425ce3e37a427ca92243ea.1714505655.git.christophe.jaillet@wanadoo.fr>
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

In "struct npcm7xx_cooling_device", the 'pwm_clk_freq' field is only
written and never used.

Remove it and update npcm7xx_pwm_init() accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/hwmon/npcm750-pwm-fan.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 6d92a3b89198..bc8db1dc595d 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -196,7 +196,6 @@ struct npcm7xx_pwm_fan_data {
 	void __iomem *pwm_base;
 	void __iomem *fan_base;
 	int pwm_modules;
-	unsigned long pwm_clk_freq;
 	struct clk *pwm_clk;
 	struct clk *fan_clk;
 	struct mutex pwm_lock[NPCM7XX_PWM_MAX_MODULES];
@@ -691,11 +690,12 @@ static u32 npcm7xx_pwm_init(struct npcm7xx_pwm_fan_data *data)
 {
 	int m, ch;
 	u32 prescale_val, output_freq;
+	unsigned long pwm_clk_freq;
 
-	data->pwm_clk_freq = clk_get_rate(data->pwm_clk);
+	pwm_clk_freq = clk_get_rate(data->pwm_clk);
 
 	/* Adjust NPCM7xx PWMs output frequency to ~25Khz */
-	output_freq = data->pwm_clk_freq / PWN_CNT_DEFAULT;
+	output_freq = pwm_clk_freq / PWN_CNT_DEFAULT;
 	prescale_val = DIV_ROUND_CLOSEST(output_freq, PWM_OUTPUT_FREQ_25KHZ);
 
 	/* If prescale_val = 0, then the prescale output clock is stopped */
-- 
2.44.0

