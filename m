Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C8A4743E5
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 14:52:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD0FK40qcz301k
	for <lists+openbmc@lfdr.de>; Wed, 15 Dec 2021 00:52:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TpGeemJs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TpGeemJs; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD0Ds525Rz2yb5;
 Wed, 15 Dec 2021 00:52:27 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id v16so1156306pjn.1;
 Tue, 14 Dec 2021 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pqvQ9k3a5n1rbpljmmlOMcKT00B/d3780lkZSjiKmGg=;
 b=TpGeemJs/WkWt+muDLQwXLAtyHcWu2aRXxGcYitHRH2w3ZrHy2j2OLoda68T4pn5BB
 wh7tL3tYHuOEqk/xZJxr2GiAlVoIMN2OkPOM3VIOE9dEsWfNM7StkiXbPwX2KnCMEkNk
 YsfYgwaVzDPwnBomSdEdF3IrIvgkapIOoSGtv9kv5Wt63Ga05r4nhW04cg97MJJ9Gqxw
 Mq0RypL5Cedyfwux+f8ezXTSmOJu1vnYVMRPcPxK51BGkER8/s6mzOch1nwbsba2NS9O
 l1TLXcYZls9kxwkQM+se4ZViiBBhU59HTAZ653Q8nXocID2/QS/9fT+xaCnl3lwUA3Lm
 PKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pqvQ9k3a5n1rbpljmmlOMcKT00B/d3780lkZSjiKmGg=;
 b=RWHZFHMW0NYnzqDuRTrN3laUlzCqckNOZ0prWl4qN21QGhRJOXrv7MQjZwhRC+Msvy
 KtiZf2dChV7bYFNVhvP5MGjkIpHhHy02ervMgsC7xY09i51haV5qOlcaztAQ/GEUATBj
 6+N7eMeicFIL7ycCOezeknKuxI7DL1kws+jaeO7FUGUY8M4URbzkZEhsUHeHe7Vw9CyW
 imX+QQrGMpp+795El1H7sroVM8Lj9evC7xSzziPYi+DSJywcNvNnRNDEIwon3i+QQd/6
 TJRtswiEo7J4X6vazulv8Z+D23K4dbTbrJZrcxxjzrFBU5UhE+oONCVw7C5K/nZDnEyj
 cCJQ==
X-Gm-Message-State: AOAM530ng5dkpg2uW/9dFDLOQxGBUWxWI222LTuZ4m0f/cVrUEUKGFWC
 Tmgz7F4uA0OIE78xVDglwhzRFQNcz64nCSp878M=
X-Google-Smtp-Source: ABdhPJxnVhvU9uto24UwKeItlvW4luu2yCAiUHxADV6eogv0A17hvSuK7cXtWImci/GWVGJIgnHruXyVK98hPH460dE=
X-Received: by 2002:a17:902:7c02:b0:143:9d6a:8e42 with SMTP id
 x2-20020a1709027c0200b001439d6a8e42mr6254086pll.80.1639489945185; Tue, 14 Dec
 2021 05:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
In-Reply-To: <20211123140706.2945700-1-iwona.winiarska@intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 14 Dec 2021 15:52:14 +0200
Message-ID: <CAP6Zq1jnbQ8k9VEyf9WgVq5DRrEzf5V6kaYP30S7g9BV9jKtaQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] Introduce PECI subsystem
To: Iwona Winiarska <iwona.winiarska@intel.com>
Content-Type: multipart/mixed; boundary="000000000000cbd20505d31b7fcd"
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
 Jonathan Corbet <corbet@lwn.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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

--000000000000cbd20505d31b7fcd
Content-Type: multipart/alternative; boundary="000000000000cbd20305d31b7fcb"

--000000000000cbd20305d31b7fcb
Content-Type: text/plain; charset="UTF-8"

Hi Iwona,

Attach NPCM PECI driver support.
The PECI driver built-in kernel 5.16-rc and tested on NPCM750 and NPCM845
BMC SoC's

It will be great if you can add it to the PECI patchset.

Thanks,

Tomer


On Tue, 23 Nov 2021 at 16:09, Iwona Winiarska <iwona.winiarska@intel.com>
wrote:

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
> Changes v3 -> v4:
> * Fixed an issue where peci doesn't work after host shutdown (Zev)
> * Replaced kill_device() with peci_device_del_lock (Greg)
> * Fixed dts_valid() parameter type (Guenter)
> * Removed Jae from MAINTAINERS file (Jae)
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
>  MAINTAINERS                                   |  26 +
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
>  drivers/peci/device.c                         | 252 +++++++
>  drivers/peci/internal.h                       | 136 ++++
>  drivers/peci/request.c                        | 482 ++++++++++++++
>  drivers/peci/sysfs.c                          |  82 +++
>  include/linux/peci-cpu.h                      |  40 ++
>  include/linux/peci.h                          | 112 ++++
>  35 files changed, 3946 insertions(+)
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

--000000000000cbd20305d31b7fcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Iwona,<div><br></div><div>Attach NPCM PECI driver =
support.</div><div>The PECI driver built-in kernel 5.16-rc and tested on NP=
CM750 and NPCM845 BMC SoC&#39;s</div><div><br></div><div>It will be great i=
f you can add it to the PECI patchset.</div><div><br></div><div>Thanks,</di=
v><div><br></div><div>Tomer</div><div>=C2=A0</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 23 Nov 2021 at 16=
:09, Iwona Winiarska &lt;<a href=3D"mailto:iwona.winiarska@intel.com">iwona=
.winiarska@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">The Platform Environment Control Interface (PECI) is a =
communication<br>
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
Changes v3 -&gt; v4:<br>
* Fixed an issue where peci doesn&#39;t work after host shutdown (Zev)<br>
* Replaced kill_device() with peci_device_del_lock (Greg)<br>
* Fixed dts_valid() parameter type (Guenter)<br>
* Removed Jae from MAINTAINERS file (Jae)<br>
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
=A0 26 +<br>
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
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 252 +++++++<br>
=C2=A0drivers/peci/internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 136 ++++<br>
=C2=A0drivers/peci/request.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 482 ++++++++++++++<br>
=C2=A0drivers/peci/sysfs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 82 +++<br>
=C2=A0include/linux/peci-cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 40 ++<br>
=C2=A0include/linux/peci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 112 ++++<br>
=C2=A035 files changed, 3946 insertions(+)<br>
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

