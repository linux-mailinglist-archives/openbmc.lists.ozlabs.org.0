Return-Path: <openbmc+bounces-1394-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLpWIQ1GlmmYdAIAu9opvQ
	(envelope-from <openbmc+bounces-1394-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 00:06:53 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C30015ACBE
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 00:06:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGXF604Vjz30T8;
	Thu, 19 Feb 2026 10:06:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771434191;
	cv=none; b=FTrJ54I82zpSd0XDuaLFiBjZ5iq44rA91AOXlrlP7wnE7F4uavR/oYpdiIm3NWOMvX82bQyq2c041vZRakpKQiiwLP07eb/ltArM2SulZAh+riq9gj3CsK/2m1edrb91j2RnSnW3ZVIo3AwKpH9PisU9AOZ0XK9EN0oNxkJX6rG1RVRp8zi7VSrZYs3MvbCF5M6K06F3GbTn5uJ618dGT+0DVH5IkLRJKrx+xvLvlC4eOm6VXSMpkuQ4GZ0Me3A03NQuUuPunuW4AmvraVFTs5UI5ifDrhCQabKvxeXraRoXNGn+yBaHJsG+fCLnzQqLfd8VKQMko/TwCj0J5Nl8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771434191; c=relaxed/relaxed;
	bh=PPQiehVUxxlaaVeM8hYY983DxjhRsJW6O8MPpKRfBI4=;
	h=Subject:To:Cc:From:Date:Message-Id; b=bbk+9nRpJzwwVHhe+IjqqW9bSgX50S35VH2rRaHsh8npfG5FDFQ5VMIWx1kJ9N7J+g8prLDTgKIZPrcplMJ9/U72jPrEmLvBvM1vXT3ZX7sg6Ff2XzRtRUT2LXQ0ztxmTXE40ObsiIjVe7LoGHQMSox5eoIbABbBe6tyBZx/pOHAimSaxsILpnLHlviEzLa2+TPSZ6kMEN3TbYnUSIh8f629aGbb01gUUrafPH+/bF9f2LkRh1wtOMHhtKtcIQAr0cw9+OW21OY8uKBIju6dyV/NjhCgO6cGHxlIXIk37kwvYw4YhLqknBUKHsuqBYkhMxHJAuif6GVzFk82ClDmxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qn7A3RjX; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dave.hansen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qn7A3RjX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dave.hansen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGNB44DqRz2xLv
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 04:03:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771434189; x=1802970189;
  h=subject:to:cc:from:date:message-id;
  bh=7ixHhnajxdOxxx0q+7kFRn5X1IlfFCdzlkbTV3qPsjw=;
  b=Qn7A3RjXXERvaFCfxL2evCwmLSAC7nba3Kpjm0JhAnLd78r8HHYiLL4/
   tvvNNkJkJuCWkQHyuMdcxpbRDFscrEYplAl1UP6fB9X0uvHIwCuthMUZ2
   NXbvUnXJ8UG2rnOKUioMcBSJst0ejORUfsG/nVF8BrBf/6m0T3ELMxhVq
   VxFI23PHnGkNNQbuXV+UQVUSTCcn2nRi3WJqfokkhYuMzHZw5GepF6zH7
   GYfWNAohJnuSrldi9Ve1aJSI9Iun8WwJQkin2wgHy07lbuy5bMxBRRnUp
   mr1ebb92m6IL4TwT9Ytqk+Ycd4oNN1bNEeQ729q9XqFvfVPAUEbxM0I1K
   w==;
X-CSE-ConnectionGUID: coutUL4ST6mHh7ulBdFd+A==
X-CSE-MsgGUID: 6MUckRbZTrmdmXNDtzl/lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72558285"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72558285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 09:03:02 -0800
X-CSE-ConnectionGUID: 6ypO7inyQ2C4tSxaeYKC0A==
X-CSE-MsgGUID: L1Sk8jOXQHCJ4tzEimzrsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="219252877"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2026 09:03:02 -0800
Subject: [PATCH] peci: Remove dependency on x86 CPU variables
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Iwona Winiarska <iwona.winiarska@intel.com>, linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, Thomas Gleixner <tglx@kernel.org>, Tony Luck <tony.luck@intel.com>, x86@kernel.org
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 18 Feb 2026 09:03:01 -0800
Message-Id: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1394-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dave.hansen@linux.intel.com,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:dave.hansen@linux.intel.com,m:bp@alien8.de,m:linux@roeck-us.net,m:hpa@zytor.com,m:mingo@redhat.com,m:iwona.winiarska@intel.com,m:linux-hwmon@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:tglx@kernel.org,m:tony.luck@intel.com,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[dave.hansen@linux.intel.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ozlabs.org:email,roeck-us.net:email]
X-Rspamd-Queue-Id: 4C30015ACBE
X-Rspamd-Action: no action


From: Dave Hansen <dave.hansen@linux.intel.com>

tl;dr: The non-x86 PECI driver #includes an arch/x86 header.  This is
ostensibly to avoid duplicating CPU model number constants, but the
result is complexity and duplicated *code* which is a far worse fate
than duplicated constants.

Remove the PECI dependency on arch/x86 by adding a list of supported
"target" CPU models in the driver.

This is only compile tested.

Long version:

== Background ==

The "PECI" driver runs on non-x86 hardware inside an x86 system.  It
talks to the x86 CPU. The PECI hardware has different features based on
platform generations and uses the CPU model to control feature
detections.

Basically, instead of a PCI or USB device ID that a USB or PCI driver
would use, the PECI driver uses the CPU model (and family).

The arch/x86 code unsurprisingly has a list of CPU model numbers and the
PECI code currently reuses that list. But the arch/x86 list is
maintained in the "Display" format which is different than the binary
format that CPUID (and PECI hardware) uses.

== Problem ==

The end result is that the PECI code #includes the arch/x86 constants
header and then duplicates some code that transforms the CPUID to the
"Display" format. This is fragile because it's easy for us x86 folks to
break the PECI driver when assuming that arch/x86 is x86-only.

== Solution ==

Remove the arch/x86 dependency. Instead of duplicating the
CPUID=>Display functionality, just duplicate the constants.

Also rename the formerly "x86_vfm" variables. They are not in the VFM
format any longer. They are purely device IDs.  Name them appropriately.

The result is a net code removal. The only downside is that the PECI
folks need to add a #define whenever there is a new CPU model. But, they
need to go add new CPU model to the driver explicitly *anyway*.

== Notes ==

One little wrinkle in this is that the CPU identifier that comes back
from the PECI hardware contains the CPU stepping just like
CPUID.01H:EAX. But the stepping is ignored by the PECI driver.

So, the PECI_INTEL_* identifiers are just defined with the stepping
shifted off the beginning. They could have been defined with a 0 there
and then have the stepping masked somewhere.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: Tony Luck <tony.luck@intel.com>
Cc: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---

 b/drivers/hwmon/peci/cputemp.c |   10 ++++-----
 b/drivers/peci/core.c          |    4 +--
 b/drivers/peci/cpu.c           |   16 +++++++--------
 b/drivers/peci/device.c        |   40 ++++++++++++---------------------------
 b/drivers/peci/internal.h      |    4 +--
 b/include/linux/peci-cpu.h     |   42 ++++++++++++++++-------------------------
 b/include/linux/peci.h         |    2 -
 7 files changed, 48 insertions(+), 70 deletions(-)

diff -puN drivers/peci/device.c~peci-sanity drivers/peci/device.c
--- a/drivers/peci/device.c~peci-sanity	2026-02-18 08:19:42.368396631 -0800
+++ b/drivers/peci/device.c	2026-02-18 08:55:48.107887339 -0800
@@ -57,39 +57,25 @@ static int peci_get_cpu_id(struct peci_d
 	if (ret)
 		goto out_req_free;
 
+	/*
+	 * The id that comes back from the hardware is in the raw
+	 * format of x86 CPUID.01H:EAX leaf and includes the CPU
+	 * Model, Family and Stepping.
+	 */
 	*cpu_id = peci_request_data_readl(req);
+
+	/*
+	 * Remove the stepping (CPUID.01H:EAX[3:0]) to match the
+	 * PECI_INTEL_* identifiers:
+	 */
+	*cpu_id >>= 4;
+
 out_req_free:
 	peci_request_free(req);
 
 	return ret;
 }
 
-static unsigned int peci_x86_cpu_family(unsigned int sig)
-{
-	unsigned int x86;
-
-	x86 = (sig >> 8) & 0xf;
-
-	if (x86 == 0xf)
-		x86 += (sig >> 20) & 0xff;
-
-	return x86;
-}
-
-static unsigned int peci_x86_cpu_model(unsigned int sig)
-{
-	unsigned int fam, model;
-
-	fam = peci_x86_cpu_family(sig);
-
-	model = (sig >> 4) & 0xf;
-
-	if (fam >= 0x6)
-		model += ((sig >> 16) & 0xf) << 4;
-
-	return model;
-}
-
 static int peci_device_info_init(struct peci_device *device)
 {
 	u8 revision;
@@ -100,7 +86,7 @@ static int peci_device_info_init(struct
 	if (ret)
 		return ret;
 
-	device->info.x86_vfm = IFM(peci_x86_cpu_family(cpu_id), peci_x86_cpu_model(cpu_id));
+	device->info.device_id = cpu_id;
 
 	ret = peci_get_revision(device, &revision);
 	if (ret)
diff -puN drivers/peci/internal.h~peci-sanity drivers/peci/internal.h
--- a/drivers/peci/internal.h~peci-sanity	2026-02-18 08:19:42.370396706 -0800
+++ b/drivers/peci/internal.h	2026-02-18 08:19:42.388397383 -0800
@@ -66,11 +66,11 @@ struct peci_request *peci_xfer_ep_mmio64
 /**
  * struct peci_device_id - PECI device data to match
  * @data: pointer to driver private data specific to device
- * @x86_vfm: device vendor-family-model
+ * @device_id: device identifier, includes CPU vendor-family-model
  */
 struct peci_device_id {
 	const void *data;
-	u32 x86_vfm;
+	u32 device_id;
 };
 
 extern const struct device_type peci_device_type;
diff -puN include/linux/peci.h~peci-sanity include/linux/peci.h
--- a/include/linux/peci.h~peci-sanity	2026-02-18 08:19:42.371396743 -0800
+++ b/include/linux/peci.h	2026-02-18 08:19:42.388397383 -0800
@@ -72,7 +72,7 @@ static inline struct peci_controller *to
 struct peci_device {
 	struct device dev;
 	struct {
-		u32 x86_vfm;
+		u32 device_id;
 		u8 peci_revision;
 		u8 socket_id;
 	} info;
diff -puN drivers/hwmon/peci/cputemp.c~peci-sanity drivers/hwmon/peci/cputemp.c
--- a/drivers/hwmon/peci/cputemp.c~peci-sanity	2026-02-18 08:19:42.373396819 -0800
+++ b/drivers/hwmon/peci/cputemp.c	2026-02-18 08:19:42.388397383 -0800
@@ -340,11 +340,11 @@ static int init_core_mask(struct peci_cp
 	int ret;
 
 	/* Get the RESOLVED_CORES register value */
-	switch (peci_dev->info.x86_vfm) {
-	case INTEL_ICELAKE_X:
-	case INTEL_ICELAKE_D:
-	case INTEL_SAPPHIRERAPIDS_X:
-	case INTEL_EMERALDRAPIDS_X:
+	switch (peci_dev->info.device_id) {
+	case PECI_INTEL_ICELAKE_X:
+	case PECI_INTEL_ICELAKE_D:
+	case PECI_INTEL_SAPPHIRERAPIDS_X:
+	case PECI_INTEL_EMERALDRAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
diff -puN drivers/peci/core.c~peci-sanity drivers/peci/core.c
--- a/drivers/peci/core.c~peci-sanity	2026-02-18 08:19:42.375396894 -0800
+++ b/drivers/peci/core.c	2026-02-18 08:19:42.388397383 -0800
@@ -163,8 +163,8 @@ EXPORT_SYMBOL_NS_GPL(devm_peci_controlle
 static const struct peci_device_id *
 peci_bus_match_device_id(const struct peci_device_id *id, struct peci_device *device)
 {
-	while (id->x86_vfm != 0) {
-		if (id->x86_vfm == device->info.x86_vfm)
+	while (id->device_id != 0) {
+		if (id->device_id == device->info.device_id)
 			return id;
 		id++;
 	}
diff -puN include/linux/peci-cpu.h~peci-sanity include/linux/peci-cpu.h
--- a/include/linux/peci-cpu.h~peci-sanity	2026-02-18 08:19:42.376396932 -0800
+++ b/include/linux/peci-cpu.h	2026-02-18 08:19:42.388397383 -0800
@@ -6,31 +6,23 @@
 
 #include <linux/types.h>
 
-/* Copied from x86 <asm/processor.h> */
-#define X86_VENDOR_INTEL       0
-
-/* Copied from x86 <asm/cpu_device_id.h> */
-#define VFM_MODEL_BIT	0
-#define VFM_FAMILY_BIT	8
-#define VFM_VENDOR_BIT	16
-#define VFM_RSVD_BIT	24
-
-#define	VFM_MODEL_MASK	GENMASK(VFM_FAMILY_BIT - 1, VFM_MODEL_BIT)
-#define	VFM_FAMILY_MASK	GENMASK(VFM_VENDOR_BIT - 1, VFM_FAMILY_BIT)
-#define	VFM_VENDOR_MASK	GENMASK(VFM_RSVD_BIT - 1, VFM_VENDOR_BIT)
-
-#define VFM_MODEL(vfm)	(((vfm) & VFM_MODEL_MASK) >> VFM_MODEL_BIT)
-#define VFM_FAMILY(vfm)	(((vfm) & VFM_FAMILY_MASK) >> VFM_FAMILY_BIT)
-#define VFM_VENDOR(vfm)	(((vfm) & VFM_VENDOR_MASK) >> VFM_VENDOR_BIT)
-
-#define	VFM_MAKE(_vendor, _family, _model) (	\
-	((_model) << VFM_MODEL_BIT) |		\
-	((_family) << VFM_FAMILY_BIT) |		\
-	((_vendor) << VFM_VENDOR_BIT)		\
-)
-/* End of copied code */
-
-#include "../../arch/x86/include/asm/intel-family.h"
+/*
+ * These are in the format of and match the values of the x86
+ * CPUID.01H:EAX[19:4]. They encode the model and family of
+ * the CPU with which the driver is interfacing.
+ *
+ * All driver functionality is common across all CPU steppings
+ * of a given model, so the lower 4 stepping bits are excluded
+ * from these IDs.
+ */
+#define PECI_INTEL_HASWELL_X		0x306C
+#define PECI_INTEL_BROADWELL_X		0x406F
+#define PECI_INTEL_BROADWELL_D		0x5066
+#define PECI_INTEL_SKYLAKE_X		0x5065
+#define PECI_INTEL_ICELAKE_X		0x606A
+#define PECI_INTEL_ICELAKE_D		0x606C
+#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
+#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
 
 #define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
 #define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
diff -puN drivers/peci/cpu.c~peci-sanity drivers/peci/cpu.c
--- a/drivers/peci/cpu.c~peci-sanity	2026-02-18 08:19:42.380397082 -0800
+++ b/drivers/peci/cpu.c	2026-02-18 08:19:42.389397421 -0800
@@ -294,35 +294,35 @@ peci_cpu_probe(struct peci_device *devic
 
 static const struct peci_device_id peci_cpu_device_ids[] = {
 	{ /* Haswell Xeon */
-		.x86_vfm = INTEL_HASWELL_X,
+		.device_id = PECI_INTEL_HASWELL_X,
 		.data	= "hsx",
 	},
 	{ /* Broadwell Xeon */
-		.x86_vfm = INTEL_BROADWELL_X,
+		.device_id = PECI_INTEL_BROADWELL_X,
 		.data	= "bdx",
 	},
 	{ /* Broadwell Xeon D */
-		.x86_vfm = INTEL_BROADWELL_D,
+		.device_id = PECI_INTEL_BROADWELL_D,
 		.data	= "bdxd",
 	},
 	{ /* Skylake Xeon */
-		.x86_vfm = INTEL_SKYLAKE_X,
+		.device_id = PECI_INTEL_SKYLAKE_X,
 		.data	= "skx",
 	},
 	{ /* Icelake Xeon */
-		.x86_vfm = INTEL_ICELAKE_X,
+		.device_id = PECI_INTEL_ICELAKE_X,
 		.data	= "icx",
 	},
 	{ /* Icelake Xeon D */
-		.x86_vfm = INTEL_ICELAKE_D,
+		.device_id = PECI_INTEL_ICELAKE_D,
 		.data	= "icxd",
 	},
 	{ /* Sapphire Rapids Xeon */
-		.x86_vfm = INTEL_SAPPHIRERAPIDS_X,
+		.device_id = PECI_INTEL_SAPPHIRERAPIDS_X,
 		.data	= "spr",
 	},
 	{ /* Emerald Rapids Xeon */
-		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
+		.device_id  = PECI_INTEL_EMERALDRAPIDS_X,
 		.data  = "emr",
 	},
 	{ }
_

