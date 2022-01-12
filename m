Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650748CEB5
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 00:05:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ3790y40z2xXC
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 10:05:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqAywo6P;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nqAywo6P; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ36h0pZgz2xsc;
 Thu, 13 Jan 2022 10:04:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642028684; x=1673564684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k2hXDAqknL5uEoVRKlyz9rSJ3uBw4Q6PwwRoORXOeIE=;
 b=nqAywo6PkvUUPuOtb/NOrFfHzEXIlgXmz5YC6MezjQ6Nsf7mIZ0AWxRA
 D+uo2lNUr6HxlB9ZsRRhqx55SsaBhDgaN3W7IbpXZWstlkN2Ob//czB0b
 6xC32JRv7i6hojR8wDaSEqoP7w4JCvGBDkIUnCIZnhwqijJg/GN4MmaG/
 7l7rAbHsmo1sq86VFR07TdG0NCwTdjL52e/twD/KEdFT2BRSu/uTmeD86
 R1bnAxxWyvtJDvaF/EHjojTZ2yaoNudeBQzRU6njfeUUIcRZijUfmYGQh
 NC+phJzHzk+6tiUIYIab/hL7Gg0WIu2p1WjzXyQmJ/vmbKbaEhB/+svY1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="244075895"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="244075895"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:03:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="515690959"
Received: from kstefans-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.154.174])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:03:20 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 00/13] Introduce PECI subsystem
Date: Thu, 13 Jan 2022 00:02:34 +0100
Message-Id: <20220112230247.982212-1-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Iwona Winiarska <iwona.winiarska@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi!

Changes in this revision are limited to peci-aspeed controller driver
and its DTS schema (except small cosmetic change in peci-dimmtemp
hwmon).
Major change is related to clock programming - common clock framework
is now used in peci-aspeed.
This required appropriate changes in peci-aspeed DTS schema. The
properties that had impact on clock programming were removed and
replaced with "clock-frequency", which is simply passed to
clk_aspeed_peci.
Additionally, "aspeed,rd-sampling-point" was removed. The driver is
now just using a default value. DTS property can be reintroduced in
the future if needed.

Here is the usual cover letter from the previous revision:

The Platform Environment Control Interface (PECI) is a communication
interface between Intel processors and management controllers (e.g.
Baseboard Management Controller, BMC).

This series adds a PECI subsystem and introduces drivers which run in
the Linux instance on the management controller (not the main Intel
processor) and is intended to be used by the OpenBMC [1], a Linux
distribution for BMC devices.
The information exposed over PECI (like processor and DIMM
temperature) refers to the Intel processor and can be consumed by
daemons running on the BMC to, for example, display the processor
temperature in its web interface.

The PECI bus is collection of code that provides interface support
between PECI devices (that actually represent processors) and PECI
controllers (such as the "peci-aspeed" controller) that allow to
access physical PECI interface. PECI devices are bound to PECI
drivers that provides access to PECI services. This series introduces
a generic "peci-cpu" driver that exposes hardware monitoring "cputemp"
and "dimmtemp" using the auxiliary bus.

Exposing "raw" PECI to userspace, either to write userspace drivers or
for debug/testing purpose was left out of this series to encourage
writing kernel drivers instead, but may be pursued in the future.

Introducing PECI to upstream Linux was already attempted before [2].
Since it's been over a year since last revision, and the series
changed quite a bit in the meantime, I've decided to start from v1.

I would also like to give credit to everyone who helped me with
different aspects of preliminary review:
- Pierre-Louis Bossart,
- Tony Luck, 
- Andy Shevchenko,
- Dave Hansen.

[1] https://github.com/openbmc/openbmc
[2] https://lore.kernel.org/openbmc/20191211194624.2872-1-jae.hyun.yoo@linux.intel.com/

Changes v4 -> v5:
* Added clk_aspeed_peci to express controller programming using common
  clock framework (Billy)
