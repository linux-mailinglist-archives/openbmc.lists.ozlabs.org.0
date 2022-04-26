Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32550F38C
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 10:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnZZ45h94z3bWx
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 18:20:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=NdQz/5eo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=NdQz/5eo; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnYCb6qvVz2xgN
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 17:19:07 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 987B2B4C;
 Tue, 26 Apr 2022 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1650957545;
 bh=Mkc3RMCG89oynEXz2Pm6UbMhR++lJvil7LMdWORXQao=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NdQz/5eov3qZMM3rqPdeWo31IME2wk8HpKo9YOHThSqxxHk6ACzN5Eo7er9ydHBSm
 c5lLWQPPe4cqjjejnnQW6xa1Z5Ldlf+M5a2PDliRDU/YnGD85ENoNn0QXGWwZMZvHo
 s3xLmR4hF8ip83nimzfd/ND9Hmdun9yLTU1I6zEc=
From: Zev Weiss <zev@bewilderbeest.net>
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
Subject: [PATCH v3 5/6] hwmon: (nct6775) Split core and platform driver
Date: Tue, 26 Apr 2022 00:18:47 -0700
Message-Id: <20220426071848.11619-6-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426071848.11619-1-zev@bewilderbeest.net>
References: <20220426071848.11619-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Apr 2022 18:19:48 +1000
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Zev Weiss <zev@bewilderbeest.net>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This splits the nct6775 driver into an interface-independent core and
a separate platform driver that wraps inb/outb port I/O (or asuswmi
methods) around that core.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Tested-by: Renze Nicolai <renze@rnplus.nl>
---
 MAINTAINERS                                 |    4 +-
 drivers/hwmon/Kconfig                       |   15 +-
 drivers/hwmon/Makefile                      |    1 +
 drivers/hwmon/{nct6775.c => nct6775-core.c} | 1465 +-----
 drivers/hwmon/nct6775-core.h                |  252 +
 drivers/hwmon/nct6775.c                     | 4891 +------------------
 6 files changed, 538 insertions(+), 6090 deletions(-)
 copy drivers/hwmon/{nct6775.c => nct6775-core.c} (76%)
 create mode 100644 drivers/hwmon/nct6775-core.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 316b96575133..ca1d930d3d88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13529,11 +13529,13 @@ M:	Samuel Mendoza-Jonas <sam@mendozajonas.com>
 S:	Maintained
 F:	net/ncsi/
 
-NCT6775 HARDWARE MONITOR DRIVER
+NCT6775 HARDWARE MONITOR DRIVER - CORE & PLATFORM DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/hwmon/nct6775.rst
+F:	drivers/hwmon/nct6775-core.c
+F:	drivers/hwmon/nct6775-core.h
 F:	drivers/hwmon/nct6775.c
 
 NETDEVSIM
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index da3546f20c0b..85c22bba439b 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1462,12 +1462,23 @@ config SENSORS_NCT6683
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6683.
 
+config SENSORS_NCT6775_CORE
+	tristate
+	select REGMAP
+	help
+	  This module contains common code shared by the platform and
+	  i2c versions of the nct6775 driver; it is not useful on its
+	  own.
+
+	  If built as a module, the module will be called
+	  nct6775-core.
+
 config SENSORS_NCT6775
-	tristate "Nuvoton NCT6775F and compatibles"
+	tristate "Platform driver for Nuvoton NCT6775F and compatibles"
 	depends on !PPC
 	depends on ACPI_WMI || ACPI_WMI=n
 	select HWMON_VID
-	select REGMAP
+	select SENSORS_NCT6775_CORE
 	help
 	  If you say yes here you get support for the hardware monitoring
 	  functionality of the Nuvoton NCT6106D, NCT6775F, NCT6776F, NCT6779D,
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 8a03289e2aa4..86a3573be7e8 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -154,6 +154,7 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
+obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
 obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
 obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
 obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775-core.c
similarity index 76%
copy from drivers/hwmon/nct6775.c
copy to drivers/hwmon/nct6775-core.c
index 5dafe3d24e07..23359ba9ba8a 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -44,25 +44,20 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/jiffies.h>
-#include <linux/platform_device.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
-#include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/acpi.h>
 #include <linux/bitops.h>
-#include <linux/dmi.h>
-#include <linux/io.h>
 #include <linux/nospec.h>
 #include <linux/regmap.h>
-#include <linux/wmi.h>
 #include "lm75.h"
+#include "nct6775-core.h"
 
-#define USE_ALTERNATE
+#undef DEFAULT_SYMBOL_NAMESPACE
+#define DEFAULT_SYMBOL_NAMESPACE HWMON_NCT6775
 
-enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
-	     nct6793, nct6795, nct6796, nct6797, nct6798 };
+#define USE_ALTERNATE
 
 /* used to set data->name = nct6775_device_names[data->sio_kind] */
 static const char * const nct6775_device_names[] = {
@@ -80,242 +75,6 @@ static const char * const nct6775_device_names[] = {
 	"nct6798",
 };
 
-static const char * const nct6775_sio_names[] __initconst = {
-	"NCT6106D",
-	"NCT6116D",
-	"NCT6775F",
-	"NCT6776D/F",
-	"NCT6779D",
-	"NCT6791D",
-	"NCT6792D",
-	"NCT6793D",
-	"NCT6795D",
-	"NCT6796D",
-	"NCT6797D",
-	"NCT6798D",
-};
-
-static unsigned short force_id;
-module_param(force_id, ushort, 0);
-MODULE_PARM_DESC(force_id, "Override the detected device ID");
-
-static unsigned short fan_debounce;
-module_param(fan_debounce, ushort, 0);
-MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
-
-#define DRVNAME "nct6775"
-
-/*
- * Super-I/O constants and functions
- */
-
-#define NCT6775_LD_ACPI		0x0a
-#define NCT6775_LD_HWM		0x0b
-#define NCT6775_LD_VID		0x0d
-#define NCT6775_LD_12		0x12
-
-#define SIO_REG_LDSEL		0x07	/* Logical device select */
-#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
-#define SIO_REG_ENABLE		0x30	/* Logical device enable */
-#define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
-
-#define SIO_NCT6106_ID		0xc450
-#define SIO_NCT6116_ID		0xd280
-#define SIO_NCT6775_ID		0xb470
-#define SIO_NCT6776_ID		0xc330
-#define SIO_NCT6779_ID		0xc560
-#define SIO_NCT6791_ID		0xc800
-#define SIO_NCT6792_ID		0xc910
-#define SIO_NCT6793_ID		0xd120
-#define SIO_NCT6795_ID		0xd350
-#define SIO_NCT6796_ID		0xd420
-#define SIO_NCT6797_ID		0xd450
-#define SIO_NCT6798_ID		0xd428
-#define SIO_ID_MASK		0xFFF8
-
-enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
-enum sensor_access { access_direct, access_asuswmi };
-
-struct nct6775_sio_data {
-	int sioreg;
-	int ld;
-	enum kinds kind;
-	enum sensor_access access;
-
-	/* superio_() callbacks  */
-	void (*sio_outb)(struct nct6775_sio_data *sio_data, int reg, int val);
-	int (*sio_inb)(struct nct6775_sio_data *sio_data, int reg);
-	void (*sio_select)(struct nct6775_sio_data *sio_data, int ld);
-	int (*sio_enter)(struct nct6775_sio_data *sio_data);
-	void (*sio_exit)(struct nct6775_sio_data *sio_data);
-};
-
-#define ASUSWMI_MONITORING_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
-#define ASUSWMI_METHODID_RSIO		0x5253494F
-#define ASUSWMI_METHODID_WSIO		0x5753494F
-#define ASUSWMI_METHODID_RHWM		0x5248574D
-#define ASUSWMI_METHODID_WHWM		0x5748574D
-#define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
-
-static int nct6775_asuswmi_evaluate_method(u32 method_id, u8 bank, u8 reg, u8 val, u32 *retval)
-{
-#if IS_ENABLED(CONFIG_ACPI_WMI)
-	u32 args = bank | (reg << 8) | (val << 16);
-	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	acpi_status status;
-	union acpi_object *obj;
-	u32 tmp = ASUSWMI_UNSUPPORTED_METHOD;
-
-	status = wmi_evaluate_method(ASUSWMI_MONITORING_GUID, 0,
-				     method_id, &input, &output);
-
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	obj = output.pointer;
-	if (obj && obj->type == ACPI_TYPE_INTEGER)
-		tmp = obj->integer.value;
-
-	if (retval)
-		*retval = tmp;
-
-	kfree(obj);
-
-	if (tmp == ASUSWMI_UNSUPPORTED_METHOD)
-		return -ENODEV;
-	return 0;
-#else
-	return -EOPNOTSUPP;
-#endif
-}
-
-static inline int nct6775_asuswmi_write(u8 bank, u8 reg, u8 val)
-{
-	return nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_WHWM, bank,
-					      reg, val, NULL);
-}
-
-static inline int nct6775_asuswmi_read(u8 bank, u8 reg, u8 *val)
-{
-	u32 ret, tmp = 0;
-
-	ret = nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_RHWM, bank,
-					      reg, 0, &tmp);
-	*val = tmp;
-	return ret;
-}
-
-static int superio_wmi_inb(struct nct6775_sio_data *sio_data, int reg)
-{
-	int tmp = 0;
-
-	nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_RSIO, sio_data->ld,
-					reg, 0, &tmp);
-	return tmp;
-}
-
-static void superio_wmi_outb(struct nct6775_sio_data *sio_data, int reg, int val)
-{
-	nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_WSIO, sio_data->ld,
-					reg, val, NULL);
-}
-
-static void superio_wmi_select(struct nct6775_sio_data *sio_data, int ld)
-{
-	sio_data->ld = ld;
-}
-
-static int superio_wmi_enter(struct nct6775_sio_data *sio_data)
-{
-	return 0;
-}
-
-static void superio_wmi_exit(struct nct6775_sio_data *sio_data)
-{
-}
-
-static void superio_outb(struct nct6775_sio_data *sio_data, int reg, int val)
-{
-	int ioreg = sio_data->sioreg;
-
-	outb(reg, ioreg);
-	outb(val, ioreg + 1);
-}
-
-static int superio_inb(struct nct6775_sio_data *sio_data, int reg)
-{
-	int ioreg = sio_data->sioreg;
-
-	outb(reg, ioreg);
-	return inb(ioreg + 1);
-}
-
-static void superio_select(struct nct6775_sio_data *sio_data, int ld)
-{
-	int ioreg = sio_data->sioreg;
-
-	outb(SIO_REG_LDSEL, ioreg);
-	outb(ld, ioreg + 1);
-}
-
-static int superio_enter(struct nct6775_sio_data *sio_data)
-{
-	int ioreg = sio_data->sioreg;
-
-	/*
-	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
-	 */
-	if (!request_muxed_region(ioreg, 2, DRVNAME))
-		return -EBUSY;
-
-	outb(0x87, ioreg);
-	outb(0x87, ioreg);
-
-	return 0;
-}
-
-static void superio_exit(struct nct6775_sio_data *sio_data)
-{
-	int ioreg = sio_data->sioreg;
-
-	outb(0xaa, ioreg);
-	outb(0x02, ioreg);
-	outb(0x02, ioreg + 1);
-	release_region(ioreg, 2);
-}
-
-/*
- * ISA constants
- */
-
-#define IOREGION_ALIGNMENT	(~7)
-#define IOREGION_OFFSET		5
-#define IOREGION_LENGTH		2
-#define ADDR_REG_OFFSET		0
-#define DATA_REG_OFFSET		1
-
-#define NCT6775_REG_BANK	0x4E
-#define NCT6775_REG_CONFIG	0x40
-#define NCT6775_PORT_CHIPID	0x58
-
-/*
- * Not currently used:
- * REG_MAN_ID has the value 0x5ca3 for all supported chips.
- * REG_CHIP_ID == 0x88/0xa1/0xc1 depending on chip model.
- * REG_MAN_ID is at port 0x4f
- * REG_CHIP_ID is at port 0x58
- */
-
-#define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
-#define NUM_TEMP_FIXED	6	/* Max number of fixed temp attribute sets */
-#define NUM_TSI_TEMP	8	/* Max number of TSI temp register pairs */
-
-#define NUM_REG_ALARM	7	/* Max number of alarm registers */
-#define NUM_REG_BEEP	5	/* Max number of beep registers */
-
-#define NUM_FAN		7
-
 /* Common and NCT6775 specific data */
 
 /* Voltage min/max registers for nr=7..14 are in bank 5 */
@@ -334,11 +93,6 @@ static const u16 NCT6775_REG_IN[] = {
 #define NCT6775_REG_DIODE		0x5E
 #define NCT6775_DIODE_MASK		0x02
 
-#define NCT6775_REG_FANDIV1		0x506
-#define NCT6775_REG_FANDIV2		0x507
-
-#define NCT6775_REG_CR_FAN_DEBOUNCE	0xf0
-
 static const u16 NCT6775_REG_ALARM[NUM_REG_ALARM] = { 0x459, 0x45A, 0x45B };
 
 /* 0..15 voltages, 16..23 fans, 24..29 temperatures, 30..31 intrusion */
@@ -352,10 +106,6 @@ static const s8 NCT6775_ALARM_BITS[] = {
 	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
 	12, -1 };			/* intrusion0, intrusion1 */
 
-#define FAN_ALARM_BASE		16
-#define TEMP_ALARM_BASE		24
-#define INTRUSION_ALARM_BASE	30
-
 static const u16 NCT6775_REG_BEEP[NUM_REG_BEEP] = { 0x56, 0x57, 0x453, 0x4e };
 
 /*
@@ -371,11 +121,6 @@ static const s8 NCT6775_BEEP_BITS[] = {
 	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
 	12, -1 };			/* intrusion0, intrusion1 */
 
-#define BEEP_ENABLE_BASE		15
-
-static const u8 NCT6775_REG_CR_CASEOPEN_CLR[] = { 0xe6, 0xee };
-static const u8 NCT6775_CR_CASEOPEN_CLR_MASK[] = { 0x20, 0x01 };
-
 /* DC or PWM output fan configuration */
 static const u8 NCT6775_REG_PWM_MODE[] = { 0x04, 0x04, 0x12 };
 static const u8 NCT6775_PWM_MODE_MASK[] = { 0x01, 0x02, 0x01 };
@@ -691,8 +436,6 @@ static const u16 NCT6779_REG_TEMP_CRIT[32] = {
 
 /* NCT6791 specific data */
 
-#define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
-
 static const u16 NCT6791_REG_WEIGHT_TEMP_SEL[NUM_FAN] = { 0, 0x239 };
 static const u16 NCT6791_REG_WEIGHT_TEMP_STEP[NUM_FAN] = { 0, 0x23a };
 static const u16 NCT6791_REG_WEIGHT_TEMP_STEP_TOL[NUM_FAN] = { 0, 0x23b };
@@ -1192,165 +935,6 @@ static inline unsigned int tsi_temp_from_reg(unsigned int reg)
  * Data structures and manipulation thereof
  */
 
-struct nct6775_data {
-	int addr;	/* IO base of hw monitor block */
-	struct nct6775_sio_data *sio_data;
-	enum kinds kind;
-	const char *name;
-
-	const struct attribute_group *groups[7];
-	u8 num_groups;
-
-	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
-				    * 3=temp_crit, 4=temp_lcrit
-				    */
-	u8 temp_src[NUM_TEMP];
-	u16 reg_temp_config[NUM_TEMP];
-	const char * const *temp_label;
-	u32 temp_mask;
-	u32 virt_temp_mask;
-
-	u16 REG_CONFIG;
-	u16 REG_VBAT;
-	u16 REG_DIODE;
-	u8 DIODE_MASK;
-
-	const s8 *ALARM_BITS;
-	const s8 *BEEP_BITS;
-
-	const u16 *REG_VIN;
-	const u16 *REG_IN_MINMAX[2];
-
-	const u16 *REG_TARGET;
-	const u16 *REG_FAN;
-	const u16 *REG_FAN_MODE;
-	const u16 *REG_FAN_MIN;
-	const u16 *REG_FAN_PULSES;
-	const u16 *FAN_PULSE_SHIFT;
-	const u16 *REG_FAN_TIME[3];
-
-	const u16 *REG_TOLERANCE_H;
-
-	const u8 *REG_PWM_MODE;
-	const u8 *PWM_MODE_MASK;
-
-	const u16 *REG_PWM[7];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
-				 * [3]=pwm_max, [4]=pwm_step,
-				 * [5]=weight_duty_step, [6]=weight_duty_base
-				 */
-	const u16 *REG_PWM_READ;
-
-	const u16 *REG_CRITICAL_PWM_ENABLE;
-	u8 CRITICAL_PWM_ENABLE_MASK;
-	const u16 *REG_CRITICAL_PWM;
-
-	const u16 *REG_AUTO_TEMP;
-	const u16 *REG_AUTO_PWM;
-
-	const u16 *REG_CRITICAL_TEMP;
-	const u16 *REG_CRITICAL_TEMP_TOLERANCE;
-
-	const u16 *REG_TEMP_SOURCE;	/* temp register sources */
-	const u16 *REG_TEMP_SEL;
-	const u16 *REG_WEIGHT_TEMP_SEL;
-	const u16 *REG_WEIGHT_TEMP[3];	/* 0=base, 1=tolerance, 2=step */
-
-	const u16 *REG_TEMP_OFFSET;
-
-	const u16 *REG_ALARM;
-	const u16 *REG_BEEP;
-
-	const u16 *REG_TSI_TEMP;
-
-	unsigned int (*fan_from_reg)(u16 reg, unsigned int divreg);
-	unsigned int (*fan_from_reg_min)(u16 reg, unsigned int divreg);
-
-	struct mutex update_lock;
-	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
-
-	/* Register values */
-	u8 bank;		/* current register bank */
-	u8 in_num;		/* number of in inputs we have */
-	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
-	unsigned int rpm[NUM_FAN];
-	u16 fan_min[NUM_FAN];
-	u8 fan_pulses[NUM_FAN];
-	u8 fan_div[NUM_FAN];
-	u8 has_pwm;
-	u8 has_fan;		/* some fan inputs can be disabled */
-	u8 has_fan_min;		/* some fans don't have min register */
-	bool has_fan_div;
-
-	u8 num_temp_alarms;	/* 2, 3, or 6 */
-	u8 num_temp_beeps;	/* 2, 3, or 6 */
-	u8 temp_fixed_num;	/* 3 or 6 */
-	u8 temp_type[NUM_TEMP_FIXED];
-	s8 temp_offset[NUM_TEMP_FIXED];
-	s16 temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
-				* 3=temp_crit, 4=temp_lcrit */
-	s16 tsi_temp[NUM_TSI_TEMP];
-	u64 alarms;
-	u64 beeps;
-
-	u8 pwm_num;	/* number of pwm */
-	u8 pwm_mode[NUM_FAN];	/* 0->DC variable voltage,
-				 * 1->PWM variable duty cycle
-				 */
-	enum pwm_enable pwm_enable[NUM_FAN];
-			/* 0->off
-			 * 1->manual
-			 * 2->thermal cruise mode (also called SmartFan I)
-			 * 3->fan speed cruise mode
-			 * 4->SmartFan III
-			 * 5->enhanced variable thermal cruise (SmartFan IV)
-			 */
-	u8 pwm[7][NUM_FAN];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
-				 * [3]=pwm_max, [4]=pwm_step,
-				 * [5]=weight_duty_step, [6]=weight_duty_base
-				 */
-
-	u8 target_temp[NUM_FAN];
-	u8 target_temp_mask;
-	u32 target_speed[NUM_FAN];
-	u32 target_speed_tolerance[NUM_FAN];
-	u8 speed_tolerance_limit;
-
-	u8 temp_tolerance[2][NUM_FAN];
-	u8 tolerance_mask;
-
-	u8 fan_time[3][NUM_FAN]; /* 0 = stop_time, 1 = step_up, 2 = step_down */
-
-	/* Automatic fan speed control registers */
-	int auto_pwm_num;
-	u8 auto_pwm[NUM_FAN][7];
-	u8 auto_temp[NUM_FAN][7];
-	u8 pwm_temp_sel[NUM_FAN];
-	u8 pwm_weight_temp_sel[NUM_FAN];
-	u8 weight_temp[3][NUM_FAN];	/* 0->temp_step, 1->temp_step_tol,
-					 * 2->temp_base
-					 */
-
-	u8 vid;
-	u8 vrm;
-
-	bool have_vid;
-
-	u16 have_temp;
-	u16 have_temp_fixed;
-	u16 have_tsi_temp;
-	u16 have_in;
-
-	/* Remember extra register values over suspend/resume */
-	u8 vbat;
-	u8 fandiv1;
-	u8 fandiv2;
-	u8 sio_reg_enable;
-
-	struct regmap *regmap;
-	bool read_only;
-};
-
 struct sensor_device_template {
 	struct device_attribute dev_attr;
 	union {
@@ -1406,21 +990,6 @@ struct sensor_template_group {
 	int base;
 };
 
-static inline umode_t nct6775_attr_mode(struct nct6775_data *data, struct attribute *attr)
-{
-	return data->read_only ? (attr->mode & ~0222) : attr->mode;
-}
-
-static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
-{
-	/* Need to leave a NULL terminator at the end of data->groups */
-	if (data->num_groups == ARRAY_SIZE(data->groups) - 1)
-		return -ENOBUFS;
-
-	data->groups[data->num_groups++] = group;
-	return 0;
-}
-
 static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_data *data,
 					   const struct sensor_template_group *tg, int repeat)
 {
@@ -1495,7 +1064,7 @@ static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_da
 	return nct6775_add_attr_group(data, group);
 }
 
-static bool is_word_sized(struct nct6775_data *data, u16 reg)
+bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
 {
 	switch (data->kind) {
 	case nct6106:
@@ -1552,122 +1121,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
 	}
 	return false;
 }
-
-static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
-{
-	u8 bank = reg >> 8;
-
-	data->bank = bank;
-}
-
-static int nct6775_wmi_reg_read(void *ctx, unsigned int reg, unsigned int *val)
-{
-	struct nct6775_data *data = ctx;
-	int err, word_sized = is_word_sized(data, reg);
-	u8 tmp = 0;
-	u16 res;
-
-	nct6775_wmi_set_bank(data, reg);
-
-	err = nct6775_asuswmi_read(data->bank, reg & 0xff, &tmp);
-	if (err)
-		return err;
-
-	res = tmp;
-	if (word_sized) {
-		err = nct6775_asuswmi_read(data->bank, (reg & 0xff) + 1, &tmp);
-		if (err)
-			return err;
-
-		res = (res << 8) + tmp;
-	}
-	*val = res;
-	return 0;
-}
-
-static inline int nct6775_read_value(struct nct6775_data *data, u16 reg, u16 *value)
-{
-	unsigned int tmp;
-	int ret = regmap_read(data->regmap, reg, &tmp);
-
-	if (!ret)
-		*value = tmp;
-	return ret;
-}
-
-static int nct6775_wmi_reg_write(void *ctx, unsigned int reg, unsigned int value)
-{
-	struct nct6775_data *data = ctx;
-	int res, word_sized = is_word_sized(data, reg);
-
-	nct6775_wmi_set_bank(data, reg);
-
-	if (word_sized) {
-		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value >> 8);
-		if (res)
-			return res;
-
-		res = nct6775_asuswmi_write(data->bank, (reg & 0xff) + 1, value);
-	} else {
-		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value);
-	}
-
-	return res;
-}
-
-static inline int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
-{
-	return regmap_write(data->regmap, reg, value);
-}
-
-/*
- * On older chips, only registers 0x50-0x5f are banked.
- * On more recent chips, all registers are banked.
- * Assume that is the case and set the bank number for each access.
- * Cache the bank number so it only needs to be set if it changes.
- */
-static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
-{
-	u8 bank = reg >> 8;
-
-	if (data->bank != bank) {
-		outb_p(NCT6775_REG_BANK, data->addr + ADDR_REG_OFFSET);
-		outb_p(bank, data->addr + DATA_REG_OFFSET);
-		data->bank = bank;
-	}
-}
-
-static int nct6775_reg_read(void *ctx, unsigned int reg, unsigned int *val)
-{
-	struct nct6775_data *data = ctx;
-	int word_sized = is_word_sized(data, reg);
-
-	nct6775_set_bank(data, reg);
-	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
-	*val = inb_p(data->addr + DATA_REG_OFFSET);
-	if (word_sized) {
-		outb_p((reg & 0xff) + 1,
-		       data->addr + ADDR_REG_OFFSET);
-		*val = (*val << 8) + inb_p(data->addr + DATA_REG_OFFSET);
-	}
-	return 0;
-}
-
-static int nct6775_reg_write(void *ctx, unsigned int reg, unsigned int value)
-{
-	struct nct6775_data *data = ctx;
-	int word_sized = is_word_sized(data, reg);
-
-	nct6775_set_bank(data, reg);
-	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
-	if (word_sized) {
-		outb_p(value >> 8, data->addr + DATA_REG_OFFSET);
-		outb_p((reg & 0xff) + 1,
-		       data->addr + ADDR_REG_OFFSET);
-	}
-	outb_p(value & 0xff, data->addr + DATA_REG_OFFSET);
-	return 0;
-}
+EXPORT_SYMBOL_GPL(nct6775_reg_is_word_sized);
 
 /* We left-align 8-bit temperature values to make the code simpler */
 static int nct6775_read_temp(struct nct6775_data *data, u16 reg, u16 *val)
@@ -1678,19 +1132,12 @@ static int nct6775_read_temp(struct nct6775_data *data, u16 reg, u16 *val)
 	if (err)
 		return err;
 
-	if (!is_word_sized(data, reg))
+	if (!nct6775_reg_is_word_sized(data, reg))
 		*val <<= 8;
 
 	return 0;
 }
 
-static int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value)
-{
-	if (!is_word_sized(data, reg))
-		value >>= 8;
-	return nct6775_write_value(data, reg, value);
-}
-
 /* This function assumes that the caller holds data->update_lock */
 static int nct6775_write_fan_div(struct nct6775_data *data, int nr)
 {
@@ -2207,8 +1654,8 @@ store_in_reg(struct device *dev, struct device_attribute *attr, const char *buf,
 	return err ? : count;
 }
 
-static ssize_t
-show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
+ssize_t
+nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct nct6775_data *data = nct6775_update_device(dev);
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
@@ -2221,6 +1668,7 @@ show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 	return sprintf(buf, "%u\n",
 		       (unsigned int)((data->alarms >> nr) & 0x01));
 }
+EXPORT_SYMBOL_GPL(nct6775_show_alarm);
 
 static int find_temp_source(struct nct6775_data *data, int index, int count)
 {
@@ -2263,8 +1711,8 @@ show_temp_alarm(struct device *dev, struct device_attribute *attr, char *buf)
 	return sprintf(buf, "%u\n", alarm);
 }
 
-static ssize_t
-show_beep(struct device *dev, struct device_attribute *attr, char *buf)
+ssize_t
+nct6775_show_beep(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
 	struct nct6775_data *data = nct6775_update_device(dev);
@@ -2278,10 +1726,10 @@ show_beep(struct device *dev, struct device_attribute *attr, char *buf)
 	return sprintf(buf, "%u\n",
 		       (unsigned int)((data->beeps >> nr) & 0x01));
 }
+EXPORT_SYMBOL_GPL(nct6775_show_beep);
 
-static ssize_t
-store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
-	   size_t count)
+ssize_t
+nct6775_store_beep(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct nct6775_data *data = dev_get_drvdata(dev);
@@ -2306,6 +1754,7 @@ store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
 	mutex_unlock(&data->update_lock);
 	return err ? : count;
 }
+EXPORT_SYMBOL_GPL(nct6775_store_beep);
 
 static ssize_t
 show_temp_beep(struct device *dev, struct device_attribute *attr, char *buf)
@@ -2381,9 +1830,8 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
 }
 
 SENSOR_TEMPLATE_2(in_input, "in%d_input", S_IRUGO, show_in_reg, NULL, 0, 0);
-SENSOR_TEMPLATE(in_alarm, "in%d_alarm", S_IRUGO, show_alarm, NULL, 0);
-SENSOR_TEMPLATE(in_beep, "in%d_beep", S_IWUSR | S_IRUGO, show_beep, store_beep,
-		0);
+SENSOR_TEMPLATE(in_alarm, "in%d_alarm", S_IRUGO, nct6775_show_alarm, NULL, 0);
+SENSOR_TEMPLATE(in_beep, "in%d_beep", S_IWUSR | S_IRUGO, nct6775_show_beep, nct6775_store_beep, 0);
 SENSOR_TEMPLATE_2(in_min, "in%d_min", S_IWUSR | S_IRUGO, show_in_reg,
 		  store_in_reg, 0, 1);
 SENSOR_TEMPLATE_2(in_max, "in%d_max", S_IWUSR | S_IRUGO, show_in_reg,
@@ -2617,10 +2065,10 @@ static umode_t nct6775_fan_is_visible(struct kobject *kobj,
 }
 
 SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
-SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", S_IRUGO, show_alarm, NULL,
+SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", S_IRUGO, nct6775_show_alarm, NULL,
 		FAN_ALARM_BASE);
