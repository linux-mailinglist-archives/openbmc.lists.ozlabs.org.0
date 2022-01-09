Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0AF488B66
	for <lists+openbmc@lfdr.de>; Sun,  9 Jan 2022 18:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX41x5w0Rz30Q8
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 04:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=AIviTPy/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=AIviTPy/; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX3xd6Wh6z30Mn
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 04:35:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641749663;
 bh=CHEyIVjskx+GIr5Fdz/UrKPv9u3be4t3CyIh9Pa9+Ys=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AIviTPy/HkdxFtFEmIJGTRgk7xZSVNE/1iaa2DDNbaaCXBgosWbcKrTOZSZrd8XPL
 XZhRB2QS2KzAqsiP7eEyYRuB7+Y+tB/iGRbuU//WU8ty8v4Y/8AXxGfqjSDALp1s7c
 Jv1AqnT66p8EOcrWosIAn+FjQFjc71bQbdSThul4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.222.244]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvPJ-1myjso0aeb-00Rpkl; Sun, 09
 Jan 2022 18:34:23 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 5/9] pinctrl: nuvoton: Add driver for WPCM450
Date: Sun,  9 Jan 2022 18:29:56 +0100
Message-Id: <20220109173000.1242703-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QkGOpK+LQD9aEETKJVAOP6N2E+cR0OUpO/2VU3vO9qIX1RcaRaC
 SI464dBfD6r8imXJSG9KotDCdkoPFGHf6Bf3DkC2X7H0uT6cuMO3aYax0NOS503oSp30p1r
 ezRgfqIluHf+GjZSg+R0h+MCr1cceChbJe/dGmZSLdzWtPsfJCQo7VDlP4MwzQJVq+O5R0V
 sPFTJM/nkrDmKmvBgm11Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C1O4iVR5Kjk=:PyXZMR/KWd61MZ4aQvSAuc
 TI97cA2o/MZVp4DCJG55pmEprOw67f/UusjPm6os2ebJE+pO7dD/dI1/bjFHaTfo5GCIbGXLt
 gKb+0stY4VZhWHXaJ9r0u+0G3aINoE7Urre6qMGyORwX2LVeng0D8d/3YDhdfsH+Tbvz4KOIN
 POCrJui11KoNGMsab7tSEErNG/vFYD/XqLYwVki4fhPPWTLNhOOtGy1Yq2C1UueRcqlQRf0s8
 GvWPBoN8CTLYz3drdaHVGmGj08P3YcJPu1+sYDOPRRIxPx/o61XR7Z6TdO6Rh103T9YOGlLmp
 PJPO0T1bIYNvtzSr7FmI9+VYbXD1NhpyHlax6oZIyBIywnXQ1UyHxUIy4kuAYke1kJnO6LSbB
 Fqwtjp7Zd0vRhbYf592uTvdT1NTzSSUigVTnnsmP/WUus1PtkkWYOYJ4sxRazrVRxQU8H5Tj/
 E2otMHI2R1d6VBuX9PGpNoaPOGtCavdYUzWRqOhShcnjUlBaYfp2W+a5m3LPQgmGUujjkSMzF
 Ki5nhyrGnN8gMMhwE5bux1sVKYefUrw6+uK18tCwjCvgfIrbtiEHt6XJoJqRvE+IOlmWpdhcx
 5xHB//bNW6XYS5d+MioyP6GrS4CJAYlzK0d/+7TM7s4QjBnTOHzAD+r+dIl0RM/ZZPX9D1vYF
 L0EIlmG9sK3iWye2/PQBwmur6FqMQIRFv87vJ1rWjAe9amijy0eCnk4fUvETBnc9pT3SIT2Ic
 kWp1MTzeaGXOEOEH8w6s+E8dSAk+vQ7pPRpDbLhKRbJ9uhmogUkK0mdh/ICTDyIGOtCC6dvXW
 Q27FqRXPtuQds9OjrgjgNO1TfkCD9xcCuyiou2YSzeUdOHeKIEuvS21EfvyyflJrcNd4PaZ7x
 ULT+GBl7ErzdTw7FO0ZdTktwBGIouP6yptjvA9fpdTNB8vAiBijrMZsk7HUqZ/FWuFEX2z/aB
 RcOvdw8BP4KR5V3KzzqH3Jna1ehpzpDCnooXSxSnAOxi8ITMtXL7Z4KRa1Tt3syJrBvj4OYeP
 Z3qXIq5kdrKSu+5nUU9Dz/3OyDUW8bqP6kjBQK8hFS888So6IYA36WnmV2SNHfnDbqT+unnSq
 P01hLnOii/WO7E=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver is based on the one for NPCM7xx, because the WPCM450 is a
predecessor of those SoCs. Notable differences:

- WPCM450, the GPIO registers are not organized in multiple banks, but
  rather placed continually into the same register block. This affects
  how register offsets are computed.
- Pinmux nodes can explicitly select GPIO mode, whereas, in the npcm7xx
  driver, this happens automatically when a GPIO is requested.

Some functionality implemented in the hardware was (for now) left unused
in the driver, specifically blinking and pull-up/down.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

This patch has a few checkpatch warnings, which are inherited from the
pinctrl-npcm7xx driver. I decided to ignore those. Specifically:
(1) WPCM450_GRPS is an unwrapped list; (2) use of -ENOTSUPP is discouraged=
.

v4:
- A few more cleanups, as suggested by Andy Shevchenko
- Change fwnode_property_read_u32 argument to u32

v3:
- https://lore.kernel.org/lkml/20211224200935.93817-6-j.neuschaefer@gmx.ne=
t/
- make gc the first member of struct wpcm450_gpio, to simplify pointer ari=
thmetic
- Add empty line between <linux> includes and <linux/pinctrl> includes
- Add a comment explaining wpcm450_gpio_fix_evpol
- Use generic_handle_domain_irq
- Rename struct fwnode_handle *np to child
- Convert instances of dev_err() to dev_err_probe() and simplify return
- Use device_for_each_child_node loop
- Remove gpio->gc.parent assignment (already done in bgpio_init)
- Move gpiochip_add_pin_range() to .add_pin_ranges callback
- Use GENMASK in calculation of IRQ bitmask
- I decided to keep using __assign_bit throughout the driver, because it k=
eeps the code short
- Remove nuvoton,interrupt-map again, to simplify the binding
- Use gpio_chip->fwnode
- I decided against using the bitmap_* API in(place of) wpcm450_gpio_irq_b=
itnum,
  etc., because I find the current solution clear enough, even though the
  mapping functions are somewhat verbose.

v2:
- https://lore.kernel.org/lkml/20211207210823.1975632-6-j.neuschaefer@gmx.=
net/
- Adjust to binding change which put each GPIO bank into its own node
- Use generic GPIO support
- Make it possible to set pinmux to GPIO explicitly
- Allow building the driver as a module
- Fix spelling of "spin lock" in text
- Include <linux/mod_devicetable.h>
- Move linux/pinctrl/* headers to the end of the #include block
- Remove/rework comments and printk messages
- Switch to fwnode API
- Remove comma after sentinel {}
- Use dev_err_probe
- Improve Kconfig help message
- Declare for_each_set_bit iterator as unsigned int
- Use __assign_bit
- Set parent irq handler in set_irq_type callback
- Use struct group_desc
- Don't hide sysfs bind attributes
- Remove unnecessary check for gpio-controller property
- Use module_platform_driver()

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-6-j.neuschaefer@gmx.=
net/
=2D--
 MAINTAINERS                               |    1 +
 drivers/pinctrl/Makefile                  |    2 +-
 drivers/pinctrl/nuvoton/Kconfig           |   18 +
 drivers/pinctrl/nuvoton/Makefile          |    1 +
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 1130 +++++++++++++++++++++
 5 files changed, 1151 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 123c967936785..cd66185163da5 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2352,6 +2352,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/*/*wpcm*
 F:	arch/arm/boot/dts/nuvoton-wpcm450*
 F:	arch/arm/mach-npcm/wpcm450.c
