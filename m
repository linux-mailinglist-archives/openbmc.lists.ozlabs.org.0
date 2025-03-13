Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9006CA604D2
	for <lists+openbmc@lfdr.de>; Thu, 13 Mar 2025 23:54:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDN92194Pz3d96
	for <lists+openbmc@lfdr.de>; Fri, 14 Mar 2025 09:54:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741855868;
	cv=none; b=ToI/6BlaVKtEriFNNRy0MwT/v18tlTvM4vBExa82DixrC+gbdeX8aeIm1SJMCYNjWcZ+x8oz+028r6AJoe4TwGQ3O0MXYh14BnwOHL1TICOu917SKGComIIIuzhr0aX/K9VjhsmXcU33i++hmS2RikIv10r87fq1snV0Ca3PSTfx7A46HSog//qYJXUdEHyHajRdIyHF0NmfTC1vfmjUDB02vBO4qmMhhTLKddqFeztoREnBhonsEF2ZwW5U5HDQsP+jj6h2+W4A+k9YOUWE16jSdzXLFgRxnb/cLFcKzCdMx+SvSIJQE1gF03lPDownO1NruG1gpeqNgjIpBzoJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741855868; c=relaxed/relaxed;
	bh=NVzaxGPjCEOpRZ+68FUYLA1+urXJLhoyXwmfnE1njDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OR/FIrDAkvkTENV7sFurAvwJigWCcHEQiO/LvdVvO5mxBW6yDLaLv3GHRoiYPfdpAQCuosxbN60D5A/ivxGV6HGTOlL1Y5DSNRGZ0tGlt2T9eXxq/DVAJ6fdkSASqtX7t1Wb1P47BYtRKaX/H9pDcW9QAy6lb4Y0AC8z0aBwy1hP8ODcHwJ0tkYiMOHJ5AU6hMMMMKlV+oZ11FUs44bizIatuieQHqn7u1yuxyB8f8aKcuGXDcg1aFctukhYJLV1LI4ZWJ+5qQ+FuN9ySs2agDqS8djll6U/7ObY1BB2OQbSdcFq/bL/aaaoOYHQ3UzhEdup7+XmCoZGavgVpoxAIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 424 seconds by postgrey-1.37 at boromir; Thu, 13 Mar 2025 19:51:03 AEDT
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD1S74ZzGz2y8p
	for <openbmc@lists.ozlabs.org>; Thu, 13 Mar 2025 19:51:03 +1100 (AEDT)
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAD3_dHMmtJn8KHUFA--.4201S2;
	Thu, 13 Mar 2025 16:43:56 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Subject: [PATCH] watchdog: npcm: Remove unnecessary NULL check before clk_prepare_enable/clk_disable_unprepare
Date: Thu, 13 Mar 2025 16:43:32 +0800
Message-Id: <20250313084333.2481712-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3_dHMmtJn8KHUFA--.4201S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15tFWDXr1rCr48Ary7Jrb_yoW8JFWxpF
	WIyrWSvFW7tFWYqw43Jw4DAr1FkF42yFyfZryUCa4rWwn0yryFvFyFy34j9Fs8ArWfC3WY
	va1jyrWDC3WjyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY
	1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5l1vDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 14 Mar 2025 09:54:10 +1100
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
Cc: Chen Ni <nichen@iscas.ac.cn>, openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter.Remove unneeded NULL check for clk here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/watchdog/npcm_wdt.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index a5dd1c230137..e62ea054bc61 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -68,8 +68,7 @@ static int npcm_wdt_start(struct watchdog_device *wdd)
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
 	u32 val;
 
-	if (wdt->clk)
-		clk_prepare_enable(wdt->clk);
+	clk_prepare_enable(wdt->clk);
 
 	if (wdd->timeout < 2)
 		val = 0x800;
@@ -105,8 +104,7 @@ static int npcm_wdt_stop(struct watchdog_device *wdd)
 
 	writel(0, wdt->reg);
 
-	if (wdt->clk)
-		clk_disable_unprepare(wdt->clk);
+	clk_disable_unprepare(wdt->clk);
 
 	return 0;
 }
@@ -156,8 +154,7 @@ static int npcm_wdt_restart(struct watchdog_device *wdd,
 	struct npcm_wdt *wdt = to_npcm_wdt(wdd);
 
 	/* For reset, we start the WDT clock and leave it running. */
-	if (wdt->clk)
-		clk_prepare_enable(wdt->clk);
+	clk_prepare_enable(wdt->clk);
 
 	writel(NPCM_WTR | NPCM_WTRE | NPCM_WTE, wdt->reg);
 	udelay(1000);
-- 
2.25.1