* Modified peci-aspeed DTS schema to match clock changes (Billy)
* Added workaround for peci-aspeed controller hang (Billy)
* Removed unnecessary "else after return" (Guenter)

Changes v3 -> v4:
* Fixed an issue where peci doesn't work after host shutdown (Zev)
* Replaced kill_device() with peci_device_del_lock (Greg)
* Fixed dts_valid() parameter type (Guenter)
* Removed Jae from MAINTAINERS file (Jae)

Changes v2 -> v3:

* Dropped x86/cpu patches (Boris)
* Dropped pr_fmt() for PECI module (Dan)
* Fixed releasing peci controller device flow (Dan) 
* Improved peci-aspeed commit-msg and Kconfig help (Dan)
* Fixed aspeed_peci_xfer() to use the proper spin_lock function (Dan) 
* Wrapped print_hex_dump_bytes() in CONFIG_DYNAMIC_DEBUG (Dan)
* Removed debug status logs from aspeed_peci_irq_handler() (Dan)
* Renamed functions using devres to start with "devm" (Dan)
* Changed request to be allocated on stack in peci_detect (Dan)
* Removed redundant WARN_ON on invalid PECI addr (Dan)
* Changed peci_device_create() to use device_initialize() + device_add() pattern (Dan)
* Fixed peci_device_destroy() to use kill_device() avoiding double-free (Dan)
* Renamed functions that perform xfer using "peci_xfer_*" prefix (Dan) 
* Renamed peci_request_data_dib(temp) -> peci_request_dib(temp)_read (Dan)
* Fixed thermal margin readings for older Intel processors (Zev) 
* Misc hwmon simplifications (Guenter)
* Used BIT_PER_TYPE to verify macro value constrains (Guenter)
* Improved WARN_ON message to print chan_rank_max and idx_dimm_max (Guenter)
* Improved dimmtemp to not reattempt probe if no dimms are populated

Changes v1 -> v2:

Biggest changes when it comes to diffstat are locking in HWMON
(I decided to clean things up a bit while adding it), switching to
devres usage in more places and exposing sysfs interface in separate patch.

* Moved extending X86 ARCHITECTURE MAINTAINERS earlier in series (Dan)
* Removed "default n" for GENERIC_LIB_X86 (Dan)
* Added vendor prefix for peci-aspeed specific properties (Rob)
* Refactored PECI to use devres consistently (Dan)
* Added missing sysfs documentation and excluded adding peci-sysfs to
  separate patch (Dan)
* Used module_init() instead of subsys_init() for peci module initialization (Dan)
* Removed redundant struct peci_device member (Dan)
* Improved PECI Kconfig help (Randy/Dan)
* Fixed/removed log messages (Dan, Guenter)
* Refactored peci-cputemp and peci-dimmtemp and added missing locks (Guenter)
* Removed unused dev_set_drvdata() in peci-cputemp and peci-dimmtemp (Guenter)
* Fixed used types, names, fixed broken and added additional comments
  to peci-hwmon (Guenter, Zev)
* Refactored peci-dimmtemp to not return -ETIMEDOUT (Guenter)
* Added sanity check for min_peci_revision in peci-hwmon drivers (Zev)
* Added assert for DIMM_NUMS_MAX and additional warning in peci-dimmtemp (Zev)
* Fixed macro names in peci-aspeed (Zev)
* Refactored peci-aspeed sanitizing properties to a single helper function (Zev)
* Fixed peci_cpu_device_ids definition for Broadwell Xeon D (David)
* Refactor peci_request to use a single allocation (Zev)
* Used min_t() to improve code readability (Zev)
* Added macro for PECI_RDENDPTCFG_MMIO_WR_LEN_BASE and fixed adev type
  array name to more descriptive (Zev)
* Fixed peci-hwmon commit-msg and documentation (Zev)

Thanks
-Iwona