-SENSOR_TEMPLATE(fan_beep, "fan%d_beep", S_IWUSR | S_IRUGO, show_beep,
-		store_beep, FAN_ALARM_BASE);
+SENSOR_TEMPLATE(fan_beep, "fan%d_beep", S_IWUSR | S_IRUGO, nct6775_show_beep,
+		nct6775_store_beep, FAN_ALARM_BASE);
 SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", S_IWUSR | S_IRUGO, show_fan_pulses,
 		store_fan_pulses, 0);
 SENSOR_TEMPLATE(fan_min, "fan%d_min", S_IWUSR | S_IRUGO, show_fan_min,
@@ -3884,113 +3332,6 @@ static const struct sensor_template_group nct6775_pwm_template_group = {
 	.base = 1,
 };
 
-static ssize_t
-cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
-}
-
-static DEVICE_ATTR_RO(cpu0_vid);
-
-/* Case open detection */
-
-static ssize_t
-clear_caseopen(struct device *dev, struct device_attribute *attr,
-	       const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct nct6775_sio_data *sio_data = data->sio_data;
-	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
-	unsigned long val;
-	u8 reg;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val) || val != 0)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-
-	/*
-	 * Use CR registers to clear caseopen status.
-	 * The CR registers are the same for all chips, and not all chips
-	 * support clearing the caseopen status through "regular" registers.
-	 */
-	ret = sio_data->sio_enter(sio_data);
-	if (ret) {
-		count = ret;
-		goto error;
-	}
-
-	sio_data->sio_select(sio_data, NCT6775_LD_ACPI);
-	reg = sio_data->sio_inb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
-	reg |= NCT6775_CR_CASEOPEN_CLR_MASK[nr];
-	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
-	reg &= ~NCT6775_CR_CASEOPEN_CLR_MASK[nr];
-	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
-	sio_data->sio_exit(sio_data);
-
-	data->valid = false;	/* Force cache refresh */
-error:
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, show_alarm,
-			  clear_caseopen, INTRUSION_ALARM_BASE);
-static SENSOR_DEVICE_ATTR(intrusion1_alarm, S_IWUSR | S_IRUGO, show_alarm,
-			  clear_caseopen, INTRUSION_ALARM_BASE + 1);
-static SENSOR_DEVICE_ATTR(intrusion0_beep, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, INTRUSION_ALARM_BASE);
-static SENSOR_DEVICE_ATTR(intrusion1_beep, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, INTRUSION_ALARM_BASE + 1);
-static SENSOR_DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, BEEP_ENABLE_BASE);
-
-static umode_t nct6775_other_is_visible(struct kobject *kobj,
-					struct attribute *attr, int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-
-	if (index == 0 && !data->have_vid)
-		return 0;
-
-	if (index == 1 || index == 2) {
-		if (data->ALARM_BITS[INTRUSION_ALARM_BASE + index - 1] < 0)
-			return 0;
-	}
-
-	if (index == 3 || index == 4) {
-		if (data->BEEP_BITS[INTRUSION_ALARM_BASE + index - 3] < 0)
-			return 0;
-	}
-
-	return nct6775_attr_mode(data, attr);
-}
-
-/*
- * nct6775_other_is_visible uses the index into the following array
- * to determine if attributes should be created or not.
- * Any change in order or content must be matched.
- */
-static struct attribute *nct6775_attributes_other[] = {
-	&dev_attr_cpu0_vid.attr,				/* 0 */
-	&sensor_dev_attr_intrusion0_alarm.dev_attr.attr,	/* 1 */
-	&sensor_dev_attr_intrusion1_alarm.dev_attr.attr,	/* 2 */
-	&sensor_dev_attr_intrusion0_beep.dev_attr.attr,		/* 3 */
-	&sensor_dev_attr_intrusion1_beep.dev_attr.attr,		/* 4 */
-	&sensor_dev_attr_beep_enable.dev_attr.attr,		/* 5 */
-
-	NULL
-};
-
-static const struct attribute_group nct6775_group_other = {
-	.attrs = nct6775_attributes_other,
-	.is_visible = nct6775_other_is_visible,
-};
-
 static inline int nct6775_init_device(struct nct6775_data *data)
 {
 	int i, err;
@@ -4051,227 +3392,6 @@ static inline int nct6775_init_device(struct nct6775_data *data)
 	return 0;
 }
 
-static void
-nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio_data)
-{
-	bool fan3pin = false, fan4pin = false, fan4min = false;
-	bool fan5pin = false, fan6pin = false, fan7pin = false;
-	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
-	bool pwm6pin = false, pwm7pin = false;
-
-	/* Store SIO_REG_ENABLE for use during resume */
-	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
-	data->sio_reg_enable = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
-
-	/* fan4 and fan5 share some pins with the GPIO and serial flash */
-	if (data->kind == nct6775) {
-		int cr2c = sio_data->sio_inb(sio_data, 0x2c);
-
-		fan3pin = cr2c & BIT(6);
-		pwm3pin = cr2c & BIT(7);
-
-		/* On NCT6775, fan4 shares pins with the fdc interface */
-		fan4pin = !(sio_data->sio_inb(sio_data, 0x2A) & 0x80);
-	} else if (data->kind == nct6776) {
-		bool gpok = sio_data->sio_inb(sio_data, 0x27) & 0x80;
-		const char *board_vendor, *board_name;
-
-		board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-		board_name = dmi_get_system_info(DMI_BOARD_NAME);
-
-		if (board_name && board_vendor &&
-		    !strcmp(board_vendor, "ASRock")) {
-			/*
-			 * Auxiliary fan monitoring is not enabled on ASRock
-			 * Z77 Pro4-M if booted in UEFI Ultra-FastBoot mode.
-			 * Observed with BIOS version 2.00.
-			 */
-			if (!strcmp(board_name, "Z77 Pro4-M")) {
-				if ((data->sio_reg_enable & 0xe0) != 0xe0) {
-					data->sio_reg_enable |= 0xe0;
-					sio_data->sio_outb(sio_data, SIO_REG_ENABLE,
-						     data->sio_reg_enable);
-				}
-			}
-		}
-
-		if (data->sio_reg_enable & 0x80)
-			fan3pin = gpok;
-		else
-			fan3pin = !(sio_data->sio_inb(sio_data, 0x24) & 0x40);
-
-		if (data->sio_reg_enable & 0x40)
-			fan4pin = gpok;
-		else
-			fan4pin = sio_data->sio_inb(sio_data, 0x1C) & 0x01;
-
-		if (data->sio_reg_enable & 0x20)
-			fan5pin = gpok;
-		else
-			fan5pin = sio_data->sio_inb(sio_data, 0x1C) & 0x02;
-
-		fan4min = fan4pin;
-		pwm3pin = fan3pin;
-	} else if (data->kind == nct6106) {
-		int cr24 = sio_data->sio_inb(sio_data, 0x24);
-
-		fan3pin = !(cr24 & 0x80);
-		pwm3pin = cr24 & 0x08;
-	} else if (data->kind == nct6116) {
-		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
-		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
-		int cr24 = sio_data->sio_inb(sio_data, 0x24);
-		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
-		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
-		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
-
-		fan3pin = !(cr2b & 0x10);
-		fan4pin = (cr2b & 0x80) ||			// pin 1(2)
-			(!(cr2f & 0x10) && (cr1a & 0x04));	// pin 65(66)
-		fan5pin = (cr2b & 0x80) ||			// pin 126(127)
-			(!(cr1b & 0x03) && (cr2a & 0x02));	// pin 94(96)
-
-		pwm3pin = fan3pin && (cr24 & 0x08);
-		pwm4pin = fan4pin;
-		pwm5pin = fan5pin;
-	} else {
-		/*
-		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
-		 * NCT6797D, NCT6798D
-		 */
-		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
-		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
-		int cr1c = sio_data->sio_inb(sio_data, 0x1c);
-		int cr1d = sio_data->sio_inb(sio_data, 0x1d);
-		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
-		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
-		int cr2d = sio_data->sio_inb(sio_data, 0x2d);
-		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
-		bool dsw_en = cr2f & BIT(3);
-		bool ddr4_en = cr2f & BIT(4);
-		int cre0;
-		int creb;
-		int cred;
-
-		sio_data->sio_select(sio_data, NCT6775_LD_12);
-		cre0 = sio_data->sio_inb(sio_data, 0xe0);
-		creb = sio_data->sio_inb(sio_data, 0xeb);
-		cred = sio_data->sio_inb(sio_data, 0xed);
-
-		fan3pin = !(cr1c & BIT(5));
-		fan4pin = !(cr1c & BIT(6));
-		fan5pin = !(cr1c & BIT(7));
-
-		pwm3pin = !(cr1c & BIT(0));
-		pwm4pin = !(cr1c & BIT(1));
-		pwm5pin = !(cr1c & BIT(2));
-
-		switch (data->kind) {
-		case nct6791:
-			fan6pin = cr2d & BIT(1);
-			pwm6pin = cr2d & BIT(0);
-			break;
-		case nct6792:
-			fan6pin = !dsw_en && (cr2d & BIT(1));
-			pwm6pin = !dsw_en && (cr2d & BIT(0));
-			break;
-		case nct6793:
-			fan5pin |= cr1b & BIT(5);
-			fan5pin |= creb & BIT(5);
-
-			fan6pin = !dsw_en && (cr2d & BIT(1));
-			fan6pin |= creb & BIT(3);
-
-			pwm5pin |= cr2d & BIT(7);
-			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
-
-			pwm6pin = !dsw_en && (cr2d & BIT(0));
-			pwm6pin |= creb & BIT(2);
-			break;
-		case nct6795:
-			fan5pin |= cr1b & BIT(5);
-			fan5pin |= creb & BIT(5);
-
-			fan6pin = (cr2a & BIT(4)) &&
-					(!dsw_en || (cred & BIT(4)));
-			fan6pin |= creb & BIT(3);
-
-			pwm5pin |= cr2d & BIT(7);
-			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
-
-			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
-			pwm6pin |= creb & BIT(2);
-			break;
-		case nct6796:
-			fan5pin |= cr1b & BIT(5);
-			fan5pin |= (cre0 & BIT(3)) && !(cr1b & BIT(0));
-			fan5pin |= creb & BIT(5);
-
-			fan6pin = (cr2a & BIT(4)) &&
-					(!dsw_en || (cred & BIT(4)));
-			fan6pin |= creb & BIT(3);
-
-			fan7pin = !(cr2b & BIT(2));
-
-			pwm5pin |= cr2d & BIT(7);
-			pwm5pin |= (cre0 & BIT(4)) && !(cr1b & BIT(0));
-			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
-
-			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
-			pwm6pin |= creb & BIT(2);
-
-			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
-			break;
-		case nct6797:
-			fan5pin |= !ddr4_en && (cr1b & BIT(5));
-			fan5pin |= creb & BIT(5);
-
-			fan6pin = cr2a & BIT(4);
-			fan6pin |= creb & BIT(3);
-
-			fan7pin = cr1a & BIT(1);
-
-			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
-			pwm5pin |= !ddr4_en && (cr2d & BIT(7));
-
-			pwm6pin = creb & BIT(2);
-			pwm6pin |= cred & BIT(2);
-
-			pwm7pin = cr1d & BIT(4);
-			break;
-		case nct6798:
-			fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
-			fan6pin |= cr2a & BIT(4);
-			fan6pin |= creb & BIT(5);
-
-			fan7pin = cr1b & BIT(5);
-			fan7pin |= !(cr2b & BIT(2));
-			fan7pin |= creb & BIT(3);
-
-			pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
-			pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
-			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
-
-			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
-			pwm7pin |= cr2d & BIT(7);
-			pwm7pin |= creb & BIT(2);
-			break;
-		default:	/* NCT6779D */
-			break;
-		}
-
-		fan4min = fan4pin;
-	}
-
-	/* fan 1 and 2 (0x03) are always present */
-	data->has_fan = 0x03 | (fan3pin << 2) | (fan4pin << 3) |
-		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
-	data->has_fan_min = 0x03 | (fan3pin << 2) | (fan4min << 3) |
-		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
-	data->has_pwm = 0x03 | (pwm3pin << 2) | (pwm4pin << 3) |
-		(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
-}
-
 static int add_temp_sensors(struct nct6775_data *data, const u16 *regp,
 			    int *available, int *mask)
 {
@@ -4303,26 +3423,9 @@ static int add_temp_sensors(struct nct6775_data *data, const u16 *regp,
 	return 0;
 }
 
-static const struct regmap_config nct6775_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 16,
-	.reg_read = nct6775_reg_read,
-	.reg_write = nct6775_reg_write,
-};
-
-static const struct regmap_config nct6775_wmi_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 16,
-	.reg_read = nct6775_wmi_reg_read,
-	.reg_write = nct6775_wmi_reg_write,
-};
-
-static int nct6775_probe(struct platform_device *pdev)
+int nct6775_probe(struct device *dev, struct nct6775_data *data,
+		  const struct regmap_config *regmapcfg)
 {
-	struct device *dev = &pdev->dev;
-	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
-	struct nct6775_data *data;
-	struct resource *res;
 	int i, s, err = 0;
 	int mask, available;
 	u16 src;
@@ -4330,32 +3433,8 @@ static int nct6775_probe(struct platform_device *pdev)
 	const u16 *reg_temp_mon, *reg_temp_alternate, *reg_temp_crit;
 	const u16 *reg_temp_crit_l = NULL, *reg_temp_crit_h = NULL;
 	int num_reg_temp, num_reg_temp_mon, num_reg_tsi_temp;
-	u8 cr2a;
 	struct device *hwmon_dev;
 	struct sensor_template_group tsi_temp_tg;
-	const struct regmap_config *regmapcfg;
-
-	if (sio_data->access == access_direct) {
-		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
-		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
-					 DRVNAME))
-			return -EBUSY;
-	}
-
-	data = devm_kzalloc(&pdev->dev, sizeof(struct nct6775_data),
-			    GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->kind = sio_data->kind;
-	data->sio_data = sio_data;
-
-	if (sio_data->access == access_direct) {
-		data->addr = res->start;
-		regmapcfg = &nct6775_regmap_config;
-	} else {
-		regmapcfg = &nct6775_wmi_regmap_config;
-	}
 
 	data->regmap = devm_regmap_init(dev, NULL, data, regmapcfg);
 	if (IS_ERR(data->regmap))
@@ -4364,7 +3443,6 @@ static int nct6775_probe(struct platform_device *pdev)
 	mutex_init(&data->update_lock);
 	data->name = nct6775_device_names[data->kind];
 	data->bank = 0xff;		/* Force initial bank selection */
-	platform_set_drvdata(pdev, data);
 
 	switch (data->kind) {
 	case nct6106:
@@ -5099,79 +4177,12 @@ static int nct6775_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	err = sio_data->sio_enter(sio_data);
-	if (err)
-		return err;
-
-	cr2a = sio_data->sio_inb(sio_data, 0x2a);
-	switch (data->kind) {
-	case nct6775:
-		data->have_vid = (cr2a & 0x40);
-		break;
-	case nct6776:
-		data->have_vid = (cr2a & 0x60) == 0x40;
-		break;
-	case nct6106:
-	case nct6116:
-	case nct6779:
-	case nct6791:
-	case nct6792:
-	case nct6793:
-	case nct6795:
-	case nct6796:
-	case nct6797:
-	case nct6798:
-		break;
-	}
-
-	/*
-	 * Read VID value
-	 * We can get the VID input values directly at logical device D 0xe3.
-	 */
-	if (data->have_vid) {
-		sio_data->sio_select(sio_data, NCT6775_LD_VID);
-		data->vid = sio_data->sio_inb(sio_data, 0xe3);
-		data->vrm = vid_which_vrm();
-	}
-
-	if (fan_debounce) {
-		u8 tmp;
-
-		sio_data->sio_select(sio_data, NCT6775_LD_HWM);
-		tmp = sio_data->sio_inb(sio_data,
-				    NCT6775_REG_CR_FAN_DEBOUNCE);
-		switch (data->kind) {
-		case nct6106:
-		case nct6116:
-			tmp |= 0xe0;
-			break;
-		case nct6775:
-			tmp |= 0x1e;
-			break;
-		case nct6776:
-		case nct6779:
-			tmp |= 0x3e;
-			break;
-		case nct6791:
-		case nct6792:
-		case nct6793:
-		case nct6795:
-		case nct6796:
-		case nct6797:
-		case nct6798:
-			tmp |= 0x7e;
-			break;
-		}
-		sio_data->sio_outb(sio_data, NCT6775_REG_CR_FAN_DEBOUNCE,
-			     tmp);
-		dev_info(&pdev->dev, "Enabled fan debounce for chip %s\n",
-			 data->name);
+	if (data->driver_init) {
+		err = data->driver_init(data);
+		if (err)
+			return err;
 	}
 
-	nct6775_check_fan_inputs(data, sio_data);
-
-	sio_data->sio_exit(sio_data);
-
 	/* Read fan clock dividers immediately */
 	err = nct6775_init_fan_common(dev, data);
 	if (err)
@@ -5208,430 +4219,12 @@ static int nct6775_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	err = nct6775_add_attr_group(data, &nct6775_group_other);
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev, data->name,
 							   data, data->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
-
-static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
-{
-	int val;
-
-	val = sio_data->sio_inb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
-	if (val & 0x10) {
-		pr_info("Enabling hardware monitor logical device mappings.\n");
-		sio_data->sio_outb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
-			       val & ~0x10);
-	}
-}
-
-static int __maybe_unused nct6775_suspend(struct device *dev)
-{
-	int err;
-	u16 tmp;
-	struct nct6775_data *data = nct6775_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	mutex_lock(&data->update_lock);
-	err = nct6775_read_value(data, data->REG_VBAT, &tmp);
-	if (err)
-		goto out;
-	data->vbat = tmp;
-	if (data->kind == nct6775) {
-		err = nct6775_read_value(data, NCT6775_REG_FANDIV1, &tmp);
-		if (err)
-			goto out;
-		data->fandiv1 = tmp;
-
-		err = nct6775_read_value(data, NCT6775_REG_FANDIV2, &tmp);
-		if (err)
-			goto out;
-		data->fandiv2 = tmp;
-	}
-out:
-	mutex_unlock(&data->update_lock);
-
-	return err;
-}
-
-static int __maybe_unused nct6775_resume(struct device *dev)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
-	int i, j, err = 0;
-	u8 reg;
-
-	mutex_lock(&data->update_lock);
-	data->bank = 0xff;		/* Force initial bank selection */
-
-	err = sio_data->sio_enter(sio_data);
-	if (err)
-		goto abort;
-
-	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
-	reg = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
-	if (reg != data->sio_reg_enable)
-		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, data->sio_reg_enable);
-
-	if (data->kind == nct6791 || data->kind == nct6792 ||
-	    data->kind == nct6793 || data->kind == nct6795 ||
-	    data->kind == nct6796 || data->kind == nct6797 ||
-	    data->kind == nct6798)
-		nct6791_enable_io_mapping(sio_data);
-
-	sio_data->sio_exit(sio_data);
-
-	/* Restore limits */
-	for (i = 0; i < data->in_num; i++) {
-		if (!(data->have_in & BIT(i)))
-			continue;
-
-		err = nct6775_write_value(data, data->REG_IN_MINMAX[0][i], data->in[i][1]);
-		if (err)
-			goto abort;
-		err = nct6775_write_value(data, data->REG_IN_MINMAX[1][i], data->in[i][2]);
-		if (err)
-			goto abort;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
-		if (!(data->has_fan_min & BIT(i)))
-			continue;
-
-		err = nct6775_write_value(data, data->REG_FAN_MIN[i], data->fan_min[i]);
-		if (err)
-			goto abort;
-	}
-
-	for (i = 0; i < NUM_TEMP; i++) {
-		if (!(data->have_temp & BIT(i)))
-			continue;
-
-		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
-			if (data->reg_temp[j][i]) {
-				err = nct6775_write_temp(data, data->reg_temp[j][i],
-							 data->temp[j][i]);
-				if (err)
-					goto abort;
-			}
-	}
-
-	/* Restore other settings */
-	err = nct6775_write_value(data, data->REG_VBAT, data->vbat);
-	if (err)
-		goto abort;
-	if (data->kind == nct6775) {
-		err = nct6775_write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
-		if (err)
-			goto abort;
-		err = nct6775_write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
-	}
-
-abort:
-	/* Force re-reading all values */
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
-
-	return err;
-}
-
-static SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
-
-static struct platform_driver nct6775_driver = {
-	.driver = {
-		.name	= DRVNAME,
-		.pm	= &nct6775_dev_pm_ops,
-	},
-	.probe		= nct6775_probe,
-};
-
-/* nct6775_find() looks for a '627 in the Super-I/O config space */
-static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
-{
-	u16 val;
-	int err;
-	int addr;
-
-	sio_data->access = access_direct;
-	sio_data->sioreg = sioaddr;
-
-	err = sio_data->sio_enter(sio_data);
-	if (err)
-		return err;
-
-	val = (sio_data->sio_inb(sio_data, SIO_REG_DEVID) << 8) |
-		sio_data->sio_inb(sio_data, SIO_REG_DEVID + 1);
-	if (force_id && val != 0xffff)
-		val = force_id;
-
-	switch (val & SIO_ID_MASK) {
-	case SIO_NCT6106_ID:
-		sio_data->kind = nct6106;
-		break;
-	case SIO_NCT6116_ID:
-		sio_data->kind = nct6116;
-		break;
-	case SIO_NCT6775_ID:
-		sio_data->kind = nct6775;
-		break;
-	case SIO_NCT6776_ID:
-		sio_data->kind = nct6776;
-		break;
-	case SIO_NCT6779_ID:
-		sio_data->kind = nct6779;
-		break;
-	case SIO_NCT6791_ID:
-		sio_data->kind = nct6791;
-		break;
-	case SIO_NCT6792_ID:
-		sio_data->kind = nct6792;
-		break;
-	case SIO_NCT6793_ID:
-		sio_data->kind = nct6793;
-		break;
-	case SIO_NCT6795_ID:
-		sio_data->kind = nct6795;
-		break;
-	case SIO_NCT6796_ID:
-		sio_data->kind = nct6796;
-		break;
-	case SIO_NCT6797_ID:
-		sio_data->kind = nct6797;
-		break;
-	case SIO_NCT6798_ID:
-		sio_data->kind = nct6798;
-		break;
-	default:
-		if (val != 0xffff)
-			pr_debug("unsupported chip ID: 0x%04x\n", val);
-		sio_data->sio_exit(sio_data);
-		return -ENODEV;
-	}
-
-	/* We have a known chip, find the HWM I/O address */
-	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
-	val = (sio_data->sio_inb(sio_data, SIO_REG_ADDR) << 8)
-	    | sio_data->sio_inb(sio_data, SIO_REG_ADDR + 1);
-	addr = val & IOREGION_ALIGNMENT;
-	if (addr == 0) {
-		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
-		sio_data->sio_exit(sio_data);
-		return -ENODEV;
-	}
-
-	/* Activate logical device if needed */
-	val = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
-	if (!(val & 0x01)) {
-		pr_warn("Forcibly enabling Super-I/O. Sensor is probably unusable.\n");
-		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, val | 0x01);
-	}
-
-	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
-	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
-	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
-	    sio_data->kind == nct6798)
-		nct6791_enable_io_mapping(sio_data);
-
-	sio_data->sio_exit(sio_data);
-	pr_info("Found %s or compatible chip at %#x:%#x\n",
-		nct6775_sio_names[sio_data->kind], sioaddr, addr);
-
-	return addr;
-}
-
-/*
- * when Super-I/O functions move to a separate file, the Super-I/O
- * bus will manage the lifetime of the device and this module will only keep
- * track of the nct6775 driver. But since we use platform_device_alloc(), we
- * must keep track of the device
- */
-static struct platform_device *pdev[2];
-
-static const char * const asus_wmi_boards[] = {
-	"ProArt X570-CREATOR WIFI",
-	"Pro B550M-C",
-	"Pro WS X570-ACE",
-	"PRIME B360-PLUS",
-	"PRIME B460-PLUS",
-	"PRIME B550-PLUS",
-	"PRIME B550M-A",
-	"PRIME B550M-A (WI-FI)",
-	"PRIME X570-P",
-	"PRIME X570-PRO",
-	"ROG CROSSHAIR VIII DARK HERO",
-	"ROG CROSSHAIR VIII FORMULA",
-	"ROG CROSSHAIR VIII HERO",
-	"ROG CROSSHAIR VIII IMPACT",
-	"ROG STRIX B550-A GAMING",
-	"ROG STRIX B550-E GAMING",
-	"ROG STRIX B550-F GAMING",
-	"ROG STRIX B550-F GAMING (WI-FI)",
-	"ROG STRIX B550-F GAMING WIFI II",
-	"ROG STRIX B550-I GAMING",
-	"ROG STRIX B550-XE GAMING (WI-FI)",
-	"ROG STRIX X570-E GAMING",
-	"ROG STRIX X570-F GAMING",
-	"ROG STRIX X570-I GAMING",
-	"ROG STRIX Z390-E GAMING",
-	"ROG STRIX Z390-F GAMING",
-	"ROG STRIX Z390-H GAMING",
-	"ROG STRIX Z390-I GAMING",
-	"ROG STRIX Z490-A GAMING",
-	"ROG STRIX Z490-E GAMING",
-	"ROG STRIX Z490-F GAMING",
-	"ROG STRIX Z490-G GAMING",
-	"ROG STRIX Z490-G GAMING (WI-FI)",
-	"ROG STRIX Z490-H GAMING",
-	"ROG STRIX Z490-I GAMING",
-	"TUF GAMING B550M-PLUS",
-	"TUF GAMING B550M-PLUS (WI-FI)",
-	"TUF GAMING B550-PLUS",
-	"TUF GAMING B550-PRO",
-	"TUF GAMING X570-PLUS",
-	"TUF GAMING X570-PLUS (WI-FI)",
-	"TUF GAMING X570-PRO (WI-FI)",
-	"TUF GAMING Z490-PLUS",
-	"TUF GAMING Z490-PLUS (WI-FI)",
-};
-
-static int __init sensors_nct6775_init(void)
-{
-	int i, err;
-	bool found = false;
-	int address;
-	struct resource res;
-	struct nct6775_sio_data sio_data;
-	int sioaddr[2] = { 0x2e, 0x4e };
-	enum sensor_access access = access_direct;
-	const char *board_vendor, *board_name;
-	u8 tmp;
-
-	err = platform_driver_register(&nct6775_driver);
-	if (err)
-		return err;
-
-	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-	board_name = dmi_get_system_info(DMI_BOARD_NAME);
-
-	if (board_name && board_vendor &&
-	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC.")) {
-		err = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
-				   board_name);
-		if (err >= 0) {
-			/* if reading chip id via WMI succeeds, use WMI */
-			if (!nct6775_asuswmi_read(0, NCT6775_PORT_CHIPID, &tmp) && tmp) {
-				pr_info("Using Asus WMI to access %#x chip.\n", tmp);
-				access = access_asuswmi;
-			} else {
-				pr_err("Can't read ChipID by Asus WMI.\n");
-			}
-		}
-	}
-
-	/*
-	 * initialize sio_data->kind and sio_data->sioreg.
-	 *
-	 * when Super-I/O functions move to a separate file, the Super-I/O
-	 * driver will probe 0x2e and 0x4e and auto-detect the presence of a
-	 * nct6775 hardware monitor, and call probe()
-	 */
-	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
-		sio_data.sio_outb = superio_outb;
-		sio_data.sio_inb = superio_inb;
-		sio_data.sio_select = superio_select;
-		sio_data.sio_enter = superio_enter;
-		sio_data.sio_exit = superio_exit;
-
-		address = nct6775_find(sioaddr[i], &sio_data);
-		if (address <= 0)
-			continue;
-
-		found = true;
-
-		sio_data.access = access;
-
-		if (access == access_asuswmi) {
-			sio_data.sio_outb = superio_wmi_outb;
-			sio_data.sio_inb = superio_wmi_inb;
-			sio_data.sio_select = superio_wmi_select;
-			sio_data.sio_enter = superio_wmi_enter;
-			sio_data.sio_exit = superio_wmi_exit;
-		}
-
-		pdev[i] = platform_device_alloc(DRVNAME, address);
-		if (!pdev[i]) {
-			err = -ENOMEM;
-			goto exit_device_unregister;
-		}
-
-		err = platform_device_add_data(pdev[i], &sio_data,
-					       sizeof(struct nct6775_sio_data));
-		if (err)
-			goto exit_device_put;
-
-		if (sio_data.access == access_direct) {
-			memset(&res, 0, sizeof(res));
-			res.name = DRVNAME;
-			res.start = address + IOREGION_OFFSET;
-			res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
-			res.flags = IORESOURCE_IO;
-
-			err = acpi_check_resource_conflict(&res);
-			if (err) {
-				platform_device_put(pdev[i]);
-				pdev[i] = NULL;
-				continue;
-			}
-
-			err = platform_device_add_resources(pdev[i], &res, 1);
-			if (err)
-				goto exit_device_put;
-		}
-
-		/* platform_device_add calls probe() */
-		err = platform_device_add(pdev[i]);
-		if (err)
-			goto exit_device_put;
-	}
-	if (!found) {
-		err = -ENODEV;
-		goto exit_unregister;
-	}
-
-	return 0;
-
-exit_device_put:
-	platform_device_put(pdev[i]);
-exit_device_unregister:
-	while (--i >= 0) {
-		if (pdev[i])
-			platform_device_unregister(pdev[i]);
-	}
-exit_unregister:
-	platform_driver_unregister(&nct6775_driver);
-	return err;
-}
-
-static void __exit sensors_nct6775_exit(void)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
-		if (pdev[i])
-			platform_device_unregister(pdev[i]);
-	}
-	platform_driver_unregister(&nct6775_driver);
-}
+EXPORT_SYMBOL_GPL(nct6775_probe);
 
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-MODULE_DESCRIPTION("Driver for NCT6775F and compatible chips");
+MODULE_DESCRIPTION("Core driver for NCT6775F and compatible chips");
 MODULE_LICENSE("GPL");
