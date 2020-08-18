Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8CF247E65
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 08:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW19H0SSvzDqWL
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 16:24:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::529;
 helo=mail-ed1-x529.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=TSbjGu43; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW18b0b9wzDqNT
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 16:24:13 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id v22so14348695edy.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 23:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=JJIIRtdA7ZcCRjR9TLBPUr5N2s8oQ/zmMVH8TCxa4d8=;
 b=TSbjGu43apbMRgep/Gq/a+Ac7QxnMk7yG+rY60At5CcGdv1xvf6hupQ+SBF9RhSAk9
 51+XkxPFxPmRbQF82+1U6QaSnzyBcqwLgw2EJl5D7644IOW5iJ3zvbmre5UWP7miazUz
 7ZXsUuIhq+eZnTn8oiJFCVWDgXikP3h4HPRaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=JJIIRtdA7ZcCRjR9TLBPUr5N2s8oQ/zmMVH8TCxa4d8=;
 b=lvK99pR0J68bsRSQ8Kg1CCHRm+3a3ey0/KBDqiP5TGOdEJYTXniL6ftGeM8TFRK4zA
 E6B4hZt6hucWU+afJIA+KEKbsddQgCVlb1XZQykHnJQ5ugvTU9ezR0TF9in1HsT8UfAT
 SO9f2aXaOn2CbIdBd/N78C+y5NBxZU4FI7+wnu00Lqst30mq0RjibLa6XTM3+U+61o1T
 vcfiQ/3IrOtMww/6CklVz+xTaVli60TCpCJXi5RrKBV1p6BgwUhG3uOYoWNQMoZLlmFR
 yTYuV38Fxjpwp5r9HY8JUXNsfv4IXfwNynzX1rqtbnJ3Ccu68zxdAHo2Qj4fIou9daGT
 lL1g==
X-Gm-Message-State: AOAM531O7mVVu/m+GNnYEEKM7C6ki10K/o03XlRGYOHdp97BkBU9deda
 s5mW4/0uhTwXmt8uiI0ajj/nQKsgSMVdM8SQpE9ZO3NGPiaIyQ==
X-Google-Smtp-Source: ABdhPJw83/24UsWuzaDV5ZPn2LGcHMAunsuam+OQ5nI+RkRD6kKumxeIhQUtvo8WHzM1cUNcPdGw1XBk9wM6uYY1m9c=
X-Received: by 2002:aa7:c406:: with SMTP id j6mr18082194edq.143.1597731847430; 
 Mon, 17 Aug 2020 23:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <159718470399.12679.2525201344482512899@sif>
In-Reply-To: <159718470399.12679.2525201344482512899@sif>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 18 Aug 2020 06:23:54 +0000
Message-ID: <CACPK8XfoUdQRvQJX87oONgwVodHyrv72cJGj5U7ZT=J=uyVCSA@mail.gmail.com>
Subject: Fwd: [ANNOUNCE] QEMU 5.1.0 is now available
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Qemu 5.1 contains a number of enhancements for emulating aspeed
machines. In addition to the large amount of refactoring that was
performed, it gained support for:

 - AST2600 SMP booting
 - AST2600 A1 revision
 - Fixes for running the AST2600 u-boot (particularly memory training
for the A1)
 - Simplified network device command line
 - Removed need to pass cpu count and memory size
 - A new machine type from Facebook

Qemu 5.1 has landed in Debian unstable as of today.

If you haven't used qemu before, here are some ways it can be used:

To boot an ast2600 EVB machine with an emmc device from your kernel
build tree tree:

qemu-system-arm -machine ast2600-evb \
                -nographic -no-reboot \
                -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev
user,id=3Dnetdev1 \
                -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
                -drive file=3Drootfs.ext4.qcow2,if=3Dsd,index=3D2" \
                -append "console=3DttyS4 rootwait root=3D/dev/mmcblk0"

The rootfs.ext4.qcow2 can be grabbed from here:
https://github.com/shenki/continuous-integration/raw/master/images/arm/root=
fs.ext4.qcow2.

Note that qemu doesn't yet support booting from eMMC directly with the
Aspeed machine type. Patches are welcome.

---

To boot an openbmc image on the ast2500, such as Romulus, grab the
flash image from Jenkins:

https://jenkins.openbmc.org/view/latest/job/latest-master/label=3Ddocker-bu=
ilder,target=3Dromulus/lastSuccessfulBuild/artifact/openbmc/build/tmp/deplo=
y/images/romulus/flash-romulus

