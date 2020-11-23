Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C42C1368
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 20:04:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfxQr5tpJzDq8v
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 06:04:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cpumtOl8; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfxPc34gXzDqFt
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 06:03:15 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id t21so15131560pgl.3
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 11:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yMuGjAGAYA+5ImbfC3OSe/xsrUqI4pHb2wVel7Ahm0Y=;
 b=cpumtOl8Hz9K/isd0gwzNo8XSlMa4wMmT8gH7nLi/Mc16Nd4BOlI/+Mq6l4WyKKzR5
 eargzdQq2Z6yaF/D2/DWzFt4X0iwusR6LHTk90uX9o1s0gGWJ+Gl3R9KeRcov0jIBd/D
 ieQX8eU3sCM8QAvANmDPMq9bFYGRbA8MZHeM1h07Arc8Ft/4MN7k8C+MdILF1xt3Fas2
 db1VzZnZoguVudl4f0KhSFVpoEcO69ywT4gtWgAtGKHtNLHB0li9p3xEpNx8Zqtd/X03
 roxC1VjTUgOybpemA64HOjAYDMNh63oVORwXvvYdMWrYMLmLzS/e3BeZ42Lh1FP1DX9V
 mBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yMuGjAGAYA+5ImbfC3OSe/xsrUqI4pHb2wVel7Ahm0Y=;
 b=Z1FKb5ZjxZf4ZvMEKJAPPty19ZhRjlSTOeWeTxelupm+N0UcnlZB4Tb8NQj4+zC2co
 95xsCwljtjoNkTNqOv3Kb9sJmWPKjvve8k/7CUM0gCUjBhXy28cbbTwQCcKdiej1kt8f
 e4NvxKsMPgaJ5gJkUjl8k/akJafNVg0UlO8lmVAPESST1Gr7Ig53RRXCibeguLoIBXqi
 qllNUvBUg/Vd5cTMMJ+2vhP4+0du4StF2DegBEgOFHzaHBHYb+KAhq7GPvmWdDFBHIZn
 +q//RTp9s7zSuDKXrbyMVhvmhzhqor7qSk0ZHdq+Miesb4qxPVS2EqpnmkPdMDQVw/Vf
 NC6Q==
X-Gm-Message-State: AOAM531ohFYAQwkKq1VxGdeIO6bpjmIiPSEHxKF2+f872iXsBvav4eOj
 +Sk8GezXwxNOvxMmg4/flrCFXhhCelEaJCnm
X-Google-Smtp-Source: ABdhPJwl8aybCD5NSXzQDDjdEDdtIbfM9OHag1+2pZRRFIqG+7hmC9anyar4R3Lrk+dUKLLVIGRhzA==
X-Received: by 2002:a62:52c6:0:b029:18c:a1fa:2fc2 with SMTP id
 g189-20020a6252c60000b029018ca1fa2fc2mr777841pfb.50.1606158192579; 
 Mon, 23 Nov 2020 11:03:12 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id z128sm11365946pgz.69.2020.11.23.11.03.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Nov 2020 11:03:12 -0800 (PST)
Date: Mon, 23 Nov 2020 11:03:09 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 1/2] hwmon: (max127) Add Maxim MAX127 hardware
 monitoring driver
Message-ID: <20201123190308.GB7697@taoren-ubuntu-R90MNF91>
References: <20201123074532.3730-1-rentao.bupt@gmail.com>
 <20201123074532.3730-2-rentao.bupt@gmail.com>
 <20201123131832.GB136636@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123131832.GB136636@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 mikechoi@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 23, 2020 at 05:18:32AM -0800, Guenter Roeck wrote:
> On Sun, Nov 22, 2020 at 11:45:31PM -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add hardware monitoring driver for the Maxim MAX127 chip.
> > 
> > MAX127 min/max range handling code is inspired by the max197 driver.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  Changes in v4:
> >    - delete unnecessary "#include" lines.
> >    - simplify i2c_transfer() error handling.
> >    - add mutex to protect ctrl_byte in write_min|max() functions.
> >  Changes in v3:
> >    - no code change. xdp maintainers were removed from to/cc list.
> >  Changes in v2:
> >    - replace devm_hwmon_device_register_with_groups() with
> >      devm_hwmon_device_register_with_info() API.
> >    - divide min/max read and write methods to separate functions.
> >    - fix raw-to-vin conversion logic.
> >    - refine ctrl_byte handling so mutex is not needed to protect the
> >      byte.
> >    - improve i2c_transfer() error handling.
> >    - a few other improvements (comments, variable naming, and etc.).
> > 
> >  drivers/hwmon/Kconfig  |   9 ++
> >  drivers/hwmon/Makefile |   1 +
> >  drivers/hwmon/max127.c | 346 +++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 356 insertions(+)
> >  create mode 100644 drivers/hwmon/max127.c
> > 
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 9d600e0c5584..716df51edc87 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -950,6 +950,15 @@ config SENSORS_MAX1111
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called max1111.
> >  
> > +config SENSORS_MAX127
> > +	tristate "Maxim MAX127 12-bit 8-channel Data Acquisition System"
> > +	depends on I2C
> > +	help
> > +	  Say y here to support Maxim's MAX127 DAS chips.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called max127.
> > +
> >  config SENSORS_MAX16065
> >  	tristate "Maxim MAX16065 System Manager and compatibles"
> >  	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 1083bbfac779..01ca5d3fbad4 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -127,6 +127,7 @@ obj-$(CONFIG_SENSORS_LTC4260)	+= ltc4260.o
> >  obj-$(CONFIG_SENSORS_LTC4261)	+= ltc4261.o
> >  obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) += ltq-cputemp.o
> >  obj-$(CONFIG_SENSORS_MAX1111)	+= max1111.o
> > +obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
> >  obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
> >  obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
> >  obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
> > diff --git a/drivers/hwmon/max127.c b/drivers/hwmon/max127.c
> > new file mode 100644
> > index 000000000000..1c54146b6086
> > --- /dev/null
> > +++ b/drivers/hwmon/max127.c
> > @@ -0,0 +1,346 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Hardware monitoring driver for MAX127.
> > + *
> > + * Copyright (c) 2020 Facebook Inc.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +
> > +/*
> > + * MAX127 Control Byte. Refer to MAX127 datasheet, Table 1 "Control-Byte
> > + * Format" for details.
> > + */
> > +#define MAX127_CTRL_START	BIT(7)
> > +#define MAX127_CTRL_SEL_SHIFT	4
> > +#define MAX127_CTRL_RNG		BIT(3)
> > +#define MAX127_CTRL_BIP		BIT(2)
> > +#define MAX127_CTRL_PD1		BIT(1)
> > +#define MAX127_CTRL_PD0		BIT(0)
> > +
> > +#define MAX127_NUM_CHANNELS	8
> > +#define MAX127_SET_CHANNEL(ch)	(((ch) & 7) << MAX127_CTRL_SEL_SHIFT)
> > +
> > +/*
> > + * MAX127 channel input ranges. Refer to MAX127 datasheet, Table 3 "Range
> > + * and Polarity Selection" for details.
> > + */
> > +#define MAX127_FULL_RANGE	10000	/* 10V */
> > +#define MAX127_HALF_RANGE	5000	/* 5V */
> > +
> > +/*
> > + * MAX127 returns 2 bytes at read:
> > + *   - the first byte contains data[11:4].
> > + *   - the second byte contains data[3:0] (MSB) and 4 dummy 0s (LSB).
> > + * Refer to MAX127 datasheet, "Read a Conversion (Read Cycle)" section
> > + * for details.
> > + */
> > +#define MAX127_DATA_LEN		2
> > +#define MAX127_DATA_SHIFT	4
> > +
> > +#define MAX127_SIGN_BIT		BIT(11)
> > +
> > +struct max127_data {
> > +	struct mutex lock;
> > +	struct i2c_client *client;
> > +	u8 ctrl_byte[MAX127_NUM_CHANNELS];
> > +};
> > +
> > +static int max127_select_channel(struct i2c_client *client, u8 ctrl_byte)
> > +{
> > +	int status;
> > +	struct i2c_msg msg = {
> > +		.addr = client->addr,
> > +		.flags = 0,
> > +		.len = sizeof(ctrl_byte),
> > +		.buf = &ctrl_byte,
> > +	};
> > +
> > +	status = i2c_transfer(client->adapter, &msg, 1);
> > +
> > +	return (status == 1) ? 0 : -EIO;
> 
> This isn't what I said and asked for. It drops the unnecessary else,
> but now it overwrites an error value.
> 
> Guenter
> 
> > +}
> > +
> > +static int max127_read_channel(struct i2c_client *client, long *val)
> > +{
> > +	int status;
> > +	u8 i2c_data[MAX127_DATA_LEN];
> > +	struct i2c_msg msg = {
> > +		.addr = client->addr,
> > +		.flags = I2C_M_RD,
> > +		.len = sizeof(i2c_data),
> > +		.buf = i2c_data,
> > +	};
> > +
> > +	status = i2c_transfer(client->adapter, &msg, 1);
> > +	if (status != 1)
> > +		return -EIO;
> 
> This isn't what I asked for.
> 
> Guenter

Both places are fixed in v5. Thanks for the clarify, Guenter.


Cheers,

Tao
