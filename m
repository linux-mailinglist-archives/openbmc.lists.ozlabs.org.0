Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3E44ADD61
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 16:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtS8h58vhz3bTT
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 02:48:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RrCy9KNk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RrCy9KNk; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtS2c2kvSz2xBq;
 Wed,  9 Feb 2022 02:43:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644334985; x=1675870985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBHDjqfyaSPl634ZRAOSij7CSpaHG3dPzGkwpuFKawc=;
 b=RrCy9KNkvMIHdimgvYMg69FPXlEApS8ssaiq9e2WmGWQpwBmaOhmhjXl
 cj4qNs2Mur2YVyi9OvBoSG5IITzzvqcqZN3KB3WpCs0TNfZ+jiM1k6bBO
 0TdGR0+9KogQ2i/SuW7qP57a5FaY7Wbj+ClSq7JNX0N5gn2d0oBz1xWkH
 d5pbq8SDyN4X4wNnj/vnxoZBxH+eV9hB/bZPh+1aEpKCSY3kEUi4NSn/A
 ruPXtsfXs7dOlbNZCpvf6FAocovbGrw4r41UQ3UE00KQAFPvScGSO/7Y3
 xjLAi+nDiJIEL0qDlqxzLn1NASiWSx0It7EJWsbuNWSQ+IKxs10OWuura A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248919297"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="248919297"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:42:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="601273941"
Received: from mgorzkow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.139.232])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:41:55 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 12/13] docs: hwmon: Document PECI drivers
Date: Tue,  8 Feb 2022 16:36:38 +0100
Message-Id: <20220208153639.255278-13-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208153639.255278-1-iwona.winiarska@intel.com>
References: <20220208153639.255278-1-iwona.winiarska@intel.com>
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
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

From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Add documentation for peci-cputemp driver that provides DTS thermal
readings for CPU packages and CPU cores, and peci-dimmtemp driver that
provides Temperature Sensor on DIMM readings.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/index.rst         |  2 +
 Documentation/hwmon/peci-cputemp.rst  | 90 +++++++++++++++++++++++++++
 Documentation/hwmon/peci-dimmtemp.rst | 57 +++++++++++++++++
 MAINTAINERS                           |  2 +
 4 files changed, 151 insertions(+)
 create mode 100644 Documentation/hwmon/peci-cputemp.rst
 create mode 100644 Documentation/hwmon/peci-dimmtemp.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index df20022c741f..f387f661e1d7 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -161,6 +161,8 @@ Hardware Monitoring Kernel Drivers
    pcf8591
    pim4328
    pm6764tr
+   peci-cputemp
+   peci-dimmtemp
    pmbus
    powr1220
    pxe1610
