Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E611C09B
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 00:33:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YCsd39pFzDqvN
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 10:33:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6rB2Rz2zDqfj
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 06:46:32 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 11:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="216033787"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:27 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v11 00/14] PECI device driver introduction
Date: Wed, 11 Dec 2019 11:46:10 -0800
Message-Id: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:04 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Introduction of the Platform Environment Control Interface (PECI) bus
device driver. PECI is a one-wire bus interface that provides a
communication channel from Intel processors and chipset components to
external monitoring or control devices. PECI is designed to support the
following sideband functions:

* Processor and DRAM thermal management
  - Processor fan speed control is managed by comparing Digital Thermal
    Sensor (DTS) thermal readings acquired via PECI against the
    processor-specific fan speed control reference point, or TCONTROL. Both
    TCONTROL and DTS thermal readings are accessible via the processor PECI
    client. These variables are referenced to a common temperature, the TCC
    activation point, and are both defined as negative offsets from that
    reference.
  - PECI based access to the processor package configuration space provides
    a means for Baseboard Management Controllers (BMC) or other platform
    management devices to actively manage the processor and memory power
    and thermal features.

* Platform Manageability
  - Platform manageability functions including thermal, power, and error
    monitoring. Note that platform 'power' management includes monitoring
    and control for both the processor and DRAM subsystem to assist with
    data center power limiting.
  - PECI allows read access to certain error registers in the processor MSR
    space and status monitoring registers in the PCI configuration space
    within the processor and downstream devices.
  - PECI permits writes to certain registers in the processor PCI
    configuration space.

* Processor Interface Tuning and Diagnostics
  - Processor interface tuning and diagnostics capabilities
    (Intel Interconnect BIST). The processors Intel Interconnect Built In
    Self Test (Intel IBIST) allows for infield diagnostic capabilities in
    the Intel UPI and memory controller interfaces. PECI provides a port to
    execute these diagnostics via its PCI Configuration read and write
    capabilities.

* Failure Analysis
  - Output the state of the processor after a failure for analysis via
    Crashdump.

PECI uses a single wire for self-clocking and data transfer. The bus
requires no additional control lines. The physical layer is a self-clocked
one-wire bus that begins each bit with a driven, rising edge from an idle
level near zero volts. The duration of the signal driven high depends on
whether the bit value is a logic '0' or logic '1'. PECI also includes
variable data transfer rate established with every message. In this way, it
is highly flexible even though underlying logic is simple.

The interface design was optimized for interfacing between an Intel
processor and chipset components in both single processor and multiple
processor environments. The single wire interface provides low board
routing overhead for the multiple load connections in the congested routing
area near the processor and chipset components. Bus speed, error checking,
and low protocol overhead provides adequate link bandwidth and reliability
to transfer critical device operating conditions and configuration
information.

This implementation provides the basic framework to add PECI extensions to
the Linux bus and device models. A hardware specific 'Adapter' driver can
be attached to the PECI bus to provide sideband functions described above.
It is also possible to access all devices on an adapter from userspace
through the /dev interface. A device specific 'Client' driver also can be
attached to the PECI bus so each processor client's features can be
supported by the 'Client' driver through an adapter connection in the bus.
This patch set includes Aspeed 24xx/25xx/26xx, NPCM7xx PECI drivers and
PECI cputemp/dimmtemp drivers as the first implementation for both adapter
and client drivers on the PECI bus framework.

Please review.

Thanks,

Jae

Changes since v10:
- Split out peci-dev module from peci-core module.
- Changed device tree bindings documents format to DT schema.
- Changed hwmon documents format to rst.
- Added Skylake Xeon D support in PECI hwmon drivers.
- Added DTS temperature reading in peci-cputemp driver which is more thermal
  control friendlier than Die temperature.
- Added max and crit properties into peci-dimmtemp driver for temperature
  threshold checking.
