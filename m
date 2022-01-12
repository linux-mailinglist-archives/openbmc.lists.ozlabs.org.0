Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A328C48CECA
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 00:06:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ3913k8kz30DM
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 10:06:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7eJxfil;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m7eJxfil; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ3791FxDz303n;
 Thu, 13 Jan 2022 10:05:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642028709; x=1673564709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uSFN2KIKKCHd2SnULm1earIz8BEZQNiEaKaK+hQz25A=;
 b=m7eJxfil9/9Tb6hCgvRjdGZ9Lq39X+Q2ogoOedq7YMnv4aptXsMJZgYc
 fWW5O2wy59h+fbi9zGKphnt5FJ2N/sljHSE59KOTMRB8xepWKK+Znkvqb
 E8zE8Wmz+YAlbqIcLR7gWR4H//0ZsBj3x3yABKx96Wj5lf9zGQf44wA1d
 X7fqpM87SerM+hxW3eXRzg3xW4gHEZxTSmFCE2TwA+fxF2ws5e8DR+hUE
 PnEtICNWHbv68BvtrHQ8mrHU1jxUe0pNpVZ3ERHbcx+Nj3J7jBz6zkS7e
 El7Y7g8PnAFsoGnEvH2XnSf3qMf3MPMzXYB7s4GHpcf8Z0b2WCvxNPjRl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="307220968"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="307220968"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:03:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="576736069"
Received: from kstefans-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.154.174])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:03:44 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 01/13] dt-bindings: Add generic bindings for PECI
Date: Thu, 13 Jan 2022 00:02:35 +0100
Message-Id: <20220112230247.982212-2-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112230247.982212-1-iwona.winiarska@intel.com>
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
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
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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

Add device tree bindings for the PECI controller.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/peci/peci-controller.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/peci/peci-controller.yaml

diff --git a/Documentation/devicetree/bindings/peci/peci-controller.yaml b/Documentation/devicetree/bindings/peci/peci-controller.yaml
new file mode 100644
index 000000000000..bbc3d3f3a929
--- /dev/null
+++ b/Documentation/devicetree/bindings/peci/peci-controller.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/peci/peci-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Device Tree Bindings for PECI
+
+maintainers:
+  - Iwona Winiarska <iwona.winiarska@intel.com>
+
+description:
+  PECI (Platform Environment Control Interface) is an interface that provides a
+  communication channel from Intel processors and chipset components to external
+  monitoring or control devices.
+
+properties:
+  $nodename:
+    pattern: "^peci-controller(@.*)?$"
+
+  cmd-timeout-ms:
+    description:
+      Command timeout in units of ms.
+
+additionalProperties: true
+
+examples:
+  - |
+    peci-controller@1e78b000 {
+      reg = <0x1e78b000 0x100>;
+      cmd-timeout-ms = <500>;
+    };
+...
-- 
2.31.1