-
-module_init(sensors_nct6775_init);
-module_exit(sensors_nct6775_exit);
diff --git a/drivers/hwmon/nct6775-core.h b/drivers/hwmon/nct6775-core.h
new file mode 100644
index 000000000000..452a80bf0b86
--- /dev/null
+++ b/drivers/hwmon/nct6775-core.h
@@ -0,0 +1,252 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __HWMON_NCT6775_H__
+#define __HWMON_NCT6775_H__
+
+#include <linux/types.h>
+
+enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
+	     nct6793, nct6795, nct6796, nct6797, nct6798 };
+enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
+
+#define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
+#define NUM_TEMP_FIXED	6	/* Max number of fixed temp attribute sets */
+#define NUM_TSI_TEMP	8	/* Max number of TSI temp register pairs */
+
+#define NUM_REG_ALARM	7	/* Max number of alarm registers */
+#define NUM_REG_BEEP	5	/* Max number of beep registers */
+
+#define NUM_FAN		7
+
+struct nct6775_data {
+	int addr;	/* IO base of hw monitor block */
+	int sioreg;	/* SIO register address */
+	enum kinds kind;
+	const char *name;
+
+	const struct attribute_group *groups[7];
+	u8 num_groups;
+
+	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
+				    * 3=temp_crit, 4=temp_lcrit
+				    */
+	u8 temp_src[NUM_TEMP];
+	u16 reg_temp_config[NUM_TEMP];
+	const char * const *temp_label;
+	u32 temp_mask;
+	u32 virt_temp_mask;
+
+	u16 REG_CONFIG;
+	u16 REG_VBAT;
+	u16 REG_DIODE;
+	u8 DIODE_MASK;
+
+	const s8 *ALARM_BITS;
+	const s8 *BEEP_BITS;
+
+	const u16 *REG_VIN;
+	const u16 *REG_IN_MINMAX[2];
+
+	const u16 *REG_TARGET;
+	const u16 *REG_FAN;
+	const u16 *REG_FAN_MODE;
+	const u16 *REG_FAN_MIN;
+	const u16 *REG_FAN_PULSES;
+	const u16 *FAN_PULSE_SHIFT;
+	const u16 *REG_FAN_TIME[3];
+
+	const u16 *REG_TOLERANCE_H;
+
+	const u8 *REG_PWM_MODE;
+	const u8 *PWM_MODE_MASK;
+
+	const u16 *REG_PWM[7];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
+				 * [3]=pwm_max, [4]=pwm_step,
+				 * [5]=weight_duty_step, [6]=weight_duty_base
+				 */
+	const u16 *REG_PWM_READ;
+
+	const u16 *REG_CRITICAL_PWM_ENABLE;
+	u8 CRITICAL_PWM_ENABLE_MASK;
+	const u16 *REG_CRITICAL_PWM;
+
+	const u16 *REG_AUTO_TEMP;
+	const u16 *REG_AUTO_PWM;
+
+	const u16 *REG_CRITICAL_TEMP;
+	const u16 *REG_CRITICAL_TEMP_TOLERANCE;
+
+	const u16 *REG_TEMP_SOURCE;	/* temp register sources */
+	const u16 *REG_TEMP_SEL;
+	const u16 *REG_WEIGHT_TEMP_SEL;
+	const u16 *REG_WEIGHT_TEMP[3];	/* 0=base, 1=tolerance, 2=step */
+
+	const u16 *REG_TEMP_OFFSET;
+
+	const u16 *REG_ALARM;
+	const u16 *REG_BEEP;
+
+	const u16 *REG_TSI_TEMP;
+
+	unsigned int (*fan_from_reg)(u16 reg, unsigned int divreg);
+	unsigned int (*fan_from_reg_min)(u16 reg, unsigned int divreg);
+
+	struct mutex update_lock;
+	bool valid;		/* true if following fields are valid */
+	unsigned long last_updated;	/* In jiffies */
+
+	/* Register values */
+	u8 bank;		/* current register bank */
+	u8 in_num;		/* number of in inputs we have */
+	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
+	unsigned int rpm[NUM_FAN];
+	u16 fan_min[NUM_FAN];
+	u8 fan_pulses[NUM_FAN];
+	u8 fan_div[NUM_FAN];
+	u8 has_pwm;
+	u8 has_fan;		/* some fan inputs can be disabled */
+	u8 has_fan_min;		/* some fans don't have min register */
+	bool has_fan_div;
+
+	u8 num_temp_alarms;	/* 2, 3, or 6 */
+	u8 num_temp_beeps;	/* 2, 3, or 6 */
+	u8 temp_fixed_num;	/* 3 or 6 */
+	u8 temp_type[NUM_TEMP_FIXED];
+	s8 temp_offset[NUM_TEMP_FIXED];
+	s16 temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
+				* 3=temp_crit, 4=temp_lcrit */
+	s16 tsi_temp[NUM_TSI_TEMP];
+	u64 alarms;
+	u64 beeps;
+
+	u8 pwm_num;	/* number of pwm */
+	u8 pwm_mode[NUM_FAN];	/* 0->DC variable voltage,
+				 * 1->PWM variable duty cycle
+				 */
+	enum pwm_enable pwm_enable[NUM_FAN];
+			/* 0->off
+			 * 1->manual
+			 * 2->thermal cruise mode (also called SmartFan I)
+			 * 3->fan speed cruise mode
+			 * 4->SmartFan III
+			 * 5->enhanced variable thermal cruise (SmartFan IV)
+			 */
+	u8 pwm[7][NUM_FAN];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
+				 * [3]=pwm_max, [4]=pwm_step,
+				 * [5]=weight_duty_step, [6]=weight_duty_base
+				 */
+
+	u8 target_temp[NUM_FAN];
+	u8 target_temp_mask;
+	u32 target_speed[NUM_FAN];
+	u32 target_speed_tolerance[NUM_FAN];
+	u8 speed_tolerance_limit;
+
+	u8 temp_tolerance[2][NUM_FAN];
+	u8 tolerance_mask;
+
+	u8 fan_time[3][NUM_FAN]; /* 0 = stop_time, 1 = step_up, 2 = step_down */
+
+	/* Automatic fan speed control registers */
+	int auto_pwm_num;
+	u8 auto_pwm[NUM_FAN][7];
+	u8 auto_temp[NUM_FAN][7];
+	u8 pwm_temp_sel[NUM_FAN];
+	u8 pwm_weight_temp_sel[NUM_FAN];
+	u8 weight_temp[3][NUM_FAN];	/* 0->temp_step, 1->temp_step_tol,
+					 * 2->temp_base
+					 */
+
+	u8 vid;
+	u8 vrm;
+
+	bool have_vid;
+
+	u16 have_temp;
+	u16 have_temp_fixed;
+	u16 have_tsi_temp;
+	u16 have_in;
+
+	/* Remember extra register values over suspend/resume */
+	u8 vbat;
+	u8 fandiv1;
+	u8 fandiv2;
+	u8 sio_reg_enable;
+
+	struct regmap *regmap;
+	bool read_only;
+
+	/* driver-specific (platform, i2c) initialization hook and data */
+	int (*driver_init)(struct nct6775_data *data);
+	void *driver_data;
+};
+
+static inline int nct6775_read_value(struct nct6775_data *data, u16 reg, u16 *value)
+{
+	unsigned int tmp;
+	int ret = regmap_read(data->regmap, reg, &tmp);
+
+	if (!ret)
+		*value = tmp;
+	return ret;
+}
+
+static inline int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
+{
+	return regmap_write(data->regmap, reg, value);
+}
+
+bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg);
+int nct6775_probe(struct device *dev, struct nct6775_data *data,
+		  const struct regmap_config *regmapcfg);
+
+ssize_t nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf);
+ssize_t nct6775_show_beep(struct device *dev, struct device_attribute *attr, char *buf);
+ssize_t nct6775_store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
+			   size_t count);
+
+static inline int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value)
+{
+	if (!nct6775_reg_is_word_sized(data, reg))
+		value >>= 8;
+	return nct6775_write_value(data, reg, value);
+}
+
+static inline umode_t nct6775_attr_mode(struct nct6775_data *data, struct attribute *attr)
+{
+	return data->read_only ? (attr->mode & ~0222) : attr->mode;
+}
+
+
+static inline int
+nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
+{
+	/* Need to leave a NULL terminator at the end of data->groups */
+	if (data->num_groups == ARRAY_SIZE(data->groups) - 1)
+		return -ENOBUFS;
+
+	data->groups[data->num_groups++] = group;
+	return 0;
+}
+
+#define NCT6775_REG_BANK	0x4E
+#define NCT6775_REG_CONFIG	0x40
+
+#define NCT6775_REG_FANDIV1		0x506
+#define NCT6775_REG_FANDIV2		0x507
+
+#define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
+
+#define FAN_ALARM_BASE		16
+#define TEMP_ALARM_BASE		24
+#define INTRUSION_ALARM_BASE	30
+#define BEEP_ENABLE_BASE	15
+
+/*
+ * Not currently used:
+ * REG_MAN_ID has the value 0x5ca3 for all supported chips.
+ * REG_CHIP_ID == 0x88/0xa1/0xc1 depending on chip model.
+ * REG_MAN_ID is at port 0x4f
+ * REG_CHIP_ID is at port 0x58
+ */
+
+#endif /* __HWMON_NCT6775_H__ */
diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 5dafe3d24e07..f7c10456e574 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1,84 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * nct6775 - Driver for the hardware monitoring functionality of
- *	       Nuvoton NCT677x Super-I/O chips
+ * nct6775 - Platform driver for the hardware monitoring
+ *	     functionality of Nuvoton NCT677x Super-I/O chips
  *
  * Copyright (C) 2012  Guenter Roeck <linux@roeck-us.net>
- *
- * Derived from w83627ehf driver
- * Copyright (C) 2005-2012  Jean Delvare <jdelvare@suse.de>
- * Copyright (C) 2006  Yuan Mu (Winbond),
- *		       Rudolf Marek <r.marek@assembler.cz>
- *		       David Hubbard <david.c.hubbard@gmail.com>
- *		       Daniel J Blueman <daniel.blueman@gmail.com>
- * Copyright (C) 2010  Sheng-Yuan Huang (Nuvoton) (PS00)
- *
- * Shamelessly ripped from the w83627hf driver
- * Copyright (C) 2003  Mark Studebaker
- *
- * Supports the following chips:
- *
- * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
- * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
- * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
- * nct6775f     9      4       3       6+3    0xb470 0xc1    0x5ca3
- * nct6776f     9      5       3       6+3    0xc330 0xc1    0x5ca3
- * nct6779d    15      5       5       2+6    0xc560 0xc1    0x5ca3
- * nct6791d    15      6       6       2+6    0xc800 0xc1    0x5ca3
- * nct6792d    15      6       6       2+6    0xc910 0xc1    0x5ca3
- * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
- * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
- * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
- * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
- *                                           (0xd451)
- * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
- *                                           (0xd429)
- *
- * #temp lists the number of monitored temperature sources (first value) plus
- * the number of directly connectable temperature sensors (second value).
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/jiffies.h>
-#include <linux/platform_device.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/hwmon-vid.h>
-#include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/acpi.h>
-#include <linux/bitops.h>
 #include <linux/dmi.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon-vid.h>
+#include <linux/init.h>
 #include <linux/io.h>
