Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0195B240
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 11:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqJNQ4hHMz3bjk
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 19:50:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PVMcNv4+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=chou.cosmo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqJNM2Fzlz2yQl
	for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 19:50:27 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-714226888dfso538285b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2024 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724320225; x=1724925025; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLgSrEFVTqCEpb1e3jOm09aztw9cxObRcNupA5RQjUs=;
        b=PVMcNv4+iIzvdYEQwqVh8Lx02PU4reGcz7hPeXXPD+1CzRVe5Ck84WWO5Goz6xFbAz
         3v41aob+PkzEHzp4s5xg1Qq6Va2mu6hwbj+NJSkAV0tM8KaQ6k/dnPHyBPyqp3buq1TD
         dn/zG8syRwAtuRDiLK4J18sOZgG8O3jxHAbw2z/q+oAthgJABgyJdHV+w1P3FWXQ6xgp
         0BZv2i9GBGkiXI0Z5rsiTtXZRD7nEVb3y2BjlB0N3rvp6qg7JmZoHfEo+7gxIL6TT9pW
         ItWeQ4cQQzPwE67sFbj2n0iKB6Hcb2kF4pimK/96EsTMoqUQQrtAc7c17yD44x7awiru
         YzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724320225; x=1724925025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLgSrEFVTqCEpb1e3jOm09aztw9cxObRcNupA5RQjUs=;
        b=VmjOFBOONFhYrMHJAH3Kwa8UnySZKxFx4hY4XP8o5BYVG7aH1AFlJf2DaGPxPLXI9i
         VKk5rCUIvaAZYhBxoDH1YQeSWfFw9MCXQtjCeWUa3mzcXznKHXMnoyVEL09SXOLhmlBK
         5J1Xye2zO7ey3fx7kJbhyq1ZXBhewkQQQQIVS/a+SEMB21K+p0X68eFYfAXoSE68k/Nz
         07qNl70mkSkLpshpW1SkXcUVx1+SgEWwpmLNrsdE0Kd7/h0P5Hvd6Xxr1aUF1EHiPTEr
         7RkqI1bv3kED/qu5KQNMg9GMWKj7wxeiECf4DW4PsHa307WngGztlcD5ALb2tSV77bls
         OQMA==
X-Forwarded-Encrypted: i=1; AJvYcCWXEGYZRDdCRc2+0N8dUV0Tnzxj2IIpaNK5SYua8XIv//Y2wKLLRK10+rfIwq4KbdhGZBFTv6d/@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLsPeoE7odYmCrKtA0FpIbegpWFeYFKecX25GgAydM9KD7G0tM
	Y5Ps5czn8Mx+K8H4DFgiGn7gUMlwI6wASlUy1h+lq9Pau1t5WA5p
X-Google-Smtp-Source: AGHT+IHUr+sfURH6G6TB4AU2SlYCbivSqj9SipdYRWMLn6xzuCZneZ4ZT9hkdqhI447Wt9Fg+p4J2g==
X-Received: by 2002:a05:6a20:4a0f:b0:1c6:fa64:e5bc with SMTP id adf61e73a8af0-1cad8145662mr5902795637.34.1724320225248;
        Thu, 22 Aug 2024 02:50:25 -0700 (PDT)
Received: from cosmo-ubuntu-2204.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714378611d9sm818585b3a.43.2024.08.22.02.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:50:24 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-6.6 1/1] hwmon: Add driver for Astera Labs PT5161L retimer
Date: Thu, 22 Aug 2024 17:48:03 +0800
Message-Id: <20240822094803.2849010-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822094803.2849010-1-chou.cosmo@gmail.com>
References: <20240822094803.2849010-1-chou.cosmo@gmail.com>
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
Cc: chou.cosmo@gmail.com, cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This driver implements support for temperature monitoring of Astera Labs
PT5161L series PCIe retimer chips.

