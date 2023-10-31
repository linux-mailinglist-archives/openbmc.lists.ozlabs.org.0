Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD8E7DC7CD
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 08:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKMwx43ntz3cT2
	for <lists+openbmc@lfdr.de>; Tue, 31 Oct 2023 18:59:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKMvt392jz2ygZ
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 18:58:27 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 39V7wDei002943
	for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 09:58:13 +0200
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 31 Oct
 2023 09:58:13 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 31
 Oct 2023 15:58:11 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Oct 2023 15:58:10 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 375405F5BB;
	Tue, 31 Oct 2023 09:58:10 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 2F083235CE0F; Tue, 31 Oct 2023 09:58:10 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v4 1/1] hwmon: npcm750-pwm-fan: Add NPCM8xx support
Date: Tue, 31 Oct 2023 09:58:06 +0200
Message-ID: <20231031075806.400872-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231031075806.400872-1-tmaimon77@gmail.com>
References: <20231031075806.400872-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding Pulse Width Modulation (PWM) and fan tacho NPCM8xx support to
NPCM PWM and fan tacho driver.
NPCM8xx uses a different number of PWM devices.

As part of adding NPCM8XX support:
- Add NPCM8xx specific compatible string.
- Add data to handle architecture-specific PWM parameters.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 10ed3f4335d4..d99b24c23d25 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -46,9 +46,9 @@
 #define NPCM7XX_PWM_CTRL_CH3_EN_BIT		BIT(16)
 
 /* Define the maximum PWM channel number */
-#define NPCM7XX_PWM_MAX_CHN_NUM			8
+#define NPCM7XX_PWM_MAX_CHN_NUM			12
 #define NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE	4
-#define NPCM7XX_PWM_MAX_MODULES                 2
+#define NPCM7XX_PWM_MAX_MODULES                 3
 
 /* Define the Counter Register, value = 100 for match 100% */
 #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
@@ -171,6 +171,10 @@
 #define FAN_PREPARE_TO_GET_FIRST_CAPTURE	0x01
 #define FAN_ENOUGH_SAMPLE			0x02
 
+struct npcm_hwmon_info {
+	u32 pwm_max_channel;
+};
+
 struct npcm7xx_fan_dev {
 	u8 fan_st_flg;
 	u8 fan_pls_per_rev;
@@ -204,6 +208,7 @@ struct npcm7xx_pwm_fan_data {
 	struct timer_list fan_timer;
 	struct npcm7xx_fan_dev fan_dev[NPCM7XX_FAN_MAX_CHN_NUM];
 	struct npcm7xx_cooling_device *cdev[NPCM7XX_PWM_MAX_CHN_NUM];
+	const struct npcm_hwmon_info *info;
 	u8 fan_select;
 };
 
@@ -542,7 +547,7 @@ static umode_t npcm7xx_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
 	const struct npcm7xx_pwm_fan_data *data = _data;
 
-	if (!data->pwm_present[channel])
+	if (!data->pwm_present[channel] || channel >= data->info->pwm_max_channel)
 		return 0;
 
 	switch (attr) {
@@ -638,6 +643,10 @@ static const struct hwmon_channel_info * const npcm7xx_info[] = {
 			   HWMON_PWM_INPUT,
 			   HWMON_PWM_INPUT,
 			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
 			   HWMON_PWM_INPUT),
 	HWMON_CHANNEL_INFO(fan,
 			   HWMON_F_INPUT,
@@ -670,6 +679,14 @@ static const struct hwmon_chip_info npcm7xx_chip_info = {
 	.info = npcm7xx_info,
 };
 
+static const struct npcm_hwmon_info npxm7xx_hwmon_info = {
+	.pwm_max_channel = 8,
+};
+
+static const struct npcm_hwmon_info npxm8xx_hwmon_info = {
+	.pwm_max_channel = 12,
+};
+
 static u32 npcm7xx_pwm_init(struct npcm7xx_pwm_fan_data *data)
 {
 	int m, ch;
@@ -923,6 +940,10 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->info = device_get_match_data(dev);
+	if (!data->info)
+		return -EINVAL;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm");
 	if (!res) {
 		dev_err(dev, "pwm resource not found\n");
@@ -1015,7 +1036,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id of_pwm_fan_match_table[] = {
-	{ .compatible = "nuvoton,npcm750-pwm-fan", },
+	{ .compatible = "nuvoton,npcm750-pwm-fan", .data = &npxm7xx_hwmon_info},
+	{ .compatible = "nuvoton,npcm845-pwm-fan", .data = &npxm8xx_hwmon_info},
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_pwm_fan_match_table);
-- 
2.33.0