-#include <linux/nospec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/wmi.h>
-#include "lm75.h"
-
-#define USE_ALTERNATE
-
-enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
-	     nct6793, nct6795, nct6796, nct6797, nct6798 };
-
-/* used to set data->name = nct6775_device_names[data->sio_kind] */
-static const char * const nct6775_device_names[] = {
-	"nct6106",
-	"nct6116",
-	"nct6775",
-	"nct6776",
-	"nct6779",
-	"nct6791",
-	"nct6792",
-	"nct6793",
-	"nct6795",
-	"nct6796",
-	"nct6797",
-	"nct6798",
-};
+
+#include "nct6775-core.h"
+
+enum sensor_access { access_direct, access_asuswmi };
 
 static const char * const nct6775_sio_names[] __initconst = {
 	"NCT6106D",
@@ -105,6 +48,18 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 
 #define DRVNAME "nct6775"
 
+#define NCT6775_PORT_CHIPID	0x58
+
+/*
+ * ISA constants
+ */
+
+#define IOREGION_ALIGNMENT	(~7)
+#define IOREGION_OFFSET		5
+#define IOREGION_LENGTH		2
+#define ADDR_REG_OFFSET		0
+#define DATA_REG_OFFSET		1
+
 /*
  * Super-I/O constants and functions
  */
@@ -133,8 +88,10 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_NCT6798_ID		0xd428
 #define SIO_ID_MASK		0xFFF8
 
-enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
-enum sensor_access { access_direct, access_asuswmi };
+/*
+ * Control registers
+ */
+#define NCT6775_REG_CR_FAN_DEBOUNCE	0xf0
 
 struct nct6775_sio_data {
 	int sioreg;
@@ -285,1274 +242,6 @@ static void superio_exit(struct nct6775_sio_data *sio_data)
 	release_region(ioreg, 2);
 }
 
-/*
- * ISA constants
- */
-
-#define IOREGION_ALIGNMENT	(~7)
-#define IOREGION_OFFSET		5
-#define IOREGION_LENGTH		2
-#define ADDR_REG_OFFSET		0
-#define DATA_REG_OFFSET		1
-
-#define NCT6775_REG_BANK	0x4E
-#define NCT6775_REG_CONFIG	0x40
-#define NCT6775_PORT_CHIPID	0x58
-
-/*
- * Not currently used:
- * REG_MAN_ID has the value 0x5ca3 for all supported chips.
- * REG_CHIP_ID == 0x88/0xa1/0xc1 depending on chip model.
- * REG_MAN_ID is at port 0x4f
- * REG_CHIP_ID is at port 0x58
- */
-
-#define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
-#define NUM_TEMP_FIXED	6	/* Max number of fixed temp attribute sets */
-#define NUM_TSI_TEMP	8	/* Max number of TSI temp register pairs */
-
-#define NUM_REG_ALARM	7	/* Max number of alarm registers */
-#define NUM_REG_BEEP	5	/* Max number of beep registers */
-
-#define NUM_FAN		7
-
-/* Common and NCT6775 specific data */
-
-/* Voltage min/max registers for nr=7..14 are in bank 5 */
-
-static const u16 NCT6775_REG_IN_MAX[] = {
-	0x2b, 0x2d, 0x2f, 0x31, 0x33, 0x35, 0x37, 0x554, 0x556, 0x558, 0x55a,
-	0x55c, 0x55e, 0x560, 0x562 };
-static const u16 NCT6775_REG_IN_MIN[] = {
-	0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x555, 0x557, 0x559, 0x55b,
-	0x55d, 0x55f, 0x561, 0x563 };
-static const u16 NCT6775_REG_IN[] = {
-	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x550, 0x551, 0x552
-};
-
-#define NCT6775_REG_VBAT		0x5D
-#define NCT6775_REG_DIODE		0x5E
-#define NCT6775_DIODE_MASK		0x02
-
-#define NCT6775_REG_FANDIV1		0x506
-#define NCT6775_REG_FANDIV2		0x507
-
-#define NCT6775_REG_CR_FAN_DEBOUNCE	0xf0
-
-static const u16 NCT6775_REG_ALARM[NUM_REG_ALARM] = { 0x459, 0x45A, 0x45B };
-
-/* 0..15 voltages, 16..23 fans, 24..29 temperatures, 30..31 intrusion */
-
-static const s8 NCT6775_ALARM_BITS[] = {
-	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
-	17, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
-	-1,				/* unused */
-	6, 7, 11, -1, -1,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
-	12, -1 };			/* intrusion0, intrusion1 */
-
-#define FAN_ALARM_BASE		16
-#define TEMP_ALARM_BASE		24
-#define INTRUSION_ALARM_BASE	30
-
-static const u16 NCT6775_REG_BEEP[NUM_REG_BEEP] = { 0x56, 0x57, 0x453, 0x4e };
-
-/*
- * 0..14 voltages, 15 global beep enable, 16..23 fans, 24..29 temperatures,
- * 30..31 intrusion
- */
-static const s8 NCT6775_BEEP_BITS[] = {
-	0, 1, 2, 3, 8, 9, 10, 16,	/* in0.. in7 */
-	17, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
-	21,				/* global beep enable */
-	6, 7, 11, 28, -1,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
-	12, -1 };			/* intrusion0, intrusion1 */
-
-#define BEEP_ENABLE_BASE		15
-
-static const u8 NCT6775_REG_CR_CASEOPEN_CLR[] = { 0xe6, 0xee };
-static const u8 NCT6775_CR_CASEOPEN_CLR_MASK[] = { 0x20, 0x01 };
-
-/* DC or PWM output fan configuration */
-static const u8 NCT6775_REG_PWM_MODE[] = { 0x04, 0x04, 0x12 };
-static const u8 NCT6775_PWM_MODE_MASK[] = { 0x01, 0x02, 0x01 };
-
-/* Advanced Fan control, some values are common for all fans */
-
-static const u16 NCT6775_REG_TARGET[] = {
-	0x101, 0x201, 0x301, 0x801, 0x901, 0xa01, 0xb01 };
-static const u16 NCT6775_REG_FAN_MODE[] = {
-	0x102, 0x202, 0x302, 0x802, 0x902, 0xa02, 0xb02 };
-static const u16 NCT6775_REG_FAN_STEP_DOWN_TIME[] = {
-	0x103, 0x203, 0x303, 0x803, 0x903, 0xa03, 0xb03 };
-static const u16 NCT6775_REG_FAN_STEP_UP_TIME[] = {
-	0x104, 0x204, 0x304, 0x804, 0x904, 0xa04, 0xb04 };
-static const u16 NCT6775_REG_FAN_STOP_OUTPUT[] = {
-	0x105, 0x205, 0x305, 0x805, 0x905, 0xa05, 0xb05 };
-static const u16 NCT6775_REG_FAN_START_OUTPUT[] = {
-	0x106, 0x206, 0x306, 0x806, 0x906, 0xa06, 0xb06 };
-static const u16 NCT6775_REG_FAN_MAX_OUTPUT[] = { 0x10a, 0x20a, 0x30a };
-static const u16 NCT6775_REG_FAN_STEP_OUTPUT[] = { 0x10b, 0x20b, 0x30b };
-
-static const u16 NCT6775_REG_FAN_STOP_TIME[] = {
-	0x107, 0x207, 0x307, 0x807, 0x907, 0xa07, 0xb07 };
-static const u16 NCT6775_REG_PWM[] = {
-	0x109, 0x209, 0x309, 0x809, 0x909, 0xa09, 0xb09 };
-static const u16 NCT6775_REG_PWM_READ[] = {
-	0x01, 0x03, 0x11, 0x13, 0x15, 0xa09, 0xb09 };
-
-static const u16 NCT6775_REG_FAN[] = { 0x630, 0x632, 0x634, 0x636, 0x638 };
-static const u16 NCT6775_REG_FAN_MIN[] = { 0x3b, 0x3c, 0x3d };
-static const u16 NCT6775_REG_FAN_PULSES[NUM_FAN] = {
-	0x641, 0x642, 0x643, 0x644 };
-static const u16 NCT6775_FAN_PULSE_SHIFT[NUM_FAN] = { };
-
-static const u16 NCT6775_REG_TEMP[] = {
-	0x27, 0x150, 0x250, 0x62b, 0x62c, 0x62d };
-
-static const u16 NCT6775_REG_TEMP_MON[] = { 0x73, 0x75, 0x77 };
-
-static const u16 NCT6775_REG_TEMP_CONFIG[ARRAY_SIZE(NCT6775_REG_TEMP)] = {
-	0, 0x152, 0x252, 0x628, 0x629, 0x62A };
-static const u16 NCT6775_REG_TEMP_HYST[ARRAY_SIZE(NCT6775_REG_TEMP)] = {
-	0x3a, 0x153, 0x253, 0x673, 0x678, 0x67D };
-static const u16 NCT6775_REG_TEMP_OVER[ARRAY_SIZE(NCT6775_REG_TEMP)] = {
-	0x39, 0x155, 0x255, 0x672, 0x677, 0x67C };
-
-static const u16 NCT6775_REG_TEMP_SOURCE[ARRAY_SIZE(NCT6775_REG_TEMP)] = {
-	0x621, 0x622, 0x623, 0x624, 0x625, 0x626 };
-
-static const u16 NCT6775_REG_TEMP_SEL[] = {
-	0x100, 0x200, 0x300, 0x800, 0x900, 0xa00, 0xb00 };
-
-static const u16 NCT6775_REG_WEIGHT_TEMP_SEL[] = {
-	0x139, 0x239, 0x339, 0x839, 0x939, 0xa39 };
-static const u16 NCT6775_REG_WEIGHT_TEMP_STEP[] = {
-	0x13a, 0x23a, 0x33a, 0x83a, 0x93a, 0xa3a };
-static const u16 NCT6775_REG_WEIGHT_TEMP_STEP_TOL[] = {
-	0x13b, 0x23b, 0x33b, 0x83b, 0x93b, 0xa3b };
-static const u16 NCT6775_REG_WEIGHT_DUTY_STEP[] = {
-	0x13c, 0x23c, 0x33c, 0x83c, 0x93c, 0xa3c };
-static const u16 NCT6775_REG_WEIGHT_TEMP_BASE[] = {
-	0x13d, 0x23d, 0x33d, 0x83d, 0x93d, 0xa3d };
-
-static const u16 NCT6775_REG_TEMP_OFFSET[] = { 0x454, 0x455, 0x456 };
-
-static const u16 NCT6775_REG_AUTO_TEMP[] = {
-	0x121, 0x221, 0x321, 0x821, 0x921, 0xa21, 0xb21 };
-static const u16 NCT6775_REG_AUTO_PWM[] = {
-	0x127, 0x227, 0x327, 0x827, 0x927, 0xa27, 0xb27 };
-
-#define NCT6775_AUTO_TEMP(data, nr, p)	((data)->REG_AUTO_TEMP[nr] + (p))
-#define NCT6775_AUTO_PWM(data, nr, p)	((data)->REG_AUTO_PWM[nr] + (p))
-
-static const u16 NCT6775_REG_CRITICAL_ENAB[] = { 0x134, 0x234, 0x334 };
-
-static const u16 NCT6775_REG_CRITICAL_TEMP[] = {
-	0x135, 0x235, 0x335, 0x835, 0x935, 0xa35, 0xb35 };
-static const u16 NCT6775_REG_CRITICAL_TEMP_TOLERANCE[] = {
-	0x138, 0x238, 0x338, 0x838, 0x938, 0xa38, 0xb38 };
-
-static const char *const nct6775_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN",
-	"AMD SB-TSI",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PECI Agent 2",
-	"PECI Agent 3",
-	"PECI Agent 4",
-	"PECI Agent 5",
-	"PECI Agent 6",
-	"PECI Agent 7",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP"
-};
-
-#define NCT6775_TEMP_MASK	0x001ffffe
-#define NCT6775_VIRT_TEMP_MASK	0x00000000
-
-static const u16 NCT6775_REG_TEMP_ALTERNATE[32] = {
-	[13] = 0x661,
-	[14] = 0x662,
-	[15] = 0x664,
-};
-
-static const u16 NCT6775_REG_TEMP_CRIT[32] = {
-	[4] = 0xa00,
-	[5] = 0xa01,
-	[6] = 0xa02,
-	[7] = 0xa03,
-	[8] = 0xa04,
-	[9] = 0xa05,
-	[10] = 0xa06,
-	[11] = 0xa07
-};
-
-static const u16 NCT6775_REG_TSI_TEMP[] = { 0x669 };
-
-/* NCT6776 specific data */
-
-/* STEP_UP_TIME and STEP_DOWN_TIME regs are swapped for all chips but NCT6775 */
-#define NCT6776_REG_FAN_STEP_UP_TIME NCT6775_REG_FAN_STEP_DOWN_TIME
-#define NCT6776_REG_FAN_STEP_DOWN_TIME NCT6775_REG_FAN_STEP_UP_TIME
-
-static const s8 NCT6776_ALARM_BITS[] = {
-	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
-	17, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
-	-1,				/* unused */
-	6, 7, 11, 10, 23,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
-	12, 9 };			/* intrusion0, intrusion1 */
-
-static const u16 NCT6776_REG_BEEP[NUM_REG_BEEP] = { 0xb2, 0xb3, 0xb4, 0xb5 };
-
-static const s8 NCT6776_BEEP_BITS[] = {
-	0, 1, 2, 3, 4, 5, 6, 7,		/* in0.. in7 */
-	8, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
-	24,				/* global beep enable */
-	25, 26, 27, 28, 29,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	16, 17, 18, 19, 20, 21,		/* temp1..temp6 */
-	30, 31 };			/* intrusion0, intrusion1 */
-
-static const u16 NCT6776_REG_TOLERANCE_H[] = {
-	0x10c, 0x20c, 0x30c, 0x80c, 0x90c, 0xa0c, 0xb0c };
-
-static const u8 NCT6776_REG_PWM_MODE[] = { 0x04, 0, 0, 0, 0, 0 };
-static const u8 NCT6776_PWM_MODE_MASK[] = { 0x01, 0, 0, 0, 0, 0 };
-
-static const u16 NCT6776_REG_FAN_MIN[] = {
-	0x63a, 0x63c, 0x63e, 0x640, 0x642, 0x64a, 0x64c };
-static const u16 NCT6776_REG_FAN_PULSES[NUM_FAN] = {
-	0x644, 0x645, 0x646, 0x647, 0x648, 0x649 };
-
-static const u16 NCT6776_REG_WEIGHT_DUTY_BASE[] = {
-	0x13e, 0x23e, 0x33e, 0x83e, 0x93e, 0xa3e };
-
-static const u16 NCT6776_REG_TEMP_CONFIG[ARRAY_SIZE(NCT6775_REG_TEMP)] = {
-	0x18, 0x152, 0x252, 0x628, 0x629, 0x62A };
-
-static const char *const nct6776_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"SMBUSMASTER 2",
-	"SMBUSMASTER 3",
-	"SMBUSMASTER 4",
-	"SMBUSMASTER 5",
-	"SMBUSMASTER 6",
-	"SMBUSMASTER 7",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
-	"BYTE_TEMP"
-};
-
-#define NCT6776_TEMP_MASK	0x007ffffe
-#define NCT6776_VIRT_TEMP_MASK	0x00000000
-
-static const u16 NCT6776_REG_TEMP_ALTERNATE[32] = {
-	[14] = 0x401,
-	[15] = 0x402,
-	[16] = 0x404,
-};
-
-static const u16 NCT6776_REG_TEMP_CRIT[32] = {
-	[11] = 0x709,
-	[12] = 0x70a,
-};
-
-static const u16 NCT6776_REG_TSI_TEMP[] = {
-	0x409, 0x40b, 0x40d, 0x40f, 0x411, 0x413, 0x415, 0x417 };
-
-/* NCT6779 specific data */
-
-static const u16 NCT6779_REG_IN[] = {
-	0x480, 0x481, 0x482, 0x483, 0x484, 0x485, 0x486, 0x487,
-	0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e };
-
-static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
-	0x459, 0x45A, 0x45B, 0x568 };
-
-static const s8 NCT6779_ALARM_BITS[] = {
-	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
-	17, 24, 25, 26, 27, 28, 29,	/* in8..in14 */
-	-1,				/* unused */
-	6, 7, 11, 10, 23,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
-	12, 9 };			/* intrusion0, intrusion1 */
-
-static const s8 NCT6779_BEEP_BITS[] = {
-	0, 1, 2, 3, 4, 5, 6, 7,		/* in0.. in7 */
-	8, 9, 10, 11, 12, 13, 14,	/* in8..in14 */
-	24,				/* global beep enable */
-	25, 26, 27, 28, 29,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	16, 17, -1, -1, -1, -1,		/* temp1..temp6 */
-	30, 31 };			/* intrusion0, intrusion1 */
-
-static const u16 NCT6779_REG_FAN[] = {
-	0x4c0, 0x4c2, 0x4c4, 0x4c6, 0x4c8, 0x4ca, 0x4ce };
-static const u16 NCT6779_REG_FAN_PULSES[NUM_FAN] = {
-	0x644, 0x645, 0x646, 0x647, 0x648, 0x649, 0x64f };
-
-static const u16 NCT6779_REG_CRITICAL_PWM_ENABLE[] = {
-	0x136, 0x236, 0x336, 0x836, 0x936, 0xa36, 0xb36 };
-#define NCT6779_CRITICAL_PWM_ENABLE_MASK	0x01
-static const u16 NCT6779_REG_CRITICAL_PWM[] = {
-	0x137, 0x237, 0x337, 0x837, 0x937, 0xa37, 0xb37 };
-
-static const u16 NCT6779_REG_TEMP[] = { 0x27, 0x150 };
-static const u16 NCT6779_REG_TEMP_MON[] = { 0x73, 0x75, 0x77, 0x79, 0x7b };
-static const u16 NCT6779_REG_TEMP_CONFIG[ARRAY_SIZE(NCT6779_REG_TEMP)] = {
-	0x18, 0x152 };
-static const u16 NCT6779_REG_TEMP_HYST[ARRAY_SIZE(NCT6779_REG_TEMP)] = {
-	0x3a, 0x153 };
-static const u16 NCT6779_REG_TEMP_OVER[ARRAY_SIZE(NCT6779_REG_TEMP)] = {
-	0x39, 0x155 };
-
-static const u16 NCT6779_REG_TEMP_OFFSET[] = {
-	0x454, 0x455, 0x456, 0x44a, 0x44b, 0x44c };
-
-static const char *const nct6779_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN0",
-	"AUXTIN1",
-	"AUXTIN2",
-	"AUXTIN3",
-	"",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"SMBUSMASTER 2",
-	"SMBUSMASTER 3",
-	"SMBUSMASTER 4",
-	"SMBUSMASTER 5",
-	"SMBUSMASTER 6",
-	"SMBUSMASTER 7",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
-	"BYTE_TEMP",
-	"",
-	"",
-	"",
-	"",
-	"Virtual_TEMP"
-};
-
-#define NCT6779_TEMP_MASK	0x07ffff7e
-#define NCT6779_VIRT_TEMP_MASK	0x00000000
-#define NCT6791_TEMP_MASK	0x87ffff7e
-#define NCT6791_VIRT_TEMP_MASK	0x80000000
-
-static const u16 NCT6779_REG_TEMP_ALTERNATE[32]
-	= { 0x490, 0x491, 0x492, 0x493, 0x494, 0x495, 0, 0,
-	    0, 0, 0, 0, 0, 0, 0, 0,
-	    0, 0x400, 0x401, 0x402, 0x404, 0x405, 0x406, 0x407,
-	    0x408, 0 };
-
-static const u16 NCT6779_REG_TEMP_CRIT[32] = {
-	[15] = 0x709,
-	[16] = 0x70a,
-};
-
-/* NCT6791 specific data */
-
-#define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
-
-static const u16 NCT6791_REG_WEIGHT_TEMP_SEL[NUM_FAN] = { 0, 0x239 };
-static const u16 NCT6791_REG_WEIGHT_TEMP_STEP[NUM_FAN] = { 0, 0x23a };
-static const u16 NCT6791_REG_WEIGHT_TEMP_STEP_TOL[NUM_FAN] = { 0, 0x23b };
-static const u16 NCT6791_REG_WEIGHT_DUTY_STEP[NUM_FAN] = { 0, 0x23c };
-static const u16 NCT6791_REG_WEIGHT_TEMP_BASE[NUM_FAN] = { 0, 0x23d };
-static const u16 NCT6791_REG_WEIGHT_DUTY_BASE[NUM_FAN] = { 0, 0x23e };
-
-static const u16 NCT6791_REG_ALARM[NUM_REG_ALARM] = {
-	0x459, 0x45A, 0x45B, 0x568, 0x45D };
-
-static const s8 NCT6791_ALARM_BITS[] = {
-	0, 1, 2, 3, 8, 21, 20, 16,	/* in0.. in7 */
-	17, 24, 25, 26, 27, 28, 29,	/* in8..in14 */
-	-1,				/* unused */
-	6, 7, 11, 10, 23, 33,		/* fan1..fan6 */
-	-1, -1,				/* unused */
-	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
-	12, 9 };			/* intrusion0, intrusion1 */
-
-/* NCT6792/NCT6793 specific data */
-
-static const u16 NCT6792_REG_TEMP_MON[] = {
-	0x73, 0x75, 0x77, 0x79, 0x7b, 0x7d };
-static const u16 NCT6792_REG_BEEP[NUM_REG_BEEP] = {
-	0xb2, 0xb3, 0xb4, 0xb5, 0xbf };
-
-static const char *const nct6792_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN0",
-	"AUXTIN1",
-	"AUXTIN2",
-	"AUXTIN3",
-	"",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"SMBUSMASTER 2",
-	"SMBUSMASTER 3",
-	"SMBUSMASTER 4",
-	"SMBUSMASTER 5",
-	"SMBUSMASTER 6",
-	"SMBUSMASTER 7",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"PCH_DIM0_TEMP",
-	"PCH_DIM1_TEMP",
-	"PCH_DIM2_TEMP",
-	"PCH_DIM3_TEMP",
-	"BYTE_TEMP",
-	"PECI Agent 0 Calibration",
-	"PECI Agent 1 Calibration",
-	"",
-	"",
-	"Virtual_TEMP"
-};
-
-#define NCT6792_TEMP_MASK	0x9fffff7e
-#define NCT6792_VIRT_TEMP_MASK	0x80000000
-
-static const char *const nct6793_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN0",
-	"AUXTIN1",
-	"AUXTIN2",
-	"AUXTIN3",
-	"",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"",
-	"",
-	"",
-	"",
-	"",
-	"",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"Agent0 Dimm0 ",
-	"Agent0 Dimm1",
-	"Agent1 Dimm0",
-	"Agent1 Dimm1",
-	"BYTE_TEMP0",
-	"BYTE_TEMP1",
-	"PECI Agent 0 Calibration",
-	"PECI Agent 1 Calibration",
-	"",
-	"Virtual_TEMP"
-};
-
-#define NCT6793_TEMP_MASK	0xbfff037e
-#define NCT6793_VIRT_TEMP_MASK	0x80000000
-
-static const char *const nct6795_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN0",
-	"AUXTIN1",
-	"AUXTIN2",
-	"AUXTIN3",
-	"",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"SMBUSMASTER 2",
-	"SMBUSMASTER 3",
-	"SMBUSMASTER 4",
-	"SMBUSMASTER 5",
-	"SMBUSMASTER 6",
-	"SMBUSMASTER 7",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"Agent0 Dimm0",
-	"Agent0 Dimm1",
-	"Agent1 Dimm0",
-	"Agent1 Dimm1",
-	"BYTE_TEMP0",
-	"BYTE_TEMP1",
-	"PECI Agent 0 Calibration",
-	"PECI Agent 1 Calibration",
-	"",
-	"Virtual_TEMP"
-};
-
-#define NCT6795_TEMP_MASK	0xbfffff7e
-#define NCT6795_VIRT_TEMP_MASK	0x80000000
-
-static const char *const nct6796_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN0",
-	"AUXTIN1",
-	"AUXTIN2",
-	"AUXTIN3",
-	"AUXTIN4",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"Virtual_TEMP",
-	"Virtual_TEMP",
-	"",
-	"",
-	"",
-	"",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"Agent0 Dimm0",
-	"Agent0 Dimm1",
-	"Agent1 Dimm0",
-	"Agent1 Dimm1",
-	"BYTE_TEMP0",
-	"BYTE_TEMP1",
-	"PECI Agent 0 Calibration",
-	"PECI Agent 1 Calibration",
-	"",
-	"Virtual_TEMP"
-};
-
-#define NCT6796_TEMP_MASK	0xbfff0ffe
-#define NCT6796_VIRT_TEMP_MASK	0x80000c00
-
-static const u16 NCT6796_REG_TSI_TEMP[] = { 0x409, 0x40b };
-
-static const char *const nct6798_temp_label[] = {
-	"",
-	"SYSTIN",
-	"CPUTIN",
-	"AUXTIN0",
-	"AUXTIN1",
-	"AUXTIN2",
-	"AUXTIN3",
-	"AUXTIN4",
-	"SMBUSMASTER 0",
-	"SMBUSMASTER 1",
-	"Virtual_TEMP",
-	"Virtual_TEMP",
-	"",
-	"",
-	"",
-	"",
-	"PECI Agent 0",
-	"PECI Agent 1",
-	"PCH_CHIP_CPU_MAX_TEMP",
-	"PCH_CHIP_TEMP",
-	"PCH_CPU_TEMP",
-	"PCH_MCH_TEMP",
-	"Agent0 Dimm0",
-	"Agent0 Dimm1",
-	"Agent1 Dimm0",
-	"Agent1 Dimm1",
-	"BYTE_TEMP0",
-	"BYTE_TEMP1",
-	"PECI Agent 0 Calibration",	/* undocumented */
-	"PECI Agent 1 Calibration",	/* undocumented */
-	"",
-	"Virtual_TEMP"
-};
-
-#define NCT6798_TEMP_MASK	0xbfff0ffe
-#define NCT6798_VIRT_TEMP_MASK	0x80000c00
-
-/* NCT6102D/NCT6106D specific data */
-
-#define NCT6106_REG_VBAT	0x318
-#define NCT6106_REG_DIODE	0x319
-#define NCT6106_DIODE_MASK	0x01
-
-static const u16 NCT6106_REG_IN_MAX[] = {
-	0x90, 0x92, 0x94, 0x96, 0x98, 0x9a, 0x9e, 0xa0, 0xa2 };
-static const u16 NCT6106_REG_IN_MIN[] = {
-	0x91, 0x93, 0x95, 0x97, 0x99, 0x9b, 0x9f, 0xa1, 0xa3 };
-static const u16 NCT6106_REG_IN[] = {
-	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x07, 0x08, 0x09 };
-
-static const u16 NCT6106_REG_TEMP[] = { 0x10, 0x11, 0x12, 0x13, 0x14, 0x15 };
-static const u16 NCT6106_REG_TEMP_MON[] = { 0x18, 0x19, 0x1a };
-static const u16 NCT6106_REG_TEMP_HYST[] = {
-	0xc3, 0xc7, 0xcb, 0xcf, 0xd3, 0xd7 };
-static const u16 NCT6106_REG_TEMP_OVER[] = {
-	0xc2, 0xc6, 0xca, 0xce, 0xd2, 0xd6 };
-static const u16 NCT6106_REG_TEMP_CRIT_L[] = {
-	0xc0, 0xc4, 0xc8, 0xcc, 0xd0, 0xd4 };
-static const u16 NCT6106_REG_TEMP_CRIT_H[] = {
-	0xc1, 0xc5, 0xc9, 0xcf, 0xd1, 0xd5 };
-static const u16 NCT6106_REG_TEMP_OFFSET[] = { 0x311, 0x312, 0x313 };
-static const u16 NCT6106_REG_TEMP_CONFIG[] = {
-	0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc };
-
-static const u16 NCT6106_REG_FAN[] = { 0x20, 0x22, 0x24 };
-static const u16 NCT6106_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4 };
-static const u16 NCT6106_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf6 };
-static const u16 NCT6106_FAN_PULSE_SHIFT[] = { 0, 2, 4 };
-
-static const u8 NCT6106_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3 };
-static const u8 NCT6106_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04 };
-static const u16 NCT6106_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c };
-static const u16 NCT6106_REG_FAN_MODE[] = { 0x113, 0x123, 0x133 };
-static const u16 NCT6106_REG_TEMP_SOURCE[] = {
-	0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
-
-static const u16 NCT6106_REG_CRITICAL_TEMP[] = { 0x11a, 0x12a, 0x13a };
-static const u16 NCT6106_REG_CRITICAL_TEMP_TOLERANCE[] = {
-	0x11b, 0x12b, 0x13b };
-
-static const u16 NCT6106_REG_CRITICAL_PWM_ENABLE[] = { 0x11c, 0x12c, 0x13c };
-#define NCT6106_CRITICAL_PWM_ENABLE_MASK	0x10
-static const u16 NCT6106_REG_CRITICAL_PWM[] = { 0x11d, 0x12d, 0x13d };
-
-static const u16 NCT6106_REG_FAN_STEP_UP_TIME[] = { 0x114, 0x124, 0x134 };
-static const u16 NCT6106_REG_FAN_STEP_DOWN_TIME[] = { 0x115, 0x125, 0x135 };
-static const u16 NCT6106_REG_FAN_STOP_OUTPUT[] = { 0x116, 0x126, 0x136 };
-static const u16 NCT6106_REG_FAN_START_OUTPUT[] = { 0x117, 0x127, 0x137 };
-static const u16 NCT6106_REG_FAN_STOP_TIME[] = { 0x118, 0x128, 0x138 };
-static const u16 NCT6106_REG_TOLERANCE_H[] = { 0x112, 0x122, 0x132 };
-
-static const u16 NCT6106_REG_TARGET[] = { 0x111, 0x121, 0x131 };
-
-static const u16 NCT6106_REG_WEIGHT_TEMP_SEL[] = { 0x168, 0x178, 0x188 };
-static const u16 NCT6106_REG_WEIGHT_TEMP_STEP[] = { 0x169, 0x179, 0x189 };
-static const u16 NCT6106_REG_WEIGHT_TEMP_STEP_TOL[] = { 0x16a, 0x17a, 0x18a };
-static const u16 NCT6106_REG_WEIGHT_DUTY_STEP[] = { 0x16b, 0x17b, 0x18b };
-static const u16 NCT6106_REG_WEIGHT_TEMP_BASE[] = { 0x16c, 0x17c, 0x18c };
-static const u16 NCT6106_REG_WEIGHT_DUTY_BASE[] = { 0x16d, 0x17d, 0x18d };
-
-static const u16 NCT6106_REG_AUTO_TEMP[] = { 0x160, 0x170, 0x180 };
-static const u16 NCT6106_REG_AUTO_PWM[] = { 0x164, 0x174, 0x184 };
-
-static const u16 NCT6106_REG_ALARM[NUM_REG_ALARM] = {
-	0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d };
-
-static const s8 NCT6106_ALARM_BITS[] = {
-	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
-	9, -1, -1, -1, -1, -1, -1,	/* in8..in14 */
-	-1,				/* unused */
-	32, 33, 34, -1, -1,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	16, 17, 18, 19, 20, 21,		/* temp1..temp6 */
-	48, -1				/* intrusion0, intrusion1 */
-};
-
-static const u16 NCT6106_REG_BEEP[NUM_REG_BEEP] = {
-	0x3c0, 0x3c1, 0x3c2, 0x3c3, 0x3c4 };
-
-static const s8 NCT6106_BEEP_BITS[] = {
-	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
-	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
-	32,				/* global beep enable */
-	24, 25, 26, 27, 28,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	16, 17, 18, 19, 20, 21,		/* temp1..temp6 */
-	34, -1				/* intrusion0, intrusion1 */
-};
-
-static const u16 NCT6106_REG_TEMP_ALTERNATE[32] = {
-	[14] = 0x51,
-	[15] = 0x52,
-	[16] = 0x54,
-};
-
-static const u16 NCT6106_REG_TEMP_CRIT[32] = {
-	[11] = 0x204,
-	[12] = 0x205,
-};
-
-static const u16 NCT6106_REG_TSI_TEMP[] = { 0x59, 0x5b, 0x5d, 0x5f, 0x61, 0x63, 0x65, 0x67 };
-
-/* NCT6112D/NCT6114D/NCT6116D specific data */
-
-static const u16 NCT6116_REG_FAN[] = { 0x20, 0x22, 0x24, 0x26, 0x28 };
-static const u16 NCT6116_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4, 0xe6, 0xe8 };
-static const u16 NCT6116_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf6, 0xf6, 0xf5 };
-static const u16 NCT6116_FAN_PULSE_SHIFT[] = { 0, 2, 4, 6, 6 };
-
-static const u16 NCT6116_REG_PWM[] = { 0x119, 0x129, 0x139, 0x199, 0x1a9 };
-static const u16 NCT6116_REG_FAN_MODE[] = { 0x113, 0x123, 0x133, 0x193, 0x1a3 };
-static const u16 NCT6116_REG_TEMP_SEL[] = { 0x110, 0x120, 0x130, 0x190, 0x1a0 };
-static const u16 NCT6116_REG_TEMP_SOURCE[] = {
-	0xb0, 0xb1, 0xb2 };
-
-static const u16 NCT6116_REG_CRITICAL_TEMP[] = {
-	0x11a, 0x12a, 0x13a, 0x19a, 0x1aa };
-static const u16 NCT6116_REG_CRITICAL_TEMP_TOLERANCE[] = {
-	0x11b, 0x12b, 0x13b, 0x19b, 0x1ab };
-
-static const u16 NCT6116_REG_CRITICAL_PWM_ENABLE[] = {
-	0x11c, 0x12c, 0x13c, 0x19c, 0x1ac };
-static const u16 NCT6116_REG_CRITICAL_PWM[] = {
-	0x11d, 0x12d, 0x13d, 0x19d, 0x1ad };
-
-static const u16 NCT6116_REG_FAN_STEP_UP_TIME[] = {
-	0x114, 0x124, 0x134, 0x194, 0x1a4 };
-static const u16 NCT6116_REG_FAN_STEP_DOWN_TIME[] = {
-	0x115, 0x125, 0x135, 0x195, 0x1a5 };
-static const u16 NCT6116_REG_FAN_STOP_OUTPUT[] = {
-	0x116, 0x126, 0x136, 0x196, 0x1a6 };
-static const u16 NCT6116_REG_FAN_START_OUTPUT[] = {
-	0x117, 0x127, 0x137, 0x197, 0x1a7 };
-static const u16 NCT6116_REG_FAN_STOP_TIME[] = {
-	0x118, 0x128, 0x138, 0x198, 0x1a8 };
-static const u16 NCT6116_REG_TOLERANCE_H[] = {
-	0x112, 0x122, 0x132, 0x192, 0x1a2 };
-
-static const u16 NCT6116_REG_TARGET[] = {
-	0x111, 0x121, 0x131, 0x191, 0x1a1 };
-
-static const u16 NCT6116_REG_AUTO_TEMP[] = {
-	0x160, 0x170, 0x180, 0x1d0, 0x1e0 };
-static const u16 NCT6116_REG_AUTO_PWM[] = {
-	0x164, 0x174, 0x184, 0x1d4, 0x1e4 };
-
-static const s8 NCT6116_ALARM_BITS[] = {
-	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
-	9, -1, -1, -1, -1, -1, -1,	/* in8..in9 */
-	-1,				/* unused */
-	32, 33, 34, 35, 36,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
-	48, -1				/* intrusion0, intrusion1 */
-};
-
-static const s8 NCT6116_BEEP_BITS[] = {
-	0, 1, 2, 3, 4, 5, 7, 8,		/* in0.. in7 */
-	9, 10, 11, 12, -1, -1, -1,	/* in8..in14 */
-	32,				/* global beep enable */
-	24, 25, 26, 27, 28,		/* fan1..fan5 */
-	-1, -1, -1,			/* unused */
-	16, 17, 18, -1, -1, -1,		/* temp1..temp6 */
-	34, -1				/* intrusion0, intrusion1 */
-};
-
-static const u16 NCT6116_REG_TSI_TEMP[] = { 0x59, 0x5b };
-
-static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
-{
-	if (mode == 0 && pwm == 255)
-		return off;
-	return mode + 1;
-}
-
-static int pwm_enable_to_reg(enum pwm_enable mode)
-{
-	if (mode == off)
-		return 0;
-	return mode - 1;
-}
-
-/*
- * Conversions
- */
-
-/* 1 is DC mode, output in ms */
-static unsigned int step_time_from_reg(u8 reg, u8 mode)
-{
-	return mode ? 400 * reg : 100 * reg;
-}
-
-static u8 step_time_to_reg(unsigned int msec, u8 mode)
-{
-	return clamp_val((mode ? (msec + 200) / 400 :
-					(msec + 50) / 100), 1, 255);
-}
-
-static unsigned int fan_from_reg8(u16 reg, unsigned int divreg)
-{
-	if (reg == 0 || reg == 255)
-		return 0;
-	return 1350000U / (reg << divreg);
-}
-
-static unsigned int fan_from_reg13(u16 reg, unsigned int divreg)
-{
-	if ((reg & 0xff1f) == 0xff1f)
-		return 0;
-
-	reg = (reg & 0x1f) | ((reg & 0xff00) >> 3);
-
-	if (reg == 0)
-		return 0;
-
-	return 1350000U / reg;
-}
-
-static unsigned int fan_from_reg16(u16 reg, unsigned int divreg)
-{
-	if (reg == 0 || reg == 0xffff)
-		return 0;
-
-	/*
-	 * Even though the registers are 16 bit wide, the fan divisor
-	 * still applies.
-	 */
-	return 1350000U / (reg << divreg);
-}
-
-static unsigned int fan_from_reg_rpm(u16 reg, unsigned int divreg)
-{
-	return reg;
-}
-
-static u16 fan_to_reg(u32 fan, unsigned int divreg)
-{
-	if (!fan)
-		return 0;
-
-	return (1350000U / fan) >> divreg;
-}
-
-static inline unsigned int
-div_from_reg(u8 reg)
-{
-	return BIT(reg);
-}
-
-/*
- * Some of the voltage inputs have internal scaling, the tables below
- * contain 8 (the ADC LSB in mV) * scaling factor * 100
- */
-static const u16 scale_in[15] = {
-	800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 800, 800, 800, 800,
-	800, 800
-};
-
-static inline long in_from_reg(u8 reg, u8 nr)
-{
-	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
-}
-
-static inline u8 in_to_reg(u32 val, u8 nr)
-{
-	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);
-}
-
-/* TSI temperatures are in 8.3 format */
-static inline unsigned int tsi_temp_from_reg(unsigned int reg)
-{
-	return (reg >> 5) * 125;
-}
-
-/*
- * Data structures and manipulation thereof
- */
-
-struct nct6775_data {
-	int addr;	/* IO base of hw monitor block */
-	struct nct6775_sio_data *sio_data;
-	enum kinds kind;
-	const char *name;
-
-	const struct attribute_group *groups[7];
-	u8 num_groups;
-
-	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
-				    * 3=temp_crit, 4=temp_lcrit
-				    */
-	u8 temp_src[NUM_TEMP];
-	u16 reg_temp_config[NUM_TEMP];
-	const char * const *temp_label;
-	u32 temp_mask;
-	u32 virt_temp_mask;
-
-	u16 REG_CONFIG;
-	u16 REG_VBAT;
-	u16 REG_DIODE;
-	u8 DIODE_MASK;
-
-	const s8 *ALARM_BITS;
-	const s8 *BEEP_BITS;
-
-	const u16 *REG_VIN;
-	const u16 *REG_IN_MINMAX[2];
-
-	const u16 *REG_TARGET;
-	const u16 *REG_FAN;
-	const u16 *REG_FAN_MODE;
-	const u16 *REG_FAN_MIN;
-	const u16 *REG_FAN_PULSES;
-	const u16 *FAN_PULSE_SHIFT;
-	const u16 *REG_FAN_TIME[3];
-
-	const u16 *REG_TOLERANCE_H;
-
-	const u8 *REG_PWM_MODE;
-	const u8 *PWM_MODE_MASK;
-
-	const u16 *REG_PWM[7];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
-				 * [3]=pwm_max, [4]=pwm_step,
-				 * [5]=weight_duty_step, [6]=weight_duty_base
-				 */
-	const u16 *REG_PWM_READ;
-
-	const u16 *REG_CRITICAL_PWM_ENABLE;
-	u8 CRITICAL_PWM_ENABLE_MASK;
-	const u16 *REG_CRITICAL_PWM;
-
-	const u16 *REG_AUTO_TEMP;
-	const u16 *REG_AUTO_PWM;
-
-	const u16 *REG_CRITICAL_TEMP;
-	const u16 *REG_CRITICAL_TEMP_TOLERANCE;
-
-	const u16 *REG_TEMP_SOURCE;	/* temp register sources */
-	const u16 *REG_TEMP_SEL;
-	const u16 *REG_WEIGHT_TEMP_SEL;
-	const u16 *REG_WEIGHT_TEMP[3];	/* 0=base, 1=tolerance, 2=step */
-
-	const u16 *REG_TEMP_OFFSET;
-
-	const u16 *REG_ALARM;
-	const u16 *REG_BEEP;
-
-	const u16 *REG_TSI_TEMP;
-
-	unsigned int (*fan_from_reg)(u16 reg, unsigned int divreg);
-	unsigned int (*fan_from_reg_min)(u16 reg, unsigned int divreg);
-
-	struct mutex update_lock;
-	bool valid;		/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
-
-	/* Register values */
-	u8 bank;		/* current register bank */
-	u8 in_num;		/* number of in inputs we have */
-	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
-	unsigned int rpm[NUM_FAN];
-	u16 fan_min[NUM_FAN];
-	u8 fan_pulses[NUM_FAN];
-	u8 fan_div[NUM_FAN];
-	u8 has_pwm;
-	u8 has_fan;		/* some fan inputs can be disabled */
-	u8 has_fan_min;		/* some fans don't have min register */
-	bool has_fan_div;
-
-	u8 num_temp_alarms;	/* 2, 3, or 6 */
-	u8 num_temp_beeps;	/* 2, 3, or 6 */
-	u8 temp_fixed_num;	/* 3 or 6 */
-	u8 temp_type[NUM_TEMP_FIXED];
-	s8 temp_offset[NUM_TEMP_FIXED];
-	s16 temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
-				* 3=temp_crit, 4=temp_lcrit */
-	s16 tsi_temp[NUM_TSI_TEMP];
-	u64 alarms;
-	u64 beeps;
-
-	u8 pwm_num;	/* number of pwm */
-	u8 pwm_mode[NUM_FAN];	/* 0->DC variable voltage,
-				 * 1->PWM variable duty cycle
-				 */
-	enum pwm_enable pwm_enable[NUM_FAN];
-			/* 0->off
-			 * 1->manual
-			 * 2->thermal cruise mode (also called SmartFan I)
-			 * 3->fan speed cruise mode
-			 * 4->SmartFan III
-			 * 5->enhanced variable thermal cruise (SmartFan IV)
-			 */
-	u8 pwm[7][NUM_FAN];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
-				 * [3]=pwm_max, [4]=pwm_step,
-				 * [5]=weight_duty_step, [6]=weight_duty_base
-				 */
-
-	u8 target_temp[NUM_FAN];
-	u8 target_temp_mask;
-	u32 target_speed[NUM_FAN];
-	u32 target_speed_tolerance[NUM_FAN];
-	u8 speed_tolerance_limit;
-
-	u8 temp_tolerance[2][NUM_FAN];
-	u8 tolerance_mask;
-
-	u8 fan_time[3][NUM_FAN]; /* 0 = stop_time, 1 = step_up, 2 = step_down */
-
-	/* Automatic fan speed control registers */
-	int auto_pwm_num;
-	u8 auto_pwm[NUM_FAN][7];
-	u8 auto_temp[NUM_FAN][7];
-	u8 pwm_temp_sel[NUM_FAN];
-	u8 pwm_weight_temp_sel[NUM_FAN];
-	u8 weight_temp[3][NUM_FAN];	/* 0->temp_step, 1->temp_step_tol,
-					 * 2->temp_base
-					 */
-
-	u8 vid;
-	u8 vrm;
-
-	bool have_vid;
-
-	u16 have_temp;
-	u16 have_temp_fixed;
-	u16 have_tsi_temp;
-	u16 have_in;
-
-	/* Remember extra register values over suspend/resume */
-	u8 vbat;
-	u8 fandiv1;
-	u8 fandiv2;
-	u8 sio_reg_enable;
-
-	struct regmap *regmap;
-	bool read_only;
-};
-
-struct sensor_device_template {
-	struct device_attribute dev_attr;
-	union {
-		struct {
-			u8 nr;
-			u8 index;
-		} s;
-		int index;
-	} u;
-	bool s2;	/* true if both index and nr are used */
-};
-
-struct sensor_device_attr_u {
-	union {
-		struct sensor_device_attribute a1;
-		struct sensor_device_attribute_2 a2;
-	} u;
-	char name[32];
-};
-
-#define __TEMPLATE_ATTR(_template, _mode, _show, _store) {	\
-	.attr = {.name = _template, .mode = _mode },		\
-	.show	= _show,					\
-	.store	= _store,					\
-}
-
-#define SENSOR_DEVICE_TEMPLATE(_template, _mode, _show, _store, _index)	\
-	{ .dev_attr = __TEMPLATE_ATTR(_template, _mode, _show, _store),	\
-	  .u.index = _index,						\
-	  .s2 = false }
-
-#define SENSOR_DEVICE_TEMPLATE_2(_template, _mode, _show, _store,	\
-				 _nr, _index)				\
-	{ .dev_attr = __TEMPLATE_ATTR(_template, _mode, _show, _store),	\
-	  .u.s.index = _index,						\
-	  .u.s.nr = _nr,						\
-	  .s2 = true }
-
-#define SENSOR_TEMPLATE(_name, _template, _mode, _show, _store, _index)	\
-static struct sensor_device_template sensor_dev_template_##_name	\
-	= SENSOR_DEVICE_TEMPLATE(_template, _mode, _show, _store,	\
-				 _index)
-
-#define SENSOR_TEMPLATE_2(_name, _template, _mode, _show, _store,	\
-			  _nr, _index)					\
-static struct sensor_device_template sensor_dev_template_##_name	\
-	= SENSOR_DEVICE_TEMPLATE_2(_template, _mode, _show, _store,	\
-				 _nr, _index)
-
-struct sensor_template_group {
-	struct sensor_device_template **templates;
-	umode_t (*is_visible)(struct kobject *, struct attribute *, int);
-	int base;
-};
-
-static inline umode_t nct6775_attr_mode(struct nct6775_data *data, struct attribute *attr)
-{
-	return data->read_only ? (attr->mode & ~0222) : attr->mode;
-}
-
-static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
-{
-	/* Need to leave a NULL terminator at the end of data->groups */
-	if (data->num_groups == ARRAY_SIZE(data->groups) - 1)
-		return -ENOBUFS;
-
-	data->groups[data->num_groups++] = group;
-	return 0;
-}
-
-static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_data *data,
-					   const struct sensor_template_group *tg, int repeat)
-{
-	struct attribute_group *group;
-	struct sensor_device_attr_u *su;
-	struct sensor_device_attribute *a;
-	struct sensor_device_attribute_2 *a2;
-	struct attribute **attrs;
-	struct sensor_device_template **t;
-	int i, count;
-
-	if (repeat <= 0)
-		return -EINVAL;
-
-	t = tg->templates;
-	for (count = 0; *t; t++, count++)
-		;
-
-	if (count == 0)
-		return -EINVAL;
-
-	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
-	if (group == NULL)
-		return -ENOMEM;
-
-	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
-			     GFP_KERNEL);
-	if (attrs == NULL)
-		return -ENOMEM;
-
-	su = devm_kzalloc(dev, array3_size(repeat, count, sizeof(*su)),
-			       GFP_KERNEL);
-	if (su == NULL)
-		return -ENOMEM;
-
-	group->attrs = attrs;
-	group->is_visible = tg->is_visible;
-
-	for (i = 0; i < repeat; i++) {
-		t = tg->templates;
-		while (*t != NULL) {
-			snprintf(su->name, sizeof(su->name),
-				 (*t)->dev_attr.attr.name, tg->base + i);
-			if ((*t)->s2) {
-				a2 = &su->u.a2;
-				sysfs_attr_init(&a2->dev_attr.attr);
-				a2->dev_attr.attr.name = su->name;
-				a2->nr = (*t)->u.s.nr + i;
-				a2->index = (*t)->u.s.index;
-				a2->dev_attr.attr.mode =
-				  (*t)->dev_attr.attr.mode;
-				a2->dev_attr.show = (*t)->dev_attr.show;
-				a2->dev_attr.store = (*t)->dev_attr.store;
-				*attrs = &a2->dev_attr.attr;
-			} else {
-				a = &su->u.a1;
-				sysfs_attr_init(&a->dev_attr.attr);
-				a->dev_attr.attr.name = su->name;
-				a->index = (*t)->u.index + i;
-				a->dev_attr.attr.mode =
-				  (*t)->dev_attr.attr.mode;
-				a->dev_attr.show = (*t)->dev_attr.show;
-				a->dev_attr.store = (*t)->dev_attr.store;
-				*attrs = &a->dev_attr.attr;
-			}
-			attrs++;
-			su++;
-			t++;
-		}
-	}
-
-	return nct6775_add_attr_group(data, group);
-}
-
-static bool is_word_sized(struct nct6775_data *data, u16 reg)
-{
-	switch (data->kind) {
-	case nct6106:
-		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
-		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
-		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
-		  reg == 0x111 || reg == 0x121 || reg == 0x131;
-	case nct6116:
-		return reg == 0x20 || reg == 0x22 || reg == 0x24 ||
-		  reg == 0x26 || reg == 0x28 || reg == 0x59 || reg == 0x5b ||
-		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 || reg == 0xe6 ||
-		  reg == 0xe8 || reg == 0x111 || reg == 0x121 || reg == 0x131 ||
-		  reg == 0x191 || reg == 0x1a1;
-	case nct6775:
-		return (((reg & 0xff00) == 0x100 ||
-		    (reg & 0xff00) == 0x200) &&
-		   ((reg & 0x00ff) == 0x50 ||
-		    (reg & 0x00ff) == 0x53 ||
-		    (reg & 0x00ff) == 0x55)) ||
-		  (reg & 0xfff0) == 0x630 ||
-		  reg == 0x640 || reg == 0x642 ||
-		  reg == 0x662 || reg == 0x669 ||
-		  ((reg & 0xfff0) == 0x650 && (reg & 0x000f) >= 0x06) ||
-		  reg == 0x73 || reg == 0x75 || reg == 0x77;
-	case nct6776:
-		return (((reg & 0xff00) == 0x100 ||
-		    (reg & 0xff00) == 0x200) &&
-		   ((reg & 0x00ff) == 0x50 ||
-		    (reg & 0x00ff) == 0x53 ||
-		    (reg & 0x00ff) == 0x55)) ||
-		  (reg & 0xfff0) == 0x630 ||
-		  reg == 0x402 ||
-		  (reg >= 0x409 && reg < 0x419 && (reg & 1)) ||
-		  reg == 0x640 || reg == 0x642 ||
-		  ((reg & 0xfff0) == 0x650 && (reg & 0x000f) >= 0x06) ||
-		  reg == 0x73 || reg == 0x75 || reg == 0x77;
-	case nct6779:
-	case nct6791:
-	case nct6792:
-	case nct6793:
-	case nct6795:
-	case nct6796:
-	case nct6797:
-	case nct6798:
-		return reg == 0x150 || reg == 0x153 || reg == 0x155 ||
-		  (reg & 0xfff0) == 0x4c0 ||
-		  reg == 0x402 ||
-		  (reg >= 0x409 && reg < 0x419 && (reg & 1)) ||
-		  reg == 0x63a || reg == 0x63c || reg == 0x63e ||
-		  reg == 0x640 || reg == 0x642 || reg == 0x64a ||
-		  reg == 0x64c ||
-		  reg == 0x73 || reg == 0x75 || reg == 0x77 || reg == 0x79 ||
-		  reg == 0x7b || reg == 0x7d;
-	}
-	return false;
-}
-
 static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
 {
 	u8 bank = reg >> 8;
@@ -1563,7 +252,7 @@ static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
 static int nct6775_wmi_reg_read(void *ctx, unsigned int reg, unsigned int *val)
 {
 	struct nct6775_data *data = ctx;
-	int err, word_sized = is_word_sized(data, reg);
+	int err, word_sized = nct6775_reg_is_word_sized(data, reg);
 	u8 tmp = 0;
 	u16 res;
 
@@ -1585,20 +274,10 @@ static int nct6775_wmi_reg_read(void *ctx, unsigned int reg, unsigned int *val)
 	return 0;
 }
 
-static inline int nct6775_read_value(struct nct6775_data *data, u16 reg, u16 *value)
-{
-	unsigned int tmp;
-	int ret = regmap_read(data->regmap, reg, &tmp);
-
-	if (!ret)
-		*value = tmp;
-	return ret;
-}
-
 static int nct6775_wmi_reg_write(void *ctx, unsigned int reg, unsigned int value)
 {
 	struct nct6775_data *data = ctx;
-	int res, word_sized = is_word_sized(data, reg);
+	int res, word_sized = nct6775_reg_is_word_sized(data, reg);
 
 	nct6775_wmi_set_bank(data, reg);
 
@@ -1615,11 +294,6 @@ static int nct6775_wmi_reg_write(void *ctx, unsigned int reg, unsigned int value
 	return res;
 }
 
-static inline int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
-{
-	return regmap_write(data->regmap, reg, value);
-}
-
 /*
  * On older chips, only registers 0x50-0x5f are banked.
  * On more recent chips, all registers are banked.
@@ -1640,7 +314,7 @@ static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
 static int nct6775_reg_read(void *ctx, unsigned int reg, unsigned int *val)
 {
 	struct nct6775_data *data = ctx;
-	int word_sized = is_word_sized(data, reg);
+	int word_sized = nct6775_reg_is_word_sized(data, reg);
 
 	nct6775_set_bank(data, reg);
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
@@ -1656,7 +330,7 @@ static int nct6775_reg_read(void *ctx, unsigned int reg, unsigned int *val)
 static int nct6775_reg_write(void *ctx, unsigned int reg, unsigned int value)
 {
 	struct nct6775_data *data = ctx;
-	int word_sized = is_word_sized(data, reg);
+	int word_sized = nct6775_reg_is_word_sized(data, reg);
 
 	nct6775_set_bank(data, reg);
 	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
@@ -1669,2388 +343,132 @@ static int nct6775_reg_write(void *ctx, unsigned int reg, unsigned int value)
 	return 0;
 }
 
-/* We left-align 8-bit temperature values to make the code simpler */
-static int nct6775_read_temp(struct nct6775_data *data, u16 reg, u16 *val)
+static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
 {
-	int err;
-
-	err = nct6775_read_value(data, reg, val);
-	if (err)
-		return err;
-
-	if (!is_word_sized(data, reg))
-		*val <<= 8;
+	int val;
 
-	return 0;
+	val = sio_data->sio_inb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
+	if (val & 0x10) {
+		pr_info("Enabling hardware monitor logical device mappings.\n");
+		sio_data->sio_outb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
+			       val & ~0x10);
+	}
 }
 
-static int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value)
-{
-	if (!is_word_sized(data, reg))
-		value >>= 8;
-	return nct6775_write_value(data, reg, value);
-}
-
-/* This function assumes that the caller holds data->update_lock */
-static int nct6775_write_fan_div(struct nct6775_data *data, int nr)
-{
-	u16 reg;
-	int err;
-	u16 fandiv_reg = nr < 2 ? NCT6775_REG_FANDIV1 : NCT6775_REG_FANDIV2;
-	unsigned int oddshift = (nr & 1) * 4; /* masks shift by four if nr is odd */
-
-	err = nct6775_read_value(data, fandiv_reg, &reg);
-	if (err)
-		return err;
-	reg &= 0x70 >> oddshift;
-	reg |= (data->fan_div[nr] & 0x7) << oddshift;
-	return nct6775_write_value(data, fandiv_reg, reg);
-}
-
-static int nct6775_write_fan_div_common(struct nct6775_data *data, int nr)
-{
-	if (data->kind == nct6775)
-		return nct6775_write_fan_div(data, nr);
-	return 0;
-}
-
-static int nct6775_update_fan_div(struct nct6775_data *data)
-{
-	int err;
-	u16 i;
-
-	err = nct6775_read_value(data, NCT6775_REG_FANDIV1, &i);
-	if (err)
-		return err;
-	data->fan_div[0] = i & 0x7;
-	data->fan_div[1] = (i & 0x70) >> 4;
-	err = nct6775_read_value(data, NCT6775_REG_FANDIV2, &i);
-	if (err)
-		return err;
-	data->fan_div[2] = i & 0x7;
-	if (data->has_fan & BIT(3))
-		data->fan_div[3] = (i & 0x70) >> 4;
-
-	return 0;
-}
-
-static int nct6775_update_fan_div_common(struct nct6775_data *data)
-{
-	if (data->kind == nct6775)
-		return nct6775_update_fan_div(data);
-	return 0;
-}
-
-static int nct6775_init_fan_div(struct nct6775_data *data)
-{
-	int i, err;
-
-	err = nct6775_update_fan_div_common(data);
-	if (err)
-		return err;
-
-	/*
-	 * For all fans, start with highest divider value if the divider
-	 * register is not initialized. This ensures that we get a
-	 * reading from the fan count register, even if it is not optimal.
-	 * We'll compute a better divider later on.
-	 */
-	for (i = 0; i < ARRAY_SIZE(data->fan_div); i++) {
-		if (!(data->has_fan & BIT(i)))
-			continue;
-		if (data->fan_div[i] == 0) {
-			data->fan_div[i] = 7;
-			err = nct6775_write_fan_div_common(data, i);
-			if (err)
-				return err;
-		}
-	}
-
-	return 0;
-}
-
-static int nct6775_init_fan_common(struct device *dev,
-				   struct nct6775_data *data)
-{
-	int i, err;
-	u16 reg;
-
-	if (data->has_fan_div) {
-		err = nct6775_init_fan_div(data);
-		if (err)
-			return err;
-	}
-
-	/*
-	 * If fan_min is not set (0), set it to 0xff to disable it. This
-	 * prevents the unnecessary warning when fanX_min is reported as 0.
-	 */
-	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
-		if (data->has_fan_min & BIT(i)) {
-			err = nct6775_read_value(data, data->REG_FAN_MIN[i], &reg);
-			if (err)
-				return err;
-			if (!reg) {
-				err = nct6775_write_value(data, data->REG_FAN_MIN[i],
-							  data->has_fan_div ? 0xff : 0xff1f);
-				if (err)
-					return err;
-			}
-		}
-	}
-
-	return 0;
-}
-
-static int nct6775_select_fan_div(struct device *dev,
-				  struct nct6775_data *data, int nr, u16 reg)
+static int __maybe_unused nct6775_suspend(struct device *dev)
 {
 	int err;
-	u8 fan_div = data->fan_div[nr];
-	u16 fan_min;
-
-	if (!data->has_fan_div)
-		return 0;
-
-	/*
-	 * If we failed to measure the fan speed, or the reported value is not
-	 * in the optimal range, and the clock divider can be modified,
-	 * let's try that for next time.
-	 */
-	if (reg == 0x00 && fan_div < 0x07)
-		fan_div++;
-	else if (reg != 0x00 && reg < 0x30 && fan_div > 0)
-		fan_div--;
-
-	if (fan_div != data->fan_div[nr]) {
-		dev_dbg(dev, "Modifying fan%d clock divider from %u to %u\n",
-			nr + 1, div_from_reg(data->fan_div[nr]),
-			div_from_reg(fan_div));
-
-		/* Preserve min limit if possible */
-		if (data->has_fan_min & BIT(nr)) {
-			fan_min = data->fan_min[nr];
-			if (fan_div > data->fan_div[nr]) {
-				if (fan_min != 255 && fan_min > 1)
-					fan_min >>= 1;
-			} else {
-				if (fan_min != 255) {
-					fan_min <<= 1;
-					if (fan_min > 254)
-						fan_min = 254;
-				}
-			}
-			if (fan_min != data->fan_min[nr]) {
-				data->fan_min[nr] = fan_min;
-				err = nct6775_write_value(data, data->REG_FAN_MIN[nr], fan_min);
-				if (err)
-					return err;
-			}
-		}
-		data->fan_div[nr] = fan_div;
-		err = nct6775_write_fan_div_common(data, nr);
-		if (err)
-			return err;
-	}
-
-	return 0;
-}
-
-static int nct6775_update_pwm(struct device *dev)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int i, j, err;
-	u16 fanmodecfg, reg;
-	bool duty_is_dc;
-
-	for (i = 0; i < data->pwm_num; i++) {
-		if (!(data->has_pwm & BIT(i)))
-			continue;
-
-		err = nct6775_read_value(data, data->REG_PWM_MODE[i], &reg);
-		if (err)
-			return err;
-		duty_is_dc = data->REG_PWM_MODE[i] && (reg & data->PWM_MODE_MASK[i]);
-		data->pwm_mode[i] = !duty_is_dc;
-
-		err = nct6775_read_value(data, data->REG_FAN_MODE[i], &fanmodecfg);
-		if (err)
-			return err;
-		for (j = 0; j < ARRAY_SIZE(data->REG_PWM); j++) {
-			if (data->REG_PWM[j] && data->REG_PWM[j][i]) {
-				err = nct6775_read_value(data, data->REG_PWM[j][i], &reg);
-				if (err)
-					return err;
-				data->pwm[j][i] = reg;
-			}
-		}
-
-		data->pwm_enable[i] = reg_to_pwm_enable(data->pwm[0][i],
-							(fanmodecfg >> 4) & 7);
-
-		if (!data->temp_tolerance[0][i] ||
-		    data->pwm_enable[i] != speed_cruise)
-			data->temp_tolerance[0][i] = fanmodecfg & 0x0f;
-		if (!data->target_speed_tolerance[i] ||
-		    data->pwm_enable[i] == speed_cruise) {
-			u8 t = fanmodecfg & 0x0f;
-
-			if (data->REG_TOLERANCE_H) {
-				err = nct6775_read_value(data, data->REG_TOLERANCE_H[i], &reg);
-				if (err)
-					return err;
-				t |= (reg & 0x70) >> 1;
-			}
-			data->target_speed_tolerance[i] = t;
-		}
-
-		err = nct6775_read_value(data, data->REG_CRITICAL_TEMP_TOLERANCE[i], &reg);
-		if (err)
-			return err;
-		data->temp_tolerance[1][i] = reg;
-
-		err = nct6775_read_value(data, data->REG_TEMP_SEL[i], &reg);
-		if (err)
-			return err;
-		data->pwm_temp_sel[i] = reg & 0x1f;
-		/* If fan can stop, report floor as 0 */
-		if (reg & 0x80)
-			data->pwm[2][i] = 0;
-
-		if (!data->REG_WEIGHT_TEMP_SEL[i])
-			continue;
-
-		err = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[i], &reg);
-		if (err)
-			return err;
-		data->pwm_weight_temp_sel[i] = reg & 0x1f;
-		/* If weight is disabled, report weight source as 0 */
-		if (!(reg & 0x80))
-			data->pwm_weight_temp_sel[i] = 0;
-
-		/* Weight temp data */
-		for (j = 0; j < ARRAY_SIZE(data->weight_temp); j++) {
-			err = nct6775_read_value(data, data->REG_WEIGHT_TEMP[j][i], &reg);
-			if (err)
-				return err;
-			data->weight_temp[j][i] = reg;
-		}
-	}
-
-	return 0;
-}
-
-static int nct6775_update_pwm_limits(struct device *dev)
-{
+	u16 tmp;
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	int i, j, err;
-	u16 reg, reg_t;
-
-	for (i = 0; i < data->pwm_num; i++) {
-		if (!(data->has_pwm & BIT(i)))
-			continue;
-
-		for (j = 0; j < ARRAY_SIZE(data->fan_time); j++) {
-			err = nct6775_read_value(data, data->REG_FAN_TIME[j][i], &reg);
-			if (err)
-				return err;
-			data->fan_time[j][i] = reg;
-		}
-
-		err = nct6775_read_value(data, data->REG_TARGET[i], &reg_t);
-		if (err)
-			return err;
-
-		/* Update only in matching mode or if never updated */
-		if (!data->target_temp[i] ||
-		    data->pwm_enable[i] == thermal_cruise)
-			data->target_temp[i] = reg_t & data->target_temp_mask;
-		if (!data->target_speed[i] ||
-		    data->pwm_enable[i] == speed_cruise) {
-			if (data->REG_TOLERANCE_H) {
-				err = nct6775_read_value(data, data->REG_TOLERANCE_H[i], &reg);
-				if (err)
-					return err;
-				reg_t |= (reg & 0x0f) << 8;
-			}
-			data->target_speed[i] = reg_t;
-		}
-
-		for (j = 0; j < data->auto_pwm_num; j++) {
-			err = nct6775_read_value(data, NCT6775_AUTO_PWM(data, i, j), &reg);
-			if (err)
-				return err;
-			data->auto_pwm[i][j] = reg;
-
-			err = nct6775_read_value(data, NCT6775_AUTO_TEMP(data, i, j), &reg);
-			if (err)
-				return err;
-			data->auto_temp[i][j] = reg;
-		}
-
-		/* critical auto_pwm temperature data */
-		err = nct6775_read_value(data, data->REG_CRITICAL_TEMP[i], &reg);
-		if (err)
-			return err;
-		data->auto_temp[i][data->auto_pwm_num] = reg;
-
-		switch (data->kind) {
-		case nct6775:
-			err = nct6775_read_value(data, NCT6775_REG_CRITICAL_ENAB[i], &reg);
-			if (err)
-				return err;
-			data->auto_pwm[i][data->auto_pwm_num] =
-						(reg & 0x02) ? 0xff : 0x00;
-			break;
-		case nct6776:
-			data->auto_pwm[i][data->auto_pwm_num] = 0xff;
-			break;
-		case nct6106:
-		case nct6116:
-		case nct6779:
-		case nct6791:
-		case nct6792:
-		case nct6793:
-		case nct6795:
-		case nct6796:
-		case nct6797:
-		case nct6798:
-			err = nct6775_read_value(data, data->REG_CRITICAL_PWM_ENABLE[i], &reg);
-			if (err)
-				return err;
-			if (reg & data->CRITICAL_PWM_ENABLE_MASK) {
-				err = nct6775_read_value(data, data->REG_CRITICAL_PWM[i], &reg);
-				if (err)
-					return err;
-			} else {
-				reg = 0xff;
-			}
-			data->auto_pwm[i][data->auto_pwm_num] = reg;
-			break;
-		}
-	}
-
-	return 0;
-}
 
