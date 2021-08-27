Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 843303FAF8F
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 03:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyXn73zLzz2yHH
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 11:30:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=UJtVJtuc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UJtVJtuc; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxCKw2FCqz2ypW
 for <openbmc@lists.ozlabs.org>; Sat, 28 Aug 2021 07:20:12 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id oa17so5389517pjb.1
 for <openbmc@lists.ozlabs.org>; Fri, 27 Aug 2021 14:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wqgtu0fo78tTbFLa5g3kBypVgmQWrVEWPa/MRUzF38U=;
 b=UJtVJtucbpHfphYzXjJSYVP39A5n9b46PPbkfDLKVCer+iSKqR1CpkXX5pQg4H2dT/
 SWcjZICihrb5YjlXh62o+g+MqBeQiHMXtLMwcaaLr1VoDjh7eZehAPosryi8BsLAZYYD
 6g2/tVvSs7NaYNG1TalZ+VP8sniEsAL+YCipKW68LfK+3CZiKAGNtrpffmT4pKD2HZ+L
 NeF4sJ7YSxFpD40rM1uRcqaA+Ts+IiKiFC1KDml5QUePNUtvOGBk565qy34+S+LPTzrk
 gipT049DAq0bmIn/O8uUzFM6zUmOa6788ekmMjv8jVJaE2vR6ZPTSBUvUcKP4O9tBpU5
 NtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wqgtu0fo78tTbFLa5g3kBypVgmQWrVEWPa/MRUzF38U=;
 b=PiJwarJJOEf3wZqkbya//93/3XGMSzoEgpv8Sll8Q1yjlIzkBKFvcRCQrApjEFarTt
 Lo1dcTamGBKAlDuLBwBiRHc5fu6Co52wso9OvkE86sij8c11IY18IGBDTv69bZPaia8X
 KALp8nYfjCEzyQHgyn83tCP+lXh4zor07lETMC+nImjBX3R8lSBpHftFXHLge2IK/67h
 X+2vTD9ZMPvZJnWyKeWS8Ky+rkfP78Uyb/YzFa+6pFhmwtCuchqPtQ57fYOIVR+wrNP+
 kLd7byonm6yLbtkPEj7GQPy63qU43ku88xjXHUM2BhT4JVU66W+ZPjF0h20wTJjPU4Hy
 UJGw==
X-Gm-Message-State: AOAM530VJ2BJavmbRr97iP1SMdNBjJi72qmVOPibxl/fdOZPdvHsITan
 i+iBqINFMbaGKmMCLkqpsnoD3XB0b3Fw6aD3g7ddVA==
X-Google-Smtp-Source: ABdhPJwRi0QtorHi+AX9UQYITlr/w1GAU0DNrnIED5VZ8uTFziJJrhJ4KN2ezkbc5nvJWQ/qI2vqlunAvmAbE0qgqPc=
X-Received: by 2002:a17:902:edd0:b0:135:b351:bd5a with SMTP id
 q16-20020a170902edd000b00135b351bd5amr10561526plk.52.1630099210365; Fri, 27
 Aug 2021 14:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-11-iwona.winiarska@intel.com>
In-Reply-To: <20210803113134.2262882-11-iwona.winiarska@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 27 Aug 2021 14:19:59 -0700
Message-ID: <CAPcyv4iUeCcBuMk8WskLnP6K_FRKPSN3N45cyey=H-R5X08M4g@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] peci: Add support for PECI device drivers
To: Iwona Winiarska <iwona.winiarska@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 30 Aug 2021 11:27:51 +1000
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
Cc: linux-aspeed@lists.ozlabs.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Zev Weiss <zweiss@equinix.com>, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 X86 ML <x86@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Device Tree <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 3, 2021 at 4:36 AM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> Here we're adding support for PECI device drivers, which unlike PECI

s/Here we're adding/Add/

> controller drivers are actually able to provide functionalities to
> userspace.

>
> We're also extending peci_request API to allow querying more details

s/We're also extending/Also, extend/

...for the most part imperative tense is the preferred tense, by
upstream maintainers, for changelogs.

> about PECI device (e.g. model/family), that's going to be used to find
> a compatible peci_driver.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/peci/Kconfig    |   1 +
>  drivers/peci/core.c     |  49 +++++++++
>  drivers/peci/device.c   | 105 ++++++++++++++++++++
>  drivers/peci/internal.h |  75 ++++++++++++++
>  drivers/peci/request.c  | 214 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/peci.h    |  19 ++++
>  lib/Kconfig             |   2 +-
>  7 files changed, 464 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
> index 99279df97a78..1d0532e3a801 100644
> --- a/drivers/peci/Kconfig
> +++ b/drivers/peci/Kconfig
> @@ -2,6 +2,7 @@
>
>  menuconfig PECI
>         tristate "PECI support"
> +       select GENERIC_LIB_X86

