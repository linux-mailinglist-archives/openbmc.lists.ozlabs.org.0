Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A0F34EF3A
	for <lists+openbmc@lfdr.de>; Tue, 30 Mar 2021 19:19:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8x5j4N97z3by6
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 04:19:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ccQUil7R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=ccQUil7R; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8x5S4mmRz2yxY
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 04:19:39 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A891F8C;
 Tue, 30 Mar 2021 10:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617124772;
 bh=D4WQHtkzJ9ihpqJ8CXBQxana3KkV35ONfFzFxKvgW3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ccQUil7R5DgjBkeZhFV+P2ud2RKzoMmPzi8aXyZ9yLwSQjKLS7wF77haKB5LLTizZ
 ia2lXLC7sCujDHstN0WqWxg4nBWaxB2bZFgQrbIVjeYoIkyBs28e1BnVjjOQM9fq0f
 X2q/Wp6BHu9QY2yc+2hNhPwmXGtXK64br8CzWUFM=
Date: Tue, 30 Mar 2021 12:19:29 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Enabling pmbus power control
Message-ID: <YGNdoYq5lyERVGLO@hatter.bewilderbeest.net>
References: <YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net>
 <5105ada1-643a-8e58-a52d-d3c8dbef86b9@roeck-us.net>
 <20210330112254.GB4976@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210330112254.GB4976@sirena.org.uk>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 30, 2021 at 06:22:54AM CDT, Mark Brown wrote:
>On Tue, Mar 30, 2021 at 03:34:16AM -0700, Guenter Roeck wrote:
>
>> (and I don't know if the userspace consumer code is appropriate - you
>> might want to check with the regulator maintainer on that).
>
>It's not, you should never see this in a production system.
>

Sorry, can you clarify what exactly "this" refers to here?

>> > first attempt at this ran into problems with all the
>> > reg-userspace-consumer instances getting attached to the first
>> > regulator device, I think due to all of the regulators ending up under
>> > the same name in the global namespace of regulator_map_list.  I worked
>> > around that by adding an ID counter to produce a unique name for each,
>> > though that changes device names in userspace-visible ways that I'm
>> > not sure would be considered OK for backwards compatibility.  (I'm not
>> > familiar enough with the regulator code to know if there's a better
>> > way of fixing that problem.)  The #if-ing to keep it behind a Kconfig
>
>> Maybe ask that question on the regulator mailing list.
>
>I can't really tell what the issue is here without more context, the
>global name list should not be relevant for much in a system that's well
>configured so it sounds like it's user error.

My initial attempt I guess followed the existing ltc2978 code a little 
too closely and I ended up with all my lm25066 regulators registered 
under the same (static) name, so when I went to attach the 
reg-userspace-consumer instances to them by way of that name I got this:

   # ls -l /sys/kernel/debug/regulator/7-004?-vout0
   /sys/kernel/debug/regulator/7-0040-vout0:
   -r--r--r--    1 root     root             0 Jan  1  1970 bypass_count
   -r--r--r--    1 root     root             0 Jan  1  1970 open_count
   drwxr-xr-x    2 root     root             0 Jan  1  1970 reg-userspace-consumer.0.auto-vout0
   drwxr-xr-x    2 root     root             0 Jan  1  1970 reg-userspace-consumer.1.auto-vout0
   drwxr-xr-x    2 root     root             0 Jan  1  1970 reg-userspace-consumer.2.auto-vout0
   -r--r--r--    1 root     root             0 Jan  1  1970 use_count
   
   /sys/kernel/debug/regulator/7-0041-vout0:
   -r--r--r--    1 root     root             0 Jan  1  1970 bypass_count
   -r--r--r--    1 root     root             0 Jan  1  1970 open_count
   -r--r--r--    1 root     root             0 Jan  1  1970 use_count
   
   /sys/kernel/debug/regulator/7-0043-vout0:
   -r--r--r--    1 root     root             0 Jan  1  1970 bypass_count
   -r--r--r--    1 root     root             0 Jan  1  1970 open_count
   -r--r--r--    1 root     root             0 Jan  1  1970 use_count

(When of course the intent is to have one reg-userspace-consumer for 
each regulator.)

I now have a revised version that takes Guenter's comments into account 
and puts this logic in the lm25066 driver instead of the pmbus core 
though, and in the process arrived at what I expect is a better solution 
to the name-collision problem at least (below).

Thanks,
Zev


diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 32d2fc850621..d9905e95d510 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -120,6 +120,21 @@ config SENSORS_LM25066
  	  This driver can also be built as a module. If so, the module will
  	  be called lm25066.
  