and then boot it as follows:

qemu-system-arm -machine romulus-bmc \
                -nographic -no-reboot \
                -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev
user,id=3Dnetdev1 \
                -drive file=3Dflash-romulus,format=3Draw,if=3Dmtd

---

You can use this to test a kernel built by yocto:

Download this file:
https://jenkins.openbmc.org/view/latest/job/latest-master/label=3Ddocker-bu=
ilder,target=3Dromulus/lastSuccessfulBuild/artifact/openbmc/build/tmp/deplo=
y/images/romulus/image-kernel

Run qemu with the 'tftp' option set to the directory where you
downloaded the above image-kernel. You will need to halt it at the
u-boot prompt, set a ethaddr, and run 'dhcp image-kernel':

qemu-system-arm -machine romulus-bmc \
                -nographic -no-reboot \
                -net nic,model=3Dftgmac100,netdev=3Dnetdev1 -netdev
user,id=3Dnetdev1,tftp=3D$PWD \
                -drive file=3Dflash-romulus,format=3Draw,if=3Dmtd
U-Boot 2016.07 (Jan 16 2019 - 00:21:48 +0000)

Hit any key to stop autoboot:  1
ast# setenv ethaddr DE:AD:BE:EF:CA:FE
ast# dhcp image-kernel
aspeednic#0: PHY at 0x00
set_mac_control_register 1453
Found NCSI Network Controller at (0, 0)
Found NCSI Network Controller at (0, 1)
BOOTP broadcast 1
DHCP client bound to address 10.0.2.15 (2 ms)
Using  device
TFTP from server 10.0.2.2; our IP address is 10.0.2.15
Filename 'image-kernel'.
Load address: 0x83000000
Loading: #################################################################
     #################################################################
     #################################################################
     #################################################################
     ###############################################
     62.2 MiB/s
done
Bytes transferred =3D 4372700 (42b8dc hex)
ast# bootm
## Loading kernel from FIT Image at 83000000 ...
   Using 'conf@aspeed-bmc-opp-romulus.dtb' configuration
   Trying 'kernel@1' kernel subimage
     Description:  Linux kernel
     Type:         Kernel Image

---

Here are the commit stats for aspeed code in Qemu 5.1:

$ git diff --stat v5.0.0..v5.1.0  -- hw/**/*aspeed* hw/net/ftgmac100.c
 hw/arm/aspeed.c         | 350
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++---------------------------------=
--------------------------------------------------
 hw/arm/aspeed_ast2600.c | 261
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++----------------------------------------------------------=
---------------------------------------------------------------------------=
------------------------------------
 hw/arm/aspeed_soc.c     | 181
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------=
---------------------------------------------------------------------------=
-------------------------------
 hw/gpio/aspeed_gpio.c   |   9 +++------
 hw/i2c/aspeed_i2c.c     |   3 +--
 hw/misc/aspeed_scu.c    |  11 +++++------
 hw/misc/aspeed_sdmc.c   |  72
++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------
 hw/net/ftgmac100.c      |  31 +++++++++++++++++++++++++++----
 hw/sd/aspeed_sdhci.c    |  15 ++++-----------
 hw/ssi/aspeed_smc.c     |   1 -
 10 files changed, 509 insertions(+), 425 deletions(-)


$ git shortlog  v5.0.0..v5.1.0  -- hw/**/*aspeed* hw/net/ftgmac100.c
C=C3=A9dric Le Goater (2):
      arm/aspeed: Compute the number of CPUs from the SoC definition
      arm/aspeed: Rework NIC attachment

Erik Smit (1):
      Implement configurable descriptor size in ftgmac100

Joel Stanley (3):
      aspeed: Add boot stub for smp booting
      aspeed: Support AST2600A1 silicon revision
      aspeed: sdmc: Implement AST2600 locking behaviour

