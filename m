Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5000E5A7353
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 03:27:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHRNv0wn7z3c1c
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 11:27:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=bg5.exmail.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 125 seconds by postgrey-1.36 at boromir; Thu, 25 Aug 2022 22:49:35 AEST
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD2q35TSSz2xGv
	for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 22:49:35 +1000 (AEST)
X-QQ-mid: bizesmtp70t1661431303tun531a5
Received: from localhost.localdomain ( [182.148.14.124])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Aug 2022 20:41:41 +0800 (CST)
X-QQ-SSF: 01000000002000C0E000B00A0000000
X-QQ-FEAT: zT6n3Y95oi325WtJj3R+SBXlydZNdWUy0p7FgGbcskg2dnkGMzsGYmwG7L/st
	Ks9uO2pGqM/aDIMLA8yM6Mqjsj+PCVLbesg6+nKFBRm3JeMyN6mw4Zig5C9GSw83NdwZu6E
	MJtfRTNqF8OJuG/1lvMqv6vTG3796B+rXImur3swG911Yl7ah70h6WaCTdLDfFU3PK+ouTH
	/DTGsE//cA9cgiiRVugOxpRVNTjf4syPV+mF2IGleeUPdjCjNB3H+1ywlGHopjWOkxBO7ig
	Jw4HMDPLji53V7iWnRhLbjx1VQWhnHyL5qLpQcgbwk979y5jQjziiC+Dw0oGkUorrNFGTCR
	HYjBPraHnV9wsqmLui+Yh+iIMfsjKWXjpGfgKlLrWHw97tGFwSr+mBQVdqvevf75B0WvTfu
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: linus.walleij@linaro.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH] pinctrl/nuvoton: Use 'unsigned int' instead of just 'unsigned'.
Date: Thu, 25 Aug 2022 20:41:34 +0800
Message-Id: <20220825124134.30242-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:26:58 +1000
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Jilin Yuan <yuanjilin@cdjrlc.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

'unsigned int' should be clearer than 'unsigned'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 64d8a568b3db..1c4e89b046de 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -81,11 +81,11 @@ struct npcm7xx_gpio {
 	int			irq;
 	struct irq_chip		irq_chip;
 	u32			pinctrl_id;
-	int (*direction_input)(struct gpio_chip *chip, unsigned offset);
-	int (*direction_output)(struct gpio_chip *chip, unsigned offset,
+	int (*direction_input)(struct gpio_chip *chip, unsigned int offset);
+	int (*direction_output)(struct gpio_chip *chip, unsigned int offset,
 				int value);
-	int (*request)(struct gpio_chip *chip, unsigned offset);
-	void (*free)(struct gpio_chip *chip, unsigned offset);
+	int (*request)(struct gpio_chip *chip, unsigned int offset);
+	void (*free)(struct gpio_chip *chip, unsigned int offset);
 };
 
 struct npcm7xx_pinctrl {
-- 
2.36.1

