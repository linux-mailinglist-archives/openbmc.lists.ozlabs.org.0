Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B8B4C5CA4
	for <lists+openbmc@lfdr.de>; Sun, 27 Feb 2022 16:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K67BQ4gSfz3bT4
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 02:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JwSrpfpz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2a;
 helo=mail-oo1-xc2a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JwSrpfpz; dkim-atps=neutral
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K679y27Wrz30H5
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 02:44:53 +1100 (AEDT)
Received: by mail-oo1-xc2a.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso15107195ooi.1
 for <openbmc@lists.ozlabs.org>; Sun, 27 Feb 2022 07:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=gfl7I5D2npqKNBvMC5zo7AXlpUklky/uA3ilaow4NAQ=;
 b=JwSrpfpzvRdA9T3NtOk9gPJcZVu53cCofSX6oNIkIRbN+8o5yy21hoGsyxmd2Tc1Zb
 4HjVLbPtM1T16mKjTnwHShfbmXz9m65dKPlxaow4fDhA9npoP6RfCWbX9oLGv4eVj2ix
 DOT2si+rPeSqIK3gBMh9Dc8eMlgpGkq0cLBjQfeSow5O4P2nFWah7TyuqjNoQjOSjCHb
 Vi9sy9evWzQKyuGTAHpnOkcKer9GB4fsk1iQ83RtOP9DUd2vZzSDRTPg+QCp8K7XvuLm
 Xt/LdRDutExQ8ZQi7oZk0PGTXEmow3jGbQBfHErEYmmeNnk2Eel3wZ+ArxB9mPzf54tr
 C9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=gfl7I5D2npqKNBvMC5zo7AXlpUklky/uA3ilaow4NAQ=;
 b=czdR5TyVKQf1IToMDKrD8fR1tLkhoiOekXtkNgLDHt58zcU+1uHfD/PhoicAbbVNxw
 s25rp7u2WGqkUR177oJdtg/Q+TLlKf58KEyPodxLUakTdlRx3CXbDWIo8UX2DY+N8les
 caqyDuzolLcwlEmSX6fVZTaeDMWqRjeJ1hz9v+vROXX9e7CwfIMxYpbnuR3ftwDUVkOa
 gpsRVsmV4x4kFZx4gCsvNOW+ZwwoddgeaIVtAIxxlg8q4MLZ7J71J31UQbWnDYsA5XRc
 zyjmef9LcduRYUUxkWBm6QtgfksFbp9BuWUBH1xAr64rQRdn95MyR81eAVPWx2YTruvi
 zwCA==
X-Gm-Message-State: AOAM530UDUo30aFB0YoZNA9+ls6O9XZrwQ28iUp1VTp7L/8RZEj0JHDC
 E1JkjAQbt8RVMZphRM7flU8=
X-Google-Smtp-Source: ABdhPJzvwS0wS2R2xS9fcK1KpPM0baUvMys6hgFd6I1dwQBipWOQ3X+uH9uOd92foZ27kFPesmzeDg==
X-Received: by 2002:a05:6870:287:b0:d2:7cd0:21fb with SMTP id
 q7-20020a056870028700b000d27cd021fbmr5722328oaf.266.1645976689751; 
 Sun, 27 Feb 2022 07:44:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05687073ca00b000d128dfeebfsm3494594oan.2.2022.02.27.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 07:44:48 -0800 (PST)
Date: Sun, 27 Feb 2022 07:44:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 3/5] hwmon: (nct6775) Split core and platform driver
Message-ID: <20220227154447.GA766647@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Feb 26, 2022 at 05:30:45AM -0800, Zev Weiss wrote:
> This splits the nct6775 driver into an interface-independent core and
> a separate platform driver that wraps inb/outb port I/O (or asuswmi
> methods) around that core.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I think it would be much better to convert the entire driver to regmap
and not just use regmap for i2c. This way all register read/write
operations can be hidden behind regmap, and the read/write callbacks
are unnecessary. The tmp401 driver gives an example how to do this -
essentially implement reg_read and reg_write functions in struct
regmap_config, then handle all register accesses through regmap.

Couple of additional comments inline.

Guenter