This driver implementation originates from the CSDK available at
Link: https://github.com/facebook/openbmc/tree/helium/common/recipes-lib/retimer-v2.14
The communication protocol utilized is based on the I2C/SMBus standard.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 Documentation/hwmon/index.rst   |   1 +
 Documentation/hwmon/pt5161l.rst |  42 ++
 MAINTAINERS                     |   7 +
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/pt5161l.c         | 667 ++++++++++++++++++++++++++++++++
 6 files changed, 728 insertions(+)
 create mode 100644 Documentation/hwmon/pt5161l.rst
 create mode 100644 drivers/hwmon/pt5161l.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index c7ed1f73ac06..9f5f215fcb2d 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -185,6 +185,7 @@ Hardware Monitoring Kernel Drivers
    pmbus
    powerz
    powr1220
+   pt5161l
    pxe1610
    pwm-fan
    q54sj108a2
diff --git a/Documentation/hwmon/pt5161l.rst b/Documentation/hwmon/pt5161l.rst
new file mode 100644
index 000000000000..1b97336991ea
--- /dev/null
+++ b/Documentation/hwmon/pt5161l.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver pt5161l
+=====================
+
+Supported chips:
+
+  * Astera Labs PT5161L
+
+    Prefix: 'pt5161l'
+
+    Addresses scanned: I2C 0x20 - 0x27
+
+    Datasheet: Not publicly available.
+
+Authors: Cosmo Chou <cosmo.chou@quantatw.com>
+
+Description
+-----------
+
+This driver implements support for temperature monitoring of Astera Labs
+PT5161L series PCIe retimer chips.
+
+This driver implementation originates from the CSDK available at
+https://github.com/facebook/openbmc/tree/helium/common/recipes-lib/retimer-v2.14
+The communication protocol utilized is based on the I2C/SMBus standard.
+
+Sysfs entries
+----------------
+
+================ ==============================================
+temp1_input      Measured temperature (in millidegrees Celsius)
+================ ==============================================
+
+Debugfs entries
+----------------
+
+================ ===============================
+fw_load_status   Firmware load status
+fw_ver           Firmware version of the retimer
+heartbeat_status Heartbeat status
+================ ===============================
diff --git a/MAINTAINERS b/MAINTAINERS
index 960512bec428..a656b98971ca 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17679,6 +17679,13 @@ F:	fs/pstore/
 F:	include/linux/pstore*
 K:	\b(pstore|ramoops)
 
+PT5161L HARDWARE MONITOR DRIVER
+M:	Cosmo Chou <cosmo.chou@quantatw.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/pt5161l.rst
+F:	drivers/hwmon/pt5161l.c
+
 PTP HARDWARE CLOCK SUPPORT
 M:	Richard Cochran <richardcochran@gmail.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index a608264da87d..c8d86a695f66 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1714,6 +1714,16 @@ source "drivers/hwmon/peci/Kconfig"
 
 source "drivers/hwmon/pmbus/Kconfig"
 
+config SENSORS_PT5161L
+	tristate "Astera Labs PT5161L PCIe retimer hardware monitoring"
+	depends on I2C
+	help
+	  If you say yes here you get support for temperature monitoring
+	  on the Astera Labs PT5161L PCIe retimer.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called pt5161l.
+
 config SENSORS_PWM_FAN
 	tristate "PWM fan"
 	depends on (PWM && OF) || COMPILE_TEST
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 47be39af5c03..0554d3ccb09a 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -180,6 +180,7 @@ obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
 obj-$(CONFIG_SENSORS_POWERZ)	+= powerz.o
 obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
+obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
 obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
