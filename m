Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5F89BD99
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 12:54:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aP5xEg3C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCmDj3NDmz3vZW
	for <lists+openbmc@lfdr.de>; Mon,  8 Apr 2024 20:54:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aP5xEg3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCm9R3wKFz3cFN
	for <openbmc@lists.ozlabs.org>; Mon,  8 Apr 2024 20:51:23 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e0bfc42783so37942005ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2024 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712573480; x=1713178280; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7/GdjdAqg6yXuBQ1osmq86cQImRlbiowTI8w4XNmFE=;
        b=aP5xEg3CUqHTpDUh5fUUfEQydaNSsuNy1pH2O1hYa2eHGqZs4d798dBVujkmvAFlnG
         ceGdjuoK0PbC5rxAJX0jy2gmLrm4cqduiEYrRZVHy92SVimMgASBaaUY7d+dayFDvgeq
         WQBgOszHNKTGblM0i8IeOBgtenoGb1ikHMAWMKC9ciCD9Yypxcr0XWks5i0XSBImWqWZ
         jvV6kHancTnhkn58Jtx5BtjHVkJV+ciC+5cAZVIPnTtD5Y2WuZRNgDYsmTe97XOSfmS6
         iV2qcXS97WsQlunM/xW1RL7O5mHZD2xc87pYli4wRPWolwhuoYI9dFrGjOGcUrTocmZc
         tqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712573480; x=1713178280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7/GdjdAqg6yXuBQ1osmq86cQImRlbiowTI8w4XNmFE=;
        b=SKiheq8ZCBS3b8qfRdDcGftKU3G/u2fbZNTw+0K6hK5EpbxcL3WiNhLKJGHtAa0j/7
         M9bVpOxmSlIcPt4jtAOhHTYzH1gNkkD4prQ8dRE/pmV8CXIjIu1FZUnKm0626RweLZZ9
         BpdWc6mtIFXyCbb4EGXkxbSgAOqUh5kNKBgnbTHtFK/mmMPKsY5X+G7VpeEMF2JA+s2q
         eh3Dx+OuQgNLvEOIBe8d2YxT6/I2DF0D2TzkxQfblNtPyzE5amEpAaBRwlmyyBCX5pA2
         FjUwG96ZE+dQX1JM1B/vqq6zhcBb4maLjuZQbc7ijTbvTQY3iis7S3mhvTHWAFLGkDSc
         aFDQ==
X-Gm-Message-State: AOJu0Yxm1wz197T1x9UcMk0hsZL01aN+ZDhMOnFb3bM2Jo7CiLATdPOf
	fFFIX6ssTZLYdpX+825yrwYvm6DGU/YCzIrjDEyJ2gbW733cj2Rm642KrY5O
X-Google-Smtp-Source: AGHT+IH7S7+KKYqi2LPZOcYrZkIiaVreYuEOOXDuSHKcDCWVZ0VjdXmRMn/uOufs/iYjg3awHkbnBw==
X-Received: by 2002:a17:902:d582:b0:1e4:2d03:8c4d with SMTP id k2-20020a170902d58200b001e42d038c4dmr1733163plh.42.1712573479807;
        Mon, 08 Apr 2024 03:51:19 -0700 (PDT)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902654400b001e2a484db76sm6818026pln.56.2024.04.08.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:51:19 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.6 3/3] hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach
Date: Mon,  8 Apr 2024 18:51:00 +0800
Message-Id: <20240408105100.2946497-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240408105100.2946497-1-potin.lai@quantatw.com>
References: <20240408105100.2946497-1-potin.lai@quantatw.com>
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
Cc: billy_tsai@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Billy Tsai <billy_tsai@aspeedtech.com>

The driver support two functions: PWM and Tachometer. The PWM feature can
handle up to 16 output ports, while the Tachometer can monitor to up to 16
input ports as well. This driver implements them by exposing two kernel
subsystems: PWM and HWMON. The PWM subsystem can be utilized alongside
existing drivers for controlling elements such as fans (pwm-fan.c),
beepers (pwm-beeper.c) and so on. Through the HWMON subsystem, the driver
provides sysfs interfaces for fan.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 Documentation/hwmon/aspeed-g6-pwm-tach.rst |  26 +
 Documentation/hwmon/index.rst              |   1 +
 drivers/hwmon/Kconfig                      |  11 +
 drivers/hwmon/Makefile                     |   1 +
 drivers/hwmon/aspeed-g6-pwm-tach.c         | 549 +++++++++++++++++++++
 5 files changed, 588 insertions(+)
 create mode 100644 Documentation/hwmon/aspeed-g6-pwm-tach.rst
 create mode 100644 drivers/hwmon/aspeed-g6-pwm-tach.c

