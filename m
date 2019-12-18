Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B3125646
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 23:07:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dTdf3MdtzDqRG
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 09:07:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CdTi1vyj"; 
 dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dTcw55XhzDqRG
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 09:06:55 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id d5so1508200pjz.5
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 14:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JL3I5g3tDXNC+Ho9V3xOeqcDvD6Jy1DTTLJxwP+jIFM=;
 b=CdTi1vyjZd1Fy/Vz6i0pKBeZSTLdevkStx5RT1vkjTFKZxbsVyyD9Be6u0tLiUWDhy
 WhCkmPM1avBVGF7BVaNB3zghtSE9alx7v2L7x/Qhtli3EvBeeZ0ppiMz940nLXEcdffr
 7hI48kOhuCpnrI31Ex/pVN2s9rGbvPLn3BhLh6e82Sqnrk/3Mx8kkcc6+av/GZxmwHqd
 NLTINzly6W9GifJI7vhRCJJbd9vZWcYysDGu2r9vVkQtTKmzUipM0YquggT2jWwgQwhw
 zF2T1TUmW+4nFh3LF7rXhH26DdSpPXpkA1h01Yjn6WLGyZw+ze9fn3VTTO+fZ+OtaRCc
 8cFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=JL3I5g3tDXNC+Ho9V3xOeqcDvD6Jy1DTTLJxwP+jIFM=;
 b=A/2Q5QHdrzp55oG3WuPyu6uHwcw7ZtGux76aCj+9tVpSqUHsLfnm2L0sLg32Rq599x
 RUYmyoytghrF/GYALXbCiD1jD/AdKQkmjb4milcbF3oHJu95mn+lYRiwjoIHx1OgWuni
 r9A0+R5/WGOcZu95YB+Tz8He6iASVrNZpXSgUfoljD7ynoKu2+4AhbRgkzzrwAYQPEZh
 P/HBVDR8yQXPlWQEZNucdy+2P2LaDkPpv5mZRZ0hlyd6VXhjX5Ey4yVrPkQnil7vnyaH
 YdS+QdYTy3OQhK0Wn53MMlybgtEibwuXMv0vFW1mUO8RtiuTG0q7J+iTuOXmNHE7LGkZ
 RnmQ==
X-Gm-Message-State: APjAAAVPDjCoygy83JThOz0zBG1pvBXtqhLmmU673Xr6cr2Y+CY4A8mG
 Pe6dC8zQI3EBZmNMifQVc0A=
X-Google-Smtp-Source: APXvYqzpVsSsNcDxR5WEimSRVKgbWAqHSuGenVJqD1WSReaZpoG0SnSbomr9fdEj+i+WNlC576W64A==
X-Received: by 2002:a17:90a:cf11:: with SMTP id
 h17mr5538759pju.103.1576706811520; 
 Wed, 18 Dec 2019 14:06:51 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id b22sm1936600pft.110.2019.12.18.14.06.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Dec 2019 14:06:50 -0800 (PST)
Date: Wed, 18 Dec 2019 14:06:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jim Wright <wrightj@linux.vnet.ibm.com>
Subject: Re: [PATCH linux dev-5.4 v2 2/2] hwmon: Add support for UCD90320
 Power Sequencer
Message-ID: <20191218220649.GA24848@roeck-us.net>
References: <20191218212446.22676-1-wrightj@linux.vnet.ibm.com>
 <20191218212446.22676-3-wrightj@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218212446.22676-3-wrightj@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 18, 2019 at 03:24:46PM -0600, Jim Wright wrote:
> Add support for the UCD90320 chip and its expanded set of GPIO pins.
> 
> Signed-off-by: Jim Wright <wrightj@linux.vnet.ibm.com>
> Link: https://lore.kernel.org/r/20191205232411.21492-3-wrightj@linux.vnet.ibm.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Change log goes here. Also, the series wasn't sent to the hardware
monitoring mailing list, and thus doesn't show up on
https://patchwork.kernel.org/project/linux-hwmon/list/, which I use
for tracking.

Please resend to the proper mailing lists and include a change log.

Guenter

