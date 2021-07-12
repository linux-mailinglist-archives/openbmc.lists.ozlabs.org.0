Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8563C6623
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 00:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNydb5nCCz3bWS
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:10:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir;
 Tue, 13 Jul 2021 08:10:39 AEST
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNydC5mMrz30GN;
 Tue, 13 Jul 2021 08:10:39 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="273894343"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="273894343"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:07:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="464367464"
Received: from jzloch-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.136.11])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:07:27 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent headers
Date: Tue, 13 Jul 2021 00:04:34 +0200
Message-Id: <20210712220447.957418-2-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712220447.957418-1-iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Baseboard management controllers (BMC) often run Linux but are usually
implemented with non-X86 processors. They can use PECI to access package
config space (PCS) registers on the host CPU and since some information,
e.g. figuring out the core count, can be obtained using different
registers on different CPU generations, they need to decode the family
and model.

Move the data from arch/x86/include/asm/intel-family.h into a new file
include/linux/x86/intel-family.h so that it can be used by other
architectures.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
To limit tree-wide changes and help people that were expecting
intel-family defines in arch/x86 to find it more easily without going
through git history, we're not removing the original header
completely, we're keeping it as a "stub" that includes the new one.
If there is a consensus that the tree-wide option is better,
we can choose this approach.

 MAINTAINERS                         |   1 +
 arch/x86/include/asm/intel-family.h | 141 +--------------------------
 include/linux/x86/intel-family.h    | 146 ++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+), 140 deletions(-)
 create mode 100644 include/linux/x86/intel-family.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a61f4f3b78a9..ec5987a00800 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9240,6 +9240,7 @@ M:	x86@kernel.org
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	arch/x86/include/asm/intel-family.h
+F:	include/linux/x86/intel-family.h
 
 INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative chipsets)
 M:	Jani Nikula <jani.nikula@linux.intel.com>
diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index 27158436f322..0d4fe1b4e1f6 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -2,145 +2,6 @@
 #ifndef _ASM_X86_INTEL_FAMILY_H
 #define _ASM_X86_INTEL_FAMILY_H
 