+F:	drivers/*/*/*wpcm*
 F:	drivers/*/*wpcm*

 ARM/NXP S32G ARCHITECTURE
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 5e63de2ffcf41..823ff12847ed3 100644
=2D-- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -58,7 +58,7 @@ obj-y				+=3D freescale/
 obj-$(CONFIG_X86)		+=3D intel/
 obj-y				+=3D mvebu/
 obj-y				+=3D nomadik/
-obj-$(CONFIG_ARCH_NPCM7XX)	+=3D nuvoton/
+obj-y				+=3D nuvoton/
 obj-$(CONFIG_PINCTRL_PXA)	+=3D pxa/
 obj-$(CONFIG_ARCH_QCOM)		+=3D qcom/
 obj-$(CONFIG_PINCTRL_RALINK)	+=3D ralink/
diff --git a/drivers/pinctrl/nuvoton/Kconfig b/drivers/pinctrl/nuvoton/Kco=
nfig
index 48ba0469edda6..6a3c6f2a73f2d 100644
=2D-- a/drivers/pinctrl/nuvoton/Kconfig
+++ b/drivers/pinctrl/nuvoton/Kconfig
@@ -1,4 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_WPCM450
+	tristate "Pinctrl and GPIO driver for Nuvoton WPCM450"
+	depends on ARCH_WPCM450 || COMPILE_TEST
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select GPIOLIB
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to enable pin controller and GPIO support for
+	  the Nuvoton WPCM450 SoC. This is strongly recommended when
+	  building a kernel that will run on this chip.
+
+	  If this driver is compiled as a module, it will be named
+	  pinctrl-wpcm450.
+
 config PINCTRL_NPCM7XX
 	bool "Pinctrl and GPIO driver for Nuvoton NPCM7XX"
 	depends on (ARCH_NPCM7XX || COMPILE_TEST) && OF
diff --git a/drivers/pinctrl/nuvoton/Makefile b/drivers/pinctrl/nuvoton/Ma=
kefile
index 886d00784cef5..9e66f5dc74bfc 100644
=2D-- a/drivers/pinctrl/nuvoton/Makefile
+++ b/drivers/pinctrl/nuvoton/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Nuvoton pinctrl support

+obj-$(CONFIG_PINCTRL_WPCM450)	+=3D pinctrl-wpcm450.o
 obj-$(CONFIG_PINCTRL_NPCM7XX)	+=3D pinctrl-npcm7xx.o
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/n=
uvoton/pinctrl-wpcm450.c
new file mode 100644
index 0000000000000..da02bd163a826
=2D-- /dev/null
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -0,0 +1,1130 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2016-2018 Nuvoton Technology corporation.
+// Copyright (c) 2016, Dell Inc
+// Copyright (c) 2021-2022 Jonathan Neusch=C3=A4fer
+//
+// This driver uses the following registers:
+// - Pin mux registers, in the GCR (general control registers) block
+// - GPIO registers, specific to each GPIO bank
+// - GPIO event (interrupt) registers, located centrally in the GPIO regi=
ster
+//   block, shared between all GPIO banks
+
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+
+/* GCR registers */
+#define WPCM450_GCR_MFSEL1	0x0c
+#define WPCM450_GCR_MFSEL2	0x10
+#define WPCM450_GCR_NONE	0
+
+/* GPIO event (interrupt) registers */
+#define WPCM450_GPEVTYPE	0x00
+#define WPCM450_GPEVPOL		0x04
+#define WPCM450_GPEVDBNC	0x08
+#define WPCM450_GPEVEN		0x0c
+#define WPCM450_GPEVST		0x10
+
+#define WPCM450_NUM_BANKS	8
+#define WPCM450_NUM_GPIOS	128
+#define WPCM450_NUM_GPIO_IRQS	4
+
+struct wpcm450_pinctrl;
+struct wpcm450_bank;
+
+struct wpcm450_gpio {
+	struct gpio_chip	gc;
+	struct wpcm450_pinctrl	*pctrl;
+	struct irq_chip		irqc;
+	const struct wpcm450_bank *bank;
+};
+
+struct wpcm450_pinctrl {
+	struct pinctrl_dev	*pctldev;
+	struct device		*dev;
+	struct irq_domain	*domain;
+	struct regmap		*gcr_regmap;
+	void __iomem		*gpio_base;
+	struct wpcm450_gpio	gpio_bank[WPCM450_NUM_BANKS];
+	unsigned long		both_edges;
+
+	/*
+	 * This spin lock protects registers and struct wpcm450_pinctrl fields
+	 * against concurrent access.
+	 */
+	spinlock_t		lock;
+};
+
+struct wpcm450_bank {
+	/* Range of GPIOs in this port */
+	u8 base;
+	u8 length;
+
+	/* Register offsets (0 =3D register doesn't exist in this port) */
+	u8 cfg0, cfg1, cfg2;
+	u8 blink;
+	u8 dataout, datain;
+
+	/* Interrupt bit mapping */
+	u8 first_irq_bit;   /* First bit in GPEVST that belongs to this bank */
+	u8 num_irqs;        /* Number of IRQ-capable GPIOs in this bank */
+	u8 first_irq_gpio;  /* First IRQ-capable GPIO in this bank */
+};
+
+static const struct wpcm450_bank wpcm450_banks[WPCM450_NUM_BANKS] =3D {
+	/*  range   cfg0  cfg1  cfg2 blink  out   in     IRQ map */
+	{   0, 16,  0x14, 0x18,    0,    0, 0x1c, 0x20,  0, 16, 0 },
+	{  16, 16,  0x24, 0x28, 0x2c, 0x30, 0x34, 0x38, 16,  2, 8 },
+	{  32, 16,  0x3c, 0x40, 0x44,    0, 0x48, 0x4c,  0,  0, 0 },
+	{  48, 16,  0x50, 0x54, 0x58,    0, 0x5c, 0x60,  0,  0, 0 },
+	{  64, 16,  0x64, 0x68, 0x6c,    0, 0x70, 0x74,  0,  0, 0 },
+	{  80, 16,  0x78, 0x7c, 0x80,    0, 0x84, 0x88,  0,  0, 0 },
+	{  96, 18,     0,    0,    0,    0,    0, 0x8c,  0,  0, 0 },
+	{ 114, 14,  0x90, 0x94, 0x98,    0, 0x9c, 0xa0,  0,  0, 0 },
+};
+
+static int wpcm450_gpio_irq_bitnum(struct wpcm450_gpio *gpio, struct irq_=
data *d)
+{
+	const struct wpcm450_bank *bank =3D gpio->bank;
+	int hwirq =3D irqd_to_hwirq(d);
+
+	if (hwirq < bank->first_irq_gpio)
+		return -EINVAL;
+
+	if (hwirq - bank->first_irq_gpio >=3D bank->num_irqs)
+		return -EINVAL;
+
+	return hwirq - bank->first_irq_gpio + bank->first_irq_bit;
+}
+
+static int wpcm450_irq_bitnum_to_gpio(struct wpcm450_gpio *gpio, int bitn=
um)
+{
+	const struct wpcm450_bank *bank =3D gpio->bank;
+
+	if (bitnum < bank->first_irq_bit)
+		return -EINVAL;
+
+	if (bitnum - bank->first_irq_bit > bank->num_irqs)
+		return -EINVAL;
+
+	return bitnum - bank->first_irq_bit + bank->first_irq_gpio;
+}
+
+static void wpcm450_gpio_irq_ack(struct irq_data *d)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_irq_chip_da=
ta(d));
+	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
+	unsigned long flags;
+	int bit;
+
+	bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
+	if (bit < 0)
+		return;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	iowrite32(BIT(bit), pctrl->gpio_base + WPCM450_GPEVST);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
+static void wpcm450_gpio_irq_mask(struct irq_data *d)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_irq_chip_da=
ta(d));
+	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
+	unsigned long flags;
+	unsigned long even;
+	int bit;
+
+	bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
+	if (bit < 0)
+		return;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	even =3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
+	__assign_bit(bit, &even, 0);
+	iowrite32(even, pctrl->gpio_base + WPCM450_GPEVEN);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
+static void wpcm450_gpio_irq_unmask(struct irq_data *d)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_irq_chip_da=
ta(d));
+	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
+	unsigned long flags;
+	unsigned long even;
+	int bit;
+
+	bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
+	if (bit < 0)
+		return;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	even =3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
+	__assign_bit(bit, &even, 1);
+	iowrite32(even, pctrl->gpio_base + WPCM450_GPEVEN);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
+/*
+ * Since the GPIO controller does not support dual-edge triggered interru=
pts
+ * (IRQ_TYPE_EDGE_BOTH), they are emulated using rising/falling edge trig=
gered
+ * interrupts. wpcm450_gpio_fix_evpol sets the interrupt polarity for the
+ * specified emulated dual-edge triggered interrupts, so that the next ed=
ge can
+ * be detected.
+ */
+static void wpcm450_gpio_fix_evpol(struct wpcm450_gpio *gpio, unsigned lo=
ng all)
+{
+	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
+	unsigned long flags;
+	unsigned int bit;
+
+	for_each_set_bit(bit, &all, 32) {
+		int offset =3D wpcm450_irq_bitnum_to_gpio(gpio, bit);
+		unsigned long evpol;
+		int level;
+
+		spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
+		do {
+			evpol =3D ioread32(pctrl->gpio_base + WPCM450_GPEVPOL);
+			level =3D gpio->gc.get(&gpio->gc, offset);
+
+			/* Switch event polarity to the opposite of the current level */
+			__assign_bit(bit, &evpol, !level);
+
+			iowrite32(evpol, pctrl->gpio_base + WPCM450_GPEVPOL);
+		} while (gpio->gc.get(&gpio->gc, offset) !=3D level);
+		spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
+	}
+}
+
+static int wpcm450_gpio_set_irq_type(struct irq_data *d, unsigned int flo=
w_type)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_data_get_irq_chip_da=
ta(d));
+	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
+	unsigned long evtype, evpol;
+	unsigned long flags;
+	int ret =3D 0;
+	int bit;
+
+	bit =3D wpcm450_gpio_irq_bitnum(gpio, d);
+	if (bit < 0)
+		return bit;
+
+	irq_set_handler_locked(d, handle_level_irq);
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	evtype =3D ioread32(pctrl->gpio_base + WPCM450_GPEVTYPE);
+	evpol =3D ioread32(pctrl->gpio_base + WPCM450_GPEVPOL);
+	__assign_bit(bit, &pctrl->both_edges, 0);
+	switch (flow_type) {
+	case IRQ_TYPE_LEVEL_LOW:
+		__assign_bit(bit, &evtype, 1);
+		__assign_bit(bit, &evpol, 0);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		__assign_bit(bit, &evtype, 1);
+		__assign_bit(bit, &evpol, 1);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		__assign_bit(bit, &evtype, 0);
+		__assign_bit(bit, &evpol, 0);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		__assign_bit(bit, &evtype, 0);
+		__assign_bit(bit, &evpol, 1);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		__assign_bit(bit, &evtype, 0);
+		__assign_bit(bit, &pctrl->both_edges, 1);
+		break;
+	default:
+		ret =3D -EINVAL;
+	}
+	iowrite32(evtype, pctrl->gpio_base + WPCM450_GPEVTYPE);
+	iowrite32(evpol, pctrl->gpio_base + WPCM450_GPEVPOL);
+
+	/* clear the event status for good measure */
+	iowrite32(BIT(bit), pctrl->gpio_base + WPCM450_GPEVST);
+
+	/* fix event polarity after clearing event status */
+	wpcm450_gpio_fix_evpol(gpio, BIT(bit));
+
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return ret;
+}
+
+static const struct irq_chip wpcm450_gpio_irqchip =3D {
+	.name =3D "WPCM450-GPIO-IRQ",
+	.irq_ack =3D wpcm450_gpio_irq_ack,
+	.irq_unmask =3D wpcm450_gpio_irq_unmask,
+	.irq_mask =3D wpcm450_gpio_irq_mask,
+	.irq_set_type =3D wpcm450_gpio_set_irq_type,
+};
+
+static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(irq_desc_get_handler_dat=
a(desc));
+	struct wpcm450_pinctrl *pctrl =3D gpio->pctrl;
+	struct irq_chip *chip =3D irq_desc_get_chip(desc);
+	unsigned long pending;
+	unsigned long flags;
+	unsigned long ours;
+	unsigned int bit;
+
+	ours =3D GENMASK(gpio->bank->num_irqs - 1, 0) << gpio->bank->first_irq_b=
it;
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+
+	pending =3D ioread32(pctrl->gpio_base + WPCM450_GPEVST);
+	pending &=3D ioread32(pctrl->gpio_base + WPCM450_GPEVEN);
+	pending &=3D ours;
+
+	if (pending & pctrl->both_edges)
+		wpcm450_gpio_fix_evpol(gpio, pending & pctrl->both_edges);
+
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	chained_irq_enter(chip, desc);
+	for_each_set_bit(bit, &pending, 32) {
+		int offset =3D wpcm450_irq_bitnum_to_gpio(gpio, bit);
+
+		generic_handle_domain_irq(gpio->gc.irq.domain, offset);
+	}
+	chained_irq_exit(chip, desc);
+}
+
+static int smb0_pins[]  =3D { 115, 114 };
+static int smb1_pins[]  =3D { 117, 116 };
+static int smb2_pins[]  =3D { 119, 118 };
+static int smb3_pins[]  =3D { 30, 31 };
+static int smb4_pins[]  =3D { 28, 29 };
+static int smb5_pins[]  =3D { 26, 27 };
+
+static int scs1_pins[] =3D { 32 };
+static int scs2_pins[] =3D { 33 };
+static int scs3_pins[] =3D { 34 };
+
+static int bsp_pins[] =3D { 41, 42 };
+static int hsp1_pins[] =3D { 43, 44, 45, 46, 47, 61, 62, 63 };
+static int hsp2_pins[] =3D { 48, 49, 50, 51, 52, 53, 54, 55 };
+
+static int r1err_pins[] =3D { 56 };
+static int r1md_pins[] =3D { 57, 58 };
+static int rmii2_pins[] =3D { 84, 85, 86, 87, 88, 89 };
+static int r2err_pins[] =3D { 90 };
+static int r2md_pins[] =3D { 91, 92 };
+
+static int kbcc_pins[] =3D { 94, 93 };
+static int clko_pins[] =3D { 96 };
+static int smi_pins[] =3D { 97 };
+static int uinc_pins[] =3D { 19 };
+static int mben_pins[] =3D {};
+
+static int gspi_pins[] =3D { 12, 13, 14, 15 };
+static int sspi_pins[] =3D { 12, 13, 14, 15 };
+
+static int xcs1_pins[] =3D { 35 };
+static int xcs2_pins[] =3D { 36 };
+
+static int sdio_pins[] =3D { 7, 22, 43, 44, 45, 46, 47, 60 };
+
+static int fi0_pins[] =3D { 64 };
+static int fi1_pins[] =3D { 65 };
+static int fi2_pins[] =3D { 66 };
+static int fi3_pins[] =3D { 67 };
+static int fi4_pins[] =3D { 68 };
+static int fi5_pins[] =3D { 69 };
+static int fi6_pins[] =3D { 70 };
+static int fi7_pins[] =3D { 71 };
+static int fi8_pins[] =3D { 72 };
+static int fi9_pins[] =3D { 73 };
+static int fi10_pins[] =3D { 74 };
+static int fi11_pins[] =3D { 75 };
+static int fi12_pins[] =3D { 76 };
+static int fi13_pins[] =3D { 77 };
+static int fi14_pins[] =3D { 78 };
+static int fi15_pins[] =3D { 79 };
+
+static int pwm0_pins[] =3D { 80 };
+static int pwm1_pins[] =3D { 81 };
+static int pwm2_pins[] =3D { 82 };
+static int pwm3_pins[] =3D { 83 };
+static int pwm4_pins[] =3D { 20 };
+static int pwm5_pins[] =3D { 21 };
+static int pwm6_pins[] =3D { 16 };
+static int pwm7_pins[] =3D { 17 };
+
+static int hg0_pins[] =3D { 20 };
+static int hg1_pins[] =3D { 21 };
+static int hg2_pins[] =3D { 22 };
+static int hg3_pins[] =3D { 23 };
+static int hg4_pins[] =3D { 24 };
+static int hg5_pins[] =3D { 25 };
+static int hg6_pins[] =3D { 59 };
+static int hg7_pins[] =3D { 60 };
+
+#define WPCM450_GRPS \
+	WPCM450_GRP(smb3), \
+	WPCM450_GRP(smb4), \
+	WPCM450_GRP(smb5), \
+	WPCM450_GRP(scs1), \
+	WPCM450_GRP(scs2), \
+	WPCM450_GRP(scs3), \
+	WPCM450_GRP(smb0), \
+	WPCM450_GRP(smb1), \
+	WPCM450_GRP(smb2), \
+	WPCM450_GRP(bsp), \
+	WPCM450_GRP(hsp1), \
+	WPCM450_GRP(hsp2), \
+	WPCM450_GRP(r1err), \
+	WPCM450_GRP(r1md), \
+	WPCM450_GRP(rmii2), \
+	WPCM450_GRP(r2err), \
+	WPCM450_GRP(r2md), \
+	WPCM450_GRP(kbcc), \
+	WPCM450_GRP(clko), \
+	WPCM450_GRP(smi), \
+	WPCM450_GRP(uinc), \
+	WPCM450_GRP(gspi), \
+	WPCM450_GRP(mben), \
+	WPCM450_GRP(xcs2), \
+	WPCM450_GRP(xcs1), \
+	WPCM450_GRP(sdio), \
+	WPCM450_GRP(sspi), \
+	WPCM450_GRP(fi0), \
+	WPCM450_GRP(fi1), \
+	WPCM450_GRP(fi2), \
+	WPCM450_GRP(fi3), \
+	WPCM450_GRP(fi4), \
+	WPCM450_GRP(fi5), \
+	WPCM450_GRP(fi6), \
+	WPCM450_GRP(fi7), \
+	WPCM450_GRP(fi8), \
+	WPCM450_GRP(fi9), \
+	WPCM450_GRP(fi10), \
+	WPCM450_GRP(fi11), \
+	WPCM450_GRP(fi12), \
+	WPCM450_GRP(fi13), \
+	WPCM450_GRP(fi14), \
+	WPCM450_GRP(fi15), \
+	WPCM450_GRP(pwm0), \
+	WPCM450_GRP(pwm1), \
+	WPCM450_GRP(pwm2), \
+	WPCM450_GRP(pwm3), \
+	WPCM450_GRP(pwm4), \
+	WPCM450_GRP(pwm5), \
+	WPCM450_GRP(pwm6), \
+	WPCM450_GRP(pwm7), \
+	WPCM450_GRP(hg0), \
+	WPCM450_GRP(hg1), \
+	WPCM450_GRP(hg2), \
+	WPCM450_GRP(hg3), \
+	WPCM450_GRP(hg4), \
+	WPCM450_GRP(hg5), \
+	WPCM450_GRP(hg6), \
+	WPCM450_GRP(hg7), \
+
+enum {
+#define WPCM450_GRP(x) fn_ ## x
+	WPCM450_GRPS
+	/* add placeholder for none/gpio */
+	WPCM450_GRP(gpio),
+	WPCM450_GRP(none),
+#undef WPCM450_GRP
+};
+
+static struct group_desc wpcm450_groups[] =3D {
+#define WPCM450_GRP(x) { .name =3D #x, .pins =3D x ## _pins, \
+			.num_pins =3D ARRAY_SIZE(x ## _pins) }
+	WPCM450_GRPS
+#undef WPCM450_GRP
+};
+
+#define WPCM450_SFUNC(a) WPCM450_FUNC(a, #a)
+#define WPCM450_FUNC(a, b...) static const char *a ## _grp[] =3D { b }
+#define WPCM450_MKFUNC(nm) { .name =3D #nm, .ngroups =3D ARRAY_SIZE(nm ##=
 _grp), \
