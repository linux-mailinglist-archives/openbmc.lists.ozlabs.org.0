Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8390F2482B8
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 12:15:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BW6HQ1ZfQzDqbg
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 20:15:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BW6GM38zWzDqYX
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 20:14:32 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8C33E518ED22;
 Tue, 18 Aug 2020 12:14:26 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 18 Aug
 2020 12:14:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d1f48bc4-0ba9-4304-a0d5-15f1a0a072ef,
 5D4690BFF1A8204198846400511E4593F3B91EAC) smtp.auth=clg@kaod.org
Subject: Re: Fwd: [ANNOUNCE] QEMU 5.1.0 is now available
To: <openbmc@lists.ozlabs.org>
References: <159718470399.12679.2525201344482512899@sif>
 <CACPK8XfoUdQRvQJX87oONgwVodHyrv72cJGj5U7ZT=J=uyVCSA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b1a37b43-ba74-8d39-40c0-32cdfe07a87d@kaod.org>
Date: Tue, 18 Aug 2020 12:14:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfoUdQRvQJX87oONgwVodHyrv72cJGj5U7ZT=J=uyVCSA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 654ff4be-2952-4d6f-99f1-3ca7a4deb19c
X-Ovh-Tracer-Id: 12250353938358766490
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtiedgvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuddutdfhheetjeeljeeludevveehhfelueehveevfeeileffveelvdfgudduieetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhpvghnsghmtgdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Joel Stanley <jmstanle@au1.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/18/20 8:23 AM, Joel Stanley wrote:
> Qemu 5.1 contains a number of enhancements for emulating aspeed
> machines. In addition to the large amount of refactoring that was
> performed, it gained support for:
> 
>  - AST2600 SMP booting
>  - AST2600 A1 revision
>  - Fixes for running the AST2600 u-boot (particularly memory training
> for the A1)
>  - Simplified network device command line
>  - Removed need to pass cpu count and memory size
>  - A new machine type from Facebook

5.2 will have a board model for Supermicro X11 BMC.

> Qemu 5.1 has landed in Debian unstable as of today.
> 
> If you haven't used qemu before, here are some ways it can be used:
> 
> To boot an ast2600 EVB machine with an emmc device from your kernel
> build tree tree:
> 
> qemu-system-arm -machine ast2600-evb \
>                 -nographic -no-reboot \
>                 -net nic,model=ftgmac100,netdev=netdev1 -netdev
> user,id=netdev1 \

'-nic user' should be enough now. ftgmac100 is the default model.

I like adding 'hostfwd=::2222-:22' for ssh and 'tftp=/var/lib/tftpboot/'
to tftpboot in U-Boot.


If you have libvirt running, then :

  -net nic,netdev=netdev0 
  -netdev bridge,id=netdev0,helper=/usr/libexec/qemu-bridge-helper,br=virbr0

will dhcp from the local machine bridge.

>                 -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
>                 -drive file=rootfs.ext4.qcow2,if=sd,index=2" \
>                 -append "console=ttyS4 rootwait root=/dev/mmcblk0"
> 
> The rootfs.ext4.qcow2 can be grabbed from here:
> https://github.com/shenki/continuous-integration/raw/master/images/arm/rootfs.ext4.qcow2.
> 
> Note that qemu doesn't yet support booting from eMMC directly with the
> Aspeed machine type. Patches are welcome.

yes ! 

Thanks for the summary Joel,

It would be nice to have some OpenBMC images hosted on GH that we could use 
for the non-regression tests in QEMU.
 
Cheers,

C. 

