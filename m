Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7F576B66
	for <lists+openbmc@lfdr.de>; Sat, 16 Jul 2022 05:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlCgH6WtNz3c7y
	for <lists+openbmc@lfdr.de>; Sat, 16 Jul 2022 13:01:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJuh8PdW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IJuh8PdW;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlCfq1BvPz3c12
	for <openbmc@lists.ozlabs.org>; Sat, 16 Jul 2022 13:01:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657940483; x=1689476483;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=T/cGF5Nkf4YWawUFDvRxQd3G489QI1/mvWEiFyBeprw=;
  b=IJuh8PdWZpQS+qm6CglVhW/Ey8JYmZx6YD4uJC2t0rvnnYnXMg8u56Dq
   RhlTsfulTDPLYO+emB++1Wkl41n4MF8ItHp0Aa3wFo+RSe6vgjOPd32JR
   znBo9hl1c3COWvgXFNukCWISlUYcFgcSOl/Fjrms7fyOjOqbZEcGLRyHE
   wTZuu/N2Ka4Mau8Q20fDnObqIe6KSCPzwCunttRhg1HQcolcWAdM0wKdU
   Lj8WYwwMJEcWEqimgxLXyIRE9igHFF83gAOrRrgy65c7Yow27uD3m3L32
   vVFteOzS1HLzlJLBX9j2oL0jAw665nQlcpFMbP1gdZGjKG2ukaHIDRjDZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="372254285"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="372254285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 20:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="596679266"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Jul 2022 20:01:00 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCY35-00014O-2o;
	Sat, 16 Jul 2022 03:00:55 +0000
Date: Sat, 16 Jul 2022 11:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
Message-ID: <62d229b5.vqqoX60YvzB2JbT+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: apparmor@lists.ubuntu.com, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-wireless@vger.kernel.org, linux-can@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825  Add linux-next specific files for 20220715

Error/Warning reports:

https://lore.kernel.org/linux-doc/202207021352.PpKTUY8V-lkp@intel.com
https://lore.kernel.org/linux-doc/202207031437.qIh6LFcx-lkp@intel.com
https://lore.kernel.org/linux-doc/202207051821.3f0eRIsL-lkp@intel.com
https://lore.kernel.org/linux-mm/202206292052.LsFui3zO-lkp@intel.com
https://lore.kernel.org/linux-mm/202207160452.HPLSlqzA-lkp@intel.com
https://lore.kernel.org/llvm/202207160039.bfW3l3uk-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/PCI/endpoint/pci-vntb-function.rst:82: WARNING: Unexpected indentation.
Documentation/PCI/endpoint/pci-vntb-howto.rst:131: WARNING: Title underline too short.
Documentation/virt/kvm/api.rst:8265: WARNING: Title underline too short.
Documentation/virt/kvm/api.rst:8272: WARNING: Unexpected indentation.
aarch64-linux-ld: Unexpected GOT/PLT entries detected!
aarch64-linux-ld: Unexpected run-time procedure linkages detected!
drivers/net/wireless/mac80211_hwsim.c:1431:37: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/pci/endpoint/functions/pci-epf-vntb.c:1247: undefined reference to `ntb_register_device'
drivers/pci/endpoint/functions/pci-epf-vntb.c:174: undefined reference to `ntb_link_event'
drivers/pci/endpoint/functions/pci-epf-vntb.c:262: undefined reference to `ntb_db_event'
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
drivers/vfio/vfio_iommu_type1.c:2141:35: warning: cast to smaller integer type 'enum iommu_cap' from 'void *' [-Wvoid-pointer-to-enum-cast]
fs/nfsd/nfsctl.c:1504:17: error: use of undeclared identifier 'NFS4_CLIENTS_PER_GB'
security/apparmor/policy_ns.c:83:20: warning: no previous prototype for 'alloc_unconfined' [-Wmissing-prototypes]
security/apparmor/policy_ns.c:83:20: warning: no previous prototype for function 'alloc_unconfined' [-Wmissing-prototypes]

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/x86/kernel/cpu/rdrand.c:36 x86_init_rdrand() error: uninitialized symbol 'prev'.
drivers/devfreq/mtk-cci-devfreq.c:135 mtk_ccifreq_target() warn: variable dereferenced before check 'drv' (see line 130)
drivers/gpio/gpio-xilinx.c:709:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/gpio/gpiolib-cdev.c:2563:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/gpio/gpiolib.c:2215:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:2994:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/gpu/drm/drm_mipi_dbi.c:876:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/hid/hid-input.c:2276:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/i2c/busses/i2c-designware-master.c:165:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/i2c/busses/i2c-jz4780.c:359:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/i2c/busses/i2c-mt65xx.c:927:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/i2c/busses/i2c-npcm7xx.c:639 npcm_i2c_slave_enable() error: buffer overflow 'npcm_i2caddr' 2 <= 9
drivers/i2c/busses/i2c-s3c2410.c:746:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/i2c/busses/i2c-xiic.c:540:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/iio/industrialio-buffer.c:927:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/md/dm-mpath.c:1681:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/media/cec/i2c/ch7322.c:332:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/mfd/da9062-core.c:323:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/misc/habanalabs/gaudi2/gaudi2.c:8728:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/mmc/host/dw_mmc.c:989:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/net/can/slcan/slcan-core.c:601:14: sparse:    void *
drivers/net/can/slcan/slcan-core.c:601:14: sparse:    void [noderef] __rcu *
drivers/net/can/slcan/slcan-core.c:601:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
drivers/net/phy/phylink.c:887 phylink_change_inband_advert() error: we previously assumed 'pl->pcs' could be null (see line 870)
drivers/nfc/trf7970a.c:631:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/pinctrl/core.c:2093:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/pinctrl/stm32/pinctrl-stm32.c:1627:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/power/supply/bq24190_charger.c:1944:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/power/supply/bq24257_charger.c:1078:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/power/supply/bq25890_charger.c:847:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/power/supply/bq27xxx_battery.c:1123:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/power/supply/rt9455_charger.c:1055:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/power/supply/sbs-battery.c:355:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/regulator/core.c:5171:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/regulator/s2mps11.c:1226:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/regulator/slg51000-regulator.c:436:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/scsi/qla2xxx/qla_os.c:336:5: sparse: sparse: symbol 'ql2xdelay_before_pci_error_handling' was not declared. Should it be static?
drivers/target/target_core_device.c:1013:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/tty/n_gsm.c:1526:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/usb/gadget/composite.c:1080:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
drivers/video/fbdev/sh_mobile_lcdcfb.c:2505:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
fs/ext4/extents.c:1293:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
fs/kernel_read_file.c:61 kernel_read_file() warn: impossible condition '(i_size > (((~0) >> 1))) => (s64min-s64max > s64max)'
include/linux/bits.h:9:41: warning: shift by negative count ('-1') [-Wanalyzer-shift-count-negative]
include/linux/libata.h:2052:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
kernel/params.c:214:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
lib/842/842_decompress.c:210:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
lib/kobject.c:683:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
net/bluetooth/aosp.c:114:1: internal compiler error: in arc_ccfsm_record_condition, at config/arc/arc.cc:5500
net/bluetooth/hci_request.c:2029:1: internal compiler error: in arc_ccfsm_record_condition, at config/arc/arc.cc:5500
net/caif/cfctrl.c:583:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- alpha-randconfig-c004-20220716
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-bios-bios_parser2.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-misc-habanalabs-gaudi2-gaudi2.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-net-wireless-mac80211_hwsim.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   |-- drivers-target-target_core_device.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-alloc_unconfined
|-- arc-randconfig-m031-20220716
|   |-- drivers-devfreq-mtk-cci-devfreq.c-mtk_ccifreq_target()-warn:variable-dereferenced-before-check-drv-(see-line-)
|   `-- drivers-i2c-busses-i2c-npcm7xx.c-npcm_i2c_slave_enable()-error:buffer-overflow-npcm_i2caddr
|-- arc-randconfig-r013-20220715
|   |-- drivers-usb-gadget-composite.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- net-bluetooth-aosp.c:internal-compiler-error:in-arc_ccfsm_record_condition-at-config-arc-arc.cc
|   `-- net-bluetooth-hci_request.c:internal-compiler-error:in-arc_ccfsm_record_condition-at-config-arc-arc.cc
|-- arc-randconfig-r032-20220715
|   |-- drivers-gpio-gpio-xilinx.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-gpio-gpiolib-cdev.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-gpio-gpiolib.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-gpu-drm-drm_mipi_dbi.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-hid-hid-input.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-i2c-busses-i2c-designware-master.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-i2c-busses-i2c-jz4780.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-i2c-busses-i2c-mt65xx.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-i2c-busses-i2c-s3c2410.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-i2c-busses-i2c-xiic.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-iio-industrialio-buffer.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-md-dm-mpath.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-media-cec-i2c-ch7322.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-mfd-da9062-core.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-mmc-host-dw_mmc.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-nfc-trf7970a.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-pinctrl-core.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-pinctrl-stm32-pinctrl-stm32.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-power-supply-bq24190_charger.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-power-supply-bq24257_charger.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-power-supply-bq25890_charger.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-power-supply-bq27xxx_battery.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-power-supply-rt9455_charger.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-power-supply-sbs-battery.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-regulator-core.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-regulator-s2mps11.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
|   |-- drivers-regulator-slg51000-regulator.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.cc
clang_recent_errors
|-- arm-versatile_defconfig
|   `-- fs-nfsd-nfsctl.c:error:use-of-undeclared-identifier-NFS4_CLIENTS_PER_GB
|-- i386-randconfig-a015
|   `-- fs-nfsd-nfsctl.c:error:use-of-undeclared-identifier-NFS4_CLIENTS_PER_GB
|-- powerpc-mvme5100_defconfig
|   `-- fs-nfsd-nfsctl.c:error:use-of-undeclared-identifier-NFS4_CLIENTS_PER_GB
|-- x86_64-randconfig-a001
|   `-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
|-- x86_64-randconfig-a005
|   |-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined
|-- x86_64-randconfig-a012
|   `-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void
|-- x86_64-randconfig-a016
|   `-- security-apparmor-policy_ns.c:warning:no-previous-prototype-for-function-alloc_unconfined
`-- x86_64-randconfig-k001
    `-- drivers-vfio-vfio_iommu_type1.c:warning:cast-to-smaller-integer-type-enum-iommu_cap-from-void

elapsed time: 725m

configs tested: 98
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
sh                        sh7785lcr_defconfig
powerpc                    sam440ep_defconfig
arm                           h3600_defconfig
mips                         cobalt_defconfig
sparc                             allnoconfig
arm                     eseries_pxa_defconfig
xtensa                generic_kc705_defconfig
arm                           sama5_defconfig
sh                         ap325rxa_defconfig
arm                          gemini_defconfig
m68k                        stmark2_defconfig
mips                         rt305x_defconfig
arm                             rpc_defconfig
powerpc                      pasemi_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
xtensa                              defconfig
sh                           se7721_defconfig
arm                           viper_defconfig
sh                        edosk7705_defconfig
alpha                             allnoconfig
powerpc                 mpc8540_ads_defconfig
nios2                         3c120_defconfig
powerpc                     ep8248e_defconfig
riscv                               defconfig
riscv                             allnoconfig
riscv                    nommu_virt_defconfig
i386                              debian-10.3
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
x86_64                        randconfig-c001
ia64                             allmodconfig
csky                              allnoconfig
arc                               allnoconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220715
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
powerpc                     kmeter1_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    mvme5100_defconfig
arm                       versatile_defconfig
arm                              alldefconfig
powerpc                  mpc866_ads_defconfig
mips                     cu1830-neo_defconfig
arm                            dove_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                      obs600_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r045-20220715
hexagon              randconfig-r041-20220715
s390                 randconfig-r044-20220715
riscv                randconfig-r042-20220715

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
