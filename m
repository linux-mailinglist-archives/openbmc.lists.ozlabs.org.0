Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF3465A6B
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 01:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4GVd3wSBz305F
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 11:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CTnKypE+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=howard10703049@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CTnKypE+; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3sHb0pBmz2yJ5
 for <openbmc@lists.ozlabs.org>; Wed,  1 Dec 2021 19:11:36 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so20391316pjc.4
 for <openbmc@lists.ozlabs.org>; Wed, 01 Dec 2021 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0QYo+mOFGk3w2/mYhQRZzVzQkSrf7LOrvxjyC+HpaI=;
 b=CTnKypE+mZVi0yTJsL2EgtlcFKiqmXINJL8n7boqlfWz29OmiuOX8io5HTyLS1fWf0
 AUwQIqssMYG6nHK2pWQchLxXr9e+310xOWX6MY/DEu6CKg5cnPV68aCEpy9733uQRolz
 UxtzGj1wZkjmeLPHsbV5UZtJAo9/ZlRon4dJ+eMuNCiq+rBlypTMYzOaEKRqgGvedO9/
 RFvsn5u2PRA10FI9wRglS00yRowRlAiYHZsRcaZ2Y6+v3o3i0mHF2QD39DaRuspU3pBi
 Dly09DlVK7/YecyT9CUX4xCAsBLObILnsiTHaQJUg6zogalCoKMsQCRGgUIYRxgHgsv1
 hitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0QYo+mOFGk3w2/mYhQRZzVzQkSrf7LOrvxjyC+HpaI=;
 b=zsREuenSQCX6woHe85STQypH/7VKufhOAxJZmH83xmE6XhGL2eCRrZ/o4xOJlKRJqF
 fOkXpGmRHQIYIqwDdRJgO1+LTolY46MhzonuGCZRQdLZmg3Muq6y1sHmOZ4AoPV1ftsH
 l2noP/3qUvMHU0FbXV9xipNZFzmiJ92s9CTWywJaC52cHDvpEy/VV9ag2DD4Php2ktkM
 AxIQk4/GY3utVPJ14/SD12oCBdlH8ZiZHzbPuaxVXUzTsmHXOyQ1FgmtbFQmaBEUjt9C
 CttW7CA1+I2Wh6IxOkK5WIqzJLZIg9Vm0ZPHn6MgtsOi/IZ5eaQZNHCk12totXCMJ57F
 KxWw==
X-Gm-Message-State: AOAM530gaAOHuqxwJPH/4fnPM+7AL1qv0F1GDtx/oeqODUkdwANcramY
 NaG9Jypg/N5mbws+4130Ze51r6s4mPQ=
X-Google-Smtp-Source: ABdhPJxFB9F4gkvgbh72JCgz0fRfdLv3jWaIkqbtcoiehXGBJciyX7g2nQuyiU5YiNa+vQ/AF2yW1g==
X-Received: by 2002:a17:90b:4b89:: with SMTP id
 lr9mr5553383pjb.49.1638346292347; 
 Wed, 01 Dec 2021 00:11:32 -0800 (PST)
Received: from howard-System-Product-Name.dhcpserver.bu9bmc.local
 (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
 by smtp.gmail.com with ESMTPSA id p21sm25084896pfh.43.2021.12.01.00.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 00:11:31 -0800 (PST)
From: Howard Chiu <howard10703049@gmail.com>
X-Google-Original-From: Howard Chiu <howard.chiu@quantatw.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-4.7] Pre-release ast26xx PWM driver by Aspeed Billy
 for OpenBMC
Date: Wed,  1 Dec 2021 16:09:24 +0800
Message-Id: <20211201080924.145038-1-howard.chiu@quantatw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Dec 2021 11:06:12 +1100
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
Cc: Howard Chiu <howard.chiu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Below is the original commit log:

    pwm: Add Aspeed ast2600 PWM support

    This patch add the support of PWM controller which can be found at aspeed
    ast2600 soc. The pwm supoorts up to 16 channels and it's part function
    of multi-function device "pwm-tach controller".

    dt-bindings: Add bindings for aspeed pwm-tach.

    This patch adds device binding for aspeed pwm-tach device which is a
    multi-function device include pwm and tach function and pwm/tach device
    bindings which should be the child-node of pwm-tach device.

Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
Change-Id: I9af36632d14bbf0a3cdce197650e669d3b84056e
---
 .../bindings/hwmon/aspeed,ast2600-tach.yaml   |  68 ++++
 .../bindings/mfd/aspeed,ast2600-pwm-tach.yaml |  76 ++++
 .../bindings/pwm/aspeed,ast2600-pwm.yaml      |  64 ++++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-aspeed-ast2600.c              | 325 ++++++++++++++++++
 6 files changed, 544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
 create mode 100644 Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
 create mode 100644 drivers/pwm/pwm-aspeed-ast2600.c

diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
new file mode 100644
index 000000000000..dded50a049fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aspeed,ast2600-tach.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Aspeed, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/aspeed,ast2600-tach.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Ast2600 Tach controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  The Aspeed Tach controller can support upto 16 fan input.
+  This module is part of the ast2600-pwm-tach multi-function device. For more
+  details see ../mfd/aspeed,ast2600-pwm-tach.yaml.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-tach
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    const: default
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties:
+  type: object
+  properties:
+    aspeed,tach-ch:
+      description:
+        The tach channel used for this node.
+      maxItems: 1
+
+    aspeed,min-rpm:
+      description:
+        define the minimal revolutions per minute of the measure fan
+        used to calculate the sample period of tach
+      default: 1000
+
+    aspeed,pulse-pr:
+      description:
+        Value specifying the number of pulses per revolution of the
+        monitored FAN.
+      default: 2
+
+    aspeed,tach-div:
+      description:
+        define the tachometer clock divider as an integer. Formula of
+        tach clock = clock source / (2^tach-div)^2
+      minimum: 0
+      maximum: 15
+      default: 5
+
+  required:
+    - reg
diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
new file mode 100644
index 000000000000..1eaf6fab2752
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2600-pwm-tach.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Aspeed, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/aspeed,ast2600-pwm-tach.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PWM Tach controller Device Tree Bindings
+
+description: |
+  The PWM Tach controller is represented as a multi-function device which
+  includes:
+    PWM
+    Tach
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - aspeed,ast2600-pwm-tach
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - resets
+
+patternProperties:
+  "^pwm(@[0-9a-f]+)?$":
+    $ref: ../pwm/aspeed,ast2600-pwm.yaml
+
+  "^tach(@[0-9a-f]+)?$":
+    $ref: ../hwmon/aspeed,ast2600-tach.yaml
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ast2600-clock.h>
+    pwm_tach: pwm_tach@1e610000 {
+      compatible = "aspeed,ast2600-pwm-tach", "syscon", "simple-mfd";
+      reg = <0x1e610000 0x100>;
+      clocks = <&syscon ASPEED_CLK_AHB>;
+      resets = <&syscon ASPEED_RESET_PWM>;
+
+      pwm: pwm {
+        compatible = "aspeed,ast2600-pwm";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #pwm-cells = <3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_pwm0_default>;
+      };
+
+      tach: tach {
+        compatible = "aspeed,ast2600-tach";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_tach0_default>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
new file mode 100644
index 000000000000..f501f8a769df
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/aspeed,ast2600-pwm.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2021 Aspeed, Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/aspeed,ast2600-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aspeed Ast2600 PWM controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description: |
+  The Aspeed PWM controller can support upto 16 PWM outputs.
+  This module is part of the ast2600-pwm-tach multi-function device. For more
+  details see ../mfd/aspeed,ast2600-pwm-tach.yaml.
+
+properties:
+  compatible:
+    enum:
+      - aspeed,ast2600-pwm
+
+  "#pwm-cells":
+    const: 3
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  pinctrl-0: true
+
+  pinctrl-names:
+    const: default
+
+required:
+  - compatible
+  - "#pwm-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties:
+  description: Set extend properties for each pwm channel.
+  type: object
+  properties:
+    reg:
+      description:
+        The pwm channel index.
+      maxItems: 1
+
+    aspeed,wdt-reload-enable:
+      type: boolean
+      description:
+        Enable the function of wdt reset reload duty point.
+
+    aspeed,wdt-reload-duty-point:
+      description:
+        Define the duty point after wdt reset, 0 = 100%
+      minimum: 0
+      maximum: 255
+
+  required:
+    - reg
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 21e3b05a5153..a875dc8195af 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -51,6 +51,16 @@ config PWM_AB8500
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-ab8500.
 
+config PWM_ASPEED_AST2600
+	tristate "Aspeed ast2600 PWM support"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	depends on HAVE_CLK && HAS_IOMEM
+	help
+	  This driver provides support for Aspeed ast2600 PWM controllers.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-aspeed-ast2600.
+
 config PWM_ATMEL
 	tristate "Atmel PWM support"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 708840b7fba8..6be0c67bf08a 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_PWM)		+= core.o
 obj-$(CONFIG_PWM_SYSFS)		+= sysfs.o
 obj-$(CONFIG_PWM_AB8500)	+= pwm-ab8500.o
+obj-$(CONFIG_PWM_ASPEED_AST2600)	+= pwm-aspeed-ast2600.o
 obj-$(CONFIG_PWM_ATMEL)		+= pwm-atmel.o
 obj-$(CONFIG_PWM_ATMEL_HLCDC_PWM)	+= pwm-atmel-hlcdc.o
 obj-$(CONFIG_PWM_ATMEL_TCB)	+= pwm-atmel-tcb.o
diff --git a/drivers/pwm/pwm-aspeed-ast2600.c b/drivers/pwm/pwm-aspeed-ast2600.c
new file mode 100644
index 000000000000..bf54eeb70372
--- /dev/null
+++ b/drivers/pwm/pwm-aspeed-ast2600.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2021 Aspeed Technology Inc.
+ *
+ * PWM controller driver for Aspeed ast2600 SoCs.
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
+#include <linux/clk.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include <linux/reset.h>
+#include <linux/regmap.h>
+#include <linux/bitfield.h>
+#include <linux/slab.h>
+#include <linux/pwm.h>
+#include <linux/math64.h>
+
+/* The channel number of Aspeed pwm controller */
+#define PWM_ASPEED_NR_PWMS 16
+
+/* PWM Control Register */
+#define PWM_ASPEED_CTRL(ch) ((ch) * 0x10 + 0x00)
+#define PWM_ASPEED_CTRL_LOAD_SEL_RISING_AS_WDT BIT(19)
+#define PWM_ASPEED_CTRL_DUTY_LOAD_AS_WDT_ENABLE BIT(18)
+#define PWM_ASPEED_CTRL_DUTY_SYNC_DISABLE BIT(17)
+#define PWM_ASPEED_CTRL_CLK_ENABLE BIT(16)
+#define PWM_ASPEED_CTRL_LEVEL_OUTPUT BIT(15)
+#define PWM_ASPEED_CTRL_INVERSE BIT(14)
+#define PWM_ASPEED_CTRL_OPEN_DRAIN_ENABLE BIT(13)
+#define PWM_ASPEED_CTRL_PIN_ENABLE BIT(12)
+#define PWM_ASPEED_CTRL_CLK_DIV_H GENMASK(11, 8)
+#define PWM_ASPEED_CTRL_CLK_DIV_L GENMASK(7, 0)
+
+/* PWM Duty Cycle Register */
+#define PWM_ASPEED_DUTY_CYCLE(ch) ((ch) * 0x10 + 0x04)
+#define PWM_ASPEED_DUTY_CYCLE_PERIOD GENMASK(31, 24)
+#define PWM_ASPEED_DUTY_CYCLE_POINT_AS_WDT GENMASK(23, 16)
+#define PWM_ASPEED_DUTY_CYCLE_FALLING_POINT GENMASK(15, 8)
+#define PWM_ASPEED_DUTY_CYCLE_RISING_POINT GENMASK(7, 0)
+
+/* PWM fixed value */
+#define PWM_ASPEED_FIXED_PERIOD FIELD_MAX(PWM_ASPEED_DUTY_CYCLE_PERIOD)
+
+struct aspeed_pwm_data {
+	struct pwm_chip chip;
+	struct clk *clk;
+	struct regmap *regmap;
+	struct reset_control *reset;
+};
+
+static inline struct aspeed_pwm_data *
+aspeed_pwm_chip_to_data(struct pwm_chip *chip)
+{
+	return container_of(chip, struct aspeed_pwm_data, chip);
+}
+
+static void aspeed_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct device *dev = chip->dev;
+	struct aspeed_pwm_data *priv = aspeed_pwm_chip_to_data(chip);
+	u32 hwpwm = pwm->hwpwm;
+	bool polarity,	pin_en, clk_en;
+	u32 duty_pt, val;
+	unsigned long rate;
+	u64 div_h, div_l, duty_cycle_period, dividend;
+
+	regmap_read(priv->regmap, PWM_ASPEED_CTRL(hwpwm), &val);
+	polarity = FIELD_GET(PWM_ASPEED_CTRL_INVERSE, val);
+	pin_en = FIELD_GET(PWM_ASPEED_CTRL_PIN_ENABLE, val);
+	clk_en = FIELD_GET(PWM_ASPEED_CTRL_CLK_ENABLE, val);
+	div_h = FIELD_GET(PWM_ASPEED_CTRL_CLK_DIV_H, val);
+	div_l = FIELD_GET(PWM_ASPEED_CTRL_CLK_DIV_L, val);
+	regmap_read(priv->regmap, PWM_ASPEED_DUTY_CYCLE(hwpwm), &val);
+	duty_pt = FIELD_GET(PWM_ASPEED_DUTY_CYCLE_FALLING_POINT, val);
+	duty_cycle_period = FIELD_GET(PWM_ASPEED_DUTY_CYCLE_PERIOD, val);
+
+	rate = clk_get_rate(priv->clk);
+
+	/*
+	 * This multiplication doesn't overflow, the upper bound is
+	 * 1000000000 * 256 * 256 << 15 = 0x1dcd650000000000
+	 */
+	dividend = (u64)NSEC_PER_SEC * (div_l + 1) * (duty_cycle_period + 1)
+		       << div_h;
+	state->period = DIV_ROUND_UP_ULL(dividend, rate);
+
+	if (clk_en && duty_pt) {
+		dividend = (u64)NSEC_PER_SEC * (div_l + 1) * duty_pt
+				 << div_h;
+		state->duty_cycle = DIV_ROUND_UP_ULL(dividend, rate);
+	} else {
+		state->duty_cycle = clk_en ? state->period : 0;
+	}
+	state->polarity = polarity ? PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+	state->enabled = pin_en;
+	dev_dbg(dev, "get period: %lldns, duty_cycle: %lldns", state->period,
+		state->duty_cycle);
+}
+
+static int aspeed_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			    const struct pwm_state *state)
+{
+	struct device *dev = chip->dev;
+	struct aspeed_pwm_data *priv = aspeed_pwm_chip_to_data(chip);
+	u32 hwpwm = pwm->hwpwm, duty_pt;
+	unsigned long rate;
+	u64 div_h, div_l, divisor, expect_period;
+	bool clk_en;
+
+	rate = clk_get_rate(priv->clk);
+	expect_period = min(div64_u64(ULLONG_MAX, (u64)rate), state->period);
+	dev_dbg(dev, "expect period: %lldns, duty_cycle: %lldns", expect_period,
+		state->duty_cycle);
+	/*
+	 * Pick the smallest value for div_h so that div_l can be the biggest
+	 * which results in a finer resolution near the target period value.
+	 */
+	divisor = (u64)NSEC_PER_SEC * (PWM_ASPEED_FIXED_PERIOD + 1) *
+		  (FIELD_MAX(PWM_ASPEED_CTRL_CLK_DIV_L) + 1);
+	div_h = order_base_2(DIV64_U64_ROUND_UP(rate * expect_period, divisor));
+	if (div_h > 0xf)
+		div_h = 0xf;
+
+	divisor = ((u64)NSEC_PER_SEC * (PWM_ASPEED_FIXED_PERIOD + 1)) << div_h;
+	div_l = div64_u64(rate * expect_period, divisor);
+
+	if (div_l == 0)
+		return -ERANGE;
+
+	div_l -= 1;
+
+	if (div_l > 255)
+		div_l = 255;
+
+	dev_dbg(dev, "clk source: %ld div_h %lld, div_l : %lld\n", rate, div_h,
+		div_l);
+	/* duty_pt = duty_cycle * (PERIOD + 1) / period */
+	duty_pt = div64_u64(state->duty_cycle * rate,
+			    (u64)NSEC_PER_SEC * (div_l + 1) << div_h);
+	dev_dbg(dev, "duty_cycle = %lld, duty_pt = %d\n", state->duty_cycle,
+		 duty_pt);
+
+	/*
+	 * Fixed DUTY_CYCLE_PERIOD to its max value to get a
+	 * fine-grained resolution for duty_cycle at the expense of a
+	 * coarser period resolution.
+	 */
+	regmap_update_bits(priv->regmap, PWM_ASPEED_DUTY_CYCLE(hwpwm),
+			   PWM_ASPEED_DUTY_CYCLE_PERIOD,
+			   FIELD_PREP(PWM_ASPEED_DUTY_CYCLE_PERIOD,
+				      PWM_ASPEED_FIXED_PERIOD));
+	if (duty_pt == 0) {
+		/* emit inactive level and assert the duty counter reset */
+		clk_en = 0;
+	} else {
+		clk_en = 1;
+		if (duty_pt >= (PWM_ASPEED_FIXED_PERIOD + 1))
+			duty_pt = 0;
+		regmap_update_bits(
+			priv->regmap, PWM_ASPEED_DUTY_CYCLE(hwpwm),
+			PWM_ASPEED_DUTY_CYCLE_RISING_POINT |
+				PWM_ASPEED_DUTY_CYCLE_FALLING_POINT,
+			FIELD_PREP(PWM_ASPEED_DUTY_CYCLE_FALLING_POINT,
+				   duty_pt));
+	}
+
+	regmap_update_bits(
+		priv->regmap, PWM_ASPEED_CTRL(hwpwm),
+		PWM_ASPEED_CTRL_CLK_DIV_H | PWM_ASPEED_CTRL_CLK_DIV_L |
+			PWM_ASPEED_CTRL_PIN_ENABLE |
+			PWM_ASPEED_CTRL_CLK_ENABLE | PWM_ASPEED_CTRL_INVERSE,
+		FIELD_PREP(PWM_ASPEED_CTRL_CLK_DIV_H, div_h) |
+			FIELD_PREP(PWM_ASPEED_CTRL_CLK_DIV_L, div_l) |
+			FIELD_PREP(PWM_ASPEED_CTRL_PIN_ENABLE, state->enabled) |
+			FIELD_PREP(PWM_ASPEED_CTRL_CLK_ENABLE, clk_en) |
+			FIELD_PREP(PWM_ASPEED_CTRL_INVERSE, state->polarity));
+	return 0;
+}
+
+static const struct pwm_ops aspeed_pwm_ops = {
+	.apply = aspeed_pwm_apply,
+	.get_state = aspeed_pwm_get_state,
+	.owner = THIS_MODULE,
+};
+
+static int aspeed_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+	struct aspeed_pwm_data *priv;
+	struct device_node *np;
+	struct platform_device *parent_dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	np = pdev->dev.parent->of_node;
+	if (!of_device_is_compatible(np, "aspeed,ast2600-pwm-tach"))
+		return dev_err_probe(dev, -ENODEV,
+				     "Unsupported pwm device binding\n");
+
+	priv->regmap = syscon_node_to_regmap(np);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Couldn't get regmap\n");
+
+	parent_dev = of_find_device_by_node(np);
+	priv->clk = devm_clk_get(&parent_dev->dev, 0);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk),
+				     "Couldn't get clock\n");
+
+	priv->reset = devm_reset_control_get_shared(&parent_dev->dev, NULL);
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "Couldn't get reset control\n");
+
+	ret = clk_prepare_enable(priv->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't enable clock\n");
+
+	ret = reset_control_deassert(priv->reset);
+	if (ret) {
+		dev_err_probe(dev, ret, "Couldn't deassert reset control\n");
+		goto err_disable_clk;
+	}
+
+	priv->chip.dev = dev;
+	priv->chip.ops = &aspeed_pwm_ops;
+	priv->chip.npwm = PWM_ASPEED_NR_PWMS;
+
+	ret = pwmchip_add(&priv->chip);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to add PWM chip\n");
+		goto err_assert_reset;
+	}
+	dev_set_drvdata(dev, priv);
+	return 0;
+err_assert_reset:
+	reset_control_assert(priv->reset);
+err_disable_clk:
+	clk_disable_unprepare(priv->clk);
+	return ret;
+}
+
+static int aspeed_pwm_remove(struct platform_device *dev)
+{
+	struct aspeed_pwm_data *priv = platform_get_drvdata(dev);
+
+	pwmchip_remove(&priv->chip);
+	reset_control_assert(priv->reset);
+	clk_disable_unprepare(priv->clk);
+
+	return 0;
+}
+
+static const struct of_device_id of_pwm_match_table[] = {
+	{
+		.compatible = "aspeed,ast2600-pwm",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_pwm_match_table);
+
+static struct platform_driver aspeed_pwm_driver = {
+	.probe = aspeed_pwm_probe,
+	.remove	= aspeed_pwm_remove,
+	.driver	= {
+		.name = "aspeed-pwm",
+		.of_match_table = of_pwm_match_table,
+	},
+};
+
+module_platform_driver(aspeed_pwm_driver);
+
+MODULE_AUTHOR("Billy Tsai <billy_tsai@aspeedtech.com>");
+MODULE_DESCRIPTION("Aspeed ast2600 PWM device driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