+config SENSORS_LM25066_REGULATOR
+	bool "Regulator support for LM25066 and compatibles"
+	depends on SENSORS_LM25066 && REGULATOR
+	help
+	  If you say yes here you get regulator support for National
+	  Semiconductor LM25056, LM25066, LM5064, and LM5066.
+
+config SENSORS_LM25066_USERSPACE_REGULATOR_CONSUMER
+	bool "Userspace regulator consumer support for PMBus devices"
+	depends on SENSORS_LM25066_REGULATOR && REGULATOR_USERSPACE_CONSUMER
+	help
+	  If you say yes here, regulator-enabled PMBus devices such as
+	  the LM25066 and LTC2978 will have their on/off state
+	  controllable from userspace via sysfs.
+
  config SENSORS_LTC2978
  	tristate "Linear Technologies LTC2978 and compatibles"
  	help
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index e9a66fd9e144..4e7e66d1ca8c 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -14,6 +14,9 @@
  #include <linux/slab.h>
  #include <linux/i2c.h>
  #include <linux/log2.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/userspace-consumer.h>
+#include <linux/platform_device.h>
  #include "pmbus.h"
  
  enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
@@ -207,6 +210,13 @@ struct lm25066_data {
  	int id;
  	u16 rlimit;			/* Maximum register value */
  	struct pmbus_driver_info info;
+
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_USERSPACE_REGULATOR_CONSUMER)
+	struct regulator_desc reg_desc;
+	struct regulator_bulk_data reg_supply;
+	struct regulator_userspace_consumer_data consumerdata;
+	struct platform_device platdev;
+#endif
  };
  
  #define to_lm25066_data(x)  container_of(x, struct lm25066_data, info)
@@ -413,9 +423,15 @@ static int lm25066_write_word_data(struct i2c_client *client, int page, int reg,
  	return ret;
  }
  
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
+static const struct regulator_desc lm25066_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+};
+#endif
+
  static int lm25066_probe(struct i2c_client *client)
  {
-	int config;
+	int config, status;
  	struct lm25066_data *data;
  	struct pmbus_driver_info *info;
  	struct __coeff *coeff;
@@ -483,7 +499,46 @@ static int lm25066_probe(struct i2c_client *client)
  		info->b[PSC_POWER] = coeff[PSC_POWER].b;
  	}
  
-	return pmbus_do_probe(client, info);
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_REGULATOR)
+	info->num_regulators = 1;
+
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_USERSPACE_REGULATOR_CONSUMER)
+	data->reg_desc = lm25066_reg_desc[0];
+	data->reg_desc.name = devm_kasprintf(&client->dev, GFP_KERNEL, "%s.%s",
+	                                     lm25066_reg_desc[0].name,
+	                                     dev_name(&client->dev));
+	if (!data->reg_desc.name)
+		return -ENOMEM;
+
+	info->reg_desc = &data->reg_desc;
+	info->reg_valid_ops = REGULATOR_CHANGE_STATUS;
+#else
+	info->reg_desc = &lm25066_reg_desc[0];
+#endif
+#endif
+
+	status = pmbus_do_probe(client, info);
+	if (status)
+		return status;
+
+#if IS_ENABLED(CONFIG_SENSORS_LM25066_USERSPACE_REGULATOR_CONSUMER)
+	data->reg_supply.supply = data->reg_desc.name;
+	data->consumerdata = (struct regulator_userspace_consumer_data) {
+		.name = data->reg_desc.name,
+		.num_supplies = 1,
+		.supplies = &data->reg_supply,
+		.init_on = true,
+	};
+	data->platdev = (struct platform_device) {
+		.name = "reg-userspace-consumer",
+		.id = PLATFORM_DEVID_AUTO,
+		.dev = { .platform_data = &data->consumerdata, },
+	};
+
+	status = platform_device_register(&data->platdev);
+#endif
+
+	return status;
  }
  
  static const struct i2c_device_id lm25066_id[] = {
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 4c30ec89f5bf..153220e2c363 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -451,6 +451,7 @@ struct pmbus_driver_info {
  	/* Regulator functionality, if supported by this chip driver. */
  	int num_regulators;
  	const struct regulator_desc *reg_desc;
+	unsigned int reg_valid_ops;
  
  	/* custom attributes */
  	const struct attribute_group **groups;
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index aadea85fe630..805e3a8d8bd9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2314,6 +2314,8 @@ static int pmbus_regulator_register(struct pmbus_data *data)
  				info->reg_desc[i].name);
  			return PTR_ERR(rdev);
  		}
+
+		rdev->constraints->valid_ops_mask |= info->reg_valid_ops;
  	}
  
  	return 0;