diff --git a/Documentation/hwmon/aspeed-g6-pwm-tach.rst b/Documentation/hwmon/aspeed-g6-pwm-tach.rst
new file mode 100644
index 000000000000..17398fe397fe
--- /dev/null
+++ b/Documentation/hwmon/aspeed-g6-pwm-tach.rst
@@ -0,0 +1,26 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver aspeed-g6-pwm-tach
+=================================
+
+Supported chips:
+	ASPEED AST2600
+
+Authors:
+	<billy_tsai@aspeedtech.com>
+
+Description:
+------------
+This driver implements support for ASPEED AST2600 Fan Tacho controller.
+The controller supports up to 16 tachometer inputs.
+
+The driver provides the following sensor accesses in sysfs:
+
+=============== ======= ======================================================
+fanX_input	ro	provide current fan rotation value in RPM as reported
+			by the fan to the device.
+fanX_div	rw	Fan divisor: Supported value are power of 4 (1, 4, 16
+                        64, ... 4194304)
+                        The larger divisor, the less rpm accuracy and the less
+                        affected by fan signal glitch.
+=============== ======= ======================================================
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 18d1f43a8a67..c71ff59f736f 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -44,6 +44,7 @@ Hardware Monitoring Kernel Drivers
    aquacomputer_d5next
    asb100
    asc7621
+   aspeed-g6-pwm-tach
    aspeed-pwm-tacho
    asus_ec_sensors
    asus_wmi_sensors
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index eaac0f164b9e..0163149c98fd 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -412,6 +412,17 @@ config SENSORS_ASPEED
 	  This driver can also be built as a module. If so, the module
 	  will be called aspeed_pwm_tacho.
 
+config SENSORS_ASPEED_G6
+	tristate "ASPEED g6 PWM and Fan tach driver"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on PWM
+	help
+	  This driver provides support for ASPEED G6 PWM and Fan Tach
+	  controllers.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called aspeed_pwm_tacho.
+
 config SENSORS_ATXP1
 	tristate "Attansic ATXP1 VID controller"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b05c2d73c587..caed8a52afae 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_SENSORS_ARM_SCPI)	+= scpi-hwmon.o
 obj-$(CONFIG_SENSORS_AS370)	+= as370-hwmon.o
 obj-$(CONFIG_SENSORS_ASC7621)	+= asc7621.o
 obj-$(CONFIG_SENSORS_ASPEED)	+= aspeed-pwm-tacho.o
+obj-$(CONFIG_SENSORS_ASPEED_G6) += aspeed-g6-pwm-tach.o
 obj-$(CONFIG_SENSORS_ATXP1)	+= atxp1.o
 obj-$(CONFIG_SENSORS_AXI_FAN_CONTROL) += axi-fan-control.o
 obj-$(CONFIG_SENSORS_BT1_PVT)	+= bt1-pvt.o
diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-pwm-tach.c
new file mode 100644
index 000000000000..597b3b019d49
--- /dev/null
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 Aspeed Technology Inc.
+ *
+ * PWM/TACH controller driver for Aspeed ast2600 SoCs.
+ * This drivers doesn't support earlier version of the IP.
+ *
+ * The hardware operates in time quantities of length
+ * Q := (DIV_L + 1) << DIV_H / input-clk
+ * The length of a PWM period is (DUTY_CYCLE_PERIOD + 1) * Q.
+ * The maximal value for DUTY_CYCLE_PERIOD is used here to provide
+ * a fine grained selection for the duty cycle.
+ *
+ * This driver uses DUTY_CYCLE_RISING_POINT = 0, so from the start of a
+ * period the output is active until DUTY_CYCLE_FALLING_POINT * Q. Note
+ * that if DUTY_CYCLE_RISING_POINT = DUTY_CYCLE_FALLING_POINT the output is
+ * always active.
+ *
+ * Register usage:
+ * PIN_ENABLE: When it is unset the pwm controller will emit inactive level to the external.
+ * Use to determine whether the PWM channel is enabled or disabled
+ * CLK_ENABLE: When it is unset the pwm controller will assert the duty counter reset and
+ * emit inactive level to the PIN_ENABLE mux after that the driver can still change the pwm period
+ * and duty and the value will apply when CLK_ENABLE be set again.
+ * Use to determine whether duty_cycle bigger than 0.
+ * PWM_ASPEED_CTRL_INVERSE: When it is toggled the output value will inverse immediately.
+ * PWM_ASPEED_DUTY_CYCLE_FALLING_POINT/PWM_ASPEED_DUTY_CYCLE_RISING_POINT: When these two
+ * values are equal it means the duty cycle = 100%.
+ *
+ * The glitch may generate at:
+ * - Enabled changing when the duty_cycle bigger than 0% and less than 100%.
+ * - Polarity changing when the duty_cycle bigger than 0% and less than 100%.
+ *
+ * Limitations:
+ * - When changing both duty cycle and period, we cannot prevent in
+ *   software that the output might produce a period with mixed
+ *   settings.
+ * - Disabling the PWM doesn't complete the current period.
+ *
+ * Improvements:
+ * - When only changing one of duty cycle or period, our pwm controller will not
+ *   generate the glitch, the configure will change at next cycle of pwm.
+ *   This improvement can disable/enable through PWM_ASPEED_CTRL_DUTY_SYNC_DISABLE.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/reset.h>
+#include <linux/sysfs.h>
+
+/* The channel number of Aspeed pwm controller */
+#define PWM_ASPEED_NR_PWMS			16
+/* PWM Control Register */
+#define PWM_ASPEED_CTRL(ch)			((ch) * 0x10 + 0x00)
+#define PWM_ASPEED_CTRL_LOAD_SEL_RISING_AS_WDT	BIT(19)
+#define PWM_ASPEED_CTRL_DUTY_LOAD_AS_WDT_ENABLE	BIT(18)
+#define PWM_ASPEED_CTRL_DUTY_SYNC_DISABLE	BIT(17)
+#define PWM_ASPEED_CTRL_CLK_ENABLE		BIT(16)
+#define PWM_ASPEED_CTRL_LEVEL_OUTPUT		BIT(15)
+#define PWM_ASPEED_CTRL_INVERSE			BIT(14)
+#define PWM_ASPEED_CTRL_OPEN_DRAIN_ENABLE	BIT(13)
+#define PWM_ASPEED_CTRL_PIN_ENABLE		BIT(12)
+#define PWM_ASPEED_CTRL_CLK_DIV_H		GENMASK(11, 8)
+#define PWM_ASPEED_CTRL_CLK_DIV_L		GENMASK(7, 0)
+
+/* PWM Duty Cycle Register */
+#define PWM_ASPEED_DUTY_CYCLE(ch)		((ch) * 0x10 + 0x04)
+#define PWM_ASPEED_DUTY_CYCLE_PERIOD		GENMASK(31, 24)
+#define PWM_ASPEED_DUTY_CYCLE_POINT_AS_WDT	GENMASK(23, 16)
+#define PWM_ASPEED_DUTY_CYCLE_FALLING_POINT	GENMASK(15, 8)
+#define PWM_ASPEED_DUTY_CYCLE_RISING_POINT	GENMASK(7, 0)
+
+/* PWM fixed value */
+#define PWM_ASPEED_FIXED_PERIOD			FIELD_MAX(PWM_ASPEED_DUTY_CYCLE_PERIOD)
+
+/* The channel number of Aspeed tach controller */
+#define TACH_ASPEED_NR_TACHS		16
+/* TACH Control Register */
+#define TACH_ASPEED_CTRL(ch)		(((ch) * 0x10) + 0x08)
+#define TACH_ASPEED_IER			BIT(31)
+#define TACH_ASPEED_INVERS_LIMIT	BIT(30)
+#define TACH_ASPEED_LOOPBACK		BIT(29)
+#define TACH_ASPEED_ENABLE		BIT(28)
+#define TACH_ASPEED_DEBOUNCE_MASK	GENMASK(27, 26)
+#define TACH_ASPEED_DEBOUNCE_BIT	26
+#define TACH_ASPEED_IO_EDGE_MASK	GENMASK(25, 24)
+#define TACH_ASPEED_IO_EDGE_BIT		24
+#define TACH_ASPEED_CLK_DIV_T_MASK	GENMASK(23, 20)
+#define TACH_ASPEED_CLK_DIV_BIT		20
+#define TACH_ASPEED_THRESHOLD_MASK	GENMASK(19, 0)
+/* [27:26] */
+#define DEBOUNCE_3_CLK			0x00
+#define DEBOUNCE_2_CLK			0x01
+#define DEBOUNCE_1_CLK			0x02
+#define DEBOUNCE_0_CLK			0x03
+/* [25:24] */
+#define F2F_EDGES			0x00
+#define R2R_EDGES			0x01
+#define BOTH_EDGES			0x02
+/* [23:20] */
+/* divisor = 4 to the nth power, n = register value */
+#define DEFAULT_TACH_DIV		1024
+#define DIV_TO_REG(divisor)		(ilog2(divisor) >> 1)
+
+/* TACH Status Register */
+#define TACH_ASPEED_STS(ch)		(((ch) * 0x10) + 0x0C)
+
+/*PWM_TACH_STS */
+#define TACH_ASPEED_ISR			BIT(31)
+#define TACH_ASPEED_PWM_OUT		BIT(25)
+#define TACH_ASPEED_PWM_OEN		BIT(24)
+#define TACH_ASPEED_DEB_INPUT		BIT(23)
+#define TACH_ASPEED_RAW_INPUT		BIT(22)
+#define TACH_ASPEED_VALUE_UPDATE	BIT(21)
+#define TACH_ASPEED_FULL_MEASUREMENT	BIT(20)
+#define TACH_ASPEED_VALUE_MASK		GENMASK(19, 0)
+/**********************************************************
+ * Software setting
+ *********************************************************/
+#define DEFAULT_FAN_PULSE_PR		2
+
+struct aspeed_pwm_tach_data {
+	struct device *dev;
+	void __iomem *base;
+	struct clk *clk;
+	struct reset_control *reset;
+	unsigned long clk_rate;
+	struct pwm_chip chip;
+	bool tach_present[TACH_ASPEED_NR_TACHS];
+	u32 tach_divisor;
+};
+
+static inline struct aspeed_pwm_tach_data *
+aspeed_pwm_chip_to_data(struct pwm_chip *chip)
+{
+	return container_of(chip, struct aspeed_pwm_tach_data, chip);
+}
+
+static int aspeed_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				struct pwm_state *state)
+{
+	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
+	u32 hwpwm = pwm->hwpwm;
+	bool polarity, pin_en, clk_en;
+	u32 duty_pt, val;
+	u64 div_h, div_l, duty_cycle_period, dividend;
+
+	val = readl(priv->base + PWM_ASPEED_CTRL(hwpwm));
+	polarity = FIELD_GET(PWM_ASPEED_CTRL_INVERSE, val);
+	pin_en = FIELD_GET(PWM_ASPEED_CTRL_PIN_ENABLE, val);
+	clk_en = FIELD_GET(PWM_ASPEED_CTRL_CLK_ENABLE, val);
+	div_h = FIELD_GET(PWM_ASPEED_CTRL_CLK_DIV_H, val);
+	div_l = FIELD_GET(PWM_ASPEED_CTRL_CLK_DIV_L, val);
+	val = readl(priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+	duty_pt = FIELD_GET(PWM_ASPEED_DUTY_CYCLE_FALLING_POINT, val);
+	duty_cycle_period = FIELD_GET(PWM_ASPEED_DUTY_CYCLE_PERIOD, val);
+	/*
+	 * This multiplication doesn't overflow, the upper bound is
+	 * 1000000000 * 256 * 256 << 15 = 0x1dcd650000000000
+	 */
+	dividend = (u64)NSEC_PER_SEC * (div_l + 1) * (duty_cycle_period + 1)
+		       << div_h;
+	state->period = DIV_ROUND_UP_ULL(dividend, priv->clk_rate);
+
+	if (clk_en && duty_pt) {
+		dividend = (u64)NSEC_PER_SEC * (div_l + 1) * duty_pt
+				 << div_h;
+		state->duty_cycle = DIV_ROUND_UP_ULL(dividend, priv->clk_rate);
+	} else {
+		state->duty_cycle = clk_en ? state->period : 0;
+	}
+	state->polarity = polarity ? PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+	state->enabled = pin_en;
+	return 0;
+}
+
+static int aspeed_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct aspeed_pwm_tach_data *priv = aspeed_pwm_chip_to_data(chip);
+	u32 hwpwm = pwm->hwpwm, duty_pt, val;
+	u64 div_h, div_l, divisor, expect_period;
+	bool clk_en;
+
+	expect_period = div64_u64(ULLONG_MAX, (u64)priv->clk_rate);
+	expect_period = min(expect_period, state->period);
+	dev_dbg(chip->dev, "expect period: %lldns, duty_cycle: %lldns",
+		expect_period, state->duty_cycle);
+	/*
+	 * Pick the smallest value for div_h so that div_l can be the biggest
+	 * which results in a finer resolution near the target period value.
+	 */
+	divisor = (u64)NSEC_PER_SEC * (PWM_ASPEED_FIXED_PERIOD + 1) *
+		  (FIELD_MAX(PWM_ASPEED_CTRL_CLK_DIV_L) + 1);
+	div_h = order_base_2(DIV64_U64_ROUND_UP(priv->clk_rate * expect_period, divisor));
+	if (div_h > 0xf)
+		div_h = 0xf;
+
+	divisor = ((u64)NSEC_PER_SEC * (PWM_ASPEED_FIXED_PERIOD + 1)) << div_h;
+	div_l = div64_u64(priv->clk_rate * expect_period, divisor);
+
+	if (div_l == 0)
+		return -ERANGE;
+
+	div_l -= 1;
+
+	if (div_l > 255)
+		div_l = 255;
+
+	dev_dbg(chip->dev, "clk source: %ld div_h %lld, div_l : %lld\n",
+		priv->clk_rate, div_h, div_l);
+	/* duty_pt = duty_cycle * (PERIOD + 1) / period */
+	duty_pt = div64_u64(state->duty_cycle * priv->clk_rate,
+			    (u64)NSEC_PER_SEC * (div_l + 1) << div_h);
+	dev_dbg(chip->dev, "duty_cycle = %lld, duty_pt = %d\n",
+		state->duty_cycle, duty_pt);
+
+	/*
+	 * Fixed DUTY_CYCLE_PERIOD to its max value to get a
+	 * fine-grained resolution for duty_cycle at the expense of a
+	 * coarser period resolution.
+	 */
+	val = readl(priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+	val &= ~PWM_ASPEED_DUTY_CYCLE_PERIOD;
+	val |= FIELD_PREP(PWM_ASPEED_DUTY_CYCLE_PERIOD,
+			  PWM_ASPEED_FIXED_PERIOD);
+	writel(val, priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+
+	if (duty_pt == 0) {
+		/* emit inactive level and assert the duty counter reset */
+		clk_en = 0;
+	} else {
+		clk_en = 1;
+		if (duty_pt >= (PWM_ASPEED_FIXED_PERIOD + 1))
+			duty_pt = 0;
+		val = readl(priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+		val &= ~(PWM_ASPEED_DUTY_CYCLE_RISING_POINT |
+			 PWM_ASPEED_DUTY_CYCLE_FALLING_POINT);
+		val |= FIELD_PREP(PWM_ASPEED_DUTY_CYCLE_FALLING_POINT, duty_pt);
+		writel(val, priv->base + PWM_ASPEED_DUTY_CYCLE(hwpwm));
+	}
+
+	val = readl(priv->base + PWM_ASPEED_CTRL(hwpwm));
+	val &= ~(PWM_ASPEED_CTRL_CLK_DIV_H | PWM_ASPEED_CTRL_CLK_DIV_L |
+		 PWM_ASPEED_CTRL_PIN_ENABLE | PWM_ASPEED_CTRL_CLK_ENABLE |
+		 PWM_ASPEED_CTRL_INVERSE);
+	val |= FIELD_PREP(PWM_ASPEED_CTRL_CLK_DIV_H, div_h) |
+	       FIELD_PREP(PWM_ASPEED_CTRL_CLK_DIV_L, div_l) |
+	       FIELD_PREP(PWM_ASPEED_CTRL_PIN_ENABLE, state->enabled) |
+	       FIELD_PREP(PWM_ASPEED_CTRL_CLK_ENABLE, clk_en) |
+	       FIELD_PREP(PWM_ASPEED_CTRL_INVERSE, state->polarity);
+	writel(val, priv->base + PWM_ASPEED_CTRL(hwpwm));
+
+	return 0;
+}
+
+static const struct pwm_ops aspeed_pwm_ops = {
+	.apply = aspeed_pwm_apply,
+	.get_state = aspeed_pwm_get_state,
+};
+
+static void aspeed_tach_ch_enable(struct aspeed_pwm_tach_data *priv, u8 tach_ch,
+				  bool enable)
+{
+	if (enable)
+		writel(readl(priv->base + TACH_ASPEED_CTRL(tach_ch)) |
+			       TACH_ASPEED_ENABLE,
+		       priv->base + TACH_ASPEED_CTRL(tach_ch));
+	else
+		writel(readl(priv->base + TACH_ASPEED_CTRL(tach_ch)) &
+			       ~TACH_ASPEED_ENABLE,
+		       priv->base + TACH_ASPEED_CTRL(tach_ch));
+}
+
+static int aspeed_tach_val_to_rpm(struct aspeed_pwm_tach_data *priv, u32 tach_val)
+{
+	u64 rpm;
+	u32 tach_div;
+
+	tach_div = tach_val * priv->tach_divisor * DEFAULT_FAN_PULSE_PR;
+
+	dev_dbg(priv->dev, "clk %ld, tach_val %d , tach_div %d\n",
+		priv->clk_rate, tach_val, tach_div);
+
+	rpm = (u64)priv->clk_rate * 60;
+	do_div(rpm, tach_div);
+
+	return (int)rpm;
+}
+
+static int aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tach_data *priv,
+				      u8 fan_tach_ch)
+{
+	u32 val;
+
+	val = readl(priv->base + TACH_ASPEED_STS(fan_tach_ch));
+
+	if (!(val & TACH_ASPEED_FULL_MEASUREMENT))
+		return 0;
+	val = FIELD_GET(TACH_ASPEED_VALUE_MASK, val);
+	return aspeed_tach_val_to_rpm(priv, val);
+}
+
+static int aspeed_tach_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long *val)
+{
+	struct aspeed_pwm_tach_data *priv = dev_get_drvdata(dev);
+	u32 reg_val;
+
+	switch (attr) {
+	case hwmon_fan_input:
+		*val = aspeed_get_fan_tach_ch_rpm(priv, channel);
+		break;
+	case hwmon_fan_div:
+		reg_val = readl(priv->base + TACH_ASPEED_CTRL(channel));
+		reg_val = FIELD_GET(TACH_ASPEED_CLK_DIV_T_MASK, reg_val);
+		*val = BIT(reg_val << 1);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static int aspeed_tach_hwmon_write(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, long val)
+{
+	struct aspeed_pwm_tach_data *priv = dev_get_drvdata(dev);
+	u32 reg_val;
+
+	switch (attr) {
+	case hwmon_fan_div:
+		if (!is_power_of_2(val) || (ilog2(val) % 2) ||
+		    DIV_TO_REG(val) > 0xb)
+			return -EINVAL;
+		priv->tach_divisor = val;
+		reg_val = readl(priv->base + TACH_ASPEED_CTRL(channel));
+		reg_val &= ~TACH_ASPEED_CLK_DIV_T_MASK;
+		reg_val |= FIELD_PREP(TACH_ASPEED_CLK_DIV_T_MASK,
+				      DIV_TO_REG(priv->tach_divisor));
+		writel(reg_val, priv->base + TACH_ASPEED_CTRL(channel));
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t aspeed_tach_dev_is_visible(const void *drvdata,
+					  enum hwmon_sensor_types type,
+					  u32 attr, int channel)
+{
+	const struct aspeed_pwm_tach_data *priv = drvdata;
+
+	if (!priv->tach_present[channel])
+		return 0;
+	switch (attr) {
+	case hwmon_fan_input:
+		return 0444;
+	case hwmon_fan_div:
+		return 0644;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops aspeed_tach_ops = {
+	.is_visible = aspeed_tach_dev_is_visible,
+	.read = aspeed_tach_hwmon_read,
+	.write = aspeed_tach_hwmon_write,
+};
+
+static const struct hwmon_channel_info *aspeed_tach_info[] = {
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV,
+			   HWMON_F_INPUT | HWMON_F_DIV, HWMON_F_INPUT | HWMON_F_DIV),
+	NULL
+};
+
+static const struct hwmon_chip_info aspeed_tach_chip_info = {
+	.ops = &aspeed_tach_ops,
+	.info = aspeed_tach_info,
+};
+
+static void aspeed_present_fan_tach(struct aspeed_pwm_tach_data *priv, u8 *tach_ch, int count)
+{
+	u8 ch, index;
+	u32 val;
+
+	for (index = 0; index < count; index++) {
+		ch = tach_ch[index];
+		priv->tach_present[ch] = true;
+		priv->tach_divisor = DEFAULT_TACH_DIV;
+
+		val = readl(priv->base + TACH_ASPEED_CTRL(ch));
+		val &= ~(TACH_ASPEED_INVERS_LIMIT | TACH_ASPEED_DEBOUNCE_MASK |
+			 TACH_ASPEED_IO_EDGE_MASK | TACH_ASPEED_CLK_DIV_T_MASK |
+			 TACH_ASPEED_THRESHOLD_MASK);
+		val |= (DEBOUNCE_3_CLK << TACH_ASPEED_DEBOUNCE_BIT) |
+		       F2F_EDGES |
+		       FIELD_PREP(TACH_ASPEED_CLK_DIV_T_MASK,
+				  DIV_TO_REG(priv->tach_divisor));
+		writel(val, priv->base + TACH_ASPEED_CTRL(ch));
+
+		aspeed_tach_ch_enable(priv, ch, true);
+	}
+}
+
+static int aspeed_create_fan_monitor(struct device *dev,
+				     struct device_node *child,
+				     struct aspeed_pwm_tach_data *priv)
+{
+	int ret, count;
+	u8 *tach_ch;
+
+	count = of_property_count_u8_elems(child, "tach-ch");
+	if (count < 1)
+		return -EINVAL;
+	tach_ch = devm_kcalloc(dev, count, sizeof(*tach_ch), GFP_KERNEL);
+	if (!tach_ch)
+		return -ENOMEM;
+	ret = of_property_read_u8_array(child, "tach-ch", tach_ch, count);
+	if (ret)
+		return ret;
+
+	aspeed_present_fan_tach(priv, tach_ch, count);
+
+	return 0;
+}
+
+static void aspeed_pwm_tach_reset_assert(void *data)
+{
+	struct reset_control *rst = data;
+
+	reset_control_assert(rst);
+}
+
+static int aspeed_pwm_tach_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev, *hwmon;
+	int ret;
+	struct device_node *child;
+	struct aspeed_pwm_tach_data *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "Couldn't get clock\n");
+	priv->clk_rate = clk_get_rate(priv->clk);
+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "Couldn't get reset control\n");
+
+	ret = reset_control_deassert(priv->reset);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Couldn't deassert reset control\n");
+	ret = devm_add_action_or_reset(dev, aspeed_pwm_tach_reset_assert,
+				       priv->reset);
+	if (ret)
+		return ret;
+
+	priv->chip.dev = dev;
+	priv->chip.ops = &aspeed_pwm_ops;
+	priv->chip.npwm = PWM_ASPEED_NR_PWMS;
+
+	ret = devm_pwmchip_add(dev, &priv->chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
+
+	for_each_child_of_node(dev->of_node, child) {
+		ret = aspeed_create_fan_monitor(dev, child, priv);
+		if (ret) {
+			of_node_put(child);
+			dev_warn(dev, "Failed to create fan %d", ret);
+			return 0;
+		}
+	}
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "aspeed_tach", priv,
+						     &aspeed_tach_chip_info, NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register hwmon device\n");
+
+	of_platform_populate(dev->of_node, NULL, NULL, dev);
+
+	return 0;
+}
+
+static int aspeed_pwm_tach_remove(struct platform_device *pdev)
+{
+	struct aspeed_pwm_tach_data *priv = platform_get_drvdata(pdev);
+
+	reset_control_assert(priv->reset);
+
+	return 0;
+}
+
+static const struct of_device_id aspeed_pwm_tach_match[] = {
+	{
+		.compatible = "aspeed,ast2600-pwm-tach",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, aspeed_pwm_tach_match);
+
+static struct platform_driver aspeed_pwm_tach_driver = {
+	.probe = aspeed_pwm_tach_probe,
+	.remove = aspeed_pwm_tach_remove,
+	.driver	= {
+		.name = "aspeed-g6-pwm-tach",
+		.of_match_table = aspeed_pwm_tach_match,
+	},
+};
+
+module_platform_driver(aspeed_pwm_tach_driver);
+
+MODULE_AUTHOR("Billy Tsai <billy_tsai@aspeedtech.com>");
+MODULE_DESCRIPTION("Aspeed ast2600 PWM and Fan Tach device driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1