+			.groups =3D nm ## _grp }
+struct wpcm450_func {
+	const char *name;
+	const unsigned int ngroups;
+	const char *const *groups;
+};
+
+WPCM450_SFUNC(smb3);
+WPCM450_SFUNC(smb4);
+WPCM450_SFUNC(smb5);
+WPCM450_SFUNC(scs1);
+WPCM450_SFUNC(scs2);
+WPCM450_SFUNC(scs3);
+WPCM450_SFUNC(smb0);
+WPCM450_SFUNC(smb1);
+WPCM450_SFUNC(smb2);
+WPCM450_SFUNC(bsp);
+WPCM450_SFUNC(hsp1);
+WPCM450_SFUNC(hsp2);
+WPCM450_SFUNC(r1err);
+WPCM450_SFUNC(r1md);
+WPCM450_SFUNC(rmii2);
+WPCM450_SFUNC(r2err);
+WPCM450_SFUNC(r2md);
+WPCM450_SFUNC(kbcc);
+WPCM450_SFUNC(clko);
+WPCM450_SFUNC(smi);
+WPCM450_SFUNC(uinc);
+WPCM450_SFUNC(gspi);
+WPCM450_SFUNC(mben);
+WPCM450_SFUNC(xcs2);
+WPCM450_SFUNC(xcs1);
+WPCM450_SFUNC(sdio);
+WPCM450_SFUNC(sspi);
+WPCM450_SFUNC(fi0);
+WPCM450_SFUNC(fi1);
+WPCM450_SFUNC(fi2);
+WPCM450_SFUNC(fi3);
+WPCM450_SFUNC(fi4);
+WPCM450_SFUNC(fi5);
+WPCM450_SFUNC(fi6);
+WPCM450_SFUNC(fi7);
+WPCM450_SFUNC(fi8);
+WPCM450_SFUNC(fi9);
+WPCM450_SFUNC(fi10);
+WPCM450_SFUNC(fi11);
+WPCM450_SFUNC(fi12);
+WPCM450_SFUNC(fi13);
+WPCM450_SFUNC(fi14);
+WPCM450_SFUNC(fi15);
+WPCM450_SFUNC(pwm0);
+WPCM450_SFUNC(pwm1);
+WPCM450_SFUNC(pwm2);
+WPCM450_SFUNC(pwm3);
+WPCM450_SFUNC(pwm4);
+WPCM450_SFUNC(pwm5);
+WPCM450_SFUNC(pwm6);
+WPCM450_SFUNC(pwm7);
+WPCM450_SFUNC(hg0);
+WPCM450_SFUNC(hg1);
+WPCM450_SFUNC(hg2);
+WPCM450_SFUNC(hg3);
+WPCM450_SFUNC(hg4);
+WPCM450_SFUNC(hg5);
+WPCM450_SFUNC(hg6);
+WPCM450_SFUNC(hg7);
+
+#define WPCM450_GRP(x) #x
+WPCM450_FUNC(gpio, WPCM450_GRPS);
+#undef WPCM450_GRP
+
+/* Function names */
+static struct wpcm450_func wpcm450_funcs[] =3D {
+	WPCM450_MKFUNC(smb3),
+	WPCM450_MKFUNC(smb4),
+	WPCM450_MKFUNC(smb5),
+	WPCM450_MKFUNC(scs1),
+	WPCM450_MKFUNC(scs2),
+	WPCM450_MKFUNC(scs3),
+	WPCM450_MKFUNC(smb0),
+	WPCM450_MKFUNC(smb1),
+	WPCM450_MKFUNC(smb2),
+	WPCM450_MKFUNC(bsp),
+	WPCM450_MKFUNC(hsp1),
+	WPCM450_MKFUNC(hsp2),
+	WPCM450_MKFUNC(r1err),
+	WPCM450_MKFUNC(r1md),
+	WPCM450_MKFUNC(rmii2),
+	WPCM450_MKFUNC(r2err),
+	WPCM450_MKFUNC(r2md),
+	WPCM450_MKFUNC(kbcc),
+	WPCM450_MKFUNC(clko),
+	WPCM450_MKFUNC(smi),
+	WPCM450_MKFUNC(uinc),
+	WPCM450_MKFUNC(gspi),
+	WPCM450_MKFUNC(mben),
+	WPCM450_MKFUNC(xcs2),
+	WPCM450_MKFUNC(xcs1),
+	WPCM450_MKFUNC(sdio),
+	WPCM450_MKFUNC(sspi),
+	WPCM450_MKFUNC(fi0),
+	WPCM450_MKFUNC(fi1),
+	WPCM450_MKFUNC(fi2),
+	WPCM450_MKFUNC(fi3),
+	WPCM450_MKFUNC(fi4),
+	WPCM450_MKFUNC(fi5),
+	WPCM450_MKFUNC(fi6),
+	WPCM450_MKFUNC(fi7),
+	WPCM450_MKFUNC(fi8),
+	WPCM450_MKFUNC(fi9),
+	WPCM450_MKFUNC(fi10),
+	WPCM450_MKFUNC(fi11),
+	WPCM450_MKFUNC(fi12),
+	WPCM450_MKFUNC(fi13),
+	WPCM450_MKFUNC(fi14),
+	WPCM450_MKFUNC(fi15),
+	WPCM450_MKFUNC(pwm0),
+	WPCM450_MKFUNC(pwm1),
+	WPCM450_MKFUNC(pwm2),
+	WPCM450_MKFUNC(pwm3),
+	WPCM450_MKFUNC(pwm4),
+	WPCM450_MKFUNC(pwm5),
+	WPCM450_MKFUNC(pwm6),
+	WPCM450_MKFUNC(pwm7),
+	WPCM450_MKFUNC(hg0),
+	WPCM450_MKFUNC(hg1),
+	WPCM450_MKFUNC(hg2),
+	WPCM450_MKFUNC(hg3),
+	WPCM450_MKFUNC(hg4),
+	WPCM450_MKFUNC(hg5),
+	WPCM450_MKFUNC(hg6),
+	WPCM450_MKFUNC(hg7),
+	WPCM450_MKFUNC(gpio),
+};
+
+#define WPCM450_PINCFG(a, b, c, d, e, f, g) \
+	[a] { .fn0 =3D fn_ ## b, .reg0 =3D WPCM450_GCR_ ## c, .bit0 =3D d, \
+	      .fn1 =3D fn_ ## e, .reg1 =3D WPCM450_GCR_ ## f, .bit1 =3D g }
+
+struct wpcm450_pincfg {
+	int fn0, reg0, bit0;
+	int fn1, reg1, bit1;
+};
+
+static const struct wpcm450_pincfg pincfg[] =3D {
+	/*		PIN	  FUNCTION 1		   FUNCTION 2 */
+	WPCM450_PINCFG(0,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(1,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(2,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(3,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(4,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(5,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(6,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(7,	 none, NONE, 0,		  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(8,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(9,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(10,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(11,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(12,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
+	WPCM450_PINCFG(13,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
+	WPCM450_PINCFG(14,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
+	WPCM450_PINCFG(15,	 gspi, MFSEL1, 24,	  sspi, MFSEL1, 31),
+	WPCM450_PINCFG(16,	 none, NONE, 0,		  pwm6, MFSEL2, 22),
+	WPCM450_PINCFG(17,	 none, NONE, 0,		  pwm7, MFSEL2, 23),
+	WPCM450_PINCFG(18,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(19,	 uinc, MFSEL1, 23,	  none, NONE, 0),
+	WPCM450_PINCFG(20,	  hg0, MFSEL2, 24,	  pwm4, MFSEL2, 20),
+	WPCM450_PINCFG(21,	  hg1, MFSEL2, 25,	  pwm5, MFSEL2, 21),
+	WPCM450_PINCFG(22,	  hg2, MFSEL2, 26,	  none, NONE, 0),
+	WPCM450_PINCFG(23,	  hg3, MFSEL2, 27,	  none, NONE, 0),
+	WPCM450_PINCFG(24,	  hg4, MFSEL2, 28,	  none, NONE, 0),
+	WPCM450_PINCFG(25,	  hg5, MFSEL2, 29,	  none, NONE, 0),
+	WPCM450_PINCFG(26,	 smb5, MFSEL1, 2,	  none, NONE, 0),
+	WPCM450_PINCFG(27,	 smb5, MFSEL1, 2,	  none, NONE, 0),
+	WPCM450_PINCFG(28,	 smb4, MFSEL1, 1,	  none, NONE, 0),
+	WPCM450_PINCFG(29,	 smb4, MFSEL1, 1,	  none, NONE, 0),
+	WPCM450_PINCFG(30,	 smb3, MFSEL1, 0,	  none, NONE, 0),
+	WPCM450_PINCFG(31,	 smb3, MFSEL1, 0,	  none, NONE, 0),
+
+	WPCM450_PINCFG(32,	 scs1, MFSEL1, 3,	  none, NONE, 0),
+	WPCM450_PINCFG(33,	 scs2, MFSEL1, 4,	  none, NONE, 0),
+	WPCM450_PINCFG(34,	 scs3, MFSEL1, 5,	  none, NONE, 0),
+	WPCM450_PINCFG(35,	 xcs1, MFSEL1, 29,	  none, NONE, 0),
+	WPCM450_PINCFG(36,	 xcs2, MFSEL1, 28,	  none, NONE, 0),
+	WPCM450_PINCFG(37,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(38,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(39,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(40,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(41,	  bsp, MFSEL1, 9,	  none, NONE, 0),
+	WPCM450_PINCFG(42,	  bsp, MFSEL1, 9,	  none, NONE, 0),
+	WPCM450_PINCFG(43,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(44,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(45,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(46,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(47,	 hsp1, MFSEL1, 10,	  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(48,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(49,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(50,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(51,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(52,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(53,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(54,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(55,	 hsp2, MFSEL1, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(56,	r1err, MFSEL1, 12,	  none, NONE, 0),
+	WPCM450_PINCFG(57,	 r1md, MFSEL1, 13,	  none, NONE, 0),
+	WPCM450_PINCFG(58,	 r1md, MFSEL1, 13,	  none, NONE, 0),
+	WPCM450_PINCFG(59,	  hg6, MFSEL2, 30,	  none, NONE, 0),
+	WPCM450_PINCFG(60,	  hg7, MFSEL2, 31,	  sdio, MFSEL1, 30),
+	WPCM450_PINCFG(61,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
+	WPCM450_PINCFG(62,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
+	WPCM450_PINCFG(63,	 hsp1, MFSEL1, 10,	  none, NONE, 0),
+
+	WPCM450_PINCFG(64,	  fi0, MFSEL2, 0,	  none, NONE, 0),
+	WPCM450_PINCFG(65,	  fi1, MFSEL2, 1,	  none, NONE, 0),
+	WPCM450_PINCFG(66,	  fi2, MFSEL2, 2,	  none, NONE, 0),
+	WPCM450_PINCFG(67,	  fi3, MFSEL2, 3,	  none, NONE, 0),
+	WPCM450_PINCFG(68,	  fi4, MFSEL2, 4,	  none, NONE, 0),
+	WPCM450_PINCFG(69,	  fi5, MFSEL2, 5,	  none, NONE, 0),
+	WPCM450_PINCFG(70,	  fi6, MFSEL2, 6,	  none, NONE, 0),
+	WPCM450_PINCFG(71,	  fi7, MFSEL2, 7,	  none, NONE, 0),
+	WPCM450_PINCFG(72,	  fi8, MFSEL2, 8,	  none, NONE, 0),
+	WPCM450_PINCFG(73,	  fi9, MFSEL2, 9,	  none, NONE, 0),
+	WPCM450_PINCFG(74,	 fi10, MFSEL2, 10,	  none, NONE, 0),
+	WPCM450_PINCFG(75,	 fi11, MFSEL2, 11,	  none, NONE, 0),
+	WPCM450_PINCFG(76,	 fi12, MFSEL2, 12,	  none, NONE, 0),
+	WPCM450_PINCFG(77,	 fi13, MFSEL2, 13,	  none, NONE, 0),
+	WPCM450_PINCFG(78,	 fi14, MFSEL2, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(79,	 fi15, MFSEL2, 15,	  none, NONE, 0),
+	WPCM450_PINCFG(80,	 pwm0, MFSEL2, 16,	  none, NONE, 0),
+	WPCM450_PINCFG(81,	 pwm1, MFSEL2, 17,	  none, NONE, 0),
+	WPCM450_PINCFG(82,	 pwm2, MFSEL2, 18,	  none, NONE, 0),
+	WPCM450_PINCFG(83,	 pwm3, MFSEL2, 19,	  none, NONE, 0),
+	WPCM450_PINCFG(84,	rmii2, MFSEL1, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(85,	rmii2, MFSEL1, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(86,	rmii2, MFSEL1, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(87,	rmii2, MFSEL1, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(88,	rmii2, MFSEL1, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(89,	rmii2, MFSEL1, 14,	  none, NONE, 0),
+	WPCM450_PINCFG(90,	r2err, MFSEL1, 15,	  none, NONE, 0),
+	WPCM450_PINCFG(91,	 r2md, MFSEL1, 16,	  none, NONE, 0),
+	WPCM450_PINCFG(92,	 r2md, MFSEL1, 16,	  none, NONE, 0),
+	WPCM450_PINCFG(93,	 kbcc, MFSEL1, 17,	  none, NONE, 0),
+	WPCM450_PINCFG(94,	 kbcc, MFSEL1, 17,	  none, NONE, 0),
+	WPCM450_PINCFG(95,	 none, NONE, 0,		  none, NONE, 0),
+
+	WPCM450_PINCFG(96,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(97,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(98,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(99,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(100,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(101,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(102,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(103,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(104,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(105,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(106,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(107,	 none, NONE, 0,		  none, NONE, 0),
+	WPCM450_PINCFG(108,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(109,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(110,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(111,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(112,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(113,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(114,	 smb0, MFSEL1, 6,	  none, NONE, 0),
+	WPCM450_PINCFG(115,	 smb0, MFSEL1, 6,	  none, NONE, 0),
+	WPCM450_PINCFG(116,	 smb1, MFSEL1, 7,	  none, NONE, 0),
+	WPCM450_PINCFG(117,	 smb1, MFSEL1, 7,	  none, NONE, 0),
+	WPCM450_PINCFG(118,	 smb2, MFSEL1, 8,	  none, NONE, 0),
+	WPCM450_PINCFG(119,	 smb2, MFSEL1, 8,	  none, NONE, 0),
+	WPCM450_PINCFG(120,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(121,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(122,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(123,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(124,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(125,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(126,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+	WPCM450_PINCFG(127,	 none, NONE, 0,		  none, NONE, 0), /* DVO */
+};
+
+#define WPCM450_PIN(n)		PINCTRL_PIN(n, "gpio" #n)
+
+static const struct pinctrl_pin_desc wpcm450_pins[] =3D {
+	WPCM450_PIN(0),   WPCM450_PIN(1),   WPCM450_PIN(2),   WPCM450_PIN(3),
+	WPCM450_PIN(4),   WPCM450_PIN(5),   WPCM450_PIN(6),   WPCM450_PIN(7),
+	WPCM450_PIN(8),   WPCM450_PIN(9),   WPCM450_PIN(10),  WPCM450_PIN(11),
+	WPCM450_PIN(12),  WPCM450_PIN(13),  WPCM450_PIN(14),  WPCM450_PIN(15),
+	WPCM450_PIN(16),  WPCM450_PIN(17),  WPCM450_PIN(18),  WPCM450_PIN(19),
+	WPCM450_PIN(20),  WPCM450_PIN(21),  WPCM450_PIN(22),  WPCM450_PIN(23),
+	WPCM450_PIN(24),  WPCM450_PIN(25),  WPCM450_PIN(26),  WPCM450_PIN(27),
+	WPCM450_PIN(28),  WPCM450_PIN(29),  WPCM450_PIN(30),  WPCM450_PIN(31),
+	WPCM450_PIN(32),  WPCM450_PIN(33),  WPCM450_PIN(34),  WPCM450_PIN(35),
+	WPCM450_PIN(36),  WPCM450_PIN(37),  WPCM450_PIN(38),  WPCM450_PIN(39),
+	WPCM450_PIN(40),  WPCM450_PIN(41),  WPCM450_PIN(42),  WPCM450_PIN(43),
+	WPCM450_PIN(44),  WPCM450_PIN(45),  WPCM450_PIN(46),  WPCM450_PIN(47),
+	WPCM450_PIN(48),  WPCM450_PIN(49),  WPCM450_PIN(50),  WPCM450_PIN(51),
+	WPCM450_PIN(52),  WPCM450_PIN(53),  WPCM450_PIN(54),  WPCM450_PIN(55),
+	WPCM450_PIN(56),  WPCM450_PIN(57),  WPCM450_PIN(58),  WPCM450_PIN(59),
+	WPCM450_PIN(60),  WPCM450_PIN(61),  WPCM450_PIN(62),  WPCM450_PIN(63),
+	WPCM450_PIN(64),  WPCM450_PIN(65),  WPCM450_PIN(66),  WPCM450_PIN(67),
+	WPCM450_PIN(68),  WPCM450_PIN(69),  WPCM450_PIN(70),  WPCM450_PIN(71),
+	WPCM450_PIN(72),  WPCM450_PIN(73),  WPCM450_PIN(74),  WPCM450_PIN(75),
+	WPCM450_PIN(76),  WPCM450_PIN(77),  WPCM450_PIN(78),  WPCM450_PIN(79),
+	WPCM450_PIN(80),  WPCM450_PIN(81),  WPCM450_PIN(82),  WPCM450_PIN(83),
+	WPCM450_PIN(84),  WPCM450_PIN(85),  WPCM450_PIN(86),  WPCM450_PIN(87),
+	WPCM450_PIN(88),  WPCM450_PIN(89),  WPCM450_PIN(90),  WPCM450_PIN(91),
+	WPCM450_PIN(92),  WPCM450_PIN(93),  WPCM450_PIN(94),  WPCM450_PIN(95),
+	WPCM450_PIN(96),  WPCM450_PIN(97),  WPCM450_PIN(98),  WPCM450_PIN(99),
+	WPCM450_PIN(100), WPCM450_PIN(101), WPCM450_PIN(102), WPCM450_PIN(103),
+	WPCM450_PIN(104), WPCM450_PIN(105), WPCM450_PIN(106), WPCM450_PIN(107),
+	WPCM450_PIN(108), WPCM450_PIN(109), WPCM450_PIN(110), WPCM450_PIN(111),
+	WPCM450_PIN(112), WPCM450_PIN(113), WPCM450_PIN(114), WPCM450_PIN(115),
+	WPCM450_PIN(116), WPCM450_PIN(117), WPCM450_PIN(118), WPCM450_PIN(119),
+	WPCM450_PIN(120), WPCM450_PIN(121), WPCM450_PIN(122), WPCM450_PIN(123),
+	WPCM450_PIN(124), WPCM450_PIN(125), WPCM450_PIN(126), WPCM450_PIN(127),
+};
+
+/* Enable mode in pin group */
+static void wpcm450_setfunc(struct regmap *gcr_regmap, const unsigned int=
 *pin,
+			    int npins, int func)
+{
+	const struct wpcm450_pincfg *cfg;
+	int i;
+
+	for (i =3D 0; i < npins; i++) {
+		cfg =3D &pincfg[pin[i]];
+		if (func =3D=3D fn_gpio || cfg->fn0 =3D=3D func || cfg->fn1 =3D=3D func=
) {
+			if (cfg->reg0)
+				regmap_update_bits(gcr_regmap, cfg->reg0,
+						   BIT(cfg->bit0),
+						   (cfg->fn0 =3D=3D func) ?  BIT(cfg->bit0) : 0);
+			if (cfg->reg1)
+				regmap_update_bits(gcr_regmap, cfg->reg1,
+						   BIT(cfg->bit1),
+						   (cfg->fn1 =3D=3D func) ?  BIT(cfg->bit1) : 0);
+		}
+	}
+}
+
+static int wpcm450_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(wpcm450_groups);
+}
+
+static const char *wpcm450_get_group_name(struct pinctrl_dev *pctldev,
+					  unsigned int selector)
+{
+	return wpcm450_groups[selector].name;
+}
+
+static int wpcm450_get_group_pins(struct pinctrl_dev *pctldev,
+				  unsigned int selector,
+				  const unsigned int **pins,
+				  unsigned int *npins)
+{
+	*npins =3D wpcm450_groups[selector].num_pins;
+	*pins  =3D wpcm450_groups[selector].pins;
+
+	return 0;
+}
+
+static int wpcm450_dt_node_to_map(struct pinctrl_dev *pctldev,
+				  struct device_node *np_config,
+				  struct pinctrl_map **map,
+				  u32 *num_maps)
+{
+	return pinconf_generic_dt_node_to_map(pctldev, np_config,
+					      map, num_maps,
+					      PIN_MAP_TYPE_INVALID);
+}
+
+static void wpcm450_dt_free_map(struct pinctrl_dev *pctldev,
+				struct pinctrl_map *map, u32 num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops wpcm450_pinctrl_ops =3D {
+	.get_groups_count =3D wpcm450_get_groups_count,
+	.get_group_name =3D wpcm450_get_group_name,
+	.get_group_pins =3D wpcm450_get_group_pins,
+	.dt_node_to_map =3D wpcm450_dt_node_to_map,
+	.dt_free_map =3D wpcm450_dt_free_map,
+};
+
+static int wpcm450_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(wpcm450_funcs);
+}
+
+static const char *wpcm450_get_function_name(struct pinctrl_dev *pctldev,
+					     unsigned int function)
+{
+	return wpcm450_funcs[function].name;
+}
+
+static int wpcm450_get_function_groups(struct pinctrl_dev *pctldev,
+				       unsigned int function,
+				       const char * const **groups,
+				       unsigned int * const ngroups)
+{
+	*ngroups =3D wpcm450_funcs[function].ngroups;
+	*groups	 =3D wpcm450_funcs[function].groups;
+
+	return 0;
+}
+
+static int wpcm450_pinmux_set_mux(struct pinctrl_dev *pctldev,
+				  unsigned int function,
+				  unsigned int group)
+{
+	struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
+
+	wpcm450_setfunc(pctrl->gcr_regmap, wpcm450_groups[group].pins,
+			wpcm450_groups[group].num_pins, function);
+
+	return 0;
+}
+
+static const struct pinmux_ops wpcm450_pinmux_ops =3D {
+	.get_functions_count =3D wpcm450_get_functions_count,
+	.get_function_name =3D wpcm450_get_function_name,
+	.get_function_groups =3D wpcm450_get_function_groups,
+	.set_mux =3D wpcm450_pinmux_set_mux,
+};
+
+static int debounce_bitnum(int gpio)
+{
+	if (gpio >=3D 0 && gpio < 16)
+		return gpio;
+	return -EINVAL;
+}
+
+static int wpcm450_config_get(struct pinctrl_dev *pctldev, unsigned int p=
in,
+			      unsigned long *config)
+{
+	struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param =3D pinconf_to_config_param(*config);
+	unsigned long flags;
+	int bit;
+	u32 reg;
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		bit =3D debounce_bitnum(pin);
+		if (bit < 0)
+			return bit;
+
+		spin_lock_irqsave(&pctrl->lock, flags);
+		reg =3D ioread32(pctrl->gpio_base + WPCM450_GPEVDBNC);
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+
+		*config =3D pinconf_to_config_packed(param, !!(reg & BIT(bit)));
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int wpcm450_config_set_one(struct wpcm450_pinctrl *pctrl,
+				  unsigned int pin, unsigned long config)
+{
+	enum pin_config_param param =3D pinconf_to_config_param(config);
+	unsigned long flags;
+	unsigned long reg;
+	int bit;
+	int arg;
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		bit =3D debounce_bitnum(pin);
+		if (bit < 0)
+			return bit;
+
+		arg =3D pinconf_to_config_argument(config);
+
+		spin_lock_irqsave(&pctrl->lock, flags);
+		reg =3D ioread32(pctrl->gpio_base + WPCM450_GPEVDBNC);
+		__assign_bit(bit, &reg, arg);
+		iowrite32(reg, pctrl->gpio_base + WPCM450_GPEVDBNC);
+		spin_unlock_irqrestore(&pctrl->lock, flags);
+		return 0;
+	default:
+		return -ENOTSUPP;
+	}
+}
+
+static int wpcm450_config_set(struct pinctrl_dev *pctldev, unsigned int p=
in,
+			      unsigned long *configs, unsigned int num_configs)
+{
+	struct wpcm450_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	while (num_configs--) {
+		ret =3D wpcm450_config_set_one(pctrl, pin, *configs++);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops wpcm450_pinconf_ops =3D {
+	.is_generic =3D true,
+	.pin_config_get =3D wpcm450_config_get,
+	.pin_config_set =3D wpcm450_config_set,
+};
+
+static struct pinctrl_desc wpcm450_pinctrl_desc =3D {
+	.name =3D "wpcm450-pinctrl",
+	.pins =3D wpcm450_pins,
+	.npins =3D ARRAY_SIZE(wpcm450_pins),
+	.pctlops =3D &wpcm450_pinctrl_ops,
+	.pmxops =3D &wpcm450_pinmux_ops,
+	.confops =3D &wpcm450_pinconf_ops,
+	.owner =3D THIS_MODULE,
+};
+
+static int wpcm450_gpio_set_config(struct gpio_chip *chip,
+				   unsigned int offset, unsigned long config)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(chip);
+
+	return wpcm450_config_set_one(gpio->pctrl, offset, config);
+}
+
+static int wpcm450_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+	struct wpcm450_gpio *gpio =3D gpiochip_get_data(chip);
+	const struct wpcm450_bank *bank =3D gpio->bank;
+
+	return gpiochip_add_pin_range(&gpio->gc, dev_name(gpio->pctrl->dev),
+				      0, bank->base, bank->length);
+}
+
+static int wpcm450_gpio_register(struct platform_device *pdev,
+				 struct wpcm450_pinctrl *pctrl)
+{
+	struct device *dev =3D &pdev->dev;
+	struct fwnode_handle *child;
+	int ret;
+
+	pctrl->gpio_base =3D devm_platform_ioremap_resource(pdev, 0);
+	if (!pctrl->gpio_base)
+		return dev_err_probe(dev, -ENOMEM, "Resource fail for GPIO controller\n=
");
+
+	device_for_each_child_node(dev, child)  {
+		void __iomem *dat =3D NULL;
+		void __iomem *set =3D NULL;
+		void __iomem *dirout =3D NULL;
+		unsigned long flags =3D 0;
+		const struct wpcm450_bank *bank;
+		struct wpcm450_gpio *gpio;
+		struct gpio_irq_chip *girq;
+		u32 reg;
+		int i;
+
+		if (!fwnode_property_read_bool(child, "gpio-controller"))
+			continue;
+
+		ret =3D fwnode_property_read_u32(child, "reg", &reg);
+		if (ret < 0)
+			return ret;
+
+		gpio =3D &pctrl->gpio_bank[reg];
+		gpio->pctrl =3D pctrl;
+
+		if (reg > WPCM450_NUM_BANKS)
+			return dev_err_probe(dev, -EINVAL,
+					     "GPIO index %d out of range!\n", reg);
+
+		bank =3D &wpcm450_banks[reg];
+		gpio->bank =3D bank;
+
+		dat =3D pctrl->gpio_base + bank->datain;
+		if (bank->dataout) {
+			set =3D pctrl->gpio_base + bank->dataout;
+			dirout =3D pctrl->gpio_base + bank->cfg0;
+		} else {
+			flags =3D BGPIOF_NO_OUTPUT;
+		}
+		ret =3D bgpio_init(&gpio->gc, dev, 4,
+				 dat, set, NULL, dirout, NULL, flags);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "GPIO initialization failed\n");
+
+		gpio->gc.ngpio =3D bank->length;
+		gpio->gc.set_config =3D wpcm450_gpio_set_config;
+		gpio->gc.fwnode =3D child;
+		gpio->gc.add_pin_ranges =3D wpcm450_gpio_add_pin_ranges;
+
+		gpio->irqc =3D wpcm450_gpio_irqchip;
+		girq =3D &gpio->gc.irq;
+		girq->chip =3D &gpio->irqc;
+		girq->parent_handler =3D wpcm450_gpio_irqhandler;
+		girq->parents =3D devm_kcalloc(dev, WPCM450_NUM_GPIO_IRQS,
+					     sizeof(*girq->parents), GFP_KERNEL);
+		if (!girq->parents)
+			return -ENOMEM;
+		girq->default_type =3D IRQ_TYPE_NONE;
+		girq->handler =3D handle_bad_irq;
+
+		girq->num_parents =3D 0;
+		for (i =3D 0; i < WPCM450_NUM_GPIO_IRQS; i++) {
+			int irq =3D fwnode_irq_get(child, i);
+
+			if (irq < 0)
+				break;
+
+			girq->parents[i] =3D irq;
+			girq->num_parents++;
+		}
+
+		ret =3D devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add GPIO chip\n");
+	}
+
+	return 0;
+}
+
+static int wpcm450_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct wpcm450_pinctrl *pctrl;
+	int ret;
+
+	pctrl =3D devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->dev =3D &pdev->dev;
+	spin_lock_init(&pctrl->lock);
+	dev_set_drvdata(dev, pctrl);
+
+	pctrl->gcr_regmap =3D
+		syscon_regmap_lookup_by_compatible("nuvoton,wpcm450-gcr");
+	if (IS_ERR(pctrl->gcr_regmap))
+		return dev_err_probe(dev, PTR_ERR(pctrl->gcr_regmap),
+				     "Failed to find nuvoton,wpcm450-gcr\n");
+
+	pctrl->pctldev =3D devm_pinctrl_register(dev,
+					       &wpcm450_pinctrl_desc, pctrl);
+	if (IS_ERR(pctrl->pctldev))
+		return dev_err_probe(dev, PTR_ERR(pctrl->pctldev),
+				     "Failed to register pinctrl device\n");
+
+	ret =3D wpcm450_gpio_register(pdev, pctrl);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id wpcm450_pinctrl_match[] =3D {
+	{ .compatible =3D "nuvoton,wpcm450-pinctrl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, wpcm450_pinctrl_match);
+
+static struct platform_driver wpcm450_pinctrl_driver =3D {
+	.probe =3D wpcm450_pinctrl_probe,
+	.driver =3D {
+		.name =3D "wpcm450-pinctrl",
+		.of_match_table =3D wpcm450_pinctrl_match,
+	},
+};
+module_platform_driver(wpcm450_pinctrl_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>");
+MODULE_DESCRIPTION("Nuvoton WPCM450 Pinctrl and GPIO driver");
=2D-
2.30.2