> ---
>  MAINTAINERS                                 |    6 +-
>  drivers/hwmon/Kconfig                       |   15 +-
>  drivers/hwmon/Makefile                      |    3 +-
>  drivers/hwmon/{nct6775.c => nct6775-core.c} | 1405 +------------------
>  drivers/hwmon/nct6775-platform.c            | 1185 ++++++++++++++++
>  drivers/hwmon/nct6775.h                     |  233 +++
>  6 files changed, 1467 insertions(+), 1380 deletions(-)
>  rename drivers/hwmon/{nct6775.c => nct6775-core.c} (76%)
>  create mode 100644 drivers/hwmon/nct6775-platform.c
>  create mode 100644 drivers/hwmon/nct6775.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3dc7c8d21fd6..d318a5580df9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13284,12 +13284,14 @@ M:	Samuel Mendoza-Jonas <sam@mendozajonas.com>
>  S:	Maintained
>  F:	net/ncsi/
>  
> -NCT6775 HARDWARE MONITOR DRIVER
> +NCT6775 HARDWARE MONITOR DRIVER - CORE & PLATFORM DRIVER
>  M:	Guenter Roeck <linux@roeck-us.net>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/hwmon/nct6775.rst
> -F:	drivers/hwmon/nct6775.c
> +F:	drivers/hwmon/nct6775-core.c
> +F:	drivers/hwmon/nct6775-platform.c
> +F:	drivers/hwmon/nct6775.h
>  
>  NETDEVSIM
>  M:	Jakub Kicinski <kuba@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 463d5b110a85..11822e8a2cda 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1458,9 +1458,20 @@ config SENSORS_NCT6683
>  	  will be called nct6683.
>  
>  config SENSORS_NCT6775
> -	tristate "Nuvoton NCT6775F and compatibles"
> +	tristate
> +	help
> +	  This module contains common code shared by the platform and
> +	  i2c versions of the nct6775 driver; it is not useful on its
> +	  own.
> +
> +	  If built as a module, the module will be called
> +	  nct6775-core.
> +
> +config SENSORS_NCT6775_PLATFORM
> +	tristate "Platform driver for Nuvoton NCT6775F and compatibles"
>  	depends on !PPC
>  	depends on ACPI_WMI || ACPI_WMI=n
> +	select SENSORS_NCT6775
>  	select HWMON_VID
>  	help
>  	  If you say yes here you get support for the hardware monitoring
> @@ -1470,7 +1481,7 @@ config SENSORS_NCT6775
>  	  NCT6775F and NCT6776F.
>  
>  	  This driver can also be built as a module. If so, the module
> -	  will be called nct6775.
> +	  will be called nct6775-platform.
>  
>  config SENSORS_NCT7802
>  	tristate "Nuvoton NCT7802Y"
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 7bba3415ca3d..5f37b2c0f79a 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -154,7 +154,8 @@ obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
>  obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
>  obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
> -obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775.o
> +obj-$(CONFIG_SENSORS_NCT6775)	+= nct6775-core.o
> +obj-$(CONFIG_SENSORS_NCT6775_PLATFORM) += nct6775-platform.o
>  obj-$(CONFIG_SENSORS_NCT7802)	+= nct7802.o
>  obj-$(CONFIG_SENSORS_NCT7904)	+= nct7904.o
>  obj-$(CONFIG_SENSORS_NPCM7XX)	+= npcm750-pwm-fan.o
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775-core.c
> similarity index 76%
> rename from drivers/hwmon/nct6775.c
> rename to drivers/hwmon/nct6775-core.c
> index c5b28a693461..095e9eced752 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -44,25 +44,17 @@
>  #include <linux/init.h>
>  #include <linux/slab.h>
>  #include <linux/jiffies.h>
> -#include <linux/platform_device.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> -#include <linux/hwmon-vid.h>
>  #include <linux/err.h>
>  #include <linux/mutex.h>
> -#include <linux/acpi.h>
>  #include <linux/bitops.h>
> -#include <linux/dmi.h>
> -#include <linux/io.h>
>  #include <linux/nospec.h>
> -#include <linux/wmi.h>
>  #include "lm75.h"
> +#include "nct6775.h"
>  
>  #define USE_ALTERNATE
>  
> -enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
> -	     nct6793, nct6795, nct6796, nct6797, nct6798 };
> -
>  /* used to set data->name = nct6775_device_names[data->sio_kind] */
>  static const char * const nct6775_device_names[] = {
>  	"nct6106",
> @@ -79,242 +71,6 @@ static const char * const nct6775_device_names[] = {
>  	"nct6798",
>  };
>  
> -static const char * const nct6775_sio_names[] __initconst = {
> -	"NCT6106D",
> -	"NCT6116D",
> -	"NCT6775F",
> -	"NCT6776D/F",
> -	"NCT6779D",
> -	"NCT6791D",
> -	"NCT6792D",
> -	"NCT6793D",
> -	"NCT6795D",
> -	"NCT6796D",
> -	"NCT6797D",
> -	"NCT6798D",
> -};
> -
> -static unsigned short force_id;
> -module_param(force_id, ushort, 0);
> -MODULE_PARM_DESC(force_id, "Override the detected device ID");
> -
> -static unsigned short fan_debounce;
> -module_param(fan_debounce, ushort, 0);
> -MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
> -
> -#define DRVNAME "nct6775"
> -
> -/*
> - * Super-I/O constants and functions
> - */
> -
> -#define NCT6775_LD_ACPI		0x0a
> -#define NCT6775_LD_HWM		0x0b
> -#define NCT6775_LD_VID		0x0d
> -#define NCT6775_LD_12		0x12
> -
> -#define SIO_REG_LDSEL		0x07	/* Logical device select */
> -#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
> -#define SIO_REG_ENABLE		0x30	/* Logical device enable */
> -#define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
> -
> -#define SIO_NCT6106_ID		0xc450
> -#define SIO_NCT6116_ID		0xd280
> -#define SIO_NCT6775_ID		0xb470
> -#define SIO_NCT6776_ID		0xc330
> -#define SIO_NCT6779_ID		0xc560
> -#define SIO_NCT6791_ID		0xc800
> -#define SIO_NCT6792_ID		0xc910
> -#define SIO_NCT6793_ID		0xd120
> -#define SIO_NCT6795_ID		0xd350
> -#define SIO_NCT6796_ID		0xd420
> -#define SIO_NCT6797_ID		0xd450
> -#define SIO_NCT6798_ID		0xd428
> -#define SIO_ID_MASK		0xFFF8
> -
> -enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
> -enum sensor_access { access_direct, access_asuswmi };
> -
> -struct nct6775_sio_data {
> -	int sioreg;
> -	int ld;
> -	enum kinds kind;
> -	enum sensor_access access;
> -
> -	/* superio_() callbacks  */
> -	void (*sio_outb)(struct nct6775_sio_data *sio_data, int reg, int val);
> -	int (*sio_inb)(struct nct6775_sio_data *sio_data, int reg);
> -	void (*sio_select)(struct nct6775_sio_data *sio_data, int ld);
> -	int (*sio_enter)(struct nct6775_sio_data *sio_data);
> -	void (*sio_exit)(struct nct6775_sio_data *sio_data);
> -};
> -
> -#define ASUSWMI_MONITORING_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
> -#define ASUSWMI_METHODID_RSIO		0x5253494F
> -#define ASUSWMI_METHODID_WSIO		0x5753494F
> -#define ASUSWMI_METHODID_RHWM		0x5248574D
> -#define ASUSWMI_METHODID_WHWM		0x5748574D
> -#define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
> -
> -static int nct6775_asuswmi_evaluate_method(u32 method_id, u8 bank, u8 reg, u8 val, u32 *retval)
> -{
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> -	u32 args = bank | (reg << 8) | (val << 16);
> -	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> -	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> -	acpi_status status;
> -	union acpi_object *obj;
> -	u32 tmp = ASUSWMI_UNSUPPORTED_METHOD;
> -
> -	status = wmi_evaluate_method(ASUSWMI_MONITORING_GUID, 0,
> -				     method_id, &input, &output);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -
> -	obj = output.pointer;
> -	if (obj && obj->type == ACPI_TYPE_INTEGER)
> -		tmp = obj->integer.value;
> -
> -	if (retval)
> -		*retval = tmp;
> -
> -	kfree(obj);
> -
> -	if (tmp == ASUSWMI_UNSUPPORTED_METHOD)
> -		return -ENODEV;
> -	return 0;
> -#else
> -	return -EOPNOTSUPP;
> -#endif
> -}
> -
> -static inline int nct6775_asuswmi_write(u8 bank, u8 reg, u8 val)
> -{
> -	return nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_WHWM, bank,
> -					      reg, val, NULL);
> -}
> -
> -static inline int nct6775_asuswmi_read(u8 bank, u8 reg, u8 *val)
> -{
> -	u32 ret, tmp = 0;
> -
> -	ret = nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_RHWM, bank,
> -					      reg, 0, &tmp);
> -	*val = tmp;
> -	return ret;
> -}
> -
> -static int superio_wmi_inb(struct nct6775_sio_data *sio_data, int reg)
> -{
> -	int tmp = 0;
> -
> -	nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_RSIO, sio_data->ld,
> -					reg, 0, &tmp);
> -	return tmp;
> -}
> -
> -static void superio_wmi_outb(struct nct6775_sio_data *sio_data, int reg, int val)
> -{
> -	nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_WSIO, sio_data->ld,
> -					reg, val, NULL);
> -}
> -
> -static void superio_wmi_select(struct nct6775_sio_data *sio_data, int ld)
> -{
> -	sio_data->ld = ld;
> -}
> -
> -static int superio_wmi_enter(struct nct6775_sio_data *sio_data)
> -{
> -	return 0;
> -}
> -
> -static void superio_wmi_exit(struct nct6775_sio_data *sio_data)
> -{
> -}
> -
> -static void superio_outb(struct nct6775_sio_data *sio_data, int reg, int val)
> -{
> -	int ioreg = sio_data->sioreg;
> -
> -	outb(reg, ioreg);
> -	outb(val, ioreg + 1);
> -}
> -
> -static int superio_inb(struct nct6775_sio_data *sio_data, int reg)
> -{
> -	int ioreg = sio_data->sioreg;
> -
> -	outb(reg, ioreg);
> -	return inb(ioreg + 1);
> -}
> -
> -static void superio_select(struct nct6775_sio_data *sio_data, int ld)
> -{
> -	int ioreg = sio_data->sioreg;
> -
> -	outb(SIO_REG_LDSEL, ioreg);
> -	outb(ld, ioreg + 1);
> -}
> -
> -static int superio_enter(struct nct6775_sio_data *sio_data)
> -{
> -	int ioreg = sio_data->sioreg;
> -
> -	/*
> -	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
> -	 */
> -	if (!request_muxed_region(ioreg, 2, DRVNAME))
> -		return -EBUSY;
> -
> -	outb(0x87, ioreg);
> -	outb(0x87, ioreg);
> -
> -	return 0;
> -}
> -
> -static void superio_exit(struct nct6775_sio_data *sio_data)
> -{
> -	int ioreg = sio_data->sioreg;
> -
> -	outb(0xaa, ioreg);
> -	outb(0x02, ioreg);
> -	outb(0x02, ioreg + 1);
> -	release_region(ioreg, 2);
> -}
> -
> -/*
> - * ISA constants
> - */
> -
> -#define IOREGION_ALIGNMENT	(~7)
> -#define IOREGION_OFFSET		5
> -#define IOREGION_LENGTH		2
> -#define ADDR_REG_OFFSET		0
> -#define DATA_REG_OFFSET		1
> -
> -#define NCT6775_REG_BANK	0x4E
> -#define NCT6775_REG_CONFIG	0x40
> -#define NCT6775_PORT_CHIPID	0x58
> -
> -/*
> - * Not currently used:
> - * REG_MAN_ID has the value 0x5ca3 for all supported chips.
> - * REG_CHIP_ID == 0x88/0xa1/0xc1 depending on chip model.
> - * REG_MAN_ID is at port 0x4f
> - * REG_CHIP_ID is at port 0x58
> - */
> -
> -#define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
> -#define NUM_TEMP_FIXED	6	/* Max number of fixed temp attribute sets */
> -#define NUM_TSI_TEMP	8	/* Max number of TSI temp register pairs */
> -
> -#define NUM_REG_ALARM	7	/* Max number of alarm registers */
> -#define NUM_REG_BEEP	5	/* Max number of beep registers */
> -
> -#define NUM_FAN		7
> -
>  /* Common and NCT6775 specific data */
>  
>  /* Voltage min/max registers for nr=7..14 are in bank 5 */
> @@ -333,11 +89,6 @@ static const u16 NCT6775_REG_IN[] = {
>  #define NCT6775_REG_DIODE		0x5E
>  #define NCT6775_DIODE_MASK		0x02
>  
> -#define NCT6775_REG_FANDIV1		0x506
> -#define NCT6775_REG_FANDIV2		0x507
> -
> -#define NCT6775_REG_CR_FAN_DEBOUNCE	0xf0
> -
>  static const u16 NCT6775_REG_ALARM[NUM_REG_ALARM] = { 0x459, 0x45A, 0x45B };
>  
>  /* 0..15 voltages, 16..23 fans, 24..29 temperatures, 30..31 intrusion */
> @@ -351,10 +102,6 @@ static const s8 NCT6775_ALARM_BITS[] = {
>  	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
>  	12, -1 };			/* intrusion0, intrusion1 */
>  
> -#define FAN_ALARM_BASE		16
> -#define TEMP_ALARM_BASE		24
> -#define INTRUSION_ALARM_BASE	30
> -
>  static const u16 NCT6775_REG_BEEP[NUM_REG_BEEP] = { 0x56, 0x57, 0x453, 0x4e };
>  
>  /*
> @@ -370,11 +117,6 @@ static const s8 NCT6775_BEEP_BITS[] = {
>  	4, 5, 13, -1, -1, -1,		/* temp1..temp6 */
>  	12, -1 };			/* intrusion0, intrusion1 */
>  
> -#define BEEP_ENABLE_BASE		15
> -
> -static const u8 NCT6775_REG_CR_CASEOPEN_CLR[] = { 0xe6, 0xee };
> -static const u8 NCT6775_CR_CASEOPEN_CLR_MASK[] = { 0x20, 0x01 };
> -
>  /* DC or PWM output fan configuration */
>  static const u8 NCT6775_REG_PWM_MODE[] = { 0x04, 0x04, 0x12 };
>  static const u8 NCT6775_PWM_MODE_MASK[] = { 0x01, 0x02, 0x01 };
> @@ -690,8 +432,6 @@ static const u16 NCT6779_REG_TEMP_CRIT[32] = {
>  
>  /* NCT6791 specific data */
>  
> -#define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
> -
>  static const u16 NCT6791_REG_WEIGHT_TEMP_SEL[NUM_FAN] = { 0, 0x239 };
>  static const u16 NCT6791_REG_WEIGHT_TEMP_STEP[NUM_FAN] = { 0, 0x23a };
>  static const u16 NCT6791_REG_WEIGHT_TEMP_STEP_TOL[NUM_FAN] = { 0, 0x23b };
> @@ -1191,168 +931,6 @@ static inline unsigned int tsi_temp_from_reg(unsigned int reg)
>   * Data structures and manipulation thereof
>   */
>  
> -struct nct6775_data {
> -	int addr;	/* IO base of hw monitor block */
> -	struct nct6775_sio_data *sio_data;
> -	enum kinds kind;
> -	const char *name;
> -
> -	const struct attribute_group *groups[7];
> -	u8 num_groups;
> -
> -	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
> -				    * 3=temp_crit, 4=temp_lcrit
> -				    */
> -	u8 temp_src[NUM_TEMP];
> -	u16 reg_temp_config[NUM_TEMP];
> -	const char * const *temp_label;
> -	u32 temp_mask;
> -	u32 virt_temp_mask;
> -
> -	u16 REG_CONFIG;
> -	u16 REG_VBAT;
> -	u16 REG_DIODE;
> -	u8 DIODE_MASK;
> -
> -	const s8 *ALARM_BITS;
> -	const s8 *BEEP_BITS;
> -
> -	const u16 *REG_VIN;
> -	const u16 *REG_IN_MINMAX[2];
> -
> -	const u16 *REG_TARGET;
> -	const u16 *REG_FAN;
> -	const u16 *REG_FAN_MODE;
> -	const u16 *REG_FAN_MIN;
> -	const u16 *REG_FAN_PULSES;
> -	const u16 *FAN_PULSE_SHIFT;
> -	const u16 *REG_FAN_TIME[3];
> -
> -	const u16 *REG_TOLERANCE_H;
> -
> -	const u8 *REG_PWM_MODE;
> -	const u8 *PWM_MODE_MASK;
> -
> -	const u16 *REG_PWM[7];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
> -				 * [3]=pwm_max, [4]=pwm_step,
> -				 * [5]=weight_duty_step, [6]=weight_duty_base
> -				 */
> -	const u16 *REG_PWM_READ;
> -
> -	const u16 *REG_CRITICAL_PWM_ENABLE;
> -	u8 CRITICAL_PWM_ENABLE_MASK;
> -	const u16 *REG_CRITICAL_PWM;
> -
> -	const u16 *REG_AUTO_TEMP;
> -	const u16 *REG_AUTO_PWM;
> -
> -	const u16 *REG_CRITICAL_TEMP;
> -	const u16 *REG_CRITICAL_TEMP_TOLERANCE;
> -
> -	const u16 *REG_TEMP_SOURCE;	/* temp register sources */
> -	const u16 *REG_TEMP_SEL;
> -	const u16 *REG_WEIGHT_TEMP_SEL;
> -	const u16 *REG_WEIGHT_TEMP[3];	/* 0=base, 1=tolerance, 2=step */
> -
> -	const u16 *REG_TEMP_OFFSET;
> -
> -	const u16 *REG_ALARM;
> -	const u16 *REG_BEEP;
> -
> -	const u16 *REG_TSI_TEMP;
> -
> -	unsigned int (*fan_from_reg)(u16 reg, unsigned int divreg);
> -	unsigned int (*fan_from_reg_min)(u16 reg, unsigned int divreg);
> -
> -	struct mutex update_lock;
> -	bool valid;		/* true if following fields are valid */
> -	unsigned long last_updated;	/* In jiffies */
> -
> -	/* Register values */
> -	u8 bank;		/* current register bank */
> -	u8 in_num;		/* number of in inputs we have */
> -	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
> -	unsigned int rpm[NUM_FAN];
> -	u16 fan_min[NUM_FAN];
> -	u8 fan_pulses[NUM_FAN];
> -	u8 fan_div[NUM_FAN];
> -	u8 has_pwm;
> -	u8 has_fan;		/* some fan inputs can be disabled */
> -	u8 has_fan_min;		/* some fans don't have min register */
> -	bool has_fan_div;
> -
> -	u8 num_temp_alarms;	/* 2, 3, or 6 */
> -	u8 num_temp_beeps;	/* 2, 3, or 6 */
> -	u8 temp_fixed_num;	/* 3 or 6 */
> -	u8 temp_type[NUM_TEMP_FIXED];
> -	s8 temp_offset[NUM_TEMP_FIXED];
> -	s16 temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
> -				* 3=temp_crit, 4=temp_lcrit */
> -	s16 tsi_temp[NUM_TSI_TEMP];
> -	u64 alarms;
> -	u64 beeps;
> -
> -	u8 pwm_num;	/* number of pwm */
> -	u8 pwm_mode[NUM_FAN];	/* 0->DC variable voltage,
> -				 * 1->PWM variable duty cycle
> -				 */
> -	enum pwm_enable pwm_enable[NUM_FAN];
> -			/* 0->off
> -			 * 1->manual
> -			 * 2->thermal cruise mode (also called SmartFan I)
> -			 * 3->fan speed cruise mode
> -			 * 4->SmartFan III
> -			 * 5->enhanced variable thermal cruise (SmartFan IV)
> -			 */
> -	u8 pwm[7][NUM_FAN];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
> -				 * [3]=pwm_max, [4]=pwm_step,
> -				 * [5]=weight_duty_step, [6]=weight_duty_base
> -				 */
> -
> -	u8 target_temp[NUM_FAN];
> -	u8 target_temp_mask;
> -	u32 target_speed[NUM_FAN];
> -	u32 target_speed_tolerance[NUM_FAN];
> -	u8 speed_tolerance_limit;
> -
> -	u8 temp_tolerance[2][NUM_FAN];
> -	u8 tolerance_mask;
> -
> -	u8 fan_time[3][NUM_FAN]; /* 0 = stop_time, 1 = step_up, 2 = step_down */
> -
> -	/* Automatic fan speed control registers */
> -	int auto_pwm_num;
> -	u8 auto_pwm[NUM_FAN][7];
> -	u8 auto_temp[NUM_FAN][7];
> -	u8 pwm_temp_sel[NUM_FAN];
> -	u8 pwm_weight_temp_sel[NUM_FAN];
> -	u8 weight_temp[3][NUM_FAN];	/* 0->temp_step, 1->temp_step_tol,
> -					 * 2->temp_base
> -					 */
> -
> -	u8 vid;
> -	u8 vrm;
> -
> -	bool have_vid;
> -
> -	u16 have_temp;
> -	u16 have_temp_fixed;
> -	u16 have_tsi_temp;
> -	u16 have_in;
> -
> -	/* Remember extra register values over suspend/resume */
> -	u8 vbat;
> -	u8 fandiv1;
> -	u8 fandiv2;
> -	u8 sio_reg_enable;
> -
> -	/* nct6775_*() callbacks  */
> -	u16 (*read_value)(struct nct6775_data *data, u16 reg);
> -	int (*write_value)(struct nct6775_data *data, u16 reg, u16 value);
> -
> -	bool read_only;
> -};
> -
>  struct sensor_device_template {
>  	struct device_attribute dev_attr;
>  	union {
> @@ -1408,21 +986,6 @@ struct sensor_template_group {
>  	int base;
>  };
>  
> -static inline umode_t nct6775_attr_mode(struct nct6775_data *data, struct attribute *attr)
> -{
> -	return data->read_only ? (attr->mode & ~0222) : attr->mode;
> -}
> -
> -static int nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
> -{
> -	/* Need to leave a NULL terminator at the end of data->groups */
> -	if (WARN_ON(data->num_groups == ARRAY_SIZE(data->groups) - 1))
> -		return -ENOSPC;
> -
> -	data->groups[data->num_groups++] = group;
> -	return 0;
> -}
> -
>  static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_data *data,
>  					   const struct sensor_template_group *tg, int repeat)
>  {
> @@ -1497,7 +1060,7 @@ static int nct6775_add_template_attr_group(struct device *dev, struct nct6775_da
>  	return nct6775_add_attr_group(data, group);
>  }
>  
> -static bool is_word_sized(struct nct6775_data *data, u16 reg)
> +bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
>  {
>  	switch (data->kind) {
>  	case nct6106:
> @@ -1554,101 +1117,7 @@ static bool is_word_sized(struct nct6775_data *data, u16 reg)
>  	}
>  	return false;
>  }
> -
> -static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
> -{
> -	u8 bank = reg >> 8;
> -
> -	data->bank = bank;
> -}
> -
> -static u16 nct6775_wmi_read_value(struct nct6775_data *data, u16 reg)
> -{
> -	int res, err, word_sized = is_word_sized(data, reg);
> -	u8 tmp = 0;
> -
> -	nct6775_wmi_set_bank(data, reg);
> -
> -	err = nct6775_asuswmi_read(data->bank, reg & 0xff, &tmp);
> -	if (err)
> -		return 0;
> -
> -	res = tmp;
> -	if (word_sized) {
> -		err = nct6775_asuswmi_read(data->bank, (reg & 0xff) + 1, &tmp);
> -		if (err)
> -			return 0;
> -
> -		res = (res << 8) + tmp;
> -	}
> -	return res;
> -}
> -
> -static int nct6775_wmi_write_value(struct nct6775_data *data, u16 reg, u16 value)
> -{
> -	int res, word_sized = is_word_sized(data, reg);
> -
> -	nct6775_wmi_set_bank(data, reg);
> -
> -	if (word_sized) {
> -		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value >> 8);
> -		if (res)
> -			return res;
> -
> -		res = nct6775_asuswmi_write(data->bank, (reg & 0xff) + 1, value);
> -	} else {
> -		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value);
> -	}
> -
> -	return res;
> -}
> -
> -/*
> - * On older chips, only registers 0x50-0x5f are banked.
> - * On more recent chips, all registers are banked.
> - * Assume that is the case and set the bank number for each access.
> - * Cache the bank number so it only needs to be set if it changes.
> - */
> -static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
> -{
> -	u8 bank = reg >> 8;
> -
> -	if (data->bank != bank) {
> -		outb_p(NCT6775_REG_BANK, data->addr + ADDR_REG_OFFSET);
> -		outb_p(bank, data->addr + DATA_REG_OFFSET);
> -		data->bank = bank;
> -	}
> -}
> -
> -static u16 nct6775_read_value(struct nct6775_data *data, u16 reg)
> -{
> -	int res, word_sized = is_word_sized(data, reg);
> -
> -	nct6775_set_bank(data, reg);
> -	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
> -	res = inb_p(data->addr + DATA_REG_OFFSET);
> -	if (word_sized) {
> -		outb_p((reg & 0xff) + 1,
> -		       data->addr + ADDR_REG_OFFSET);
> -		res = (res << 8) + inb_p(data->addr + DATA_REG_OFFSET);
> -	}
> -	return res;
> -}
> -
> -static int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
> -{
> -	int word_sized = is_word_sized(data, reg);
> -
> -	nct6775_set_bank(data, reg);
> -	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
> -	if (word_sized) {
> -		outb_p(value >> 8, data->addr + DATA_REG_OFFSET);
> -		outb_p((reg & 0xff) + 1,
> -		       data->addr + ADDR_REG_OFFSET);
> -	}
> -	outb_p(value & 0xff, data->addr + DATA_REG_OFFSET);
> -	return 0;
> -}
> +EXPORT_SYMBOL_GPL(nct6775_reg_is_word_sized);

Please introduce a nct6775 symbol namespace.

>  
>  /* We left-align 8-bit temperature values to make the code simpler */
>  static u16 nct6775_read_temp(struct nct6775_data *data, u16 reg)
> @@ -1656,18 +1125,19 @@ static u16 nct6775_read_temp(struct nct6775_data *data, u16 reg)
>  	u16 res;
>  
>  	res = data->read_value(data, reg);
> -	if (!is_word_sized(data, reg))
> +	if (!nct6775_reg_is_word_sized(data, reg))
>  		res <<= 8;
>  
>  	return res;
>  }
>  
> -static int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value)
> +int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value)
>  {
> -	if (!is_word_sized(data, reg))
> +	if (!nct6775_reg_is_word_sized(data, reg))
>  		value >>= 8;
>  	return data->write_value(data, reg, value);
>  }
> +EXPORT_SYMBOL_GPL(nct6775_write_temp);
>  