-/*
- * "Big Core" Processors (Branded as Core, Xeon, etc...)
- *
- * While adding a new CPUID for a new microarchitecture, add a new
- * group to keep logically sorted out in chronological order. Within
- * that group keep the CPUID for the variants sorted by model number.
- *
- * The defined symbol names have the following form:
- *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
- * where:
- * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
- *		is assumed to be "_CORE" (and should be omitted). Other values
- *		currently in use are _ATOM and _XEON_PHI
- * MICROARCH	Is the code name for the micro-architecture for this core.
- *		N.B. Not the platform name.
- * OPTDIFF	If needed, a short string to differentiate by market segment.
- *
- *		Common OPTDIFFs:
- *
- *			- regular client parts
- *		_L	- regular mobile parts
- *		_G	- parts with extra graphics on
- *		_X	- regular server parts
- *		_D	- micro server parts
- *
- *		Historical OPTDIFFs:
- *
- *		_EP	- 2 socket server parts
- *		_EX	- 4+ socket server parts
- *
- * The #define line may optionally include a comment including platform or core
- * names. An exception is made for skylake/kabylake where steppings seem to have gotten
- * their own names :-(
- */
-
-/* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
-#define INTEL_FAM6_ANY			X86_MODEL_ANY
-
-#define INTEL_FAM6_CORE_YONAH		0x0E
-
-#define INTEL_FAM6_CORE2_MEROM		0x0F
-#define INTEL_FAM6_CORE2_MEROM_L	0x16
-#define INTEL_FAM6_CORE2_PENRYN		0x17
-#define INTEL_FAM6_CORE2_DUNNINGTON	0x1D
-
-#define INTEL_FAM6_NEHALEM		0x1E
-#define INTEL_FAM6_NEHALEM_G		0x1F /* Auburndale / Havendale */
-#define INTEL_FAM6_NEHALEM_EP		0x1A
-#define INTEL_FAM6_NEHALEM_EX		0x2E
-
-#define INTEL_FAM6_WESTMERE		0x25
-#define INTEL_FAM6_WESTMERE_EP		0x2C
-#define INTEL_FAM6_WESTMERE_EX		0x2F
-
-#define INTEL_FAM6_SANDYBRIDGE		0x2A
-#define INTEL_FAM6_SANDYBRIDGE_X	0x2D
-#define INTEL_FAM6_IVYBRIDGE		0x3A
-#define INTEL_FAM6_IVYBRIDGE_X		0x3E
-
-#define INTEL_FAM6_HASWELL		0x3C
-#define INTEL_FAM6_HASWELL_X		0x3F
-#define INTEL_FAM6_HASWELL_L		0x45
-#define INTEL_FAM6_HASWELL_G		0x46
-
-#define INTEL_FAM6_BROADWELL		0x3D
-#define INTEL_FAM6_BROADWELL_G		0x47
-#define INTEL_FAM6_BROADWELL_X		0x4F
-#define INTEL_FAM6_BROADWELL_D		0x56
-
-#define INTEL_FAM6_SKYLAKE_L		0x4E	/* Sky Lake             */
-#define INTEL_FAM6_SKYLAKE		0x5E	/* Sky Lake             */
-#define INTEL_FAM6_SKYLAKE_X		0x55	/* Sky Lake             */
-/*                 CASCADELAKE_X	0x55	   Sky Lake -- s: 7     */
-/*                 COOPERLAKE_X		0x55	   Sky Lake -- s: 11    */
-
-#define INTEL_FAM6_KABYLAKE_L		0x8E	/* Sky Lake             */
-/*                 AMBERLAKE_L		0x8E	   Sky Lake -- s: 9     */
-/*                 COFFEELAKE_L		0x8E	   Sky Lake -- s: 10    */
-/*                 WHISKEYLAKE_L	0x8E       Sky Lake -- s: 11,12 */
-
-#define INTEL_FAM6_KABYLAKE		0x9E	/* Sky Lake             */
-/*                 COFFEELAKE		0x9E	   Sky Lake -- s: 10-13 */
-
-#define INTEL_FAM6_COMETLAKE		0xA5	/* Sky Lake             */
-#define INTEL_FAM6_COMETLAKE_L		0xA6	/* Sky Lake             */
-
-#define INTEL_FAM6_CANNONLAKE_L		0x66	/* Palm Cove */
-
-#define INTEL_FAM6_ICELAKE_X		0x6A	/* Sunny Cove */
-#define INTEL_FAM6_ICELAKE_D		0x6C	/* Sunny Cove */
-#define INTEL_FAM6_ICELAKE		0x7D	/* Sunny Cove */
-#define INTEL_FAM6_ICELAKE_L		0x7E	/* Sunny Cove */
-#define INTEL_FAM6_ICELAKE_NNPI		0x9D	/* Sunny Cove */
-
-#define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
-
-#define INTEL_FAM6_ROCKETLAKE		0xA7	/* Cypress Cove */
-
-#define INTEL_FAM6_TIGERLAKE_L		0x8C	/* Willow Cove */
-#define INTEL_FAM6_TIGERLAKE		0x8D	/* Willow Cove */
-
-#define INTEL_FAM6_SAPPHIRERAPIDS_X	0x8F	/* Golden Cove */
-
-#define INTEL_FAM6_ALDERLAKE		0x97	/* Golden Cove / Gracemont */
-#define INTEL_FAM6_ALDERLAKE_L		0x9A	/* Golden Cove / Gracemont */
-
-/* "Small Core" Processors (Atom) */
-
-#define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
-#define INTEL_FAM6_ATOM_BONNELL_MID	0x26 /* Silverthorne, Lincroft */
-
-#define INTEL_FAM6_ATOM_SALTWELL	0x36 /* Cedarview */
-#define INTEL_FAM6_ATOM_SALTWELL_MID	0x27 /* Penwell */
-#define INTEL_FAM6_ATOM_SALTWELL_TABLET	0x35 /* Cloverview */
-
-#define INTEL_FAM6_ATOM_SILVERMONT	0x37 /* Bay Trail, Valleyview */
-#define INTEL_FAM6_ATOM_SILVERMONT_D	0x4D /* Avaton, Rangely */
-#define INTEL_FAM6_ATOM_SILVERMONT_MID	0x4A /* Merriefield */
-
-#define INTEL_FAM6_ATOM_AIRMONT		0x4C /* Cherry Trail, Braswell */
-#define INTEL_FAM6_ATOM_AIRMONT_MID	0x5A /* Moorefield */
-#define INTEL_FAM6_ATOM_AIRMONT_NP	0x75 /* Lightning Mountain */
-
-#define INTEL_FAM6_ATOM_GOLDMONT	0x5C /* Apollo Lake */
-#define INTEL_FAM6_ATOM_GOLDMONT_D	0x5F /* Denverton */
-
-/* Note: the micro-architecture is "Goldmont Plus" */
-#define INTEL_FAM6_ATOM_GOLDMONT_PLUS	0x7A /* Gemini Lake */
-
-#define INTEL_FAM6_ATOM_TREMONT_D	0x86 /* Jacobsville */
-#define INTEL_FAM6_ATOM_TREMONT		0x96 /* Elkhart Lake */
-#define INTEL_FAM6_ATOM_TREMONT_L	0x9C /* Jasper Lake */
-
-/* Xeon Phi */
-
-#define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */
-#define INTEL_FAM6_XEON_PHI_KNM		0x85 /* Knights Mill */
-
-/* Family 5 */
-#define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
+#include <linux/x86/intel-family.h>
 
 #endif /* _ASM_X86_INTEL_FAMILY_H */
