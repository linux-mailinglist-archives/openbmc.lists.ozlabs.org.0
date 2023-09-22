Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F3A7AA6A1
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 03:44:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JwK9H8L3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsFSQ0N2Kz3cbZ
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 11:44:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JwK9H8L3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 480 seconds by postgrey-1.37 at boromir; Fri, 22 Sep 2023 11:44:02 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsFRk33BMz30RV;
	Fri, 22 Sep 2023 11:44:02 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 18CBA71B;
	Thu, 21 Sep 2023 18:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1695346556;
	bh=wBmZ94Tjue/srt7oHjURk9wPTPStY6npfsmnvm1vRrg=;
	h=From:To:Cc:Subject:Date:From;
	b=JwK9H8L3pTZzthIZF5yJDbd8CFYusMgoiOavw+cq7rWiRO76WaeE/3XHL83eY6QlA
	 L4RjLv1F83B498BuxajIw/Cq8KYVN88dBBk1yyAXnEKKHcYVfRM3fli/Ayt/iZMlNb
	 vHKXOd1jWrfJwY943xdTeXelZNs9o0AZfyL3eSUQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] watchdog: aspeed: Add sysfs attributes for reset mask bits
Date: Thu, 21 Sep 2023 18:35:43 -0700
Message-ID: <20230922013542.29136-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
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
Cc: Zev Weiss <zev@bewilderbeest.net>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The AST2500 and AST2600 watchdog timers provide the ability to control
which devices are reset by the watchdog timer via a reset mask
resgister.  Previously the driver ignored that register, leaving
whatever configuration it found at boot and offering no way of
altering its settings.  Add a 'reset_ctrl' sysfs subdirectory with a
file per bit so that userspace can determine which devices the reset
is applied to.

Note that not all bits in the hardware register are exposed -- in
particular, the ARM CPU and SOC/misc reset bits are left hidden since
clearing them can render the system unable to reboot.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

I'm porting OpenBMC to a platform that requires that the LPC controller remain
un-reset by a BMC reboot.  With this patch userspace can control the reset
mask of the Aspeed watchdog timer, with a few bits remaining unexposed so as
to prevent some almost-certainly undesirable situations.  If there are other
bits that people feel shouldn't be exposed (or conversely if someone feels
strongly that the "dangerous" bits _should_ be exposed) I can adjust
accordingly.

Also, I was a little unsure about appropriately-concise names for some of the
bits, and am not hugely attached to the ones currently in this patch, so
suggestions on better alternatives there would also be welcome.

I've tested this on ast2500 hardware and a qemu ast2600 model (since I don't
have any ast2600 hardware) and it appears to be working as intended, but if
anyone can verify on actual ast2600 hardware that would of course be nice to
confirm.

 .../ABI/testing/sysfs-class-watchdog          |  10 +
 drivers/watchdog/aspeed_wdt.c                 | 290 ++++++++++++++++--
 2 files changed, 272 insertions(+), 28 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
index 94fb74615951..a2f4bb6a4263 100644
--- a/Documentation/ABI/testing/sysfs-class-watchdog
+++ b/Documentation/ABI/testing/sysfs-class-watchdog
@@ -127,3 +127,13 @@ Description:
 		shown. When written with any non-zero value, it clears
 		the boot code selection and the timeout counter, which results
 		in chipselect reset for AST2400/AST2500.
+
+What:		/sys/class/watchdog/watchdogn/reset_ctrl/*
+Date:		September 2023
+Contact:	Zev Weiss <zev@bewilderbeest.net>
+Description:
+		The read/write files in this subdirectory (present on Aspeed
+		AST2500 and AST2600 only) control which devices and SoC
+		components are reset when the watchdog timer expires.  When set
+		to '1', the device indicated by the name of the file will be
+		reset; when set to '0' it will not.
diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index b72a858bbac7..a05dcf1b5d34 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -26,6 +26,7 @@ struct aspeed_wdt_config {
 	u32 ext_pulse_width_mask;
 	u32 irq_shift;
 	u32 irq_mask;
+	const struct attribute_group *reset_ctrl_group;
 };
 
 struct aspeed_wdt {
@@ -33,34 +34,10 @@ struct aspeed_wdt {
 	void __iomem		*base;
 	u32			ctrl;
 	const struct aspeed_wdt_config *cfg;
+	const struct attribute_group *groups[3]; /* bswitch_group, reset ctrl, NULL terminator */
+	spinlock_t		lock;
 };
 