Questionable. It would probably be better to just re-implement in platform
driver. It would even be possible to hide the code in regmap by marking
the registers as "always treat as 16-bit" register, for example by setting
bit 15 in the register addresses.

>  /* This function assumes that the caller holds data->update_lock */
>  static void nct6775_write_fan_div(struct nct6775_data *data, int nr)
> @@ -1960,7 +1430,7 @@ static void nct6775_update_pwm_limits(struct device *dev)
>  	}
>  }
>  
> -static struct nct6775_data *nct6775_update_device(struct device *dev)
> +struct nct6775_data *nct6775_update_device(struct device *dev)
>  {
>  	struct nct6775_data *data = dev_get_drvdata(dev);
>  	int i, j;
> @@ -2062,6 +1532,7 @@ static struct nct6775_data *nct6775_update_device(struct device *dev)
>  	mutex_unlock(&data->update_lock);
>  	return data;
>  }
> +EXPORT_SYMBOL_GPL(nct6775_update_device);

Zero value. Called from suspend function in platform driver which doesn't
actually need it and could instead just use
	struct nct6775_data *data = dev_get_drvdata(dev);

>  
>  /*
>   * Sysfs callback functions
> @@ -2099,8 +1570,8 @@ store_in_reg(struct device *dev, struct device_attribute *attr, const char *buf,
>  	return count;
>  }
>  
> -static ssize_t
> -show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
> +ssize_t
> +nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct nct6775_data *data = nct6775_update_device(dev);
>  	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> @@ -2109,6 +1580,7 @@ show_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>  	return sprintf(buf, "%u\n",
>  		       (unsigned int)((data->alarms >> nr) & 0x01));
>  }
> +EXPORT_SYMBOL_GPL(nct6775_show_alarm);
>  
>  static int find_temp_source(struct nct6775_data *data, int index, int count)
>  {
> @@ -2147,8 +1619,8 @@ show_temp_alarm(struct device *dev, struct device_attribute *attr, char *buf)
>  	return sprintf(buf, "%u\n", alarm);
>  }
>  
> -static ssize_t
> -show_beep(struct device *dev, struct device_attribute *attr, char *buf)
> +ssize_t
> +nct6775_show_beep(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
>  	struct nct6775_data *data = nct6775_update_device(dev);
> @@ -2157,10 +1629,10 @@ show_beep(struct device *dev, struct device_attribute *attr, char *buf)
>  	return sprintf(buf, "%u\n",
>  		       (unsigned int)((data->beeps >> nr) & 0x01));
>  }
> +EXPORT_SYMBOL_GPL(nct6775_show_beep);
>  
> -static ssize_t
> -store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
> -	   size_t count)
> +ssize_t
> +nct6775_store_beep(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
>  {
>  	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
>  	struct nct6775_data *data = dev_get_drvdata(dev);
> @@ -2185,6 +1657,7 @@ store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
>  	mutex_unlock(&data->update_lock);
>  	return count;
>  }
> +EXPORT_SYMBOL_GPL(nct6775_store_beep);
>  
>  static ssize_t
>  show_temp_beep(struct device *dev, struct device_attribute *attr, char *buf)
> @@ -2257,9 +1730,8 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
>  }
>  
>  SENSOR_TEMPLATE_2(in_input, "in%d_input", S_IRUGO, show_in_reg, NULL, 0, 0);
> -SENSOR_TEMPLATE(in_alarm, "in%d_alarm", S_IRUGO, show_alarm, NULL, 0);
> -SENSOR_TEMPLATE(in_beep, "in%d_beep", S_IWUSR | S_IRUGO, show_beep, store_beep,
> -		0);
> +SENSOR_TEMPLATE(in_alarm, "in%d_alarm", S_IRUGO, nct6775_show_alarm, NULL, 0);
> +SENSOR_TEMPLATE(in_beep, "in%d_beep", S_IWUSR | S_IRUGO, nct6775_show_beep, nct6775_store_beep, 0);
>  SENSOR_TEMPLATE_2(in_min, "in%d_min", S_IWUSR | S_IRUGO, show_in_reg,
>  		  store_in_reg, 0, 1);
>  SENSOR_TEMPLATE_2(in_max, "in%d_max", S_IWUSR | S_IRUGO, show_in_reg,
> @@ -2475,10 +1947,10 @@ static umode_t nct6775_fan_is_visible(struct kobject *kobj,
>  }
>  
>  SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
> -SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", S_IRUGO, show_alarm, NULL,
> +SENSOR_TEMPLATE(fan_alarm, "fan%d_alarm", S_IRUGO, nct6775_show_alarm, NULL,
>  		FAN_ALARM_BASE);
> -SENSOR_TEMPLATE(fan_beep, "fan%d_beep", S_IWUSR | S_IRUGO, show_beep,
> -		store_beep, FAN_ALARM_BASE);
> +SENSOR_TEMPLATE(fan_beep, "fan%d_beep", S_IWUSR | S_IRUGO, nct6775_show_beep,
> +		nct6775_store_beep, FAN_ALARM_BASE);
>  SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", S_IWUSR | S_IRUGO, show_fan_pulses,
>  		store_fan_pulses, 0);
>  SENSOR_TEMPLATE(fan_min, "fan%d_min", S_IWUSR | S_IRUGO, show_fan_min,
> @@ -3628,113 +3100,6 @@ static const struct sensor_template_group nct6775_pwm_template_group = {
>  	.base = 1,
>  };
>  
> -static ssize_t
> -cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
> -{
> -	struct nct6775_data *data = dev_get_drvdata(dev);
> -
> -	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
> -}
> -
> -static DEVICE_ATTR_RO(cpu0_vid);
> -
> -/* Case open detection */
> -
> -static ssize_t
> -clear_caseopen(struct device *dev, struct device_attribute *attr,
> -	       const char *buf, size_t count)
> -{
> -	struct nct6775_data *data = dev_get_drvdata(dev);
> -	struct nct6775_sio_data *sio_data = data->sio_data;
> -	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
> -	unsigned long val;
> -	u8 reg;
> -	int ret;
> -
> -	if (kstrtoul(buf, 10, &val) || val != 0)
> -		return -EINVAL;
> -
> -	mutex_lock(&data->update_lock);
> -
> -	/*
> -	 * Use CR registers to clear caseopen status.
> -	 * The CR registers are the same for all chips, and not all chips
> -	 * support clearing the caseopen status through "regular" registers.
> -	 */
> -	ret = sio_data->sio_enter(sio_data);
> -	if (ret) {
> -		count = ret;
> -		goto error;
> -	}
> -
> -	sio_data->sio_select(sio_data, NCT6775_LD_ACPI);
> -	reg = sio_data->sio_inb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
> -	reg |= NCT6775_CR_CASEOPEN_CLR_MASK[nr];
> -	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
> -	reg &= ~NCT6775_CR_CASEOPEN_CLR_MASK[nr];
> -	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
> -	sio_data->sio_exit(sio_data);
> -
> -	data->valid = false;	/* Force cache refresh */
> -error:
> -	mutex_unlock(&data->update_lock);
> -	return count;
> -}
> -
> -static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, show_alarm,
> -			  clear_caseopen, INTRUSION_ALARM_BASE);
> -static SENSOR_DEVICE_ATTR(intrusion1_alarm, S_IWUSR | S_IRUGO, show_alarm,
> -			  clear_caseopen, INTRUSION_ALARM_BASE + 1);
> -static SENSOR_DEVICE_ATTR(intrusion0_beep, S_IWUSR | S_IRUGO, show_beep,
> -			  store_beep, INTRUSION_ALARM_BASE);
> -static SENSOR_DEVICE_ATTR(intrusion1_beep, S_IWUSR | S_IRUGO, show_beep,
> -			  store_beep, INTRUSION_ALARM_BASE + 1);
> -static SENSOR_DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, show_beep,
> -			  store_beep, BEEP_ENABLE_BASE);
> -
> -static umode_t nct6775_other_is_visible(struct kobject *kobj,
> -					struct attribute *attr, int index)
> -{
> -	struct device *dev = kobj_to_dev(kobj);
> -	struct nct6775_data *data = dev_get_drvdata(dev);
> -
> -	if (index == 0 && !data->have_vid)
> -		return 0;
> -
> -	if (index == 1 || index == 2) {
> -		if (data->ALARM_BITS[INTRUSION_ALARM_BASE + index - 1] < 0)
> -			return 0;
> -	}
> -
> -	if (index == 3 || index == 4) {
> -		if (data->BEEP_BITS[INTRUSION_ALARM_BASE + index - 3] < 0)
> -			return 0;
> -	}
> -
> -	return nct6775_attr_mode(data, attr);
> -}
> -
> -/*
> - * nct6775_other_is_visible uses the index into the following array
> - * to determine if attributes should be created or not.
> - * Any change in order or content must be matched.
> - */
> -static struct attribute *nct6775_attributes_other[] = {
> -	&dev_attr_cpu0_vid.attr,				/* 0 */
> -	&sensor_dev_attr_intrusion0_alarm.dev_attr.attr,	/* 1 */
> -	&sensor_dev_attr_intrusion1_alarm.dev_attr.attr,	/* 2 */
> -	&sensor_dev_attr_intrusion0_beep.dev_attr.attr,		/* 3 */
> -	&sensor_dev_attr_intrusion1_beep.dev_attr.attr,		/* 4 */
> -	&sensor_dev_attr_beep_enable.dev_attr.attr,		/* 5 */
> -
> -	NULL
> -};
> -
> -static const struct attribute_group nct6775_group_other = {
> -	.attrs = nct6775_attributes_other,
> -	.is_visible = nct6775_other_is_visible,
> -};
> -
>  static inline void nct6775_init_device(struct nct6775_data *data)
>  {
>  	int i;
> @@ -3777,227 +3142,6 @@ static inline void nct6775_init_device(struct nct6775_data *data)
>  	}
>  }
>  
> -static void
> -nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio_data)
> -{
> -	bool fan3pin = false, fan4pin = false, fan4min = false;
> -	bool fan5pin = false, fan6pin = false, fan7pin = false;
> -	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
> -	bool pwm6pin = false, pwm7pin = false;
> -
> -	/* Store SIO_REG_ENABLE for use during resume */
> -	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> -	data->sio_reg_enable = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
> -
> -	/* fan4 and fan5 share some pins with the GPIO and serial flash */
> -	if (data->kind == nct6775) {
> -		int cr2c = sio_data->sio_inb(sio_data, 0x2c);
> -
> -		fan3pin = cr2c & BIT(6);
> -		pwm3pin = cr2c & BIT(7);
> -
> -		/* On NCT6775, fan4 shares pins with the fdc interface */
> -		fan4pin = !(sio_data->sio_inb(sio_data, 0x2A) & 0x80);
> -	} else if (data->kind == nct6776) {
> -		bool gpok = sio_data->sio_inb(sio_data, 0x27) & 0x80;
> -		const char *board_vendor, *board_name;
> -
> -		board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> -		board_name = dmi_get_system_info(DMI_BOARD_NAME);
> -
> -		if (board_name && board_vendor &&
> -		    !strcmp(board_vendor, "ASRock")) {
> -			/*
> -			 * Auxiliary fan monitoring is not enabled on ASRock
> -			 * Z77 Pro4-M if booted in UEFI Ultra-FastBoot mode.
> -			 * Observed with BIOS version 2.00.
> -			 */
> -			if (!strcmp(board_name, "Z77 Pro4-M")) {
> -				if ((data->sio_reg_enable & 0xe0) != 0xe0) {
> -					data->sio_reg_enable |= 0xe0;
> -					sio_data->sio_outb(sio_data, SIO_REG_ENABLE,
> -						     data->sio_reg_enable);
> -				}
> -			}
> -		}
> -
> -		if (data->sio_reg_enable & 0x80)
> -			fan3pin = gpok;
> -		else
> -			fan3pin = !(sio_data->sio_inb(sio_data, 0x24) & 0x40);
> -
> -		if (data->sio_reg_enable & 0x40)
> -			fan4pin = gpok;
> -		else
> -			fan4pin = sio_data->sio_inb(sio_data, 0x1C) & 0x01;
> -
> -		if (data->sio_reg_enable & 0x20)
> -			fan5pin = gpok;
> -		else
> -			fan5pin = sio_data->sio_inb(sio_data, 0x1C) & 0x02;
> -
> -		fan4min = fan4pin;
> -		pwm3pin = fan3pin;
> -	} else if (data->kind == nct6106) {
> -		int cr24 = sio_data->sio_inb(sio_data, 0x24);
> -
> -		fan3pin = !(cr24 & 0x80);
> -		pwm3pin = cr24 & 0x08;
> -	} else if (data->kind == nct6116) {
> -		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
> -		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
> -		int cr24 = sio_data->sio_inb(sio_data, 0x24);
> -		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
> -		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
> -		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
> -
> -		fan3pin = !(cr2b & 0x10);
> -		fan4pin = (cr2b & 0x80) ||			// pin 1(2)
> -			(!(cr2f & 0x10) && (cr1a & 0x04));	// pin 65(66)
> -		fan5pin = (cr2b & 0x80) ||			// pin 126(127)
> -			(!(cr1b & 0x03) && (cr2a & 0x02));	// pin 94(96)
> -
> -		pwm3pin = fan3pin && (cr24 & 0x08);
> -		pwm4pin = fan4pin;
> -		pwm5pin = fan5pin;
> -	} else {
> -		/*
> -		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> -		 * NCT6797D, NCT6798D
> -		 */
> -		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
> -		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
> -		int cr1c = sio_data->sio_inb(sio_data, 0x1c);
> -		int cr1d = sio_data->sio_inb(sio_data, 0x1d);
> -		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
> -		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
> -		int cr2d = sio_data->sio_inb(sio_data, 0x2d);
> -		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
> -		bool dsw_en = cr2f & BIT(3);
> -		bool ddr4_en = cr2f & BIT(4);
> -		int cre0;
> -		int creb;
> -		int cred;
> -
> -		sio_data->sio_select(sio_data, NCT6775_LD_12);
> -		cre0 = sio_data->sio_inb(sio_data, 0xe0);
> -		creb = sio_data->sio_inb(sio_data, 0xeb);
> -		cred = sio_data->sio_inb(sio_data, 0xed);
> -
> -		fan3pin = !(cr1c & BIT(5));
> -		fan4pin = !(cr1c & BIT(6));
> -		fan5pin = !(cr1c & BIT(7));
> -
> -		pwm3pin = !(cr1c & BIT(0));
> -		pwm4pin = !(cr1c & BIT(1));
> -		pwm5pin = !(cr1c & BIT(2));
> -
> -		switch (data->kind) {
> -		case nct6791:
> -			fan6pin = cr2d & BIT(1);
> -			pwm6pin = cr2d & BIT(0);
> -			break;
> -		case nct6792:
> -			fan6pin = !dsw_en && (cr2d & BIT(1));
> -			pwm6pin = !dsw_en && (cr2d & BIT(0));
> -			break;
> -		case nct6793:
> -			fan5pin |= cr1b & BIT(5);
> -			fan5pin |= creb & BIT(5);
> -
> -			fan6pin = !dsw_en && (cr2d & BIT(1));
> -			fan6pin |= creb & BIT(3);
> -
> -			pwm5pin |= cr2d & BIT(7);
> -			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> -
> -			pwm6pin = !dsw_en && (cr2d & BIT(0));
> -			pwm6pin |= creb & BIT(2);
> -			break;
> -		case nct6795:
> -			fan5pin |= cr1b & BIT(5);
> -			fan5pin |= creb & BIT(5);
> -
> -			fan6pin = (cr2a & BIT(4)) &&
> -					(!dsw_en || (cred & BIT(4)));
> -			fan6pin |= creb & BIT(3);
> -
> -			pwm5pin |= cr2d & BIT(7);
> -			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> -
> -			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
> -			pwm6pin |= creb & BIT(2);
> -			break;
> -		case nct6796:
> -			fan5pin |= cr1b & BIT(5);
> -			fan5pin |= (cre0 & BIT(3)) && !(cr1b & BIT(0));
> -			fan5pin |= creb & BIT(5);
> -
> -			fan6pin = (cr2a & BIT(4)) &&
> -					(!dsw_en || (cred & BIT(4)));
> -			fan6pin |= creb & BIT(3);
> -
> -			fan7pin = !(cr2b & BIT(2));
> -
> -			pwm5pin |= cr2d & BIT(7);
> -			pwm5pin |= (cre0 & BIT(4)) && !(cr1b & BIT(0));
> -			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> -
> -			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
> -			pwm6pin |= creb & BIT(2);
> -
> -			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
> -			break;
> -		case nct6797:
> -			fan5pin |= !ddr4_en && (cr1b & BIT(5));
> -			fan5pin |= creb & BIT(5);
> -
> -			fan6pin = cr2a & BIT(4);
> -			fan6pin |= creb & BIT(3);
> -
> -			fan7pin = cr1a & BIT(1);
> -
> -			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> -			pwm5pin |= !ddr4_en && (cr2d & BIT(7));
> -
> -			pwm6pin = creb & BIT(2);
> -			pwm6pin |= cred & BIT(2);
> -
> -			pwm7pin = cr1d & BIT(4);
> -			break;
> -		case nct6798:
> -			fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
> -			fan6pin |= cr2a & BIT(4);
> -			fan6pin |= creb & BIT(5);
> -
> -			fan7pin = cr1b & BIT(5);
> -			fan7pin |= !(cr2b & BIT(2));
> -			fan7pin |= creb & BIT(3);
> -
> -			pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
> -			pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
> -			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> -
> -			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
> -			pwm7pin |= cr2d & BIT(7);
> -			pwm7pin |= creb & BIT(2);
> -			break;
> -		default:	/* NCT6779D */
> -			break;
> -		}
> -
> -		fan4min = fan4pin;
> -	}
> -
> -	/* fan 1 and 2 (0x03) are always present */
> -	data->has_fan = 0x03 | (fan3pin << 2) | (fan4pin << 3) |
> -		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
> -	data->has_fan_min = 0x03 | (fan3pin << 2) | (fan4min << 3) |
> -		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
> -	data->has_pwm = 0x03 | (pwm3pin << 2) | (pwm4pin << 3) |
> -		(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
> -}
> -
>  static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
>  			     int *available, int *mask)
>  {
> @@ -4023,50 +3167,20 @@ static void add_temp_sensors(struct nct6775_data *data, const u16 *regp,
>  	}
>  }
>  
> -static int nct6775_probe(struct platform_device *pdev)
> +int nct6775_probe(struct device *dev, struct nct6775_data *data)
>  {
> -	struct device *dev = &pdev->dev;
> -	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
> -	struct nct6775_data *data;
> -	struct resource *res;
>  	int i, s, err = 0;
>  	int src, mask, available;
>  	const u16 *reg_temp, *reg_temp_over, *reg_temp_hyst, *reg_temp_config;
>  	const u16 *reg_temp_mon, *reg_temp_alternate, *reg_temp_crit;
>  	const u16 *reg_temp_crit_l = NULL, *reg_temp_crit_h = NULL;
>  	int num_reg_temp, num_reg_temp_mon, num_reg_tsi_temp;
> -	u8 cr2a;
>  	struct device *hwmon_dev;
>  	struct sensor_template_group tsi_temp_tg;
>  
> -	if (sio_data->access == access_direct) {
> -		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> -		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
> -					 DRVNAME))
> -			return -EBUSY;
> -	}
> -
> -	data = devm_kzalloc(&pdev->dev, sizeof(struct nct6775_data),
> -			    GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	data->kind = sio_data->kind;
> -	data->sio_data = sio_data;
> -
> -	if (sio_data->access == access_direct) {
> -		data->addr = res->start;
> -		data->read_value = nct6775_read_value;
> -		data->write_value = nct6775_write_value;
> -	} else {
> -		data->read_value = nct6775_wmi_read_value;
> -		data->write_value = nct6775_wmi_write_value;
> -	}
> -
>  	mutex_init(&data->update_lock);
>  	data->name = nct6775_device_names[data->kind];
>  	data->bank = 0xff;		/* Force initial bank selection */
> -	platform_set_drvdata(pdev, data);
>  
>  	switch (data->kind) {
>  	case nct6106:
> @@ -4781,79 +3895,12 @@ static int nct6775_probe(struct platform_device *pdev)
>  	/* Initialize the chip */
>  	nct6775_init_device(data);
>  
> -	err = sio_data->sio_enter(sio_data);
> -	if (err)
> -		return err;
> -
> -	cr2a = sio_data->sio_inb(sio_data, 0x2a);
> -	switch (data->kind) {
> -	case nct6775:
> -		data->have_vid = (cr2a & 0x40);
> -		break;
> -	case nct6776:
> -		data->have_vid = (cr2a & 0x60) == 0x40;
> -		break;
> -	case nct6106:
> -	case nct6116:
> -	case nct6779:
> -	case nct6791:
> -	case nct6792:
> -	case nct6793:
> -	case nct6795:
> -	case nct6796:
> -	case nct6797:
> -	case nct6798:
> -		break;
> -	}
> -
> -	/*
> -	 * Read VID value
> -	 * We can get the VID input values directly at logical device D 0xe3.
> -	 */
> -	if (data->have_vid) {
> -		sio_data->sio_select(sio_data, NCT6775_LD_VID);
> -		data->vid = sio_data->sio_inb(sio_data, 0xe3);
> -		data->vrm = vid_which_vrm();
> -	}
> -
> -	if (fan_debounce) {
> -		u8 tmp;
> -
> -		sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> -		tmp = sio_data->sio_inb(sio_data,
> -				    NCT6775_REG_CR_FAN_DEBOUNCE);
> -		switch (data->kind) {
> -		case nct6106:
> -		case nct6116:
> -			tmp |= 0xe0;
> -			break;
> -		case nct6775:
> -			tmp |= 0x1e;
> -			break;
> -		case nct6776:
> -		case nct6779:
> -			tmp |= 0x3e;
> -			break;
> -		case nct6791:
> -		case nct6792:
> -		case nct6793:
> -		case nct6795:
> -		case nct6796:
> -		case nct6797:
> -		case nct6798:
> -			tmp |= 0x7e;
> -			break;
> -		}
> -		sio_data->sio_outb(sio_data, NCT6775_REG_CR_FAN_DEBOUNCE,
> -			     tmp);
> -		dev_info(&pdev->dev, "Enabled fan debounce for chip %s\n",
> -			 data->name);
> +	if (data->driver_init) {
> +		err = data->driver_init(data);
> +		if (err)
> +			return err;
>  	}
>  
> -	nct6775_check_fan_inputs(data, sio_data);
> -
> -	sio_data->sio_exit(sio_data);
> -
>  	/* Read fan clock dividers immediately */
>  	nct6775_init_fan_common(dev, data);
>  
> @@ -4888,404 +3935,12 @@ static int nct6775_probe(struct platform_device *pdev)
>  			return err;
>  	}
>  
> -	err = nct6775_add_attr_group(data, &nct6775_group_other);
> -	if (err)
> -		return err;
> -
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, data->name,
>  							   data, data->groups);
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
> -
> -static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
> -{
> -	int val;
> -
> -	val = sio_data->sio_inb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
> -	if (val & 0x10) {
> -		pr_info("Enabling hardware monitor logical device mappings.\n");
> -		sio_data->sio_outb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
> -			       val & ~0x10);
> -	}
> -}
> -
> -static int __maybe_unused nct6775_suspend(struct device *dev)
> -{
> -	struct nct6775_data *data = nct6775_update_device(dev);
> -
> -	mutex_lock(&data->update_lock);
> -	data->vbat = data->read_value(data, data->REG_VBAT);
> -	if (data->kind == nct6775) {
> -		data->fandiv1 = data->read_value(data, NCT6775_REG_FANDIV1);
> -		data->fandiv2 = data->read_value(data, NCT6775_REG_FANDIV2);
> -	}
> -	mutex_unlock(&data->update_lock);
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused nct6775_resume(struct device *dev)
> -{
> -	struct nct6775_data *data = dev_get_drvdata(dev);
> -	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
> -	int i, j, err = 0;
> -	u8 reg;
> -
> -	mutex_lock(&data->update_lock);
> -	data->bank = 0xff;		/* Force initial bank selection */
> -
> -	err = sio_data->sio_enter(sio_data);
> -	if (err)
> -		goto abort;
> -
> -	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> -	reg = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
> -	if (reg != data->sio_reg_enable)
> -		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, data->sio_reg_enable);
> -
> -	if (data->kind == nct6791 || data->kind == nct6792 ||
> -	    data->kind == nct6793 || data->kind == nct6795 ||
> -	    data->kind == nct6796 || data->kind == nct6797 ||
> -	    data->kind == nct6798)
> -		nct6791_enable_io_mapping(sio_data);
> -
> -	sio_data->sio_exit(sio_data);
> -
> -	/* Restore limits */
> -	for (i = 0; i < data->in_num; i++) {
> -		if (!(data->have_in & BIT(i)))
> -			continue;
> -
> -		data->write_value(data, data->REG_IN_MINMAX[0][i],
> -				  data->in[i][1]);
> -		data->write_value(data, data->REG_IN_MINMAX[1][i],
> -				  data->in[i][2]);
> -	}
> -
> -	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
> -		if (!(data->has_fan_min & BIT(i)))
> -			continue;
> -
> -		data->write_value(data, data->REG_FAN_MIN[i],
> -				  data->fan_min[i]);
> -	}
> -
> -	for (i = 0; i < NUM_TEMP; i++) {
> -		if (!(data->have_temp & BIT(i)))
> -			continue;
> -
> -		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
> -			if (data->reg_temp[j][i])
> -				nct6775_write_temp(data, data->reg_temp[j][i],
> -						   data->temp[j][i]);
> -	}
> -
> -	/* Restore other settings */
> -	data->write_value(data, data->REG_VBAT, data->vbat);
> -	if (data->kind == nct6775) {
> -		data->write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
> -		data->write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
> -	}
> -
> -abort:
> -	/* Force re-reading all values */
> -	data->valid = false;
> -	mutex_unlock(&data->update_lock);
> -
> -	return err;
> -}
> -
> -static SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
> -
> -static struct platform_driver nct6775_driver = {
> -	.driver = {
> -		.name	= DRVNAME,
> -		.pm	= &nct6775_dev_pm_ops,
> -	},
> -	.probe		= nct6775_probe,
> -};
> -
> -/* nct6775_find() looks for a '627 in the Super-I/O config space */
> -static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
> -{
> -	u16 val;
> -	int err;
> -	int addr;
> -
> -	sio_data->access = access_direct;
> -	sio_data->sioreg = sioaddr;
> -
> -	err = sio_data->sio_enter(sio_data);
> -	if (err)
> -		return err;
> -
> -	val = (sio_data->sio_inb(sio_data, SIO_REG_DEVID) << 8) |
> -		sio_data->sio_inb(sio_data, SIO_REG_DEVID + 1);
> -	if (force_id && val != 0xffff)
> -		val = force_id;
> -
> -	switch (val & SIO_ID_MASK) {
> -	case SIO_NCT6106_ID:
> -		sio_data->kind = nct6106;
> -		break;
> -	case SIO_NCT6116_ID:
> -		sio_data->kind = nct6116;
> -		break;
> -	case SIO_NCT6775_ID:
> -		sio_data->kind = nct6775;
> -		break;
> -	case SIO_NCT6776_ID:
> -		sio_data->kind = nct6776;
> -		break;
> -	case SIO_NCT6779_ID:
> -		sio_data->kind = nct6779;
> -		break;
> -	case SIO_NCT6791_ID:
> -		sio_data->kind = nct6791;
> -		break;
> -	case SIO_NCT6792_ID:
> -		sio_data->kind = nct6792;
> -		break;
> -	case SIO_NCT6793_ID:
> -		sio_data->kind = nct6793;
> -		break;
> -	case SIO_NCT6795_ID:
> -		sio_data->kind = nct6795;
> -		break;
> -	case SIO_NCT6796_ID:
> -		sio_data->kind = nct6796;
> -		break;
> -	case SIO_NCT6797_ID:
> -		sio_data->kind = nct6797;
> -		break;
> -	case SIO_NCT6798_ID:
> -		sio_data->kind = nct6798;
> -		break;
> -	default:
> -		if (val != 0xffff)
> -			pr_debug("unsupported chip ID: 0x%04x\n", val);
> -		sio_data->sio_exit(sio_data);
> -		return -ENODEV;
> -	}
> -
> -	/* We have a known chip, find the HWM I/O address */
> -	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> -	val = (sio_data->sio_inb(sio_data, SIO_REG_ADDR) << 8)
> -	    | sio_data->sio_inb(sio_data, SIO_REG_ADDR + 1);
> -	addr = val & IOREGION_ALIGNMENT;
> -	if (addr == 0) {
> -		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
> -		sio_data->sio_exit(sio_data);
> -		return -ENODEV;
> -	}
> -
> -	/* Activate logical device if needed */
> -	val = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
> -	if (!(val & 0x01)) {
> -		pr_warn("Forcibly enabling Super-I/O. Sensor is probably unusable.\n");
> -		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, val | 0x01);
> -	}
> -
> -	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
> -	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
> -	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
> -	    sio_data->kind == nct6798)
> -		nct6791_enable_io_mapping(sio_data);
> -
> -	sio_data->sio_exit(sio_data);
> -	pr_info("Found %s or compatible chip at %#x:%#x\n",
> -		nct6775_sio_names[sio_data->kind], sioaddr, addr);
> -
> -	return addr;
> -}
> -
> -/*
> - * when Super-I/O functions move to a separate file, the Super-I/O
> - * bus will manage the lifetime of the device and this module will only keep
> - * track of the nct6775 driver. But since we use platform_device_alloc(), we
> - * must keep track of the device
> - */
> -static struct platform_device *pdev[2];
> -
> -static const char * const asus_wmi_boards[] = {
> -	"ProArt X570-CREATOR WIFI",
> -	"Pro B550M-C",
> -	"Pro WS X570-ACE",
> -	"PRIME B360-PLUS",
> -	"PRIME B460-PLUS",
> -	"PRIME B550-PLUS",
> -	"PRIME B550M-A",
> -	"PRIME B550M-A (WI-FI)",
> -	"PRIME X570-P",
> -	"PRIME X570-PRO",
> -	"ROG CROSSHAIR VIII DARK HERO",
> -	"ROG CROSSHAIR VIII FORMULA",
> -	"ROG CROSSHAIR VIII HERO",
> -	"ROG CROSSHAIR VIII IMPACT",
> -	"ROG STRIX B550-A GAMING",
> -	"ROG STRIX B550-E GAMING",
> -	"ROG STRIX B550-F GAMING",
> -	"ROG STRIX B550-F GAMING (WI-FI)",
> -	"ROG STRIX B550-F GAMING WIFI II",
> -	"ROG STRIX B550-I GAMING",
> -	"ROG STRIX B550-XE GAMING (WI-FI)",
> -	"ROG STRIX X570-E GAMING",
> -	"ROG STRIX X570-F GAMING",
> -	"ROG STRIX X570-I GAMING",
> -	"ROG STRIX Z390-E GAMING",
> -	"ROG STRIX Z390-F GAMING",
> -	"ROG STRIX Z390-H GAMING",
> -	"ROG STRIX Z390-I GAMING",
> -	"ROG STRIX Z490-A GAMING",
> -	"ROG STRIX Z490-E GAMING",
> -	"ROG STRIX Z490-F GAMING",
> -	"ROG STRIX Z490-G GAMING",
> -	"ROG STRIX Z490-G GAMING (WI-FI)",
> -	"ROG STRIX Z490-H GAMING",
> -	"ROG STRIX Z490-I GAMING",
> -	"TUF GAMING B550M-PLUS",
> -	"TUF GAMING B550M-PLUS (WI-FI)",
> -	"TUF GAMING B550-PLUS",
> -	"TUF GAMING B550-PRO",
> -	"TUF GAMING X570-PLUS",
> -	"TUF GAMING X570-PLUS (WI-FI)",
> -	"TUF GAMING X570-PRO (WI-FI)",
> -	"TUF GAMING Z490-PLUS",
> -	"TUF GAMING Z490-PLUS (WI-FI)",
> -};
> -
> -static int __init sensors_nct6775_init(void)
> -{
> -	int i, err;
> -	bool found = false;
> -	int address;
> -	struct resource res;
> -	struct nct6775_sio_data sio_data;
> -	int sioaddr[2] = { 0x2e, 0x4e };
> -	enum sensor_access access = access_direct;
> -	const char *board_vendor, *board_name;
> -	u8 tmp;
> -
> -	err = platform_driver_register(&nct6775_driver);
> -	if (err)
> -		return err;
> -
> -	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> -	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> -
> -	if (board_name && board_vendor &&
> -	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC.")) {
> -		err = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
> -				   board_name);
> -		if (err >= 0) {
> -			/* if reading chip id via WMI succeeds, use WMI */
> -			if (!nct6775_asuswmi_read(0, NCT6775_PORT_CHIPID, &tmp) && tmp) {
> -				pr_info("Using Asus WMI to access %#x chip.\n", tmp);
> -				access = access_asuswmi;
> -			} else {
> -				pr_err("Can't read ChipID by Asus WMI.\n");
> -			}
> -		}
> -	}
> -
> -	/*
> -	 * initialize sio_data->kind and sio_data->sioreg.
> -	 *
> -	 * when Super-I/O functions move to a separate file, the Super-I/O
> -	 * driver will probe 0x2e and 0x4e and auto-detect the presence of a
> -	 * nct6775 hardware monitor, and call probe()
> -	 */
> -	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
> -		sio_data.sio_outb = superio_outb;
> -		sio_data.sio_inb = superio_inb;
> -		sio_data.sio_select = superio_select;
> -		sio_data.sio_enter = superio_enter;
> -		sio_data.sio_exit = superio_exit;
> -
> -		address = nct6775_find(sioaddr[i], &sio_data);
> -		if (address <= 0)
> -			continue;
> -
> -		found = true;
> -
> -		sio_data.access = access;
> -
> -		if (access == access_asuswmi) {
> -			sio_data.sio_outb = superio_wmi_outb;
> -			sio_data.sio_inb = superio_wmi_inb;
> -			sio_data.sio_select = superio_wmi_select;
> -			sio_data.sio_enter = superio_wmi_enter;
> -			sio_data.sio_exit = superio_wmi_exit;
> -		}
> -
> -		pdev[i] = platform_device_alloc(DRVNAME, address);
> -		if (!pdev[i]) {
> -			err = -ENOMEM;
> -			goto exit_device_unregister;
> -		}
> -
> -		err = platform_device_add_data(pdev[i], &sio_data,
> -					       sizeof(struct nct6775_sio_data));
> -		if (err)
> -			goto exit_device_put;
> -
> -		if (sio_data.access == access_direct) {
> -			memset(&res, 0, sizeof(res));
> -			res.name = DRVNAME;
> -			res.start = address + IOREGION_OFFSET;
> -			res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
> -			res.flags = IORESOURCE_IO;
> -
> -			err = acpi_check_resource_conflict(&res);
> -			if (err) {
> -				platform_device_put(pdev[i]);
> -				pdev[i] = NULL;
> -				continue;
> -			}
> -
> -			err = platform_device_add_resources(pdev[i], &res, 1);
> -			if (err)
> -				goto exit_device_put;
> -		}
> -
> -		/* platform_device_add calls probe() */
> -		err = platform_device_add(pdev[i]);
> -		if (err)
> -			goto exit_device_put;
> -	}
> -	if (!found) {
> -		err = -ENODEV;
> -		goto exit_unregister;
> -	}
> -
> -	return 0;
> -
> -exit_device_put:
> -	platform_device_put(pdev[i]);
> -exit_device_unregister:
> -	while (--i >= 0) {
> -		if (pdev[i])
> -			platform_device_unregister(pdev[i]);
> -	}
> -exit_unregister:
> -	platform_driver_unregister(&nct6775_driver);
> -	return err;
> -}
> -
> -static void __exit sensors_nct6775_exit(void)
> -{
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
> -		if (pdev[i])
> -			platform_device_unregister(pdev[i]);
> -	}
> -	platform_driver_unregister(&nct6775_driver);
> -}
> +EXPORT_SYMBOL_GPL(nct6775_probe);
>  
>  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> -MODULE_DESCRIPTION("Driver for NCT6775F and compatible chips");
> +MODULE_DESCRIPTION("Core driver for NCT6775F and compatible chips");
>  MODULE_LICENSE("GPL");
> -
> -module_init(sensors_nct6775_init);
> -module_exit(sensors_nct6775_exit);
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> new file mode 100644
> index 000000000000..9bc794ba69e2
> --- /dev/null
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -0,0 +1,1185 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * nct6775-platform - Platform driver for the hardware monitoring
> + *		      functionality of Nuvoton NCT677x Super-I/O chips
> + *
> + * Copyright (C) 2012  Guenter Roeck <linux@roeck-us.net>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/hwmon-vid.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/io.h>
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/wmi.h>
> +
> +#include "nct6775.h"
> +
> +enum sensor_access { access_direct, access_asuswmi };
> +
> +static const char * const nct6775_sio_names[] __initconst = {
> +	"NCT6106D",
> +	"NCT6116D",
> +	"NCT6775F",
> +	"NCT6776D/F",
> +	"NCT6779D",
> +	"NCT6791D",
> +	"NCT6792D",
> +	"NCT6793D",
> +	"NCT6795D",
> +	"NCT6796D",
> +	"NCT6797D",
> +	"NCT6798D",
> +};
> +
> +static unsigned short force_id;
> +module_param(force_id, ushort, 0);
> +MODULE_PARM_DESC(force_id, "Override the detected device ID");
> +
> +static unsigned short fan_debounce;
> +module_param(fan_debounce, ushort, 0);
> +MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
> +
> +#define DRVNAME "nct6775-platform"
> +
> +#define NCT6775_PORT_CHIPID	0x58
> +
> +/*
> + * ISA constants
> + */
> +
> +#define IOREGION_ALIGNMENT	(~7)
> +#define IOREGION_OFFSET		5
> +#define IOREGION_LENGTH		2
> +#define ADDR_REG_OFFSET		0
> +#define DATA_REG_OFFSET		1
> +
> +/*
> + * Super-I/O constants and functions
> + */
> +
> +#define NCT6775_LD_ACPI		0x0a
> +#define NCT6775_LD_HWM		0x0b
> +#define NCT6775_LD_VID		0x0d
> +#define NCT6775_LD_12		0x12
> +
> +#define SIO_REG_LDSEL		0x07	/* Logical device select */
> +#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
> +#define SIO_REG_ENABLE		0x30	/* Logical device enable */
> +#define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
> +
> +#define SIO_NCT6106_ID		0xc450
> +#define SIO_NCT6116_ID		0xd280
> +#define SIO_NCT6775_ID		0xb470
> +#define SIO_NCT6776_ID		0xc330
> +#define SIO_NCT6779_ID		0xc560
> +#define SIO_NCT6791_ID		0xc800
> +#define SIO_NCT6792_ID		0xc910
> +#define SIO_NCT6793_ID		0xd120
> +#define SIO_NCT6795_ID		0xd350
> +#define SIO_NCT6796_ID		0xd420
> +#define SIO_NCT6797_ID		0xd450
> +#define SIO_NCT6798_ID		0xd428
> +#define SIO_ID_MASK		0xFFF8
> +
> +/*
> + * Control registers
> + */
> +#define NCT6775_REG_CR_FAN_DEBOUNCE	0xf0
> +
> +struct nct6775_sio_data {
> +	int sioreg;
> +	int ld;
> +	enum kinds kind;
> +	enum sensor_access access;
> +
> +	/* superio_() callbacks  */
> +	void (*sio_outb)(struct nct6775_sio_data *sio_data, int reg, int val);
> +	int (*sio_inb)(struct nct6775_sio_data *sio_data, int reg);
> +	void (*sio_select)(struct nct6775_sio_data *sio_data, int ld);
> +	int (*sio_enter)(struct nct6775_sio_data *sio_data);
> +	void (*sio_exit)(struct nct6775_sio_data *sio_data);
> +};
> +
> +#define ASUSWMI_MONITORING_GUID		"466747A0-70EC-11DE-8A39-0800200C9A66"
> +#define ASUSWMI_METHODID_RSIO		0x5253494F
> +#define ASUSWMI_METHODID_WSIO		0x5753494F
> +#define ASUSWMI_METHODID_RHWM		0x5248574D
> +#define ASUSWMI_METHODID_WHWM		0x5748574D
> +#define ASUSWMI_UNSUPPORTED_METHOD	0xFFFFFFFE
> +
> +static int nct6775_asuswmi_evaluate_method(u32 method_id, u8 bank, u8 reg, u8 val, u32 *retval)
> +{
> +#if IS_ENABLED(CONFIG_ACPI_WMI)
> +	u32 args = bank | (reg << 8) | (val << 16);
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	union acpi_object *obj;
> +	u32 tmp = ASUSWMI_UNSUPPORTED_METHOD;
> +
> +	status = wmi_evaluate_method(ASUSWMI_MONITORING_GUID, 0,
> +				     method_id, &input, &output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = output.pointer;
> +	if (obj && obj->type == ACPI_TYPE_INTEGER)
> +		tmp = obj->integer.value;
> +
> +	if (retval)
> +		*retval = tmp;
> +
> +	kfree(obj);
> +
> +	if (tmp == ASUSWMI_UNSUPPORTED_METHOD)
> +		return -ENODEV;
> +	return 0;
> +#else
> +	return -EOPNOTSUPP;
> +#endif
> +}
> +
> +static inline int nct6775_asuswmi_write(u8 bank, u8 reg, u8 val)
> +{
> +	return nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_WHWM, bank,
> +					      reg, val, NULL);
> +}
> +
> +static inline int nct6775_asuswmi_read(u8 bank, u8 reg, u8 *val)
> +{
> +	u32 ret, tmp = 0;
> +
> +	ret = nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_RHWM, bank,
> +					      reg, 0, &tmp);
> +	*val = tmp;
> +	return ret;
> +}
> +
> +static int superio_wmi_inb(struct nct6775_sio_data *sio_data, int reg)
> +{
> +	int tmp = 0;
> +
> +	nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_RSIO, sio_data->ld,
> +					reg, 0, &tmp);
> +	return tmp;
> +}
> +
> +static void superio_wmi_outb(struct nct6775_sio_data *sio_data, int reg, int val)
> +{
> +	nct6775_asuswmi_evaluate_method(ASUSWMI_METHODID_WSIO, sio_data->ld,
> +					reg, val, NULL);
> +}
> +
> +static void superio_wmi_select(struct nct6775_sio_data *sio_data, int ld)
> +{
> +	sio_data->ld = ld;
> +}
> +
> +static int superio_wmi_enter(struct nct6775_sio_data *sio_data)
> +{
> +	return 0;
> +}
> +
> +static void superio_wmi_exit(struct nct6775_sio_data *sio_data)
> +{
> +}
> +
> +static void superio_outb(struct nct6775_sio_data *sio_data, int reg, int val)
> +{
> +	int ioreg = sio_data->sioreg;
> +
> +	outb(reg, ioreg);
> +	outb(val, ioreg + 1);
> +}
> +
> +static int superio_inb(struct nct6775_sio_data *sio_data, int reg)
> +{
> +	int ioreg = sio_data->sioreg;
> +
> +	outb(reg, ioreg);
> +	return inb(ioreg + 1);
> +}
> +
> +static void superio_select(struct nct6775_sio_data *sio_data, int ld)
> +{
> +	int ioreg = sio_data->sioreg;
> +
> +	outb(SIO_REG_LDSEL, ioreg);
> +	outb(ld, ioreg + 1);
> +}
> +
> +static int superio_enter(struct nct6775_sio_data *sio_data)
> +{
> +	int ioreg = sio_data->sioreg;
> +
> +	/*
> +	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
> +	 */
> +	if (!request_muxed_region(ioreg, 2, DRVNAME))
> +		return -EBUSY;
> +
> +	outb(0x87, ioreg);
> +	outb(0x87, ioreg);
> +
> +	return 0;
> +}
> +
> +static void superio_exit(struct nct6775_sio_data *sio_data)
> +{
> +	int ioreg = sio_data->sioreg;
> +
> +	outb(0xaa, ioreg);
> +	outb(0x02, ioreg);
> +	outb(0x02, ioreg + 1);
> +	release_region(ioreg, 2);
> +}
> +
> +static inline void nct6775_wmi_set_bank(struct nct6775_data *data, u16 reg)
> +{
> +	u8 bank = reg >> 8;
> +
> +	data->bank = bank;
> +}
> +
> +static u16 nct6775_wmi_read_value(struct nct6775_data *data, u16 reg)
> +{
> +	int res, err, word_sized = nct6775_reg_is_word_sized(data, reg);
> +	u8 tmp = 0;
> +
> +	nct6775_wmi_set_bank(data, reg);
> +
> +	err = nct6775_asuswmi_read(data->bank, reg & 0xff, &tmp);
> +	if (err)
> +		return 0;
> +
> +	res = tmp;
> +	if (word_sized) {
> +		err = nct6775_asuswmi_read(data->bank, (reg & 0xff) + 1, &tmp);
> +		if (err)
> +			return 0;
> +
> +		res = (res << 8) + tmp;
> +	}
> +	return res;
> +}
> +
> +static int nct6775_wmi_write_value(struct nct6775_data *data, u16 reg, u16 value)
> +{
> +	int res, word_sized = nct6775_reg_is_word_sized(data, reg);
> +
> +	nct6775_wmi_set_bank(data, reg);
> +
> +	if (word_sized) {
> +		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value >> 8);
> +		if (res)
> +			return res;
> +
> +		res = nct6775_asuswmi_write(data->bank, (reg & 0xff) + 1, value);
> +	} else {
> +		res = nct6775_asuswmi_write(data->bank, reg & 0xff, value);
> +	}
> +
> +	return res;
> +}
> +
> +/*
> + * On older chips, only registers 0x50-0x5f are banked.
> + * On more recent chips, all registers are banked.
> + * Assume that is the case and set the bank number for each access.
> + * Cache the bank number so it only needs to be set if it changes.
> + */
> +static inline void nct6775_set_bank(struct nct6775_data *data, u16 reg)
> +{
> +	u8 bank = reg >> 8;
> +
> +	if (data->bank != bank) {
> +		outb_p(NCT6775_REG_BANK, data->addr + ADDR_REG_OFFSET);
> +		outb_p(bank, data->addr + DATA_REG_OFFSET);
> +		data->bank = bank;
> +	}
> +}
> +
> +static u16 nct6775_read_value(struct nct6775_data *data, u16 reg)
> +{
> +	int res, word_sized = nct6775_reg_is_word_sized(data, reg);
> +
> +	nct6775_set_bank(data, reg);
> +	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
> +	res = inb_p(data->addr + DATA_REG_OFFSET);
> +	if (word_sized) {
> +		outb_p((reg & 0xff) + 1,
> +		       data->addr + ADDR_REG_OFFSET);
> +		res = (res << 8) + inb_p(data->addr + DATA_REG_OFFSET);
> +	}
> +	return res;
> +}
> +
> +static int nct6775_write_value(struct nct6775_data *data, u16 reg, u16 value)
> +{
> +	int word_sized = nct6775_reg_is_word_sized(data, reg);
> +
> +	nct6775_set_bank(data, reg);
> +	outb_p(reg & 0xff, data->addr + ADDR_REG_OFFSET);
> +	if (word_sized) {
> +		outb_p(value >> 8, data->addr + DATA_REG_OFFSET);
> +		outb_p((reg & 0xff) + 1,
> +		       data->addr + ADDR_REG_OFFSET);
> +	}
> +	outb_p(value & 0xff, data->addr + DATA_REG_OFFSET);
> +	return 0;
> +}
> +
> +static void nct6791_enable_io_mapping(struct nct6775_sio_data *sio_data)
> +{
> +	int val;
> +
> +	val = sio_data->sio_inb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE);
> +	if (val & 0x10) {
> +		pr_info("Enabling hardware monitor logical device mappings.\n");
> +		sio_data->sio_outb(sio_data, NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE,
> +			       val & ~0x10);
> +	}
> +}
> +
> +static int __maybe_unused nct6775_suspend(struct device *dev)
> +{
> +	struct nct6775_data *data = nct6775_update_device(dev);
> +
> +	mutex_lock(&data->update_lock);
> +	data->vbat = data->read_value(data, data->REG_VBAT);
> +	if (data->kind == nct6775) {
> +		data->fandiv1 = data->read_value(data, NCT6775_REG_FANDIV1);
> +		data->fandiv2 = data->read_value(data, NCT6775_REG_FANDIV2);
> +	}
> +	mutex_unlock(&data->update_lock);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused nct6775_resume(struct device *dev)
> +{
> +	struct nct6775_data *data = dev_get_drvdata(dev);
> +	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
> +	int i, j, err = 0;
> +	u8 reg;
> +
> +	mutex_lock(&data->update_lock);
> +	data->bank = 0xff;		/* Force initial bank selection */
> +
> +	err = sio_data->sio_enter(sio_data);
> +	if (err)
> +		goto abort;
> +
> +	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> +	reg = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
> +	if (reg != data->sio_reg_enable)
> +		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, data->sio_reg_enable);
> +
> +	if (data->kind == nct6791 || data->kind == nct6792 ||
> +	    data->kind == nct6793 || data->kind == nct6795 ||
> +	    data->kind == nct6796 || data->kind == nct6797 ||
> +	    data->kind == nct6798)
> +		nct6791_enable_io_mapping(sio_data);
> +
> +	sio_data->sio_exit(sio_data);
> +
> +	/* Restore limits */
> +	for (i = 0; i < data->in_num; i++) {
> +		if (!(data->have_in & BIT(i)))
> +			continue;
> +
> +		data->write_value(data, data->REG_IN_MINMAX[0][i],
> +				  data->in[i][1]);
> +		data->write_value(data, data->REG_IN_MINMAX[1][i],
> +				  data->in[i][2]);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(data->fan_min); i++) {
> +		if (!(data->has_fan_min & BIT(i)))
> +			continue;
> +
> +		data->write_value(data, data->REG_FAN_MIN[i],
> +				  data->fan_min[i]);
> +	}
> +
> +	for (i = 0; i < NUM_TEMP; i++) {
> +		if (!(data->have_temp & BIT(i)))
> +			continue;
> +
> +		for (j = 1; j < ARRAY_SIZE(data->reg_temp); j++)
> +			if (data->reg_temp[j][i])
> +				nct6775_write_temp(data, data->reg_temp[j][i],
> +						   data->temp[j][i]);
> +	}
> +
> +	/* Restore other settings */
> +	data->write_value(data, data->REG_VBAT, data->vbat);
> +	if (data->kind == nct6775) {
> +		data->write_value(data, NCT6775_REG_FANDIV1, data->fandiv1);
> +		data->write_value(data, NCT6775_REG_FANDIV2, data->fandiv2);
> +	}
> +
> +abort:
> +	/* Force re-reading all values */
> +	data->valid = false;
> +	mutex_unlock(&data->update_lock);
> +
> +	return err;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(nct6775_dev_pm_ops, nct6775_suspend, nct6775_resume);
> +
> +static void
> +nct6775_check_fan_inputs(struct nct6775_data *data, struct nct6775_sio_data *sio_data)
> +{
> +	bool fan3pin = false, fan4pin = false, fan4min = false;
> +	bool fan5pin = false, fan6pin = false, fan7pin = false;
> +	bool pwm3pin = false, pwm4pin = false, pwm5pin = false;
> +	bool pwm6pin = false, pwm7pin = false;
> +
> +	/* Store SIO_REG_ENABLE for use during resume */
> +	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> +	data->sio_reg_enable = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
> +
> +	/* fan4 and fan5 share some pins with the GPIO and serial flash */
> +	if (data->kind == nct6775) {
> +		int cr2c = sio_data->sio_inb(sio_data, 0x2c);
> +
> +		fan3pin = cr2c & BIT(6);
> +		pwm3pin = cr2c & BIT(7);
> +
> +		/* On NCT6775, fan4 shares pins with the fdc interface */
> +		fan4pin = !(sio_data->sio_inb(sio_data, 0x2A) & 0x80);
> +	} else if (data->kind == nct6776) {
> +		bool gpok = sio_data->sio_inb(sio_data, 0x27) & 0x80;
> +		const char *board_vendor, *board_name;
> +
> +		board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> +		board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +		if (board_name && board_vendor &&
> +		    !strcmp(board_vendor, "ASRock")) {
> +			/*
> +			 * Auxiliary fan monitoring is not enabled on ASRock
> +			 * Z77 Pro4-M if booted in UEFI Ultra-FastBoot mode.
> +			 * Observed with BIOS version 2.00.
> +			 */
> +			if (!strcmp(board_name, "Z77 Pro4-M")) {
> +				if ((data->sio_reg_enable & 0xe0) != 0xe0) {
> +					data->sio_reg_enable |= 0xe0;
> +					sio_data->sio_outb(sio_data, SIO_REG_ENABLE,
> +						     data->sio_reg_enable);
> +				}
> +			}
> +		}
> +
> +		if (data->sio_reg_enable & 0x80)
> +			fan3pin = gpok;
> +		else
> +			fan3pin = !(sio_data->sio_inb(sio_data, 0x24) & 0x40);
> +
> +		if (data->sio_reg_enable & 0x40)
> +			fan4pin = gpok;
> +		else
> +			fan4pin = sio_data->sio_inb(sio_data, 0x1C) & 0x01;
> +
> +		if (data->sio_reg_enable & 0x20)
> +			fan5pin = gpok;
> +		else
> +			fan5pin = sio_data->sio_inb(sio_data, 0x1C) & 0x02;
> +
> +		fan4min = fan4pin;
> +		pwm3pin = fan3pin;
> +	} else if (data->kind == nct6106) {
> +		int cr24 = sio_data->sio_inb(sio_data, 0x24);
> +
> +		fan3pin = !(cr24 & 0x80);
> +		pwm3pin = cr24 & 0x08;
> +	} else if (data->kind == nct6116) {
> +		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
> +		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
> +		int cr24 = sio_data->sio_inb(sio_data, 0x24);
> +		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
> +		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
> +		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
> +
> +		fan3pin = !(cr2b & 0x10);
> +		fan4pin = (cr2b & 0x80) ||			// pin 1(2)
> +			(!(cr2f & 0x10) && (cr1a & 0x04));	// pin 65(66)
> +		fan5pin = (cr2b & 0x80) ||			// pin 126(127)
> +			(!(cr1b & 0x03) && (cr2a & 0x02));	// pin 94(96)
> +
> +		pwm3pin = fan3pin && (cr24 & 0x08);
> +		pwm4pin = fan4pin;
> +		pwm5pin = fan5pin;
> +	} else {
> +		/*
> +		 * NCT6779D, NCT6791D, NCT6792D, NCT6793D, NCT6795D, NCT6796D,
> +		 * NCT6797D, NCT6798D
> +		 */
> +		int cr1a = sio_data->sio_inb(sio_data, 0x1a);
> +		int cr1b = sio_data->sio_inb(sio_data, 0x1b);
> +		int cr1c = sio_data->sio_inb(sio_data, 0x1c);
> +		int cr1d = sio_data->sio_inb(sio_data, 0x1d);
> +		int cr2a = sio_data->sio_inb(sio_data, 0x2a);
> +		int cr2b = sio_data->sio_inb(sio_data, 0x2b);
> +		int cr2d = sio_data->sio_inb(sio_data, 0x2d);
> +		int cr2f = sio_data->sio_inb(sio_data, 0x2f);
> +		bool dsw_en = cr2f & BIT(3);
> +		bool ddr4_en = cr2f & BIT(4);
> +		int cre0;
> +		int creb;
> +		int cred;
> +
> +		sio_data->sio_select(sio_data, NCT6775_LD_12);
> +		cre0 = sio_data->sio_inb(sio_data, 0xe0);
> +		creb = sio_data->sio_inb(sio_data, 0xeb);
> +		cred = sio_data->sio_inb(sio_data, 0xed);
> +
> +		fan3pin = !(cr1c & BIT(5));
> +		fan4pin = !(cr1c & BIT(6));
> +		fan5pin = !(cr1c & BIT(7));
> +
> +		pwm3pin = !(cr1c & BIT(0));
> +		pwm4pin = !(cr1c & BIT(1));
> +		pwm5pin = !(cr1c & BIT(2));
> +
> +		switch (data->kind) {
> +		case nct6791:
> +			fan6pin = cr2d & BIT(1);
> +			pwm6pin = cr2d & BIT(0);
> +			break;
> +		case nct6792:
> +			fan6pin = !dsw_en && (cr2d & BIT(1));
> +			pwm6pin = !dsw_en && (cr2d & BIT(0));
> +			break;
> +		case nct6793:
> +			fan5pin |= cr1b & BIT(5);
> +			fan5pin |= creb & BIT(5);
> +
> +			fan6pin = !dsw_en && (cr2d & BIT(1));
> +			fan6pin |= creb & BIT(3);
> +
> +			pwm5pin |= cr2d & BIT(7);
> +			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> +
> +			pwm6pin = !dsw_en && (cr2d & BIT(0));
> +			pwm6pin |= creb & BIT(2);
> +			break;
> +		case nct6795:
> +			fan5pin |= cr1b & BIT(5);
> +			fan5pin |= creb & BIT(5);
> +
> +			fan6pin = (cr2a & BIT(4)) &&
> +					(!dsw_en || (cred & BIT(4)));
> +			fan6pin |= creb & BIT(3);
> +
> +			pwm5pin |= cr2d & BIT(7);
> +			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> +
> +			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
> +			pwm6pin |= creb & BIT(2);
> +			break;
> +		case nct6796:
> +			fan5pin |= cr1b & BIT(5);
> +			fan5pin |= (cre0 & BIT(3)) && !(cr1b & BIT(0));
> +			fan5pin |= creb & BIT(5);
> +
> +			fan6pin = (cr2a & BIT(4)) &&
> +					(!dsw_en || (cred & BIT(4)));
> +			fan6pin |= creb & BIT(3);
> +
> +			fan7pin = !(cr2b & BIT(2));
> +
> +			pwm5pin |= cr2d & BIT(7);
> +			pwm5pin |= (cre0 & BIT(4)) && !(cr1b & BIT(0));
> +			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> +
> +			pwm6pin = (cr2a & BIT(3)) && (cred & BIT(2));
> +			pwm6pin |= creb & BIT(2);
> +
> +			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
> +			break;
> +		case nct6797:
> +			fan5pin |= !ddr4_en && (cr1b & BIT(5));
> +			fan5pin |= creb & BIT(5);
> +
> +			fan6pin = cr2a & BIT(4);
> +			fan6pin |= creb & BIT(3);
> +
> +			fan7pin = cr1a & BIT(1);
> +
> +			pwm5pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> +			pwm5pin |= !ddr4_en && (cr2d & BIT(7));
> +
> +			pwm6pin = creb & BIT(2);
> +			pwm6pin |= cred & BIT(2);
> +
> +			pwm7pin = cr1d & BIT(4);
> +			break;
> +		case nct6798:
> +			fan6pin = !(cr1b & BIT(0)) && (cre0 & BIT(3));
> +			fan6pin |= cr2a & BIT(4);
> +			fan6pin |= creb & BIT(5);
> +
> +			fan7pin = cr1b & BIT(5);
> +			fan7pin |= !(cr2b & BIT(2));
> +			fan7pin |= creb & BIT(3);
> +
> +			pwm6pin = !(cr1b & BIT(0)) && (cre0 & BIT(4));
> +			pwm6pin |= !(cred & BIT(2)) && (cr2a & BIT(3));
> +			pwm6pin |= (creb & BIT(4)) && !(cr2a & BIT(0));
> +
> +			pwm7pin = !(cr1d & (BIT(2) | BIT(3)));
> +			pwm7pin |= cr2d & BIT(7);
> +			pwm7pin |= creb & BIT(2);
> +			break;
> +		default:	/* NCT6779D */
> +			break;
> +		}
> +
> +		fan4min = fan4pin;
> +	}
> +
> +	/* fan 1 and 2 (0x03) are always present */
> +	data->has_fan = 0x03 | (fan3pin << 2) | (fan4pin << 3) |
> +		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
> +	data->has_fan_min = 0x03 | (fan3pin << 2) | (fan4min << 3) |
> +		(fan5pin << 4) | (fan6pin << 5) | (fan7pin << 6);
> +	data->has_pwm = 0x03 | (pwm3pin << 2) | (pwm4pin << 3) |
> +		(pwm5pin << 4) | (pwm6pin << 5) | (pwm7pin << 6);
> +}
> +
> +static ssize_t
> +cpu0_vid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct nct6775_data *data = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
> +}
> +
> +static DEVICE_ATTR_RO(cpu0_vid);
> +
> +/* Case open detection */
> +
> +static const u8 NCT6775_REG_CR_CASEOPEN_CLR[] = { 0xe6, 0xee };
> +static const u8 NCT6775_CR_CASEOPEN_CLR_MASK[] = { 0x20, 0x01 };
> +
> +static ssize_t
> +clear_caseopen(struct device *dev, struct device_attribute *attr,
> +	       const char *buf, size_t count)
> +{
> +	struct nct6775_data *data = dev_get_drvdata(dev);
> +	struct nct6775_sio_data *sio_data = data->driver_data;
> +	int nr = to_sensor_dev_attr(attr)->index - INTRUSION_ALARM_BASE;
> +	unsigned long val;
> +	u8 reg;
> +	int ret;
> +
> +	if (kstrtoul(buf, 10, &val) || val != 0)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	/*
> +	 * Use CR registers to clear caseopen status.
> +	 * The CR registers are the same for all chips, and not all chips
> +	 * support clearing the caseopen status through "regular" registers.
> +	 */
> +	ret = sio_data->sio_enter(sio_data);
> +	if (ret) {
> +		count = ret;
> +		goto error;
> +	}
> +
> +	sio_data->sio_select(sio_data, NCT6775_LD_ACPI);
> +	reg = sio_data->sio_inb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr]);
> +	reg |= NCT6775_CR_CASEOPEN_CLR_MASK[nr];
> +	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
> +	reg &= ~NCT6775_CR_CASEOPEN_CLR_MASK[nr];
> +	sio_data->sio_outb(sio_data, NCT6775_REG_CR_CASEOPEN_CLR[nr], reg);
> +	sio_data->sio_exit(sio_data);
> +
> +	data->valid = false;	/* Force cache refresh */
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IWUSR | S_IRUGO, nct6775_show_alarm,
> +			  clear_caseopen, INTRUSION_ALARM_BASE);
> +static SENSOR_DEVICE_ATTR(intrusion1_alarm, S_IWUSR | S_IRUGO, nct6775_show_alarm,
> +			  clear_caseopen, INTRUSION_ALARM_BASE + 1);
> +static SENSOR_DEVICE_ATTR(intrusion0_beep, S_IWUSR | S_IRUGO, nct6775_show_beep,
> +			  nct6775_store_beep, INTRUSION_ALARM_BASE);
> +static SENSOR_DEVICE_ATTR(intrusion1_beep, S_IWUSR | S_IRUGO, nct6775_show_beep,
> +			  nct6775_store_beep, INTRUSION_ALARM_BASE + 1);
> +static SENSOR_DEVICE_ATTR(beep_enable, S_IWUSR | S_IRUGO, nct6775_show_beep,
> +			  nct6775_store_beep, BEEP_ENABLE_BASE);
> +
> +static umode_t nct6775_other_is_visible(struct kobject *kobj,
> +					struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct nct6775_data *data = dev_get_drvdata(dev);
> +
> +	if (index == 0 && !data->have_vid)
> +		return 0;
> +
> +	if (index == 1 || index == 2) {
> +		if (data->ALARM_BITS[INTRUSION_ALARM_BASE + index - 1] < 0)
> +			return 0;
> +	}
> +
> +	if (index == 3 || index == 4) {
> +		if (data->BEEP_BITS[INTRUSION_ALARM_BASE + index - 3] < 0)
> +			return 0;
> +	}
> +
> +	return nct6775_attr_mode(data, attr);
> +}
> +
> +/*
> + * nct6775_other_is_visible uses the index into the following array
> + * to determine if attributes should be created or not.
> + * Any change in order or content must be matched.
> + */
> +static struct attribute *nct6775_attributes_other[] = {
> +	&dev_attr_cpu0_vid.attr,				/* 0 */
> +	&sensor_dev_attr_intrusion0_alarm.dev_attr.attr,	/* 1 */
> +	&sensor_dev_attr_intrusion1_alarm.dev_attr.attr,	/* 2 */
> +	&sensor_dev_attr_intrusion0_beep.dev_attr.attr,		/* 3 */
> +	&sensor_dev_attr_intrusion1_beep.dev_attr.attr,		/* 4 */
> +	&sensor_dev_attr_beep_enable.dev_attr.attr,		/* 5 */
> +
> +	NULL
> +};
> +
> +static const struct attribute_group nct6775_group_other = {
> +	.attrs = nct6775_attributes_other,
> +	.is_visible = nct6775_other_is_visible,
> +};
> +
> +static int nct6775_platform_probe_init(struct nct6775_data *data)
> +{
> +	int err;
> +	u8 cr2a;
> +	struct nct6775_sio_data *sio_data = data->driver_data;
> +
> +	err = sio_data->sio_enter(sio_data);
> +	if (err)
> +		return err;
> +
> +	cr2a = sio_data->sio_inb(sio_data, 0x2a);
> +	switch (data->kind) {
> +	case nct6775:
> +		data->have_vid = (cr2a & 0x40);
> +		break;
> +	case nct6776:
> +		data->have_vid = (cr2a & 0x60) == 0x40;
> +		break;
> +	case nct6106:
> +	case nct6116:
> +	case nct6779:
> +	case nct6791:
> +	case nct6792:
> +	case nct6793:
> +	case nct6795:
> +	case nct6796:
> +	case nct6797:
> +	case nct6798:
> +		break;
> +	}
> +
> +	/*
> +	 * Read VID value
> +	 * We can get the VID input values directly at logical device D 0xe3.
> +	 */
> +	if (data->have_vid) {
> +		sio_data->sio_select(sio_data, NCT6775_LD_VID);
> +		data->vid = sio_data->sio_inb(sio_data, 0xe3);
> +		data->vrm = vid_which_vrm();
> +	}
> +
> +	if (fan_debounce) {
> +		u8 tmp;
> +
> +		sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> +		tmp = sio_data->sio_inb(sio_data,
> +				    NCT6775_REG_CR_FAN_DEBOUNCE);
> +		switch (data->kind) {
> +		case nct6106:
> +		case nct6116:
> +			tmp |= 0xe0;
> +			break;
> +		case nct6775:
> +			tmp |= 0x1e;
> +			break;
> +		case nct6776:
> +		case nct6779:
> +			tmp |= 0x3e;
> +			break;
> +		case nct6791:
> +		case nct6792:
> +		case nct6793:
> +		case nct6795:
> +		case nct6796:
> +		case nct6797:
> +		case nct6798:
> +			tmp |= 0x7e;
> +			break;
> +		}
> +		sio_data->sio_outb(sio_data, NCT6775_REG_CR_FAN_DEBOUNCE,
> +			     tmp);
> +		pr_info("Enabled fan debounce for chip %s\n", data->name);
> +	}
> +
> +	nct6775_check_fan_inputs(data, sio_data);
> +
> +	sio_data->sio_exit(sio_data);
> +
> +	return nct6775_add_attr_group(data, &nct6775_group_other);
> +}
> +
> +static int nct6775_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
> +	struct nct6775_data *data;
> +	struct resource *res;
> +
> +	if (sio_data->access == access_direct) {
> +		res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +		if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH, DRVNAME))
> +			return -EBUSY;
> +	}
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->kind = sio_data->kind;
> +	data->sioreg = sio_data->sioreg;
> +
> +	if (sio_data->access == access_direct) {
> +		data->addr = res->start;
> +		data->read_value = nct6775_read_value;
> +		data->write_value = nct6775_write_value;
> +	} else {
> +		data->read_value = nct6775_wmi_read_value;
> +		data->write_value = nct6775_wmi_write_value;
> +	}
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->driver_data = sio_data;
> +	data->driver_init = nct6775_platform_probe_init;
> +
> +	return nct6775_probe(&pdev->dev, data);
> +}
> +
> +static struct platform_driver nct6775_driver = {
> +	.driver = {
> +		.name	= DRVNAME,
> +		.pm	= &nct6775_dev_pm_ops,
> +	},
> +	.probe		= nct6775_platform_probe,
> +};
> +
> +/* nct6775_find() looks for a '627 in the Super-I/O config space */
> +static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
> +{
> +	u16 val;
> +	int err;
> +	int addr;
> +
> +	sio_data->access = access_direct;
> +	sio_data->sioreg = sioaddr;
> +
> +	err = sio_data->sio_enter(sio_data);
> +	if (err)
> +		return err;
> +
> +	val = (sio_data->sio_inb(sio_data, SIO_REG_DEVID) << 8) |
> +		sio_data->sio_inb(sio_data, SIO_REG_DEVID + 1);
> +	if (force_id && val != 0xffff)
> +		val = force_id;
> +
> +	switch (val & SIO_ID_MASK) {
> +	case SIO_NCT6106_ID:
> +		sio_data->kind = nct6106;
> +		break;
> +	case SIO_NCT6116_ID:
> +		sio_data->kind = nct6116;
> +		break;
> +	case SIO_NCT6775_ID:
> +		sio_data->kind = nct6775;
> +		break;
> +	case SIO_NCT6776_ID:
> +		sio_data->kind = nct6776;
> +		break;
> +	case SIO_NCT6779_ID:
> +		sio_data->kind = nct6779;
> +		break;
> +	case SIO_NCT6791_ID:
> +		sio_data->kind = nct6791;
> +		break;
> +	case SIO_NCT6792_ID:
> +		sio_data->kind = nct6792;
> +		break;
> +	case SIO_NCT6793_ID:
> +		sio_data->kind = nct6793;
> +		break;
> +	case SIO_NCT6795_ID:
> +		sio_data->kind = nct6795;
> +		break;
> +	case SIO_NCT6796_ID:
> +		sio_data->kind = nct6796;
> +		break;
> +	case SIO_NCT6797_ID:
> +		sio_data->kind = nct6797;
> +		break;
> +	case SIO_NCT6798_ID:
> +		sio_data->kind = nct6798;
> +		break;
> +	default:
> +		if (val != 0xffff)
> +			pr_debug("unsupported chip ID: 0x%04x\n", val);
> +		sio_data->sio_exit(sio_data);
> +		return -ENODEV;
> +	}
> +
> +	/* We have a known chip, find the HWM I/O address */
> +	sio_data->sio_select(sio_data, NCT6775_LD_HWM);
> +	val = (sio_data->sio_inb(sio_data, SIO_REG_ADDR) << 8)
> +	    | sio_data->sio_inb(sio_data, SIO_REG_ADDR + 1);
> +	addr = val & IOREGION_ALIGNMENT;
> +	if (addr == 0) {
> +		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n");
> +		sio_data->sio_exit(sio_data);
> +		return -ENODEV;
> +	}
> +
> +	/* Activate logical device if needed */
> +	val = sio_data->sio_inb(sio_data, SIO_REG_ENABLE);
> +	if (!(val & 0x01)) {
> +		pr_warn("Forcibly enabling Super-I/O. Sensor is probably unusable.\n");
> +		sio_data->sio_outb(sio_data, SIO_REG_ENABLE, val | 0x01);
> +	}
> +
> +	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
> +	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
> +	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
> +	    sio_data->kind == nct6798)
> +		nct6791_enable_io_mapping(sio_data);
> +
> +	sio_data->sio_exit(sio_data);
> +	pr_info("Found %s or compatible chip at %#x:%#x\n",
> +		nct6775_sio_names[sio_data->kind], sioaddr, addr);
> +
> +	return addr;
> +}
> +
> +/*
> + * when Super-I/O functions move to a separate file, the Super-I/O
> + * bus will manage the lifetime of the device and this module will only keep
> + * track of the nct6775 driver. But since we use platform_device_alloc(), we
> + * must keep track of the device
> + */
> +static struct platform_device *pdev[2];
> +
> +static const char * const asus_wmi_boards[] = {
> +	"ProArt X570-CREATOR WIFI",
> +	"Pro B550M-C",
> +	"Pro WS X570-ACE",
> +	"PRIME B360-PLUS",
> +	"PRIME B460-PLUS",
> +	"PRIME B550-PLUS",
> +	"PRIME B550M-A",
> +	"PRIME B550M-A (WI-FI)",
> +	"PRIME X570-P",
> +	"PRIME X570-PRO",
> +	"ROG CROSSHAIR VIII DARK HERO",
> +	"ROG CROSSHAIR VIII FORMULA",
> +	"ROG CROSSHAIR VIII HERO",
> +	"ROG CROSSHAIR VIII IMPACT",
> +	"ROG STRIX B550-A GAMING",
> +	"ROG STRIX B550-E GAMING",
> +	"ROG STRIX B550-F GAMING",
> +	"ROG STRIX B550-F GAMING (WI-FI)",
> +	"ROG STRIX B550-F GAMING WIFI II",
> +	"ROG STRIX B550-I GAMING",
> +	"ROG STRIX B550-XE GAMING (WI-FI)",
> +	"ROG STRIX X570-E GAMING",
> +	"ROG STRIX X570-F GAMING",
> +	"ROG STRIX X570-I GAMING",
> +	"ROG STRIX Z390-E GAMING",
> +	"ROG STRIX Z390-F GAMING",
> +	"ROG STRIX Z390-H GAMING",
> +	"ROG STRIX Z390-I GAMING",
> +	"ROG STRIX Z490-A GAMING",
> +	"ROG STRIX Z490-E GAMING",
> +	"ROG STRIX Z490-F GAMING",
> +	"ROG STRIX Z490-G GAMING",
> +	"ROG STRIX Z490-G GAMING (WI-FI)",
> +	"ROG STRIX Z490-H GAMING",
> +	"ROG STRIX Z490-I GAMING",
> +	"TUF GAMING B550M-PLUS",
> +	"TUF GAMING B550M-PLUS (WI-FI)",
> +	"TUF GAMING B550-PLUS",
> +	"TUF GAMING B550-PRO",
> +	"TUF GAMING X570-PLUS",
> +	"TUF GAMING X570-PLUS (WI-FI)",
> +	"TUF GAMING X570-PRO (WI-FI)",
> +	"TUF GAMING Z490-PLUS",
> +	"TUF GAMING Z490-PLUS (WI-FI)",
> +};
> +
> +static int __init sensors_nct6775_platform_init(void)
> +{
> +	int i, err;
> +	bool found = false;
> +	int address;
> +	struct resource res;
> +	struct nct6775_sio_data sio_data;
> +	int sioaddr[2] = { 0x2e, 0x4e };
> +	enum sensor_access access = access_direct;
> +	const char *board_vendor, *board_name;
> +	u8 tmp;
> +
> +	err = platform_driver_register(&nct6775_driver);
> +	if (err)
> +		return err;
> +
> +	board_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
> +	board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (board_name && board_vendor &&
> +	    !strcmp(board_vendor, "ASUSTeK COMPUTER INC.")) {
> +		err = match_string(asus_wmi_boards, ARRAY_SIZE(asus_wmi_boards),
> +				   board_name);
> +		if (err >= 0) {
> +			/* if reading chip id via WMI succeeds, use WMI */
> +			if (!nct6775_asuswmi_read(0, NCT6775_PORT_CHIPID, &tmp) && tmp) {
> +				pr_info("Using Asus WMI to access %#x chip.\n", tmp);
> +				access = access_asuswmi;
> +			} else {
> +				pr_err("Can't read ChipID by Asus WMI.\n");
> +			}
> +		}
> +	}
> +
> +	/*
> +	 * initialize sio_data->kind and sio_data->sioreg.
> +	 *
> +	 * when Super-I/O functions move to a separate file, the Super-I/O
> +	 * driver will probe 0x2e and 0x4e and auto-detect the presence of a
> +	 * nct6775 hardware monitor, and call probe()
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
> +		sio_data.sio_outb = superio_outb;
> +		sio_data.sio_inb = superio_inb;
> +		sio_data.sio_select = superio_select;
> +		sio_data.sio_enter = superio_enter;
> +		sio_data.sio_exit = superio_exit;
> +
> +		address = nct6775_find(sioaddr[i], &sio_data);
> +		if (address <= 0)
> +			continue;
> +
> +		found = true;
> +
> +		sio_data.access = access;
> +
> +		if (access == access_asuswmi) {
> +			sio_data.sio_outb = superio_wmi_outb;
> +			sio_data.sio_inb = superio_wmi_inb;
> +			sio_data.sio_select = superio_wmi_select;
> +			sio_data.sio_enter = superio_wmi_enter;
> +			sio_data.sio_exit = superio_wmi_exit;
> +		}
> +
> +		pdev[i] = platform_device_alloc(DRVNAME, address);
> +		if (!pdev[i]) {
> +			err = -ENOMEM;
> +			goto exit_device_unregister;
> +		}
> +
> +		err = platform_device_add_data(pdev[i], &sio_data,
> +					       sizeof(struct nct6775_sio_data));
> +		if (err)
> +			goto exit_device_put;
> +
> +		if (sio_data.access == access_direct) {
> +			memset(&res, 0, sizeof(res));
> +			res.name = DRVNAME;
> +			res.start = address + IOREGION_OFFSET;
> +			res.end = address + IOREGION_OFFSET + IOREGION_LENGTH - 1;
> +			res.flags = IORESOURCE_IO;
> +
> +			err = acpi_check_resource_conflict(&res);
> +			if (err) {
> +				platform_device_put(pdev[i]);
> +				pdev[i] = NULL;
> +				continue;
> +			}
> +
> +			err = platform_device_add_resources(pdev[i], &res, 1);
> +			if (err)
> +				goto exit_device_put;
> +		}
> +
> +		/* platform_device_add calls probe() */
> +		err = platform_device_add(pdev[i]);
> +		if (err)
> +			goto exit_device_put;
> +	}
> +	if (!found) {
> +		err = -ENODEV;
> +		goto exit_unregister;
> +	}
> +
> +	return 0;
> +
> +exit_device_put:
> +	platform_device_put(pdev[i]);
> +exit_device_unregister:
> +	while (--i >= 0) {
> +		if (pdev[i])
> +			platform_device_unregister(pdev[i]);
> +	}
> +exit_unregister:
> +	platform_driver_unregister(&nct6775_driver);
> +	return err;
> +}
> +
> +static void __exit sensors_nct6775_platform_exit(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pdev); i++) {
> +		if (pdev[i])
> +			platform_device_unregister(pdev[i]);
> +	}
> +	platform_driver_unregister(&nct6775_driver);
> +}
> +
> +MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
> +MODULE_DESCRIPTION("Platform driver for NCT6775F and compatible chips");
> +MODULE_LICENSE("GPL");
> +
> +/*
> + * For module-name compatibility with the original version of this driver
> + * prior to the core/platform/i2c split
> + */
> +MODULE_ALIAS("nct6775");
> +
> +module_init(sensors_nct6775_platform_init);
> +module_exit(sensors_nct6775_platform_exit);
> diff --git a/drivers/hwmon/nct6775.h b/drivers/hwmon/nct6775.h
> new file mode 100644
> index 000000000000..1cb754a2284b
> --- /dev/null
> +++ b/drivers/hwmon/nct6775.h
> @@ -0,0 +1,233 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef __HWMON_NCT6775_H__
> +#define __HWMON_NCT6775_H__
> +
> +#include <linux/types.h>
> +
> +enum kinds { nct6106, nct6116, nct6775, nct6776, nct6779, nct6791, nct6792,
> +	     nct6793, nct6795, nct6796, nct6797, nct6798 };
> +enum pwm_enable { off, manual, thermal_cruise, speed_cruise, sf3, sf4 };
> +
> +#define NUM_TEMP	10	/* Max number of temp attribute sets w/ limits*/
> +#define NUM_TEMP_FIXED	6	/* Max number of fixed temp attribute sets */
> +#define NUM_TSI_TEMP	8	/* Max number of TSI temp register pairs */
> +
> +#define NUM_REG_ALARM	7	/* Max number of alarm registers */
> +#define NUM_REG_BEEP	5	/* Max number of beep registers */
> +
> +#define NUM_FAN		7
> +
> +struct nct6775_data {
> +	int addr;	/* IO base of hw monitor block */
> +	int sioreg;	/* SIO register address */
> +	enum kinds kind;
> +	const char *name;
> +
> +	const struct attribute_group *groups[7];
> +	u8 num_groups;
> +
> +	u16 reg_temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
> +				    * 3=temp_crit, 4=temp_lcrit
> +				    */
> +	u8 temp_src[NUM_TEMP];
> +	u16 reg_temp_config[NUM_TEMP];
> +	const char * const *temp_label;
> +	u32 temp_mask;
> +	u32 virt_temp_mask;
> +
> +	u16 REG_CONFIG;
> +	u16 REG_VBAT;
> +	u16 REG_DIODE;
> +	u8 DIODE_MASK;
> +
> +	const s8 *ALARM_BITS;
> +	const s8 *BEEP_BITS;
> +
> +	const u16 *REG_VIN;
> +	const u16 *REG_IN_MINMAX[2];
> +
> +	const u16 *REG_TARGET;
> +	const u16 *REG_FAN;
> +	const u16 *REG_FAN_MODE;
> +	const u16 *REG_FAN_MIN;
> +	const u16 *REG_FAN_PULSES;
> +	const u16 *FAN_PULSE_SHIFT;
> +	const u16 *REG_FAN_TIME[3];
> +
> +	const u16 *REG_TOLERANCE_H;
> +
> +	const u8 *REG_PWM_MODE;
> +	const u8 *PWM_MODE_MASK;
> +
> +	const u16 *REG_PWM[7];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
> +				 * [3]=pwm_max, [4]=pwm_step,
> +				 * [5]=weight_duty_step, [6]=weight_duty_base
> +				 */
> +	const u16 *REG_PWM_READ;
> +
> +	const u16 *REG_CRITICAL_PWM_ENABLE;
> +	u8 CRITICAL_PWM_ENABLE_MASK;
> +	const u16 *REG_CRITICAL_PWM;
> +
> +	const u16 *REG_AUTO_TEMP;
> +	const u16 *REG_AUTO_PWM;
> +
> +	const u16 *REG_CRITICAL_TEMP;
> +	const u16 *REG_CRITICAL_TEMP_TOLERANCE;
> +
> +	const u16 *REG_TEMP_SOURCE;	/* temp register sources */
> +	const u16 *REG_TEMP_SEL;
> +	const u16 *REG_WEIGHT_TEMP_SEL;
> +	const u16 *REG_WEIGHT_TEMP[3];	/* 0=base, 1=tolerance, 2=step */
> +
> +	const u16 *REG_TEMP_OFFSET;
> +
> +	const u16 *REG_ALARM;
> +	const u16 *REG_BEEP;
> +
> +	const u16 *REG_TSI_TEMP;
> +
> +	unsigned int (*fan_from_reg)(u16 reg, unsigned int divreg);
> +	unsigned int (*fan_from_reg_min)(u16 reg, unsigned int divreg);
> +
> +	struct mutex update_lock;
> +	bool valid;		/* true if following fields are valid */
> +	unsigned long last_updated;	/* In jiffies */
> +
> +	/* Register values */
> +	u8 bank;		/* current register bank */
> +	u8 in_num;		/* number of in inputs we have */
> +	u8 in[15][3];		/* [0]=in, [1]=in_max, [2]=in_min */
> +	unsigned int rpm[NUM_FAN];
> +	u16 fan_min[NUM_FAN];
> +	u8 fan_pulses[NUM_FAN];
> +	u8 fan_div[NUM_FAN];
> +	u8 has_pwm;
> +	u8 has_fan;		/* some fan inputs can be disabled */
> +	u8 has_fan_min;		/* some fans don't have min register */
> +	bool has_fan_div;
> +
> +	u8 num_temp_alarms;	/* 2, 3, or 6 */
> +	u8 num_temp_beeps;	/* 2, 3, or 6 */
> +	u8 temp_fixed_num;	/* 3 or 6 */
> +	u8 temp_type[NUM_TEMP_FIXED];
> +	s8 temp_offset[NUM_TEMP_FIXED];
> +	s16 temp[5][NUM_TEMP]; /* 0=temp, 1=temp_over, 2=temp_hyst,
> +				* 3=temp_crit, 4=temp_lcrit */
> +	s16 tsi_temp[NUM_TSI_TEMP];
> +	u64 alarms;
> +	u64 beeps;
> +
> +	u8 pwm_num;	/* number of pwm */
> +	u8 pwm_mode[NUM_FAN];	/* 0->DC variable voltage,
> +				 * 1->PWM variable duty cycle
> +				 */
> +	enum pwm_enable pwm_enable[NUM_FAN];
> +			/* 0->off
> +			 * 1->manual
> +			 * 2->thermal cruise mode (also called SmartFan I)
> +			 * 3->fan speed cruise mode
> +			 * 4->SmartFan III
> +			 * 5->enhanced variable thermal cruise (SmartFan IV)
> +			 */
> +	u8 pwm[7][NUM_FAN];	/* [0]=pwm, [1]=pwm_start, [2]=pwm_floor,
> +				 * [3]=pwm_max, [4]=pwm_step,
> +				 * [5]=weight_duty_step, [6]=weight_duty_base
> +				 */
> +
> +	u8 target_temp[NUM_FAN];
> +	u8 target_temp_mask;
> +	u32 target_speed[NUM_FAN];
> +	u32 target_speed_tolerance[NUM_FAN];
> +	u8 speed_tolerance_limit;
> +
> +	u8 temp_tolerance[2][NUM_FAN];
> +	u8 tolerance_mask;
> +
> +	u8 fan_time[3][NUM_FAN]; /* 0 = stop_time, 1 = step_up, 2 = step_down */
> +
> +	/* Automatic fan speed control registers */
> +	int auto_pwm_num;
> +	u8 auto_pwm[NUM_FAN][7];
> +	u8 auto_temp[NUM_FAN][7];
> +	u8 pwm_temp_sel[NUM_FAN];
> +	u8 pwm_weight_temp_sel[NUM_FAN];
> +	u8 weight_temp[3][NUM_FAN];	/* 0->temp_step, 1->temp_step_tol,
> +					 * 2->temp_base
> +					 */
> +
> +	u8 vid;
> +	u8 vrm;
> +
> +	bool have_vid;
> +
> +	u16 have_temp;
> +	u16 have_temp_fixed;
> +	u16 have_tsi_temp;
> +	u16 have_in;
> +
> +	/* Remember extra register values over suspend/resume */
> +	u8 vbat;
> +	u8 fandiv1;
> +	u8 fandiv2;
> +	u8 sio_reg_enable;
> +
> +	/* nct6775_*() callbacks  */
> +	u16 (*read_value)(struct nct6775_data *data, u16 reg);
> +	int (*write_value)(struct nct6775_data *data, u16 reg, u16 value);
> +
> +	/* driver-specific (platform, i2c) initialization hook and data */
> +	int (*driver_init)(struct nct6775_data *data);
> +	void *driver_data;
> +
> +	bool read_only;
> +};
> +
> +bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg);
> +int nct6775_probe(struct device *dev, struct nct6775_data *data);
> +struct nct6775_data *nct6775_update_device(struct device *dev);
> +int nct6775_write_temp(struct nct6775_data *data, u16 reg, u16 value);
> +
> +ssize_t nct6775_show_alarm(struct device *dev, struct device_attribute *attr, char *buf);
> +ssize_t nct6775_show_beep(struct device *dev, struct device_attribute *attr, char *buf);
> +ssize_t nct6775_store_beep(struct device *dev, struct device_attribute *attr, const char *buf,
> +			   size_t count);
> +
> +static inline umode_t nct6775_attr_mode(struct nct6775_data *data, struct attribute *attr)
> +{
> +	return data->read_only ? (attr->mode & ~0222) : attr->mode;
> +}
> +
> +static inline int
> +nct6775_add_attr_group(struct nct6775_data *data, const struct attribute_group *group)
> +{
> +	/* Need to leave a NULL terminator at the end of data->groups */
> +	if (WARN_ON(data->num_groups == ARRAY_SIZE(data->groups) - 1))
> +		return -ENOSPC;
> +
> +	data->groups[data->num_groups++] = group;
> +	return 0;
> +}
> +
> +#define NCT6775_REG_BANK	0x4E
> +#define NCT6775_REG_CONFIG	0x40
> +
> +#define NCT6775_REG_FANDIV1		0x506
> +#define NCT6775_REG_FANDIV2		0x507
> +
> +#define NCT6791_REG_HM_IO_SPACE_LOCK_ENABLE	0x28
> +
> +#define FAN_ALARM_BASE		16
> +#define TEMP_ALARM_BASE		24
> +#define INTRUSION_ALARM_BASE	30
> +#define BEEP_ENABLE_BASE	15
> +
> +/*
> + * Not currently used:
> + * REG_MAN_ID has the value 0x5ca3 for all supported chips.
> + * REG_CHIP_ID == 0x88/0xa1/0xc1 depending on chip model.
> + * REG_MAN_ID is at port 0x4f
> + * REG_CHIP_ID is at port 0x58
> + */
> +
> +#endif /* __HWMON_NCT6775_H__ */
> -- 
> 2.35.1
> 