- Refined kconfig dependencies in PECI subsystem.
- Added PECI 4.0 command set support.
- Refined 32-bit boundary alignment for all PECI ioctl command structs.
- Added DMA safe command buffer handling in peci-core.
- Added Nuvoton NPCM7xx PECI support.
- Added Aspeed AST26xx PECI support.
- Moved adapter drivers into 'drivers/peci/busses'.
- Fixed minor bugs and style issues.
- configfs support isn't added in this patch set. Will add that using a
  seperate patch set.

Changes since v9:
- Updated license identifiers to incidate 2019.
- Removed unnecessary member variable and enum type from intel client driver.
- Removed 'type' argument from the access_ok() function call.

Changes since v8:
- Refined descriptions in PECI device tree documents.
- Fixed checking logic of supportable PECI commands using full revision
  number.
- Fixed DIB data size to u64 to make that can contain 8-bytes of information.
- Changed PECI cdev names from pecix to peci-x where x is bus number.
- Refined intel-peci-client driver and moved hwmon relating codes to
  peci-hwmon.h.
- Added missing core label strings into peci-cputemp driver.
- Added kerneldoc comments.

Changes since v7:
- Fixed a typo in the MFD_INTEL_PECI_CLIENT description.
- Made peci_unregister_device() NULL-aware.
- Converted to using %pOF instead of node full name in peci-core.
- Removed OF tables from peci-cputemp and peci-dimmtemp.
- Removed of_compatible strings from intel-peci-client.
- Added an access_ok() check into peci_ioctl in peci-core.
- Changed the DT node name of peci simple-bus from 'peci' to 'bus'.

Changes since v6:
- Dropped off unnecessary examples from dt-bindings document.
- Fixed a bug in DIMM index mask building logic.
- Modified DIMM temp label strings to match with the way in BIOS.
- Changed PECI ioctl base number from B6 to B7 to avoid conflict with
  fpga-dfl.
- Separated the PECI section in MAINTAINERS into two parts - PECI subsystem
  and ASPEED PECI driver.

Changes since v5:
- Added more detailed descriptions for PECI client MFD documents.
- Changed PECI client MFD souce file names.
- Fixed DT example of PECI client MFD.
- Removed unnecessary debug printings.
- Moved the asm/intel-family.h inclusion place.

Changes since v4:
- Fixed an incorrect endianness handling in peci-aspeed.
- Added a comment to explain about the asm/intel-family.h inclusion.
- Added an MFD module to support multi-function PECI client devices.

Changes since v3:
- Made code more simple and compact.
- Removed unused header file inclusion.
- Fixed incorrect error return values and messages.
- Removed DTS margin temperature from the peci-cputemp.
- Made some magic numbers use defines.
- Moved peci_get_cpu_id() into peci-core as a common function.
- Replaced the cancel_delayed_work() call with a cancel_delayed_work_sync().
- Replaced AST and Aspeed uses with ASPEED.
- Simplified peci command timeout checking logic using
  regmap_read_poll_timeout().
- Simplified endian swap codes using endian handling macros.
- Dropped regmap read/write error checking except for the first access.
- Added a PECI reset setting in the device tree node.
- Removed unnecessary sleep from the probe context.
- Removed IRQF_SHARED flag from irq request code in the ASPEED PECI driver.
- Fixed typos in documents.
- Combined peci-bus.txt, peci-adapter.txt and peci-client.txt into peci.txt.
- Fixed and swept documents to drop some incorrect or unnecessary
  descriptions.
- Fixed device tree to make unit-address format use reg contents.
- Simplified bit manipulations using <linux/bitfield.h>.
- Made client CPU model checking use <asm/intel-family.h> if available.
- Modified adapter heap allocation method to use kobject reference count
  based.
- Added the low-level PECI xfer IOCTL again to support the Redfish
  requirement.
- Added PM domain attach/detach code.
- Added logic for device instantiation through sysfs.
- Fix a bug of interrupt status checking code in peci-aspeed driver.

