Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A980BFE1
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 04:30:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TKBSOs2+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpS1360FLz3dLh
	for <lists+openbmc@lfdr.de>; Mon, 11 Dec 2023 14:29:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TKBSOs2+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpRhS2sXsz30gM
	for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 14:15:35 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d06d42a58aso37347665ad.0
        for <openbmc@lists.ozlabs.org>; Sun, 10 Dec 2023 19:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702264532; x=1702869332; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlQbBJUOFRVDiG6vKHEIKVAFU+117kn2UrHR2PnF+30=;
        b=TKBSOs2+22VAdA2oBu1lLprfn9T/q93rNaKrUffl0YbYrHkx6XaxLMCG3sbf3rvBtg
         qYqhQ286WkEd4ZzBdU2uyq6BILSrZdSUj+6zcx0K64Yp+VG0bc+5K4hy0BtGLJ7F4IhT
         sQp6RJEkSOkvSacfWEy4szss2bGyokhwDcQE28SEcF4Nlw7kfcbgZ4WGWdNDyo50Y2kE
         YX8iWuxV48ZfDX2WSJzy2Zxbj/dTX3XFYHTFLMcdCNrnB1ih6i2tmRVCN8jUkEO2P4wi
         3YOm+1rylos29vYuiBnszwxXYKXffh+uYGDMvL86erxY+jaFZt8NeNRhZgQFS9MabqRM
         +WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702264532; x=1702869332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlQbBJUOFRVDiG6vKHEIKVAFU+117kn2UrHR2PnF+30=;
        b=Dx62RKMl8StfY8vYtu3IX+iCe6EcjmHmzPaWRWDBCcBeRJfupSXVF6tEcgMtu15QF6
         bbUaTTU1YGDSU58BuYOkd7UgEJ3RSwLXDdjYzXF0C+KIYM9oxqQbWFLpI/zmP8F8fc3X
         ZX+IPq+XfeQDaQBdhKy8KKEZLgLh7aHcZE17ARycCnWLP7IOnHjzGsZrgyigciJLI5hq
         q7vbhar9P56JFtk6XF4127Am+5Orqg3PzLAQKudzuRcfyvpDluTUaGiy2+/2xgYvRzpT
         2jI+7QqzZ/VFve+DBpcP/Oe3dpzqZg7PqmZJSaylMaYKLKARTV+j3ugnRiAwlKzl7Yz6
         Hvpw==
X-Gm-Message-State: AOJu0YyZGQ6bFgQYNWYi0lV64XfnU1gh26499O6x768qTPp0ihxz6LgP
	Ts4bWCdn1gkkpVTp1ukAZFMdPEcSSIY=
X-Google-Smtp-Source: AGHT+IGreadHygqDYbPyw+IGn/duaVhfQjTD4JNkMkmBZAShlSEYbD21zv67GyPap4JbY91Uy+Xjyg==
X-Received: by 2002:a17:902:dacf:b0:1d0:3358:4e26 with SMTP id q15-20020a170902dacf00b001d033584e26mr4743359plx.1.1702264531933;
        Sun, 10 Dec 2023 19:15:31 -0800 (PST)
Received: from localhost.localdomain (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001d05456394csm5428080plg.28.2023.12.10.19.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 19:15:31 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openbmc@lists.ozlabs.org,
	joel@jms.id.au
Subject: [PATCH linux dev-6.6 2/2] iio: temperature: Add MCP9600 thermocouple EMF converter
Date: Mon, 11 Dec 2023 11:13:19 +0800
Message-Id: <20231211031319.3810692-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231211031319.3810692-1-potin.lai.pt@gmail.com>
References: <20231211031319.3810692-1-potin.lai.pt@gmail.com>
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
Cc: potin.lai@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Hepp <andrew.hepp@ahepp.dev>

Add support for the MCP9600 thermocouple electromotive force converter. The sensor has  integrated cold junction compensation and a typical accuracy of 0.5 degrees Celsius. The driver supports a resolution of 0.0625 degrees Celsius.

Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/MCP960X-Data-Sheet-20005426.pdf
Signed-off-by: Andrew Hepp <andrew.hepp@ahepp.dev>
---
 drivers/iio/temperature/Kconfig   |  10 +++
 drivers/iio/temperature/Makefile  |   1 +
 drivers/iio/temperature/mcp9600.c | 139 ++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 drivers/iio/temperature/mcp9600.c

diff --git a/drivers/iio/temperature/Kconfig b/drivers/iio/temperature/Kconfig
index ed384f33e0c76..ea2ce364b2e91 100644
--- a/drivers/iio/temperature/Kconfig
+++ b/drivers/iio/temperature/Kconfig
@@ -158,4 +158,14 @@ config MAX31865
 	  This driver can also be build as a module. If so, the module
 	  will be called max31865.
 
+config MCP9600
+	tristate "MCP9600 thermocouple EMF converter"
+	depends on I2C
+	help
+	  If you say yes here you get support for MCP9600
+	  thermocouple EMF converter connected via I2C.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called mcp9600.
+
 endmenu
diff --git a/drivers/iio/temperature/Makefile b/drivers/iio/temperature/Makefile
index dfec8c6d30193..9330d4a39598d 100644
--- a/drivers/iio/temperature/Makefile
+++ b/drivers/iio/temperature/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_MAXIM_THERMOCOUPLE) += maxim_thermocouple.o
 obj-$(CONFIG_MAX30208) += max30208.o
 obj-$(CONFIG_MAX31856) += max31856.o
 obj-$(CONFIG_MAX31865) += max31865.o