GENERIC_LIB_X86 has dependencies, so this 'select' will make kbuild
unhappy when that dependency is not met. Given that this symbol
already selected by X86, it seems this just wants a "depends on
GENERIC_LIB_X86".

>         help
>           The Platform Environment Control Interface (PECI) is an interface
>           that provides a communication channel to Intel processors and
> diff --git a/drivers/peci/core.c b/drivers/peci/core.c
> index c473acb3c2a0..33c07920493d 100644
> --- a/drivers/peci/core.c
> +++ b/drivers/peci/core.c
> @@ -157,8 +157,57 @@ struct peci_controller *devm_peci_controller_add(struct device *dev,
>  }
>  EXPORT_SYMBOL_NS_GPL(devm_peci_controller_add, PECI);
>
> +static const struct peci_device_id *
> +peci_bus_match_device_id(const struct peci_device_id *id, struct peci_device *device)
> +{
> +       while (id->family != 0) {
> +               if (id->family == device->info.family &&
> +                   id->model == device->info.model)
> +                       return id;
> +               id++;
> +       }
> +
> +       return NULL;
> +}
> +
> +static int peci_bus_device_match(struct device *dev, struct device_driver *drv)
> +{
> +       struct peci_device *device = to_peci_device(dev);
> +       struct peci_driver *peci_drv = to_peci_driver(drv);
> +
> +       if (dev->type != &peci_device_type)
> +               return 0;
> +
> +       if (peci_bus_match_device_id(peci_drv->id_table, device))
> +               return 1;

Save a couple lines and do:

    return peci_bus_match_device_id(...)

> +
> +       return 0;
> +}
> +
> +static int peci_bus_device_probe(struct device *dev)
> +{
> +       struct peci_device *device = to_peci_device(dev);
> +       struct peci_driver *driver = to_peci_driver(dev->driver);
> +
> +       return driver->probe(device, peci_bus_match_device_id(driver->id_table, device));
> +}
> +
> +static int peci_bus_device_remove(struct device *dev)

Note, in linux-next this prototype has changed to:

    void (*remove)(struct device *dev);

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/linux/device/bus.h


