Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C177CE631
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 20:20:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9fK262mJz3cNj
	for <lists+openbmc@lfdr.de>; Thu, 19 Oct 2023 05:20:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9fJd1MM5z3cGJ
	for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 05:19:41 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 39IIJW0k014667
	for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2023 21:19:32 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 18 Oct
 2023 21:19:31 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Thu, 19
 Oct 2023 02:19:29 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 19 Oct 2023 02:19:29 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 2B5B768E7C;
	Wed, 18 Oct 2023 21:19:28 +0300 (IDT)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 22D4221CFCF4; Wed, 18 Oct 2023 21:19:28 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linux@roeck-us.net>, <jdelvare@suse.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <andrew@codeconstruct.com.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>, <j.neuschaefer@gmx.net>
Subject: [PATCH v2 2/2] hwmon: npcm750-pwm-fan: Add NPCM8xx support
Date: Wed, 18 Oct 2023 21:19:25 +0300
Message-ID: <20231018181925.1826042-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20231018181925.1826042-1-tmaimon77@gmail.com>
References: <20231018181925.1826042-1-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Adding Pulse Width Modulation (PWM) and fan tacho NPCM8xx support to
NPCM PWM and fan tacho driver.
NPCM8xx uses a different number of PWM devices.

As part of adding NPCM8XX support:
- Add NPCM8xx specific compatible string.
- Add data to handle architecture-specific PWM and fan tacho parameters.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/hwmon/npcm750-pwm-fan.c | 161 +++++++++++++++++++++++++++-----
 1 file changed, 136 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index 10ed3f4335d4..324de4482e71 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -45,11 +45,6 @@
 #define NPCM7XX_PWM_CTRL_CH2_EN_BIT		BIT(12)
 #define NPCM7XX_PWM_CTRL_CH3_EN_BIT		BIT(16)
 
-/* Define the maximum PWM channel number */
-#define NPCM7XX_PWM_MAX_CHN_NUM			8
-#define NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE	4
-#define NPCM7XX_PWM_MAX_MODULES                 2
-
 /* Define the Counter Register, value = 100 for match 100% */
 #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
 #define NPCM7XX_PWM_CMR_DEFAULT_NUM		255
@@ -138,11 +133,9 @@
 #define NPCM7XX_FAN_TCPCFG_CPASEL	BIT(0)
 
 /* FAN General Definition */
-/* Define the maximum FAN channel number */
-#define NPCM7XX_FAN_MAX_MODULE			8
+/* Define the PWM and FAN in a module */
+#define NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE	4
 #define NPCM7XX_FAN_MAX_CHN_NUM_IN_A_MODULE	2
-#define NPCM7XX_FAN_MAX_CHN_NUM			16
-
 /*
  * Get Fan Tach Timeout (base on clock 214843.75Hz, 1 cnt = 4.654us)
  * Timeout 94ms ~= 0x5000
@@ -171,6 +164,15 @@
 #define FAN_PREPARE_TO_GET_FIRST_CAPTURE	0x01
 #define FAN_ENOUGH_SAMPLE			0x02
 
+struct npcm_hwmon_info {
+	u32 pwm_max_modules;
+	u32 pwm_max_ch;
+	u32 fan_max_modules;
+	u32 fan_max_ch;
+	const struct hwmon_chip_info *hinfo;
+	const char *name;
+};
+
 struct npcm7xx_fan_dev {
 	u8 fan_st_flg;
 	u8 fan_pls_per_rev;
@@ -195,15 +197,16 @@ struct npcm7xx_pwm_fan_data {
 	unsigned long fan_clk_freq;
 	struct clk *pwm_clk;
 	struct clk *fan_clk;
-	struct mutex pwm_lock[NPCM7XX_PWM_MAX_MODULES];
-	spinlock_t fan_lock[NPCM7XX_FAN_MAX_MODULE];
-	int fan_irq[NPCM7XX_FAN_MAX_MODULE];
-	bool pwm_present[NPCM7XX_PWM_MAX_CHN_NUM];
-	bool fan_present[NPCM7XX_FAN_MAX_CHN_NUM];
+	struct mutex *pwm_lock;
+	spinlock_t *fan_lock;
+	int *fan_irq;
+	bool *pwm_present;
+	bool *fan_present;
 	u32 input_clk_freq;
 	struct timer_list fan_timer;
-	struct npcm7xx_fan_dev fan_dev[NPCM7XX_FAN_MAX_CHN_NUM];
-	struct npcm7xx_cooling_device *cdev[NPCM7XX_PWM_MAX_CHN_NUM];
+	struct npcm7xx_fan_dev *fan_dev;
+	struct npcm7xx_cooling_device **cdev;
+	const struct npcm_hwmon_info *info;
 	u8 fan_select;
 };
 
@@ -333,7 +336,7 @@ static void npcm7xx_fan_polling(struct timer_list *t)
 	 * Polling two module per one round,
 	 * FAN01 & FAN89 / FAN23 & FAN1011 / FAN45 & FAN1213 / FAN67 & FAN1415
 	 */
