Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620C3F814F
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 05:52:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw87d1fCFz2yPP
	for <lists+openbmc@lfdr.de>; Thu, 26 Aug 2021 13:52:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=iAh988u8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=iAh988u8; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw1cw1pnxz2xs0
 for <openbmc@lists.ozlabs.org>; Thu, 26 Aug 2021 08:59:07 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id e15so488521plh.8
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jjpd+6Tkj8BgAWV6v+XCBx0rlbb+NUWeFyE7jkLpQ1k=;
 b=iAh988u8pEDhR1u1+NwvQuyLrnH1m2WLNKg8/J7jmqi87o50icpHKwaWVCiqODTY0P
 tb3Fjl2lTTItneH7R8xNYg3W2YPW6gSNEWTT5xbX+keJ8Ld7xfr7JJzAtCpAUrnaR7wL
 u+APYHoIUU3TdXYmUjnL7N0CsvF2Q1UOullJ0zPV8KiIW468cy0gPObegFFsmc94pvvi
 FOZ0MlYWDjr0PpROP6UIiwqBt3gQYhJq83HduPbWWo5jm/WLXCgM4JQ4yFlXypyziRKO
 7dd+lcVcZnQTajm02jMrK4ygLPx+LvALFNIXwni0kVJ6qJN8wpcdd5hCOEo97PUy6LR+
 bwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jjpd+6Tkj8BgAWV6v+XCBx0rlbb+NUWeFyE7jkLpQ1k=;
 b=qxNgkRjPshfY7GqczPkads/QF8aa9f2uyaxa1kaTWvqVN1HSBMZQncxXMyyIrNapo7
 Dc/fcuYci3sQKcHlSl4aaxhBnFRzpee4KID+/F8v+oOHt96PNyLQ9EVFtDCfo4BS9Zyh
 Sg00OELgJUy0CA5LUXJ2YC/5EguZ9SGmpjb+/TD/uLqvJqr8zbPLrROWePQ16m345LIx
 xc0/ZFgs5Kc39XRBphBtBzMihu7WF7lpkqc+eHU7e9hEbhbeEPEzDCJcv6saSaNhMuKr
 bexLL5i2cLNUjPovD1jVwI3RNDaPlumUt/vkCCzZL5elR74sqgqbDfAXEj+MXH4EsnTF
 DqEw==
X-Gm-Message-State: AOAM531/eUZewgRVI9PjbJAbnO/GexR6JVvmakA9kkoZacF/USN0/gKs
 +WJBGoyXRcir6zNNKuQertLciXsIb5Y+5gyLmjjk6A==
X-Google-Smtp-Source: ABdhPJx+NsBGX+c8+wggJKsFYh0kOCsfhHj0McL3arbWNJl4J7SNXCvWTZH3iT1Dl4y5DfRHyE86J/48TBUJkj3j1wI=
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr13271794pjk.13.1629932344184; 
 Wed, 25 Aug 2021 15:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
 <20210803113134.2262882-7-iwona.winiarska@intel.com>
In-Reply-To: <20210803113134.2262882-7-iwona.winiarska@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 25 Aug 2021 15:58:53 -0700
Message-ID: <CAPcyv4giVBjZWjXO2H+vYSR29Vapi6_FvMwO7nvts-JXmCHcOA@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] peci: Add core infrastructure
To: Iwona Winiarska <iwona.winiarska@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Aug 2021 13:52:25 +1000
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
 Jason M Bills <jason.m.bills@linux.intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
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

