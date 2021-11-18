Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2317E455B6B
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 13:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvzQs0sPsz307C
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 23:20:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JsjSD4st;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JsjSD4st; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvzQQ0zJBz2yYx;
 Thu, 18 Nov 2021 23:20:12 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso10636434otj.1; 
 Thu, 18 Nov 2021 04:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MHUP1IF9mQUQk2pqBekJe23lvaLeRmX1U4/ce/yDQHk=;
 b=JsjSD4stjFp07N+v4VptJlQOUgWByCidc2xxk/G+Lf8siej+3FsT007fXqgxFW5hPT
 6zFC0XWwzpu7n7iTCPNa4UsyVhMVKWdPdByJQphqlQg4Rk9HPpg9RE7gI3sKpN+BN9Qw
 r62y414Bf+29wA2+vFCqs50We/IJgc8l7s+Ed2UtvWljNP5SWapvPYIJ3wVMTBkKKAXU
 xnL69+VZiNdVnOSAH3CaQ9Jo2rxV1NfMgKSlODaCyieEUWBdot/lnI4aXomU5e4f1EvT
 JqzlrMXH8RWD7G8z+u8vrt8T9pO2WdArOodtlLyMFsbhT92UVNCAyZnRzetfhY1O+owN
 P+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MHUP1IF9mQUQk2pqBekJe23lvaLeRmX1U4/ce/yDQHk=;
 b=vgwjyckofTtMwYQ8IcbHRAsE2L14+6WVXTYsDteQPrs6jxzG88EQk+lYJ4rbdD9aEj
 b2gFsRcDkENq+ktjkKoGMXW8Fnk/W7t7fzOUPYbhetuxOHFyVAE4ksg1Ow3FFFeJU9Ke
 fviLeRbmQzgDOHqrMg6hjvX14Dmdy/S3Ai+Jlqryn6KuPn2NJ78ij/qRvBi26539Q+no
 PbTQ92fT1FbCYKVks1DcJAyO/0X2Tw3UkSTXC4UOvy9kP1nEkBzeqwXe1AggGllEVCJs
 HMqh64W8HYiFYO1SUJVwHLZE5TdJOA3CbagGCr/3lOiTt9G411wAulyMTSaZQG0AEq0F
 LzLg==
X-Gm-Message-State: AOAM533GVoXdH9bJgapATErKw66ph6efVJ3pm+4QfTxLwhB0idNAxRcp
 Opw7XSGNyB/Mr/zVWlhdWaTGBBaEpsXYP0nMtwY=
X-Google-Smtp-Source: ABdhPJzQmVcIyjJZYx4UovgeU/XzqafuV3zzHkuH5tetcjD2AsE/jBlvMuIc/LaJC5d2H2ToK2ARso4p7YjSXOET6rY=
X-Received: by 2002:a05:6830:25c4:: with SMTP id
 d4mr20902337otu.138.1637238008864; 
 Thu, 18 Nov 2021 04:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20211115182552.3830849-1-iwona.winiarska@intel.com>
In-Reply-To: <20211115182552.3830849-1-iwona.winiarska@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 18 Nov 2021 14:19:58 +0200
Message-ID: <CAP6Zq1iOfQufgqu9jyVdA47TeCmDCa6Ri286v2HUCt5xeV9=wg@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] Introduce PECI subsystem
To: Iwona Winiarska <iwona.winiarska@intel.com>
Content-Type: multipart/alternative; boundary="000000000000ee652605d10f2d4b"
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ee652605d10f2d4b
Content-Type: text/plain; charset="UTF-8"

Hi Iwona,

My name is Tomer I working as a SW engineer in Nuvoton BMC project.

First, thanks for upstreaming the PECI driver!

Nuvoton (NPCM) PECI driver was in the PECI patchset that has been
handheld by Jae.
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20191211194624.2872-10-jae.hyun.yoo@linux.intel.com/

Could you add Nuvoton (NPCM) PECI driver to your patch set next time you
will send upstream patches to Linux vanilla?
If you agree, we will check your patchset in Nuvoton systems in a few days
and send you NPCM OECI driver and documentation.

Thanks,

Tomer

On Mon, 15 Nov 2021 at 20:28, Iwona Winiarska <iwona.winiarska@intel.com>
wrote:

> Hi,
>
> This is a third round of patches introducing PECI subsystem.
> Sorry for the delay between v2 and v3.
>
> The Platform Environment Control Interface (PECI) is a communication
> interface between Intel processors and management controllers (e.g.
> Baseboard Management Controller, BMC).
>
> This series adds a PECI subsystem and introduces drivers which run in
> the Linux instance on the management controller (not the main Intel
> processor) and is intended to be used by the OpenBMC [1], a Linux
> distribution for BMC devices.
> The information exposed over PECI (like processor and DIMM
> temperature) refers to the Intel processor and can be consumed by
> daemons running on the BMC to, for example, display the processor
> temperature in its web interface.
>
> The PECI bus is collection of code that provides interface support
> between PECI devices (that actually represent processors) and PECI
> controllers (such as the "peci-aspeed" controller) that allow to
> access physical PECI interface. PECI devices are bound to PECI
> drivers that provides access to PECI services. This series introduces
> a generic "peci-cpu" driver that exposes hardware monitoring "cputemp"
> and "dimmtemp" using the auxiliary bus.
>
> Exposing "raw" PECI to userspace, either to write userspace drivers or
> for debug/testing purpose was left out of this series to encourage
> writing kernel drivers instead, but may be pursued in the future.
>
> Introducing PECI to upstream Linux was already attempted before [2].
> Since it's been over a year since last revision, and the series
> changed quite a bit in the meantime, I've decided to start from v1.
>
> I would also like to give credit to everyone who helped me with
> different aspects of preliminary review:
> - Pierre-Louis Bossart,
> - Tony Luck,
> - Andy Shevchenko,
> - Dave Hansen.
>
> [1] https://github.com/openbmc/openbmc
> [2]
> https://lore.kernel.org/openbmc/20191211194624.2872-1-jae.hyun.yoo@linux.intel.com/
>
> Changes v2 -> v3:
>
> * Dropped x86/cpu patches (Boris)
> * Dropped pr_fmt() for PECI module (Dan)
> * Fixed releasing peci controller device flow (Dan)
> * Improved peci-aspeed commit-msg and Kconfig help (Dan)
> * Fixed aspeed_peci_xfer() to use the proper spin_lock function (Dan)
> * Wrapped print_hex_dump_bytes() in CONFIG_DYNAMIC_DEBUG (Dan)
> * Removed debug status logs from aspeed_peci_irq_handler() (Dan)
> * Renamed functions using devres to start with "devm" (Dan)
> * Changed request to be allocated on stack in peci_detect (Dan)
> * Removed redundant WARN_ON on invalid PECI addr (Dan)
> * Changed peci_device_create() to use device_initialize() + device_add()
> pattern (Dan)
> * Fixed peci_device_destroy() to use kill_device() avoiding double-free
> (Dan)
> * Renamed functions that perform xfer using "peci_xfer_*" prefix (Dan)
> * Renamed peci_request_data_dib(temp) -> peci_request_dib(temp)_read (Dan)
> * Fixed thermal margin readings for older Intel processors (Zev)
> * Misc hwmon simplifications (Guenter)
> * Used BIT_PER_TYPE to verify macro value constrains (Guenter)
> * Improved WARN_ON message to print chan_rank_max and idx_dimm_max
> (Guenter)
> * Improved dimmtemp to not reattempt probe if no dimms are populated
>
> Changes v1 -> v2:
>
> Biggest changes when it comes to diffstat are locking in HWMON
> (I decided to clean things up a bit while adding it), switching to
> devres usage in more places and exposing sysfs interface in separate patch.
>
> * Moved extending X86 ARCHITECTURE MAINTAINERS earlier in series (Dan)
> * Removed "default n" for GENERIC_LIB_X86 (Dan)
> * Added vendor prefix for peci-aspeed specific properties (Rob)
> * Refactored PECI to use devres consistently (Dan)
> * Added missing sysfs documentation and excluded adding peci-sysfs to
>   separate patch (Dan)
> * Used module_init() instead of subsys_init() for peci module
> initialization (Dan)
> * Removed redundant struct peci_device member (Dan)
> * Improved PECI Kconfig help (Randy/Dan)
> * Fixed/removed log messages (Dan, Guenter)
> * Refactored peci-cputemp and peci-dimmtemp and added missing locks
> (Guenter)
> * Removed unused dev_set_drvdata() in peci-cputemp and peci-dimmtemp
> (Guenter)
> * Fixed used types, names, fixed broken and added additional comments
>   to peci-hwmon (Guenter, Zev)
> * Refactored peci-dimmtemp to not return -ETIMEDOUT (Guenter)
> * Added sanity check for min_peci_revision in peci-hwmon drivers (Zev)
> * Added assert for DIMM_NUMS_MAX and additional warning in peci-dimmtemp
> (Zev)
> * Fixed macro names in peci-aspeed (Zev)
> * Refactored peci-aspeed sanitizing properties to a single helper function
> (Zev)
> * Fixed peci_cpu_device_ids definition for Broadwell Xeon D (David)
> * Refactor peci_request to use a single allocation (Zev)
> * Used min_t() to improve code readability (Zev)
> * Added macro for PECI_RDENDPTCFG_MMIO_WR_LEN_BASE and fixed adev type
>   array name to more descriptive (Zev)
> * Fixed peci-hwmon commit-msg and documentation (Zev)
>
> Thanks
> -Iwona
>
> Iwona Winiarska (11):
>   dt-bindings: Add generic bindings for PECI
>   dt-bindings: Add bindings for peci-aspeed
>   ARM: dts: aspeed: Add PECI controller nodes
>   peci: Add core infrastructure
>   peci: Add device detection
>   peci: Add sysfs interface for PECI bus
>   peci: Add support for PECI device drivers
>   peci: Add peci-cpu driver
>   hwmon: peci: Add cputemp driver
>   hwmon: peci: Add dimmtemp driver
>   docs: Add PECI documentation
>
> Jae Hyun Yoo (2):
>   peci: Add peci-aspeed controller driver
>   docs: hwmon: Document PECI drivers
>
>  Documentation/ABI/testing/sysfs-bus-peci      |  16 +
>  .../devicetree/bindings/peci/peci-aspeed.yaml | 109 +++
>  .../bindings/peci/peci-controller.yaml        |  33 +
>  Documentation/hwmon/index.rst                 |   2 +
>  Documentation/hwmon/peci-cputemp.rst          |  90 +++
>  Documentation/hwmon/peci-dimmtemp.rst         |  57 ++
>  Documentation/index.rst                       |   1 +
>  Documentation/peci/index.rst                  |  16 +
>  Documentation/peci/peci.rst                   |  51 ++
>  MAINTAINERS                                   |  29 +
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  14 +
>  arch/arm/boot/dts/aspeed-g5.dtsi              |  14 +
>  arch/arm/boot/dts/aspeed-g6.dtsi              |  14 +
>  drivers/Kconfig                               |   3 +
>  drivers/Makefile                              |   1 +
>  drivers/hwmon/Kconfig                         |   2 +
>  drivers/hwmon/Makefile                        |   1 +
>  drivers/hwmon/peci/Kconfig                    |  31 +
>  drivers/hwmon/peci/Makefile                   |   7 +
>  drivers/hwmon/peci/common.h                   |  58 ++
>  drivers/hwmon/peci/cputemp.c                  | 592 ++++++++++++++++
>  drivers/hwmon/peci/dimmtemp.c                 | 630 ++++++++++++++++++
>  drivers/peci/Kconfig                          |  36 +
>  drivers/peci/Makefile                         |  10 +
>  drivers/peci/controller/Kconfig               |  17 +
>  drivers/peci/controller/Makefile              |   3 +
>  drivers/peci/controller/peci-aspeed.c         | 429 ++++++++++++
>  drivers/peci/core.c                           | 236 +++++++
>  drivers/peci/cpu.c                            | 343 ++++++++++
>  drivers/peci/device.c                         | 249 +++++++
>  drivers/peci/internal.h                       | 136 ++++
>  drivers/peci/request.c                        | 482 ++++++++++++++
>  drivers/peci/sysfs.c                          |  82 +++
>  include/linux/peci-cpu.h                      |  40 ++
>  include/linux/peci.h                          | 110 +++
>  35 files changed, 3944 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>  create mode 100644
> Documentation/devicetree/bindings/peci/peci-controller.yaml
>  create mode 100644 Documentation/hwmon/peci-cputemp.rst
>  create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
>  create mode 100644 Documentation/peci/index.rst
>  create mode 100644 Documentation/peci/peci.rst
>  create mode 100644 drivers/hwmon/peci/Kconfig
>  create mode 100644 drivers/hwmon/peci/Makefile
>  create mode 100644 drivers/hwmon/peci/common.h
>  create mode 100644 drivers/hwmon/peci/cputemp.c
>  create mode 100644 drivers/hwmon/peci/dimmtemp.c
>  create mode 100644 drivers/peci/Kconfig
>  create mode 100644 drivers/peci/Makefile
>  create mode 100644 drivers/peci/controller/Kconfig
>  create mode 100644 drivers/peci/controller/Makefile
>  create mode 100644 drivers/peci/controller/peci-aspeed.c
>  create mode 100644 drivers/peci/core.c
>  create mode 100644 drivers/peci/cpu.c
>  create mode 100644 drivers/peci/device.c
>  create mode 100644 drivers/peci/internal.h
>  create mode 100644 drivers/peci/request.c
>  create mode 100644 drivers/peci/sysfs.c
>  create mode 100644 include/linux/peci-cpu.h
>  create mode 100644 include/linux/peci.h
>
> --
> 2.31.1
>
>

