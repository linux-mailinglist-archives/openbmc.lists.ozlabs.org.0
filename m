Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B637B5B6156
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 20:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRG4n5MRBz3bqx
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 04:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ERv2MQFN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ERv2MQFN;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRG4M0220z2xy4
	for <openbmc@lists.ozlabs.org>; Tue, 13 Sep 2022 04:54:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663008899; x=1694544899;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=AXsTmxWessXrsSOlGDp/tZsYosvVFfoC8ck+fmh3nTA=;
  b=ERv2MQFNK9BETnbbMkivu8K2rdLkx/h77IzL8odOYLLgPAuEKddmv3Sg
   aKj6A5eXtzvG5W0kyufa9ypTLDR66gGYGlflmJj9JadJ0QTAFjz7kFHMK
   1M4KCWJb91WzHnQYibmvheu/1+zPE+ihe5YaokysR3CMaapqLGc4QuVkr
   XeEc9lW9PMODrYciw+Q6plwMbGFLi9Q09bKYJnR8V4QIOJyl2MQZHFHMl
   MIWen7ZpQeN/S2CPcKdDvoVb1fOgLag4oQ7Y/D6FRE9VjZ1ApW7VqihWp
   vkuDXC2eOe0nXU99ta0Uq1zgnZPUDu3x+1YY3v9l9OszXJnk1kwNvDNy4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="296678652"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="296678652"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 11:54:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="684547855"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2022 11:54:53 -0700