Markus Armbruster (22):
      qom: Drop object_property_set_description() parameter @errp
      qom: Drop parameter @errp of object_property_add() & friends
      qdev: Convert uses of qdev_create() with Coccinelle
      ssi: ssi_auto_connect_slaves() never does anything, drop
      ssi: Convert uses of ssi_create_slave_no_init() with Coccinelle
      qom: Tidy up a few object_initialize_child() calls
      qom: Less verbose object_initialize_child()
      sysbus: Drop useless OBJECT() in sysbus_init_child_obj() calls
      sysbus: Convert qdev_set_parent_bus() use with Coccinelle, part 2
      sysbus: Convert qdev_set_parent_bus() use with Coccinelle, part 4
      qdev: Convert bus-less devices to qdev_realize() with Coccinelle
      qdev: Make qdev_prop_set_drive() match the other helpers
      arm/aspeed: Drop aspeed_board_init_flashes() parameter @errp
      aspeed: Clean up roundabout error propagation
      hw/arm: Drop useless object_property_set_link() error handling
      aspeed: Fix realize error API violation
      qdev: Use returned bool to check for qdev_realize() etc. failure
      qapi: Use returned bool to check for failure, Coccinelle part
      qom: Put name parameter before value / visitor parameter
      qom: Use returned bool to check for failure, Coccinelle part
      error: Avoid unnecessary error_propagate() after error_setg()
      error: Eliminate error_propagate() with Coccinelle, part 1

Patrick Williams (1):
      aspeed: Add support for the sonorapass-bmc board

Philippe Mathieu-Daud=C3=A9 (13):
      hw/gpio/aspeed_gpio: Remove dead assignment
      hw: Remove unnecessary DEVICE() cast
      hw/arm/aspeed: Correct DRAM container region size
      hw/arm/aspeed: Remove extraneous MemoryRegion object owner
      hw/arm/aspeed: Rename AspeedBoardState as AspeedMachineState
      hw/arm/aspeed: QOM'ify AspeedMachineState
      hw/arm/aspeed: Describe each PCA9552 device
      hw/arm/aspeed: Do not create and attach empty SD cards by default
      hw/i2c/aspeed_i2c: Simplify aspeed_i2c_get_bus()
      hw/i2c: Rename i2c_try_create_slave() as i2c_slave_new()
      hw/i2c: Rename i2c_realize_and_unref() as i2c_slave_realize_and_unref=
()
      hw/i2c: Rename i2c_create_slave() as i2c_slave_create_simple()
      hw/misc/aspeed_sdmc: Fix incorrect memory size

erik-smit (1):
      ftgmac100: fix dblac write test


---------- Forwarded message ---------
From: Michael Roth <mdroth@linux.vnet.ibm.com>
Date: Tue, 11 Aug 2020 at 22:26
Subject: [ANNOUNCE] QEMU 5.1.0 is now available
To: <qemu-devel@nongnu.org>
Cc: <peter.maydell@linaro.org>


Hello,

On behalf of the QEMU Team, I'd like to announce the availability of
the QEMU 5.1.0 release. This release contains 2500+ commits from 235
authors.

You can grab the tarball from our download page here:

  https://www.qemu.org/download/#source

The full list of changes are available at:

  https://wiki.qemu.org/ChangeLog/5.1

Highlights include:

 * ARM: support for ARMv8.2 TTS2UXN architecture feature
 * ARM: support for ARMv8.5 MemTag architecture feature
 * ARM: new board support for sonorapass-bmc
 * ARM: virt: support for memory hot-unplug
 * ARM: support for nvdimm hotplug for ACPI guests
 * AVR: new architecture support for AVR CPUs
 * AVR: new board support for Arduino Duemilanove, Arduino Mega 2560,
   Arduino Mega, and Arduino UNO
 * MIPS: support for Loongson 3A CPUs (R1 and R4)
 * MIPS: performance improvements for FPU and MSA instruction
   emulation
 * PowerPC: support for guest error recovery via FWNMI
 * RISC-V: support for SiFive E34 and Ibex CPUs
 * RISC-V: new board support for HiFive1 revB and OpenTitan
 * RISC-V: Spike machine now supports more than 1 CPU
 * s390: KVM support for protected virtualization (secure execution mode)
 * x86: improvements to HVF acceleration support on macOS
 * x86: reduced virtualization overhead for non-enlightened Windows
   guests via Windows ACPI Emulated Device Table

 * block: support for 2MB logical/physical blocksizes for virtual
   storage devices
 * crypto: support for passing secrets to QEMU via Linux keyring
 * crypto: support for LUKS keyslot management via qemu-img
 * NVMe: support for Persistent Memory Region from NVMe 1.4 spec
 * qemu-img: additional features added for map/convert/measure commands,
   as well as support for zstd compression
 * qemu-img: support for new 'bitmap' command for manipulating
   persistent bitmaps in qcow2 files
 * virtio: TCG guests can now use vhost-user threads
 * virtio: vhost-user now supports registering more than 8 RAM slots

 * and lots more...

Thank you to everyone involved!