On Tue, Aug 3, 2021 at 4:35 AM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> Intel processors provide access for various services designed to support
> processor and DRAM thermal management, platform manageability and
> processor interface tuning and diagnostics.
> Those services are available via the Platform Environment Control
> Interface (PECI) that provides a communication channel between the
> processor and the Baseboard Management Controller (BMC) or other
> platform management device.
>
> This change introduces PECI subsystem by adding the initial core module
> and API for controller drivers.
>
> Co-developed-by: Jason M Bills <jason.m.bills@linux.intel.com>
> Signed-off-by: Jason M Bills <jason.m.bills@linux.intel.com>
> Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  MAINTAINERS             |   9 +++
>  drivers/Kconfig         |   3 +
>  drivers/Makefile        |   1 +
>  drivers/peci/Kconfig    |  15 ++++
>  drivers/peci/Makefile   |   5 ++
>  drivers/peci/core.c     | 155 ++++++++++++++++++++++++++++++++++++++++
>  drivers/peci/internal.h |  16 +++++
>  include/linux/peci.h    |  99 +++++++++++++++++++++++++
>  8 files changed, 303 insertions(+)
>  create mode 100644 drivers/peci/Kconfig
>  create mode 100644 drivers/peci/Makefile
>  create mode 100644 drivers/peci/core.c
>  create mode 100644 drivers/peci/internal.h
>  create mode 100644 include/linux/peci.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7cdab7229651..d411974aaa5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14503,6 +14503,15 @@ L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained
>  F:     drivers/platform/x86/peaq-wmi.c
>
> +PECI SUBSYSTEM
> +M:     Iwona Winiarska <iwona.winiarska@intel.com>
> +R:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> +L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:     Supported
> +F:     Documentation/devicetree/bindings/peci/
> +F:     drivers/peci/
> +F:     include/linux/peci.h
> +
>  PENSANDO ETHERNET DRIVERS
>  M:     Shannon Nelson <snelson@pensando.io>
>  M:     drivers@pensando.io
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 8bad63417a50..f472b3d972b3 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -236,4 +236,7 @@ source "drivers/interconnect/Kconfig"
>  source "drivers/counter/Kconfig"
>
>  source "drivers/most/Kconfig"
> +
> +source "drivers/peci/Kconfig"
> +
>  endmenu
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 27c018bdf4de..8d96f0c3dde5 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -189,3 +189,4 @@ obj-$(CONFIG_GNSS)          += gnss/
>  obj-$(CONFIG_INTERCONNECT)     += interconnect/
>  obj-$(CONFIG_COUNTER)          += counter/
>  obj-$(CONFIG_MOST)             += most/
> +obj-$(CONFIG_PECI)             += peci/
> diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
> new file mode 100644
> index 000000000000..71a4ad81225a
> --- /dev/null
> +++ b/drivers/peci/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +menuconfig PECI
> +       tristate "PECI support"
> +       help
> +         The Platform Environment Control Interface (PECI) is an interface
> +         that provides a communication channel to Intel processors and
> +         chipset components from external monitoring or control devices.
> +
> +         If you are building a Baseboard Management Controller (BMC) kernel
> +         for Intel platform say Y here and also to the specific driver for
> +         your adapter(s) below. If unsure say N.
> +
> +         This support is also available as a module. If so, the module
> +         will be called peci.
> diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
> new file mode 100644
> index 000000000000..e789a354e842
> --- /dev/null
> +++ b/drivers/peci/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +# Core functionality
> +peci-y := core.o
> +obj-$(CONFIG_PECI) += peci.o
> diff --git a/drivers/peci/core.c b/drivers/peci/core.c
> new file mode 100644
> index 000000000000..7b3938af0396
> --- /dev/null
> +++ b/drivers/peci/core.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2018-2021 Intel Corporation
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

This looks like overkill for only one print statement in this module,
especially when the dev_ print helpers offer more detail.

> +
> +#include <linux/bug.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/idr.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/peci.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +#include "internal.h"
> +
> +static DEFINE_IDA(peci_controller_ida);
> +
> +static void peci_controller_dev_release(struct device *dev)
> +{
> +       struct peci_controller *controller = to_peci_controller(dev);
> +
> +       pm_runtime_disable(&controller->dev);

This seems late to be disabling power management, the device is about
to be freed. Keep in mind the lifetime of the this object can be
artificially prolonged. I expect this to be done when the device is
unregistered from the bus.

> +
> +       mutex_destroy(&controller->bus_lock);
> +       ida_free(&peci_controller_ida, controller->id);
> +       fwnode_handle_put(controller->dev.fwnode);

Shouldn't the get / put of this handle reference be bound to specific
accesses not held for the entire lifetime of the object? At a minimum
it seems to be a reference that can taken at registration and dropped
at unregistration.

> +       kfree(controller);
> +}
> +
> +struct device_type peci_controller_type = {
> +       .release        = peci_controller_dev_release,
> +};
> +
> +static struct peci_controller *peci_controller_alloc(struct device *dev,
> +                                                    struct peci_controller_ops *ops)
> +{
> +       struct fwnode_handle *node = fwnode_handle_get(dev_fwnode(dev));
> +       struct peci_controller *controller;
> +       int ret;
> +
> +       if (!ops->xfer)
> +               return ERR_PTR(-EINVAL);
> +
> +       controller = kzalloc(sizeof(*controller), GFP_KERNEL);
> +       if (!controller)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ret = ida_alloc_max(&peci_controller_ida, U8_MAX, GFP_KERNEL);
> +       if (ret < 0)
> +               goto err;
> +       controller->id = ret;
> +
> +       controller->ops = ops;
> +
> +       controller->dev.parent = dev;
> +       controller->dev.bus = &peci_bus_type;
> +       controller->dev.type = &peci_controller_type;
> +       controller->dev.fwnode = node;
> +       controller->dev.of_node = to_of_node(node);
> +
> +       device_initialize(&controller->dev);
> +
> +       mutex_init(&controller->bus_lock);
> +
> +       pm_runtime_no_callbacks(&controller->dev);
> +       pm_suspend_ignore_children(&controller->dev, true);
> +       pm_runtime_enable(&controller->dev);

Per above, are you sure unregistered devices need pm_runtime enabled?

Rest looks ok to me.