Changes since v2:
- Divided peci-hwmon driver into two drivers, peci-cputemp and
  peci-dimmtemp.
- Added generic dt binding documents for PECI bus, adapter and client.
- Removed in_atomic() call from the PECI core driver.
- Improved PECI commands masking logic.
- Added permission check logic for PECI ioctls.
- Removed unnecessary type casts.
- Fixed some invalid error return codes.
- Added the mark_updated() function to improve update interval checking
  logic.
- Fixed a bug in populated DIMM checking function.
- Fixed some typo, grammar and style issues in documents.
- Rewrote hwmon drivers to use devm_hwmon_device_register_with_info API.
- Made peci_match_id() function as a static.
- Replaced a deprecated create_singlethread_workqueue() call with an
  alloc_ordered_workqueue() call.
- Reordered local variable definitions in reversed xmas tree notation.
- Listed up client CPUs that can be supported by peci-cputemp and
  peci-dimmtemp hwmon drivers.
- Added CPU generation detection logic which checks CPUID signature through
  PECI connection.
- Improved interrupt handling logic in the Aspeed PECI adapter driver.
- Fixed SPDX license identifier style in header files.
- Changed some macros in peci.h to static inline functions.
- Dropped sleepable context checking code in peci-core.
- Adjusted rt_mutex protection scope in peci-core.
- Moved adapter->xfer() checking code into peci_register_adapter().
- Improved PECI command retry checking logic.
- Changed ioctl base from 'P' to 0xb6 to avoid confiliction and updated
  ioctl-number.txt to reflect the ioctl number of PECI subsystem.
- Added a comment to describe PECI retry action.
- Simplified return code handling of peci_ioctl_ping().
- Changed type of peci_ioctl_fn[] to static const.
- Fixed range checking code for valid PECI commands.
- Fixed the error return code on invalid PECI commands.
- Fixed incorrect definitions of PECI ioctl and its handling logic.

Changes since v1:
- Additionally implemented a core driver to support PECI linux bus driver
  model.
- Modified Aspeed PECI driver to make that to be an adapter driver in PECI
  bus.
- Modified PECI hwmon driver to make that to be a client driver in PECI
  bus.
- Simplified hwmon driver attribute labels and removed redundant strings.
- Removed core_nums from device tree setting of hwmon driver and modified
  core number detection logic to check the resolved_core register in client
  CPU's local PCI configuration area.
- Removed dimm_nums from device tree setting of hwmon driver and added
  populated DIMM detection logic to support dynamic creation.
- Removed indexing gap on core temperature and DIMM temperature attributes.
- Improved hwmon registration and dynamic attribute creation logic.
- Fixed structure definitions in PECI uapi header to make that use __u8,
  __u16 and etc.
- Modified wait_for_completion_interruptible_timeout error handling logic
  in Aspeed PECI driver to deliver errors correctly.
- Removed low-level xfer command from ioctl and kept only high-level PECI
  command suite as ioctls.
- Fixed I/O timeout logic in Aspeed PECI driver using ktime.
- Added a function into hwmon driver to simplify update delay checking.
- Added a function into hwmon driver to convert 10.6 to millidegree.
- Dropped non-standard attributes in hwmon driver.
- Fixed OF table for hwmon to make it indicate as a PECI client of Intel
  CPU target.
- Added a maintainer of PECI subsystem into MAINTAINERS document.

Jae Hyun Yoo (11):
  dt-bindings: Add PECI subsystem document
  Documentation: ioctl: Add ioctl numbers for PECI subsystem
  peci: Add support for PECI bus driver core
  dt-bindings: Add bindings document of Aspeed PECI adapter
  ARM: dts: aspeed: Add PECI node
  peci: Add Aspeed PECI adapter driver
  dt-bindings: mfd: Add Intel PECI client bindings document
  mfd: intel-peci-client: Add Intel PECI client driver
  Documentation: hwmon: Add documents for PECI hwmon drivers
  hwmon: Add PECI cputemp driver
  hwmon: Add PECI dimmtemp driver