-static struct nct6775_data *nct6775_update_device(struct device *dev)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int i, j, err = 0;
-	u16 reg;
+	if (IS_ERR(data))
+		return PTR_ERR(data);
 
 	mutex_lock(&data->update_lock);
-
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
-	    || !data->valid) {
-		/* Fan clock dividers */
-		err = nct6775_update_fan_div_common(data);
-		if (err)
-			goto out;
-
-		/* Measured voltages and limits */
-		for (i = 0; i < data->in_num; i++) {
-			if (!(data->have_in & BIT(i)))
-				continue;
-
-			err = nct6775_read_value(data, data->REG_VIN[i], &reg);
-			if (err)
-				goto out;
-			data->in[i][0] = reg;
-
-			err = nct6775_read_value(data, data->REG_IN_MINMAX[0][i], &reg);
-			if (err)
-				goto out;
-			data->in[i][1] = reg;
-
-			err = nct6775_read_value(data, data->REG_IN_MINMAX[1][i], &reg);
-			if (err)
-				goto out;
-			data->in[i][2] = reg;
-		}
-
-		/* Measured fan speeds and limits */
-		for (i = 0; i < ARRAY_SIZE(data->rpm); i++) {
-			if (!(data->has_fan & BIT(i)))
-				continue;
-
-			err = nct6775_read_value(data, data->REG_FAN[i], &reg);
-			if (err)
-				goto out;
-			data->rpm[i] = data->fan_from_reg(reg,
-							  data->fan_div[i]);
-
-			if (data->has_fan_min & BIT(i)) {
-				err = nct6775_read_value(data, data->REG_FAN_MIN[i], &reg);
-				if (err)
-					goto out;
-				data->fan_min[i] = reg;
-			}
-
-			if (data->REG_FAN_PULSES[i]) {
-				err = nct6775_read_value(data, data->REG_FAN_PULSES[i], &reg);
-				if (err)
-					goto out;
-				data->fan_pulses[i] = (reg >> data->FAN_PULSE_SHIFT[i]) & 0x03;
-			}
-
-			err = nct6775_select_fan_div(dev, data, i, reg);
-			if (err)
-				goto out;
-		}
-
-		err = nct6775_update_pwm(dev);
+	err = nct6775_read_value(data, data->REG_VBAT, &tmp);
+	if (err)
+		goto out;
+	data->vbat = tmp;
+	if (data->kind == nct6775) {
+		err = nct6775_read_value(data, NCT6775_REG_FANDIV1, &tmp);
 		if (err)
 			goto out;
+		data->fandiv1 = tmp;
 
-		err = nct6775_update_pwm_limits(dev);
+		err = nct6775_read_value(data, NCT6775_REG_FANDIV2, &tmp);
 		if (err)
 			goto out;
-
-		/* Measured temperatures and limits */
-		for (i = 0; i < NUM_TEMP; i++) {
-			if (!(data->have_temp & BIT(i)))
-				continue;
-			for (j = 0; j < ARRAY_SIZE(data->reg_temp); j++) {
-				if (data->reg_temp[j][i]) {
-					err = nct6775_read_temp(data, data->reg_temp[j][i], &reg);
-					if (err)
-						goto out;
-					data->temp[j][i] = reg;
-				}
-			}
-			if (i >= NUM_TEMP_FIXED ||
-			    !(data->have_temp_fixed & BIT(i)))
-				continue;
-			err = nct6775_read_value(data, data->REG_TEMP_OFFSET[i], &reg);
-			if (err)
-				goto out;
-			data->temp_offset[i] = reg;
-		}
-
-		for (i = 0; i < NUM_TSI_TEMP; i++) {
-			if (!(data->have_tsi_temp & BIT(i)))
-				continue;
-			err = nct6775_read_value(data, data->REG_TSI_TEMP[i], &reg);
-			if (err)
-				goto out;
-			data->tsi_temp[i] = reg;
-		}
-
-		data->alarms = 0;
-		for (i = 0; i < NUM_REG_ALARM; i++) {
-			u16 alarm;
-
-			if (!data->REG_ALARM[i])
-				continue;
-			err = nct6775_read_value(data, data->REG_ALARM[i], &alarm);
-			if (err)
-				goto out;
-			data->alarms |= ((u64)alarm) << (i << 3);
-		}
-
-		data->beeps = 0;
-		for (i = 0; i < NUM_REG_BEEP; i++) {
-			u16 beep;
-
-			if (!data->REG_BEEP[i])
-				continue;
-			err = nct6775_read_value(data, data->REG_BEEP[i], &beep);
-			if (err)
-				goto out;
-			data->beeps |= ((u64)beep) << (i << 3);
-		}
-
-		data->last_updated = jiffies;
-		data->valid = true;
+		data->fandiv2 = tmp;
 	}
 out:
 	mutex_unlock(&data->update_lock);
-	return err ? ERR_PTR(err) : data;
-}
-
-/*
- * Sysfs callback functions
- */
-static ssize_t
-show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int index = sattr->index;
-	int nr = sattr->nr;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
 
-	return sprintf(buf, "%ld\n", in_from_reg(data->in[nr][index], nr));
+	return err;
 }
 
