Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC62D542F
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 07:52:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cs4NT6HK2zDqpv
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 17:52:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cs4Mg0VvWzDqkB;
 Thu, 10 Dec 2020 17:51:41 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 0BA6lCla046149;
 Thu, 10 Dec 2020 14:47:12 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from TroyLee-PC.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Dec 2020 14:50:07 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] gpio: aspeed: Lock GPIO pin used as IRQ
Date: Thu, 10 Dec 2020 14:50:13 +0800
Message-ID: <20201210065013.29348-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 0BA6lCla046149
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
Cc: leetroy@gmail.com, troy_lee@aspeedtech.com, ryan_chen@aspeedtech.com,
 chiawei_wang@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

GPIO pins can be used as IRQ indicators. When they do,
those pins should be flaged with locks to avoid kernel
warning message.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index b966f5e28ebf..f5b3e1d89fbf 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -651,6 +651,13 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 		aspeed_gpio_copro_release(gpio, offset);
 	spin_unlock_irqrestore(&gpio->lock, flags);
 
+	rc = gpiochip_lock_as_irq(&gpio->chip, d->hwirq);
+	if (rc) {
+		dev_err(gpio->chip.parent, "unable to lock GPIO %lu as IRQ\n",
+			d->hwirq);
+		return rc;
+	}
+
 	irq_set_handler_locked(d, handler);
 
 	return 0;
-- 
2.17.1

