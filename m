Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00F31322C
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 13:22:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4sZ07xXzDqMl
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 23:22:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hisilicon.com (client-ip=45.249.212.191;
 helo=szxga05-in.huawei.com; envelope-from=tiantao6@hisilicon.com;
 receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYRN13pvrzDqqy
 for <openbmc@lists.ozlabs.org>; Sun,  7 Feb 2021 22:12:51 +1100 (AEDT)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DYRKY3MdlzMWRN;
 Sun,  7 Feb 2021 19:10:57 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Sun, 7 Feb 2021 19:12:37 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <jdelvare@suse.com>, <linux@roeck-us.net>, <thierry.reding@gmail.com>,
 <lee.jones@linaro.org>
Subject: [PATCH] hwmon: (npcm750-pwm-fan): replace spin_lock_irqsave by
 spin_lock in hard IRQ
Date: Sun, 7 Feb 2021 19:12:13 +0800
Message-ID: <1612696333-50502-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 08 Feb 2021 22:58:06 +1100
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 11a2860..6c27af1 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -481,12 +481,11 @@ static inline void npcm7xx_check_cmp(struct npcm7xx_pwm_fan_data *data,
 static irqreturn_t npcm7xx_fan_isr(int irq, void *dev_id)
 {
 	struct npcm7xx_pwm_fan_data *data = dev_id;
-	unsigned long flags;
 	int module;
 	u8 flag;
 
 	module = irq - data->fan_irq[0];
-	spin_lock_irqsave(&data->fan_lock[module], flags);
+	spin_lock(&data->fan_lock[module]);
 
 	flag = ioread8(NPCM7XX_FAN_REG_TICTRL(data->fan_base, module));
 	if (flag > 0) {
@@ -496,7 +495,7 @@ static irqreturn_t npcm7xx_fan_isr(int irq, void *dev_id)
 		return IRQ_HANDLED;
 	}
 
-	spin_unlock_irqrestore(&data->fan_lock[module], flags);
+	spin_unlock(&data->fan_lock[module]);
 
 	return IRQ_NONE;
 }
-- 
2.7.4