--000000000000cbd20305d31b7fcb--

--000000000000cbd20505d31b7fcd
Content-Type: application/octet-stream; 
	name="0001-dt-bindings-Add-bindings-for-peci-npcm.patch"
Content-Disposition: attachment; 
	filename="0001-dt-bindings-Add-bindings-for-peci-npcm.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kx65vxxy0>
X-Attachment-Id: f_kx65vxxy0

RnJvbSAyY2M0ZjkzOTU2NjA2ODJhYmYxNTdkNDQ0MGY2NGQ5ZDU4YWZjOWFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+CkRh
dGU6IFR1ZSwgMTQgRGVjIDIwMjEgMTQ6MzE6MjIgKzAyMDAKU3ViamVjdDogW1BBVENIIDEvMl0g
ZHQtYmluZGluZ3M6IEFkZCBiaW5kaW5ncyBmb3IgcGVjaS1ucGNtCgpBZGQgZGV2aWNlIHRyZWUg
YmluZGluZ3MgZm9yIHRoZSBwZWNpLW5wY20gY29udHJvbGxlciBkcml2ZXIuCgpTaWduZWQtb2Zm
LWJ5OiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IGtm
dGluZyA8d2FycDV0d0BnbWFpbC5jb20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGVj
aS9wZWNpLW5wY20ueWFtbCAgIHwgOTAgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDkwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGVjaS9wZWNpLW5wY20ueWFtbAoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZWNpL3BlY2ktbnBjbS55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlY2kvcGVjaS1ucGNtLnlhbWwKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43ZmQzMWE0ODE5MjkKLS0tIC9kZXYvbnVs
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVjaS9wZWNpLW5wY20u
eWFtbApAQCAtMCwwICsxLDkwIEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3BlY2kvcGVjaS1ucGNtLnlhbWwjCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IE51dm90b24g
UEVDSSBCdXMgRGV2aWNlIFRyZWUgQmluZGluZ3MKKworbWFpbnRhaW5lcnM6CisgIC0gVG9tZXIg
TWFpbW9uIDx0bWFpbW9uNzdAZ21haWwuY29tPgorCithbGxPZjoKKyAgLSAkcmVmOiBwZWNpLWNv
bnRyb2xsZXIueWFtbCMKKworcHJvcGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBlbnVtOgor
ICAgICAgLSBudXZvdG9uLG5wY203NTAtcGVjaQorICAgICAgLSBudXZvdG9uLG5wY204NDUtcGVj
aQorCisgIHJhbmdlczoKKyAgICBtYXhJdGVtczogMQorCisgIHJlZzoKKyAgICBtYXhJdGVtczog
MQorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDEKKworICBjbG9ja3M6CisgICAgZGVz
Y3JpcHRpb246CisgICAgICBDbG9jayBzb3VyY2UgZm9yIFBFQ0kgY29udHJvbGxlci4gU2hvdWxk
IHJlZmVyZW5jZSB0aGUgQVBCCisgICAgICBjbG9jay4KKyAgICBtYXhJdGVtczogMQorCisgIGNt
ZC10aW1lb3V0LW1zOgorICAgIG1pbmltdW06IDEKKyAgICBtYXhpbXVtOiAxMDAwCisgICAgZGVm
YXVsdDogMTAwMAorCisgIG5wY20scHVsbC1kb3duOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAg
VGhpcyB2YWx1ZSBkZXRlcm1pbmVzIHRoZSBQRUNJIEkvTyBpbnRlcm5hbCBwdWxsIGRvd24KKyAg
ICAgIG9wZXJhdGlvbi4KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzIKKyAgICBtaW5pbXVtOiAwCisgICAgbWF4aW11bTogMgorICAgIGRlZmF1bHQ6IDAK
KworICBucGNtLGhvc3QtbmVnLWJpdC1yYXRlOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgVGhp
cyB2YWx1ZSBkZXRlcm1pbmVzIHRoZSBob3N0IGRlZmF1bHQgbmVnb3RpYXRpb24KKyAgICAgIGJp
dCByYXRlLgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
MgorICAgIG1pbmltdW06IDcKKyAgICBtYXhpbXVtOiAxNQorICAgIGRlZmF1bHQ6IDE1CisKKyAg
bnBjbSxoaWdoLXZvbHQtcmFuZ2U6CisgICAgdHlwZTogYm9vbGVhbgorICAgIGRlc2NyaXB0aW9u
OgorICAgICAgVGhpcyB2YWx1ZSBhZGFwdHMgUEVDSSBJL08gaW50ZXJmYWNlIHRvIHZvbHRhZ2UK
KyAgICAgIHJhbmdlLgorCisgIHN5c2NvbjoKKyAgICBtYXhJdGVtczogMQorCityZXF1aXJlZDoK
KyAgLSBjb21wYXRpYmxlCisgIC0gcmVnCisgIC0gaW50ZXJydXB0cworICAtIGNsb2NrcworCith
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhhbXBsZXM6CisgIC0gfAorICAgICNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9jbG9jay9udXZvdG9uLG5wY203eHgtY2xvY2suaD4KKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorICAgIHBl
Y2ktY29udHJvbGxlckBmMDEwMDAwMCB7CisgICAgICBjb21wYXRpYmxlID0gIm51dm90b24sbnBj
bTc1MC1wZWNpIjsKKyAgICAgIHJlZyA9IDwweGYwMTAwMDAwIDB4MjAwPjsKKyAgICAgIGludGVy
cnVwdHMgPSA8R0lDX1NQSSA2IElSUV9UWVBFX0xFVkVMX0hJR0g+OworICAgICAgY2xvY2tzID0g
PCZjbGsgTlBDTTdYWF9DTEtfQVBCMz47CisgICAgICBjbWQtdGltZW91dC1tcyA9IDwxMDAwPjsK
KyAgICAgIG5wY20scHVsbC1kb3duID0gPDA+OworICAgICAgbnBjbSxob3N0LW5lZy1iaXQtcmF0
ZSA9IDwxNT47CisgICAgICBzeXNjb24gPSA8Jmdjcj47CisgICAgfTsKKy4uLgotLSAKMi4zMy4w
Cgo=
--000000000000cbd20505d31b7fcd
Content-Type: application/octet-stream; 
	name="0002-peci-Add-peci-npcm-controller-driver.patch"