>  Documentation/hwmon/ucd9000.rst | 12 ++++++++--
>  drivers/hwmon/pmbus/Kconfig     |  6 ++---
>  drivers/hwmon/pmbus/ucd9000.c   | 39 +++++++++++++++++++++++----------
>  3 files changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/hwmon/ucd9000.rst b/Documentation/hwmon/ucd9000.rst
> index 746f21fcb48c..704f0cbd95d3 100644
> --- a/Documentation/hwmon/ucd9000.rst
> +++ b/Documentation/hwmon/ucd9000.rst
> @@ -3,9 +3,10 @@ Kernel driver ucd9000
>  
>  Supported chips:
>  
> -  * TI UCD90120, UCD90124, UCD90160, UCD9090, and UCD90910
> +  * TI UCD90120, UCD90124, UCD90160, UCD90320, UCD9090, and UCD90910
>  
> -    Prefixes: 'ucd90120', 'ucd90124', 'ucd90160', 'ucd9090', 'ucd90910'
> +    Prefixes: 'ucd90120', 'ucd90124', 'ucd90160', 'ucd90320', 'ucd9090',
> +              'ucd90910'
>  
>      Addresses scanned: -
>  
> @@ -14,6 +15,7 @@ Supported chips:
>  	- http://focus.ti.com/lit/ds/symlink/ucd90120.pdf
>  	- http://focus.ti.com/lit/ds/symlink/ucd90124.pdf
>  	- http://focus.ti.com/lit/ds/symlink/ucd90160.pdf
> +	- http://focus.ti.com/lit/ds/symlink/ucd90320.pdf
>  	- http://focus.ti.com/lit/ds/symlink/ucd9090.pdf
>  	- http://focus.ti.com/lit/ds/symlink/ucd90910.pdf
>  
> @@ -45,6 +47,12 @@ power-on reset signals, external interrupts, cascading, or other system
>  functions. Twelve of these pins offer PWM functionality. Using these pins, the
>  UCD90160 offers support for margining, and general-purpose PWM functions.
>  
> +The UCD90320 is a 32-rail PMBus/I2C addressable power-supply sequencer and
> +monitor. The 24 integrated ADC channels (AMONx) monitor the power supply
> +voltage, current, and temperature. Of the 84 GPIO pins, 8 can be used as
> +digital monitors (DMONx), 32 to enable the power supply (ENx), 24 for margining
> +(MARx), 16 for logical GPO, and 32 GPIs for cascading, and system function.
> +
>  The UCD9090 is a 10-rail PMBus/I2C addressable power-supply sequencer and
>  monitor. The device integrates a 12-bit ADC for monitoring up to 10 power-supply
>  voltage inputs. Twenty-three GPIO pins can be used for power supply enables,
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index d62d69bb7e49..61062632b22b 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -200,11 +200,11 @@ config SENSORS_TPS53679
>  	  be called tps53679.
>  
>  config SENSORS_UCD9000
> -	tristate "TI UCD90120, UCD90124, UCD90160, UCD9090, UCD90910"
> +	tristate "TI UCD90120, UCD90124, UCD90160, UCD90320, UCD9090, UCD90910"
>  	help
>  	  If you say yes here you get hardware monitoring support for TI
> -	  UCD90120, UCD90124, UCD90160, UCD9090, UCD90910, Sequencer and System
> -	  Health Controllers.
> +	  UCD90120, UCD90124, UCD90160, UCD90320, UCD9090, UCD90910, Sequencer
> +	  and System Health Controllers.
>  
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ucd9000.
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index a9229c6b0e84..23ea3415f166 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -18,7 +18,8 @@
>  #include <linux/gpio/driver.h>
>  #include "pmbus.h"
>  
> -enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
> +enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
> +	     ucd90910 };
>  
>  #define UCD9000_MONITOR_CONFIG		0xd5
>  #define UCD9000_NUM_PAGES		0xd6
> @@ -38,7 +39,7 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
>  #define UCD9000_GPIO_OUTPUT		1
>  
>  #define UCD9000_MON_TYPE(x)	(((x) >> 5) & 0x07)
> -#define UCD9000_MON_PAGE(x)	((x) & 0x0f)
> +#define UCD9000_MON_PAGE(x)	((x) & 0x1f)
>  
>  #define UCD9000_MON_VOLTAGE	1
>  #define UCD9000_MON_TEMPERATURE	2
> @@ -50,10 +51,12 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd9090, ucd90910 };
>  #define UCD9000_GPIO_NAME_LEN	16
>  #define UCD9090_NUM_GPIOS	23
>  #define UCD901XX_NUM_GPIOS	26
> +#define UCD90320_NUM_GPIOS	84
>  #define UCD90910_NUM_GPIOS	26
>  
>  #define UCD9000_DEBUGFS_NAME_LEN	24
>  #define UCD9000_GPI_COUNT		8
> +#define UCD90320_GPI_COUNT		32
>  
>  struct ucd9000_data {
>  	u8 fan_data[UCD9000_NUM_FAN][I2C_SMBUS_BLOCK_MAX];
> @@ -131,6 +134,7 @@ static const struct i2c_device_id ucd9000_id[] = {
>  	{"ucd90120", ucd90120},
>  	{"ucd90124", ucd90124},
>  	{"ucd90160", ucd90160},
> +	{"ucd90320", ucd90320},
>  	{"ucd9090", ucd9090},
>  	{"ucd90910", ucd90910},
>  	{}
> @@ -154,6 +158,10 @@ static const struct of_device_id __maybe_unused ucd9000_of_match[] = {
>  		.compatible = "ti,ucd90160",
>  		.data = (void *)ucd90160
>  	},
> +	{
> +		.compatible = "ti,ucd90320",
> +		.data = (void *)ucd90320
> +	},
>  	{
>  		.compatible = "ti,ucd9090",
>  		.data = (void *)ucd9090
> @@ -322,6 +330,9 @@ static void ucd9000_probe_gpio(struct i2c_client *client,
>  	case ucd90160:
>  		data->gpio.ngpio = UCD901XX_NUM_GPIOS;
>  		break;
> +	case ucd90320:
> +		data->gpio.ngpio = UCD90320_NUM_GPIOS;
> +		break;
>  	case ucd90910:
>  		data->gpio.ngpio = UCD90910_NUM_GPIOS;
>  		break;
> @@ -372,17 +383,18 @@ static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
>  	struct ucd9000_debugfs_entry *entry = data;
>  	struct i2c_client *client = entry->client;
>  	u8 buffer[I2C_SMBUS_BLOCK_MAX];
> -	int ret;
> +	int ret, i;
>  
>  	ret = ucd9000_get_mfr_status(client, buffer);
>  	if (ret < 0)
>  		return ret;
>  
>  	/*
> -	 * Attribute only created for devices with gpi fault bits at bits
> -	 * 16-23, which is the second byte of the response.
> +	 * GPI fault bits are in sets of 8, two bytes from end of response.
>  	 */
> -	*val = !!(buffer[1] & BIT(entry->index));
> +	i = ret - 3 - entry->index / 8;
> +	if (i >= 0)
> +		*val = !!(buffer[i] & BIT(entry->index % 8));
>  
>  	return 0;
>  }
> @@ -422,7 +434,7 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
>  {
>  	struct dentry *debugfs;
>  	struct ucd9000_debugfs_entry *entries;
> -	int i;
> +	int i, gpi_count;
>  	char name[UCD9000_DEBUGFS_NAME_LEN];
>  
>  	debugfs = pmbus_get_debugfs_dir(client);
> @@ -435,18 +447,21 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
>  
>  	/*
>  	 * Of the chips this driver supports, only the UCD9090, UCD90160,
> -	 * and UCD90910 report GPI faults in their MFR_STATUS register, so only
> -	 * create the GPI fault debugfs attributes for those chips.
> +	 * UCD90320, and UCD90910 report GPI faults in their MFR_STATUS
> +	 * register, so only create the GPI fault debugfs attributes for those
> +	 * chips.
>  	 */
>  	if (mid->driver_data == ucd9090 || mid->driver_data == ucd90160 ||
> -	    mid->driver_data == ucd90910) {
> +	    mid->driver_data == ucd90320 || mid->driver_data == ucd90910) {
> +		gpi_count = mid->driver_data == ucd90320 ? UCD90320_GPI_COUNT
> +							 : UCD9000_GPI_COUNT;
>  		entries = devm_kcalloc(&client->dev,
> -				       UCD9000_GPI_COUNT, sizeof(*entries),
> +				       gpi_count, sizeof(*entries),
>  				       GFP_KERNEL);
>  		if (!entries)
>  			return -ENOMEM;
>  
> -		for (i = 0; i < UCD9000_GPI_COUNT; i++) {
> +		for (i = 0; i < gpi_count; i++) {
>  			entries[i].client = client;
>  			entries[i].index = i;
>  			scnprintf(name, UCD9000_DEBUGFS_NAME_LEN,
> -- 
> 2.17.1
> 