-static const struct aspeed_wdt_config ast2400_config = {
-	.ext_pulse_width_mask = 0xff,
-	.irq_shift = 0,
-	.irq_mask = 0,
-};
-
-static const struct aspeed_wdt_config ast2500_config = {
-	.ext_pulse_width_mask = 0xfffff,
-	.irq_shift = 12,
-	.irq_mask = GENMASK(31, 12),
-};
-
-static const struct aspeed_wdt_config ast2600_config = {
-	.ext_pulse_width_mask = 0xfffff,
-	.irq_shift = 0,
-	.irq_mask = GENMASK(31, 10),
-};
-
-static const struct of_device_id aspeed_wdt_of_table[] = {
-	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
-	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
-	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
-
 #define WDT_STATUS		0x00
 #define WDT_RELOAD_VALUE	0x04
 #define WDT_RESTART		0x08
@@ -79,6 +56,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
 #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY	BIT(1)
 #define WDT_CLEAR_TIMEOUT_STATUS	0x14
 #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION	BIT(0)
+#define WDT_RESET_MASK1		0x1c
+#define WDT_RESET_MASK2		0x20
 
 /*
  * WDT_RESET_WIDTH controls the characteristics of the external pulse (if
@@ -263,7 +242,227 @@ static struct attribute *bswitch_attrs[] = {
 	&dev_attr_access_cs0.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(bswitch);
+
+static const struct attribute_group bswitch_group = {
+	.attrs = bswitch_attrs,
+};
+
+struct aspeed_wdt_rstctrl_bit {
+	struct device_attribute dev_attr;
+	u8 reg, bit;
+};
+
+static ssize_t aspeed_wdt_reset_ctrl_show(struct device *dev, struct device_attribute *attr,
+					  char *buf)
+{
+	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
+	struct aspeed_wdt_rstctrl_bit *bit = container_of(attr, struct aspeed_wdt_rstctrl_bit,
+							  dev_attr);
+	u32 mask = readl(wdt->base + bit->reg);
+
+	return sysfs_emit(buf, "%u\n", !!(mask & BIT(bit->bit)));
+}
+
+static ssize_t aspeed_wdt_reset_ctrl_store(struct device *dev, struct device_attribute *attr,
+					   const char *buf, size_t size)
+{
+	struct aspeed_wdt *wdt = dev_get_drvdata(dev);
+	struct aspeed_wdt_rstctrl_bit *bit = container_of(attr, struct aspeed_wdt_rstctrl_bit,
+							  dev_attr);
+	u32 mask;
+	bool val;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	spin_lock(&wdt->lock);
+	mask = readl(wdt->base + bit->reg);
+	if (val)
+		mask |= BIT(bit->bit);
+	else
+		mask &= ~BIT(bit->bit);
+	writel(mask, wdt->base + bit->reg);
+	spin_unlock(&wdt->lock);
+
+	return size;
+}
+
+#define ASPEED_WDT_RSTCTRL_BIT(chip, name, regnum, bitnum)			\
+	static struct aspeed_wdt_rstctrl_bit chip##_##name##_reset_ctrl = {	\
+		.dev_attr = __ATTR(name, 0644, aspeed_wdt_reset_ctrl_show,	\
+				   aspeed_wdt_reset_ctrl_store),		\
+		.reg = regnum,							\
+		.bit = bitnum,							\
+	}
+
+#define AST2500_WDT_RESET_CTRL(name, bit) \
+	ASPEED_WDT_RSTCTRL_BIT(ast2500, name, WDT_RESET_MASK1, bit)
+
+AST2500_WDT_RESET_CTRL(spi, 24);
+AST2500_WDT_RESET_CTRL(xdma, 23);
+AST2500_WDT_RESET_CTRL(mctp, 22);
+AST2500_WDT_RESET_CTRL(gpio, 21);
+AST2500_WDT_RESET_CTRL(adc, 20);
+AST2500_WDT_RESET_CTRL(jtag, 19);
+AST2500_WDT_RESET_CTRL(peci, 18);
+AST2500_WDT_RESET_CTRL(pwm, 17);
+AST2500_WDT_RESET_CTRL(crt, 16);
+AST2500_WDT_RESET_CTRL(mic, 15);
+AST2500_WDT_RESET_CTRL(sdio, 14);
+AST2500_WDT_RESET_CTRL(lpc, 13);
+AST2500_WDT_RESET_CTRL(hac, 12);
+AST2500_WDT_RESET_CTRL(video, 11);
+AST2500_WDT_RESET_CTRL(hid_ehci, 10);
+AST2500_WDT_RESET_CTRL(usb_host, 9);
+AST2500_WDT_RESET_CTRL(usb2_host_hub, 8);
+AST2500_WDT_RESET_CTRL(graphics, 7);
+AST2500_WDT_RESET_CTRL(mac1, 6);
+AST2500_WDT_RESET_CTRL(mac0, 5);
+AST2500_WDT_RESET_CTRL(i2c, 4);
+AST2500_WDT_RESET_CTRL(ahb, 3);
+AST2500_WDT_RESET_CTRL(sdram, 2);
+AST2500_WDT_RESET_CTRL(coproc, 1);
+
+static struct attribute *ast2500_reset_ctrl_attrs[] = {
+	&ast2500_spi_reset_ctrl.dev_attr.attr,
+	&ast2500_xdma_reset_ctrl.dev_attr.attr,
+	&ast2500_mctp_reset_ctrl.dev_attr.attr,
+	&ast2500_gpio_reset_ctrl.dev_attr.attr,
+	&ast2500_adc_reset_ctrl.dev_attr.attr,
+	&ast2500_jtag_reset_ctrl.dev_attr.attr,
+	&ast2500_peci_reset_ctrl.dev_attr.attr,
+	&ast2500_pwm_reset_ctrl.dev_attr.attr,
+	&ast2500_crt_reset_ctrl.dev_attr.attr,
+	&ast2500_mic_reset_ctrl.dev_attr.attr,
+	&ast2500_sdio_reset_ctrl.dev_attr.attr,
+	&ast2500_lpc_reset_ctrl.dev_attr.attr,
+	&ast2500_hac_reset_ctrl.dev_attr.attr,
+	&ast2500_video_reset_ctrl.dev_attr.attr,
+	&ast2500_hid_ehci_reset_ctrl.dev_attr.attr,
+	&ast2500_usb_host_reset_ctrl.dev_attr.attr,
+	&ast2500_usb2_host_hub_reset_ctrl.dev_attr.attr,
+	&ast2500_graphics_reset_ctrl.dev_attr.attr,
+	&ast2500_mac1_reset_ctrl.dev_attr.attr,
+	&ast2500_mac0_reset_ctrl.dev_attr.attr,
+	&ast2500_i2c_reset_ctrl.dev_attr.attr,
+	&ast2500_ahb_reset_ctrl.dev_attr.attr,
+	&ast2500_sdram_reset_ctrl.dev_attr.attr,
+	&ast2500_coproc_reset_ctrl.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group ast2500_reset_ctrl_group = {
+	.name = "reset_ctrl",
+	.attrs = ast2500_reset_ctrl_attrs,
+};
+
+#define AST2600_WDT_RESET_CTRL(name, reg, bit) \
+	ASPEED_WDT_RSTCTRL_BIT(ast2600, name, reg, bit)
+
+AST2600_WDT_RESET_CTRL(rvas, WDT_RESET_MASK1, 25);
+AST2600_WDT_RESET_CTRL(gpio0, WDT_RESET_MASK1, 24);
+AST2600_WDT_RESET_CTRL(xdma1, WDT_RESET_MASK1, 23);
+AST2600_WDT_RESET_CTRL(xdma0, WDT_RESET_MASK1, 22);
+AST2600_WDT_RESET_CTRL(mctp1, WDT_RESET_MASK1, 21);
+AST2600_WDT_RESET_CTRL(mctp0, WDT_RESET_MASK1, 20);
+AST2600_WDT_RESET_CTRL(jtag0, WDT_RESET_MASK1, 19);
+AST2600_WDT_RESET_CTRL(sdio0, WDT_RESET_MASK1, 18);
+AST2600_WDT_RESET_CTRL(mac1, WDT_RESET_MASK1, 17);
+AST2600_WDT_RESET_CTRL(mac0, WDT_RESET_MASK1, 16);
+AST2600_WDT_RESET_CTRL(gp_mcu, WDT_RESET_MASK1, 15);
+AST2600_WDT_RESET_CTRL(dp_mcu, WDT_RESET_MASK1, 14);
+AST2600_WDT_RESET_CTRL(dp, WDT_RESET_MASK1, 13);
+AST2600_WDT_RESET_CTRL(hac, WDT_RESET_MASK1, 12);
+AST2600_WDT_RESET_CTRL(video, WDT_RESET_MASK1, 11);
+AST2600_WDT_RESET_CTRL(crt, WDT_RESET_MASK1, 10);
+AST2600_WDT_RESET_CTRL(graphics, WDT_RESET_MASK1, 9);
+AST2600_WDT_RESET_CTRL(uhci, WDT_RESET_MASK1, 8);
+AST2600_WDT_RESET_CTRL(usb_b, WDT_RESET_MASK1, 7);
+AST2600_WDT_RESET_CTRL(usb_a, WDT_RESET_MASK1, 6);
+AST2600_WDT_RESET_CTRL(coproc, WDT_RESET_MASK1, 5);
+AST2600_WDT_RESET_CTRL(sli, WDT_RESET_MASK1, 3);
+AST2600_WDT_RESET_CTRL(ahb, WDT_RESET_MASK1, 2);
+AST2600_WDT_RESET_CTRL(sdram, WDT_RESET_MASK1, 1);
+
+AST2600_WDT_RESET_CTRL(espi, WDT_RESET_MASK2, 26);
+AST2600_WDT_RESET_CTRL(i3c5, WDT_RESET_MASK2, 23);
+AST2600_WDT_RESET_CTRL(i3c4, WDT_RESET_MASK2, 22);
+AST2600_WDT_RESET_CTRL(i3c3, WDT_RESET_MASK2, 21);
+AST2600_WDT_RESET_CTRL(i3c2, WDT_RESET_MASK2, 20);
+AST2600_WDT_RESET_CTRL(i3c1, WDT_RESET_MASK2, 19);
+AST2600_WDT_RESET_CTRL(i3c0, WDT_RESET_MASK2, 18);
+AST2600_WDT_RESET_CTRL(i3c_global, WDT_RESET_MASK2, 17);
+AST2600_WDT_RESET_CTRL(i2c, WDT_RESET_MASK2, 16);
+AST2600_WDT_RESET_CTRL(fsi, WDT_RESET_MASK2, 15);
+AST2600_WDT_RESET_CTRL(adc, WDT_RESET_MASK2, 14);
+AST2600_WDT_RESET_CTRL(pwm, WDT_RESET_MASK2, 13);
+AST2600_WDT_RESET_CTRL(peci, WDT_RESET_MASK2, 12);
+AST2600_WDT_RESET_CTRL(lpc, WDT_RESET_MASK2, 11);
+AST2600_WDT_RESET_CTRL(mdio, WDT_RESET_MASK2, 10);
+AST2600_WDT_RESET_CTRL(gpio1, WDT_RESET_MASK2, 9);
+AST2600_WDT_RESET_CTRL(jtag1, WDT_RESET_MASK2, 8);
+AST2600_WDT_RESET_CTRL(sdio1, WDT_RESET_MASK2, 7);
+AST2600_WDT_RESET_CTRL(mac3, WDT_RESET_MASK2, 6);
+AST2600_WDT_RESET_CTRL(mac2, WDT_RESET_MASK2, 5);
+AST2600_WDT_RESET_CTRL(sli2, WDT_RESET_MASK2, 3);
+AST2600_WDT_RESET_CTRL(ahb2, WDT_RESET_MASK2, 2);
+AST2600_WDT_RESET_CTRL(spi, WDT_RESET_MASK2, 1);
+
+static struct attribute *ast2600_reset_ctrl_attrs[] = {
+	&ast2600_rvas_reset_ctrl.dev_attr.attr,
+	&ast2600_gpio0_reset_ctrl.dev_attr.attr,
+	&ast2600_xdma1_reset_ctrl.dev_attr.attr,
+	&ast2600_xdma0_reset_ctrl.dev_attr.attr,
+	&ast2600_mctp1_reset_ctrl.dev_attr.attr,
+	&ast2600_mctp0_reset_ctrl.dev_attr.attr,
+	&ast2600_jtag0_reset_ctrl.dev_attr.attr,
+	&ast2600_sdio0_reset_ctrl.dev_attr.attr,
+	&ast2600_mac1_reset_ctrl.dev_attr.attr,
+	&ast2600_mac0_reset_ctrl.dev_attr.attr,
+	&ast2600_gp_mcu_reset_ctrl.dev_attr.attr,
+	&ast2600_dp_mcu_reset_ctrl.dev_attr.attr,
+	&ast2600_dp_reset_ctrl.dev_attr.attr,
+	&ast2600_hac_reset_ctrl.dev_attr.attr,
+	&ast2600_video_reset_ctrl.dev_attr.attr,
+	&ast2600_crt_reset_ctrl.dev_attr.attr,
+	&ast2600_graphics_reset_ctrl.dev_attr.attr,
+	&ast2600_uhci_reset_ctrl.dev_attr.attr,
+	&ast2600_usb_b_reset_ctrl.dev_attr.attr,
+	&ast2600_usb_a_reset_ctrl.dev_attr.attr,
+	&ast2600_coproc_reset_ctrl.dev_attr.attr,
+	&ast2600_sli_reset_ctrl.dev_attr.attr,
+	&ast2600_ahb_reset_ctrl.dev_attr.attr,
+	&ast2600_sdram_reset_ctrl.dev_attr.attr,
+	&ast2600_espi_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c5_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c4_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c3_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c2_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c1_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c0_reset_ctrl.dev_attr.attr,
+	&ast2600_i3c_global_reset_ctrl.dev_attr.attr,
+	&ast2600_i2c_reset_ctrl.dev_attr.attr,
+	&ast2600_fsi_reset_ctrl.dev_attr.attr,
+	&ast2600_adc_reset_ctrl.dev_attr.attr,
+	&ast2600_pwm_reset_ctrl.dev_attr.attr,
+	&ast2600_peci_reset_ctrl.dev_attr.attr,
+	&ast2600_lpc_reset_ctrl.dev_attr.attr,
+	&ast2600_mdio_reset_ctrl.dev_attr.attr,
+	&ast2600_gpio1_reset_ctrl.dev_attr.attr,
+	&ast2600_jtag1_reset_ctrl.dev_attr.attr,
+	&ast2600_sdio1_reset_ctrl.dev_attr.attr,
+	&ast2600_mac3_reset_ctrl.dev_attr.attr,
+	&ast2600_mac2_reset_ctrl.dev_attr.attr,
+	&ast2600_sli2_reset_ctrl.dev_attr.attr,
+	&ast2600_ahb2_reset_ctrl.dev_attr.attr,
+	&ast2600_spi_reset_ctrl.dev_attr.attr,
+	NULL
+};
+
+static const struct attribute_group ast2600_reset_ctrl_group = {
+	.name = "reset_ctrl",
+	.attrs = ast2600_reset_ctrl_attrs,
+};
 
 static const struct watchdog_ops aspeed_wdt_ops = {
 	.start		= aspeed_wdt_start,
@@ -302,6 +501,34 @@ static irqreturn_t aspeed_wdt_irq(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static const struct aspeed_wdt_config ast2400_config = {
+	.ext_pulse_width_mask = 0xff,
+	.irq_shift = 0,
+	.irq_mask = 0,
+};
+
+static const struct aspeed_wdt_config ast2500_config = {
+	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 12,
+	.irq_mask = GENMASK(31, 12),
+	.reset_ctrl_group = &ast2500_reset_ctrl_group,
+};
+
+static const struct aspeed_wdt_config ast2600_config = {
+	.ext_pulse_width_mask = 0xfffff,
+	.irq_shift = 0,
+	.irq_mask = GENMASK(31, 10),
+	.reset_ctrl_group = &ast2600_reset_ctrl_group,
+};
+
+static const struct of_device_id aspeed_wdt_of_table[] = {
+	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
+
 static int aspeed_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -312,6 +539,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	u32 duration;
 	u32 status;
 	int ret;
+	int ngroups = 0;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -328,6 +556,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
+	spin_lock_init(&wdt->lock);
+
 	wdt->wdd.info = &aspeed_wdt_info;
 
 	if (wdt->cfg->irq_mask) {
@@ -347,6 +577,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 	wdt->wdd.ops = &aspeed_wdt_ops;
 	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
 	wdt->wdd.parent = dev;
+	wdt->wdd.groups = wdt->groups;
 
 	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
@@ -453,9 +684,12 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 
 		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
 		    of_device_is_compatible(np, "aspeed,ast2500-wdt"))
-			wdt->wdd.groups = bswitch_groups;
+			wdt->groups[ngroups++] = &bswitch_group;
 	}
 
+	if (wdt->cfg->reset_ctrl_group)
+		wdt->groups[ngroups++] = wdt->cfg->reset_ctrl_group;
+
 	dev_set_drvdata(dev, wdt);
 
 	return devm_watchdog_register_device(dev, &wdt->wdd);
-- 
2.42.0