Content-Disposition: attachment; 
	filename="0002-peci-Add-peci-npcm-controller-driver.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kx65w00c1>
X-Attachment-Id: f_kx65w00c1

RnJvbSBiOGJhNTI2MDUxNjBkZjQ4MmU1YzMwNWQzZGI3NmUyMjhjOTM1Yjg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+CkRh
dGU6IFR1ZSwgMTQgRGVjIDIwMjEgMTU6MTY6MzYgKzAyMDAKU3ViamVjdDogW1BBVENIIDIvMl0g
cGVjaTogQWRkIHBlY2ktbnBjbSBjb250cm9sbGVyIGRyaXZlcgoKQWRkIHN1cHBvcnQgZm9yIE51
dm90b24gTlBDTSBCTUMgaGFyZHdhcmUgdG8KdGhlIFBsYXRmb3JtIEVudmlyb25tZW50IENvbnRy
b2wgSW50ZXJmYWNlIChQRUNJKQpzdWJzeXN0ZW0uClRoaXMgZHJpdmVyIGFsbG93cyBCTUMgdG8g
ZGlzY292ZXIgZGV2aWNlcyBjb25uZWN0ZWQKdG8gaXQgYW5kIGNvbW11bmljYXRlIHdpdGggdGhl
bSB1c2luZyBQRUNJIHByb3RvY29sLgoKU2lnbmVkLW9mZi1ieTogVG9tZXIgTWFpbW9uIDx0bWFp
bW9uNzdAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBrZnRpbmcgPHdhcnA1dHdAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvcGVjaS9jb250cm9sbGVyL0tjb25maWcgICAgIHwgIDE3ICsrCiBkcml2
ZXJzL3BlY2kvY29udHJvbGxlci9NYWtlZmlsZSAgICB8ICAgMSArCiBkcml2ZXJzL3BlY2kvY29u
dHJvbGxlci9wZWNpLW5wY20uYyB8IDM5MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAz
IGZpbGVzIGNoYW5nZWQsIDQwOSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9wZWNpL2NvbnRyb2xsZXIvcGVjaS1ucGNtLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Bl
Y2kvY29udHJvbGxlci9LY29uZmlnIGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIvS2NvbmZpZwpp
bmRleCAzMDA4YjFiODEwNDkuLmNiNTZjYTAzMTM3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wZWNp
L2NvbnRyb2xsZXIvS2NvbmZpZworKysgYi9kcml2ZXJzL3BlY2kvY29udHJvbGxlci9LY29uZmln
CkBAIC0xNSwzICsxNSwyMCBAQCBjb25maWcgUEVDSV9BU1BFRUQKIAogCSAgVGhpcyBkcml2ZXIg
Y2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1bGUuIElmIHNvLCB0aGUgbW9kdWxlIHdpbGwKIAkg
IGJlIGNhbGxlZCBwZWNpLWFzcGVlZC4KKworY29uZmlnIFBFQ0lfTlBDTQorCXRyaXN0YXRlICJO
dXZvdG9uIE5QQ00gUEVDSSBzdXBwb3J0IgorCXNlbGVjdCBSRUdNQVBfTU1JTworCWRlcGVuZHMg
b24gT0YKKwlkZXBlbmRzIG9uIEFSQ0hfTlBDTSB8fCBDT01QSUxFX1RFU1QKKwlkZXBlbmRzIG9u
IFBFQ0kKKwloZWxwCisJICBUaGlzIG9wdGlvbiBlbmFibGVzIFBFQ0kgY29udHJvbGxlciBkcml2
ZXIgZm9yIE51dm90b24gTlBDTTdYWAorCSAgYW5kIE5QQ004WFggU29Dcy4gSXQgYWxsb3dzIEJN
QyB0byBkaXNjb3ZlciBkZXZpY2VzIGNvbm5lY3RlZAorCSAgdG8gaXQgYW5kIGNvbW11bmljYXRl
IHdpdGggdGhlbSB1c2luZyBQRUNJIHByb3RvY29sLgorCisJICBTYXkgWSBoZXJlIGlmIHlvdSB3
YW50IHN1cHBvcnQgZm9yIHRoZSBQbGF0Zm9ybSBFbnZpcm9ubWVudCBDb250cm9sCisJICBJbnRl
cmZhY2UgKFBFQ0kpIGJ1cyBhZGFwdGVyIGRyaXZlciBvbiB0aGUgTnV2b3RvbiBOUENNIFNvQ3Mu
CisKKwkgIFRoaXMgc3VwcG9ydCBpcyBhbHNvIGF2YWlsYWJsZSBhcyBhIG1vZHVsZS4gSWYgc28s
IHRoZSBtb2R1bGUKKwkgIHdpbGwgYmUgY2FsbGVkIHBlY2ktbnBjbS4KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGVjaS9jb250cm9sbGVyL01ha2VmaWxlIGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIv
TWFrZWZpbGUKaW5kZXggMDIyYzI4ZWYxYmYwLi5lMjQ3NDQ5YmI0MjMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcGVjaS9jb250cm9sbGVyL01ha2VmaWxlCisrKyBiL2RyaXZlcnMvcGVjaS9jb250cm9s
bGVyL01ha2VmaWxlCkBAIC0xLDMgKzEsNCBAQAogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5CiAKIG9iai0kKENPTkZJR19QRUNJX0FTUEVFRCkJKz0gcGVjaS1hc3BlZWQu
bworb2JqLSQoQ09ORklHX1BFQ0lfTlBDTSkJCSs9IHBlY2ktbnBjbS5vCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BlY2kvY29udHJvbGxlci9wZWNpLW5wY20uYyBiL2RyaXZlcnMvcGVjaS9jb250cm9s
bGVyL3BlY2ktbnBjbS5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
OTZjZjA2ZGQ1YTU2Ci0tLSAvZGV2L251bGwKKysrIGIvZHJpdmVycy9wZWNpL2NvbnRyb2xsZXIv
cGVjaS1ucGNtLmMKQEAgLTAsMCArMSwzOTEgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBHUEwtMi4wCisvLyBDb3B5cmlnaHQgKGMpIDIwMTkgTnV2b3RvbiBUZWNobm9sb2d5IGNvcnBv
cmF0aW9uLgorCisjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KKyNpbmNsdWRlIDxsaW51eC9j
bGsuaD4KKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KKyNpbmNsdWRlIDxsaW51eC9qaWZm
aWVzLmg+CisjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CisjaW5jbHVkZSA8bGludXgvb2YuaD4K
KyNpbmNsdWRlIDxsaW51eC9wZWNpLmg+CisjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+CisjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nv
bi5oPgorI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CisKKy8qIE5QQ00gR0NSIG1vZHVsZSAqLwor
I2RlZmluZSBOUENNX0lOVENSM19PRkZTRVQJMHg5QworI2RlZmluZSBOUENNX0lOVENSM19QRUNJ
VlNFTAlCSVQoMTkpCisKKy8qIE5QQ00gUEVDSSBSZWdpc3RlcnMgKi8KKyNkZWZpbmUgTlBDTV9Q
RUNJX0NUTF9TVFMJMHgwMAorI2RlZmluZSBOUENNX1BFQ0lfUkRfTEVOR1RICTB4MDQKKyNkZWZp
bmUgTlBDTV9QRUNJX0FERFIJCTB4MDgKKyNkZWZpbmUgTlBDTV9QRUNJX0NNRAkJMHgwQworI2Rl
ZmluZSBOUENNX1BFQ0lfQ1RMMgkJMHgxMAorI2RlZmluZSBOUENNX1BFQ0lfV1JfTEVOR1RICTB4
MUMKKyNkZWZpbmUgTlBDTV9QRUNJX1BERFIJCTB4MkMKKyNkZWZpbmUgTlBDTV9QRUNJX0RBVF9J
Tk9VVChuKQkoMHgxMDAgKyAoKG4pICogNCkpCisKKyNkZWZpbmUgTlBDTV9QRUNJX01BWF9SRUcJ
MHgyMDAKKworLyogTlBDTV9QRUNJX0NUTF9TVFMgLSAweDAwIDogQ29udHJvbCBSZWdpc3RlciAq
LworI2RlZmluZSBOUENNX1BFQ0lfQ1RSTF9ET05FX0lOVF9FTglCSVQoNikKKyNkZWZpbmUgTlBD
TV9QRUNJX0NUUkxfQUJSVF9FUlIJCUJJVCg0KQorI2RlZmluZSBOUENNX1BFQ0lfQ1RSTF9DUkNf
RVJSCQlCSVQoMykKKyNkZWZpbmUgTlBDTV9QRUNJX0NUUkxfRE9ORQkJQklUKDEpCisjZGVmaW5l
IE5QQ01fUEVDSV9DVFJMX1NUQVJUX0JVU1kJQklUKDApCisKKy8qIE5QQ01fUEVDSV9SRF9MRU5H
VEggLSAweDA0IDogQ29tbWFuZCBSZWdpc3RlciAqLworI2RlZmluZSBOUENNX1BFQ0lfUkRfTEVO
X01BU0sJCUdFTk1BU0soNiwgMCkKKworLyogTlBDTV9QRUNJX0NNRCAtIDB4MTAgOiBDb21tYW5k
IFJlZ2lzdGVyICovCisjZGVmaW5lIE5QQ01fUEVDSV9DVEwyX01BU0sJCUdFTk1BU0soNywgNikK
KworLyogTlBDTV9QRUNJX1dSX0xFTkdUSCAtIDB4MUMgOiBDb21tYW5kIFJlZ2lzdGVyICovCisj
ZGVmaW5lIE5QQ01fUEVDSV9XUl9MRU5fTUFTSwkJR0VOTUFTSyg2LCAwKQorCisvKiBOUENNX1BF
Q0lfUEREUiAtIDB4MkMgOiBDb21tYW5kIFJlZ2lzdGVyICovCisjZGVmaW5lIE5QQ01fUEVDSV9Q
RERSX01BU0sJCUdFTk1BU0soNCwgMCkKKworI2RlZmluZSBOUENNX1BFQ0lfSU5UX01BU0sJKE5Q
Q01fUEVDSV9DVFJMX0FCUlRfRVJSIHwgXAorCQkJCU5QQ01fUEVDSV9DVFJMX0NSQ19FUlIgfCBc
CisJCQkJTlBDTV9QRUNJX0NUUkxfRE9ORSkKKworI2RlZmluZSBOUENNX1BFQ0lfSURMRV9DSEVD
S19USU1FT1VUX1VTRUMJNTAwMDAKKyNkZWZpbmUgTlBDTV9QRUNJX0lETEVfQ0hFQ0tfSU5URVJW
QUxfVVNFQwkxMDAwMAorI2RlZmluZSBOUENNX1BFQ0lfQ01EX1RJTUVPVVRfTVNfREVGQVVMVAkx
MDAwCisjZGVmaW5lIE5QQ01fUEVDSV9DTURfVElNRU9VVF9NU19NQVgJCTYwMDAwCisjZGVmaW5l
IE5QQ01fUEVDSV9IT1NUX05FR19CSVRfUkFURV9NQVgJCTMxCisjZGVmaW5lIE5QQ01fUEVDSV9I
T1NUX05FR19CSVRfUkFURV9NSU4JCTcKKyNkZWZpbmUgTlBDTV9QRUNJX0hPU1RfTkVHX0JJVF9S
QVRFX0RFRkFVTFQJMTUKKyNkZWZpbmUgTlBDTV9QRUNJX1BVTExfRE9XTl9ERUZBVUxUCQkwCisj
ZGVmaW5lIE5QQ01fUEVDSV9QVUxMX0RPV05fTUFYCQkJMgorCitzdHJ1Y3QgbnBjbV9wZWNpIHsK
Kwl1MzIJCQljbWRfdGltZW91dF9tczsKKwl1MzIJCQlob3N0X2JpdF9yYXRlOworCXN0cnVjdCBj
b21wbGV0aW9uCXhmZXJfY29tcGxldGU7CisJc3RydWN0IHJlZ21hcAkJKnJlZ21hcDsKKwl1MzIJ
CQlzdGF0dXM7CisJc3BpbmxvY2tfdAkJbG9jazsgLyogdG8gc3luYyBjb21wbGV0aW9uIHN0YXR1
cyBoYW5kbGluZyAqLworCXN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXI7CisJc3Ry
dWN0IGRldmljZQkJKmRldjsKKwlzdHJ1Y3QgY2xrCQkqY2xrOworCWludAkJCWlycTsKK307CisK
K3N0YXRpYyBpbnQgbnBjbV9wZWNpX3hmZXJfbmF0aXZlKHN0cnVjdCBucGNtX3BlY2kgKnByaXYs
CisJCQkJIHU4IGFkZHIsIHN0cnVjdCBwZWNpX3JlcXVlc3QgKnJlcSkKK3sKKwlsb25nIGVyciwg
dGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMocHJpdi0+Y21kX3RpbWVvdXRfbXMpOworCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7CisJdW5zaWduZWQgaW50IG1zZ19yZDsKKwl1MzIgY21kX3N0czsKKwlp
bnQgaSwgcmM7CisKKwkvKiBDaGVjayBjb21tYW5kIHN0cyBhbmQgYnVzIGlkbGUgc3RhdGUgKi8K
KwlyYyA9IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChwcml2LT5yZWdtYXAsIE5QQ01fUEVDSV9D
VExfU1RTLCBjbWRfc3RzLAorCQkJCSAgICAgICEoY21kX3N0cyAmIE5QQ01fUEVDSV9DVFJMX1NU
QVJUX0JVU1kpLAorCQkJCSAgICAgIE5QQ01fUEVDSV9JRExFX0NIRUNLX0lOVEVSVkFMX1VTRUMs
CisJCQkJICAgICAgTlBDTV9QRUNJX0lETEVfQ0hFQ0tfVElNRU9VVF9VU0VDKTsKKwlpZiAocmMp
CisJCXJldHVybiByYzsgLyogLUVUSU1FRE9VVCAqLworCisJc3Bpbl9sb2NrX2lycXNhdmUoJnBy
aXYtPmxvY2ssIGZsYWdzKTsKKwlyZWluaXRfY29tcGxldGlvbigmcHJpdi0+eGZlcl9jb21wbGV0
ZSk7CisKKwlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBOUENNX1BFQ0lfQUREUiwgYWRkcik7
CisJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgTlBDTV9QRUNJX1JEX0xFTkdUSCwKKwkJICAg
ICBOUENNX1BFQ0lfV1JfTEVOX01BU0sgJiByZXEtPnJ4Lmxlbik7CisJcmVnbWFwX3dyaXRlKHBy
aXYtPnJlZ21hcCwgTlBDTV9QRUNJX1dSX0xFTkdUSCwKKwkJICAgICBOUENNX1BFQ0lfV1JfTEVO
X01BU0sgJiByZXEtPnR4Lmxlbik7CisKKwlpZiAocmVxLT50eC5sZW4pIHsKKwkJcmVnbWFwX3dy
aXRlKHByaXYtPnJlZ21hcCwgTlBDTV9QRUNJX0NNRCwgcmVxLT50eC5idWZbMF0pOworCisJCWZv
ciAoaSA9IDA7IGkgPCAocmVxLT50eC5sZW4gLSAxKTsgaSsrKQorCQkJcmVnbWFwX3dyaXRlKHBy
aXYtPnJlZ21hcCwgTlBDTV9QRUNJX0RBVF9JTk9VVChpKSwKKwkJCQkgICAgIHJlcS0+dHguYnVm
W2kgKyAxXSk7CisJfQorCisJcHJpdi0+c3RhdHVzID0gMDsKKwlyZWdtYXBfdXBkYXRlX2JpdHMo
cHJpdi0+cmVnbWFwLCBOUENNX1BFQ0lfQ1RMX1NUUywKKwkJCSAgIE5QQ01fUEVDSV9DVFJMX1NU
QVJUX0JVU1ksCisJCQkgICBOUENNX1BFQ0lfQ1RSTF9TVEFSVF9CVVNZKTsKKworCXNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJnByaXYtPmxvY2ssIGZsYWdzKTsKKworCWVyciA9IHdhaXRfZm9yX2Nv
bXBsZXRpb25faW50ZXJydXB0aWJsZV90aW1lb3V0KCZwcml2LT54ZmVyX2NvbXBsZXRlLAorCQkJ
CQkJCXRpbWVvdXQpOworCisJc3Bpbl9sb2NrX2lycXNhdmUoJnByaXYtPmxvY2ssIGZsYWdzKTsK
KworCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIE5QQ01fUEVDSV9DTUQsIDApOworCisJaWYg
KGVyciA8PSAwIHx8IHByaXYtPnN0YXR1cyAgIT0gTlBDTV9QRUNJX0NUUkxfRE9ORSkgeworCQlp
ZiAoZXJyIDwgMCkgeyAvKiAtRVJFU1RBUlRTWVMgKi8KKwkJCXJjID0gKGludCllcnI7CisJCQln
b3RvIGVycl9pcnFyZXN0b3JlOworCQl9IGVsc2UgaWYgKGVyciA9PSAwKSB7CisJCQlkZXZfZGJn
KHByaXYtPmRldiwgIlRpbWVvdXQgd2FpdGluZyBmb3IgYSByZXNwb25zZSFcbiIpOworCQkJcmMg
PSAtRVRJTUVET1VUOworCQkJZ290byBlcnJfaXJxcmVzdG9yZTsKKwkJfQorCisJCWRldl9kYmco
cHJpdi0+ZGV2LCAiTm8gdmFsaWQgcmVzcG9uc2UhXG4iKTsKKwkJcmMgPSAtRUlPOworCQlnb3Rv
IGVycl9pcnFyZXN0b3JlOworCX0KKworCWZvciAoaSA9IDA7IGkgPCByZXEtPnJ4LmxlbjsgaSsr
KSB7CisJCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgTlBDTV9QRUNJX0RBVF9JTk9VVChpKSwg
Jm1zZ19yZCk7CisJCXJlcS0+cnguYnVmW2ldID0gKHU4KW1zZ19yZDsKKwl9CisKK2Vycl9pcnFy
ZXN0b3JlOgorCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnByaXYtPmxvY2ssIGZsYWdzKTsKKwly
ZXR1cm4gcmM7Cit9CisKK3N0YXRpYyBpcnFyZXR1cm5fdCBucGNtX3BlY2lfaXJxX2hhbmRsZXIo
aW50IGlycSwgdm9pZCAqYXJnKQoreworCXN0cnVjdCBucGNtX3BlY2kgKnByaXYgPSBhcmc7CisJ
dTMyIHN0YXR1c19hY2sgPSAwOworCXUzMiBzdGF0dXM7CisKKwlzcGluX2xvY2soJnByaXYtPmxv
Y2spOworCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgTlBDTV9QRUNJX0NUTF9TVFMsICZzdGF0
dXMpOworCXByaXYtPnN0YXR1cyB8PSAoc3RhdHVzICYgTlBDTV9QRUNJX0lOVF9NQVNLKTsKKwor
CWlmIChzdGF0dXMgJiBOUENNX1BFQ0lfQ1RSTF9DUkNfRVJSKSB7CisJCWRldl9kYmcocHJpdi0+
ZGV2LCAiUEVDSV9JTlRfV19GQ1NfQkFEXG4iKTsKKwkJc3RhdHVzX2FjayB8PSBOUENNX1BFQ0lf
Q1RSTF9DUkNfRVJSOworCX0KKworCWlmIChzdGF0dXMgJiBOUENNX1BFQ0lfQ1RSTF9BQlJUX0VS
UikgeworCQlkZXZfZGJnKHByaXYtPmRldiwgIk5QQ01fUEVDSV9DVFJMX0FCUlRfRVJSXG4iKTsK
KwkJc3RhdHVzX2FjayB8PSBOUENNX1BFQ0lfQ1RSTF9BQlJUX0VSUjsKKwl9CisKKwkvKgorCSAq
IEFsbCBjb21tYW5kcyBzaG91bGQgYmUgZW5kZWQgdXAgd2l0aCBhIE5QQ01fUEVDSV9DVFJMX0RP
TkUKKwkgKiBiaXQgc2V0IGV2ZW4gaW4gYW4gZXJyb3IgY2FzZS4KKwkgKi8KKwlpZiAoc3RhdHVz
ICYgTlBDTV9QRUNJX0NUUkxfRE9ORSkgeworCQlkZXZfZGJnKHByaXYtPmRldiwgIk5QQ01fUEVD
SV9DVFJMX0RPTkVcbiIpOworCQlzdGF0dXNfYWNrIHw9IE5QQ01fUEVDSV9DVFJMX0RPTkU7CisJ
CWNvbXBsZXRlKCZwcml2LT54ZmVyX2NvbXBsZXRlKTsKKwl9CisKKwlyZWdtYXBfd3JpdGVfYml0
cyhwcml2LT5yZWdtYXAsIE5QQ01fUEVDSV9DVExfU1RTLAorCQkJICBOUENNX1BFQ0lfSU5UX01B
U0ssIHN0YXR1c19hY2spOworCisJc3Bpbl91bmxvY2soJnByaXYtPmxvY2spOworCXJldHVybiBJ
UlFfSEFORExFRDsKK30KKworc3RhdGljIGludCBucGNtX3BlY2lfaW5pdF9jdHJsKHN0cnVjdCBu
cGNtX3BlY2kgKnByaXYpCit7CisJdTMyIGNtZF9zdHMsIGhvc3RfbmVnX2JpdF9yYXRlID0gMCwg
cHVsbF9kb3duID0gMDsKKwlzdHJ1Y3QgcmVnbWFwICpnY3JfcmVnbWFwOworCWludCByZXQ7CisK
Kwlwcml2LT5jbGsgPSBkZXZtX2Nsa19nZXQocHJpdi0+ZGV2LCBOVUxMKTsKKwlpZiAoSVNfRVJS
KHByaXYtPmNsaykpIHsKKwkJZGV2X2Vycihwcml2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IGNsayBz
b3VyY2UuXG4iKTsKKwkJcmV0dXJuIFBUUl9FUlIocHJpdi0+Y2xrKTsKKwl9CisKKwlyZXQgPSBj
bGtfcHJlcGFyZV9lbmFibGUocHJpdi0+Y2xrKTsKKwlpZiAocmV0KSB7CisJCWRldl9lcnIocHJp
di0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBjbG9jay5cbiIpOworCQlyZXR1cm4gcmV0OworCX0K
KworCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHByaXYtPmRldi0+b2Zfbm9kZSwgImNtZC10
aW1lb3V0LW1zIiwKKwkJCQkgICAmcHJpdi0+Y21kX3RpbWVvdXRfbXMpOworCWlmIChyZXQgfHwg
cHJpdi0+Y21kX3RpbWVvdXRfbXMgPiBOUENNX1BFQ0lfQ01EX1RJTUVPVVRfTVNfTUFYIHx8CisJ
ICAgIHByaXYtPmNtZF90aW1lb3V0X21zID09IDApIHsKKwkJaWYgKHJldCkKKwkJCWRldl93YXJu
KHByaXYtPmRldiwKKwkJCQkgImNtZC10aW1lb3V0LW1zIG5vdCBmb3VuZCwgdXNlIGRlZmF1bHQg
OiAldVxuIiwKKwkJCQkgTlBDTV9QRUNJX0NNRF9USU1FT1VUX01TX0RFRkFVTFQpOworCQllbHNl
CisJCQlkZXZfd2Fybihwcml2LT5kZXYsCisJCQkJICJJbnZhbGlkIGNtZC10aW1lb3V0LW1zIDog
JXUuIFVzZSBkZWZhdWx0IDogJXVcbiIsCisJCQkJIHByaXYtPmNtZF90aW1lb3V0X21zLAorCQkJ
CSBOUENNX1BFQ0lfQ01EX1RJTUVPVVRfTVNfREVGQVVMVCk7CisKKwkJcHJpdi0+Y21kX3RpbWVv
dXRfbXMgPSBOUENNX1BFQ0lfQ01EX1RJTUVPVVRfTVNfREVGQVVMVDsKKwl9CisKKwlpZiAob2Zf
cHJvcGVydHlfcmVhZF9ib29sKHByaXYtPmRldi0+b2Zfbm9kZSwgIm5wY20saGlnaC12b2x0LXJh
bmdlIikpIHsKKwkJZ2NyX3JlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUo
cHJpdi0+ZGV2LT5vZl9ub2RlLCAic3lzY29uIik7CisJCWlmICghSVNfRVJSKGdjcl9yZWdtYXAp
KQorCQkJcmVnbWFwX3VwZGF0ZV9iaXRzKGdjcl9yZWdtYXAsIE5QQ01fSU5UQ1IzX09GRlNFVCwK
KwkJCQkJICAgTlBDTV9JTlRDUjNfUEVDSVZTRUwsCisJCQkJCSAgIE5QQ01fSU5UQ1IzX1BFQ0lW
U0VMKTsKKwkJZWxzZQorCQkJZGV2X3dhcm4ocHJpdi0+ZGV2LAorCQkJCSAic3lzY29uIGdjciBu
b3QgZm91bmQsIGhpZ2gtdm9sdC1yYW5nZSBkaWRuJ3Qgc2V0XG4iKTsKKwl9CisKKwlyZXQgPSBv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihwcml2LT5kZXYtPm9mX25vZGUsICJucGNtLHB1bGwtZG93biIs
CisJCQkJICAgJnB1bGxfZG93bik7CisJaWYgKHJldCB8fCBwdWxsX2Rvd24gPiBOUENNX1BFQ0lf
UFVMTF9ET1dOX01BWCkgeworCQlpZiAocmV0KQorCQkJZGV2X3dhcm4ocHJpdi0+ZGV2LAorCQkJ
CSAicHVsbC1kb3duIG5vdCBmb3VuZCwgdXNlIGRlZmF1bHQgOiAldVxuIiwKKwkJCQkgTlBDTV9Q
RUNJX1BVTExfRE9XTl9ERUZBVUxUKTsKKwkJZWxzZQorCQkJZGV2X3dhcm4ocHJpdi0+ZGV2LAor
CQkJCSAiSW52YWxpZCBwdWxsLWRvd24gOiAldS4gVXNlIGRlZmF1bHQgOiAldVxuIiwKKwkJCQkg
cHVsbF9kb3duLAorCQkJCSBOUENNX1BFQ0lfUFVMTF9ET1dOX0RFRkFVTFQpOworCQlwdWxsX2Rv
d24gPSBOUENNX1BFQ0lfUFVMTF9ET1dOX0RFRkFVTFQ7CisJfQorCisJcmVnbWFwX3VwZGF0ZV9i
aXRzKHByaXYtPnJlZ21hcCwgTlBDTV9QRUNJX0NUTDIsIE5QQ01fUEVDSV9DVEwyX01BU0ssCisJ
CQkgICBwdWxsX2Rvd24gPDwgNik7CisKKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihwcml2
LT5kZXYtPm9mX25vZGUsICJucGNtLGhvc3QtbmVnLWJpdC1yYXRlIiwKKwkJCQkgICAmaG9zdF9u
ZWdfYml0X3JhdGUpOworCWlmIChyZXQgfHwgaG9zdF9uZWdfYml0X3JhdGUgPiBOUENNX1BFQ0lf
SE9TVF9ORUdfQklUX1JBVEVfTUFYIHx8CisJICAgIGhvc3RfbmVnX2JpdF9yYXRlIDwgTlBDTV9Q
RUNJX0hPU1RfTkVHX0JJVF9SQVRFX01JTikgeworCQlpZiAocmV0KQorCQkJZGV2X3dhcm4ocHJp
di0+ZGV2LAorCQkJCSAiaG9zdC1uZWctYml0LXJhdGUgbm90IGZvdW5kLCB1c2UgZGVmYXVsdCA6
ICV1XG4iLAorCQkJCSBOUENNX1BFQ0lfSE9TVF9ORUdfQklUX1JBVEVfREVGQVVMVCk7CisJCWVs
c2UKKwkJCWRldl93YXJuKHByaXYtPmRldiwKKwkJCQkgIkludmFsaWQgaG9zdC1uZWctYml0LXJh
dGUgOiAldS4gVXNlIGRlZmF1bHQgOiAldVxuIiwKKwkJCQkgaG9zdF9uZWdfYml0X3JhdGUsCisJ
CQkJIE5QQ01fUEVDSV9IT1NUX05FR19CSVRfUkFURV9ERUZBVUxUKTsKKwkJaG9zdF9uZWdfYml0
X3JhdGUgPSBOUENNX1BFQ0lfSE9TVF9ORUdfQklUX1JBVEVfREVGQVVMVDsKKwl9CisKKwlyZWdt
YXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBOUENNX1BFQ0lfUEREUiwgTlBDTV9QRUNJX1BE
RFJfTUFTSywKKwkJCSAgIGhvc3RfbmVnX2JpdF9yYXRlKTsKKworCXByaXYtPmhvc3RfYml0X3Jh
dGUgPSBjbGtfZ2V0X3JhdGUocHJpdi0+Y2xrKSAvCisJCSg0ICogKGhvc3RfbmVnX2JpdF9yYXRl
ICsgMSkpOworCisJcmV0ID0gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KHByaXYtPnJlZ21hcCwg
TlBDTV9QRUNJX0NUTF9TVFMsIGNtZF9zdHMsCisJCQkJICAgICAgICEoY21kX3N0cyAmIE5QQ01f
UEVDSV9DVFJMX1NUQVJUX0JVU1kpLAorCQkJCSAgICAgICBOUENNX1BFQ0lfSURMRV9DSEVDS19J
TlRFUlZBTF9VU0VDLAorCQkJCSAgICAgICBOUENNX1BFQ0lfSURMRV9DSEVDS19USU1FT1VUX1VT
RUMpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7IC8qIC1FVElNRURPVVQgKi8KKworCS8qIFBF
Q0kgaW50ZXJydXB0IGVuYWJsZSAqLworCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAs
IE5QQ01fUEVDSV9DVExfU1RTLAorCQkJICAgTlBDTV9QRUNJX0NUUkxfRE9ORV9JTlRfRU4sCisJ
CQkgICBOUENNX1BFQ0lfQ1RSTF9ET05FX0lOVF9FTik7CisKKwlyZXR1cm4gMDsKK30KKworc3Rh
dGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIG5wY21fcGVjaV9yZWdtYXBfY29uZmlnID0g
eworCS5yZWdfYml0cyA9IDgsCisJLnZhbF9iaXRzID0gOCwKKwkubWF4X3JlZ2lzdGVyID0gTlBD
TV9QRUNJX01BWF9SRUcsCisJLmZhc3RfaW8gPSB0cnVlLAorfTsKKworc3RhdGljIGludCBucGNt
X3BlY2lfeGZlcihzdHJ1Y3QgcGVjaV9jb250cm9sbGVyICpjb250cm9sbGVyLAorCQkJICB1OCBh
ZGRyLCBzdHJ1Y3QgcGVjaV9yZXF1ZXN0ICpyZXEpCit7CisJc3RydWN0IG5wY21fcGVjaSAqcHJp
diA9IGRldl9nZXRfZHJ2ZGF0YShjb250cm9sbGVyLT5kZXYucGFyZW50KTsKKworCXJldHVybiBu
cGNtX3BlY2lfeGZlcl9uYXRpdmUocHJpdiwgYWRkciwgcmVxKTsKK30KKworc3RhdGljIHN0cnVj
dCBwZWNpX2NvbnRyb2xsZXJfb3BzIG5wY21fb3BzID0geworCS54ZmVyID0gbnBjbV9wZWNpX3hm
ZXIsCit9OworCitzdGF0aWMgaW50IG5wY21fcGVjaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQoreworCXN0cnVjdCBwZWNpX2NvbnRyb2xsZXIgKmNvbnRyb2xsZXI7CisJc3Ry
dWN0IG5wY21fcGVjaSAqcHJpdjsKKwl2b2lkIF9faW9tZW0gKmJhc2U7CisJaW50IHJldDsKKwor
CXByaXYgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5F
TCk7CisJaWYgKCFwcml2KQorCQlyZXR1cm4gLUVOT01FTTsKKworCXByaXYtPmRldiA9ICZwZGV2
LT5kZXY7CisJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIHByaXYpOworCisJYmFzZSA9IGRl
dm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKKwlpZiAoSVNfRVJSKGJhc2Up
KSB7CisJCXJldCA9IFBUUl9FUlIoYmFzZSk7CisJCXJldHVybiByZXQ7CisJfQorCisJcHJpdi0+
cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9tbWlvKCZwZGV2LT5kZXYsIGJhc2UsCisJCQkJCSAg
ICAgJm5wY21fcGVjaV9yZWdtYXBfY29uZmlnKTsKKwlpZiAoSVNfRVJSKHByaXYtPnJlZ21hcCkp
IHsKKwkJcmV0ID0gUFRSX0VSUihwcml2LT5yZWdtYXApOworCQlyZXR1cm4gcmV0OworCX0KKwor
CXByaXYtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7CisJaWYgKCFwcml2LT5pcnEp
IHsKKwkJcmV0ID0gLUVOT0RFVjsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwlyZXQgPSBkZXZtX3Jl
cXVlc3RfaXJxKCZwZGV2LT5kZXYsIHByaXYtPmlycSwgbnBjbV9wZWNpX2lycV9oYW5kbGVyLAor
CQkJICAgICAgIDAsICJwZWNpLW5wY20taXJxIiwgcHJpdik7CisJaWYgKHJldCkKKwkJcmV0dXJu
IHJldDsKKworCWluaXRfY29tcGxldGlvbigmcHJpdi0+eGZlcl9jb21wbGV0ZSk7CisJc3Bpbl9s
b2NrX2luaXQoJnByaXYtPmxvY2spOworCisJcmV0ID0gbnBjbV9wZWNpX2luaXRfY3RybChwcml2
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJY29udHJvbGxlciA9IGRldm1fcGVjaV9j
b250cm9sbGVyX2FkZChwcml2LT5kZXYsICZucGNtX29wcyk7CisJaWYgKElTX0VSUihjb250cm9s
bGVyKSkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUocHJpdi0+ZGV2LCBQVFJfRVJSKGNvbnRyb2xs
ZXIpLAorCQkJCSAgICAgImZhaWxlZCB0byBhZGQgbnBjbSBwZWNpIGNvbnRyb2xsZXJcbiIpOwor
CisJcHJpdi0+Y29udHJvbGxlciA9IGNvbnRyb2xsZXI7CisKKwlyZXR1cm4gMDsKK30KKworc3Rh
dGljIGludCBucGNtX3BlY2lfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCit7
CisJc3RydWN0IG5wY21fcGVjaSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsK
KworCWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5jbGspOworCisJcmV0dXJuIDA7Cit9CisK
K3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG5wY21fcGVjaV9vZl90YWJsZVtdID0g
eworCXsgLmNvbXBhdGlibGUgPSAibnV2b3RvbixucGNtNzUwLXBlY2kiLCB9LAorCXsgLmNvbXBh
dGlibGUgPSAibnV2b3RvbixucGNtODQ1LXBlY2kiLCB9LAorCXsgfQorfTsKK01PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIG5wY21fcGVjaV9vZl90YWJsZSk7CisKK3N0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIG5wY21fcGVjaV9kcml2ZXIgPSB7CisJLnByb2JlICA9IG5wY21fcGVjaV9wcm9i
ZSwKKwkucmVtb3ZlID0gbnBjbV9wZWNpX3JlbW92ZSwKKwkuZHJpdmVyID0geworCQkubmFtZSAg
ICAgICAgICAgPSBLQlVJTERfTU9ETkFNRSwKKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hf
cHRyKG5wY21fcGVjaV9vZl90YWJsZSksCisJfSwKK307Cittb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KG5wY21fcGVjaV9kcml2ZXIpOworCitNT0RVTEVfQVVUSE9SKCJUb21lciBNYWltb24gPHRvbWVy
Lm1haW1vbkBudXZvdG9uLmNvbT4iKTsKK01PRFVMRV9ERVNDUklQVElPTigiTlBDTSBQbGF0Zm9y
bSBFbnZpcm9ubWVudCBDb250cm9sIEludGVyZmFjZSAoUEVDSSkgZHJpdmVyIik7CitNT0RVTEVf
TElDRU5TRSgiR1BMIHYyIik7Ci0tIAoyLjMzLjAKCg==
--000000000000cbd20505d31b7fcd--
