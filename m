Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A94ADD6C
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 16:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtS9t1lCBz3bPM
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 02:49:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JN4eov3w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JN4eov3w; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtS2p5TXjz3bV2;
 Wed,  9 Feb 2022 02:43:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644334995; x=1675870995;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4GFjvUMiVMcumvdOgAlzmh492IdarzKncsOwfSSWUls=;
 b=JN4eov3wDn3mde8W+IqQxpUz4Sz4BUJuwbcDBurtEOB7mydAasUTHMeL
 54mI5RH8DW+C8A6cU2OwVxYcnvkYYUvWC8vgEVE/M53Zi0Qyova98IT5h
 hzZJ0nw3bRlcistTR3+e9y7twtj516kh/NZIodwEdFdj+3ZEVytcpUqCV
 Z7U3GpwMOvj11XHsaP9TZXsT4lPYasjRzuqizfoZqYSl8lqrgdsBOP6K9
 k1NdPx2GH/IU5HqpFiKOTz2B1ivGcUFIL0Yttw0SkdSM7UxBe2L4HH8zq
 3PyxmI/l5xWktFcM04ba+WtErZ2DPSEYdCVKxx8IQDNjdU6bP/GQPM7i7 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335376032"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="335376032"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:42:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="601273985"
Received: from mgorzkow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.139.232])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:42:07 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 13/13] docs: Add PECI documentation
Date: Tue,  8 Feb 2022 16:36:39 +0100
Message-Id: <20220208153639.255278-14-iwona.winiarska@intel.com>
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

Add a brief overview of PECI and PECI wire interface.
The documentation also contains kernel-doc for PECI subsystem internals
and PECI CPU Driver API.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 Documentation/index.rst      |  1 +
 Documentation/peci/index.rst | 16 +++++++++++
 Documentation/peci/peci.rst  | 51 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |  1 +
 4 files changed, 69 insertions(+)
 create mode 100644 Documentation/peci/index.rst
 create mode 100644 Documentation/peci/peci.rst

diff --git a/Documentation/index.rst b/Documentation/index.rst
index b58692d687f6..1988c19d9daf 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -138,6 +138,7 @@ needed).
    scheduler/index
    mhi/index
    tty/index
+   peci/index
 
 Architecture-agnostic documentation
 -----------------------------------
diff --git a/Documentation/peci/index.rst b/Documentation/peci/index.rst
new file mode 100644
index 000000000000..989de10416e7
--- /dev/null
+++ b/Documentation/peci/index.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+====================
+Linux PECI Subsystem
+====================
+
+.. toctree::
+
+   peci
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/peci/peci.rst b/Documentation/peci/peci.rst
new file mode 100644
index 000000000000..331b1ec00e22
--- /dev/null
+++ b/Documentation/peci/peci.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+========
+Overview
+========
+
+The Platform Environment Control Interface (PECI) is a communication
+interface between Intel processor and management controllers
+(e.g. Baseboard Management Controller, BMC).
+PECI provides services that allow the management controller to
+configure, monitor and debug platform by accessing various registers.
+It defines a dedicated command protocol, where the management
+controller is acting as a PECI originator and the processor - as
+a PECI responder.
+PECI can be used in both single processor and multiple-processor based
+systems.
+
+NOTE:
+Intel PECI specification is not released as a dedicated document,
+instead it is a part of External Design Specification (EDS) for given
+Intel CPU. External Design Specifications are usually not publicly
+available.
+
+PECI Wire
+---------
+
+PECI Wire interface uses a single wire for self-clocking and data
+transfer. It does not require any additional control lines - the
+physical layer is a self-clocked one-wire bus signal that begins each
+bit with a driven, rising edge from an idle near zero volts. The
+duration of the signal driven high allows to determine whether the bit
+value is logic '0' or logic '1'. PECI Wire also includes variable data
+rate established with every message.
+
+For PECI Wire, each processor package will utilize unique, fixed
+addresses within a defined range and that address should
+have a fixed relationship with the processor socket ID - if one of the
+processors is removed, it does not affect addresses of remaining
+processors.
+
+PECI subsystem internals
+------------------------
+
+.. kernel-doc:: include/linux/peci.h
+.. kernel-doc:: drivers/peci/internal.h
+.. kernel-doc:: drivers/peci/core.c
+.. kernel-doc:: drivers/peci/request.c
+
+PECI CPU Driver API
+-------------------
+.. kernel-doc:: drivers/peci/cpu.c
diff --git a/MAINTAINERS b/MAINTAINERS
index c666ef7ea5a5..9d248d55ac30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15122,6 +15122,7 @@ M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/peci/
+F:	Documentation/peci/
 F:	drivers/peci/
 F:	include/linux/peci-cpu.h
 F:	include/linux/peci.h
-- 
2.34.1