diff --git a/Documentation/hwmon/peci-cputemp.rst b/Documentation/hwmon/peci-cputemp.rst
new file mode 100644
index 000000000000..fe0422248dc5
--- /dev/null
+++ b/Documentation/hwmon/peci-cputemp.rst
@@ -0,0 +1,90 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Kernel driver peci-cputemp
+==========================
+
+Supported chips:
+	One of Intel server CPUs listed below which is connected to a PECI bus.
+		* Intel Xeon E5/E7 v3 server processors
+			Intel Xeon E5-14xx v3 family
+			Intel Xeon E5-24xx v3 family
+			Intel Xeon E5-16xx v3 family
+			Intel Xeon E5-26xx v3 family
+			Intel Xeon E5-46xx v3 family
+			Intel Xeon E7-48xx v3 family
+			Intel Xeon E7-88xx v3 family
+		* Intel Xeon E5/E7 v4 server processors
+			Intel Xeon E5-16xx v4 family
+			Intel Xeon E5-26xx v4 family
+			Intel Xeon E5-46xx v4 family
+			Intel Xeon E7-48xx v4 family
+			Intel Xeon E7-88xx v4 family
+		* Intel Xeon Scalable server processors
+			Intel Xeon D family
+			Intel Xeon Bronze family
+			Intel Xeon Silver family
+			Intel Xeon Gold family
+			Intel Xeon Platinum family
+
+	Datasheet: Available from http://www.intel.com/design/literature.htm
+
+Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+Description
+-----------
+
+This driver implements a generic PECI hwmon feature which provides Digital
+Thermal Sensor (DTS) thermal readings of the CPU package and CPU cores that are
+accessible via the processor PECI interface.
+
+All temperature values are given in millidegree Celsius and will be measurable
+only when the target CPU is powered on.
+
+Sysfs interface
+-------------------
+
+======================= =======================================================
+temp1_label		"Die"
+temp1_input		Provides current die temperature of the CPU package.
+temp1_max		Provides thermal control temperature of the CPU package
+			which is also known as Tcontrol.
+temp1_crit		Provides shutdown temperature of the CPU package which
+			is also known as the maximum processor junction
+			temperature, Tjmax or Tprochot.
+temp1_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
+			the CPU package.
+
+temp2_label		"DTS"
+temp2_input		Provides current temperature of the CPU package scaled
+			to match DTS thermal profile.
+temp2_max		Provides thermal control temperature of the CPU package
+			which is also known as Tcontrol.
+temp2_crit		Provides shutdown temperature of the CPU package which
+			is also known as the maximum processor junction
+			temperature, Tjmax or Tprochot.
+temp2_crit_hyst		Provides the hysteresis value from Tcontrol to Tjmax of
+			the CPU package.
+
+temp3_label		"Tcontrol"
+temp3_input		Provides current Tcontrol temperature of the CPU
+			package which is also known as Fan Temperature target.
+			Indicates the relative value from thermal monitor trip
+			temperature at which fans should be engaged.
+temp3_crit		Provides Tcontrol critical value of the CPU package
+			which is same to Tjmax.
+
+temp4_label		"Tthrottle"
+temp4_input		Provides current Tthrottle temperature of the CPU
+			package. Used for throttling temperature. If this value
+			is allowed and lower than Tjmax - the throttle will
+			occur and reported at lower than Tjmax.
+
+temp5_label		"Tjmax"
+temp5_input		Provides the maximum junction temperature, Tjmax of the
+			CPU package.
+
+temp[6-N]_label		Provides string "Core X", where X is resolved core
+			number.
+temp[6-N]_input		Provides current temperature of each core.
+
+======================= =======================================================
diff --git a/Documentation/hwmon/peci-dimmtemp.rst b/Documentation/hwmon/peci-dimmtemp.rst
new file mode 100644
index 000000000000..e562aed620de
--- /dev/null
+++ b/Documentation/hwmon/peci-dimmtemp.rst
@@ -0,0 +1,57 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver peci-dimmtemp
+===========================
+
+Supported chips:
+	One of Intel server CPUs listed below which is connected to a PECI bus.
+		* Intel Xeon E5/E7 v3 server processors
+			Intel Xeon E5-14xx v3 family
+			Intel Xeon E5-24xx v3 family
+			Intel Xeon E5-16xx v3 family
+			Intel Xeon E5-26xx v3 family
+			Intel Xeon E5-46xx v3 family
+			Intel Xeon E7-48xx v3 family
+			Intel Xeon E7-88xx v3 family
+		* Intel Xeon E5/E7 v4 server processors
+			Intel Xeon E5-16xx v4 family
+			Intel Xeon E5-26xx v4 family
+			Intel Xeon E5-46xx v4 family
+			Intel Xeon E7-48xx v4 family
+			Intel Xeon E7-88xx v4 family
+		* Intel Xeon Scalable server processors
+			Intel Xeon D family
+			Intel Xeon Bronze family
+			Intel Xeon Silver family
+			Intel Xeon Gold family
+			Intel Xeon Platinum family
+
+	Datasheet: Available from http://www.intel.com/design/literature.htm
+
+Author: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+
+Description
+-----------
+
+This driver implements a generic PECI hwmon feature which provides
+Temperature sensor on DIMM readings that are accessible via the processor PECI interface.
+
+All temperature values are given in millidegree Celsius and will be measurable
+only when the target CPU is powered on.
+
+Sysfs interface
+-------------------
+
+======================= =======================================================
+
+temp[N]_label		Provides string "DIMM CI", where C is DIMM channel and
+			I is DIMM index of the populated DIMM.
+temp[N]_input		Provides current temperature of the populated DIMM.
+temp[N]_max		Provides thermal control temperature of the DIMM.
+temp[N]_crit		Provides shutdown temperature of the DIMM.
+
+======================= =======================================================
+
+Note:
+	DIMM temperature attributes will appear when the client CPU's BIOS
+	completes memory training and testing.
diff --git a/MAINTAINERS b/MAINTAINERS
index b2d0b0b58da9..c666ef7ea5a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15113,6 +15113,8 @@ PECI HARDWARE MONITORING DRIVERS
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-hwmon@vger.kernel.org
 S:	Supported
+F:	Documentation/hwmon/peci-cputemp.rst
+F:	Documentation/hwmon/peci-dimmtemp.rst
 F:	drivers/hwmon/peci/
 
 PECI SUBSYSTEM
-- 
2.34.1

