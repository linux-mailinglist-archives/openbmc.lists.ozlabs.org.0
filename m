Return-Path: <openbmc+bounces-1304-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMeNME0VfGn4KQIAu9opvQ
	(envelope-from <openbmc+bounces-1304-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 30 Jan 2026 03:19:57 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F2B65FB
	for <lists+openbmc@lfdr.de>; Fri, 30 Jan 2026 03:19:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2KT96DSDz2xKx;
	Fri, 30 Jan 2026 13:19:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769739565;
	cv=none; b=QJq6R0WKVZX5oBEyRFHp7GfcOhw5J4DIamNGuZHkWsSpBy5pOWNnKI3fvSuodksTkVF48/oEo98K2QU0z55cg4iAot5L8W2P8ckupXftZ1MA/jsZRclf40DTGOJ6pbIe/6IWsuA6qAp+ZtatUA/mxgzU9ZrnM9Tuq5/9QIcApSVdms19bT/8odjb0d3sdLWLtVogQ/fNXcNr+zlSy8YjNpjA457QcTDFsaN7S+M7wjRVFsFOLXJ3g6JPpMMBCu0zmhvLwaiWjruDkGfTr9xj/a+Y1TVYP3mn9Hc9+AFs/SpEYVHR2Gr7EzsE1LCyQJEjA2dk8u4GfUFgX4MEwruGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769739565; c=relaxed/relaxed;
	bh=MvJWKD3HwauNOjzcVNxEbuMB8kIOVYPx92KeOpuRcwM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iAwNsmqLvXNF0RE4al/CcXfA6/ZltneH1/x8/uvOvqy2dj6DkN85NLbqWpFbFqoP1zYTqDOLCYSERs3As3n81Uo/r76IC6ZKECjWTMUn2D+LkpBkby0Qmv589DfapONdNClLsS3w3jV7wm+7lLl7xH7XQ/LUCtFSBJ0IQbZQ6Jo9Lpf5oyes1nMzsrTZPmw6FESC4/n+DCTTKuLN3Es416KlU0aTCko8cJDMn7bt0YkOQeE7UZJe4na1/eZnErEW9gixV+KNjREolGGDguE/Xcazzyi6sQ7IQV70i4KVuHCC9ddVGQ3DMLsqWIUgR+eXEsFe0gNaUiU3WVyTvO4qEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dbIu2ZC/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dbIu2ZC/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2KT82v9Nz2xjP
	for <openbmc@lists.ozlabs.org>; Fri, 30 Jan 2026 13:19:24 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8230f2140beso1430005b3a.1
        for <openbmc@lists.ozlabs.org>; Thu, 29 Jan 2026 18:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769739561; x=1770344361; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvJWKD3HwauNOjzcVNxEbuMB8kIOVYPx92KeOpuRcwM=;
        b=dbIu2ZC/oR3biJotZ+s4yYlhJYZSyXTiV5epmuPbbD6ArL6+QjAe6rUnPuZ45+yGea
         /kxCPNscG+RW7SIWPVVHc/e5mLH+lSmrH6GbriO+uBueppzTmavcW46H3AGl/d+VjzBX
         lUI0JtWfMJliyFXiBO9vg+mZW4bzTjMvFwiMjiUI+ytM448m9kyVmzNg/yUIx5n2MEKA
         tyTK91wlIs/L7htayigFVAe7kYK9TQVKXfltRsL/YjSYm2TFvn/o7NOFvULvpWMTWwxf
         SuqQqTidlD1zFfWtlu5RDhHOlOOa9qbMMvdwGdEWopWfYaPPwdUeF/YM0mi2geBkO3p+
         p3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769739561; x=1770344361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MvJWKD3HwauNOjzcVNxEbuMB8kIOVYPx92KeOpuRcwM=;
        b=iqgdAwBvPB0UDiJscrdLkvZ05pN/+rUvsaxoL16C/Pstmjm3IdSLad91GsQLLK0Hq/
         gkD+gbe95v1fc219xoJkLmY0C9FO3b1rM6o7Az3CpYkZYldK/Na0msNQdlEXw1o9UfqP
         IVe1UeOZLt9ePM72e0nA18bMxEFF1tvNyr6Svj12lbmBGxiwlXJ2bUMsn9nWUyKPVST9
         QIYgyXLYWJ3CTgoesThNSBRBsazB/wm3KlcnLoEUjFVp1pO3ybBkXtxojOUqefaQJ9KP
         nA3rXT6cNUgCzWx2uGoqyaLw/t5k/7Uzk2a1vX9uWSCTDm860T+vd1eJXfIznDJANpAg
         nEUA==
X-Gm-Message-State: AOJu0YxtycKJk88JjLgafEYgVWSNDgRC7jilZ0xUk/UMBsuIb76GPWDH
	VRUmjdDw2OAhMhAEOutv5wRo7Q7z7aON7ynqHlMIJLjl8iPefqzAPCBlxof35Q==
X-Gm-Gg: AZuq6aKqBrLinLW9hnZEoGGbFLz+Hp4SW6vOg0ODnt2fe8GGD0BgVvU6HgxDQ548nFn
	v0I4dU2/ybg7NJka/1sodN5eAlfEvh6RFIkqYN6Ezs2izAq1SpU9wTIu1xhd77DJtBXS8PZb8KE
	6oq2idK2d88Wk/vV5dEmIqmEIUbzYH6xfySmnkO4APii+hfvB99mA4y46g71y0KxYwpn2XJYAC6
	DMzR725cI2LM7enXLNoSXj8Kr+YEaauB9GYa94gzr209Qo8uvrIbCYxTFwdtHxOfFxfS85krfr8
	cfFcTNZwjOlzK1tw+d5dTjB64QNLMqHEvbUSwOgYnXzNIk+n1BhtXK9zS18RFx4XAeTDtudYVda
	sARNLm3FH6T/85rERif9+n9/Q3cW2m4C4wTPKaCFRg8WPwlvfTVDugCXqmb4LkA7AFHsBOaTGJB
	9wcEfvDeg1Tn9sieKEXK1RZlSqH0YakybgjAAuHkQbvtN2k2Z59iVg0RyvditvvNw=
X-Received: by 2002:a05:6a21:b95:b0:38e:6774:382d with SMTP id adf61e73a8af0-392dfa920e7mr1181501637.8.1769739561218;
        Thu, 29 Jan 2026 18:19:21 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642afbeaf3sm6018082a12.33.2026.01.29.18.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:19:20 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Subject: [PATCH linux dev-6.18 2/2] hwmon: add mp5926 driver
Date: Fri, 30 Jan 2026 10:17:01 +0800
Message-Id: <20260130021701.2357288-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
References: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1304-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NEQ_ENVFROM(0.00)[potinlaipt@gmail.com,openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: CD9F2B65FB
X-Rspamd-Action: no action

From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Add support for mps mp5926.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/mp5926.rst |  92 +++++++++++++++++
 MAINTAINERS                    |   7 ++
 drivers/hwmon/pmbus/Kconfig    |   9 ++
 drivers/hwmon/pmbus/Makefile   |   1 +
 drivers/hwmon/pmbus/mp5926.c   | 183 +++++++++++++++++++++++++++++++++
 6 files changed, 293 insertions(+)
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 drivers/hwmon/pmbus/mp5926.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 51a5bdf75b08..2be07966fed6 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -182,6 +182,7 @@ Hardware Monitoring Kernel Drivers
    mp2993
    mp5023
    mp5920
+   mp5926
    mp5990
    mp9941
    mpq8785
diff --git a/Documentation/hwmon/mp5926.rst b/Documentation/hwmon/mp5926.rst
new file mode 100644
index 000000000000..b0a3fcd55090
--- /dev/null
+++ b/Documentation/hwmon/mp5926.rst
@@ -0,0 +1,92 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver mp5926
+====================
+
+Supported chips:
+
+  * MPS mp5926
+
+    Prefix: 'mp5926'
+
+  * Datasheet
+    https://www.monolithicpower.com/en/
+
+Author:
+
+	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+
+Description
+-----------
+
+This driver implements support for Monolithic Power Systems, Inc. (MPS)
+MP5926 Hot-Swap Controller.
+
+Device compliant with:
+
+- PMBus rev 1.3 interface.
+
+The driver exports the following attributes via the 'sysfs' files
+for input voltage:
+
+**in1_input**
+
+**in1_label**
+
+**in1_crit**
+
+**in1_crit_alarm**
+
+The driver provides the following attributes for output voltage:
+
+**in2_input**
+
+**in2_label**
+
+**in2_lcrit**
+
+**in2_lcrit_alarm**
+
+**in2_rated_max**
+
+**in2_rated_min**
+
+The driver provides the following attributes for input current:
+
+**curr1_input**
+
+**curr1_label**
+
+**curr1_max**
+
+**curr1_max_alarm**
+
+The driver provides the following attributes for output current:
+
+**curr2_input**
+
+**curr2_label**
+
+The driver provides the following attributes for input power:
+
+**power1_input**
+
+**power1_label**
+
+The driver provides the following attributes for output power:
+
+**power2_input**
+
+**power2_label**
+
+The driver provides the following attributes for temperature:
+
+**temp1_input**
+
+**temp1_crit**
+
+**temp1_crit_alarm**
+
+**temp1_max**
+
+**temp1_max_alarm**
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 956e887dd25a..7e42da085774 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17515,6 +17515,13 @@ S:	Maintained
 F:	Documentation/hwmon/mp2993.rst
 F:	drivers/hwmon/pmbus/mp2993.c
 
+MPS MP5926 DRIVER
+M:	Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/mp5926.rst
+F:	drivers/hwmon/pmbus/mp5926.c
+
 MPS MP9941 DRIVER
 M:	Noah Wang <noahwang.wang@outlook.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index c689af4b68fe..ced45c1a1203 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -453,6 +453,15 @@ config SENSORS_MP5920
 	  This driver can also be built as a module. If so, the module will
 	  be called mp5920.
 
+config SENSORS_MP5926
+	tristate "MPS MP5926"
+	help
+	  If you say yes here you get hardware monitoring support for Monolithic
+	  MP5926.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called mp5926.
+
 config SENSORS_MP5990
 	tristate "MPS MP5990"
 	help
diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index f8236f5075f7..808a6d4c2145 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
 obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
 obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
 obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
+obj-$(CONFIG_SENSORS_MP5926)	+= mp5926.o
 obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
 obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
 obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
diff --git a/drivers/hwmon/pmbus/mp5926.c b/drivers/hwmon/pmbus/mp5926.c
new file mode 100644
index 000000000000..44d83f8e1abb
--- /dev/null
+++ b/drivers/hwmon/pmbus/mp5926.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// mp5926.c  - pmbus driver for mps mp5926
+//
+// Copyright 2025 Monolithic Power Systems, Inc
+//
+// Author: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pmbus.h>
+#include "pmbus.h"
+
+#define PAGE	0x01
+#define EFUSE_CFG	0xCF
+#define I_SCALE_SEL	0xC6
+#define MP5926_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
+			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN | \
+			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_INPUT | \
+			PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_VOUT)
+
+struct mp5926_data {
+	struct pmbus_driver_info info;
+	u8 vout_mode;
+	u8 vout_linear_exponent;
+};
+
+#define to_mp5926_data(x)  container_of(x, struct mp5926_data, info)
+
+static int mp5926_read_byte_data(struct i2c_client *client, int page,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp5926_data *data = to_mp5926_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_VOUT_MODE:
+		if (data->vout_mode == linear) {
+			/*
+			 * The VOUT format used by the chip is linear11,
+			 * not linear16. Report that VOUT is in linear mode
+			 * and return exponent value extracted while probing
+			 * the chip.
+			 */
+			return data->vout_linear_exponent;
+		}
+		return PB_VOUT_MODE_DIRECT;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
+static int mp5926_read_word_data(struct i2c_client *client, int page, int phase,
+				 int reg)
+{
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct mp5926_data *data = to_mp5926_data(info);
+	int ret;
+
+	switch (reg) {
+	case PMBUS_READ_VOUT:
+		ret = pmbus_read_word_data(client, page, phase, reg);
+		if (ret < 0)
+			return ret;
+		/*
+		 * Because the VOUT format used by the chip is linear11 and not
+		 * linear16, we disregard bits[15:11]. The exponent is reported
+		 * as part of the VOUT_MODE command.
+		 */
+		if (data->vout_mode == linear)
+			ret = ((s16)((ret & 0x7ff) << 5)) >> 5;
+		break;
+	default:
+		ret = -ENODATA;
+		break;
+	}
+	return ret;
+}
+
+static struct pmbus_driver_info mp5926_info = {
+	.pages = PAGE,
+	.format[PSC_VOLTAGE_IN] = direct,
+	.format[PSC_CURRENT_IN] = direct,
+	.format[PSC_VOLTAGE_OUT] = direct,
+	.format[PSC_TEMPERATURE] = direct,
+	.format[PSC_POWER] = direct,
+
+	.m[PSC_VOLTAGE_IN] = 16,
+	.b[PSC_VOLTAGE_IN] = 0,
+	.R[PSC_VOLTAGE_IN] = 0,
+
+	.m[PSC_CURRENT_IN] = 16,
+	.b[PSC_CURRENT_IN] = 0,
+	.R[PSC_CURRENT_IN] = 0,
+
+	.m[PSC_VOLTAGE_OUT] = 16,
+	.b[PSC_VOLTAGE_OUT] = 0,
+	.R[PSC_VOLTAGE_OUT] = 0,
+
+	.m[PSC_TEMPERATURE] = 4,
+	.b[PSC_TEMPERATURE] = 0,
+	.R[PSC_TEMPERATURE] = 0,
+
+	.m[PSC_POWER] = 25,
+	.b[PSC_POWER] = 0,
+	.R[PSC_POWER] = -2,
+
+	.read_word_data = mp5926_read_word_data,
+	.read_byte_data = mp5926_read_byte_data,
+	.func[0] = MP5926_FUNC,
+};
+
+static int mp5926_probe(struct i2c_client *client)
+{
+	struct mp5926_data *data;
+	struct pmbus_driver_info *info;
+	int ret;
+
+	data = devm_kzalloc(&client->dev, sizeof(struct mp5926_data),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	memcpy(&data->info, &mp5926_info, sizeof(*info));
+	info = &data->info;
+	ret = i2c_smbus_read_word_data(client, EFUSE_CFG);
+	if (ret < 0)
+		return ret;
+	if (ret & BIT(12)) {
+		data->vout_mode = linear;
+		data->info.format[PSC_VOLTAGE_IN] = linear;
+		data->info.format[PSC_CURRENT_IN] = linear;
+		data->info.format[PSC_VOLTAGE_OUT] = linear;
+		data->info.format[PSC_TEMPERATURE] = linear;
+		data->info.format[PSC_POWER] = linear;
+		ret = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
+		if (ret < 0)
+			return dev_err_probe(&client->dev, ret, "Can't get vout exponent.");
+		data->vout_linear_exponent = (u8)((ret >> 11) & 0x1f);
+	} else {
+		data->vout_mode = direct;
+		ret = i2c_smbus_read_word_data(client, I_SCALE_SEL);
+		if (ret < 0)
+			return ret;
+		if (ret & BIT(6))
+			data->info.m[PSC_CURRENT_IN] = 4;
+	}
+
+	return pmbus_do_probe(client, info);
+}
+
+static const struct i2c_device_id mp5926_id[] = {
+	{ "mp5926", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mp5926_id);
+
+static const struct of_device_id mp5926_of_match[] = {
+	{ .compatible = "mps,mp5926" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mp5926_of_match);
+
+static struct i2c_driver mp5926_driver = {
+	.probe = mp5926_probe,
+	.driver = {
+			.name = "mp5926",
+			.of_match_table = mp5926_of_match,
+		   },
+	.id_table = mp5926_id,
+};
+
+module_i2c_driver(mp5926_driver);
+MODULE_AUTHOR("Yuxi Wang <Yuxi.Wang@monolithicpower.com>");
+MODULE_DESCRIPTION("MPS MP5926 pmbus driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("PMBUS");
\ No newline at end of file
-- 
2.31.1


