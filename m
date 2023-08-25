Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F336E7885DC
	for <lists+openbmc@lfdr.de>; Fri, 25 Aug 2023 13:37:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=bYKgv83l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHxn3pf9z3cm2
	for <lists+openbmc@lfdr.de>; Fri, 25 Aug 2023 21:37:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.a=rsa-sha256 header.s=default header.b=bYKgv83l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ispras.ru (client-ip=83.149.199.84; helo=mail.ispras.ru; envelope-from=m.kobuk@ispras.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 478 seconds by postgrey-1.37 at boromir; Fri, 25 Aug 2023 20:23:57 AEST
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXGJY69dxz3bw4
	for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2023 20:23:57 +1000 (AEST)
Received: from tundra.lovozera (unknown [83.149.199.65])
	by mail.ispras.ru (Postfix) with ESMTPSA id B430F40F1DC6;
	Fri, 25 Aug 2023 10:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru B430F40F1DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1692958549;
	bh=kKznDWybMt3pUOgS2VaRpyBJI19OwHraJWYAQXNusOI=;
	h=From:To:Cc:Subject:Date:From;
	b=bYKgv83lcUXnxg3+5kf0gJvjUt7di+rlvBPNGeVcErEiI43n5nO4jrxM3vAJhegNT
	 zpw1lX1wr4DfqWf+uAthxCu36FfNwo7hHIBlU+L/2S8J68NHhIIKF+Gke+/MolNmlk
	 zAJVFnQyJPcUeCf+T1Pkb+J0U+OEyvDMFAy0W2bw=
From: Mikhail Kobuk <m.kobuk@ispras.ru>
To: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH] pinctrl: nuvoton: wpcm450: fix out of bounds write
Date: Fri, 25 Aug 2023 13:15:28 +0300
Message-ID: <20230825101532.6624-1-m.kobuk@ispras.ru>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Aug 2023 21:33:02 +1000
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
Cc: lvc-project@linuxtesting.org, Linus Walleij <linus.walleij@linaro.org>, Mikhail Kobuk <m.kobuk@ispras.ru>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Alexey Khoroshilov <khoroshilov@ispras.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Write into 'pctrl->gpio_bank' happens before the check for GPIO index
validity, so out of bounds write may happen.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a1d1e0e3d80a ("pinctrl: nuvoton: Add driver for WPCM450")
Signed-off-by: Mikhail Kobuk <m.kobuk@ispras.ru>
Reviewed-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index 2d1c1652cfd9..8a9961ac8712 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -1062,13 +1062,13 @@ static int wpcm450_gpio_register(struct platform_device *pdev,
 		if (ret < 0)
 			return ret;
 
-		gpio = &pctrl->gpio_bank[reg];
-		gpio->pctrl = pctrl;
-
 		if (reg >= WPCM450_NUM_BANKS)
 			return dev_err_probe(dev, -EINVAL,
 					     "GPIO index %d out of range!\n", reg);
 
+		gpio = &pctrl->gpio_bank[reg];
+		gpio->pctrl = pctrl;
+
 		bank = &wpcm450_banks[reg];
 		gpio->bank = bank;
 
-- 
2.42.0