+obj-$(CONFIG_MCP9600) += mcp9600.o
 obj-$(CONFIG_MLX90614) += mlx90614.o
 obj-$(CONFIG_MLX90632) += mlx90632.o
 obj-$(CONFIG_TMP006) += tmp006.o
diff --git a/drivers/iio/temperature/mcp9600.c b/drivers/iio/temperature/mcp9600.c
new file mode 100644
index 0000000000000..46845804292bf
--- /dev/null
+++ b/drivers/iio/temperature/mcp9600.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * mcp9600.c - Support for Microchip MCP9600 thermocouple EMF converter
+ *
+ * Copyright (c) 2022 Andrew Hepp
+ * Author: <andrew.hepp@ahepp.dev>
+ */
+
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+
+#include <linux/iio/iio.h>
+
+/* MCP9600 registers */
+#define MCP9600_HOT_JUNCTION 0x0
+#define MCP9600_COLD_JUNCTION 0x2
+#define MCP9600_DEVICE_ID 0x20
+
+/* MCP9600 device id value */
+#define MCP9600_DEVICE_ID_MCP9600 0x40
+
+static const struct iio_chan_spec mcp9600_channels[] = {
+	{
+		.type = IIO_TEMP,
+		.address = MCP9600_HOT_JUNCTION,
+		.info_mask_separate =
+			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
+	},
+	{
+		.type = IIO_TEMP,
+		.address = MCP9600_COLD_JUNCTION,
+		.channel2 = IIO_MOD_TEMP_AMBIENT,
+		.modified = 1,
+		.info_mask_separate =
+			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
+	},
+};
+
+struct mcp9600_data {
+	struct i2c_client *client;
+};
+
+static int mcp9600_read(struct mcp9600_data *data,
+			struct iio_chan_spec const *chan, int *val)
+{
+	int ret;
+
+	ret = i2c_smbus_read_word_swapped(data->client, chan->address);
+
+	if (ret < 0)
+		return ret;
+	*val = ret;
+
+	return 0;
+}
+
+static int mcp9600_read_raw(struct iio_dev *indio_dev,
+			    struct iio_chan_spec const *chan, int *val,
+			    int *val2, long mask)
+{
+	struct mcp9600_data *data = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = mcp9600_read(data, chan, val);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		*val = 62;
+		*val2 = 500000;
+		return IIO_VAL_INT_PLUS_MICRO;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info mcp9600_info = {
+	.read_raw = mcp9600_read_raw,
+};
+
+static int mcp9600_probe(struct i2c_client *client)
+{
+	struct iio_dev *indio_dev;
+	struct mcp9600_data *data;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, MCP9600_DEVICE_ID);
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Failed to read device ID\n");
+	if (ret != MCP9600_DEVICE_ID_MCP9600)
+		dev_warn(&client->dev, "Expected ID %x, got %x\n",
+				MCP9600_DEVICE_ID_MCP9600, ret);
+
+	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+	data->client = client;
+
+	indio_dev->info = &mcp9600_info;
+	indio_dev->name = "mcp9600";
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->channels = mcp9600_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mcp9600_channels);
+
+	return devm_iio_device_register(&client->dev, indio_dev);
+}
+
+static const struct i2c_device_id mcp9600_id[] = {
+	{ "mcp9600" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, mcp9600_id);
+
+static const struct of_device_id mcp9600_of_match[] = {
+	{ .compatible = "microchip,mcp9600" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mcp9600_of_match);
+
+static struct i2c_driver mcp9600_driver = {
+	.driver = {
+		.name = "mcp9600",
+		.of_match_table = mcp9600_of_match,
+	},
+	.probe = mcp9600_probe,
+	.id_table = mcp9600_id
+};
+module_i2c_driver(mcp9600_driver);
+
+MODULE_AUTHOR("Andrew Hepp <andrew.hepp@ahepp.dev>");
+MODULE_DESCRIPTION("Microchip MCP9600 thermocouple EMF converter driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1