Tomer Maimon (3):
  dt-bindings: peci: add NPCM PECI documentation
  ARM: dts: npcm7xx: Add PECI node
  peci: npcm: add NPCM PECI driver

 .../bindings/mfd/intel,peci-client.yaml       |   67 +
 .../devicetree/bindings/peci/peci-aspeed.yaml |  124 +
 .../devicetree/bindings/peci/peci-bus.yaml    |  129 +
 .../devicetree/bindings/peci/peci-client.yaml |   54 +
 .../devicetree/bindings/peci/peci-npcm.yaml   |  102 +
 Documentation/hwmon/index.rst                 |    2 +
 Documentation/hwmon/peci-cputemp.rst          |   95 +
 Documentation/hwmon/peci-dimmtemp.rst         |   60 +
 .../userspace-api/ioctl/ioctl-number.rst      |    2 +
 arch/arm/boot/dts/aspeed-g4.dtsi              |   25 +
 arch/arm/boot/dts/aspeed-g5.dtsi              |   25 +
 arch/arm/boot/dts/aspeed-g6.dtsi              |   25 +
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi |   19 +
 drivers/Kconfig                               |    2 +
 drivers/Makefile                              |    1 +
 drivers/hwmon/Kconfig                         |   28 +
 drivers/hwmon/Makefile                        |    2 +
 drivers/hwmon/peci-cputemp.c                  |  448 ++++
 drivers/hwmon/peci-dimmtemp.c                 |  393 ++++
 drivers/hwmon/peci-hwmon.h                    |   46 +
 drivers/mfd/Kconfig                           |   17 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/intel-peci-client.c               |  149 ++
 drivers/peci/Kconfig                          |   38 +
 drivers/peci/Makefile                         |   11 +
 drivers/peci/busses/Kconfig                   |   32 +
 drivers/peci/busses/Makefile                  |    7 +
 drivers/peci/busses/peci-aspeed.c             |  489 ++++
 drivers/peci/busses/peci-npcm.c               |  407 ++++
 drivers/peci/peci-core.c                      | 2086 +++++++++++++++++
 drivers/peci/peci-dev.c                       |  348 +++
 include/linux/mfd/intel-peci-client.h         |  117 +
 include/linux/peci.h                          |  150 ++
 include/uapi/linux/peci-ioctl.h               |  660 ++++++
 34 files changed, 6161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/intel,peci-client.yaml
 create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.yaml
 create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/peci/peci-client.yaml
 create mode 100644 Documentation/devicetree/bindings/peci/peci-npcm.yaml
 create mode 100644 Documentation/hwmon/peci-cputemp.rst
 create mode 100644 Documentation/hwmon/peci-dimmtemp.rst
 create mode 100644 drivers/hwmon/peci-cputemp.c
 create mode 100644 drivers/hwmon/peci-dimmtemp.c
 create mode 100644 drivers/hwmon/peci-hwmon.h
 create mode 100644 drivers/mfd/intel-peci-client.c
 create mode 100644 drivers/peci/Kconfig
 create mode 100644 drivers/peci/Makefile
 create mode 100644 drivers/peci/busses/Kconfig
 create mode 100644 drivers/peci/busses/Makefile
 create mode 100644 drivers/peci/busses/peci-aspeed.c
 create mode 100644 drivers/peci/busses/peci-npcm.c
 create mode 100644 drivers/peci/peci-core.c
 create mode 100644 drivers/peci/peci-dev.c
 create mode 100644 include/linux/mfd/intel-peci-client.h
 create mode 100644 include/linux/peci.h
 create mode 100644 include/uapi/linux/peci-ioctl.h

-- 
2.17.1