-static ssize_t
-store_in_reg(struct device *dev, struct device_attribute *attr, const char *buf,
-	     size_t count)
+static int __maybe_unused nct6775_resume(struct device *dev)
 {
 	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int index = sattr->index;
-	int nr = sattr->nr;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	mutex_lock(&data->update_lock);
-	data->in[nr][index] = in_to_reg(val, nr);
-	err = nct6775_write_value(data, data->REG_IN_MINMAX[index - 1][nr], data->in[nr][index]);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr;
+	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
+	int i, j, err = 0;
+	u8 reg;
 
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	nr = data->ALARM_BITS[sattr->index];
-	return sprintf(buf, "%u\n",
-		       (unsigned int)((data->alarms >> nr) & 0x01));
-}
-
-static int find_temp_source(struct nct6775_data *data, int index, int count)
-{
-	int source = data->temp_src[index];
-	int nr, err;
-
-	for (nr = 0; nr < count; nr++) {
-		u16 src;
-
-		err = nct6775_read_value(data, data->REG_TEMP_SOURCE[nr], &src);
-		if (err)
-			return err;
-		if ((src & 0x1f) == source)
-			return nr;
-	}
-	return -ENODEV;
-}
-
-static ssize_t
-show_temp_alarm(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	struct nct6775_data *data = nct6775_update_device(dev);
-	unsigned int alarm = 0;
-	int nr;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	/*
-	 * For temperatures, there is no fixed mapping from registers to alarm
-	 * bits. Alarm bits are determined by the temperature source mapping.
-	 */
-	nr = find_temp_source(data, sattr->index, data->num_temp_alarms);
-	if (nr >= 0) {
-		int bit = data->ALARM_BITS[nr + TEMP_ALARM_BASE];
-
-		alarm = (data->alarms >> bit) & 0x01;
-	}
-	return sprintf(buf, "%u\n", alarm);
-}
-
-static ssize_t
-show_beep(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	struct nct6775_data *data = nct6775_update_device(dev);
-	int nr;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	nr = data->BEEP_BITS[sattr->index];
-
-	return sprintf(buf, "%u\n",
-		       (unsigned int)((data->beeps >> nr) & 0x01));
-}
-
-static ssize_t
-store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
-	   size_t count)
-{
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int nr = data->BEEP_BITS[sattr->index];
-	int regindex = nr >> 3;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	if (val > 1)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-	if (val)
-		data->beeps |= (1ULL << nr);
-	else
-		data->beeps &= ~(1ULL << nr);
-	err = nct6775_write_value(data, data->REG_BEEP[regindex],
-				  (data->beeps >> (regindex << 3)) & 0xff);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_temp_beep(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	struct nct6775_data *data = nct6775_update_device(dev);
-	unsigned int beep = 0;
-	int nr;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	/*
-	 * For temperatures, there is no fixed mapping from registers to beep
-	 * enable bits. Beep enable bits are determined by the temperature
-	 * source mapping.
-	 */
-	nr = find_temp_source(data, sattr->index, data->num_temp_beeps);
-	if (nr >= 0) {
-		int bit = data->BEEP_BITS[nr + TEMP_ALARM_BASE];
-
-		beep = (data->beeps >> bit) & 0x01;
-	}
-	return sprintf(buf, "%u\n", beep);
-}
-
-static ssize_t
-store_temp_beep(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int nr, bit, regindex;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	if (val > 1)
-		return -EINVAL;
-
-	nr = find_temp_source(data, sattr->index, data->num_temp_beeps);
-	if (nr < 0)
-		return nr;
-
-	bit = data->BEEP_BITS[nr + TEMP_ALARM_BASE];
-	regindex = bit >> 3;
-
-	mutex_lock(&data->update_lock);
-	if (val)
-		data->beeps |= (1ULL << bit);
-	else
-		data->beeps &= ~(1ULL << bit);
-	err = nct6775_write_value(data, data->REG_BEEP[regindex],
-				  (data->beeps >> (regindex << 3)) & 0xff);
-	mutex_unlock(&data->update_lock);
-
-	return err ? : count;
-}
-
-static umode_t nct6775_in_is_visible(struct kobject *kobj,
-				     struct attribute *attr, int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int in = index / 5;	/* voltage index */
-
-	if (!(data->have_in & BIT(in)))
-		return 0;
-
-	return nct6775_attr_mode(data, attr);
-}
-
-SENSOR_TEMPLATE_2(in_input, "in%d_input", S_IRUGO, show_in_reg, NULL, 0, 0);
-SENSOR_TEMPLATE(in_alarm, "in%d_alarm", S_IRUGO, show_alarm, NULL, 0);
-SENSOR_TEMPLATE(in_beep, "in%d_beep", S_IWUSR | S_IRUGO, show_beep, store_beep,
-		0);
-SENSOR_TEMPLATE_2(in_min, "in%d_min", S_IWUSR | S_IRUGO, show_in_reg,
-		  store_in_reg, 0, 1);
-SENSOR_TEMPLATE_2(in_max, "in%d_max", S_IWUSR | S_IRUGO, show_in_reg,
-		  store_in_reg, 0, 2);
-
-/*
- * nct6775_in_is_visible uses the index into the following array
- * to determine if attributes should be created or not.
- * Any change in order or content must be matched.
- */
-static struct sensor_device_template *nct6775_attributes_in_template[] = {
-	&sensor_dev_template_in_input,
-	&sensor_dev_template_in_alarm,
-	&sensor_dev_template_in_beep,
-	&sensor_dev_template_in_min,
-	&sensor_dev_template_in_max,
-	NULL
-};
-
-static const struct sensor_template_group nct6775_in_template_group = {
-	.templates = nct6775_attributes_in_template,
-	.is_visible = nct6775_in_is_visible,
-};
-
-static ssize_t
-show_fan(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->rpm[nr]);
-}
-
-static ssize_t
-show_fan_min(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n",
-		       data->fan_from_reg_min(data->fan_min[nr],
-					      data->fan_div[nr]));
-}
-
-static ssize_t
-show_fan_div(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%u\n", div_from_reg(data->fan_div[nr]));
-}
-
-static ssize_t
-store_fan_min(struct device *dev, struct device_attribute *attr,
-	      const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	unsigned int reg;
-	u8 new_div;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	if (!data->has_fan_div) {
-		/* NCT6776F or NCT6779D; we know this is a 13 bit register */
-		if (!val) {
-			val = 0xff1f;
-		} else {
-			if (val > 1350000U)
-				val = 135000U;
-			val = 1350000U / val;
-			val = (val & 0x1f) | ((val << 3) & 0xff00);
-		}
-		data->fan_min[nr] = val;
-		goto write_min;	/* Leave fan divider alone */
-	}
-	if (!val) {
-		/* No min limit, alarm disabled */
-		data->fan_min[nr] = 255;
-		new_div = data->fan_div[nr]; /* No change */
-		dev_info(dev, "fan%u low limit and alarm disabled\n", nr + 1);
-		goto write_div;
-	}
-	reg = 1350000U / val;
-	if (reg >= 128 * 255) {
-		/*
-		 * Speed below this value cannot possibly be represented,
-		 * even with the highest divider (128)
-		 */
-		data->fan_min[nr] = 254;
-		new_div = 7; /* 128 == BIT(7) */
-		dev_warn(dev,
-			 "fan%u low limit %lu below minimum %u, set to minimum\n",
-			 nr + 1, val, data->fan_from_reg_min(254, 7));
-	} else if (!reg) {
-		/*
-		 * Speed above this value cannot possibly be represented,
-		 * even with the lowest divider (1)
-		 */
-		data->fan_min[nr] = 1;
-		new_div = 0; /* 1 == BIT(0) */
-		dev_warn(dev,
-			 "fan%u low limit %lu above maximum %u, set to maximum\n",
-			 nr + 1, val, data->fan_from_reg_min(1, 0));
-	} else {
-		/*
-		 * Automatically pick the best divider, i.e. the one such
-		 * that the min limit will correspond to a register value
-		 * in the 96..192 range
-		 */
-		new_div = 0;
-		while (reg > 192 && new_div < 7) {
-			reg >>= 1;
-			new_div++;
-		}
-		data->fan_min[nr] = reg;
-	}
-
-write_div:
-	/*
-	 * Write both the fan clock divider (if it changed) and the new
-	 * fan min (unconditionally)
-	 */
-	if (new_div != data->fan_div[nr]) {
-		dev_dbg(dev, "fan%u clock divider changed from %u to %u\n",
-			nr + 1, div_from_reg(data->fan_div[nr]),
-			div_from_reg(new_div));
-		data->fan_div[nr] = new_div;
-		err = nct6775_write_fan_div_common(data, nr);
-		if (err)
-			goto write_min;
-		/* Give the chip time to sample a new speed value */
-		data->last_updated = jiffies;
-	}
-
-write_min:
-	err = nct6775_write_value(data, data->REG_FAN_MIN[nr], data->fan_min[nr]);
-	mutex_unlock(&data->update_lock);
-
-	return err ? : count;
-}
-
-static ssize_t
-show_fan_pulses(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int p;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	p = data->fan_pulses[sattr->index];
-	return sprintf(buf, "%d\n", p ? : 4);
-}
-
-static ssize_t
-store_fan_pulses(struct device *dev, struct device_attribute *attr,
-		 const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-	u16 reg;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	if (val > 4)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-	data->fan_pulses[nr] = val & 3;
-	err = nct6775_read_value(data, data->REG_FAN_PULSES[nr], &reg);
-	if (err)
-		goto out;
-	reg &= ~(0x03 << data->FAN_PULSE_SHIFT[nr]);
-	reg |= (val & 3) << data->FAN_PULSE_SHIFT[nr];
-	err = nct6775_write_value(data, data->REG_FAN_PULSES[nr], reg);
-out:
-	mutex_unlock(&data->update_lock);
-
-	return err ? : count;
-}
-
-static umode_t nct6775_fan_is_visible(struct kobject *kobj,
-				      struct attribute *attr, int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int fan = index / 6;	/* fan index */
-	int nr = index % 6;	/* attribute index */
-
-	if (!(data->has_fan & BIT(fan)))
-		return 0;
-
-	if (nr == 1 && data->ALARM_BITS[FAN_ALARM_BASE + fan] == -1)
-		return 0;
-	if (nr == 2 && data->BEEP_BITS[FAN_ALARM_BASE + fan] == -1)
-		return 0;
-	if (nr == 3 && !data->REG_FAN_PULSES[fan])
-		return 0;
-	if (nr == 4 && !(data->has_fan_min & BIT(fan)))
-		return 0;
-	if (nr == 5 && data->kind != nct6775)
-		return 0;
-
-	return nct6775_attr_mode(data, attr);
-}
-
-SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
-SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", S_IRUGO, show_alarm, NULL,
-		FAN_ALARM_BASE);
-SENSOR_TEMPLATE(fan_beep, "fan%d_beep", S_IWUSR | S_IRUGO, show_beep,
-		store_beep, FAN_ALARM_BASE);
-SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", S_IWUSR | S_IRUGO, show_fan_pulses,
-		store_fan_pulses, 0);
-SENSOR_TEMPLATE(fan_min, "fan%d_min", S_IWUSR | S_IRUGO, show_fan_min,
-		store_fan_min, 0);
-SENSOR_TEMPLATE(fan_div, "fan%d_div", S_IRUGO, show_fan_div, NULL, 0);
-
-/*
- * nct6775_fan_is_visible uses the index into the following array
- * to determine if attributes should be created or not.
- * Any change in order or content must be matched.
- */
-static struct sensor_device_template *nct6775_attributes_fan_template[] = {
-	&sensor_dev_template_fan_input,
-	&sensor_dev_template_fan_alarm,	/* 1 */
-	&sensor_dev_template_fan_beep,	/* 2 */
-	&sensor_dev_template_fan_pulses,
-	&sensor_dev_template_fan_min,	/* 4 */
-	&sensor_dev_template_fan_div,	/* 5 */
-	NULL
-};
-
-static const struct sensor_template_group nct6775_fan_template_group = {
-	.templates = nct6775_attributes_fan_template,
-	.is_visible = nct6775_fan_is_visible,
-	.base = 1,
-};
-
-static ssize_t
-show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%s\n", data->temp_label[data->temp_src[nr]]);
-}
-
-static ssize_t
-show_temp(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", LM75_TEMP_FROM_REG(data->temp[index][nr]));
-}
-
-static ssize_t
-store_temp(struct device *dev, struct device_attribute *attr, const char *buf,
-	   size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-	int err;
-	long val;
-
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&data->update_lock);
-	data->temp[index][nr] = LM75_TEMP_TO_REG(val);
-	err = nct6775_write_temp(data, data->reg_temp[index][nr], data->temp[index][nr]);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_temp_offset(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->temp_offset[sattr->index] * 1000);
-}
-
-static ssize_t
-store_temp_offset(struct device *dev, struct device_attribute *attr,
-		  const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	long val;
-	int err;
-
-	err = kstrtol(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
-
-	mutex_lock(&data->update_lock);
-	data->temp_offset[nr] = val;
-	err = nct6775_write_value(data, data->REG_TEMP_OFFSET[nr], val);
-	mutex_unlock(&data->update_lock);
-
-	return err ? : count;
-}
-
-static ssize_t
-show_temp_type(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", (int)data->temp_type[nr]);
-}
-
-static ssize_t
-store_temp_type(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-	u8 vbit, dbit;
-	u16 vbat, diode;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	if (val != 1 && val != 3 && val != 4)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-
-	data->temp_type[nr] = val;
-	vbit = 0x02 << nr;
-	dbit = data->DIODE_MASK << nr;
-
-	err = nct6775_read_value(data, data->REG_VBAT, &vbat);
-	if (err)
-		goto out;
-	vbat &= ~vbit;
-
-	err = nct6775_read_value(data, data->REG_DIODE, &diode);
-	if (err)
-		goto out;
-	diode &= ~dbit;
-
-	switch (val) {
-	case 1:	/* CPU diode (diode, current mode) */
-		vbat |= vbit;
-		diode |= dbit;
-		break;
-	case 3: /* diode, voltage mode */
-		vbat |= dbit;
-		break;
-	case 4:	/* thermistor */
-		break;
-	}
-	err = nct6775_write_value(data, data->REG_VBAT, vbat);
-	if (err)
-		goto out;
-	err = nct6775_write_value(data, data->REG_DIODE, diode);
-out:
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static umode_t nct6775_temp_is_visible(struct kobject *kobj,
-				       struct attribute *attr, int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int temp = index / 10;	/* temp index */
-	int nr = index % 10;	/* attribute index */
-
-	if (!(data->have_temp & BIT(temp)))
-		return 0;
-
-	if (nr == 1 && !data->temp_label)
-		return 0;
-
-	if (nr == 2 && find_temp_source(data, temp, data->num_temp_alarms) < 0)
-		return 0;				/* alarm */
-
-	if (nr == 3 && find_temp_source(data, temp, data->num_temp_beeps) < 0)
-		return 0;				/* beep */
-
-	if (nr == 4 && !data->reg_temp[1][temp])	/* max */
-		return 0;
-
-	if (nr == 5 && !data->reg_temp[2][temp])	/* max_hyst */
-		return 0;
-
-	if (nr == 6 && !data->reg_temp[3][temp])	/* crit */
-		return 0;
-
-	if (nr == 7 && !data->reg_temp[4][temp])	/* lcrit */
-		return 0;
-
-	/* offset and type only apply to fixed sensors */
-	if (nr > 7 && !(data->have_temp_fixed & BIT(temp)))
-		return 0;
-
-	return nct6775_attr_mode(data, attr);
-}
-
-SENSOR_TEMPLATE_2(temp_input, "temp%d_input", S_IRUGO, show_temp, NULL, 0, 0);
-SENSOR_TEMPLATE(temp_label, "temp%d_label", S_IRUGO, show_temp_label, NULL, 0);
-SENSOR_TEMPLATE_2(temp_max, "temp%d_max", S_IRUGO | S_IWUSR, show_temp,
-		  store_temp, 0, 1);
-SENSOR_TEMPLATE_2(temp_max_hyst, "temp%d_max_hyst", S_IRUGO | S_IWUSR,
-		  show_temp, store_temp, 0, 2);
-SENSOR_TEMPLATE_2(temp_crit, "temp%d_crit", S_IRUGO | S_IWUSR, show_temp,
-		  store_temp, 0, 3);
-SENSOR_TEMPLATE_2(temp_lcrit, "temp%d_lcrit", S_IRUGO | S_IWUSR, show_temp,
-		  store_temp, 0, 4);
-SENSOR_TEMPLATE(temp_offset, "temp%d_offset", S_IRUGO | S_IWUSR,
-		show_temp_offset, store_temp_offset, 0);
-SENSOR_TEMPLATE(temp_type, "temp%d_type", S_IRUGO | S_IWUSR, show_temp_type,
-		store_temp_type, 0);
-SENSOR_TEMPLATE(temp_alarm, "temp%d_alarm", S_IRUGO, show_temp_alarm, NULL, 0);
-SENSOR_TEMPLATE(temp_beep, "temp%d_beep", S_IRUGO | S_IWUSR, show_temp_beep,
-		store_temp_beep, 0);
-
-/*
- * nct6775_temp_is_visible uses the index into the following array
- * to determine if attributes should be created or not.
- * Any change in order or content must be matched.
- */
-static struct sensor_device_template *nct6775_attributes_temp_template[] = {
-	&sensor_dev_template_temp_input,
-	&sensor_dev_template_temp_label,
-	&sensor_dev_template_temp_alarm,	/* 2 */
-	&sensor_dev_template_temp_beep,		/* 3 */
-	&sensor_dev_template_temp_max,		/* 4 */
-	&sensor_dev_template_temp_max_hyst,	/* 5 */
-	&sensor_dev_template_temp_crit,		/* 6 */
-	&sensor_dev_template_temp_lcrit,	/* 7 */
-	&sensor_dev_template_temp_offset,	/* 8 */
-	&sensor_dev_template_temp_type,		/* 9 */
-	NULL
-};
-
-static const struct sensor_template_group nct6775_temp_template_group = {
-	.templates = nct6775_attributes_temp_template,
-	.is_visible = nct6775_temp_is_visible,
-	.base = 1,
-};
-
-static ssize_t show_tsi_temp(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sysfs_emit(buf, "%u\n", tsi_temp_from_reg(data->tsi_temp[sattr->index]));
-}
-
-static ssize_t show_tsi_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-
-	return sysfs_emit(buf, "TSI%d_TEMP\n", sattr->index);
-}
-
-SENSOR_TEMPLATE(tsi_temp_input, "temp%d_input", 0444, show_tsi_temp, NULL, 0);
-SENSOR_TEMPLATE(tsi_temp_label, "temp%d_label", 0444, show_tsi_temp_label, NULL, 0);
-
-static umode_t nct6775_tsi_temp_is_visible(struct kobject *kobj, struct attribute *attr,
-					       int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int temp = index / 2;
-
-	return (data->have_tsi_temp & BIT(temp)) ? nct6775_attr_mode(data, attr) : 0;
-}
-
-/*
- * The index calculation in nct6775_tsi_temp_is_visible() must be kept in
- * sync with the size of this array.
- */
-static struct sensor_device_template *nct6775_tsi_temp_template[] = {
-	&sensor_dev_template_tsi_temp_input,
-	&sensor_dev_template_tsi_temp_label,
-	NULL
-};
-
-static ssize_t
-show_pwm_mode(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->pwm_mode[sattr->index]);
-}
-
-static ssize_t
-store_pwm_mode(struct device *dev, struct device_attribute *attr,
-	       const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-	u16 reg;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	if (val > 1)
-		return -EINVAL;
-
-	/* Setting DC mode (0) is not supported for all chips/channels */
-	if (data->REG_PWM_MODE[nr] == 0) {
-		if (!val)
-			return -EINVAL;
-		return count;
-	}
-
-	mutex_lock(&data->update_lock);
-	data->pwm_mode[nr] = val;
-	err = nct6775_read_value(data, data->REG_PWM_MODE[nr], &reg);
-	if (err)
-		goto out;
-	reg &= ~data->PWM_MODE_MASK[nr];
-	if (!val)
-		reg |= data->PWM_MODE_MASK[nr];
-	err = nct6775_write_value(data, data->REG_PWM_MODE[nr], reg);
-out:
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-	int err;
-	u16 pwm;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	/*
-	 * For automatic fan control modes, show current pwm readings.
-	 * Otherwise, show the configured value.
-	 */
-	if (index == 0 && data->pwm_enable[nr] > manual) {
-		err = nct6775_read_value(data, data->REG_PWM_READ[nr], &pwm);
-		if (err)
-			return err;
-	} else {
-		pwm = data->pwm[index][nr];
-	}
-
-	return sprintf(buf, "%d\n", pwm);
-}
-
-static ssize_t
-store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
-	  size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-	unsigned long val;
-	int minval[7] = { 0, 1, 1, data->pwm[2][nr], 0, 0, 0 };
-	int maxval[7]
-	  = { 255, 255, data->pwm[3][nr] ? : 255, 255, 255, 255, 255 };
-	int err;
-	u16 reg;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	val = clamp_val(val, minval[index], maxval[index]);
-
-	mutex_lock(&data->update_lock);
-	data->pwm[index][nr] = val;
-	err = nct6775_write_value(data, data->REG_PWM[index][nr], val);
-	if (err)
-		goto out;
-	if (index == 2)	{ /* floor: disable if val == 0 */
-		err = nct6775_read_value(data, data->REG_TEMP_SEL[nr], &reg);
-		if (err)
-			goto out;
-		reg &= 0x7f;
-		if (val)
-			reg |= 0x80;
-		err = nct6775_write_value(data, data->REG_TEMP_SEL[nr], reg);
-	}
-out:
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-/* Returns 0 if OK, -EINVAL otherwise */
-static int check_trip_points(struct nct6775_data *data, int nr)
-{
-	int i;
-
-	for (i = 0; i < data->auto_pwm_num - 1; i++) {
-		if (data->auto_temp[nr][i] > data->auto_temp[nr][i + 1])
-			return -EINVAL;
-	}
-	for (i = 0; i < data->auto_pwm_num - 1; i++) {
-		if (data->auto_pwm[nr][i] > data->auto_pwm[nr][i + 1])
-			return -EINVAL;
-	}
-	/* validate critical temperature and pwm if enabled (pwm > 0) */
-	if (data->auto_pwm[nr][data->auto_pwm_num]) {
-		if (data->auto_temp[nr][data->auto_pwm_num - 1] >
-				data->auto_temp[nr][data->auto_pwm_num] ||
-		    data->auto_pwm[nr][data->auto_pwm_num - 1] >
-				data->auto_pwm[nr][data->auto_pwm_num])
-			return -EINVAL;
-	}
-	return 0;
-}
-
-static int pwm_update_registers(struct nct6775_data *data, int nr)
-{
-	u16 reg;
-	int err;
-
-	switch (data->pwm_enable[nr]) {
-	case off:
-	case manual:
-		break;
-	case speed_cruise:
-		err = nct6775_read_value(data, data->REG_FAN_MODE[nr], &reg);
-		if (err)
-			return err;
-		reg = (reg & ~data->tolerance_mask) |
-		  (data->target_speed_tolerance[nr] & data->tolerance_mask);
-		err = nct6775_write_value(data, data->REG_FAN_MODE[nr], reg);
-		if (err)
-			return err;
-		err = nct6775_write_value(data, data->REG_TARGET[nr],
-					  data->target_speed[nr] & 0xff);
-		if (err)
-			return err;
-		if (data->REG_TOLERANCE_H) {
-			reg = (data->target_speed[nr] >> 8) & 0x0f;
-			reg |= (data->target_speed_tolerance[nr] & 0x38) << 1;
-			err = nct6775_write_value(data, data->REG_TOLERANCE_H[nr], reg);
-			if (err)
-				return err;
-		}
-		break;
-	case thermal_cruise:
-		err = nct6775_write_value(data, data->REG_TARGET[nr], data->target_temp[nr]);
-		if (err)
-			return err;
-		fallthrough;
-	default:
-		err = nct6775_read_value(data, data->REG_FAN_MODE[nr], &reg);
-		if (err)
-			return err;
-		reg = (reg & ~data->tolerance_mask) |
-		  data->temp_tolerance[0][nr];
-		err = nct6775_write_value(data, data->REG_FAN_MODE[nr], reg);
-		if (err)
-			return err;
-		break;
-	}
-
-	return 0;
-}
-
-static ssize_t
-show_pwm_enable(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->pwm_enable[sattr->index]);
-}
-
-static ssize_t
-store_pwm_enable(struct device *dev, struct device_attribute *attr,
-		 const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-	u16 reg;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	if (val > sf4)
-		return -EINVAL;
-
-	if (val == sf3 && data->kind != nct6775)
-		return -EINVAL;
-
-	if (val == sf4 && check_trip_points(data, nr)) {
-		dev_err(dev, "Inconsistent trip points, not switching to SmartFan IV mode\n");
-		dev_err(dev, "Adjust trip points and try again\n");
-		return -EINVAL;
-	}
-
-	mutex_lock(&data->update_lock);
-	data->pwm_enable[nr] = val;
-	if (val == off) {
-		/*
-		 * turn off pwm control: select manual mode, set pwm to maximum
-		 */
-		data->pwm[0][nr] = 255;
-		err = nct6775_write_value(data, data->REG_PWM[0][nr], 255);
-		if (err)
-			goto out;
-	}
-	err = pwm_update_registers(data, nr);
-	if (err)
-		goto out;
-	err = nct6775_read_value(data, data->REG_FAN_MODE[nr], &reg);
-	if (err)
-		goto out;
-	reg &= 0x0f;
-	reg |= pwm_enable_to_reg(val) << 4;
-	err = nct6775_write_value(data, data->REG_FAN_MODE[nr], reg);
-out:
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_pwm_temp_sel_common(struct nct6775_data *data, char *buf, int src)
-{
-	int i, sel = 0;
-
-	for (i = 0; i < NUM_TEMP; i++) {
-		if (!(data->have_temp & BIT(i)))
-			continue;
-		if (src == data->temp_src[i]) {
-			sel = i + 1;
-			break;
-		}
-	}
-
-	return sprintf(buf, "%d\n", sel);
-}
-
-static ssize_t
-show_pwm_temp_sel(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int index = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return show_pwm_temp_sel_common(data, buf, data->pwm_temp_sel[index]);
-}
-
-static ssize_t
-store_pwm_temp_sel(struct device *dev, struct device_attribute *attr,
-		   const char *buf, size_t count)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err, src;
-	u16 reg;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	if (val == 0 || val > NUM_TEMP)
-		return -EINVAL;
-	if (!(data->have_temp & BIT(val - 1)) || !data->temp_src[val - 1])
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-	src = data->temp_src[val - 1];
-	data->pwm_temp_sel[nr] = src;
-	err = nct6775_read_value(data, data->REG_TEMP_SEL[nr], &reg);
-	if (err)
-		goto out;
-	reg &= 0xe0;
-	reg |= src;
-	err = nct6775_write_value(data, data->REG_TEMP_SEL[nr], reg);
-out:
-	mutex_unlock(&data->update_lock);
-
-	return err ? : count;
-}
-
-static ssize_t
-show_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int index = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return show_pwm_temp_sel_common(data, buf,
-					data->pwm_weight_temp_sel[index]);
-}
-
-static ssize_t
-store_pwm_weight_temp_sel(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err, src;
-	u16 reg;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	if (val > NUM_TEMP)
-		return -EINVAL;
-	val = array_index_nospec(val, NUM_TEMP + 1);
-	if (val && (!(data->have_temp & BIT(val - 1)) ||
-		    !data->temp_src[val - 1]))
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-	if (val) {
-		src = data->temp_src[val - 1];
-		data->pwm_weight_temp_sel[nr] = src;
-		err = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[nr], &reg);
-		if (err)
-			goto out;
-		reg &= 0xe0;
-		reg |= (src | 0x80);
-		err = nct6775_write_value(data, data->REG_WEIGHT_TEMP_SEL[nr], reg);
-	} else {
-		data->pwm_weight_temp_sel[nr] = 0;
-		err = nct6775_read_value(data, data->REG_WEIGHT_TEMP_SEL[nr], &reg);
-		if (err)
-			goto out;
-		reg &= 0x7f;
-		err = nct6775_write_value(data, data->REG_WEIGHT_TEMP_SEL[nr], reg);
-	}
-out:
-	mutex_unlock(&data->update_lock);
-
-	return err ? : count;
-}
-
-static ssize_t
-show_target_temp(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->target_temp[sattr->index] * 1000);
-}
-
-static ssize_t
-store_target_temp(struct device *dev, struct device_attribute *attr,
-		  const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0,
-			data->target_temp_mask);
-
-	mutex_lock(&data->update_lock);
-	data->target_temp[nr] = val;
-	err = pwm_update_registers(data, nr);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_target_speed(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n",
-		       fan_from_reg16(data->target_speed[nr],
-				      data->fan_div[nr]));
-}
-
-static ssize_t
-store_target_speed(struct device *dev, struct device_attribute *attr,
-		   const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-	u16 speed;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	val = clamp_val(val, 0, 1350000U);
-	speed = fan_to_reg(val, data->fan_div[nr]);
-
-	mutex_lock(&data->update_lock);
-	data->target_speed[nr] = speed;
-	err = pwm_update_registers(data, nr);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_temp_tolerance(struct device *dev, struct device_attribute *attr,
-		    char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->temp_tolerance[index][nr] * 1000);
-}
-
-static ssize_t
-store_temp_tolerance(struct device *dev, struct device_attribute *attr,
-		     const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	/* Limit tolerance as needed */
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, data->tolerance_mask);
-
-	mutex_lock(&data->update_lock);
-	data->temp_tolerance[index][nr] = val;
-	if (index)
-		err = pwm_update_registers(data, nr);
-	else
-		err = nct6775_write_value(data, data->REG_CRITICAL_TEMP_TOLERANCE[nr], val);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-/*
- * Fan speed tolerance is a tricky beast, since the associated register is
- * a tick counter, but the value is reported and configured as rpm.
- * Compute resulting low and high rpm values and report the difference.
- * A fan speed tolerance only makes sense if a fan target speed has been
- * configured, so only display values other than 0 if that is the case.
- */
-static ssize_t
-show_speed_tolerance(struct device *dev, struct device_attribute *attr,
-		     char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	int target, tolerance = 0;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	target = data->target_speed[nr];
-
-	if (target) {
-		int low = target - data->target_speed_tolerance[nr];
-		int high = target + data->target_speed_tolerance[nr];
-
-		if (low <= 0)
-			low = 1;
-		if (high > 0xffff)
-			high = 0xffff;
-		if (high < low)
-			high = low;
-
-		tolerance = (fan_from_reg16(low, data->fan_div[nr])
-			     - fan_from_reg16(high, data->fan_div[nr])) / 2;
-	}
-
-	return sprintf(buf, "%d\n", tolerance);
-}
-
-static ssize_t
-store_speed_tolerance(struct device *dev, struct device_attribute *attr,
-		      const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
-	int nr = sattr->index;
-	unsigned long val;
-	int err;
-	int low, high;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	high = fan_from_reg16(data->target_speed[nr], data->fan_div[nr]) + val;
-	low = fan_from_reg16(data->target_speed[nr], data->fan_div[nr]) - val;
-	if (low <= 0)
-		low = 1;
-	if (high < low)
-		high = low;
-
-	val = (fan_to_reg(low, data->fan_div[nr]) -
-	       fan_to_reg(high, data->fan_div[nr])) / 2;
-
-	/* Limit tolerance as needed */
-	val = clamp_val(val, 0, data->speed_tolerance_limit);
-
-	mutex_lock(&data->update_lock);
-	data->target_speed_tolerance[nr] = val;
-	err = pwm_update_registers(data, nr);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-SENSOR_TEMPLATE_2(pwm, "pwm%d", S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 0);
-SENSOR_TEMPLATE(pwm_mode, "pwm%d_mode", S_IWUSR | S_IRUGO, show_pwm_mode,
-		store_pwm_mode, 0);
-SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", S_IWUSR | S_IRUGO, show_pwm_enable,
-		store_pwm_enable, 0);
-SENSOR_TEMPLATE(pwm_temp_sel, "pwm%d_temp_sel", S_IWUSR | S_IRUGO,
-		show_pwm_temp_sel, store_pwm_temp_sel, 0);
-SENSOR_TEMPLATE(pwm_target_temp, "pwm%d_target_temp", S_IWUSR | S_IRUGO,
-		show_target_temp, store_target_temp, 0);
-SENSOR_TEMPLATE(fan_target, "fan%d_target", S_IWUSR | S_IRUGO,
-		show_target_speed, store_target_speed, 0);
-SENSOR_TEMPLATE(fan_tolerance, "fan%d_tolerance", S_IWUSR | S_IRUGO,
-		show_speed_tolerance, store_speed_tolerance, 0);
-
-/* Smart Fan registers */
-
-static ssize_t
-show_weight_temp(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->weight_temp[index][nr] * 1000);
-}
-
-static ssize_t
-store_weight_temp(struct device *dev, struct device_attribute *attr,
-		  const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 0, 255);
-
-	mutex_lock(&data->update_lock);
-	data->weight_temp[index][nr] = val;
-	err = nct6775_write_value(data, data->REG_WEIGHT_TEMP[index][nr], val);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-SENSOR_TEMPLATE(pwm_weight_temp_sel, "pwm%d_weight_temp_sel", S_IWUSR | S_IRUGO,
-		  show_pwm_weight_temp_sel, store_pwm_weight_temp_sel, 0);
-SENSOR_TEMPLATE_2(pwm_weight_temp_step, "pwm%d_weight_temp_step",
-		  S_IWUSR | S_IRUGO, show_weight_temp, store_weight_temp, 0, 0);
-SENSOR_TEMPLATE_2(pwm_weight_temp_step_tol, "pwm%d_weight_temp_step_tol",
-		  S_IWUSR | S_IRUGO, show_weight_temp, store_weight_temp, 0, 1);
-SENSOR_TEMPLATE_2(pwm_weight_temp_step_base, "pwm%d_weight_temp_step_base",
-		  S_IWUSR | S_IRUGO, show_weight_temp, store_weight_temp, 0, 2);
-SENSOR_TEMPLATE_2(pwm_weight_duty_step, "pwm%d_weight_duty_step",
-		  S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 5);
-SENSOR_TEMPLATE_2(pwm_weight_duty_base, "pwm%d_weight_duty_base",
-		  S_IWUSR | S_IRUGO, show_pwm, store_pwm, 0, 6);
-
-static ssize_t
-show_fan_time(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n",
-		       step_time_from_reg(data->fan_time[index][nr],
-					  data->pwm_mode[nr]));
-}
-
-static ssize_t
-store_fan_time(struct device *dev, struct device_attribute *attr,
-	       const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int index = sattr->index;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-
-	val = step_time_to_reg(val, data->pwm_mode[nr]);
-	mutex_lock(&data->update_lock);
-	data->fan_time[index][nr] = val;
-	err = nct6775_write_value(data, data->REG_FAN_TIME[index][nr], val);
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_auto_pwm(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	return sprintf(buf, "%d\n", data->auto_pwm[sattr->nr][sattr->index]);
-}
-
-static ssize_t
-store_auto_pwm(struct device *dev, struct device_attribute *attr,
-	       const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int point = sattr->index;
-	unsigned long val;
-	int err;
-	u16 reg;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err < 0)
-		return err;
-	if (val > 255)
-		return -EINVAL;
-
-	if (point == data->auto_pwm_num) {
-		if (data->kind != nct6775 && !val)
-			return -EINVAL;
-		if (data->kind != nct6779 && val)
-			val = 0xff;
-	}
-
-	mutex_lock(&data->update_lock);
-	data->auto_pwm[nr][point] = val;
-	if (point < data->auto_pwm_num) {
-		err = nct6775_write_value(data, NCT6775_AUTO_PWM(data, nr, point),
-					  data->auto_pwm[nr][point]);
-	} else {
-		switch (data->kind) {
-		case nct6775:
-			/* disable if needed (pwm == 0) */
-			err = nct6775_read_value(data, NCT6775_REG_CRITICAL_ENAB[nr], &reg);
-			if (err)
-				break;
-			if (val)
-				reg |= 0x02;
-			else
-				reg &= ~0x02;
-			err = nct6775_write_value(data, NCT6775_REG_CRITICAL_ENAB[nr], reg);
-			break;
-		case nct6776:
-			break; /* always enabled, nothing to do */
-		case nct6106:
-		case nct6116:
-		case nct6779:
-		case nct6791:
-		case nct6792:
-		case nct6793:
-		case nct6795:
-		case nct6796:
-		case nct6797:
-		case nct6798:
-			err = nct6775_write_value(data, data->REG_CRITICAL_PWM[nr], val);
-			if (err)
-				break;
-			err = nct6775_read_value(data, data->REG_CRITICAL_PWM_ENABLE[nr], &reg);
-			if (err)
-				break;
-			if (val == 255)
-				reg &= ~data->CRITICAL_PWM_ENABLE_MASK;
-			else
-				reg |= data->CRITICAL_PWM_ENABLE_MASK;
-			err = nct6775_write_value(data, data->REG_CRITICAL_PWM_ENABLE[nr], reg);
-			break;
-		}
-	}
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static ssize_t
-show_auto_temp(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = nct6775_update_device(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int point = sattr->index;
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	/*
-	 * We don't know for sure if the temperature is signed or unsigned.
-	 * Assume it is unsigned.
-	 */
-	return sprintf(buf, "%d\n", data->auto_temp[nr][point] * 1000);
-}
-
-static ssize_t
-store_auto_temp(struct device *dev, struct device_attribute *attr,
-		const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int nr = sattr->nr;
-	int point = sattr->index;
-	unsigned long val;
-	int err;
-
-	err = kstrtoul(buf, 10, &val);
-	if (err)
-		return err;
-	if (val > 255000)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-	data->auto_temp[nr][point] = DIV_ROUND_CLOSEST(val, 1000);
-	if (point < data->auto_pwm_num) {
-		err = nct6775_write_value(data, NCT6775_AUTO_TEMP(data, nr, point),
-					  data->auto_temp[nr][point]);
-	} else {
-		err = nct6775_write_value(data, data->REG_CRITICAL_TEMP[nr],
-					  data->auto_temp[nr][point]);
-	}
-	mutex_unlock(&data->update_lock);
-	return err ? : count;
-}
-
-static umode_t nct6775_pwm_is_visible(struct kobject *kobj,
-				      struct attribute *attr, int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	int pwm = index / 36;	/* pwm index */
-	int nr = index % 36;	/* attribute index */
-
-	if (!(data->has_pwm & BIT(pwm)))
-		return 0;
-
-	if ((nr >= 14 && nr <= 18) || nr == 21)   /* weight */
-		if (!data->REG_WEIGHT_TEMP_SEL[pwm])
-			return 0;
-	if (nr == 19 && data->REG_PWM[3] == NULL) /* pwm_max */
-		return 0;
-	if (nr == 20 && data->REG_PWM[4] == NULL) /* pwm_step */
-		return 0;
-	if (nr == 21 && data->REG_PWM[6] == NULL) /* weight_duty_base */
-		return 0;
-
-	if (nr >= 22 && nr <= 35) {		/* auto point */
-		int api = (nr - 22) / 2;	/* auto point index */
-
-		if (api > data->auto_pwm_num)
-			return 0;
-	}
-	return nct6775_attr_mode(data, attr);
-}
-
-SENSOR_TEMPLATE_2(pwm_stop_time, "pwm%d_stop_time", S_IWUSR | S_IRUGO,
-		  show_fan_time, store_fan_time, 0, 0);
-SENSOR_TEMPLATE_2(pwm_step_up_time, "pwm%d_step_up_time", S_IWUSR | S_IRUGO,
-		  show_fan_time, store_fan_time, 0, 1);
-SENSOR_TEMPLATE_2(pwm_step_down_time, "pwm%d_step_down_time", S_IWUSR | S_IRUGO,
-		  show_fan_time, store_fan_time, 0, 2);
-SENSOR_TEMPLATE_2(pwm_start, "pwm%d_start", S_IWUSR | S_IRUGO, show_pwm,
-		  store_pwm, 0, 1);
-SENSOR_TEMPLATE_2(pwm_floor, "pwm%d_floor", S_IWUSR | S_IRUGO, show_pwm,
-		  store_pwm, 0, 2);
-SENSOR_TEMPLATE_2(pwm_temp_tolerance, "pwm%d_temp_tolerance", S_IWUSR | S_IRUGO,
-		  show_temp_tolerance, store_temp_tolerance, 0, 0);
-SENSOR_TEMPLATE_2(pwm_crit_temp_tolerance, "pwm%d_crit_temp_tolerance",
-		  S_IWUSR | S_IRUGO, show_temp_tolerance, store_temp_tolerance,
-		  0, 1);
-
-SENSOR_TEMPLATE_2(pwm_max, "pwm%d_max", S_IWUSR | S_IRUGO, show_pwm, store_pwm,
-		  0, 3);
-
-SENSOR_TEMPLATE_2(pwm_step, "pwm%d_step", S_IWUSR | S_IRUGO, show_pwm,
-		  store_pwm, 0, 4);
-
-SENSOR_TEMPLATE_2(pwm_auto_point1_pwm, "pwm%d_auto_point1_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 0);
-SENSOR_TEMPLATE_2(pwm_auto_point1_temp, "pwm%d_auto_point1_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 0);
-
-SENSOR_TEMPLATE_2(pwm_auto_point2_pwm, "pwm%d_auto_point2_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 1);
-SENSOR_TEMPLATE_2(pwm_auto_point2_temp, "pwm%d_auto_point2_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 1);
-
-SENSOR_TEMPLATE_2(pwm_auto_point3_pwm, "pwm%d_auto_point3_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 2);
-SENSOR_TEMPLATE_2(pwm_auto_point3_temp, "pwm%d_auto_point3_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 2);
-
-SENSOR_TEMPLATE_2(pwm_auto_point4_pwm, "pwm%d_auto_point4_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 3);
-SENSOR_TEMPLATE_2(pwm_auto_point4_temp, "pwm%d_auto_point4_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 3);
-
-SENSOR_TEMPLATE_2(pwm_auto_point5_pwm, "pwm%d_auto_point5_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 4);
-SENSOR_TEMPLATE_2(pwm_auto_point5_temp, "pwm%d_auto_point5_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 4);
-
-SENSOR_TEMPLATE_2(pwm_auto_point6_pwm, "pwm%d_auto_point6_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 5);
-SENSOR_TEMPLATE_2(pwm_auto_point6_temp, "pwm%d_auto_point6_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 5);
-
-SENSOR_TEMPLATE_2(pwm_auto_point7_pwm, "pwm%d_auto_point7_pwm",
-		  S_IWUSR | S_IRUGO, show_auto_pwm, store_auto_pwm, 0, 6);
-SENSOR_TEMPLATE_2(pwm_auto_point7_temp, "pwm%d_auto_point7_temp",
-		  S_IWUSR | S_IRUGO, show_auto_temp, store_auto_temp, 0, 6);
-
-/*
- * nct6775_pwm_is_visible uses the index into the following array
- * to determine if attributes should be created or not.
- * Any change in order or content must be matched.
- */
-static struct sensor_device_template *nct6775_attributes_pwm_template[] = {
-	&sensor_dev_template_pwm,
-	&sensor_dev_template_pwm_mode,
-	&sensor_dev_template_pwm_enable,
-	&sensor_dev_template_pwm_temp_sel,
-	&sensor_dev_template_pwm_temp_tolerance,
-	&sensor_dev_template_pwm_crit_temp_tolerance,
-	&sensor_dev_template_pwm_target_temp,
-	&sensor_dev_template_fan_target,
-	&sensor_dev_template_fan_tolerance,
-	&sensor_dev_template_pwm_stop_time,
-	&sensor_dev_template_pwm_step_up_time,
-	&sensor_dev_template_pwm_step_down_time,
-	&sensor_dev_template_pwm_start,
-	&sensor_dev_template_pwm_floor,
-	&sensor_dev_template_pwm_weight_temp_sel,	/* 14 */
-	&sensor_dev_template_pwm_weight_temp_step,
-	&sensor_dev_template_pwm_weight_temp_step_tol,
-	&sensor_dev_template_pwm_weight_temp_step_base,
-	&sensor_dev_template_pwm_weight_duty_step,	/* 18 */
-	&sensor_dev_template_pwm_max,			/* 19 */
-	&sensor_dev_template_pwm_step,			/* 20 */
-	&sensor_dev_template_pwm_weight_duty_base,	/* 21 */
-	&sensor_dev_template_pwm_auto_point1_pwm,	/* 22 */
-	&sensor_dev_template_pwm_auto_point1_temp,
-	&sensor_dev_template_pwm_auto_point2_pwm,
-	&sensor_dev_template_pwm_auto_point2_temp,
-	&sensor_dev_template_pwm_auto_point3_pwm,
-	&sensor_dev_template_pwm_auto_point3_temp,
-	&sensor_dev_template_pwm_auto_point4_pwm,
-	&sensor_dev_template_pwm_auto_point4_temp,
-	&sensor_dev_template_pwm_auto_point5_pwm,
-	&sensor_dev_template_pwm_auto_point5_temp,
-	&sensor_dev_template_pwm_auto_point6_pwm,
-	&sensor_dev_template_pwm_auto_point6_temp,
-	&sensor_dev_template_pwm_auto_point7_pwm,
-	&sensor_dev_template_pwm_auto_point7_temp,	/* 35 */
-
-	NULL
-};
-
-static const struct sensor_template_group nct6775_pwm_template_group = {
-	.templates = nct6775_attributes_pwm_template,
-	.is_visible = nct6775_pwm_is_visible,
-	.base = 1,
-};
-
-static ssize_t
-cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-
-	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
-}
-
-static DEVICE_ATTR_RO(cpu0_vid);
-
-/* Case open detection */
-
-static ssize_t
-clear_caseopen(struct device *dev, struct device_attribute *attr,
-	       const char *buf, size_t count)
-{
-	struct nct6775_data *data = dev_get_drvdata(dev);
-	struct nct6775_sio_data *sio_data = data->sio_data;
-	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
-	unsigned long val;
-	u8 reg;
-	int ret;
-
-	if (kstrtoul(buf, 10, &val) || val != 0)
-		return -EINVAL;
-
-	mutex_lock(&data->update_lock);
-
-	/*
-	 * Use CR registers to clear caseopen status.
-	 * The CR registers are the same for all chips, and not all chips
-	 * support clearing the caseopen status through "regular" registers.
-	 */
-	ret = sio_data->sio_enter(sio_data);
-	if (ret) {
-		count = ret;
-		goto error;
-	}
-
-	sio_data->sio_select(sio_data, NCT6775_LD_ACPI);
-	reg = sio_data->sio_inb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
-	reg |= NCT6775_CR_CASEOPEN_CLR_MASK[nr];
-	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
-	reg &= ~NCT6775_CR_CASEOPEN_CLR_MASK[nr];
-	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
-	sio_data->sio_exit(sio_data);
-
-	data->valid = false;	/* Force cache refresh */
-error:
-	mutex_unlock(&data->update_lock);
-	return count;
-}
-
-static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, show_alarm,
-			  clear_caseopen, INTRUSION_ALARM_BASE);
-static SENSOR_DEVICE_ATTR(intrusion1_alarm, S_IWUSR | S_IRUGO, show_alarm,
-			  clear_caseopen, INTRUSION_ALARM_BASE + 1);
-static SENSOR_DEVICE_ATTR(intrusion0_beep, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, INTRUSION_ALARM_BASE);
-static SENSOR_DEVICE_ATTR(intrusion1_beep, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, INTRUSION_ALARM_BASE + 1);
-static SENSOR_DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, show_beep,
-			  store_beep, BEEP_ENABLE_BASE);
-
-static umode_t nct6775_other_is_visible(struct kobject *kobj,
-					struct attribute *attr, int index)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct nct6775_data *data = dev_get_drvdata(dev);
-
-	if (index == 0 && !data->have_vid)
-		return 0;
+	mutex_lock(&data->update_lock);
+	data->bank = 0xff;		/* Force initial bank selection */
 
-	if (index == 1 || index == 2) {
-		if (data->ALARM_BITS[INTRUSION_ALARM_BASE + index - 1] < 0)
-			return 0;
-	}
+	err = sio_data->sio_enter(sio_data);
+	if (err)
+		goto abort;
 
-	if (index == 3 || index == 4) {
-		if (data->BEEP_BITS[INTRUSION_ALARM_BASE + index - 3] < 0)
-			return 0;
-	}
+	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
+	reg = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
+	if (reg != data->sio_reg_enable)
+		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, data->sio_reg_enable);
 
-	return nct6775_attr_mode(data, attr);
-}
+	if (data->kind == nct6791 || data->kind == nct6792 ||
+	    data->kind == nct6793 || data->kind == nct6795 ||
+	    data->kind == nct6796 || data->kind == nct6797 ||
+	    data->kind == nct6798)
+		nct6791_enable_io_mapping(sio_data);
 
-/*
- * nct6775_other_is_visible uses the index into the following array
- * to determine if attributes should be created or not.
- * Any change in order or content must be matched.
- */
-static struct attribute *nct6775_attributes_other[] = {
-	&dev_attr_cpu0_vid.attr,				/* 0 */
-	&sensor_dev_attr_intrusion0_alarm.dev_attr.attr,	/* 1 */
-	&sensor_dev_attr_intrusion1_alarm.dev_attr.attr,	/* 2 */
-	&sensor_dev_attr_intrusion0_beep.dev_attr.attr,		/* 3 */
-	&sensor_dev_attr_intrusion1_beep.dev_attr.attr,		/* 4 */
-	&sensor_dev_attr_beep_enable.dev_attr.attr,		/* 5 */
+	sio_data->sio_exit(sio_data);
 
-	NULL
-};
+	/* Restore limits */
+	for (i = 0; i < data->in_num; i++) {
+		if (!(data->have_in & BIT(i)))
+			continue;
 
-static const struct attribute_group nct6775_group_other = {
-	.attrs = nct6775_attributes_other,
-	.is_visible = nct6775_other_is_visible,
-};
+		err = nct6775_write_value(data, data->REG_IN_MINMAX[0][i], data->in[i][1]);
+		if (err)
+			goto abort;
+		err = nct6775_write_value(data, data->REG_IN_MINMAX[1][i], data->in[i][2]);
+		if (err)
+			goto abort;
+	}
 
-static inline int nct6775_init_device(struct nct6775_data *data)
-{
-	int i, err;
-	u16 tmp, diode;
+	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
+		if (!(data->has_fan_min & BIT(i)))
+			continue;
 
-	/* Start monitoring if needed */
-	if (data->REG_CONFIG) {
-		err = nct6775_read_value(data, data->REG_CONFIG, &tmp);
+		err = nct6775_write_value(data, data->REG_FAN_MIN[i], data->fan_min[i]);
 		if (err)
-			return err;
-		if (!(tmp & 0x01)) {
-			err = nct6775_write_value(data, data->REG_CONFIG, tmp | 0x01);
-			if (err)
-				return err;
-		}
+			goto abort;
 	}
 
-	/* Enable temperature sensors if needed */
 	for (i = 0; i < NUM_TEMP; i++) {
 		if (!(data->have_temp & BIT(i)))
 			continue;
-		if (!data->reg_temp_config[i])
-			continue;
-		err = nct6775_read_value(data, data->reg_temp_config[i], &tmp);
-		if (err)
-			return err;
-		if (tmp & 0x01) {
-			err = nct6775_write_value(data, data->reg_temp_config[i], tmp & 0xfe);
-			if (err)
-				return err;
-		}
+
+		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
+			if (data->reg_temp[j][i]) {
+				err = nct6775_write_temp(data, data->reg_temp[j][i],
+							 data->temp[j][i]);
+				if (err)
+					goto abort;
+			}
 	}
 
-	/* Enable VBAT monitoring if needed */
-	err = nct6775_read_value(data, data->REG_VBAT, &tmp);
+	/* Restore other settings */
+	err = nct6775_write_value(data, data->REG_VBAT, data->vbat);
 	if (err)
-		return err;
-	if (!(tmp & 0x01)) {
-		err = nct6775_write_value(data, data->REG_VBAT, tmp | 0x01);
+		goto abort;
+	if (data->kind == nct6775) {
+		err = nct6775_write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
 		if (err)
-			return err;
+			goto abort;
+		err = nct6775_write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
 	}
 
-	err = nct6775_read_value(data, data->REG_DIODE, &diode);
-	if (err)
-		return err;
-
-	for (i = 0; i < data->temp_fixed_num; i++) {
-		if (!(data->have_temp_fixed & BIT(i)))
-			continue;
-		if ((tmp & (data->DIODE_MASK << i)))	/* diode */
-			data->temp_type[i]
-			  = 3 - ((diode >> i) & data->DIODE_MASK);
-		else				/* thermistor */
-			data->temp_type[i] = 4;
-	}
+abort:
+	/* Force re-reading all values */
+	data->valid = false;
+	mutex_unlock(&data->update_lock);
 
-	return 0;
+	return err;
 }
 
+static SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
+
 static void
 nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio_data)
 {
@@ -4272,832 +690,121 @@ nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio
 		(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
 }
 
-static int add_temp_sensors(struct nct6775_data *data, const u16 *regp,
-			    int *available, int *mask)
+static ssize_t
+cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	int i, err;
-	u16 src;
-
-	for (i = 0; i < data->pwm_num && *available; i++) {
-		int index;
-
-		if (!regp[i])
-			continue;
-		err = nct6775_read_value(data, regp[i], &src);
-		if (err)
-			return err;
-		src &= 0x1f;
-		if (!src || (*mask & BIT(src)))
-			continue;
-		if (!(data->temp_mask & BIT(src)))
-			continue;
-
-		index = __ffs(*available);
-		err = nct6775_write_value(data, data->REG_TEMP_SOURCE[index], src);
-		if (err)
-			return err;
-		*available &= ~BIT(index);
-		*mask |= BIT(src);
-	}
+	struct nct6775_data *data = dev_get_drvdata(dev);
 
-	return 0;
+	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
 
-static const struct regmap_config nct6775_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 16,
-	.reg_read = nct6775_reg_read,
-	.reg_write = nct6775_reg_write,
-};
-
-static const struct regmap_config nct6775_wmi_regmap_config = {
-	.reg_bits = 16,
-	.val_bits = 16,
-	.reg_read = nct6775_wmi_reg_read,
-	.reg_write = nct6775_wmi_reg_write,
-};
-
-static int nct6775_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
-	struct nct6775_data *data;
-	struct resource *res;
-	int i, s, err = 0;
-	int mask, available;
-	u16 src;
-	const u16 *reg_temp, *reg_temp_over, *reg_temp_hyst, *reg_temp_config;
-	const u16 *reg_temp_mon, *reg_temp_alternate, *reg_temp_crit;
-	const u16 *reg_temp_crit_l = NULL, *reg_temp_crit_h = NULL;
-	int num_reg_temp, num_reg_temp_mon, num_reg_tsi_temp;
-	u8 cr2a;
-	struct device *hwmon_dev;
-	struct sensor_template_group tsi_temp_tg;
-	const struct regmap_config *regmapcfg;
-
-	if (sio_data->access == access_direct) {
-		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
-		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
-					 DRVNAME))
-			return -EBUSY;
-	}
-
-	data = devm_kzalloc(&pdev->dev, sizeof(struct nct6775_data),
-			    GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	data->kind = sio_data->kind;
-	data->sio_data = sio_data;
-
-	if (sio_data->access == access_direct) {
-		data->addr = res->start;
-		regmapcfg = &nct6775_regmap_config;
-	} else {
-		regmapcfg = &nct6775_wmi_regmap_config;
-	}
-
-	data->regmap = devm_regmap_init(dev, NULL, data, regmapcfg);
-	if (IS_ERR(data->regmap))
-		return PTR_ERR(data->regmap);
-
-	mutex_init(&data->update_lock);
-	data->name = nct6775_device_names[data->kind];
-	data->bank = 0xff;		/* Force initial bank selection */
-	platform_set_drvdata(pdev, data);
-
-	switch (data->kind) {
-	case nct6106:
-		data->in_num = 9;
-		data->pwm_num = 3;
-		data->auto_pwm_num = 4;
-		data->temp_fixed_num = 3;
-		data->num_temp_alarms = 6;
-		data->num_temp_beeps = 6;
-
-		data->fan_from_reg = fan_from_reg13;
-		data->fan_from_reg_min = fan_from_reg13;
-
-		data->temp_label = nct6776_temp_label;
-		data->temp_mask = NCT6776_TEMP_MASK;
-		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
-
-		data->REG_VBAT = NCT6106_REG_VBAT;
-		data->REG_DIODE = NCT6106_REG_DIODE;
-		data->DIODE_MASK = NCT6106_DIODE_MASK;
-		data->REG_VIN = NCT6106_REG_IN;
-		data->REG_IN_MINMAX[0] = NCT6106_REG_IN_MIN;
-		data->REG_IN_MINMAX[1] = NCT6106_REG_IN_MAX;
-		data->REG_TARGET = NCT6106_REG_TARGET;
-		data->REG_FAN = NCT6106_REG_FAN;
-		data->REG_FAN_MODE = NCT6106_REG_FAN_MODE;
-		data->REG_FAN_MIN = NCT6106_REG_FAN_MIN;
-		data->REG_FAN_PULSES = NCT6106_REG_FAN_PULSES;
-		data->FAN_PULSE_SHIFT = NCT6106_FAN_PULSE_SHIFT;
-		data->REG_FAN_TIME[0] = NCT6106_REG_FAN_STOP_TIME;
-		data->REG_FAN_TIME[1] = NCT6106_REG_FAN_STEP_UP_TIME;
-		data->REG_FAN_TIME[2] = NCT6106_REG_FAN_STEP_DOWN_TIME;
-		data->REG_TOLERANCE_H = NCT6106_REG_TOLERANCE_H;
-		data->REG_PWM[0] = NCT6116_REG_PWM;
-		data->REG_PWM[1] = NCT6106_REG_FAN_START_OUTPUT;
-		data->REG_PWM[2] = NCT6106_REG_FAN_STOP_OUTPUT;
-		data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
-		data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
-		data->REG_PWM_READ = NCT6106_REG_PWM_READ;
-		data->REG_PWM_MODE = NCT6106_REG_PWM_MODE;
-		data->PWM_MODE_MASK = NCT6106_PWM_MODE_MASK;
-		data->REG_AUTO_TEMP = NCT6106_REG_AUTO_TEMP;
-		data->REG_AUTO_PWM = NCT6106_REG_AUTO_PWM;
-		data->REG_CRITICAL_TEMP = NCT6106_REG_CRITICAL_TEMP;
-		data->REG_CRITICAL_TEMP_TOLERANCE
-		  = NCT6106_REG_CRITICAL_TEMP_TOLERANCE;
-		data->REG_CRITICAL_PWM_ENABLE = NCT6106_REG_CRITICAL_PWM_ENABLE;
-		data->CRITICAL_PWM_ENABLE_MASK
-		  = NCT6106_CRITICAL_PWM_ENABLE_MASK;
-		data->REG_CRITICAL_PWM = NCT6106_REG_CRITICAL_PWM;
-		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6106_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
-		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
-		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
-		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
-		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
-		data->REG_ALARM = NCT6106_REG_ALARM;
-		data->ALARM_BITS = NCT6106_ALARM_BITS;
-		data->REG_BEEP = NCT6106_REG_BEEP;
-		data->BEEP_BITS = NCT6106_BEEP_BITS;
-		data->REG_TSI_TEMP = NCT6106_REG_TSI_TEMP;
-
-		reg_temp = NCT6106_REG_TEMP;
-		reg_temp_mon = NCT6106_REG_TEMP_MON;
-		num_reg_temp = ARRAY_SIZE(NCT6106_REG_TEMP);
-		num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
-		num_reg_tsi_temp = ARRAY_SIZE(NCT6106_REG_TSI_TEMP);
-		reg_temp_over = NCT6106_REG_TEMP_OVER;
-		reg_temp_hyst = NCT6106_REG_TEMP_HYST;
-		reg_temp_config = NCT6106_REG_TEMP_CONFIG;
-		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
-		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
-		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
-		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
-
-		break;
-	case nct6116:
-		data->in_num = 9;
-		data->pwm_num = 3;
-		data->auto_pwm_num = 4;
-		data->temp_fixed_num = 3;
-		data->num_temp_alarms = 3;
-		data->num_temp_beeps = 3;
-
-		data->fan_from_reg = fan_from_reg13;
-		data->fan_from_reg_min = fan_from_reg13;
-
-		data->temp_label = nct6776_temp_label;
-		data->temp_mask = NCT6776_TEMP_MASK;
-		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
-
-		data->REG_VBAT = NCT6106_REG_VBAT;
-		data->REG_DIODE = NCT6106_REG_DIODE;
-		data->DIODE_MASK = NCT6106_DIODE_MASK;
-		data->REG_VIN = NCT6106_REG_IN;
-		data->REG_IN_MINMAX[0] = NCT6106_REG_IN_MIN;
-		data->REG_IN_MINMAX[1] = NCT6106_REG_IN_MAX;
-		data->REG_TARGET = NCT6116_REG_TARGET;
-		data->REG_FAN = NCT6116_REG_FAN;
-		data->REG_FAN_MODE = NCT6116_REG_FAN_MODE;
-		data->REG_FAN_MIN = NCT6116_REG_FAN_MIN;
-		data->REG_FAN_PULSES = NCT6116_REG_FAN_PULSES;
-		data->FAN_PULSE_SHIFT = NCT6116_FAN_PULSE_SHIFT;
-		data->REG_FAN_TIME[0] = NCT6116_REG_FAN_STOP_TIME;
-		data->REG_FAN_TIME[1] = NCT6116_REG_FAN_STEP_UP_TIME;
-		data->REG_FAN_TIME[2] = NCT6116_REG_FAN_STEP_DOWN_TIME;
-		data->REG_TOLERANCE_H = NCT6116_REG_TOLERANCE_H;
-		data->REG_PWM[0] = NCT6116_REG_PWM;
-		data->REG_PWM[1] = NCT6116_REG_FAN_START_OUTPUT;
-		data->REG_PWM[2] = NCT6116_REG_FAN_STOP_OUTPUT;
-		data->REG_PWM[5] = NCT6106_REG_WEIGHT_DUTY_STEP;
-		data->REG_PWM[6] = NCT6106_REG_WEIGHT_DUTY_BASE;
-		data->REG_PWM_READ = NCT6106_REG_PWM_READ;
-		data->REG_PWM_MODE = NCT6106_REG_PWM_MODE;
-		data->PWM_MODE_MASK = NCT6106_PWM_MODE_MASK;
-		data->REG_AUTO_TEMP = NCT6116_REG_AUTO_TEMP;
-		data->REG_AUTO_PWM = NCT6116_REG_AUTO_PWM;
-		data->REG_CRITICAL_TEMP = NCT6116_REG_CRITICAL_TEMP;
-		data->REG_CRITICAL_TEMP_TOLERANCE
-		  = NCT6116_REG_CRITICAL_TEMP_TOLERANCE;
-		data->REG_CRITICAL_PWM_ENABLE = NCT6116_REG_CRITICAL_PWM_ENABLE;
-		data->CRITICAL_PWM_ENABLE_MASK
-		  = NCT6106_CRITICAL_PWM_ENABLE_MASK;
-		data->REG_CRITICAL_PWM = NCT6116_REG_CRITICAL_PWM;
-		data->REG_TEMP_OFFSET = NCT6106_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6116_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL = NCT6116_REG_TEMP_SEL;
-		data->REG_WEIGHT_TEMP_SEL = NCT6106_REG_WEIGHT_TEMP_SEL;
-		data->REG_WEIGHT_TEMP[0] = NCT6106_REG_WEIGHT_TEMP_STEP;
-		data->REG_WEIGHT_TEMP[1] = NCT6106_REG_WEIGHT_TEMP_STEP_TOL;
-		data->REG_WEIGHT_TEMP[2] = NCT6106_REG_WEIGHT_TEMP_BASE;
-		data->REG_ALARM = NCT6106_REG_ALARM;
-		data->ALARM_BITS = NCT6116_ALARM_BITS;
-		data->REG_BEEP = NCT6106_REG_BEEP;
-		data->BEEP_BITS = NCT6116_BEEP_BITS;
-		data->REG_TSI_TEMP = NCT6116_REG_TSI_TEMP;
-
-		reg_temp = NCT6106_REG_TEMP;
-		reg_temp_mon = NCT6106_REG_TEMP_MON;
-		num_reg_temp = ARRAY_SIZE(NCT6106_REG_TEMP);
-		num_reg_temp_mon = ARRAY_SIZE(NCT6106_REG_TEMP_MON);
-		num_reg_tsi_temp = ARRAY_SIZE(NCT6116_REG_TSI_TEMP);
-		reg_temp_over = NCT6106_REG_TEMP_OVER;
-		reg_temp_hyst = NCT6106_REG_TEMP_HYST;
-		reg_temp_config = NCT6106_REG_TEMP_CONFIG;
-		reg_temp_alternate = NCT6106_REG_TEMP_ALTERNATE;
-		reg_temp_crit = NCT6106_REG_TEMP_CRIT;
-		reg_temp_crit_l = NCT6106_REG_TEMP_CRIT_L;
-		reg_temp_crit_h = NCT6106_REG_TEMP_CRIT_H;
-
-		break;
-	case nct6775:
-		data->in_num = 9;
-		data->pwm_num = 3;
-		data->auto_pwm_num = 6;
-		data->has_fan_div = true;
-		data->temp_fixed_num = 3;
-		data->num_temp_alarms = 3;
-		data->num_temp_beeps = 3;
-
-		data->ALARM_BITS = NCT6775_ALARM_BITS;
-		data->BEEP_BITS = NCT6775_BEEP_BITS;
-
-		data->fan_from_reg = fan_from_reg16;
-		data->fan_from_reg_min = fan_from_reg8;
-		data->target_temp_mask = 0x7f;
-		data->tolerance_mask = 0x0f;
-		data->speed_tolerance_limit = 15;
-
-		data->temp_label = nct6775_temp_label;
-		data->temp_mask = NCT6775_TEMP_MASK;
-		data->virt_temp_mask = NCT6775_VIRT_TEMP_MASK;
-
-		data->REG_CONFIG = NCT6775_REG_CONFIG;
-		data->REG_VBAT = NCT6775_REG_VBAT;
-		data->REG_DIODE = NCT6775_REG_DIODE;
-		data->DIODE_MASK = NCT6775_DIODE_MASK;
-		data->REG_VIN = NCT6775_REG_IN;
-		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
-		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6775_REG_FAN;
-		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
-		data->REG_FAN_MIN = NCT6775_REG_FAN_MIN;
-		data->REG_FAN_PULSES = NCT6775_REG_FAN_PULSES;
-		data->FAN_PULSE_SHIFT = NCT6775_FAN_PULSE_SHIFT;
-		data->REG_FAN_TIME[0] = NCT6775_REG_FAN_STOP_TIME;
-		data->REG_FAN_TIME[1] = NCT6775_REG_FAN_STEP_UP_TIME;
-		data->REG_FAN_TIME[2] = NCT6775_REG_FAN_STEP_DOWN_TIME;
-		data->REG_PWM[0] = NCT6775_REG_PWM;
-		data->REG_PWM[1] = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_PWM[2] = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_PWM[3] = NCT6775_REG_FAN_MAX_OUTPUT;
-		data->REG_PWM[4] = NCT6775_REG_FAN_STEP_OUTPUT;
-		data->REG_PWM[5] = NCT6775_REG_WEIGHT_DUTY_STEP;
-		data->REG_PWM_READ = NCT6775_REG_PWM_READ;
-		data->REG_PWM_MODE = NCT6775_REG_PWM_MODE;
-		data->PWM_MODE_MASK = NCT6775_PWM_MODE_MASK;
-		data->REG_AUTO_TEMP = NCT6775_REG_AUTO_TEMP;
-		data->REG_AUTO_PWM = NCT6775_REG_AUTO_PWM;
-		data->REG_CRITICAL_TEMP = NCT6775_REG_CRITICAL_TEMP;
-		data->REG_CRITICAL_TEMP_TOLERANCE
-		  = NCT6775_REG_CRITICAL_TEMP_TOLERANCE;
-		data->REG_TEMP_OFFSET = NCT6775_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6775_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL = NCT6775_REG_TEMP_SEL;
-		data->REG_WEIGHT_TEMP_SEL = NCT6775_REG_WEIGHT_TEMP_SEL;
-		data->REG_WEIGHT_TEMP[0] = NCT6775_REG_WEIGHT_TEMP_STEP;
-		data->REG_WEIGHT_TEMP[1] = NCT6775_REG_WEIGHT_TEMP_STEP_TOL;
-		data->REG_WEIGHT_TEMP[2] = NCT6775_REG_WEIGHT_TEMP_BASE;
-		data->REG_ALARM = NCT6775_REG_ALARM;
-		data->REG_BEEP = NCT6775_REG_BEEP;
-		data->REG_TSI_TEMP = NCT6775_REG_TSI_TEMP;
-
-		reg_temp = NCT6775_REG_TEMP;
-		reg_temp_mon = NCT6775_REG_TEMP_MON;
-		num_reg_temp = ARRAY_SIZE(NCT6775_REG_TEMP);
-		num_reg_temp_mon = ARRAY_SIZE(NCT6775_REG_TEMP_MON);
-		num_reg_tsi_temp = ARRAY_SIZE(NCT6775_REG_TSI_TEMP);
-		reg_temp_over = NCT6775_REG_TEMP_OVER;
-		reg_temp_hyst = NCT6775_REG_TEMP_HYST;
-		reg_temp_config = NCT6775_REG_TEMP_CONFIG;
-		reg_temp_alternate = NCT6775_REG_TEMP_ALTERNATE;
-		reg_temp_crit = NCT6775_REG_TEMP_CRIT;
-
-		break;
-	case nct6776:
-		data->in_num = 9;
-		data->pwm_num = 3;
-		data->auto_pwm_num = 4;
-		data->has_fan_div = false;
-		data->temp_fixed_num = 3;
-		data->num_temp_alarms = 3;
-		data->num_temp_beeps = 6;
-
-		data->ALARM_BITS = NCT6776_ALARM_BITS;
-		data->BEEP_BITS = NCT6776_BEEP_BITS;
-
-		data->fan_from_reg = fan_from_reg13;
-		data->fan_from_reg_min = fan_from_reg13;
-		data->target_temp_mask = 0xff;
-		data->tolerance_mask = 0x07;
-		data->speed_tolerance_limit = 63;
-
-		data->temp_label = nct6776_temp_label;
-		data->temp_mask = NCT6776_TEMP_MASK;
-		data->virt_temp_mask = NCT6776_VIRT_TEMP_MASK;
-
-		data->REG_CONFIG = NCT6775_REG_CONFIG;
-		data->REG_VBAT = NCT6775_REG_VBAT;
-		data->REG_DIODE = NCT6775_REG_DIODE;
-		data->DIODE_MASK = NCT6775_DIODE_MASK;
-		data->REG_VIN = NCT6775_REG_IN;
-		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
-		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6775_REG_FAN;
-		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
-		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
-		data->REG_FAN_PULSES = NCT6776_REG_FAN_PULSES;
-		data->FAN_PULSE_SHIFT = NCT6775_FAN_PULSE_SHIFT;
-		data->REG_FAN_TIME[0] = NCT6775_REG_FAN_STOP_TIME;
-		data->REG_FAN_TIME[1] = NCT6776_REG_FAN_STEP_UP_TIME;
-		data->REG_FAN_TIME[2] = NCT6776_REG_FAN_STEP_DOWN_TIME;
-		data->REG_TOLERANCE_H = NCT6776_REG_TOLERANCE_H;
-		data->REG_PWM[0] = NCT6775_REG_PWM;
-		data->REG_PWM[1] = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_PWM[2] = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_PWM[5] = NCT6775_REG_WEIGHT_DUTY_STEP;
-		data->REG_PWM[6] = NCT6776_REG_WEIGHT_DUTY_BASE;
-		data->REG_PWM_READ = NCT6775_REG_PWM_READ;
-		data->REG_PWM_MODE = NCT6776_REG_PWM_MODE;
-		data->PWM_MODE_MASK = NCT6776_PWM_MODE_MASK;
-		data->REG_AUTO_TEMP = NCT6775_REG_AUTO_TEMP;
-		data->REG_AUTO_PWM = NCT6775_REG_AUTO_PWM;
-		data->REG_CRITICAL_TEMP = NCT6775_REG_CRITICAL_TEMP;
-		data->REG_CRITICAL_TEMP_TOLERANCE
-		  = NCT6775_REG_CRITICAL_TEMP_TOLERANCE;
-		data->REG_TEMP_OFFSET = NCT6775_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6775_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL = NCT6775_REG_TEMP_SEL;
-		data->REG_WEIGHT_TEMP_SEL = NCT6775_REG_WEIGHT_TEMP_SEL;
-		data->REG_WEIGHT_TEMP[0] = NCT6775_REG_WEIGHT_TEMP_STEP;
-		data->REG_WEIGHT_TEMP[1] = NCT6775_REG_WEIGHT_TEMP_STEP_TOL;
-		data->REG_WEIGHT_TEMP[2] = NCT6775_REG_WEIGHT_TEMP_BASE;
-		data->REG_ALARM = NCT6775_REG_ALARM;
-		data->REG_BEEP = NCT6776_REG_BEEP;
-		data->REG_TSI_TEMP = NCT6776_REG_TSI_TEMP;
-
-		reg_temp = NCT6775_REG_TEMP;
-		reg_temp_mon = NCT6775_REG_TEMP_MON;
-		num_reg_temp = ARRAY_SIZE(NCT6775_REG_TEMP);
-		num_reg_temp_mon = ARRAY_SIZE(NCT6775_REG_TEMP_MON);
-		num_reg_tsi_temp = ARRAY_SIZE(NCT6776_REG_TSI_TEMP);
-		reg_temp_over = NCT6775_REG_TEMP_OVER;
-		reg_temp_hyst = NCT6775_REG_TEMP_HYST;
-		reg_temp_config = NCT6776_REG_TEMP_CONFIG;
-		reg_temp_alternate = NCT6776_REG_TEMP_ALTERNATE;
-		reg_temp_crit = NCT6776_REG_TEMP_CRIT;
-
-		break;
-	case nct6779:
-		data->in_num = 15;
-		data->pwm_num = 5;
-		data->auto_pwm_num = 4;
-		data->has_fan_div = false;
-		data->temp_fixed_num = 6;
-		data->num_temp_alarms = 2;
-		data->num_temp_beeps = 2;
-
-		data->ALARM_BITS = NCT6779_ALARM_BITS;
-		data->BEEP_BITS = NCT6779_BEEP_BITS;
-
-		data->fan_from_reg = fan_from_reg_rpm;
-		data->fan_from_reg_min = fan_from_reg13;
-		data->target_temp_mask = 0xff;
-		data->tolerance_mask = 0x07;
-		data->speed_tolerance_limit = 63;
-
-		data->temp_label = nct6779_temp_label;
-		data->temp_mask = NCT6779_TEMP_MASK;
-		data->virt_temp_mask = NCT6779_VIRT_TEMP_MASK;
-
-		data->REG_CONFIG = NCT6775_REG_CONFIG;
-		data->REG_VBAT = NCT6775_REG_VBAT;
-		data->REG_DIODE = NCT6775_REG_DIODE;
-		data->DIODE_MASK = NCT6775_DIODE_MASK;
-		data->REG_VIN = NCT6779_REG_IN;
-		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
-		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6779_REG_FAN;
-		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
-		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
-		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
-		data->FAN_PULSE_SHIFT = NCT6775_FAN_PULSE_SHIFT;
-		data->REG_FAN_TIME[0] = NCT6775_REG_FAN_STOP_TIME;
-		data->REG_FAN_TIME[1] = NCT6776_REG_FAN_STEP_UP_TIME;
-		data->REG_FAN_TIME[2] = NCT6776_REG_FAN_STEP_DOWN_TIME;
-		data->REG_TOLERANCE_H = NCT6776_REG_TOLERANCE_H;
-		data->REG_PWM[0] = NCT6775_REG_PWM;
-		data->REG_PWM[1] = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_PWM[2] = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_PWM[5] = NCT6775_REG_WEIGHT_DUTY_STEP;
-		data->REG_PWM[6] = NCT6776_REG_WEIGHT_DUTY_BASE;
-		data->REG_PWM_READ = NCT6775_REG_PWM_READ;
-		data->REG_PWM_MODE = NCT6776_REG_PWM_MODE;
-		data->PWM_MODE_MASK = NCT6776_PWM_MODE_MASK;
-		data->REG_AUTO_TEMP = NCT6775_REG_AUTO_TEMP;
-		data->REG_AUTO_PWM = NCT6775_REG_AUTO_PWM;
-		data->REG_CRITICAL_TEMP = NCT6775_REG_CRITICAL_TEMP;
-		data->REG_CRITICAL_TEMP_TOLERANCE
-		  = NCT6775_REG_CRITICAL_TEMP_TOLERANCE;
-		data->REG_CRITICAL_PWM_ENABLE = NCT6779_REG_CRITICAL_PWM_ENABLE;
-		data->CRITICAL_PWM_ENABLE_MASK
-		  = NCT6779_CRITICAL_PWM_ENABLE_MASK;
-		data->REG_CRITICAL_PWM = NCT6779_REG_CRITICAL_PWM;
-		data->REG_TEMP_OFFSET = NCT6779_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6775_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL = NCT6775_REG_TEMP_SEL;
-		data->REG_WEIGHT_TEMP_SEL = NCT6775_REG_WEIGHT_TEMP_SEL;
-		data->REG_WEIGHT_TEMP[0] = NCT6775_REG_WEIGHT_TEMP_STEP;
-		data->REG_WEIGHT_TEMP[1] = NCT6775_REG_WEIGHT_TEMP_STEP_TOL;
-		data->REG_WEIGHT_TEMP[2] = NCT6775_REG_WEIGHT_TEMP_BASE;
-		data->REG_ALARM = NCT6779_REG_ALARM;
-		data->REG_BEEP = NCT6776_REG_BEEP;
-		data->REG_TSI_TEMP = NCT6776_REG_TSI_TEMP;
-
-		reg_temp = NCT6779_REG_TEMP;
-		reg_temp_mon = NCT6779_REG_TEMP_MON;
-		num_reg_temp = ARRAY_SIZE(NCT6779_REG_TEMP);
-		num_reg_temp_mon = ARRAY_SIZE(NCT6779_REG_TEMP_MON);
-		num_reg_tsi_temp = ARRAY_SIZE(NCT6776_REG_TSI_TEMP);
-		reg_temp_over = NCT6779_REG_TEMP_OVER;
-		reg_temp_hyst = NCT6779_REG_TEMP_HYST;
-		reg_temp_config = NCT6779_REG_TEMP_CONFIG;
-		reg_temp_alternate = NCT6779_REG_TEMP_ALTERNATE;
-		reg_temp_crit = NCT6779_REG_TEMP_CRIT;
-
-		break;
-	case nct6791:
-	case nct6792:
-	case nct6793:
-	case nct6795:
-	case nct6796:
-	case nct6797:
-	case nct6798:
-		data->in_num = 15;
-		data->pwm_num = (data->kind == nct6796 ||
-				 data->kind == nct6797 ||
-				 data->kind == nct6798) ? 7 : 6;
-		data->auto_pwm_num = 4;
-		data->has_fan_div = false;
-		data->temp_fixed_num = 6;
-		data->num_temp_alarms = 2;
-		data->num_temp_beeps = 2;
-
-		data->ALARM_BITS = NCT6791_ALARM_BITS;
-		data->BEEP_BITS = NCT6779_BEEP_BITS;
-
-		data->fan_from_reg = fan_from_reg_rpm;
-		data->fan_from_reg_min = fan_from_reg13;
-		data->target_temp_mask = 0xff;
-		data->tolerance_mask = 0x07;
-		data->speed_tolerance_limit = 63;
-
-		switch (data->kind) {
-		default:
-		case nct6791:
-			data->temp_label = nct6779_temp_label;
-			data->temp_mask = NCT6791_TEMP_MASK;
-			data->virt_temp_mask = NCT6791_VIRT_TEMP_MASK;
-			break;
-		case nct6792:
-			data->temp_label = nct6792_temp_label;
-			data->temp_mask = NCT6792_TEMP_MASK;
-			data->virt_temp_mask = NCT6792_VIRT_TEMP_MASK;
-			break;
-		case nct6793:
-			data->temp_label = nct6793_temp_label;
-			data->temp_mask = NCT6793_TEMP_MASK;
-			data->virt_temp_mask = NCT6793_VIRT_TEMP_MASK;
-			break;
-		case nct6795:
-		case nct6797:
-			data->temp_label = nct6795_temp_label;
-			data->temp_mask = NCT6795_TEMP_MASK;
-			data->virt_temp_mask = NCT6795_VIRT_TEMP_MASK;
-			break;
-		case nct6796:
-			data->temp_label = nct6796_temp_label;
-			data->temp_mask = NCT6796_TEMP_MASK;
-			data->virt_temp_mask = NCT6796_VIRT_TEMP_MASK;
-			break;
-		case nct6798:
-			data->temp_label = nct6798_temp_label;
-			data->temp_mask = NCT6798_TEMP_MASK;
-			data->virt_temp_mask = NCT6798_VIRT_TEMP_MASK;
-			break;
-		}
-
-		data->REG_CONFIG = NCT6775_REG_CONFIG;
-		data->REG_VBAT = NCT6775_REG_VBAT;
-		data->REG_DIODE = NCT6775_REG_DIODE;
-		data->DIODE_MASK = NCT6775_DIODE_MASK;
-		data->REG_VIN = NCT6779_REG_IN;
-		data->REG_IN_MINMAX[0] = NCT6775_REG_IN_MIN;
-		data->REG_IN_MINMAX[1] = NCT6775_REG_IN_MAX;
-		data->REG_TARGET = NCT6775_REG_TARGET;
-		data->REG_FAN = NCT6779_REG_FAN;
-		data->REG_FAN_MODE = NCT6775_REG_FAN_MODE;
-		data->REG_FAN_MIN = NCT6776_REG_FAN_MIN;
-		data->REG_FAN_PULSES = NCT6779_REG_FAN_PULSES;
-		data->FAN_PULSE_SHIFT = NCT6775_FAN_PULSE_SHIFT;
-		data->REG_FAN_TIME[0] = NCT6775_REG_FAN_STOP_TIME;
-		data->REG_FAN_TIME[1] = NCT6776_REG_FAN_STEP_UP_TIME;
-		data->REG_FAN_TIME[2] = NCT6776_REG_FAN_STEP_DOWN_TIME;
-		data->REG_TOLERANCE_H = NCT6776_REG_TOLERANCE_H;
-		data->REG_PWM[0] = NCT6775_REG_PWM;
-		data->REG_PWM[1] = NCT6775_REG_FAN_START_OUTPUT;
-		data->REG_PWM[2] = NCT6775_REG_FAN_STOP_OUTPUT;
-		data->REG_PWM[5] = NCT6791_REG_WEIGHT_DUTY_STEP;
-		data->REG_PWM[6] = NCT6791_REG_WEIGHT_DUTY_BASE;
-		data->REG_PWM_READ = NCT6775_REG_PWM_READ;
-		data->REG_PWM_MODE = NCT6776_REG_PWM_MODE;
-		data->PWM_MODE_MASK = NCT6776_PWM_MODE_MASK;
-		data->REG_AUTO_TEMP = NCT6775_REG_AUTO_TEMP;
-		data->REG_AUTO_PWM = NCT6775_REG_AUTO_PWM;
-		data->REG_CRITICAL_TEMP = NCT6775_REG_CRITICAL_TEMP;
-		data->REG_CRITICAL_TEMP_TOLERANCE
-		  = NCT6775_REG_CRITICAL_TEMP_TOLERANCE;
-		data->REG_CRITICAL_PWM_ENABLE = NCT6779_REG_CRITICAL_PWM_ENABLE;
-		data->CRITICAL_PWM_ENABLE_MASK
-		  = NCT6779_CRITICAL_PWM_ENABLE_MASK;
-		data->REG_CRITICAL_PWM = NCT6779_REG_CRITICAL_PWM;
-		data->REG_TEMP_OFFSET = NCT6779_REG_TEMP_OFFSET;
-		data->REG_TEMP_SOURCE = NCT6775_REG_TEMP_SOURCE;
-		data->REG_TEMP_SEL = NCT6775_REG_TEMP_SEL;
-		data->REG_WEIGHT_TEMP_SEL = NCT6791_REG_WEIGHT_TEMP_SEL;
-		data->REG_WEIGHT_TEMP[0] = NCT6791_REG_WEIGHT_TEMP_STEP;
-		data->REG_WEIGHT_TEMP[1] = NCT6791_REG_WEIGHT_TEMP_STEP_TOL;
-		data->REG_WEIGHT_TEMP[2] = NCT6791_REG_WEIGHT_TEMP_BASE;
-		data->REG_ALARM = NCT6791_REG_ALARM;
-		if (data->kind == nct6791)
-			data->REG_BEEP = NCT6776_REG_BEEP;
-		else
-			data->REG_BEEP = NCT6792_REG_BEEP;
-		switch (data->kind) {
-		case nct6791:
-		case nct6792:
-		case nct6793:
-			data->REG_TSI_TEMP = NCT6776_REG_TSI_TEMP;
-			num_reg_tsi_temp = ARRAY_SIZE(NCT6776_REG_TSI_TEMP);
-			break;
-		case nct6795:
-		case nct6796:
-		case nct6797:
-		case nct6798:
-			data->REG_TSI_TEMP = NCT6796_REG_TSI_TEMP;
-			num_reg_tsi_temp = ARRAY_SIZE(NCT6796_REG_TSI_TEMP);
-			break;
-		default:
-			num_reg_tsi_temp = 0;
-			break;
-		}
-
-		reg_temp = NCT6779_REG_TEMP;
-		num_reg_temp = ARRAY_SIZE(NCT6779_REG_TEMP);
-		if (data->kind == nct6791) {
-			reg_temp_mon = NCT6779_REG_TEMP_MON;
-			num_reg_temp_mon = ARRAY_SIZE(NCT6779_REG_TEMP_MON);
-		} else {
-			reg_temp_mon = NCT6792_REG_TEMP_MON;
-			num_reg_temp_mon = ARRAY_SIZE(NCT6792_REG_TEMP_MON);
-		}
-		reg_temp_over = NCT6779_REG_TEMP_OVER;
-		reg_temp_hyst = NCT6779_REG_TEMP_HYST;
-		reg_temp_config = NCT6779_REG_TEMP_CONFIG;
-		reg_temp_alternate = NCT6779_REG_TEMP_ALTERNATE;
-		reg_temp_crit = NCT6779_REG_TEMP_CRIT;
-
-		break;
-	default:
-		return -ENODEV;
-	}
-	data->have_in = BIT(data->in_num) - 1;
-	data->have_temp = 0;
-
-	/*
-	 * On some boards, not all available temperature sources are monitored,
-	 * even though some of the monitoring registers are unused.
-	 * Get list of unused monitoring registers, then detect if any fan
-	 * controls are configured to use unmonitored temperature sources.
-	 * If so, assign the unmonitored temperature sources to available
-	 * monitoring registers.
-	 */
-	mask = 0;
-	available = 0;
-	for (i = 0; i < num_reg_temp; i++) {
-		if (reg_temp[i] == 0)
-			continue;
-
-		err = nct6775_read_value(data, data->REG_TEMP_SOURCE[i], &src);
-		if (err)
-			return err;
-		src &= 0x1f;
-		if (!src || (mask & BIT(src)))
-			available |= BIT(i);
-
-		mask |= BIT(src);
-	}
-
-	/*
-	 * Now find unmonitored temperature registers and enable monitoring
-	 * if additional monitoring registers are available.
-	 */
-	err = add_temp_sensors(data, data->REG_TEMP_SEL, &available, &mask);
-	if (err)
-		return err;
-	err = add_temp_sensors(data, data->REG_WEIGHT_TEMP_SEL, &available, &mask);
-	if (err)
-		return err;
-
-	mask = 0;
-	s = NUM_TEMP_FIXED;	/* First dynamic temperature attribute */
-	for (i = 0; i < num_reg_temp; i++) {
-		if (reg_temp[i] == 0)
-			continue;
+static DEVICE_ATTR_RO(cpu0_vid);
 
-		err = nct6775_read_value(data, data->REG_TEMP_SOURCE[i], &src);
-		if (err)
-			return err;
-		src &= 0x1f;
-		if (!src || (mask & BIT(src)))
-			continue;
+/* Case open detection */
 
-		if (!(data->temp_mask & BIT(src))) {
-			dev_info(dev,
-				 "Invalid temperature source %d at index %d, source register 0x%x, temp register 0x%x\n",
-				 src, i, data->REG_TEMP_SOURCE[i], reg_temp[i]);
-			continue;
-		}
+static const u8 NCT6775_REG_CR_CASEOPEN_CLR[] = { 0xe6, 0xee };
+static const u8 NCT6775_CR_CASEOPEN_CLR_MASK[] = { 0x20, 0x01 };
 
-		mask |= BIT(src);
-
-		/* Use fixed index for SYSTIN(1), CPUTIN(2), AUXTIN(3) */
-		if (src <= data->temp_fixed_num) {
-			data->have_temp |= BIT(src - 1);
-			data->have_temp_fixed |= BIT(src - 1);
-			data->reg_temp[0][src - 1] = reg_temp[i];
-			data->reg_temp[1][src - 1] = reg_temp_over[i];
-			data->reg_temp[2][src - 1] = reg_temp_hyst[i];
-			if (reg_temp_crit_h && reg_temp_crit_h[i])
-				data->reg_temp[3][src - 1] = reg_temp_crit_h[i];
-			else if (reg_temp_crit[src - 1])
-				data->reg_temp[3][src - 1]
-				  = reg_temp_crit[src - 1];
-			if (reg_temp_crit_l && reg_temp_crit_l[i])
-				data->reg_temp[4][src - 1] = reg_temp_crit_l[i];
-			data->reg_temp_config[src - 1] = reg_temp_config[i];
-			data->temp_src[src - 1] = src;
-			continue;
-		}
+static ssize_t
+clear_caseopen(struct device *dev, struct device_attribute *attr,
+	       const char *buf, size_t count)
+{
+	struct nct6775_data *data = dev_get_drvdata(dev);
+	struct nct6775_sio_data *sio_data = data->driver_data;
+	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
+	unsigned long val;
+	u8 reg;
+	int ret;
 
-		if (s >= NUM_TEMP)
-			continue;
+	if (kstrtoul(buf, 10, &val) || val != 0)
+		return -EINVAL;
 
-		/* Use dynamic index for other sources */
-		data->have_temp |= BIT(s);
-		data->reg_temp[0][s] = reg_temp[i];
-		data->reg_temp[1][s] = reg_temp_over[i];
-		data->reg_temp[2][s] = reg_temp_hyst[i];
-		data->reg_temp_config[s] = reg_temp_config[i];
-		if (reg_temp_crit_h && reg_temp_crit_h[i])
-			data->reg_temp[3][s] = reg_temp_crit_h[i];
-		else if (reg_temp_crit[src - 1])
-			data->reg_temp[3][s] = reg_temp_crit[src - 1];
-		if (reg_temp_crit_l && reg_temp_crit_l[i])
-			data->reg_temp[4][s] = reg_temp_crit_l[i];
-
-		data->temp_src[s] = src;
-		s++;
-	}
+	mutex_lock(&data->update_lock);
 
 	/*
-	 * Repeat with temperatures used for fan control.
-	 * This set of registers does not support limits.
+	 * Use CR registers to clear caseopen status.
+	 * The CR registers are the same for all chips, and not all chips
+	 * support clearing the caseopen status through "regular" registers.
 	 */
-	for (i = 0; i < num_reg_temp_mon; i++) {
-		if (reg_temp_mon[i] == 0)
-			continue;
+	ret = sio_data->sio_enter(sio_data);
+	if (ret) {
+		count = ret;
+		goto error;
+	}
 
-		err = nct6775_read_value(data, data->REG_TEMP_SEL[i], &src);
-		if (err)
-			return err;
-		src &= 0x1f;
-		if (!src)
-			continue;
+	sio_data->sio_select(sio_data, NCT6775_LD_ACPI);
+	reg = sio_data->sio_inb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
+	reg |= NCT6775_CR_CASEOPEN_CLR_MASK[nr];
+	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
+	reg &= ~NCT6775_CR_CASEOPEN_CLR_MASK[nr];
+	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
+	sio_data->sio_exit(sio_data);
 
-		if (!(data->temp_mask & BIT(src))) {
-			dev_info(dev,
-				 "Invalid temperature source %d at index %d, source register 0x%x, temp register 0x%x\n",
-				 src, i, data->REG_TEMP_SEL[i],
-				 reg_temp_mon[i]);
-			continue;
-		}
+	data->valid = false;	/* Force cache refresh */
+error:
+	mutex_unlock(&data->update_lock);
+	return count;
+}
 
-		/*
-		 * For virtual temperature sources, the 'virtual' temperature
-		 * for each fan reflects a different temperature, and there
-		 * are no duplicates.
-		 */
-		if (!(data->virt_temp_mask & BIT(src))) {
-			if (mask & BIT(src))
-				continue;
-			mask |= BIT(src);
-		}
+static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, nct6775_show_alarm,
+			  clear_caseopen, INTRUSION_ALARM_BASE);
+static SENSOR_DEVICE_ATTR(intrusion1_alarm, S_IWUSR | S_IRUGO, nct6775_show_alarm,
+			  clear_caseopen, INTRUSION_ALARM_BASE + 1);
+static SENSOR_DEVICE_ATTR(intrusion0_beep, S_IWUSR | S_IRUGO, nct6775_show_beep,
+			  nct6775_store_beep, INTRUSION_ALARM_BASE);
+static SENSOR_DEVICE_ATTR(intrusion1_beep, S_IWUSR | S_IRUGO, nct6775_show_beep,
+			  nct6775_store_beep, INTRUSION_ALARM_BASE + 1);
+static SENSOR_DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, nct6775_show_beep,
+			  nct6775_store_beep, BEEP_ENABLE_BASE);
 
-		/* Use fixed index for SYSTIN(1), CPUTIN(2), AUXTIN(3) */
-		if (src <= data->temp_fixed_num) {
-			if (data->have_temp & BIT(src - 1))
-				continue;
-			data->have_temp |= BIT(src - 1);
-			data->have_temp_fixed |= BIT(src - 1);
-			data->reg_temp[0][src - 1] = reg_temp_mon[i];
-			data->temp_src[src - 1] = src;
-			continue;
-		}
+static umode_t nct6775_other_is_visible(struct kobject *kobj,
+					struct attribute *attr, int index)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct nct6775_data *data = dev_get_drvdata(dev);
 
-		if (s >= NUM_TEMP)
-			continue;
+	if (index == 0 && !data->have_vid)
+		return 0;
 
-		/* Use dynamic index for other sources */
-		data->have_temp |= BIT(s);
-		data->reg_temp[0][s] = reg_temp_mon[i];
-		data->temp_src[s] = src;
-		s++;
+	if (index == 1 || index == 2) {
+		if (data->ALARM_BITS[INTRUSION_ALARM_BASE + index - 1] < 0)
+			return 0;
 	}
 
-#ifdef USE_ALTERNATE
-	/*
-	 * Go through the list of alternate temp registers and enable
-	 * if possible.
-	 * The temperature is already monitored if the respective bit in <mask>
-	 * is set.
-	 */
-	for (i = 0; i < 31; i++) {
-		if (!(data->temp_mask & BIT(i + 1)))
-			continue;
-		if (!reg_temp_alternate[i])
-			continue;
-		if (mask & BIT(i + 1))
-			continue;
-		if (i < data->temp_fixed_num) {
-			if (data->have_temp & BIT(i))
-				continue;
-			data->have_temp |= BIT(i);
-			data->have_temp_fixed |= BIT(i);
-			data->reg_temp[0][i] = reg_temp_alternate[i];
-			if (i < num_reg_temp) {
-				data->reg_temp[1][i] = reg_temp_over[i];
-				data->reg_temp[2][i] = reg_temp_hyst[i];
-			}
-			data->temp_src[i] = i + 1;
-			continue;
-		}
+	if (index == 3 || index == 4) {
+		if (data->BEEP_BITS[INTRUSION_ALARM_BASE + index - 3] < 0)
+			return 0;
+	}
 
-		if (s >= NUM_TEMP)	/* Abort if no more space */
-			break;
+	return nct6775_attr_mode(data, attr);
+}
 
-		data->have_temp |= BIT(s);
-		data->reg_temp[0][s] = reg_temp_alternate[i];
-		data->temp_src[s] = i + 1;
-		s++;
-	}
-#endif /* USE_ALTERNATE */
+/*
+ * nct6775_other_is_visible uses the index into the following array
+ * to determine if attributes should be created or not.
+ * Any change in order or content must be matched.
+ */
+static struct attribute *nct6775_attributes_other[] = {
+	&dev_attr_cpu0_vid.attr,				/* 0 */
+	&sensor_dev_attr_intrusion0_alarm.dev_attr.attr,	/* 1 */
+	&sensor_dev_attr_intrusion1_alarm.dev_attr.attr,	/* 2 */
+	&sensor_dev_attr_intrusion0_beep.dev_attr.attr,		/* 3 */
+	&sensor_dev_attr_intrusion1_beep.dev_attr.attr,		/* 4 */
+	&sensor_dev_attr_beep_enable.dev_attr.attr,		/* 5 */
 
-	/* Check which TSIx_TEMP registers are active */
-	for (i = 0; i < num_reg_tsi_temp; i++) {
-		u16 tmp;
+	NULL
+};
 
-		err = nct6775_read_value(data, data->REG_TSI_TEMP[i], &tmp);
-		if (err)
-			return err;
-		if (tmp)
-			data->have_tsi_temp |= BIT(i);
-	}
+static const struct attribute_group nct6775_group_other = {
+	.attrs = nct6775_attributes_other,
+	.is_visible = nct6775_other_is_visible,
+};
 
-	/* Initialize the chip */
-	err = nct6775_init_device(data);
-	if (err)
-		return err;
+static int nct6775_platform_probe_init(struct nct6775_data *data)
+{
+	int err;
+	u8 cr2a;
+	struct nct6775_sio_data *sio_data = data->driver_data;
 
 	err = sio_data->sio_enter(sio_data);
 	if (err)
@@ -5164,191 +871,72 @@ static int nct6775_probe(struct platform_device *pdev)
 		}
 		sio_data->sio_outb(sio_data, NCT6775_REG_CR_FAN_DEBOUNCE,
 			     tmp);
-		dev_info(&pdev->dev, "Enabled fan debounce for chip %s\n",
-			 data->name);
+		pr_info("Enabled fan debounce for chip %s\n", data->name);
 	}
 
 	nct6775_check_fan_inputs(data, sio_data);
 
 	sio_data->sio_exit(sio_data);
 
-	/* Read fan clock dividers immediately */
-	err = nct6775_init_fan_common(dev, data);
-	if (err)
-		return err;
-
-	/* Register sysfs hooks */
-	err = nct6775_add_template_attr_group(dev, data, &nct6775_pwm_template_group,
-					      data->pwm_num);
-	if (err)
-		return err;
-
-	err = nct6775_add_template_attr_group(dev, data, &nct6775_in_template_group,
-					      fls(data->have_in));
-	if (err)
-		return err;
-
-	err = nct6775_add_template_attr_group(dev, data, &nct6775_fan_template_group,
-					      fls(data->has_fan));
-	if (err)
-		return err;
-
-	err = nct6775_add_template_attr_group(dev, data, &nct6775_temp_template_group,
-					      fls(data->have_temp));
-	if (err)
-		return err;
-
-	if (data->have_tsi_temp) {
-		tsi_temp_tg.templates = nct6775_tsi_temp_template;
-		tsi_temp_tg.is_visible = nct6775_tsi_temp_is_visible;
-		tsi_temp_tg.base = fls(data->have_temp) + 1;
-		err = nct6775_add_template_attr_group(dev, data, &tsi_temp_tg,
-						      fls(data->have_tsi_temp));
-		if (err)
-			return err;
-	}
-
-	err = nct6775_add_attr_group(data, &nct6775_group_other);
-	if (err)
-		return err;
-
-	hwmon_dev = devm_hwmon_device_register_with_groups(dev, data->name,
-							   data, data->groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
-}
-
-static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
-{
-	int val;
-
-	val = sio_data->sio_inb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
-	if (val & 0x10) {
-		pr_info("Enabling hardware monitor logical device mappings.\n");
-		sio_data->sio_outb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
-			       val & ~0x10);
-	}
+	return nct6775_add_attr_group(data, &nct6775_group_other);
 }
 
-static int __maybe_unused nct6775_suspend(struct device *dev)
-{
-	int err;
-	u16 tmp;
-	struct nct6775_data *data = nct6775_update_device(dev);
-
-	if (IS_ERR(data))
-		return PTR_ERR(data);
-
-	mutex_lock(&data->update_lock);
-	err = nct6775_read_value(data, data->REG_VBAT, &tmp);
-	if (err)
-		goto out;
-	data->vbat = tmp;
-	if (data->kind == nct6775) {
-		err = nct6775_read_value(data, NCT6775_REG_FANDIV1, &tmp);
-		if (err)
-			goto out;
-		data->fandiv1 = tmp;
-
-		err = nct6775_read_value(data, NCT6775_REG_FANDIV2, &tmp);
-		if (err)
-			goto out;
-		data->fandiv2 = tmp;
-	}
-out:
-	mutex_unlock(&data->update_lock);
+static const struct regmap_config nct6775_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = nct6775_reg_read,
+	.reg_write = nct6775_reg_write,
+};
 
-	return err;
-}
+static const struct regmap_config nct6775_wmi_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = nct6775_wmi_reg_read,
+	.reg_write = nct6775_wmi_reg_write,
+};
 
-static int __maybe_unused nct6775_resume(struct device *dev)
+static int nct6775_platform_probe(struct platform_device *pdev)
 {
-	struct nct6775_data *data = dev_get_drvdata(dev);
+	struct device *dev = &pdev->dev;
 	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
-	int i, j, err = 0;
-	u8 reg;
-
-	mutex_lock(&data->update_lock);
-	data->bank = 0xff;		/* Force initial bank selection */
-
-	err = sio_data->sio_enter(sio_data);
-	if (err)
-		goto abort;
-
-	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
-	reg = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
-	if (reg != data->sio_reg_enable)
-		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, data->sio_reg_enable);
-
-	if (data->kind == nct6791 || data->kind == nct6792 ||
-	    data->kind == nct6793 || data->kind == nct6795 ||
-	    data->kind == nct6796 || data->kind == nct6797 ||
-	    data->kind == nct6798)
-		nct6791_enable_io_mapping(sio_data);
-
-	sio_data->sio_exit(sio_data);
-
-	/* Restore limits */
-	for (i = 0; i < data->in_num; i++) {
-		if (!(data->have_in & BIT(i)))
-			continue;
+	struct nct6775_data *data;
+	struct resource *res;
+	const struct regmap_config *regmapcfg;
 
-		err = nct6775_write_value(data, data->REG_IN_MINMAX[0][i], data->in[i][1]);
-		if (err)
-			goto abort;
-		err = nct6775_write_value(data, data->REG_IN_MINMAX[1][i], data->in[i][2]);
-		if (err)
-			goto abort;
+	if (sio_data->access == access_direct) {
+		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH, DRVNAME))
+			return -EBUSY;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
-		if (!(data->has_fan_min & BIT(i)))
-			continue;
-
-		err = nct6775_write_value(data, data->REG_FAN_MIN[i], data->fan_min[i]);
-		if (err)
-			goto abort;
-	}
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
 
-	for (i = 0; i < NUM_TEMP; i++) {
-		if (!(data->have_temp & BIT(i)))
-			continue;
+	data->kind = sio_data->kind;
+	data->sioreg = sio_data->sioreg;
 
-		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
-			if (data->reg_temp[j][i]) {
-				err = nct6775_write_temp(data, data->reg_temp[j][i],
-							 data->temp[j][i]);
-				if (err)
-					goto abort;
-			}
+	if (sio_data->access == access_direct) {
+		data->addr = res->start;
+		regmapcfg = &nct6775_regmap_config;
+	} else {
+		regmapcfg = &nct6775_wmi_regmap_config;
 	}
 
-	/* Restore other settings */
-	err = nct6775_write_value(data, data->REG_VBAT, data->vbat);
-	if (err)
-		goto abort;
-	if (data->kind == nct6775) {
-		err = nct6775_write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
-		if (err)
-			goto abort;
-		err = nct6775_write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
-	}
+	platform_set_drvdata(pdev, data);
 
-abort:
-	/* Force re-reading all values */
-	data->valid = false;
-	mutex_unlock(&data->update_lock);
+	data->driver_data = sio_data;
+	data->driver_init = nct6775_platform_probe_init;
 
-	return err;
+	return nct6775_probe(&pdev->dev, data, regmapcfg);
 }
 
-static SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
-
 static struct platform_driver nct6775_driver = {
 	.driver = {
 		.name	= DRVNAME,
 		.pm	= &nct6775_dev_pm_ops,
 	},
-	.probe		= nct6775_probe,
+	.probe		= nct6775_platform_probe,
 };
 
 /* nct6775_find() looks for a '627 in the Super-I/O config space */
@@ -5630,8 +1218,9 @@ static void __exit sensors_nct6775_exit(void)
 }
 
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-MODULE_DESCRIPTION("Driver for NCT6775F and compatible chips");
+MODULE_DESCRIPTION("Platform driver for NCT6775F and compatible chips");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(HWMON_NCT6775);
 
 module_init(sensors_nct6775_init);
 module_exit(sensors_nct6775_exit);
-- 
2.36.0