diff --git a/include/linux/x86/intel-family.h b/include/linux/x86/intel-family.h
new file mode 100644
index 000000000000..ae4b075c1ab9
--- /dev/null
+++ b/include/linux/x86/intel-family.h
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_X86_INTEL_FAMILY_H
+#define _LINUX_X86_INTEL_FAMILY_H
+
+/*
+ * "Big Core" Processors (Branded as Core, Xeon, etc...)
+ *
+ * While adding a new CPUID for a new microarchitecture, add a new
+ * group to keep logically sorted out in chronological order. Within
+ * that group keep the CPUID for the variants sorted by model number.
+ *
+ * The defined symbol names have the following form:
+ *	INTEL_FAM6{OPTFAMILY}_{MICROARCH}{OPTDIFF}
+ * where:
+ * OPTFAMILY	Describes the family of CPUs that this belongs to. Default
+ *		is assumed to be "_CORE" (and should be omitted). Other values
+ *		currently in use are _ATOM and _XEON_PHI
+ * MICROARCH	Is the code name for the micro-architecture for this core.
+ *		N.B. Not the platform name.
+ * OPTDIFF	If needed, a short string to differentiate by market segment.
+ *
+ *		Common OPTDIFFs:
+ *
+ *			- regular client parts
+ *		_L	- regular mobile parts
+ *		_G	- parts with extra graphics on
+ *		_X	- regular server parts
+ *		_D	- micro server parts
+ *
+ *		Historical OPTDIFFs:
+ *
+ *		_EP	- 2 socket server parts
+ *		_EX	- 4+ socket server parts
+ *
+ * The #define line may optionally include a comment including platform or core
+ * names. An exception is made for skylake/kabylake where steppings seem to have gotten
+ * their own names :-(
+ */
+
+/* Wildcard match for FAM6 so X86_MATCH_INTEL_FAM6_MODEL(ANY) works */
+#define INTEL_FAM6_ANY			X86_MODEL_ANY
+
+#define INTEL_FAM6_CORE_YONAH		0x0E
+
+#define INTEL_FAM6_CORE2_MEROM		0x0F
+#define INTEL_FAM6_CORE2_MEROM_L	0x16
+#define INTEL_FAM6_CORE2_PENRYN		0x17
+#define INTEL_FAM6_CORE2_DUNNINGTON	0x1D
+
+#define INTEL_FAM6_NEHALEM		0x1E
+#define INTEL_FAM6_NEHALEM_G		0x1F /* Auburndale / Havendale */
+#define INTEL_FAM6_NEHALEM_EP		0x1A
+#define INTEL_FAM6_NEHALEM_EX		0x2E
+
+#define INTEL_FAM6_WESTMERE		0x25
+#define INTEL_FAM6_WESTMERE_EP		0x2C
+#define INTEL_FAM6_WESTMERE_EX		0x2F
+
+#define INTEL_FAM6_SANDYBRIDGE		0x2A
+#define INTEL_FAM6_SANDYBRIDGE_X	0x2D
+#define INTEL_FAM6_IVYBRIDGE		0x3A
+#define INTEL_FAM6_IVYBRIDGE_X		0x3E
+
+#define INTEL_FAM6_HASWELL		0x3C
+#define INTEL_FAM6_HASWELL_X		0x3F
+#define INTEL_FAM6_HASWELL_L		0x45
+#define INTEL_FAM6_HASWELL_G		0x46
+
+#define INTEL_FAM6_BROADWELL		0x3D
+#define INTEL_FAM6_BROADWELL_G		0x47
+#define INTEL_FAM6_BROADWELL_X		0x4F
+#define INTEL_FAM6_BROADWELL_D		0x56
+
+#define INTEL_FAM6_SKYLAKE_L		0x4E	/* Sky Lake             */
+#define INTEL_FAM6_SKYLAKE		0x5E	/* Sky Lake             */
+#define INTEL_FAM6_SKYLAKE_X		0x55	/* Sky Lake             */
+/*                 CASCADELAKE_X	0x55	   Sky Lake -- s: 7     */
+/*                 COOPERLAKE_X		0x55	   Sky Lake -- s: 11    */
+
+#define INTEL_FAM6_KABYLAKE_L		0x8E	/* Sky Lake             */
+/*                 AMBERLAKE_L		0x8E	   Sky Lake -- s: 9     */
+/*                 COFFEELAKE_L		0x8E	   Sky Lake -- s: 10    */
+/*                 WHISKEYLAKE_L	0x8E       Sky Lake -- s: 11,12 */
+
+#define INTEL_FAM6_KABYLAKE		0x9E	/* Sky Lake             */
+/*                 COFFEELAKE		0x9E	   Sky Lake -- s: 10-13 */
+
+#define INTEL_FAM6_COMETLAKE		0xA5	/* Sky Lake             */
+#define INTEL_FAM6_COMETLAKE_L		0xA6	/* Sky Lake             */
+
+#define INTEL_FAM6_CANNONLAKE_L		0x66	/* Palm Cove */
+
+#define INTEL_FAM6_ICELAKE_X		0x6A	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE_D		0x6C	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE		0x7D	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE_L		0x7E	/* Sunny Cove */
+#define INTEL_FAM6_ICELAKE_NNPI		0x9D	/* Sunny Cove */
+
+#define INTEL_FAM6_LAKEFIELD		0x8A	/* Sunny Cove / Tremont */
+
+#define INTEL_FAM6_ROCKETLAKE		0xA7	/* Cypress Cove */
+
+#define INTEL_FAM6_TIGERLAKE_L		0x8C	/* Willow Cove */
+#define INTEL_FAM6_TIGERLAKE		0x8D	/* Willow Cove */
+
+#define INTEL_FAM6_SAPPHIRERAPIDS_X	0x8F	/* Golden Cove */
+
+#define INTEL_FAM6_ALDERLAKE		0x97	/* Golden Cove / Gracemont */
+#define INTEL_FAM6_ALDERLAKE_L		0x9A	/* Golden Cove / Gracemont */
+
+/* "Small Core" Processors (Atom) */
+
+#define INTEL_FAM6_ATOM_BONNELL		0x1C /* Diamondville, Pineview */
+#define INTEL_FAM6_ATOM_BONNELL_MID	0x26 /* Silverthorne, Lincroft */
+
+#define INTEL_FAM6_ATOM_SALTWELL	0x36 /* Cedarview */
+#define INTEL_FAM6_ATOM_SALTWELL_MID	0x27 /* Penwell */
+#define INTEL_FAM6_ATOM_SALTWELL_TABLET	0x35 /* Cloverview */
+
+#define INTEL_FAM6_ATOM_SILVERMONT	0x37 /* Bay Trail, Valleyview */
+#define INTEL_FAM6_ATOM_SILVERMONT_D	0x4D /* Avaton, Rangely */
+#define INTEL_FAM6_ATOM_SILVERMONT_MID	0x4A /* Merriefield */
+
+#define INTEL_FAM6_ATOM_AIRMONT		0x4C /* Cherry Trail, Braswell */
+#define INTEL_FAM6_ATOM_AIRMONT_MID	0x5A /* Moorefield */
+#define INTEL_FAM6_ATOM_AIRMONT_NP	0x75 /* Lightning Mountain */
+
+#define INTEL_FAM6_ATOM_GOLDMONT	0x5C /* Apollo Lake */
+#define INTEL_FAM6_ATOM_GOLDMONT_D	0x5F /* Denverton */
+
+/* Note: the micro-architecture is "Goldmont Plus" */
+#define INTEL_FAM6_ATOM_GOLDMONT_PLUS	0x7A /* Gemini Lake */
+
+#define INTEL_FAM6_ATOM_TREMONT_D	0x86 /* Jacobsville */
+#define INTEL_FAM6_ATOM_TREMONT		0x96 /* Elkhart Lake */
+#define INTEL_FAM6_ATOM_TREMONT_L	0x9C /* Jasper Lake */
+
+/* Xeon Phi */
+
+#define INTEL_FAM6_XEON_PHI_KNL		0x57 /* Knights Landing */
+#define INTEL_FAM6_XEON_PHI_KNM		0x85 /* Knights Mill */
+
+/* Family 5 */
+#define INTEL_FAM5_QUARK_X1000		0x09 /* Quark X1000 SoC */
+
+#endif /* _LINUX_X86_INTEL_FAMILY_H */
-- 
2.31.1

