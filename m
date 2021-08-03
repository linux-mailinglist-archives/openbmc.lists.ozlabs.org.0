Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09C13DF8D1
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 02:17:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfXPT6HB6z3cjv
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 10:17:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfCSk6LYdz3bX6;
 Tue,  3 Aug 2021 21:34:14 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="299247188"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="299247188"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 04:33:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="458243133"
Received: from jdanieck-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.128.99])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 04:33:04 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 02/15] x86/cpu: Extract cpuid helpers to arch-independent
Date: Tue,  3 Aug 2021 13:31:21 +0200
Message-Id: <20210803113134.2262882-3-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803113134.2262882-1-iwona.winiarska@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Aug 2021 10:16:27 +1000
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
 Dan Williams <dan.j.williams@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Iwona Winiarska <iwona.winiarska@intel.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Yazen Ghannam <yazen.ghannam@amd.com>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Baseboard management controllers (BMC) often run Linux but are usually
implemented with non-X86 processors. They can use PECI to access package
config space (PCS) registers on the host CPU and since some information,
e.g. figuring out the core count, can be obtained using different
registers on different CPU generations, they need to decode the family
and model.

The format of Package Identifier PCS register that describes CPUID
information has the same layout as CPUID_1.EAX, so let's allow to reuse
cpuid helpers by making it available for other architectures as well.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 MAINTAINERS                      | 1 +
 arch/x86/Kconfig                 | 1 +
 arch/x86/include/asm/cpu.h       | 3 ---
 arch/x86/include/asm/microcode.h | 2 +-
 arch/x86/kvm/cpuid.h             | 3 ++-
 arch/x86/lib/Makefile            | 2 +-
 drivers/edac/mce_amd.c           | 3 +--
 include/linux/x86/cpu.h          | 9 +++++++++
 lib/Kconfig                      | 4 ++++
 lib/Makefile                     | 2 ++
 lib/x86/Makefile                 | 3 +++
 {arch/x86/lib => lib/x86}/cpu.c  | 2 +-
 12 files changed, 26 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/x86/cpu.h
 create mode 100644 lib/x86/Makefile
 rename {arch/x86/lib => lib/x86}/cpu.c (95%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 104773d40952..7cdab7229651 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20107,6 +20107,7 @@ F:	Documentation/devicetree/bindings/x86/
 F:	Documentation/x86/
 F:	arch/x86/
 F:	include/linux/x86/
+F:	lib/x86/
 
 X86 ENTRY CODE
 M:	Andy Lutomirski <luto@kernel.org>
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 88fb922c23a0..9096593999ba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -141,6 +141,7 @@ config X86
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_RESERVATION_MODE
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_X86
 	select GENERIC_PENDING_IRQ		if SMP
 	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index 33d41e350c79..2a663a05a795 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -37,9 +37,6 @@ extern int _debug_hotplug_cpu(int cpu, int action);
 
 int mwait_usable(const struct cpuinfo_x86 *);
 
-unsigned int x86_family(unsigned int sig);
-unsigned int x86_model(unsigned int sig);
-unsigned int x86_stepping(unsigned int sig);
 #ifdef CONFIG_CPU_SUP_INTEL
 extern void __init sld_setup(struct cpuinfo_x86 *c);
 extern void switch_to_sld(unsigned long tifn);
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index ab45a220fac4..4b0eabf63b98 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -2,9 +2,9 @@
 #ifndef _ASM_X86_MICROCODE_H
 #define _ASM_X86_MICROCODE_H
 
-#include <asm/cpu.h>
 #include <linux/earlycpio.h>
 #include <linux/initrd.h>
+#include <linux/x86/cpu.h>
 
 struct ucode_patch {
 	struct list_head plist;
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index c99edfff7f82..bf070d2a2175 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -4,10 +4,11 @@
 
 #include "x86.h"
 #include "reverse_cpuid.h"
-#include <asm/cpu.h>
 #include <asm/processor.h>
 #include <uapi/asm/kvm_para.h>
 
+#include <linux/x86/cpu.h>
+
 extern u32 kvm_cpu_caps[NR_KVM_CPU_CAPS] __read_mostly;
 void kvm_set_cpu_caps(void);
 
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index bad4dee4f0e4..fd73c1b72c3e 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -41,7 +41,7 @@ clean-files := inat-tables.c
 
 obj-$(CONFIG_SMP) += msr-smp.o cache-smp.o
 
-lib-y := delay.o misc.o cmdline.o cpu.o
+lib-y := delay.o misc.o cmdline.o
 lib-y += usercopy_$(BITS).o usercopy.o getuser.o putuser.o
 lib-y += memcpy_$(BITS).o
 lib-$(CONFIG_ARCH_HAS_COPY_MC) += copy_mc.o copy_mc_64.o
diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index 27d56920b469..f545f5fad02c 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -1,8 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/module.h>
 #include <linux/slab.h>
-
-#include <asm/cpu.h>
+#include <linux/x86/cpu.h>
 
 #include "mce_amd.h"
 
diff --git a/include/linux/x86/cpu.h b/include/linux/x86/cpu.h
new file mode 100644
index 000000000000..5f383d47886d
--- /dev/null
+++ b/include/linux/x86/cpu.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LINUX_X86_CPU_H
+#define _LINUX_X86_CPU_H
+
+unsigned int x86_family(unsigned int sig);
+unsigned int x86_model(unsigned int sig);
+unsigned int x86_stepping(unsigned int sig);
+
+#endif /* _LINUX_X86_CPU_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index 5c9c0687f76d..e538d4d773bd 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -715,3 +715,7 @@ config PLDMFW
 
 config ASN1_ENCODER
        tristate
+
+config GENERIC_LIB_X86
+	bool
+	depends on X86
diff --git a/lib/Makefile b/lib/Makefile
index 5efd1b435a37..befbd9413432 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -360,3 +360,5 @@ obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
 obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
+
+obj-$(CONFIG_GENERIC_LIB_X86) += x86/
diff --git a/lib/x86/Makefile b/lib/x86/Makefile
new file mode 100644
index 000000000000..342024c272fc
--- /dev/null
+++ b/lib/x86/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-y := cpu.o
diff --git a/arch/x86/lib/cpu.c b/lib/x86/cpu.c
similarity index 95%
rename from arch/x86/lib/cpu.c
rename to lib/x86/cpu.c
index 7ad68917a51e..17af59a2fddf 100644
--- a/arch/x86/lib/cpu.c
+++ b/lib/x86/cpu.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/types.h>
 #include <linux/export.h>
-#include <asm/cpu.h>
+#include <linux/x86/cpu.h>
 
 unsigned int x86_family(unsigned int sig)
 {
-- 
2.31.1