> 
> ---
> 
> To boot an openbmc image on the ast2500, such as Romulus, grab the
> flash image from Jenkins:
> 
> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=romulus/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/romulus/flash-romulus
> 
> and then boot it as follows:
> 
> qemu-system-arm -machine romulus-bmc \
>                 -nographic -no-reboot \
>                 -net nic,model=ftgmac100,netdev=netdev1 -netdev
> user,id=netdev1 \
>                 -drive file=flash-romulus,format=raw,if=mtd
> 
> ---
> 
> You can use this to test a kernel built by yocto:
> 
> Download this file:
> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=romulus/lastSuccessfulBuild/artifact/openbmc/build/tmp/deploy/images/romulus/image-kernel
> 
> Run qemu with the 'tftp' option set to the directory where you
> downloaded the above image-kernel. You will need to halt it at the
> u-boot prompt, set a ethaddr, and run 'dhcp image-kernel':
> 
> qemu-system-arm -machine romulus-bmc \
>                 -nographic -no-reboot \
>                 -net nic,model=ftgmac100,netdev=netdev1 -netdev
> user,id=netdev1,tftp=$PWD \
>                 -drive file=flash-romulus,format=raw,if=mtd
> U-Boot 2016.07 (Jan 16 2019 - 00:21:48 +0000)
> 
> Hit any key to stop autoboot:  1
> ast# setenv ethaddr DE:AD:BE:EF:CA:FE
> ast# dhcp image-kernel
> aspeednic#0: PHY at 0x00
> set_mac_control_register 1453
> Found NCSI Network Controller at (0, 0)
> Found NCSI Network Controller at (0, 1)
> BOOTP broadcast 1
> DHCP client bound to address 10.0.2.15 (2 ms)
> Using  device
> TFTP from server 10.0.2.2; our IP address is 10.0.2.15
> Filename 'image-kernel'.
> Load address: 0x83000000
> Loading: #################################################################
>      #################################################################
>      #################################################################
>      #################################################################
>      ###############################################
>      62.2 MiB/s
> done
> Bytes transferred = 4372700 (42b8dc hex)
> ast# bootm
> ## Loading kernel from FIT Image at 83000000 ...
>    Using 'conf@aspeed-bmc-opp-romulus.dtb' configuration
>    Trying 'kernel@1' kernel subimage
>      Description:  Linux kernel
>      Type:         Kernel Image
> 
> ---
> 
> Here are the commit stats for aspeed code in Qemu 5.1:
> 
> $ git diff --stat v5.0.0..v5.1.0  -- hw/**/*aspeed* hw/net/ftgmac100.c
>  hw/arm/aspeed.c         | 350
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------------------------------------------
>  hw/arm/aspeed_ast2600.c | 261
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>  hw/arm/aspeed_soc.c     | 181
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------------------------------------------------------------------------------------
>  hw/gpio/aspeed_gpio.c   |   9 +++------
>  hw/i2c/aspeed_i2c.c     |   3 +--
>  hw/misc/aspeed_scu.c    |  11 +++++------
>  hw/misc/aspeed_sdmc.c   |  72
> ++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------
>  hw/net/ftgmac100.c      |  31 +++++++++++++++++++++++++++----
>  hw/sd/aspeed_sdhci.c    |  15 ++++-----------
>  hw/ssi/aspeed_smc.c     |   1 -
>  10 files changed, 509 insertions(+), 425 deletions(-)
> 
> 
> $ git shortlog  v5.0.0..v5.1.0  -- hw/**/*aspeed* hw/net/ftgmac100.c
> Cédric Le Goater (2):
>       arm/aspeed: Compute the number of CPUs from the SoC definition
>       arm/aspeed: Rework NIC attachment
> 
> Erik Smit (1):
>       Implement configurable descriptor size in ftgmac100
> 
> Joel Stanley (3):
>       aspeed: Add boot stub for smp booting
>       aspeed: Support AST2600A1 silicon revision
>       aspeed: sdmc: Implement AST2600 locking behaviour
> 
> Markus Armbruster (22):
>       qom: Drop object_property_set_description() parameter @errp
>       qom: Drop parameter @errp of object_property_add() & friends
>       qdev: Convert uses of qdev_create() with Coccinelle
>       ssi: ssi_auto_connect_slaves() never does anything, drop
>       ssi: Convert uses of ssi_create_slave_no_init() with Coccinelle
>       qom: Tidy up a few object_initialize_child() calls
>       qom: Less verbose object_initialize_child()
>       sysbus: Drop useless OBJECT() in sysbus_init_child_obj() calls
>       sysbus: Convert qdev_set_parent_bus() use with Coccinelle, part 2
>       sysbus: Convert qdev_set_parent_bus() use with Coccinelle, part 4
>       qdev: Convert bus-less devices to qdev_realize() with Coccinelle
>       qdev: Make qdev_prop_set_drive() match the other helpers
>       arm/aspeed: Drop aspeed_board_init_flashes() parameter @errp
>       aspeed: Clean up roundabout error propagation
>       hw/arm: Drop useless object_property_set_link() error handling
>       aspeed: Fix realize error API violation
>       qdev: Use returned bool to check for qdev_realize() etc. failure
>       qapi: Use returned bool to check for failure, Coccinelle part
>       qom: Put name parameter before value / visitor parameter
>       qom: Use returned bool to check for failure, Coccinelle part
>       error: Avoid unnecessary error_propagate() after error_setg()
>       error: Eliminate error_propagate() with Coccinelle, part 1
> 
> Patrick Williams (1):
>       aspeed: Add support for the sonorapass-bmc board
> 
> Philippe Mathieu-Daudé (13):
>       hw/gpio/aspeed_gpio: Remove dead assignment
>       hw: Remove unnecessary DEVICE() cast
>       hw/arm/aspeed: Correct DRAM container region size
>       hw/arm/aspeed: Remove extraneous MemoryRegion object owner
>       hw/arm/aspeed: Rename AspeedBoardState as AspeedMachineState
>       hw/arm/aspeed: QOM'ify AspeedMachineState
>       hw/arm/aspeed: Describe each PCA9552 device
>       hw/arm/aspeed: Do not create and attach empty SD cards by default
>       hw/i2c/aspeed_i2c: Simplify aspeed_i2c_get_bus()
>       hw/i2c: Rename i2c_try_create_slave() as i2c_slave_new()
>       hw/i2c: Rename i2c_realize_and_unref() as i2c_slave_realize_and_unref()
>       hw/i2c: Rename i2c_create_slave() as i2c_slave_create_simple()
>       hw/misc/aspeed_sdmc: Fix incorrect memory size
> 
> erik-smit (1):
>       ftgmac100: fix dblac write test
> 
> 
> ---------- Forwarded message ---------
> From: Michael Roth <mdroth@linux.vnet.ibm.com>
> Date: Tue, 11 Aug 2020 at 22:26
> Subject: [ANNOUNCE] QEMU 5.1.0 is now available
> To: <qemu-devel@nongnu.org>
> Cc: <peter.maydell@linaro.org>
> 
> 
> Hello,
> 
> On behalf of the QEMU Team, I'd like to announce the availability of
> the QEMU 5.1.0 release. This release contains 2500+ commits from 235
> authors.
> 
> You can grab the tarball from our download page here:
> 
>   https://www.qemu.org/download/#source
> 
> The full list of changes are available at:
> 
>   https://wiki.qemu.org/ChangeLog/5.1
> 
> Highlights include:
> 
>  * ARM: support for ARMv8.2 TTS2UXN architecture feature
>  * ARM: support for ARMv8.5 MemTag architecture feature
>  * ARM: new board support for sonorapass-bmc
>  * ARM: virt: support for memory hot-unplug
>  * ARM: support for nvdimm hotplug for ACPI guests
>  * AVR: new architecture support for AVR CPUs
>  * AVR: new board support for Arduino Duemilanove, Arduino Mega 2560,
>    Arduino Mega, and Arduino UNO
>  * MIPS: support for Loongson 3A CPUs (R1 and R4)
>  * MIPS: performance improvements for FPU and MSA instruction
>    emulation
>  * PowerPC: support for guest error recovery via FWNMI
>  * RISC-V: support for SiFive E34 and Ibex CPUs
>  * RISC-V: new board support for HiFive1 revB and OpenTitan
>  * RISC-V: Spike machine now supports more than 1 CPU
>  * s390: KVM support for protected virtualization (secure execution mode)
>  * x86: improvements to HVF acceleration support on macOS
>  * x86: reduced virtualization overhead for non-enlightened Windows
>    guests via Windows ACPI Emulated Device Table
> 
>  * block: support for 2MB logical/physical blocksizes for virtual
>    storage devices
>  * crypto: support for passing secrets to QEMU via Linux keyring
>  * crypto: support for LUKS keyslot management via qemu-img
>  * NVMe: support for Persistent Memory Region from NVMe 1.4 spec
>  * qemu-img: additional features added for map/convert/measure commands,
>    as well as support for zstd compression
>  * qemu-img: support for new 'bitmap' command for manipulating
>    persistent bitmaps in qcow2 files
>  * virtio: TCG guests can now use vhost-user threads
>  * virtio: vhost-user now supports registering more than 8 RAM slots
> 
>  * and lots more...
> 
> Thank you to everyone involved!
> 