Received: from [10.212.12.199] (jmbills-mobl1.amr.corp.intel.com [10.212.12.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id E09C3580871
	for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2022 11:54:52 -0700 (PDT)
Message-ID: <a906d823-50e7-2f4f-8704-66491aa16687@linux.intel.com>
Date: Mon, 12 Sep 2022 12:54:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Porting OBMC
To: openbmc@lists.ozlabs.org
References: <1919673638.3824165.1662204063469.ref@mail.yahoo.com>
 <1919673638.3824165.1662204063469@mail.yahoo.com>
Content-Language: en-US
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
In-Reply-To: <1919673638.3824165.1662204063469@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/3/2022 5:21 AM, Hamid reza Mehrabian wrote:
> Hi all,
> I'm trying to port OBMC to a new server motherboard. some of the 
> hardware specification:
> 
> - 3rd Gen Intel Xeon Scalable Processor x2 slots
> - Intel® C621A chipset
> - ASPEED AST2500
> - x6 Fan with tacho
> 
> *Are Done :*
> I wrote the device tree according to its schematic and other similar 
> server motherboards. Also, I wrote a new JSON configuration for 
> Entity-Manager and x86-Power-Control. I created .conf files of the 
> sensors in /recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/*.
> * > Current Status :*
> - I can watch the Sensors and ADC values correctly.
> - I can see current power status and turn off/on the server.
Nice work!

> *
> *
> *Current Problems :*
> - PWM of all fans is set on 100%.
> - BIOS is frozen at DXE running stage.
This is strange.  Our BIOS has a 120 second timeout where it will wait 
for the BMC to be ready, but after that it will continue booting.  Other 
than that timeout, I wouldn't expect BMC to interfere with the BIOS in 
the DXE phase.

Have you already contacted your Intel support representative about this 
issue (or any of these issues)?

> *
> conf/machine/test_obmc.conf :*
> ...
> VRTUAL-RUNTIME_obmc-inventory-manager = "entity-manager”
> VRTUAL-RUNTIME_obmc-sensors-hwmon = "dbus-sensors”
> VRTUAL-RUNTIME_obmc-host-state-manager = "x86-power-control”
> VRTUAL-RUNTIME_obmc-chassis-state-manager = "x86-power-control”
> VRTUAL-RUNTIME_obmc-fan-control = "phosphor-pid-control”
> 
> *recipes-kernel/linux/linux-aspeed/test_obmc.cfg :*
> ...
> CONFIG_PECI=y
> ...
> 
> *My Questions :*
> - I built the sensors .conf files in /reciptes-phosphor/sensors/*. Is it 
> needed spite Entity-Manager has been configured?
> - Why isn't `/dev/peci-1` created though `CONFIG_PECI=y`?  Is it reason 
> of restarting CPU Sensor service?
CONFIG_PECI=y should create /dev/peci-0 which uses the PECI wire should 
be the default PECI device for applications like CPU sensor.  Do you 
have /dev/peci-0?

/dev/peci-1 is for PECI over MCTP which I believe is enabled with 
CONFIG_PECI_MCTP=y, but shouldn't impact basic BMC functionality if it's 
missing.

> - I defines two LED as `heartbeat` and `system-fault` inside the DTS 
> file.  What's the problem with `Phosphor LED Group Management?
> - Why all of the PWM values are invalid? I set `phosphor-pid-control`, 
> Although, There are multiple errors with PWM and tacho sensors.
> 
> 
> *journalctl output :*
> Jan 01 00:00:12 test_obmc kernel: Booting Linux on physical CPU 0x0
> Jan 01 00:00:12 test_obmc kernel: Linux version 5.15.36-8ddab47 
> (oe-user@oe-host) (arm-openbmc-linux-gnueabi-gcc (GCC) 11.3.0, GNU ld 
> (GNU Binutils) 2.38.20220313) #1 Tue May 3 06:36:43 UTC 2022
> Jan 01 00:00:12 test_obmc kernel: CPU: ARMv6-compatible processor 
> [410fb767] revision 7 (ARMv7), cr=00c5387d
> Jan 01 00:00:12 test_obmc kernel: CPU: PIPT / VIPT nonaliasing data 
> cache, VIPT nonaliasing instruction cache
> Jan 01 00:00:12 test_obmc kernel: OF: fdt: Machine model: ASRock test_obmc
> Jan 01 00:00:12 test_obmc kernel: Memory policy: Data cache writeback
> Jan 01 00:00:12 test_obmc kernel: cma: Reserved 16 MiB at 0x9d800000
> Jan 01 00:00:12 test_obmc kernel: Zone ranges:
> Jan 01 00:00:12 test_obmc kernel:   Normal  em 
> 0x0000000080000000-0x000000009effffff]
> Jan 01 00:00:12 test_obmc kernel: Movable zone start for each node
> Jan 01 00:00:12 test_obmc kernel: Early memory node ranges
> Jan 01 00:00:12 test_obmc kernel:   node   0:em 
> 0x0000000080000000-0x000000009effffff]
> Jan 01 00:00:12 test_obmc kernel: Initmem setup node 0em 
> 0x0000000080000000-0x000000009effffff]
> Jan 01 00:00:12 test_obmc kernel: Built 1 zonelists, mobility grouping 
> on.  Total pages: 125984
> Jan 01 00:00:12 test_obmc kernel: Kernel command line: 
> console=ttyS4,115200n8 root=/dev/ram rw
> Jan 01 00:00:12 test_obmc kernel: Dentry cache hash table entries: 65536 
> (order: 6, 262144 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: Inode-cache hash table entries: 32768 
> (order: 5, 131072 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: mem auto-init: stack:off, heap 
> alloc:off, heap free:off
> Jan 01 00:00:12 test_obmc kernel: Memory: 474768K/507904K available 
> (7168K kernel code, 664K rwdata, 1556K rodata, 1024K init, 160K bss, 
> 16752K reserved, 16384K cma-reserved)
> Jan 01 00:00:12 test_obmc kernel: random: get_random_u32 called from 
> __kmem_cache_create+0x30/0x400 with crng_init=0
> Jan 01 00:00:12 test_obmc kernel: SLUB: HWalign=32, Order=0-3, 
> MinObjects=0, CPUs=1, Nodes=1
> Jan 01 00:00:12 test_obmc kernel: ftrace: allocating 23765 entries in 47 
> pages
> Jan 01 00:00:12 test_obmc kernel: ftrace: allocated 47 pages with 5 groups
> Jan 01 00:00:12 test_obmc kernel: trace event string verifier disabled
> Jan 01 00:00:12 test_obmc kernel: NR_IRQS: 16, nr_irqs: 16, preallocated 
> irqs: 16
> Jan 01 00:00:12 test_obmc kernel: i2c controller registered, irq 17
> Jan 01 00:00:12 test_obmc kernel: clocksource: FTTMR010-TIMER2: mask: 
> 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 77222644334 ns
> Jan 01 00:00:12 test_obmc kernel: sched_clock: 32 bits at 24MHz, 
> resolution 40ns, wraps every 86767015915ns
> Jan 01 00:00:12 test_obmc kernel: Switching to timer-based delay loop, 
> resolution 40ns
> Jan 01 00:00:12 test_obmc kernel: Calibrating delay loop (skipped), 
> value calculated using timer frequency.. 49.50 BogoMIPS (lpj=247500)
> Jan 01 00:00:12 test_obmc kernel: pid_max: default: 32768 minimum: 301
> Jan 01 00:00:12 test_obmc kernel: Mount-cache hash table entries: 1024 
> (order: 0, 4096 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: Mountpoint-cache hash table entries: 
> 1024 (order: 0, 4096 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: CPU: Testing write buffer coherency: ok
> Jan 01 00:00:12 test_obmc kernel: Setting up static identity map for 
> 0x80100000 - 0x80100038
> Jan 01 00:00:12 test_obmc kernel: ASPEED AST2500 rev A2 (04030303)
> Jan 01 00:00:12 test_obmc kernel: devtmpfs: initialized
> Jan 01 00:00:12 test_obmc kernel: clocksource: jiffies: mask: 0xffffffff 
> max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
> Jan 01 00:00:12 test_obmc kernel: futex hash table entries: 256 (order: 
> -1, 3072 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: pinctrl core: initialized pinctrl 
> subsystem
> Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_NETLINK/PF_ROUTE 
> protocol family
> Jan 01 00:00:12 test_obmc kernel: DMA: preallocated 256 KiB pool for 
> atomic coherent allocations
> Jan 01 00:00:12 test_obmc kernel: hw-breakpoint: found 6 breakpoint and 
> 1 watchpoint registers.
> Jan 01 00:00:12 test_obmc kernel: hw-breakpoint: maximum watchpoint size 
> is 4 bytes.
> Jan 01 00:00:12 test_obmc kernel: mc: Linux media interface: v0.10
> Jan 01 00:00:12 test_obmc kernel: videodev: Linux video capture 
> interface: v2.00
> Jan 01 00:00:12 test_obmc kernel: pps_core: LinuxPPS API ver. 1 registered
> Jan 01 00:00:12 test_obmc kernel: pps_core: Software ver. 5.3.6 - 
> Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> Jan 01 00:00:12 test_obmc kernel: PTP clock support registered
> Jan 01 00:00:12 test_obmc kernel: clocksource: Switched to clocksource 
> FTTMR010-TIMER2
> Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_INET protocol family
> Jan 01 00:00:12 test_obmc kernel: IP idents hash table entries: 8192 
> (order: 4, 65536 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: tcp_listen_portaddr_hash hash table 
> entries: 512 (order: 0, 4096 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: TCP established hash table entries: 
> 4096 (order: 2, 16384 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: TCP bind hash table entries: 4096 
> (order: 2, 16384 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: TCP: Hash tables configured 
> (established 4096 bind 4096)
> Jan 01 00:00:12 test_obmc kernel: UDP hash table entries: 256 (order: 0, 
> 4096 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: UDP-Lite hash table entries: 256 
> (order: 0, 4096 bytes, linear)
> Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_UNIX/PF_LOCAL 
> protocol family
> Jan 01 00:00:12 test_obmc kernel: Unpacking initramfs...
> Jan 01 00:00:12 test_obmc kernel: workingset: timestamp_bits=30 
> max_order=17 bucket_order=0
> Jan 01 00:00:12 test_obmc kernel: squashfs: version 4.0 (2009/01/31) 
> Phillip Lougher
> Jan 01 00:00:12 test_obmc kernel: jffs2: version 2.2. (SUMMARY)  © 
> 2001-2006 Red Hat, Inc.
> Jan 01 00:00:12 test_obmc kernel: NET: Registered PF_ALG protocol family
> Jan 01 00:00:12 test_obmc kernel: gpio-794 (bmc-ready): hogged as 
> output/high
> Jan 01 00:00:12 test_obmc kernel: gpio-832 (bmc-smb): hogged as output/low
> Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised 
> raw client for channel 3
> Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised 
> IPMI client for channel 3
> Jan 01 00:00:12 test_obmc kernel: ast-kcs-bmc 1e78902c.kcs: Initialised 
> channel 3 at 0xca2
> Jan 01 00:00:12 test_obmc kernel: Serial: 8250/16550 driver, 6 ports, 
> IRQ sharing enabled
> Jan 01 00:00:12 test_obmc kernel: printk: console [ttyS4] disabled
> Jan 01 00:00:13 test_obmc kernel: 1e784000.serial: ttyS4 at MMIO 
> 0x1e784000 (irq = 31, base_baud = 1500000) is a 16550A
> Jan 01 00:00:13 test_obmc kernel: printk: console [ttyS4] enabled
> Jan 01 00:00:13 test_obmc kernel: timeriomem_rng 1e6e2078.hwrng: 32bits 
> from 0x(ptrval) @ 1us
> Jan 01 00:00:13 test_obmc kernel: random: fast init done
> Jan 01 00:00:13 test_obmc kernel: random: crng init done
> Jan 01 00:00:13 test_obmc kernel: loop: module loaded
> Jan 01 00:00:13 test_obmc kernel: spi-nor spi0.0: w25q512jv (65536 Kbytes)
> Jan 01 00:00:13 test_obmc kernel: spi-aspeed-smc 1e620000.spi: CE0 read 
> buswidth:2 [0x203c0641]
> Jan 01 00:00:13 test_obmc kernel: 5 fixed-partitions partitions found on 
> MTD device bmc
> Jan 01 00:00:13 test_obmc kernel: Creating 5 MTD partitions on "bmc":
> Jan 01 00:00:13 test_obmc kernel: 0x000000000000-0x0000000e0000 : "u-boot"
> Jan 01 00:00:13 test_obmc kernel: 0x0000000e0000-0x000000100000 : 
> "u-boot-env"
> Jan 01 00:00:13 test_obmc kernel: 0x000000100000-0x000000a00000 : "kernel"
> Jan 01 00:00:13 test_obmc kernel: 0x000000a00000-0x000002a00000 : "rofs"
> Jan 01 00:00:13 test_obmc kernel: 0x000002a00000-0x000004000000 : "rwfs"
> Jan 01 00:00:13 test_obmc kernel: spi-nor spi1.0: unrecognized JEDEC id 
> bytes: 00 00 00 00 00 00
> Jan 01 00:00:13 test_obmc kernel: spi-nor: probe of spi1.0 failed with 
> error -2
> Jan 01 00:00:13 test_obmc kernel: ftgmac100 1e660000.ethernet: Generated 
> random MAC address 2e:28:4e:8b:ce:8a
> Jan 01 00:00:13 test_obmc kernel: RTL8211E Gigabit Ethernet 
> 1e660000.ethernet--1:00: attached PHY driver 
> (mii_bus:phy_addr=1e660000.ethernet--1:00, irq=POLL)
> Jan 01 00:00:13 test_obmc kernel: ftgmac100 1e660000.ethernet eth0: irq 
> 20, mapped at f4c72443
> Jan 01 00:00:13 test_obmc kernel: aspeed_vhub 1e6a0000.usb-vhub: 
> Initialized virtual hub in USB2 mode
> Jan 01 00:00:13 test_obmc kernel: Mass Storage Function, version: 2009/09/11
> Jan 01 00:00:13 test_obmc kernel: LUN: removable file: (no medium)
> Jan 01 00:00:13 test_obmc kernel: no file given for LUN0
> Jan 01 00:00:13 test_obmc kernel: udc 1e6a0000.usb-vhub:p1: failed to 
> start g_mass_storage: -22
> Jan 01 00:00:13 test_obmc kernel: i2c_dev: i2c /dev entries driver
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a040.i2c-bus: i2c 
> bus 0 registered, irq 33
> Jan 01 00:00:13 test_obmc kernel: at24 1-0053: 16384 byte 24c128 EEPROM, 
> writable, 64 bytes/write
> Jan 01 00:00:13 test_obmc kernel: pca953x 1-001c: using no AI
> Jan 01 00:00:13 test_obmc kernel: pca953x 1-001c: failed writing register
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a080.i2c-bus: i2c 
> bus 1 registered, irq 34
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a0c0.i2c-bus: i2c 
> bus 2 registered, irq 35
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a100.i2c-bus: i2c 
> bus 3 registered, irq 36
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a140.i2c-bus: i2c 
> bus 4 registered, irq 37
> Jan 01 00:00:13 test_obmc kernel: Freeing initrd memory: 1084K
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a180.i2c-bus: i2c 
> bus 5 registered, irq 38
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a1c0.i2c-bus: i2c 
> bus 6 registered, irq 39
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a300.i2c-bus: i2c 
> bus 7 registered, irq 40
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a340.i2c-bus: i2c 
> bus 8 registered, irq 41
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a380.i2c-bus: i2c 
> bus 9 registered, irq 42
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a3c0.i2c-bus: i2c 
> bus 10 registered, irq 43
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a400.i2c-bus: i2c 
> bus 11 registered, irq 44
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a440.i2c-bus: i2c 
> bus 12 registered, irq 45
> Jan 01 00:00:13 test_obmc kernel: aspeed-i2c-bus 1e78a480.i2c-bus: i2c 
> bus 13 registered, irq 46
> Jan 01 00:00:13 test_obmc kernel: pca954x 4-0038: probe failed
> Jan 01 00:00:13 test_obmc kernel: pca954x 5-0038: probe failed
> Jan 01 00:00:13 test_obmc kernel: pca954x 12-0071: probe failed
> Jan 01 00:00:13 test_obmc kernel: Driver for 1-wire Dallas network protocol.
> Jan 01 00:00:13 test_obmc kernel: SPI driver bmp280 has no spi_device_id 
> for bosch,bmp085
> Jan 01 00:00:13 test_obmc kernel: NET: Registered PF_INET6 protocol family
> Jan 01 00:00:13 test_obmc kernel: Segment Routing with IPv6
> Jan 01 00:00:13 test_obmc kernel: In-situ OAM (IOAM) with IPv6
> Jan 01 00:00:13 test_obmc kernel: NET: Registered PF_PACKET protocol family
> Jan 01 00:00:13 test_obmc kernel: 8021q: 802.1Q VLAN Support v1.8
> Jan 01 00:00:13 test_obmc kernel: printk: console [netcon0] enabled
> Jan 01 00:00:13 test_obmc kernel: netconsole: network logging started
> Jan 01 00:00:13 test_obmc kernel: Freeing unused kernel image (initmem) 
> memory: 1024K
> Jan 01 00:00:13 test_obmc kernel: Checked W+X mappings: passed, no W+X 
> pages found
> Jan 01 00:00:13 test_obmc kernel: Run /init as init process
> Jan 01 00:00:13 test_obmc kernel: jffs2: notice: (100) 
> jffs2_build_xattr_subsystem: complete building xattr subsystem, 20 of 
> xdatum (19 unchecked, 1 orphan) and 27 of xref (1 dead, 0 orphan) found.
> Jan 01 00:00:13 test_obmc kernel: overlayfs: upper fs does not support 
> tmpfile.
> Jan 01 00:00:13 test_obmc kernel: overlayfs: upper fs does not support 
> RENAME_WHITEOUT.
> Jan 01 00:00:13 test_obmc systemd[1]: Failed to look up module alias 
> 'autofs4': Function not implemented
> Jan 01 00:00:13 test_obmc systemd[1]: systemd 250 running in system mode 
> (+PAM -AUDIT -SELINUX -APPARMOR -IMA -SMACK +SECCOMP -GCRYPT -GNUTLS 
> -OPENSSL -ACL +BLKID -CURL -ELFUTILS -FIDO2 -IDN2 -IDN -IPTC +KMOD 
> -LIBCRYPTSETUP +LIBFDISK -PCRE2 -PWQUALITY -P11KIT -QRENCODE -BZIP2 -LZ4 
> -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON -UTMP +SYSVINIT 
> default-hierarchy=hybrid)
> Jan 01 00:00:13 test_obmc systemd[1]: Detected architecture arm.
> Jan 01 00:00:13 test_obmc systemd[1]: Hostname set to <test_obmc>.
> Jan 01 00:00:13 test_obmc systemd[111]: 
> /lib/systemd/system-generators/systemd-gpt-auto-generator failed with 
> exit status 1.
> Jan 01 00:00:13 test_obmc systemd[1]: 
> /lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, 
> ignoring: sys-subsystem-net-devices-%i.device
> Jan 01 00:00:13 test_obmc systemd[1]: Queued start job for default 
> target Multi-User System.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/getty.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/mapper-wait.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice /system/modprobe.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/obmc-led-group-start.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/phosphor-certificate-manager.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/phosphor-ipmi-kcs.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/phosphor-ipmi-net.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/serial-getty.
> Jan 01 00:00:13 test_obmc systemd[1]: Created slice Slice 
> /system/xyz.openbmc_project.Chassis.Control.Power.
> Jan 01 00:00:13 test_obmc systemd[1]: Started Dispatch Password Requests 
> to Console Directory Watch.
> Jan 01 00:00:13 test_obmc systemd[1]: Started Forward Password Requests 
> to Wall Directory Watch.
> Jan 01 00:00:13 test_obmc systemd[1]: Reached target Path Units.
> Jan 01 00:00:13 test_obmc systemd[1]: Reached target Remote File Systems.
> Jan 01 00:00:13 test_obmc systemd[1]: Reached target Slice Units.
> Jan 01 00:00:13 test_obmc systemd[1]: Reached target Swaps.
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on Syslog Socket.
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on Process Core Dump Socket.
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on initctl Compatibility 
> Named Pipe.
> Jan 01 00:00:13 test_obmc systemd[1]: Journal Audit Socket was skipped 
> because of a failed condition check (ConditionSecurity=audit).
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on Journal Socket 
> (/dev/log).
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on Journal Socket.
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on Network Service 
> Netlink Socket.
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on udev Control Socket.
> Jan 01 00:00:13 test_obmc systemd[1]: Listening on udev Kernel Socket.
> Jan 01 00:00:13 test_obmc systemd[1]: Huge Pages File System was skipped 
> because of a failed condition check 
> (ConditionPathExists=/sys/kernel/mm/hugepages).
> Jan 01 00:00:13 test_obmc systemd[1]: POSIX Message Queue File System 
> was skipped because of a failed condition check 
> (ConditionPathExists=/proc/sys/fs/mqueue).
> Jan 01 00:00:13 test_obmc systemd[1]: Mounting Kernel Debug File System...
> Jan 01 00:00:13 test_obmc systemd[1]: Mounting Kernel Trace File System...
> Jan 01 00:00:13 test_obmc systemd[1]: Mounting Temporary Directory /tmp...
> Jan 01 00:00:13 test_obmc systemd[1]: Create List of Static Device Nodes 
> was skipped because of a failed condition check 
> (ConditionFileNotEmpty=/lib/modules/5.15.36-8ddab47/modules.devname).
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Load Kernel Module 
> configfs...
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Load Kernel Module fuse...
> Jan 01 00:00:13 test_obmc systemd[1]: File System Check on Root Device 
> was skipped because of a failed condition check 
> (ConditionPathIsReadWrite=!/).
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Journal Service...
> Jan 01 00:00:13 test_obmc systemd[1]: Load Kernel Modules was skipped 
> because all trigger condition checks failed.
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Generate network units 
> from Kernel command line...
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Remount Root and Kernel 
> File Systems...
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Apply Kernel Variables...
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Coldplug All udev Devices...
> Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Debug File System.
> Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Trace File System.
> Jan 01 00:00:13 test_obmc systemd[1]: Mounted Temporary Directory /tmp.
> Jan 01 00:00:13 test_obmc systemd[1]: modprobe@configfs.service: 
> Deactivated successfully.
> Jan 01 00:00:13 test_obmc systemd[1]: Finished Load Kernel Module configfs.
> Jan 01 00:00:13 test_obmc systemd[1]: modprobe@fuse.service: Deactivated 
> successfully.
> Jan 01 00:00:13 test_obmc systemd[1]: Finished Load Kernel Module fuse.
> Jan 01 00:00:13 test_obmc systemd[1]: Finished Generate network units 
> from Kernel command line.
> Jan 01 00:00:13 test_obmc systemd[1]: Finished Remount Root and Kernel 
> File Systems.
> Jan 01 00:00:13 test_obmc systemd[1]: Finished Apply Kernel Variables.
> Jan 01 00:00:13 test_obmc systemd[1]: Reached target Preparation for 
> Network.
> Jan 01 00:00:13 test_obmc systemd[1]: FUSE Control File System was 
> skipped because of a failed condition check 
> (ConditionPathExists=/sys/fs/fuse/connections).
> Jan 01 00:00:13 test_obmc systemd[1]: Mounting Kernel Configuration File 
> System...
> Jan 01 00:00:13 test_obmc systemd[1]: Rebuild Hardware Database was 
> skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
> Jan 01 00:00:13 test_obmc systemd[1]: Platform Persistent Storage 
> Archival was skipped because of a failed condition check 
> (ConditionDirectoryNotEmpty=/sys/fs/pstore).
> Jan 01 00:00:13 test_obmc systemd[1]: Create System Users was skipped 
> because of a failed condition check (ConditionNeedsUpdate=/etc).
> Jan 01 00:00:13 test_obmc systemd[1]: Starting Create Static Device 
> Nodes in /dev...
> Jan 01 00:00:13 test_obmc systemd[1]: Mounted Kernel Configuration File 
> System.
> Jan 01 00:00:13 test_obmc systemd[1]: Finished Create Static Device 
> Nodes in /dev.
> Jan 01 00:00:13 test_obmc systemd[1]: Reached target Preparation for 
> Local File Systems.
> Jan 01 00:00:13 test_obmc systemd[1]: Mounting /var/volatile...
> Jan 01 00:00:13 test_obmc systemd-journald[125]: Journal started
> Jan 01 00:00:13 test_obmc systemd-journald[125]: Runtime Journal 
> (/run/log/journal/96af4eacf7ca4faa85a8bdc626516057) is 8.0M, max 64.0M, 
> 56.0M free.
> Jan 01 00:00:12 test_obmc systemd-sysctl[128]: Couldn't write '16' to 
> 'kernel/sysrq', ignoring: No such file or directory
> Jan 01 00:00:13 test_obmc systemd-tmpfiles[135]: 
> ]8;;file://test_obmc/usr/lib/tmpfiles.d/dbus.conf/usr/lib/tmpfiles.d/dbus.conf]8;;:13: Line references path below legacy directory /var/run/, updating /var/run/dbus/containers → /run/dbus/containers; please update the tmpfiles.d/ drop-in file accordingly.
> Jan 01 00:00:14 test_obmc systemd[1]: Starting Rule-based Manager for 
> Device Events and Files...
> Jan 01 00:00:14 test_obmc systemd[1]: Started Journal Service.
> Jan 01 00:00:14 test_obmc systemd[1]: Mounted /var/volatile.
> Jan 01 00:00:14 test_obmc systemd[1]: Starting Flush Journal to 
> Persistent Storage...
> Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/cache was 
> skipped because of a failed condition check 
> (ConditionPathIsReadWrite=!/var/cache).
> Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/lib was 
> skipped because of a failed condition check 
> (ConditionPathIsReadWrite=!/var/lib).
> Jan 01 00:00:14 test_obmc systemd[1]: Starting Load/Save Random Seed...
> Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /var/spool was 
> skipped because of a failed condition check 
> (ConditionPathIsReadWrite=!/var/spool).
> Jan 01 00:00:14 test_obmc systemd[1]: Bind mount volatile /srv was 
> skipped because of a failed condition check 
> (ConditionPathIsReadWrite=!/srv).
> Jan 01 00:00:14 test_obmc systemd[1]: Reached target Local File Systems.
> Jan 01 00:00:14 test_obmc systemd-journald[125]: Runtime Journal 
> (/run/log/journal/96af4eacf7ca4faa85a8bdc626516057) is 8.0M, max 64.0M, 
> 56.0M free.
> Jan 01 00:00:14 test_obmc systemd-journald[125]: Received client request 
> to flush runtime journal.
> Jan 01 00:00:14 test_obmc systemd[1]: Finished Flush Journal to 
> Persistent Storage.
> Jan 01 00:00:14 test_obmc systemd[1]: Starting Create Volatile Files and 
> Directories...
> Jan 01 00:00:14 test_obmc systemd[1]: Finished Load/Save Random Seed.
> Jan 01 00:00:15 test_obmc systemd[1]: First Boot Complete was skipped 
> because of a failed condition check (ConditionFirstBoot=yes).
> Jan 01 00:00:15 test_obmc systemd[1]: Commit a transient machine-id on 
> disk was skipped because of a failed condition check 
> (ConditionPathIsMountPoint=/etc/machine-id).
> Jan 01 00:00:15 test_obmc systemd-tmpfiles[141]: 
> ]8;;file://test/usr/lib/tmpfiles.d/dbus.conf/usr/lib/tmpfiles.d/dbus.conf]8;;:13: Line references path below legacy directory /var/run/, updating /var/run/dbus/containers → /run/dbus/containers; please update the tmpfiles.d/ drop-in file accordingly.
> Jan 01 00:00:15 test_obmc systemd[1]: Finished Create Volatile Files and 
> Directories.
> Jan 01 00:00:15 test_obmc systemd[1]: Rebuild Journal Catalog was 
> skipped because of a failed condition check (ConditionNeedsUpdate=/var).
> Jan 01 00:00:15 test_obmc systemd[1]: Update is Completed was skipped 
> because all trigger condition checks failed.
> Jan 01 00:00:16 test_obmc systemd[1]: Started Rule-based Manager for 
> Device Events and Files.
> Jan 01 00:00:16 test_obmc systemd[1]: Starting Network Configuration...
> Jan 01 00:00:17 test_obmc systemd[1]: Finished Coldplug All udev Devices.
> Jan 01 00:00:17 test_obmc systemd[1]: Starting Wait for udev To Complete 
> Device Initialization...
> Jan 01 00:00:18 test_obmc systemd-udevd[142]: Using default interface 
> naming scheme 'v250'.
> Jan 01 00:00:21 test_obmc systemd[1]: Found device 
> /sys/subsystem/net/devices/eth0.
> Jan 01 00:00:22 test_obmc udevadm[149]: systemd-udev-settle.service is 
> deprecated. Please fix rngd.service not to pull it in.
> Jan 01 00:00:22 test_obmc systemd[1]: Finished Wait for udev To Complete 
> Device Initialization.
> Jan 01 00:00:22 test_obmc systemd-networkd[148]: lo: Link UP
> Jan 01 00:00:22 test_obmc systemd-networkd[148]: lo: Gained carrier
> Jan 01 00:00:22 test_obmc systemd-networkd[148]: Enumeration completed
> Jan 01 00:00:22 test_obmc systemd[1]: Started Network Configuration.
> Jan 01 00:00:22 test_obmc systemd-networkd[148]: eth0: Link UP
> Jan 01 00:00:22 test_obmc systemd[1]: Created slice Slice 
> /system/xyz.openbmc_project.led.controller.
> Jan 01 00:00:22 test_obmc systemd[1]: Reached target Hardware activated 
> USB gadget.
> Jan 01 00:00:22 test_obmc systemd[1]: Huge Pages File System was skipped 
> because of a failed condition check 
> (ConditionPathExists=/sys/kernel/mm/hugepages).
> Jan 01 00:00:22 test_obmc systemd[1]: POSIX Message Queue File System 
> was skipped because of a failed condition check 
> (ConditionPathExists=/proc/sys/fs/mqueue).
> Jan 01 00:00:22 test_obmc systemd[1]: Create List of Static Device Nodes 
> was skipped because of a failed condition check 
> (ConditionFileNotEmpty=/lib/modules/5.15.36-8ddab47/modules.devname).
> Jan 01 00:00:22 test_obmc systemd[1]: Starting Load Kernel Module fuse...
> Jan 01 00:00:22 test_obmc systemd[1]: Started Hardware RNG Entropy 
> Gatherer Daemon.
> Jan 01 00:00:22 test_obmc systemd[1]: Rebuild Hardware Database was 
> skipped because of a failed condition check (ConditionNeedsUpdate=/etc).
> Jan 01 00:00:22 test_obmc systemd[1]: Rebuild Journal Catalog was 
> skipped because of a failed condition check (ConditionNeedsUpdate=/var).
> Jan 01 00:00:22 test_obmc systemd[1]: Commit a transient machine-id on 
> disk was skipped because of a failed condition check 
> (ConditionPathIsMountPoint=/etc/machine-id).
> Jan 01 00:00:22 test_obmc systemd[1]: Load Kernel Modules was skipped 
> because all trigger condition checks failed.
> Jan 01 00:00:22 test_obmc systemd[1]: Starting Wait for Network to be 
> Configured...
> Jan 01 00:00:22 test_obmc systemd[1]: Platform Persistent Storage 
> Archival was skipped because of a failed condition check 
> (ConditionDirectoryNotEmpty=/sys/fs/pstore).
> Jan 01 00:00:22 test_obmc systemd[1]: Create System Users was skipped 
> because of a failed condition check (ConditionNeedsUpdate=/etc).
> Jan 01 00:00:23 test_obmc systemd[1]: Starting Network Name Resolution...
> Jan 01 00:00:23 test_obmc systemd[1]: Update is Completed was skipped 
> because all trigger condition checks failed.
> Jan 01 00:00:23 test_obmc systemd[1]: modprobe@fuse.service: Deactivated 
> successfully.
> Jan 01 00:00:23 test_obmc systemd[1]: Finished Load Kernel Module fuse.
> Jan 01 00:00:23 test_obmc systemd[1]: FUSE Control File System was 
> skipped because of a failed condition check 
> (ConditionPathExists=/sys/fs/fuse/connections).
> Jan 01 00:00:23 test_obmc systemd[1]: Reached target System Initialization.
> Jan 01 00:00:23 test_obmc systemd[1]: logrotate.timer: Not using 
> persistent file timestamp Thu 1970-01-01 00:00:32 UTC as it is in the 
> future.
> Jan 01 00:00:23 test_obmc systemd[1]: Started Daily rotation of log files.
> Jan 01 00:00:23 test_obmc systemd[1]: Started Daily Cleanup of Temporary 
> Directories.
> Jan 01 00:00:23 test_obmc systemd[1]: Reached target Timer Units.
> Jan 01 00:00:23 test_obmc systemd[1]: Listening on Avahi mDNS/DNS-SD 
> Stack Activation Socket.
> Jan 01 00:00:23 test_obmc systemd[1]: Listening on BMC Webserver socket.
> Jan 01 00:00:23 test_obmc systemd[1]: Listening on D-Bus System Message 
> Bus Socket.
> Jan 01 00:00:23 test_obmc systemd[1]: Listening on dropbear.socket.
> Jan 01 00:00:23 test_obmc systemd[1]: Listening on Phosphor Host Console 
> SSH Per-Connection socket.
> Jan 01 00:00:24 test_obmc systemd[1]: Listening on 
> phosphor-ipmi-net@eth0.socket.
> Jan 01 00:00:24 test_obmc systemd[1]: Reached target Socket Units.
> Jan 01 00:00:24 test_obmc systemd[1]: Starting D-Bus System Message Bus...
> Jan 01 00:00:24 test_obmc kernel: ftgmac100 1e660000.ethernet eth0: Link 
> is Up - 100Mbps/Full - flow control rx/tx
> Jan 01 00:00:24 test_obmc kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eth0: 
> link becomes ready
> Jan 01 00:00:24 test_obmc systemd-networkd[148]: eth0: Gained carrier
> Jan 01 00:00:25 test_obmc rngd[163]: Initializing available sources
> Jan 01 00:00:25 test_obmc rngd[163]: [hwrng ]: Initialized
> Jan 01 00:00:26 test_obmc systemd[1]: Started D-Bus System Message Bus.
> Jan 01 00:00:26 test_obmc systemd-networkd[148]: eth0: Gained IPv6LL
> Jan 01 00:00:26 test_obmc systemd[1]: Reached target Basic System.
> Jan 01 00:00:26 test_obmc systemd[1]: System is tainted: cgroupsv1
> Jan 01 00:00:26 test_obmc dbus-broker-lau[170]: Ready
> Jan 01 00:00:26 test_obmc systemd[1]: Starting Clear one time boot 
> overrides...
> Jan 01 00:00:26 test_obmc systemd[1]: Starting SSH Key Generation...
> Jan 01 00:00:26 test_obmc systemd[1]: Started LPC Snoop Daemon.
> Jan 01 00:00:26 test_obmc systemd[1]: Starting Name Service Cache Daemon...
> Jan 01 00:00:26 test_obmc systemd[1]: Started Phosphor Dump core monitor..
> Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate 
> manager for authority.
> Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate 
> manager for bmcweb.
> Jan 01 00:00:27 test_obmc systemd[1]: Started Phosphor certificate 
> manager for nslcd.
> Jan 01 00:00:27 test_obmc systemd[1]: Starting BMC health monitoring...
> Jan 01 00:00:27 test_obmc systemd-networkd[148]: eth0: DHCPv4 address 
> 192.168.200.5/20, gateway 192.168.192.1 acquired from 192.168.192.1
> Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/passwd': No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/passwd'; 
> will try again later: No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/group': No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/group'; 
> will try again later: No such file or directory
> Jan 01 00:00:27 test_obmc systemd[1]: Starting OpenBMC ipKVM daemon...
> Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/hosts': No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file `/hosts'; 
> will try again later: No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/resolv.conf': No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file 
> `/resolv.conf'; will try again later: No such file or directory
> Jan 01 00:00:27 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/services': No such file or directory
> Jan 01 00:00:28 test_obmc systemd[1]: Starting Enable Linux trace events 
> in the boot loader...
> Jan 01 00:00:27 test_obmc nscd[182]: 182 stat failed for file 
> `/services'; will try again later: No such file or directory
> Jan 01 00:00:28 test_obmc systemd[1]: Starting Intel Power Control for 
> the Host 0...
> Jan 01 00:00:28 test_obmc systemd-resolved[165]: Positive Trust Anchors:
> Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/nsswitch.conf': No such file or directory
> Jan 01 00:00:28 test_obmc systemd-resolved[165]: . IN DS 20326 8 2 
> e06d44b80b8f1d39a95c0b0d7c65d08458e880409bbc683457104237c7f8ec8d
> Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file 
> `/nsswitch.conf'; will try again later: No such file or directory
> Jan 01 00:00:28 test_obmc systemd-resolved[165]: Negative trust anchors: 
> home.arpa 10.in-addr.arpa 16.172.in-addr.arpa 17.172.in-addr.arpa 
> 18.172.in-addr.arpa 19.172.in-addr.arpa 20.172.in-addr.arpa 
> 21.172.in-addr.arpa 22.172.in-addr.arpa 23.172.in-addr.arpa 
> 24.172.in-addr.arpa 25.172.in-addr.arpa 26.172.in-addr.arpa 
> 27.172.in-addr.arpa 28.172.in-addr.arpa 29.172.in-addr.arpa 
> 30.172.in-addr.arpa 31.172.in-addr.arpa 168.192.in-addr.arpa 
> d.f.ip6.arpa corp home internal intranet lan local private test
> Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/nsswitch.conf': No such file or directory
> Jan 01 00:00:28 test_obmc systemd[1]: Starting Phosphor Dump Manager...
> Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file 
> `/nsswitch.conf'; will try again later: No such file or directory
> Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/nsswitch.conf': No such file or directory
> Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file 
> `/nsswitch.conf'; will try again later: No such file or directory
> Jan 01 00:00:28 test_obmc nscd[182]: 182 disabled inotify-based 
> monitoring for file `/nsswitch.conf': No such file or directory
> Jan 01 00:00:28 test_obmc nscd[182]: 182 stat failed for file 
> `/nsswitch.conf'; will try again later: No such file or directory
> Jan 01 00:00:28 test_obmc systemd[1]: Starting Entity Manager...
> Jan 01 00:00:28 test_obmc systemd[1]: Started Fru Device.
> Jan 01 00:00:28 test_obmc systemd-resolved[165]: Using system hostname 
> 'test_obmc'.
> Jan 01 00:00:28 test_obmc nscd[182]: 182 cannot write to database file 
> /var/db/nscd/passwd: Invalid argument
> Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor Log Manager...
> Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor DBus Service 
> Discovery Manager...
> Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor Settings Daemon...
> Jan 01 00:00:29 test_obmc systemd[1]: Starting Phosphor Download Manager...
> Jan 01 00:00:29 test_obmc nscd[182]: 182 cannot write to database file 
> /var/db/nscd/group: Invalid argument
> Jan 01 00:00:29 test_obmc systemd[1]: Starting Post code manager...
> Jan 01 00:00:29 test_obmc systemd[1]: Starting Rsyslog config updater...
> Jan 01 00:00:30 test_obmc systemd[1]: Starting Telemetry...
> Jan 01 00:00:30 test_obmc nscd[182]: 182 cannot write to database file 
> /var/db/nscd/hosts: Invalid argument
> Jan 01 00:00:30 test_obmc systemd[1]: Starting Phosphor User Manager...
> Jan 01 00:00:30 test_obmc systemd[1]: Started Phosphor sysfs LED controller.
> Jan 01 00:00:30 test_obmc systemd[1]: Started Phosphor sysfs LED controller.
> Jan 01 00:00:31 test_obmc nscd[182]: 182 cannot write to database file 
> /var/db/nscd/services: Invalid argument
> Jan 01 00:00:32 test_obmc systemd[1]: Started Network Name Resolution.
> Jan 01 00:00:32 test_obmc systemd[1]: Finished Wait for Network to be 
> Configured.
> Jan 01 00:00:33 test_obmc systemd[1]: Finished SSH Key Generation.
> Jan 01 00:00:33 test_obmc systemd[1]: Started Name Service Cache Daemon.
> Jan 01 00:00:33 test_obmc systemd[1]: Started OpenBMC ipKVM daemon.
> Jan 01 00:00:33 test_obmc systemd[1]: trace-enable.service: Deactivated 
> successfully.
> Jan 01 00:00:33 test_obmc systemd[1]: Finished Enable Linux trace events 
> in the boot loader.
> Jan 01 00:00:34 test_obmc systemd[1]: Reached target Network.
> Jan 01 00:00:34 test_obmc systemd[1]: Reached target Network is Online.
> Jan 01 00:00:34 test_obmc systemd[1]: Reached target Host and Network 
> Name Lookups.
> Jan 01 00:00:34 test_obmc post-code-manager[202]: Start post code 
> manager service...
> Jan 01 00:00:34 test_obmc systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
> Jan 01 00:00:34 test_obmc health-monitor[181]: Path 
> /xyz/openbmc_project/inventory does not exist in ObjectMapper, cannot 
> create association
> Jan 01 00:00:35 test_obmc systemd[1]: Started Start bmcweb server.
> Jan 01 00:00:35 test_obmc telemetry[204]: Telemetry starting
> Jan 01 00:00:35 test_obmc systemd[1]: Starting LDAP daemon...
> Jan 01 00:00:35 test_obmc systemd[1]: Starting System Logging Service...
> Jan 01 00:00:35 test_obmc systemd[1]: Started Lightweight SLP Server.
> Jan 01 00:00:36 test_obmc systemd[1]: Starting Permit User Sessions...
> Jan 01 00:00:36 test_obmc phosphor-certificate-manager[179]: Certificate 
> install
> Jan 01 00:00:36 test_obmc health-monitor[181]: CPU Health Sensor initialized
> Jan 01 00:00:36 test_obmc health-monitor[181]: CPU Health Sensor created
> Jan 01 00:00:36 test_obmc health-monitor[181]: Memory Health Sensor 
> initialized
> Jan 01 00:00:36 test_obmc health-monitor[181]: Memory Health Sensor created
> Jan 01 00:00:36 test_obmc health-monitor[181]: Storage_RW Health Sensor 
> initialized
> Jan 01 00:00:36 test_obmc power-control[185]: Start Chassis power 
> control service for host : 0
> Jan 01 00:00:36 test_obmc health-monitor[181]: Storage_RW Health Sensor 
> created
> Jan 01 00:00:36 test_obmc post-code-manager[202]: PostCode is created
> Jan 01 00:00:37 test_obmc systemd[1]: Finished Clear one time boot 
> overrides.
> Jan 01 00:00:37 test_obmc power-control[185]: SIO control GPIOs not 
> defined, disable SIO support.
> Jan 01 00:00:37 test_obmc systemd[1]: Started Post code manager.
> Jan 01 00:00:37 test_obmc power-control[185]: BMC_NMI set to 0
> Jan 01 00:00:37 test_obmc health-monitor[181]: ASSERT: sensor CPU is 
> above the upper threshold critical high
> Jan 01 00:00:37 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N set to 1
> Jan 01 00:00:37 test_obmc power-control[185]: RST_BMC_RSTBTN_OUT_N set to 1
> Jan 01 00:00:37 test_obmc power-control[185]: PowerControl: power 
> restore policy applied
> Jan 01 00:00:37 test_obmc systemd[1]: Finished Permit User Sessions.
> Jan 01 00:00:37 test_obmc power-control[185]: NMI Source Property Monitor
> Jan 01 00:00:37 test_obmc power-control[185]: Initializing power state.
> Jan 01 00:00:37 test_obmc power-control[185]: Host0: Moving to "Off" state
> Jan 01 00:00:37 test_obmc post-code-manager[202]: HostState changed to 
> OFF. Empty postcode log, keep boot cycle at 0
> Jan 01 00:00:37 test_obmc systemd[1]: Started BMC health monitoring.
> Jan 01 00:00:37 test_obmc power-control[185]: RestartCause set to 
> xyz.openbmc_project.State.Host.RestartCause.Unknown
> Jan 01 00:00:38 test_obmc systemd[1]: Started Rsyslog config updater.
> Jan 01 00:00:38 test_obmc systemd[1]: Started Telemetry.
> Jan 01 00:00:38 test_obmc phosphor-user-manager[207]: Group not found
> Jan 01 00:00:38 test_obmc systemd[1]: Started Phosphor Download Manager.
> Jan 01 00:00:38 test_obmc systemd[1]: Started Phosphor DBus Service 
> Discovery Manager.
> Jan 01 00:00:38 test_obmc systemd[1]: Started Phosphor Log Manager.
> Jan 01 00:00:38 test_obmc power-control[185]: Invoking Power Restore 
> Policy xyz.openbmc_project.Control.Power.RestorePolicy.Policy.Restore
> Jan 01 00:00:38 test_obmc power-control[185]: Power was dropped, 
> restoring Host On state
> Jan 01 00:00:38 test_obmc power-control[185]: powerStateOff: power-on 
> request event received
> Jan 01 00:00:38 test_obmc power-control[185]: power supply power OK 
> watchdog timer started
> Jan 01 00:00:38 test_obmc power-control[185]: Host0: Moving to "Wait for 
> Power Supply Power OK" state
> Jan 01 00:00:38 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N set to 0
> Jan 01 00:00:38 test_obmc power-control[185]: RestartCause set to 
> xyz.openbmc_project.State.Host.RestartCause.PowerPolicyPreviousState
> Jan 01 00:00:39 test_obmc systemd[1]: Started Intel Power Control for 
> the Host 0.
> Jan 01 00:00:39 test_obmc power-control[185]: FM_BMC_PWRBTN_OUT_N released
> Jan 01 00:00:39 test_obmc systemd[1]: Started Phosphor Dump Manager.
> Jan 01 00:00:39 test_obmc systemd[1]: Started Phosphor Settings Daemon.
> Jan 01 00:00:39 test_obmc systemd[1]: Started Entity Manager.
> Jan 01 00:00:39 test_obmc fru-device[189]: device at bus 1 address 76 busy
> Jan 01 00:00:39 test_obmc systemd[1]: Started Phosphor User Manager.
> Jan 01 00:00:39 test_obmc systemd[1]: Reached target Phosphor Object Mapper.
> Jan 01 00:00:39 test_obmc systemd[1]: Getty on tty1 was skipped because 
> of a failed condition check (ConditionPathExists=/dev/tty0).
> Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/control/host0/boot/one_time...
> Jan 01 00:00:40 test_obmc power-control[185]: 
> powerStateWaitForPSPowerOK: power supply power OK assert event received
> Jan 01 00:00:40 test_obmc power-control[185]: Host0: Moving to "On" state
> Jan 01 00:00:40 test_obmc power-control[185]: power supply power OK 
> watchdog timer canceled
> Jan 01 00:00:40 test_obmc power-control[185]: POH timer started
> Jan 01 00:00:40 test_obmc power-control[185]: Host system DC power is on
> Jan 01 00:00:40 test_obmc fru-device[189]: device at bus 2 address 76 busy
> Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/control/host0/boot...
> Jan 01 00:00:40 test_obmc obmc-ikvm[221]: 01/01/1970 00:00:40 Listening 
> for VNC connections on TCP port 5900
> Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/control/host0/power_restore_policy...
> Jan 01 00:00:40 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/control/host0/restriction_mode...
> Jan 01 00:00:41 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/led/groups/bmc_booted...
> Jan 01 00:00:41 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/time/sync_method...
> Jan 01 00:00:41 test_obmc avahi-daemon[240]: Found user 'avahi' (UID 
> 996) and group 'avahi' (GID 995).
> Jan 01 00:00:41 test_obmc rsyslogd[229]: imuxsock: Acquired UNIX socket 
> '/run/systemd/journal/syslog' (fd 3) from systemd.  [v8.2202.0]
> Jan 01 00:00:41 test_obmc rsyslogd[229]: [origin software="rsyslogd" 
> swVersion="8.2202.0" x-pid="229" x-info="https://www.rsyslog.com"] start
> Jan 01 00:00:41 test_obmc systemd[1]: Started Phosphor-Pid-Control 
> Margin-based Fan Control Daemon.
> Jan 01 00:00:42 test_obmc systemd[1]: Started phosphor systemd target 
> monitor.
> Jan 01 00:00:42 test_obmc systemd[1]: Starting Ramoops monitor....
> Jan 01 00:00:42 test_obmc systemd[1]: Started Serial Getty on ttyS4.
> Jan 01 00:00:42 test_obmc systemd[1]: Reached target Login Prompts.
> Jan 01 00:00:43 test_obmc systemd[1]: Starting Phosphor LED Group 
> Management Daemon...
> Jan 01 00:00:43 test_obmc systemd[1]: Starting Phosphor Network Manager...
> Jan 01 00:00:43 test_obmc systemd[1]: Starting OpenBMC Software Update 
> Manager...
> Jan 01 00:00:44 test_obmc systemd[1]: Starting Phosphor BMC State Manager...
> Jan 01 00:00:44 test_obmc systemd[1]: Started Adc Sensor.
> Jan 01 00:00:44 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:00:44 test_obmc systemd[1]: Started Exit Air Temp Sensor.
> Jan 01 00:00:45 test_obmc systemd[1]: Started External Sensor.
> Jan 01 00:00:45 test_obmc systemd[1]: Started Fan Sensor.
> Jan 01 00:00:46 test_obmc nscd[182]: 182 checking for monitored file 
> `/nsswitch.conf': No such file or directory
> Jan 01 00:00:46 test_obmc nscd[182]: 182 checking for monitored file 
> `/passwd': No such file or directory
> Jan 01 00:00:46 test_obmc systemd[1]: Started Hwmon Temp Sensor.
> Jan 01 00:00:46 test_obmc phosphor-image-updater[262]: Error in mapper 
> GetSubTreePath: sd_bus_call: 
> xyz.openbmc_project.Common.Error.ResourceNotFound: The resource is not 
> found.
> Jan 01 00:00:46 test_obmc phosphor-certificate-manager[179]: Error 
> occurred during X509_verify_cert call, checking for known error
> Jan 01 00:00:46 test_obmc swampd[253]: Tuning enabled
> Jan 01 00:00:46 test_obmc systemd[1]: Started Intrusion Sensor.
> Jan 01 00:00:47 test_obmc swampd[253]: No fan zones, application pausing 
> until new configuration
> Jan 01 00:00:47 test_obmc mapperx[199]: Introspect call failed with 
> error: generic:53, Invalid request descriptor on process: 
> xyz.openbmc_project.Hwmon.external path: /
> Jan 01 00:00:47 test_obmc nscd[182]: 182 checking for monitored file 
> `/nsswitch.conf': No such file or directory
> Jan 01 00:00:47 test_obmc nscd[182]: 182 checking for monitored file 
> `/group': No such file or directory
> Jan 01 00:00:47 test_obmc systemd[1]: Started IPMB Sensor.
> Jan 01 00:00:47 test_obmc adcsensor[265]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:00:47 test_obmc systemd[1]: Started MCU Temp Sensor.
> Jan 01 00:00:47 test_obmc cpusensor[266]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:00:48 test_obmc systemd[1]: Started PSU Sensor.
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in7_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in12_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in15_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in2_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in5_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in8_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in10_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in13_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in3_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in6_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in9_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in11_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in14_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in1_input
> Jan 01 00:00:48 test_obmc adcsensor[265]: failed to find match for 
> /sys/class/hwmon/hwmon3/in4_input
> Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monitored file 
> `/nsswitch.conf': No such file or directory
> Jan 01 00:00:48 test_obmc fru-device[189]: failed to read bus 9 address 40
> Jan 01 00:00:48 test_obmc fru-device[189]: failed to read bus 9 address 55
> Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monitored file 
> `/resolv.conf': No such file or directory
> Jan 01 00:00:48 test_obmc nscd[182]: 182 checking for monitored file 
> `/hosts': No such file or directory
> Jan 01 00:00:49 test_obmc nscd[182]: 182 checking for monitored file 
> `/nsswitch.conf': No such file or directory
> Jan 01 00:00:49 test_obmc nscd[182]: 182 checking for monitored file 
> `/services': No such file or directory
> Jan 01 00:00:49 test_obmc exitairtempsensor[268]: error getting  
> SpecialMode status No route to host
> Jan 01 00:00:49 test_obmc mapperx[199]: Found invalid association on 
> path /xyz/openbmc_project/software/0908ea58
> Jan 01 00:00:49 test_obmc phosphor-certificate-manager[179]: Certificate 
> compareKeys
> Jan 01 00:00:49 test_obmc fansensor[270]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:00:50 test_obmc intrusion-sensor[273]: can't find matched I2C 
> or GPIO configuration for intrusion sensor.
> Jan 01 00:00:50 test_obmc systemd[1]: Started System Logging Service.
> Jan 01 00:00:50 test_obmc hwmontempsensor[272]: error getting  
> SpecialMode status No route to host
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan9_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan13_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan16_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan1_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan4_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan7_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan11_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan14_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan2_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan5_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan8_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan12_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan15_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan3_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan6_input
> Jan 01 00:00:50 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan10_input
> Jan 01 00:00:50 test_obmc systemd[1]: Finished Wait for 
> /xyz/openbmc_project/control/host0/boot/one_time.
> Jan 01 00:00:50 test_obmc systemd[1]: Finished Wait for 
> /xyz/openbmc_project/control/host0/boot.
> Jan 01 00:00:51 test_obmc systemd[1]: Finished Wait for 
> /xyz/openbmc_project/control/host0/power_restore_policy.
> Jan 01 00:00:51 test_obmc ipmbsensor[274]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:00:51 test_obmc mcutempsensor[276]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:00:51 test_obmc systemd[1]: Finished Wait for 
> /xyz/openbmc_project/control/host0/restriction_mode.
> Jan 01 00:00:51 test_obmc systemd[1]: Finished Wait for 
> /xyz/openbmc_project/time/sync_method.
> Jan 01 00:00:51 test_obmc systemd[1]: ramoops-monitor.service: 
> Deactivated successfully.
> Jan 01 00:00:51 test_obmc systemd[1]: Finished Ramoops monitor..
> Jan 01 00:00:51 test_obmc avahi-daemon[240]: Successfully dropped root 
> privileges.
> Jan 01 00:00:51 test_obmc avahi-daemon[240]: avahi-daemon 0.8 starting up.
> Jan 01 00:00:51 test_obmc nslcd[283]: version 0.9.8 starting
> Jan 01 00:00:51 test_obmc nslcd[283]: accepting connections
> Jan 01 00:00:51 test_obmc systemd[1]: Started LDAP daemon.
> Jan 01 00:00:51 test_obmc systemd[1]: Started Phosphor Network Manager.
> Jan 01 00:00:51 test_obmc systemd[1]: Started OpenBMC Software Update 
> Manager.
> Jan 01 00:00:52 test_obmc phosphor-bmc-state-manager[264]: Unit 
> obmc-bmc-service-quiesce@0.target not found: sd_bus_call: 
> org.freedesktop.systemd1.NoSuchUnit: Unit 
> obmc-bmc-service-quiesce@0.target not loaded.
> Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Inband IPMI...
> Jan 01 00:00:52 test_obmc psusensor[277]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Ldap config 
> updater...
> Jan 01 00:00:52 test_obmc psusensor[277]: Driver name aspeed_pwm_tacho 
> not found in sensor whitelist
> Jan 01 00:00:52 test_obmc psusensor[277]: Driver name w83773g not found 
> in sensor whitelist
> Jan 01 00:00:52 test_obmc psusensor[277]: Driver name iio_hwmon not 
> found in sensor whitelist
> Jan 01 00:00:52 test_obmc psusensor[277]: Driver name w83773g not found 
> in sensor whitelist
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Successfully called chroot().
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Successfully dropped 
> remaining capabilities.
> Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Version Software 
> Manager...
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Loading service file 
> /services/obmc_console.service.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast 
> group on interface eth0.IPv6 with address fe80::68e9:3dff:fe93:825c.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface 
> eth0.IPv6 for mDNS.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast 
> group on interface eth0.IPv4 with address 192.168.200.5.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface 
> eth0.IPv4 for mDNS.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast 
> group on interface lo.IPv6 with address ::1.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface 
> lo.IPv6 for mDNS.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Joining mDNS multicast 
> group on interface lo.IPv4 with address 127.0.0.1.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: New relevant interface 
> lo.IPv4 for mDNS.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Network interface 
> enumeration completed.
> Jan 01 00:00:52 test_obmc systemd[1]: Starting Phosphor Time Manager 
> daemon...
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address 
> record for fe80::68e9:3dff:fe93:825c on eth0.*.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address 
> record for 192.168.200.5 on eth0.IPv4.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address 
> record for ::1 on lo.*.
> Jan 01 00:00:52 test_obmc avahi-daemon[240]: Registering new address 
> record for 127.0.0.1 on lo.IPv4.
> Jan 01 00:00:53 test_obmc systemd[1]: Started Avahi mDNS/DNS-SD Stack.
> Jan 01 00:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the 
> BMCState field to BMC_NOTREADY
> Jan 01 00:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the 
> BMCState field to xyz.openbmc_project.State.BMC.BMCState.NotReady
> Jan 01 00:00:53 test_obmc phosphor-bmc-state-manager[264]: Setting the 
> RebootCause field to xyz.openbmc_project.State.BMC.RebootCause.Unknown
> Jan 01 00:00:53 test_obmc systemd[1]: Started Phosphor BMC State Manager.
> Jan 01 00:00:53 test_obmc avahi-daemon[240]: Server startup complete. 
> Host name is test_obmc.local. Local service cookie is 1954789941.
> Jan 01 00:00:53 test_obmc nslcd[283]: caught signal SIGTERM (15), 
> shutting down
> Jan 01 00:00:53 test_obmc systemd[1]: Stopping LDAP daemon...
> Jan 01 00:00:53 test_obmc nslcd[283]: thread 0 is still running, 
> shutting down anyway
> Jan 01 00:00:53 test_obmc nslcd[283]: thread 1 is still running, 
> shutting down anyway
> Jan 01 00:00:53 test_obmc nslcd[283]: thread 2 is still running, 
> shutting down anyway
> Jan 01 00:00:53 test_obmc nslcd[283]: thread 3 is still running, 
> shutting down anyway
> Jan 01 00:00:53 test_obmc nslcd[283]: thread 4 is still running, 
> shutting down anyway
> Jan 01 00:00:53 test_obmc nslcd[283]: version 0.9.8 bailing out
> Jan 01 00:00:53 test_obmc systemd[1]: Started Phosphor Ldap config updater.
> Jan 01 00:00:54 test_obmc systemd[1]: nslcd.service: Deactivated 
> successfully.
> Jan 01 00:00:54 test_obmc systemd[1]: Stopped LDAP daemon.
> Jan 01 00:00:54 test_obmc systemd[1]: Started Phosphor Version Software 
> Manager.
> Jan 01 00:00:54 test_obmc avahi-daemon[240]: Service "obmc_console on 
> test_obmc" (/services/obmc_console.service) successfully established.
> Jan 01 00:00:54 test_obmc fru-device[189]: device at bus 1 address 76 busy
> Jan 01 00:00:54 test_obmc systemd[1]: Starting Time & Date Service...
> Jan 01 00:00:55 test_obmc fru-device[189]: device at bus 2 address 76 busy
> Jan 01 00:00:56 test_obmc ipmid[290]: JSON file not found
> Jan 01 00:00:56 test_obmc phosphor-network-manager[261]: Refreshing the 
> objects.
> Jan 01 00:00:57 test_obmc systemd[1]: Starting Hostname Service...
> Jan 01 00:00:57 test_obmc fru-device[189]: failed to read bus 9 address 40
> Jan 01 00:00:57 test_obmc fru-device[189]: failed to read bus 9 address 55
> Jan 01 00:00:59 test_obmc systemd[1]: Started Time & Date Service.
> Jan 01 00:01:00 test_obmc systemd-timedated[297]: Set NTP to disabled.
> Jan 01 00:01:00 test_obmc phosphor-time-manager[293]: Updated NTP setting
> Jan 01 00:01:00 test_obmc systemd[1]: Started Phosphor Time Manager daemon.
> Jan 01 00:01:00 test_obmc phosphor-network-manager[261]: Refreshing 
> complete.
> Jan 01 00:01:00 test_obmc bmcweb[226]: Checking certs in file 
> /etc/ssl/certs/https/server.pem
> Jan 01 00:01:00 test_obmc bmcweb[226]: Generating new keys
> Jan 01 00:01:00 test_obmc bmcweb[226]: Generating EC key
> Jan 01 00:01:01 test_obmc bmcweb[226]: Generating x509 Certificate
> Jan 01 00:01:01 test_obmc ipmid[290]: Registering OEM:[0X00C2CF], 
> Cmd:[0X04] for Manual Zone Control
> Jan 01 00:01:01 test_obmc systemd[1]: Started Hostname Service.
> Jan 01 00:01:01 test_obmc systemd[1]: Started Phosphor Inband IPMI.
> Jan 01 00:01:01 test_obmc systemd[1]: Starting Phosphor IPMI KCS DBus 
> Bridge...
> Jan 01 00:01:01 test_obmc phosphor-certificate-manager[179]: Certificate 
> install
> Jan 01 00:01:01 test_obmc systemd[1]: Started Network IPMI daemon.
> Jan 01 00:01:02 test_obmc systemd[1]: Started Phosphor IPMI KCS DBus Bridge.
> Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response 
> failure: ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The 
> name is not activatable
> Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response 
> failure: ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The 
> name is not activatable
> Jan 01 00:01:02 test_obmc kcsbridged-ipmi-kcs3[312]: IPMI response 
> failure: ipmid response: org.freedesktop.DBus.Error.ServiceUnknown: The 
> name is not activatable
> Jan 01 00:01:02 test_obmc ipmid[290]: Loading whitelist filter
> Jan 01 00:01:03 test_obmc phosphor-certificate-manager[179]: Certificate 
> compareKeys
> Jan 01 00:01:03 test_obmc ipmid[290]: New interface mapping
> Jan 01 00:01:03 test_obmc ipmid[290]: Set restrictedMode = false
> Jan 01 00:01:03 test_obmc netipmid[313]: Failed to get bus name
> Jan 01 00:01:03 test_obmc netipmid[313]: Bind to interfae
> Jan 01 00:01:03 test_obmc ipmid[290]: New interface mapping
> Jan 01 00:01:03 test_obmc phosphor-certificate-manager[179]: Inotify 
> callback to update certificate properties
> Jan 01 00:01:03 test_obmc systemd[1]: Reloading Start bmcweb server...
> Jan 01 00:01:03 test_obmc systemd[1]: Reloaded Start bmcweb server.
> Jan 01 00:01:08 test_obmc entity-manager[224]: Inventory Added
> Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 
> 1.135 assert: value 0.003 raw data 3
> Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 
> 1.08 assert: value 0.003 raw data 3
> Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_MNOP low threshold 
> 1.135 assert: value 0 raw data 0
> Jan 01 00:01:12 test_obmc adcsensor[265]: Sensor VCCM_MNOP low threshold 
> 1.08 assert: value 0 raw data 0
> Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan9_input
> Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan13_input
> Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan16_input
> Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm3_enable"
> Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor PVCCIN_CPU2 low 
> threshold 1.75 assert: value 0.029 raw data 29
> Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor PVCCIN_CPU2 low 
> threshold 1.72 assert: value 0.029 raw data 29
> Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm5_enable"
> Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm7_enable"
> Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 
> 1.135 assert: value 0.001 raw data 1
> Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor VCCM_IJKL low threshold 
> 1.08 assert: value 0.001 raw data 1
> Jan 01 00:01:13 test_obmc adcsensor[265]: Sensor VCCM_MNOP low threshold 
> 1.135 assert: value 0.003 raw data 3
> Jan 01 00:01:13 test_obmc cpusensor[266]: CPU configs are parsed
> Jan 01 00:01:13 test_obmc cpusensor[266]: unable to open /dev/peci-1
> Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan11_input
> Jan 01 00:01:13 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:13 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan14_input
> Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm1_enable"
> Jan 01 00:01:13 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm2_enable"
> Jan 01 00:01:13 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm8_enable"
> Jan 01 00:01:14 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan12_input
> Jan 01 00:01:14 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan15_input
> Jan 01 00:01:14 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm4_enable"
> Jan 01 00:01:14 test_obmc fansensor[270]: Error read/write 
> "/sys/class/hwmon/hwmon2/pwm6_enable"
> Jan 01 00:01:14 test_obmc fansensor[270]: failed to find match for 
> /sys/class/hwmon/hwmon2/fan10_input
> Jan 01 00:01:14 test_obmc intrusion-sensor[273]: can't find matched NIC 
> name.
> Jan 01 00:01:16 test_obmc ipmid[290]: wd_set: sd_bus_call: 
> xyz.openbmc_project.Common.Error.ResourceNotFound: The resource is not 
> found.
> Jan 01 00:01:16 test_obmc ipmid[290]: Set Sol Config - Invalid solInterface
> Jan 01 00:01:16 test_obmc ipmid[290]: Failed to check request for full 
> unpack
> Jan 01 00:01:16 test_obmc swampd[253]: New configuration detected, reloading
> Jan 01 00:01:16 test_obmc swampd[253]: .No fan zones, application 
> pausing until new configuration
> Jan 01 00:01:18 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 1.
> Jan 01 00:01:18 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:01:18 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:01:18 test_obmc cpusensor[319]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:01:21 test_obmc cpusensor[319]: CPU configs are parsed
> Jan 01 00:01:21 test_obmc cpusensor[319]: unable to open /dev/peci-1
> Jan 01 00:01:21 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:21 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:01:26 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 2.
> Jan 01 00:01:26 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:01:26 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:01:26 test_obmc cpusensor[325]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:01:26 test_obmc health-monitor[181]: DEASSERT: sensor CPU is 
> under the upper threshold critical high
> Jan 01 00:01:28 test_obmc cpusensor[325]: CPU configs are parsed
> Jan 01 00:01:28 test_obmc cpusensor[325]: unable to open /dev/peci-1
> Jan 01 00:01:28 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:28 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:01:30 test_obmc systemd[1]: systemd-hostnamed.service: 
> Deactivated successfully.
> Jan 01 00:01:31 test_obmc systemd[1]: systemd-timedated.service: 
> Deactivated successfully.
> Jan 01 00:01:33 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 3.
> Jan 01 00:01:33 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:01:33 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:01:33 test_obmc cpusensor[333]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:01:34 test_obmc fansensor[270]: Sensor SP_FAN0_TACH reading error!
> Jan 01 00:01:35 test_obmc fansensor[270]: Sensor SP_FAN3_TACH reading error!
> Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN6_TACH reading error!
> Jan 01 00:01:36 test_obmc cpusensor[333]: CPU configs are parsed
> Jan 01 00:01:36 test_obmc cpusensor[333]: unable to open /dev/peci-1
> Jan 01 00:01:36 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:36 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN1_TACH reading error!
> Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN4_TACH reading error!
> Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN7_TACH reading error!
> Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN2_TACH reading error!
> Jan 01 00:01:36 test_obmc fansensor[270]: Sensor SP_FAN5_TACH reading error!
> Jan 01 00:01:38 test_obmc nscd[182]: 182 checking for monitored file 
> `/nsswitch.conf': No such file or directory
> Jan 01 00:01:38 test_obmc nscd[182]: 182 checking for monitored file 
> `/group': No such file or directory
> Jan 01 00:01:41 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 4.
> Jan 01 00:01:41 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:01:41 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:01:41 test_obmc cpusensor[334]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:01:43 test_obmc cpusensor[334]: CPU configs are parsed
> Jan 01 00:01:43 test_obmc cpusensor[334]: unable to open /dev/peci-1
> Jan 01 00:01:43 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:43 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:01:48 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 5.
> Jan 01 00:01:48 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:01:48 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:01:48 test_obmc cpusensor[335]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:01:49 test_obmc ipmid[290]: Set Sol Config - Invalid solInterface
> Jan 01 00:01:49 test_obmc ipmid[290]: Failed to check request for full 
> unpack
> Jan 01 00:01:51 test_obmc cpusensor[335]: CPU configs are parsed
> Jan 01 00:01:51 test_obmc cpusensor[335]: unable to open /dev/peci-1
> Jan 01 00:01:51 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:51 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:01:53 test_obmc nscd[182]: 182 checking for monitored file 
> `/nsswitch.conf': No such file or directory
> Jan 01 00:01:53 test_obmc nscd[182]: 182 checking for monitored file 
> `/group': No such file or directory
> Jan 01 00:01:54 test_obmc ipmid[290]: wd_get: sd_bus_call: 
> xyz.openbmc_project.Common.Error.ResourceNotFound: The resource is not 
> found.
> Jan 01 00:01:56 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 6.
> Jan 01 00:01:56 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:01:56 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:01:56 test_obmc cpusensor[338]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:01:58 test_obmc cpusensor[338]: CPU configs are parsed
> Jan 01 00:01:58 test_obmc cpusensor[338]: unable to open /dev/peci-1
> Jan 01 00:01:58 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:01:58 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:03 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 7.
> Jan 01 00:02:03 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:03 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:03 test_obmc cpusensor[339]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:06 test_obmc cpusensor[339]: CPU configs are parsed
> Jan 01 00:02:06 test_obmc cpusensor[339]: unable to open /dev/peci-1
> Jan 01 00:02:06 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:06 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:11 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 8.
> Jan 01 00:02:11 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:11 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:11 test_obmc cpusensor[340]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:13 test_obmc systemd[1]: 
> xyz.openbmc_project.LED.GroupManager.service: start operation timed out. 
> Terminating.
> Jan 01 00:02:13 test_obmc systemd[1]: 
> xyz.openbmc_project.LED.GroupManager.service: Failed with result 'timeout'.
> Jan 01 00:02:13 test_obmc systemd[1]: Failed to start Phosphor LED Group 
> Management Daemon.
> Jan 01 00:02:13 test_obmc systemd[1]: Starting Wait for 
> /xyz/openbmc_project/led/groups...
> Jan 01 00:02:13 test_obmc cpusensor[340]: CPU configs are parsed
> Jan 01 00:02:13 test_obmc cpusensor[340]: unable to open /dev/peci-1
> Jan 01 00:02:13 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:13 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:14 test_obmc systemd[1]: 
> xyz.openbmc_project.LED.GroupManager.service: Scheduled restart job, 
> restart counter is at 1.
> Jan 01 00:02:14 test_obmc systemd[1]: Stopped Phosphor LED Group 
> Management Daemon.
> Jan 01 00:02:14 test_obmc systemd[1]: Starting Phosphor LED Group 
> Management Daemon...
> Jan 01 00:02:18 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 9.
> Jan 01 00:02:18 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:18 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:18 test_obmc cpusensor[344]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:21 test_obmc cpusensor[344]: CPU configs are parsed
> Jan 01 00:02:21 test_obmc cpusensor[344]: unable to open /dev/peci-1
> Jan 01 00:02:21 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:21 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:26 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 10.
> Jan 01 00:02:26 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:26 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:26 test_obmc cpusensor[347]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:28 test_obmc cpusensor[347]: CPU configs are parsed
> Jan 01 00:02:28 test_obmc cpusensor[347]: unable to open /dev/peci-1
> Jan 01 00:02:28 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:28 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:31 test_obmc fansensor[270]: Sensor SP_FAN5_TACH reading error!
> Jan 01 00:02:33 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 11.
> Jan 01 00:02:33 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:33 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:33 test_obmc cpusensor[348]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:34 test_obmc login[259]: pam_lastlog(login:session): file 
> /var/log/lastlog created
> Jan 01 00:02:34 test_obmc login[349]: ROOT LOGIN  on '/dev/ttyS4'
> Jan 01 00:02:36 test_obmc cpusensor[348]: CPU configs are parsed
> Jan 01 00:02:36 test_obmc cpusensor[348]: unable to open /dev/peci-1
> Jan 01 00:02:36 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:36 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:41 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 12.
> Jan 01 00:02:41 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:41 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:41 test_obmc cpusensor[354]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:43 test_obmc cpusensor[354]: CPU configs are parsed
> Jan 01 00:02:43 test_obmc cpusensor[354]: unable to open /dev/peci-1
> Jan 01 00:02:43 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:43 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:48 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 13.
> Jan 01 00:02:48 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:48 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:49 test_obmc cpusensor[356]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:51 test_obmc cpusensor[356]: CPU configs are parsed
> Jan 01 00:02:51 test_obmc cpusensor[356]: unable to open /dev/peci-1
> Jan 01 00:02:51 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:51 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:02:56 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 14.
> Jan 01 00:02:56 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:02:56 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:02:56 test_obmc cpusensor[359]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:02:58 test_obmc cpusensor[359]: CPU configs are parsed
> Jan 01 00:02:58 test_obmc cpusensor[359]: unable to open /dev/peci-1
> Jan 01 00:02:58 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:02:58 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:03 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 15.
> Jan 01 00:03:04 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:03:04 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:03:04 test_obmc cpusensor[363]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:03:06 test_obmc cpusensor[363]: CPU configs are parsed
> Jan 01 00:03:06 test_obmc cpusensor[363]: unable to open /dev/peci-1
> Jan 01 00:03:06 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:03:06 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:11 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 16.
> Jan 01 00:03:11 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:03:11 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:03:11 test_obmc cpusensor[364]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:03:13 test_obmc cpusensor[364]: CPU configs are parsed
> Jan 01 00:03:13 test_obmc cpusensor[364]: unable to open /dev/peci-1
> Jan 01 00:03:13 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:03:13 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:18 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 17.
> Jan 01 00:03:19 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:03:19 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:03:19 test_obmc cpusensor[366]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:03:21 test_obmc cpusensor[366]: CPU configs are parsed
> Jan 01 00:03:21 test_obmc cpusensor[366]: unable to open /dev/peci-1
> Jan 01 00:03:21 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:03:21 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:26 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 18.
> Jan 01 00:03:26 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:03:26 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:03:26 test_obmc cpusensor[367]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:03:28 test_obmc cpusensor[367]: CPU configs are parsed
> Jan 01 00:03:28 test_obmc cpusensor[367]: unable to open /dev/peci-1
> Jan 01 00:03:28 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:03:28 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:34 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 19.
> Jan 01 00:03:34 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:03:34 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:03:34 test_obmc cpusensor[368]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:03:36 test_obmc cpusensor[368]: CPU configs are parsed
> Jan 01 00:03:36 test_obmc cpusensor[368]: unable to open /dev/peci-1
> Jan 01 00:03:36 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:03:36 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:41 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 20.
> Jan 01 00:03:41 test_obmc systemd[1]: Stopped CPU Sensor.
> Jan 01 00:03:41 test_obmc systemd[1]: Started CPU Sensor.
> Jan 01 00:03:41 test_obmc cpusensor[370]: error getting  SpecialMode 
> status No route to host
> Jan 01 00:03:43 test_obmc cpusensor[370]: CPU configs are parsed
> Jan 01 00:03:43 test_obmc cpusensor[370]: unable to open /dev/peci-1
> Jan 01 00:03:43 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Main process exited, code=exited, 
> status=1/FAILURE
> Jan 01 00:03:43 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Failed with result 'exit-code'.
> Jan 01 00:03:44 test_obmc systemd[1]: 
> xyz.openbmc_project.LED.GroupManager.service: start operation timed out. 
> Terminating.
> Jan 01 00:03:44 test_obmc systemd[1]: 
> xyz.openbmc_project.LED.GroupManager.service: Failed with result 'timeout'.
> Jan 01 00:03:44 test_obmc systemd[1]: Failed to start Phosphor LED Group 
> Management Daemon.
> Jan 01 00:03:45 test_obmc systemd[1]: 
> xyz.openbmc_project.LED.GroupManager.service: Scheduled restart job, 
> restart counter is at 2.
> Jan 01 00:03:46 test_obmc systemd[1]: Stopped Phosphor LED Group 
> Management Daemon.
> Jan 01 00:03:46 test_obmc systemd[1]: Starting Phosphor LED Group 
> Management Daemon...
> Jan 01 00:03:48 test_obmc systemd[1]: 
> xyz.openbmc_project.cpusensor.service: Scheduled restart job, restart 
> counter is at 21.
> ....
> 
> Thanks in advance,
> 
> Sincerely Yours,
> Hamidreza