--000000000000ee652605d10f2d4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Iwona,<div><br></div><div><div>My name is Tomer I =
working as a SW engineer in Nuvoton BMC project.</div><div><br></div><div>F=
irst, thanks for=C2=A0upstreaming the PECI driver!</div><div><br></div><div=
>Nuvoton (NPCM) PECI driver was=C2=A0in the PECI patchset that has been han=
dheld=C2=A0by Jae.</div><div><a href=3D"https://patchwork.kernel.org/projec=
t/linux-arm-kernel/patch/20191211194624.2872-10-jae.hyun.yoo@linux.intel.co=
m/">https://patchwork.kernel.org/project/linux-arm-kernel/patch/20191211194=
624.2872-10-jae.hyun.yoo@linux.intel.com/</a><br></div><div><br></div><div>=
<div>Could you add Nuvoton (NPCM) PECI driver=C2=A0to your patch set next t=
ime you will send upstream patches to Linux vanilla?</div><div>If you agree=
, we will check your patchset in Nuvoton systems in a few days and send you=
 NPCM OECI driver and documentation.<br></div></div><div><br></div><div>Tha=
nks,<br></div><div><br></div><div>Tomer</div></div><div></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 15 No=
v 2021 at 20:28, Iwona Winiarska &lt;<a href=3D"mailto:iwona.winiarska@inte=
l.com">iwona.winiarska@intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi,<br>
<br>
This is a third round of patches introducing PECI subsystem.<br>
Sorry for the delay between v2 and v3.<br>
<br>
The Platform Environment Control Interface (PECI) is a communication<br>
interface between Intel processors and management controllers (e.g.<br>
Baseboard Management Controller, BMC).<br>
<br>
This series adds a PECI subsystem and introduces drivers which run in<br>
the Linux instance on the management controller (not the main Intel<br>
processor) and is intended to be used by the OpenBMC [1], a Linux<br>
distribution for BMC devices.<br>
The information exposed over PECI (like processor and DIMM<br>
temperature) refers to the Intel processor and can be consumed by<br>
daemons running on the BMC to, for example, display the processor<br>
temperature in its web interface.<br>
<br>
The PECI bus is collection of code that provides interface support<br>
between PECI devices (that actually represent processors) and PECI<br>
controllers (such as the &quot;peci-aspeed&quot; controller) that allow to<=
br>
access physical PECI interface. PECI devices are bound to PECI<br>
drivers that provides access to PECI services. This series introduces<br>
a generic &quot;peci-cpu&quot; driver that exposes hardware monitoring &quo=
t;cputemp&quot;<br>
and &quot;dimmtemp&quot; using the auxiliary bus.<br>
<br>
Exposing &quot;raw&quot; PECI to userspace, either to write userspace drive=
rs or<br>
for debug/testing purpose was left out of this series to encourage<br>
writing kernel drivers instead, but may be pursued in the future.<br>
<br>
Introducing PECI to upstream Linux was already attempted before [2].<br>
Since it&#39;s been over a year since last revision, and the series<br>
changed quite a bit in the meantime, I&#39;ve decided to start from v1.<br>
<br>
I would also like to give credit to everyone who helped me with<br>
different aspects of preliminary review:<br>
- Pierre-Louis Bossart,<br>
- Tony Luck, <br>
- Andy Shevchenko,<br>
- Dave Hansen.<br>
<br>
[1] <a href=3D"https://github.com/openbmc/openbmc" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/openbmc/openbmc</a><br>
[2] <a href=3D"https://lore.kernel.org/openbmc/20191211194624.2872-1-jae.hy=
un.yoo@linux.intel.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/openbmc/20191211194624.2872-1-jae.hyun.yoo@linux.intel.com/</a><=
br>
<br>
Changes v2 -&gt; v3:<br>
<br>
* Dropped x86/cpu patches (Boris)<br>
* Dropped pr_fmt() for PECI module (Dan)<br>
* Fixed releasing peci controller device flow (Dan) <br>
* Improved peci-aspeed commit-msg and Kconfig help (Dan)<br>
* Fixed aspeed_peci_xfer() to use the proper spin_lock function (Dan) <br>
* Wrapped print_hex_dump_bytes() in CONFIG_DYNAMIC_DEBUG (Dan)<br>
* Removed debug status logs from aspeed_peci_irq_handler() (Dan)<br>
* Renamed functions using devres to start with &quot;devm&quot; (Dan)<br>
* Changed request to be allocated on stack in peci_detect (Dan)<br>
* Removed redundant WARN_ON on invalid PECI addr (Dan)<br>
* Changed peci_device_create() to use device_initialize() + device_add() pa=
ttern (Dan)<br>
* Fixed peci_device_destroy() to use kill_device() avoiding double-free (Da=
n)<br>
* Renamed functions that perform xfer using &quot;peci_xfer_*&quot; prefix =
(Dan) <br>
* Renamed peci_request_data_dib(temp) -&gt; peci_request_dib(temp)_read (Da=
n)<br>
* Fixed thermal margin readings for older Intel processors (Zev) <br>
* Misc hwmon simplifications (Guenter)<br>
* Used BIT_PER_TYPE to verify macro value constrains (Guenter)<br>
* Improved WARN_ON message to print chan_rank_max and idx_dimm_max (Guenter=
)<br>
* Improved dimmtemp to not reattempt probe if no dimms are populated<br>
<br>
Changes v1 -&gt; v2:<br>
<br>
Biggest changes when it comes to diffstat are locking in HWMON<br>
(I decided to clean things up a bit while adding it), switching to<br>
devres usage in more places and exposing sysfs interface in separate patch.=
<br>
<br>
* Moved extending X86 ARCHITECTURE MAINTAINERS earlier in series (Dan)<br>
* Removed &quot;default n&quot; for GENERIC_LIB_X86 (Dan)<br>
* Added vendor prefix for peci-aspeed specific properties (Rob)<br>
* Refactored PECI to use devres consistently (Dan)<br>
* Added missing sysfs documentation and excluded adding peci-sysfs to<br>
=C2=A0 separate patch (Dan)<br>
* Used module_init() instead of subsys_init() for peci module initializatio=
n (Dan)<br>
* Removed redundant struct peci_device member (Dan)<br>
* Improved PECI Kconfig help (Randy/Dan)<br>
* Fixed/removed log messages (Dan, Guenter)<br>
* Refactored peci-cputemp and peci-dimmtemp and added missing locks (Guente=
r)<br>
* Removed unused dev_set_drvdata() in peci-cputemp and peci-dimmtemp (Guent=
er)<br>
* Fixed used types, names, fixed broken and added additional comments<br>
=C2=A0 to peci-hwmon (Guenter, Zev)<br>
* Refactored peci-dimmtemp to not return -ETIMEDOUT (Guenter)<br>
* Added sanity check for min_peci_revision in peci-hwmon drivers (Zev)<br>
* Added assert for DIMM_NUMS_MAX and additional warning in peci-dimmtemp (Z=
ev)<br>
* Fixed macro names in peci-aspeed (Zev)<br>
* Refactored peci-aspeed sanitizing properties to a single helper function =
(Zev)<br>
* Fixed peci_cpu_device_ids definition for Broadwell Xeon D (David)<br>
* Refactor peci_request to use a single allocation (Zev)<br>
* Used min_t() to improve code readability (Zev)<br>
* Added macro for PECI_RDENDPTCFG_MMIO_WR_LEN_BASE and fixed adev type<br>
=C2=A0 array name to more descriptive (Zev)<br>
* Fixed peci-hwmon commit-msg and documentation (Zev)<br>
<br>
Thanks<br>
-Iwona<br>
<br>
Iwona Winiarska (11):<br>
=C2=A0 dt-bindings: Add generic bindings for PECI<br>
=C2=A0 dt-bindings: Add bindings for peci-aspeed<br>
=C2=A0 ARM: dts: aspeed: Add PECI controller nodes<br>
=C2=A0 peci: Add core infrastructure<br>
=C2=A0 peci: Add device detection<br>
=C2=A0 peci: Add sysfs interface for PECI bus<br>
=C2=A0 peci: Add support for PECI device drivers<br>
=C2=A0 peci: Add peci-cpu driver<br>
=C2=A0 hwmon: peci: Add cputemp driver<br>
=C2=A0 hwmon: peci: Add dimmtemp driver<br>
=C2=A0 docs: Add PECI documentation<br>
<br>
Jae Hyun Yoo (2):<br>
=C2=A0 peci: Add peci-aspeed controller driver<br>
=C2=A0 docs: hwmon: Document PECI drivers<br>
<br>
=C2=A0Documentation/ABI/testing/sysfs-bus-peci=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
16 +<br>
=C2=A0.../devicetree/bindings/peci/peci-aspeed.yaml | 109 +++<br>
=C2=A0.../bindings/peci/peci-controller.yaml=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 33 +<br>
=C2=A0Documentation/hwmon/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0Documentation/hwmon/peci-cputemp.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 90 +++<br>
=C2=A0Documentation/hwmon/peci-dimmtemp.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 57 ++<br>
=C2=A0Documentation/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0Documentation/peci/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +<br>
=C2=A0Documentation/peci/peci.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 51 ++<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 29 +<br>
=C2=A0arch/arm/boot/dts/aspeed-g4.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +<br>
=C2=A0arch/arm/boot/dts/aspeed-g5.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +<br>
=C2=A0arch/arm/boot/dts/aspeed-g6.dtsi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 14 +<br>
=C2=A0drivers/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 =
+<br>
=C2=A0drivers/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/hwmon/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0drivers/hwmon/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/hwmon/peci/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 +<br>
=C2=A0drivers/hwmon/peci/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +<br>
=C2=A0drivers/hwmon/peci/common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 58 ++<br>
=C2=A0drivers/hwmon/peci/cputemp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 592 ++++++++++++++++<br>
=C2=A0drivers/hwmon/peci/dimmtemp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 630 ++++++++++++++++++<br>
=C2=A0drivers/peci/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 +<br>
=C2=A0drivers/peci/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +<br>
=C2=A0drivers/peci/controller/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 17 +<br>
=C2=A0drivers/peci/controller/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0drivers/peci/controller/peci-aspeed.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 429 ++++++++++++<br>
=C2=A0drivers/peci/core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 236 +++++++<br>
=C2=A0drivers/peci/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 343 ++++++++++<br>
=C2=A0drivers/peci/device.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 249 +++++++<br>
=C2=A0drivers/peci/internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 136 ++++<br>
=C2=A0drivers/peci/request.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 482 ++++++++++++++<br>
=C2=A0drivers/peci/sysfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 82 +++<br>
=C2=A0include/linux/peci-cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 ++<br>
=C2=A0include/linux/peci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 110 +++<br>
=C2=A035 files changed, 3944 insertions(+)<br>
=C2=A0create mode 100644 Documentation/ABI/testing/sysfs-bus-peci<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed=
.yaml<br>
=C2=A0create mode 100644 Documentation/devicetree/bindings/peci/peci-contro=
ller.yaml<br>
=C2=A0create mode 100644 Documentation/hwmon/peci-cputemp.rst<br>
=C2=A0create mode 100644 Documentation/hwmon/peci-dimmtemp.rst<br>
=C2=A0create mode 100644 Documentation/peci/index.rst<br>
=C2=A0create mode 100644 Documentation/peci/peci.rst<br>
=C2=A0create mode 100644 drivers/hwmon/peci/Kconfig<br>
=C2=A0create mode 100644 drivers/hwmon/peci/Makefile<br>
=C2=A0create mode 100644 drivers/hwmon/peci/common.h<br>
=C2=A0create mode 100644 drivers/hwmon/peci/cputemp.c<br>
=C2=A0create mode 100644 drivers/hwmon/peci/dimmtemp.c<br>
=C2=A0create mode 100644 drivers/peci/Kconfig<br>
=C2=A0create mode 100644 drivers/peci/Makefile<br>
=C2=A0create mode 100644 drivers/peci/controller/Kconfig<br>
=C2=A0create mode 100644 drivers/peci/controller/Makefile<br>
=C2=A0create mode 100644 drivers/peci/controller/peci-aspeed.c<br>
=C2=A0create mode 100644 drivers/peci/core.c<br>
=C2=A0create mode 100644 drivers/peci/cpu.c<br>
=C2=A0create mode 100644 drivers/peci/device.c<br>
=C2=A0create mode 100644 drivers/peci/internal.h<br>
=C2=A0create mode 100644 drivers/peci/request.c<br>
=C2=A0create mode 100644 drivers/peci/sysfs.c<br>
=C2=A0create mode 100644 include/linux/peci-cpu.h<br>
=C2=A0create mode 100644 include/linux/peci.h<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000ee652605d10f2d4b--