-	for (i = data->fan_select; i < NPCM7XX_FAN_MAX_MODULE;
+	for (i = data->fan_select; i < data->info->fan_max_modules;
 	      i = i + 4) {
 		/* clear the flag and reset the counter (TCNT) */
 		iowrite8(NPCM7XX_FAN_TICLR_CLEAR_ALL,
@@ -659,6 +662,40 @@ static const struct hwmon_channel_info * const npcm7xx_info[] = {
 	NULL
 };
 
+static const struct hwmon_channel_info * const npcm8xx_info[] = {
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT),
+	NULL
+};
+
 static const struct hwmon_ops npcm7xx_hwmon_ops = {
 	.is_visible = npcm7xx_is_visible,
 	.read = npcm7xx_read,
@@ -670,6 +707,29 @@ static const struct hwmon_chip_info npcm7xx_chip_info = {
 	.info = npcm7xx_info,
 };
 
+static const struct hwmon_chip_info npcm8xx_chip_info = {
+	.ops = &npcm7xx_hwmon_ops,
+	.info = npcm8xx_info,
+};
+
+static const struct npcm_hwmon_info npxm7xx_hwmon_info = {
+	.pwm_max_modules = 2,
+	.pwm_max_ch = NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE * 2,
+	.fan_max_modules = 8,
+	.fan_max_ch = NPCM7XX_FAN_MAX_CHN_NUM_IN_A_MODULE * 8,
+	.hinfo = &npcm7xx_chip_info,
+	.name = "npcm7xx_pwm_fan",
+};
+
+static const struct npcm_hwmon_info npxm8xx_hwmon_info = {
+	.pwm_max_modules = 3,
+	.pwm_max_ch = NPCM7XX_PWM_MAX_CHN_NUM_IN_A_MODULE * 3,
+	.fan_max_modules = 8,
+	.fan_max_ch = NPCM7XX_FAN_MAX_CHN_NUM_IN_A_MODULE * 8,
+	.hinfo = &npcm8xx_chip_info,
+	.name = "npcm8xx_pwm_fan",
+};
+
 static u32 npcm7xx_pwm_init(struct npcm7xx_pwm_fan_data *data)
 {
 	int m, ch;
@@ -693,7 +753,7 @@ static u32 npcm7xx_pwm_init(struct npcm7xx_pwm_fan_data *data)
 	/* Setting PWM Prescale Register value register to both modules */
 	prescale_val |= (prescale_val << NPCM7XX_PWM_PRESCALE_SHIFT_CH01);
 
-	for (m = 0; m < NPCM7XX_PWM_MAX_MODULES  ; m++) {
+	for (m = 0; m < data->info->pwm_max_modules  ; m++) {
 		iowrite32(prescale_val, NPCM7XX_PWM_REG_PR(data->pwm_base, m));
 		iowrite32(NPCM7XX_PWM_PRESCALE2_DEFAULT,
 			  NPCM7XX_PWM_REG_CSR(data->pwm_base, m));
@@ -716,7 +776,7 @@ static void npcm7xx_fan_init(struct npcm7xx_pwm_fan_data *data)
 	int i;
 	u32 apb_clk_freq;
 
-	for (md = 0; md < NPCM7XX_FAN_MAX_MODULE; md++) {
+	for (md = 0; md < data->info->fan_max_modules; md++) {
 		/* stop FAN0~7 clock */
 		iowrite8(NPCM7XX_FAN_TCKC_CLKX_NONE,
 			 NPCM7XX_FAN_REG_TCKC(data->fan_base, md));
@@ -905,6 +965,49 @@ static int npcm7xx_en_pwm_fan(struct device *dev,
 	return 0;
 }
 
+static int npcm_pwm_fan_alloc_data(struct device *dev,
+				   struct npcm7xx_pwm_fan_data *data)
+{
+	data->pwm_lock = devm_kcalloc(dev, data->info->pwm_max_modules,
+				      sizeof(*data->pwm_lock), GFP_KERNEL);
+	if (!data->pwm_lock)
+		return -ENOMEM;
+
+	data->fan_lock = devm_kcalloc(dev, data->info->fan_max_modules,
+				      sizeof(*data->fan_lock), GFP_KERNEL);
+	if (!data->fan_lock)
+		return -ENOMEM;
+
+	data->fan_irq = devm_kcalloc(dev, data->info->fan_max_modules,
+				     sizeof(*data->fan_irq), GFP_KERNEL);
+	if (!data->fan_irq)
+		return -ENOMEM;
+
+	data->pwm_present = devm_kcalloc(dev, data->info->pwm_max_ch,
+					 sizeof(*data->pwm_present),
+					 GFP_KERNEL);
+	if (!data->pwm_present)
+		return -ENOMEM;
+
+	data->fan_present = devm_kcalloc(dev, data->info->fan_max_ch,
+					 sizeof(*data->fan_present),
+					 GFP_KERNEL);
+	if (!data->fan_present)
+		return -ENOMEM;
+
+	data->fan_dev = devm_kcalloc(dev, data->info->fan_max_ch,
+				     sizeof(*data->fan_dev), GFP_KERNEL);
+	if (!data->fan_dev)
+		return -ENOMEM;
+
+	data->cdev = devm_kcalloc(dev, data->info->pwm_max_ch,
+				  sizeof(*data->cdev), GFP_KERNEL);
+	if (!data->cdev)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -923,6 +1026,13 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->info = device_get_match_data(dev);
+	if (!data->info)
+		return -EINVAL;
+
+	if (npcm_pwm_fan_alloc_data(dev, data))
+		return -ENOMEM;
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm");
 	if (!res) {
 		dev_err(dev, "pwm resource not found\n");
@@ -960,10 +1070,10 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 	output_freq = npcm7xx_pwm_init(data);
 	npcm7xx_fan_init(data);
 
-	for (cnt = 0; cnt < NPCM7XX_PWM_MAX_MODULES  ; cnt++)
+	for (cnt = 0; cnt < data->info->pwm_max_modules  ; cnt++)
 		mutex_init(&data->pwm_lock[cnt]);
 
-	for (i = 0; i < NPCM7XX_FAN_MAX_MODULE; i++) {
+	for (i = 0; i < data->info->fan_max_modules; i++) {
 		spin_lock_init(&data->fan_lock[i]);
 
 		data->fan_irq[i] = platform_get_irq(pdev, i);
@@ -988,15 +1098,15 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
 		}
 	}
 
-	hwmon = devm_hwmon_device_register_with_info(dev, "npcm7xx_pwm_fan",
-						     data, &npcm7xx_chip_info,
+	hwmon = devm_hwmon_device_register_with_info(dev, data->info->name,
+						     data, data->info->hinfo,
 						     NULL);
 	if (IS_ERR(hwmon)) {
 		dev_err(dev, "unable to register hwmon device\n");
 		return PTR_ERR(hwmon);
 	}
 
-	for (i = 0; i < NPCM7XX_FAN_MAX_CHN_NUM; i++) {
+	for (i = 0; i < data->info->fan_max_ch; i++) {
 		if (data->fan_present[i]) {
 			/* fan timer initialization */
 			data->fan_timer.expires = jiffies +
@@ -1015,7 +1125,8 @@ static int npcm7xx_pwm_fan_probe(struct platform_device *pdev)
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