> +{
> +       struct peci_device *device = to_peci_device(dev);
> +       struct peci_driver *driver = to_peci_driver(dev->driver);
> +
> +       if (driver->remove)
> +               driver->remove(device);
> +
> +       return 0;
> +}
> +
>  struct bus_type peci_bus_type = {
>         .name           = "peci",
> +       .match          = peci_bus_device_match,
> +       .probe          = peci_bus_device_probe,
> +       .remove         = peci_bus_device_remove,
>         .bus_groups     = peci_bus_groups,
>  };
>
> diff --git a/drivers/peci/device.c b/drivers/peci/device.c
> index d77d9dabd51e..a78c02399574 100644
> --- a/drivers/peci/device.c
> +++ b/drivers/peci/device.c
> @@ -1,11 +1,85 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (c) 2018-2021 Intel Corporation
>
> +#include <linux/bitfield.h>
>  #include <linux/peci.h>
>  #include <linux/slab.h>
> +#include <linux/x86/cpu.h>
>
>  #include "internal.h"
>
> +#define REVISION_NUM_MASK GENMASK(15, 8)
> +static int peci_get_revision(struct peci_device *device, u8 *revision)
> +{
> +       struct peci_request *req;
> +       u64 dib;
> +
> +       req = peci_get_dib(device);

I would expect peci_get_dib() to return @dib.

> +       if (IS_ERR(req))
> +               return PTR_ERR(req);
> +
> +       /*
> +        * PECI device may be in a state where it is unable to return a proper
> +        * DIB, in which case it returns 0 as DIB value.
> +        * Let's treat this as an error to avoid carrying on with the detection
> +        * using invalid revision.
> +        */
> +       dib = peci_request_data_dib(req);

I would expect peci_request_data_dib() to make a request.

A stack allocated peci_request passed to peci_get_dib() that returns
an error code would seem to be cleaner than this current organization.

> +       if (dib == 0) {
> +               peci_request_free(req);
> +               return -EIO;
> +       }
> +
> +       *revision = FIELD_GET(REVISION_NUM_MASK, dib);
> +
> +       peci_request_free(req);
> +
> +       return 0;
> +}
> +
> +static int peci_get_cpu_id(struct peci_device *device, u32 *cpu_id)
> +{
> +       struct peci_request *req;
> +       int ret;
> +
> +       req = peci_pkg_cfg_readl(device, PECI_PCS_PKG_ID, PECI_PKG_ID_CPU_ID);
> +       if (IS_ERR(req))
> +               return PTR_ERR(req);
> +
> +       ret = peci_request_status(req);
> +       if (ret)
> +               goto out_req_free;
> +
> +       *cpu_id = peci_request_data_readl(req);
> +out_req_free:
> +       peci_request_free(req);
> +
> +       return ret;
> +}
> +
> +static int peci_device_info_init(struct peci_device *device)
> +{
> +       u8 revision;
> +       u32 cpu_id;
> +       int ret;
> +
> +       ret = peci_get_cpu_id(device, &cpu_id);
> +       if (ret)
> +               return ret;
> +
> +       device->info.family = x86_family(cpu_id);
> +       device->info.model = x86_model(cpu_id);
> +
> +       ret = peci_get_revision(device, &revision);
> +       if (ret)
> +               return ret;
> +       device->info.peci_revision = revision;
> +
> +       device->info.socket_id = device->addr - PECI_BASE_ADDR;
> +
> +       return 0;
> +}
> +
>  static int peci_detect(struct peci_controller *controller, u8 addr)
>  {
>         struct peci_request *req;
> @@ -79,6 +153,10 @@ int peci_device_create(struct peci_controller *controller, u8 addr)
>         device->dev.bus = &peci_bus_type;
>         device->dev.type = &peci_device_type;
>
> +       ret = peci_device_info_init(device);
> +       if (ret)
> +               goto err_free;
> +
>         ret = dev_set_name(&device->dev, "%d-%02x", controller->id, device->addr);
>         if (ret)
>                 goto err_free;
> @@ -102,6 +180,33 @@ void peci_device_destroy(struct peci_device *device)
>         device_unregister(&device->dev);
>  }
>
> +int __peci_driver_register(struct peci_driver *driver, struct module *owner,
> +                          const char *mod_name)
> +{
> +       driver->driver.bus = &peci_bus_type;
> +       driver->driver.owner = owner;
> +       driver->driver.mod_name = mod_name;
> +
> +       if (!driver->probe) {
> +               pr_err("peci: trying to register driver without probe callback\n");
> +               return -EINVAL;
> +       }
> +
> +       if (!driver->id_table) {
> +               pr_err("peci: trying to register driver without device id table\n");
> +               return -EINVAL;
> +       }
> +
> +       return driver_register(&driver->driver);
> +}
> +EXPORT_SYMBOL_NS_GPL(__peci_driver_register, PECI);
> +
> +void peci_driver_unregister(struct peci_driver *driver)
> +{
> +       driver_unregister(&driver->driver);
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_driver_unregister, PECI);
> +
>  static void peci_device_release(struct device *dev)
>  {
>         struct peci_device *device = to_peci_device(dev);
> diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
> index 978e12c8e1d3..d661e1b65694 100644
> --- a/drivers/peci/internal.h
> +++ b/drivers/peci/internal.h
> @@ -19,6 +19,34 @@ struct peci_request;
>  struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u8 rx_len);
>  void peci_request_free(struct peci_request *req);
>
> +int peci_request_status(struct peci_request *req);
> +u64 peci_request_data_dib(struct peci_request *req);
> +
> +u8 peci_request_data_readb(struct peci_request *req);
> +u16 peci_request_data_readw(struct peci_request *req);
> +u32 peci_request_data_readl(struct peci_request *req);
> +u64 peci_request_data_readq(struct peci_request *req);
> +
> +struct peci_request *peci_get_dib(struct peci_device *device);
> +struct peci_request *peci_get_temp(struct peci_device *device);
> +
> +struct peci_request *peci_pkg_cfg_readb(struct peci_device *device, u8 index, u16 param);
> +struct peci_request *peci_pkg_cfg_readw(struct peci_device *device, u8 index, u16 param);
> +struct peci_request *peci_pkg_cfg_readl(struct peci_device *device, u8 index, u16 param);
> +struct peci_request *peci_pkg_cfg_readq(struct peci_device *device, u8 index, u16 param);
> +
> +/**
> + * struct peci_device_id - PECI device data to match
> + * @data: pointer to driver private data specific to device
> + * @family: device family
> + * @model: device model
> + */
> +struct peci_device_id {
> +       const void *data;
> +       u16 family;
> +       u8 model;
> +};
> +
>  extern struct device_type peci_device_type;
>  extern const struct attribute_group *peci_device_groups[];
>
> @@ -28,6 +56,53 @@ void peci_device_destroy(struct peci_device *device);
>  extern struct bus_type peci_bus_type;
>  extern const struct attribute_group *peci_bus_groups[];
>
> +/**
> + * struct peci_driver - PECI driver
> + * @driver: inherit device driver
> + * @probe: probe callback
> + * @remove: remove callback
> + * @id_table: PECI device match table to decide which device to bind
> + */
> +struct peci_driver {
> +       struct device_driver driver;
> +       int (*probe)(struct peci_device *device, const struct peci_device_id *id);
> +       void (*remove)(struct peci_device *device);
> +       const struct peci_device_id *id_table;
> +};
> +
> +static inline struct peci_driver *to_peci_driver(struct device_driver *d)
> +{
> +       return container_of(d, struct peci_driver, driver);
> +}
> +
> +int __peci_driver_register(struct peci_driver *driver, struct module *owner,
> +                          const char *mod_name);
> +/**
> + * peci_driver_register() - register PECI driver
> + * @driver: the driver to be registered
> + * @owner: owner module of the driver being registered
> + * @mod_name: module name string
> + *
> + * PECI drivers that don't need to do anything special in module init should
> + * use the convenience "module_peci_driver" macro instead
> + *
> + * Return: zero on success, else a negative error code.
> + */
> +#define peci_driver_register(driver) \
> +       __peci_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
> +void peci_driver_unregister(struct peci_driver *driver);
> +
> +/**
> + * module_peci_driver() - helper macro for registering a modular PECI driver
> + * @__peci_driver: peci_driver struct
> + *
> + * Helper macro for PECI drivers which do not do anything special in module
> + * init/exit. This eliminates a lot of boilerplate. Each module may only
> + * use this macro once, and calling it replaces module_init() and module_exit()
> + */
> +#define module_peci_driver(__peci_driver) \
> +       module_driver(__peci_driver, peci_driver_register, peci_driver_unregister)
> +
>  extern struct device_type peci_controller_type;
>
>  int peci_controller_scan_devices(struct peci_controller *controller);
> diff --git a/drivers/peci/request.c b/drivers/peci/request.c
> index 81b567bc7b87..fe032d5a5e1b 100644
> --- a/drivers/peci/request.c
> +++ b/drivers/peci/request.c
> @@ -1,13 +1,140 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  // Copyright (c) 2021 Intel Corporation
>
> +#include <linux/bug.h>
>  #include <linux/export.h>
>  #include <linux/peci.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>
> +#include <asm/unaligned.h>
> +
>  #include "internal.h"
>
> +#define PECI_GET_DIB_CMD               0xf7
> +#define  PECI_GET_DIB_WR_LEN           1
> +#define  PECI_GET_DIB_RD_LEN           8
> +
> +#define PECI_RDPKGCFG_CMD              0xa1
> +#define  PECI_RDPKGCFG_WR_LEN          5
> +#define  PECI_RDPKGCFG_RD_LEN_BASE     1
> +#define PECI_WRPKGCFG_CMD              0xa5
> +#define  PECI_WRPKGCFG_WR_LEN_BASE     6
> +#define  PECI_WRPKGCFG_RD_LEN          1
> +
> +/* Device Specific Completion Code (CC) Definition */
> +#define PECI_CC_SUCCESS                                0x40
> +#define PECI_CC_NEED_RETRY                     0x80
> +#define PECI_CC_OUT_OF_RESOURCE                        0x81
> +#define PECI_CC_UNAVAIL_RESOURCE               0x82
> +#define PECI_CC_INVALID_REQ                    0x90
> +#define PECI_CC_MCA_ERROR                      0x91
> +#define PECI_CC_CATASTROPHIC_MCA_ERROR         0x93
> +#define PECI_CC_FATAL_MCA_ERROR                        0x94
> +#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB                0x98
> +#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR   0x9B
> +#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA    0x9C
> +
> +#define PECI_RETRY_BIT                 BIT(0)
> +
> +#define PECI_RETRY_TIMEOUT             msecs_to_jiffies(700)
> +#define PECI_RETRY_INTERVAL_MIN                msecs_to_jiffies(1)
> +#define PECI_RETRY_INTERVAL_MAX                msecs_to_jiffies(128)
> +
> +static u8 peci_request_data_cc(struct peci_request *req)
> +{
> +       return req->rx.buf[0];
> +}
> +
> +/**
> + * peci_request_status() - return -errno based on PECI completion code
> + * @req: the PECI request that contains response data with completion code
> + *
> + * It can't be used for Ping(), GetDIB() and GetTemp() - for those commands we
> + * don't expect completion code in the response.
> + *
> + * Return: -errno
> + */
> +int peci_request_status(struct peci_request *req)
> +{
> +       u8 cc = peci_request_data_cc(req);
> +
> +       if (cc != PECI_CC_SUCCESS)
> +               dev_dbg(&req->device->dev, "ret: %#02x\n", cc);
> +
> +       switch (cc) {
> +       case PECI_CC_SUCCESS:
> +               return 0;
> +       case PECI_CC_NEED_RETRY:
> +       case PECI_CC_OUT_OF_RESOURCE:
> +       case PECI_CC_UNAVAIL_RESOURCE:
> +               return -EAGAIN;
> +       case PECI_CC_INVALID_REQ:
> +               return -EINVAL;
> +       case PECI_CC_MCA_ERROR:
> +       case PECI_CC_CATASTROPHIC_MCA_ERROR:
> +       case PECI_CC_FATAL_MCA_ERROR:
> +       case PECI_CC_PARITY_ERR_GPSB_OR_PMSB:
> +       case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR:
> +       case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA:
> +               return -EIO;
> +       }
> +
> +       WARN_ONCE(1, "Unknown PECI completion code: %#02x\n", cc);
> +
> +       return -EIO;
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_request_status, PECI);
> +
> +static int peci_request_xfer(struct peci_request *req)
> +{
> +       struct peci_device *device = req->device;
> +       struct peci_controller *controller = to_peci_controller(device->dev.parent);
> +       int ret;
> +
> +       mutex_lock(&controller->bus_lock);
> +       ret = controller->ops->xfer(controller, device->addr, req);
> +       mutex_unlock(&controller->bus_lock);
> +
> +       return ret;
> +}
> +
> +static int peci_request_xfer_retry(struct peci_request *req)
> +{
> +       long wait_interval = PECI_RETRY_INTERVAL_MIN;
> +       struct peci_device *device = req->device;
> +       struct peci_controller *controller = to_peci_controller(device->dev.parent);
> +       unsigned long start = jiffies;
> +       int ret;
> +
> +       /* Don't try to use it for ping */
> +       if (WARN_ON(!req->rx.buf))
> +               return 0;
> +
> +       do {
> +               ret = peci_request_xfer(req);
> +               if (ret) {
> +                       dev_dbg(&controller->dev, "xfer error: %d\n", ret);
> +                       return ret;
> +               }
> +
> +               if (peci_request_status(req) != -EAGAIN)
> +                       return 0;
> +
> +               /* Set the retry bit to indicate a retry attempt */
> +               req->tx.buf[1] |= PECI_RETRY_BIT;
> +
> +               if (schedule_timeout_interruptible(wait_interval))
> +                       return -ERESTARTSYS;
> +
> +               wait_interval = min_t(long, wait_interval * 2, PECI_RETRY_INTERVAL_MAX);
> +       } while (time_before(jiffies, start + PECI_RETRY_TIMEOUT));
> +
> +       dev_dbg(&controller->dev, "request timed out\n");
> +
> +       return -ETIMEDOUT;
> +}
> +
>  /**
>   * peci_request_alloc() - allocate &struct peci_requests
>   * @device: PECI device to which request is going to be sent
> @@ -48,3 +175,90 @@ void peci_request_free(struct peci_request *req)
>         kfree(req);
>  }
>  EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
> +
> +struct peci_request *peci_get_dib(struct peci_device *device)
> +{
> +       struct peci_request *req;
> +       int ret;
> +
> +       req = peci_request_alloc(device, PECI_GET_DIB_WR_LEN, PECI_GET_DIB_RD_LEN);
> +       if (!req)
> +               return ERR_PTR(-ENOMEM);
> +
> +       req->tx.buf[0] = PECI_GET_DIB_CMD;
> +
> +       ret = peci_request_xfer(req);
> +       if (ret) {
> +               peci_request_free(req);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return req;
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_get_dib, PECI);
> +
> +static struct peci_request *
> +__pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
> +{
> +       struct peci_request *req;
> +       int ret;
> +
> +       req = peci_request_alloc(device, PECI_RDPKGCFG_WR_LEN, PECI_RDPKGCFG_RD_LEN_BASE + len);
> +       if (!req)
> +               return ERR_PTR(-ENOMEM);
> +
> +       req->tx.buf[0] = PECI_RDPKGCFG_CMD;
> +       req->tx.buf[1] = 0;
> +       req->tx.buf[2] = index;
> +       put_unaligned_le16(param, &req->tx.buf[3]);
> +
> +       ret = peci_request_xfer_retry(req);
> +       if (ret) {
> +               peci_request_free(req);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return req;
> +}
> +
> +u8 peci_request_data_readb(struct peci_request *req)
> +{
> +       return req->rx.buf[1];
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_request_data_readb, PECI);
> +
> +u16 peci_request_data_readw(struct peci_request *req)
> +{
> +       return get_unaligned_le16(&req->rx.buf[1]);
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_request_data_readw, PECI);
> +
> +u32 peci_request_data_readl(struct peci_request *req)
> +{
> +       return get_unaligned_le32(&req->rx.buf[1]);
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_request_data_readl, PECI);
> +
> +u64 peci_request_data_readq(struct peci_request *req)
> +{
> +       return get_unaligned_le64(&req->rx.buf[1]);
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_request_data_readq, PECI);
> +
> +u64 peci_request_data_dib(struct peci_request *req)
> +{
> +       return get_unaligned_le64(&req->rx.buf[0]);
> +}
> +EXPORT_SYMBOL_NS_GPL(peci_request_data_dib, PECI);
> +
> +#define __read_pkg_config(x, type) \
> +struct peci_request *peci_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param) \
> +{ \
> +       return __pkg_cfg_read(device, index, param, sizeof(type)); \
> +} \
> +EXPORT_SYMBOL_NS_GPL(peci_pkg_cfg_##x, PECI)
> +
> +__read_pkg_config(readb, u8);
> +__read_pkg_config(readw, u16);
> +__read_pkg_config(readl, u32);
> +__read_pkg_config(readq, u64);
> diff --git a/include/linux/peci.h b/include/linux/peci.h
> index 26e0a4e73b50..dcf1c53f4e40 100644
> --- a/include/linux/peci.h
> +++ b/include/linux/peci.h
> @@ -14,6 +14,14 @@
>   */
>  #define PECI_REQUEST_MAX_BUF_SIZE 32
>
> +#define PECI_PCS_PKG_ID                        0  /* Package Identifier Read */
> +#define  PECI_PKG_ID_CPU_ID            0x0000  /* CPUID Info */
> +#define  PECI_PKG_ID_PLATFORM_ID       0x0001  /* Platform ID */
> +#define  PECI_PKG_ID_DEVICE_ID         0x0002  /* Uncore Device ID */
> +#define  PECI_PKG_ID_MAX_THREAD_ID     0x0003  /* Max Thread ID */
> +#define  PECI_PKG_ID_MICROCODE_REV     0x0004  /* CPU Microcode Update Revision */
> +#define  PECI_PKG_ID_MCA_ERROR_LOG     0x0005  /* Machine Check Status */
> +
>  struct peci_controller;
>  struct peci_request;
>
> @@ -59,6 +67,11 @@ static inline struct peci_controller *to_peci_controller(void *d)
>   * struct peci_device - PECI device
>   * @dev: device object to register PECI device to the device model
>   * @controller: manages the bus segment hosting this PECI device
> + * @info: PECI device characteristics
> + * @info.family: device family
> + * @info.model: device model
> + * @info.peci_revision: PECI revision supported by the PECI device
> + * @info.socket_id: the socket ID represented by the PECI device
>   * @addr: address used on the PECI bus connected to the parent controller
>   *
>   * A peci_device identifies a single device (i.e. CPU) connected to a PECI bus.
> @@ -67,6 +80,12 @@ static inline struct peci_controller *to_peci_controller(void *d)
>   */
>  struct peci_device {
>         struct device dev;
> +       struct {
> +               u16 family;
> +               u8 model;
> +               u8 peci_revision;
> +               u8 socket_id;
> +       } info;
>         u8 addr;
>  };
>
> diff --git a/lib/Kconfig b/lib/Kconfig
> index e538d4d773bd..7f7972d357c2 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -718,4 +718,4 @@ config ASN1_ENCODER
>
>  config GENERIC_LIB_X86
>         bool
> -       depends on X86
> +       depends on X86 || PECI

This looks broken, what in the GENERIC_LIB_X86 implementation depends on peci?