new file mode 100644
index 000000000000..60361e39c474
--- /dev/null
+++ b/drivers/hwmon/pt5161l.c
@@ -0,0 +1,667 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/hwmon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+
+/* Aries current average temp ADC code CSR */
+#define ARIES_CURRENT_AVG_TEMP_ADC_CSR	0x42c
+
+/* Device Load check register */
+#define ARIES_CODE_LOAD_REG	0x605
+/* Value indicating FW was loaded properly, [3:1] = 3'b111 */
+#define ARIES_LOAD_CODE	0xe
+
+/* Main Micro Heartbeat register */
+#define ARIES_MM_HEARTBEAT_ADDR	0x923
+
+/* Reg offset to specify Address for MM assisted accesses */
+#define ARIES_MM_ASSIST_REG_ADDR_OFFSET	0xd99
+/* Reg offset to specify Command for MM assisted accesses */
+#define ARIES_MM_ASSIST_CMD_OFFSET	0xd9d
+/* Reg offset to MM SPARE 0 used specify Address[7:0] */
+#define ARIES_MM_ASSIST_SPARE_0_OFFSET	0xd9f
+/* Reg offset to MM SPARE 3 used specify Data Byte 0 */
+#define ARIES_MM_ASSIST_SPARE_3_OFFSET	0xda2
+/* Wide register reads */
+#define ARIES_MM_RD_WIDE_REG_2B	0x1d
+#define ARIES_MM_RD_WIDE_REG_3B	0x1e
+#define ARIES_MM_RD_WIDE_REG_4B	0x1f
+#define ARIES_MM_RD_WIDE_REG_5B	0x20
+
+/* Time delay between checking MM status of EEPROM write (microseconds) */
+#define ARIES_MM_STATUS_TIME	5000
+
+/* AL Main SRAM DMEM offset (A0) */
+#define AL_MAIN_SRAM_DMEM_OFFSET	(64 * 1024)
+/* SRAM read command */
+#define AL_TG_RD_LOC_IND_SRAM	0x16
+
+/* Offset for main micro FW info */
+#define ARIES_MAIN_MICRO_FW_INFO	(96 * 1024 - 128)
+/* FW Info (Major) offset location in struct */
+#define ARIES_MM_FW_VERSION_MAJOR	0
+/* FW Info (Minor) offset location in struct */
+#define ARIES_MM_FW_VERSION_MINOR	1
+/* FW Info (Build no.) offset location in struct */
+#define ARIES_MM_FW_VERSION_BUILD	2
+
+#define ARIES_TEMP_CAL_CODE_DEFAULT	84
+
+/* Struct defining FW version loaded on an Aries device */
+struct pt5161l_fw_ver {
+	u8 major;
+	u8 minor;
+	u16 build;
+};
+
+/* Each client has this additional data */
+struct pt5161l_data {
+	struct i2c_client *client;
+	struct dentry *debugfs;
+	struct pt5161l_fw_ver fw_ver;
+	struct mutex lock; /* for atomic I2C transactions */
+	bool init_done;
+	bool code_load_okay; /* indicate if code load reg value is expected */
+	bool mm_heartbeat_okay; /* indicate if Main Micro heartbeat is good */
+	bool mm_wide_reg_access; /* MM assisted wide register access */
+};
+
+static struct dentry *pt5161l_debugfs_dir;
+
+/*
+ * Write multiple data bytes to Aries over I2C
+ */
+static int pt5161l_write_block_data(struct pt5161l_data *data, u32 address,
+				    u8 len, u8 *val)
+{
+	struct i2c_client *client = data->client;
+	int ret;
+	u8 remain_len = len;
+	u8 xfer_len, curr_len;
+	u8 buf[16];
+	u8 cmd = 0x0F; /* [7]:pec_en, [4:2]:func, [1]:start, [0]:end */
+	u8 config = 0x40; /* [6]:cfg_type, [4:1]:burst_len, [0]:address bit16 */
+
+	while (remain_len > 0) {
+		if (remain_len > 4) {
+			curr_len = 4;
+			remain_len -= 4;
+		} else {
+			curr_len = remain_len;
+			remain_len = 0;
+		}
+
+		buf[0] = config | (curr_len - 1) << 1 | ((address >> 16) & 0x1);
+		buf[1] = (address >> 8) & 0xff;
+		buf[2] = address & 0xff;
+		memcpy(&buf[3], val, curr_len);
+
+		xfer_len = 3 + curr_len;
+		ret = i2c_smbus_write_block_data(client, cmd, xfer_len, buf);
+		if (ret)
+			return ret;
+
+		val += curr_len;
+		address += curr_len;
+	}
+
+	return 0;
+}
+
+/*
+ * Read multiple data bytes from Aries over I2C
+ */
+static int pt5161l_read_block_data(struct pt5161l_data *data, u32 address,
+				   u8 len, u8 *val)
+{
+	struct i2c_client *client = data->client;
+	int ret, tries;
+	u8 remain_len = len;
+	u8 curr_len;
+	u8 wbuf[16], rbuf[24];
+	u8 cmd = 0x08; /* [7]:pec_en, [4:2]:func, [1]:start, [0]:end */
+	u8 config = 0x00; /* [6]:cfg_type, [4:1]:burst_len, [0]:address bit16 */
+
+	while (remain_len > 0) {
+		if (remain_len > 16) {
+			curr_len = 16;
+			remain_len -= 16;
+		} else {
+			curr_len = remain_len;
+			remain_len = 0;
+		}
+
+		wbuf[0] = config | (curr_len - 1) << 1 |
+			  ((address >> 16) & 0x1);
+		wbuf[1] = (address >> 8) & 0xff;
+		wbuf[2] = address & 0xff;
+
+		for (tries = 0; tries < 3; tries++) {
+			ret = i2c_smbus_write_block_data(client, (cmd | 0x2), 3,
+							 wbuf);
+			if (ret)
+				return ret;
+
+			ret = i2c_smbus_read_block_data(client, (cmd | 0x1),
+							rbuf);
+			if (ret == curr_len)
+				break;
+		}
+		if (tries >= 3)
+			return ret;
+
+		memcpy(val, rbuf, curr_len);
+		val += curr_len;
+		address += curr_len;
+	}
+
+	return 0;
+}
+
+static int pt5161l_read_wide_reg(struct pt5161l_data *data, u32 address,
+				 u8 width, u8 *val)
+{
+	int ret, tries;
+	u8 buf[8];
+	u8 status;
+
+	/*
+	 * Safely access wide registers using mailbox method to prevent
+	 * risking conflict with Aries firmware; otherwise fallback to
+	 * legacy, less secure method.
+	 */
+	if (data->mm_wide_reg_access) {
+		buf[0] = address & 0xff;
+		buf[1] = (address >> 8) & 0xff;
+		buf[2] = (address >> 16) & 0x1;
+		ret = pt5161l_write_block_data(data,
+					       ARIES_MM_ASSIST_SPARE_0_OFFSET,
+					       3, buf);
+		if (ret)
+			return ret;
+
+		/* Set command based on width */
+		switch (width) {
+		case 2:
+			buf[0] = ARIES_MM_RD_WIDE_REG_2B;
+			break;
+		case 3:
+			buf[0] = ARIES_MM_RD_WIDE_REG_3B;
+			break;
+		case 4:
+			buf[0] = ARIES_MM_RD_WIDE_REG_4B;
+			break;
+		case 5:
+			buf[0] = ARIES_MM_RD_WIDE_REG_5B;
+			break;
+		default:
+			return -EINVAL;
+		}
+		ret = pt5161l_write_block_data(data, ARIES_MM_ASSIST_CMD_OFFSET,
+					       1, buf);
+		if (ret)
+			return ret;
+
+		status = 0xff;
+		for (tries = 0; tries < 100; tries++) {
+			ret = pt5161l_read_block_data(data,
+						      ARIES_MM_ASSIST_CMD_OFFSET,
+						      1, &status);
+			if (ret)
+				return ret;
+
+			if (status == 0)
+				break;
+
+			usleep_range(ARIES_MM_STATUS_TIME,
+				     ARIES_MM_STATUS_TIME + 1000);
+		}
+		if (status != 0)
+			return -ETIMEDOUT;
+
+		ret = pt5161l_read_block_data(data,
+					      ARIES_MM_ASSIST_SPARE_3_OFFSET,
+					      width, val);
+		if (ret)
+			return ret;
+	} else {
+		return pt5161l_read_block_data(data, address, width, val);
+	}
+
+	return 0;
+}
+
+/*
+ * Read multiple (up to eight) data bytes from micro SRAM over I2C
+ */
+static int
+pt5161l_read_block_data_main_micro_indirect(struct pt5161l_data *data,
+					    u32 address, u8 len, u8 *val)
+{
+	int ret, tries;
+	u8 buf[8];
+	u8 i, status;
+	u32 uind_offs = ARIES_MM_ASSIST_REG_ADDR_OFFSET;
+	u32 eeprom_base, eeprom_addr;
+
+	/* No multi-byte indirect support here. Hence read a byte at a time */
+	eeprom_base = address - AL_MAIN_SRAM_DMEM_OFFSET;
+	for (i = 0; i < len; i++) {
+		eeprom_addr = eeprom_base + i;
+		buf[0] = eeprom_addr & 0xff;
+		buf[1] = (eeprom_addr >> 8) & 0xff;
+		buf[2] = (eeprom_addr >> 16) & 0xff;
+		ret = pt5161l_write_block_data(data, uind_offs, 3, buf);
+		if (ret)
+			return ret;
+
+		buf[0] = AL_TG_RD_LOC_IND_SRAM;
+		ret = pt5161l_write_block_data(data, uind_offs + 4, 1, buf);
+		if (ret)
+			return ret;
+
+		status = 0xff;
+		for (tries = 0; tries < 255; tries++) {
+			ret = pt5161l_read_block_data(data, uind_offs + 4, 1,
+						      &status);
+			if (ret)
+				return ret;
+
+			if (status == 0)
+				break;
+		}
+		if (status != 0)
+			return -ETIMEDOUT;
+
+		ret = pt5161l_read_block_data(data, uind_offs + 3, 1, buf);
+		if (ret)
+			return ret;
+
+		val[i] = buf[0];
+	}
+
+	return 0;
+}
+
+/*
+ * Check firmware load status
+ */
+static int pt5161l_fw_load_check(struct pt5161l_data *data)
+{
+	int ret;
+	u8 buf[8];
+
+	ret = pt5161l_read_block_data(data, ARIES_CODE_LOAD_REG, 1, buf);
+	if (ret)
+		return ret;
+
+	if (buf[0] < ARIES_LOAD_CODE) {
+		dev_dbg(&data->client->dev,
+			"Code Load reg unexpected. Not all modules are loaded %x\n",
+			buf[0]);
+		data->code_load_okay = false;
+	} else {
+		data->code_load_okay = true;
+	}
+
+	return 0;
+}
+
+/*
+ * Check main micro heartbeat
+ */
+static int pt5161l_heartbeat_check(struct pt5161l_data *data)
+{
+	int ret, tries;
+	u8 buf[8];
+	u8 heartbeat;
+	bool hb_changed = false;
+
+	ret = pt5161l_read_block_data(data, ARIES_MM_HEARTBEAT_ADDR, 1, buf);
+	if (ret)
+		return ret;
+
+	heartbeat = buf[0];
+	for (tries = 0; tries < 100; tries++) {
+		ret = pt5161l_read_block_data(data, ARIES_MM_HEARTBEAT_ADDR, 1,
+					      buf);
+		if (ret)
+			return ret;
+
+		if (buf[0] != heartbeat) {
+			hb_changed = true;
+			break;
+		}
+	}
+	data->mm_heartbeat_okay = hb_changed;
+
+	return 0;
+}
+
+/*
+ * Check the status of firmware
+ */
+static int pt5161l_fwsts_check(struct pt5161l_data *data)
+{
+	int ret;
+	u8 buf[8];
+	u8 major = 0, minor = 0;
+	u16 build = 0;
+
+	ret = pt5161l_fw_load_check(data);
+	if (ret)
+		return ret;
+
+	ret = pt5161l_heartbeat_check(data);
+	if (ret)
+		return ret;
+
+	if (data->code_load_okay && data->mm_heartbeat_okay) {
+		ret = pt5161l_read_block_data_main_micro_indirect(data, ARIES_MAIN_MICRO_FW_INFO +
+								  ARIES_MM_FW_VERSION_MAJOR,
+								  1, &major);
+		if (ret)
+			return ret;
+
+		ret = pt5161l_read_block_data_main_micro_indirect(data, ARIES_MAIN_MICRO_FW_INFO +
+								  ARIES_MM_FW_VERSION_MINOR,
+								  1, &minor);
+		if (ret)
+			return ret;
+
+		ret = pt5161l_read_block_data_main_micro_indirect(data, ARIES_MAIN_MICRO_FW_INFO +
+								  ARIES_MM_FW_VERSION_BUILD,
+								  2, buf);
+		if (ret)
+			return ret;
+		build = buf[1] << 8 | buf[0];
+	}
+	data->fw_ver.major = major;
+	data->fw_ver.minor = minor;
+	data->fw_ver.build = build;
+
+	return 0;
+}
+
+static int pt5161l_fw_is_at_least(struct pt5161l_data *data, u8 major, u8 minor,
+				  u16 build)
+{
+	u32 ver = major << 24 | minor << 16 | build;
+	u32 curr_ver = data->fw_ver.major << 24 | data->fw_ver.minor << 16 |
+		       data->fw_ver.build;
+
+	if (curr_ver >= ver)
+		return true;
+
+	return false;
+}
+
+static int pt5161l_init_dev(struct pt5161l_data *data)
+{
+	int ret;
+
+	mutex_lock(&data->lock);
+	ret = pt5161l_fwsts_check(data);
+	mutex_unlock(&data->lock);
+	if (ret)
+		return ret;
+
+	/* Firmware 2.2.0 enables safe access to wide registers */
+	if (pt5161l_fw_is_at_least(data, 2, 2, 0))
+		data->mm_wide_reg_access = true;
+
+	data->init_done = true;
+
+	return 0;
+}
+
+static int pt5161l_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct pt5161l_data *data = dev_get_drvdata(dev);
+	int ret;
+	u8 buf[8];
+	long adc_code;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		if (!data->init_done) {
+			ret = pt5161l_init_dev(data);
+			if (ret)
+				return ret;
+		}
+
+		mutex_lock(&data->lock);
+		ret = pt5161l_read_wide_reg(data,
+					    ARIES_CURRENT_AVG_TEMP_ADC_CSR, 4,
+					    buf);
+		mutex_unlock(&data->lock);
+		if (ret) {
+			dev_dbg(dev, "Read adc_code failed %d\n", ret);
+			return ret;
+		}
+
+		adc_code = buf[3] << 24 | buf[2] << 16 | buf[1] << 8 | buf[0];
+		if (adc_code == 0 || adc_code >= 0x3ff) {
+			dev_dbg(dev, "Invalid adc_code %lx\n", adc_code);
+			return -EIO;
+		}
+
+		*val = 110000 +
+		       ((adc_code - (ARIES_TEMP_CAL_CODE_DEFAULT + 250)) *
+			-320);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t pt5161l_is_visible(const void *data,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct hwmon_channel_info *pt5161l_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops pt5161l_hwmon_ops = {
+	.is_visible = pt5161l_is_visible,
+	.read = pt5161l_read,
+};
+
+static const struct hwmon_chip_info pt5161l_chip_info = {
+	.ops = &pt5161l_hwmon_ops,
+	.info = pt5161l_info,
+};
+
+static ssize_t pt5161l_debugfs_read_fw_ver(struct file *file, char __user *buf,
+					   size_t count, loff_t *ppos)
+{
+	struct pt5161l_data *data = file->private_data;
+	int ret;
+	char ver[32];
+
+	mutex_lock(&data->lock);
+	ret = pt5161l_fwsts_check(data);
+	mutex_unlock(&data->lock);
+	if (ret)
+		return ret;
+
+	ret = snprintf(ver, sizeof(ver), "%u.%u.%u\n", data->fw_ver.major,
+		       data->fw_ver.minor, data->fw_ver.build);
+
+	return simple_read_from_buffer(buf, count, ppos, ver, ret);
+}
+
+static const struct file_operations pt5161l_debugfs_ops_fw_ver = {
+	.read = pt5161l_debugfs_read_fw_ver,
+	.open = simple_open,
+};
+
+static ssize_t pt5161l_debugfs_read_fw_load_sts(struct file *file,
+						char __user *buf, size_t count,
+						loff_t *ppos)
+{
+	struct pt5161l_data *data = file->private_data;
+	int ret;
+	bool status = false;
+	char health[16];
+
+	mutex_lock(&data->lock);
+	ret = pt5161l_fw_load_check(data);
+	mutex_unlock(&data->lock);
+	if (ret == 0)
+		status = data->code_load_okay;
+
+	ret = snprintf(health, sizeof(health), "%s\n",
+		       status ? "normal" : "abnormal");
+
+	return simple_read_from_buffer(buf, count, ppos, health, ret);
+}
+
+static const struct file_operations pt5161l_debugfs_ops_fw_load_sts = {
+	.read = pt5161l_debugfs_read_fw_load_sts,
+	.open = simple_open,
+};
+
+static ssize_t pt5161l_debugfs_read_hb_sts(struct file *file, char __user *buf,
+					   size_t count, loff_t *ppos)
+{
+	struct pt5161l_data *data = file->private_data;
+	int ret;
+	bool status = false;
+	char health[16];
+
+	mutex_lock(&data->lock);
+	ret = pt5161l_heartbeat_check(data);
+	mutex_unlock(&data->lock);
+	if (ret == 0)
+		status = data->mm_heartbeat_okay;
+
+	ret = snprintf(health, sizeof(health), "%s\n",
+		       status ? "normal" : "abnormal");
+
+	return simple_read_from_buffer(buf, count, ppos, health, ret);
+}
+
+static const struct file_operations pt5161l_debugfs_ops_hb_sts = {
+	.read = pt5161l_debugfs_read_hb_sts,
+	.open = simple_open,
+};
+
+static int pt5161l_init_debugfs(struct pt5161l_data *data)
+{
+	data->debugfs = debugfs_create_dir(dev_name(&data->client->dev),
+					   pt5161l_debugfs_dir);
+
+	debugfs_create_file("fw_ver", 0444, data->debugfs, data,
+			    &pt5161l_debugfs_ops_fw_ver);
+
+	debugfs_create_file("fw_load_status", 0444, data->debugfs, data,
+			    &pt5161l_debugfs_ops_fw_load_sts);
+
+	debugfs_create_file("heartbeat_status", 0444, data->debugfs, data,
+			    &pt5161l_debugfs_ops_hb_sts);
+
+	return 0;
+}
+
+static int pt5161l_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct device *hwmon_dev;
+	struct pt5161l_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	mutex_init(&data->lock);
+	pt5161l_init_dev(data);
+	dev_set_drvdata(dev, data);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
+							 data,
+							 &pt5161l_chip_info,
+							 NULL);
+
+	pt5161l_init_debugfs(data);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static void pt5161l_remove(struct i2c_client *client)
+{
+	struct pt5161l_data *data = i2c_get_clientdata(client);
+
+	debugfs_remove_recursive(data->debugfs);
+}
+
+static const struct of_device_id __maybe_unused pt5161l_of_match[] = {
+	{ .compatible = "asteralabs,pt5161l" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, pt5161l_of_match);
+
+static const struct acpi_device_id __maybe_unused pt5161l_acpi_match[] = {
+	{ "PT5161L", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, pt5161l_acpi_match);
+
+static const struct i2c_device_id pt5161l_id[] = {
+	{ "pt5161l", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, pt5161l_id);
+
+static struct i2c_driver pt5161l_driver = {
+	.class = I2C_CLASS_HWMON,
+	.driver = {
+		.name = "pt5161l",
+		.of_match_table = of_match_ptr(pt5161l_of_match),
+		.acpi_match_table = ACPI_PTR(pt5161l_acpi_match),
+	},
+	.probe = pt5161l_probe,
+	.remove = pt5161l_remove,
+	.id_table = pt5161l_id,
+};
+
+static int __init pt5161l_init(void)
+{
+	pt5161l_debugfs_dir = debugfs_create_dir("pt5161l", NULL);
+	return i2c_add_driver(&pt5161l_driver);
+}
+
+static void __exit pt5161l_exit(void)
+{
+	i2c_del_driver(&pt5161l_driver);
+	debugfs_remove_recursive(pt5161l_debugfs_dir);
+}
+
+module_init(pt5161l_init);
+module_exit(pt5161l_exit);
+
+MODULE_AUTHOR("Cosmo Chou <cosmo.chou@quantatw.com>");
+MODULE_DESCRIPTION("Hwmon driver for Astera Labs Aries PCIe retimer");
+MODULE_LICENSE("GPL");
-- 
2.34.1