Iwona Winiarska (11):
  dt-bindings: Add generic bindings for PECI
  dt-bindings: Add bindings for peci-aspeed
  ARM: dts: aspeed: Add PECI controller nodes
  peci: Add core infrastructure
  peci: Add device detection
  peci: Add sysfs interface for PECI bus
  peci: Add support for PECI device drivers
  peci: Add peci-cpu driver
  hwmon: peci: Add cputemp driver
  hwmon: peci: Add dimmtemp driver
  docs: Add PECI documentation

Jae Hyun Yoo (2):
  peci: Add peci-aspeed controller driver
  docs: hwmon: Document PECI drivers

 Documentation/ABI/testing/sysfs-bus-peci      |  16 +
 .../devicetree/bindings/peci/peci-aspeed.yaml |  72 ++
 .../bindings/peci/peci-controller.yaml        |  33 +
 Documentation/hwmon/index.rst                 |   2 +
 Documentation/hwmon/peci-cputemp.rst          |  90 +++
 Documentation/hwmon/peci-dimmtemp.rst         |  57 ++
 Documentation/index.rst                       |   1 +
 Documentation/peci/index.rst                  |  16 +
 Documentation/peci/peci.rst                   |  51 ++
 MAINTAINERS                                   |  26 +
 arch/arm/boot/dts/aspeed-g4.dtsi              |  11 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |  11 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |  11 +
 drivers/Kconfig                               |   3 +
 drivers/Makefile                              |   1 +
 drivers/hwmon/Kconfig                         |   2 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/peci/Kconfig                    |  31 +
 drivers/hwmon/peci/Makefile                   |   7 +
 drivers/hwmon/peci/common.h                   |  58 ++
 drivers/hwmon/peci/cputemp.c                  | 592 ++++++++++++++++
 drivers/hwmon/peci/dimmtemp.c                 | 630 ++++++++++++++++++
 drivers/peci/Kconfig                          |  36 +
 drivers/peci/Makefile                         |  10 +
 drivers/peci/controller/Kconfig               |  17 +
 drivers/peci/controller/Makefile              |   3 +
 drivers/peci/controller/peci-aspeed.c         | 584 ++++++++++++++++
 drivers/peci/core.c                           | 236 +++++++
 drivers/peci/cpu.c                            | 343 ++++++++++
 drivers/peci/device.c                         | 252 +++++++
 drivers/peci/internal.h                       | 136 ++++
 drivers/peci/request.c                        | 482 ++++++++++++++
 drivers/peci/sysfs.c                          |  82 +++
 include/linux/peci-cpu.h                      |  40 ++
 include/linux/peci.h                          | 112 ++++
 35 files changed, 4055 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
 create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
 create mode 100644 Documentation/devicetree/bindings/peci/peci-controller.yaml
 create mode 100644 Documentation/hwmon/peci-cputemp.rst
 create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
 create mode 100644 Documentation/peci/index.rst
 create mode 100644 Documentation/peci/peci.rst
 create mode 100644 drivers/hwmon/peci/Kconfig
 create mode 100644 drivers/hwmon/peci/Makefile
 create mode 100644 drivers/hwmon/peci/common.h
 create mode 100644 drivers/hwmon/peci/cputemp.c
 create mode 100644 drivers/hwmon/peci/dimmtemp.c
 create mode 100644 drivers/peci/Kconfig
 create mode 100644 drivers/peci/Makefile
 create mode 100644 drivers/peci/controller/Kconfig
 create mode 100644 drivers/peci/controller/Makefile
 create mode 100644 drivers/peci/controller/peci-aspeed.c
 create mode 100644 drivers/peci/core.c
 create mode 100644 drivers/peci/cpu.c
 create mode 100644 drivers/peci/device.c
 create mode 100644 drivers/peci/internal.h
 create mode 100644 drivers/peci/request.c
 create mode 100644 drivers/peci/sysfs.c
 create mode 100644 include/linux/peci-cpu.h
 create mode 100644 include/linux/peci.h

-- 
2.31.1

