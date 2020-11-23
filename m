Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E86112C00C0
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 08:49:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CffS40k8gzDqNm
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 18:49:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kr0nPw4b; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CffMt2h2VzDqGL
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 18:45:46 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id t8so14119464pfg.8
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2020 23:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1KXTAJmKVykTQ4vYpPkazbnjLZRCjxHoq4CJnnjX6E4=;
 b=Kr0nPw4bcK0rd9U95IKCxSAHwSTFxryQ17Qd8RzxkKVuTtVmrbxISShI6R3WLTTCGI
 81pmJJMhdaCW7d2FawOiOASvre/xC7joEEMuJ1ZNaN1UaljUFt56+HmcrFBYX6DRNMtW
 NKT3LrTOWFt6o33rIR1s1J24zZpHNQOD4U2U1RBJ6EDX/kK8CMSg4AmH2U/ZFnrMxgpT
 pMjO9C+k3il0mnI1Xb+HaTxUCxf6WiCgylAyDxxTuvqxc03AHNVztJzGQ9O6EibMCbME
 Eclb6jLtqYOruygfcrVAAXk2uWV1+DzDr9W9mOQXl6rdafyiNm1HqYWgMLD0dDO+WL8s
 1RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1KXTAJmKVykTQ4vYpPkazbnjLZRCjxHoq4CJnnjX6E4=;
 b=ekKa0Ju0QDjFluAJhtx5GtCO0Suv60hNF6UmQFxXmPDViaQdFZCIwPlQ4/QGb4L43c
 WIrR7uuILZFUEXOCdonNwNEqiCYXfQZxPjVth5zQPu9r+/+wyUVON571m1rbaAJ+SE3B
 bfXddNQ10vIYYyD9DlmUKHEEd4AxfNulMhc+nWhNPvLTmM0kj4kj67M0suf2bgLqHKUj
 sQ2fuw2+pGdGe9lLH7NjFn2MPuAEVp0sJ26GsV1Lem5JKkPGcwRKW/FBuxHIqVslV3Ph
 phAQXF4Fw9gzIVkhrWVSBvLRnbHX1fVDnDPMRpd1UQ5WOJWHxPfTmyCrhuAtzJtz0BjA
 GDBQ==
X-Gm-Message-State: AOAM530C5SXcVQXeY8nZIABmoHA32AkTUYcqKTg8+gIDkLpLnGsxKOmn
 gIOr0WKkcyDqgTivokaZh9c=
X-Google-Smtp-Source: ABdhPJzkFNLl2LANfugwIBApL49r4vt0i5J3kZswjXeHHLPY74fpkw1cafa1AQM+Aexgej5QxynnpQ==
X-Received: by 2002:a17:90a:5418:: with SMTP id
 z24mr9780577pjh.139.1606117544387; 
 Sun, 22 Nov 2020 23:45:44 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id 12sm13176340pjn.19.2020.11.22.23.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 23:45:43 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Subject: [PATCH v4 2/2] docs: hwmon: Document max127 driver
Date: Sun, 22 Nov 2020 23:45:32 -0800
Message-Id: <20201123074532.3730-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123074532.3730-1-rentao.bupt@gmail.com>
References: <20201123074532.3730-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Add documentation for the max127 hardware monitoring driver.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 Changes in v4:
   - None.
 Changes in v3:
   - no code change. xdp maintainers were removed from to/cc list.
 Changes in v2:
   - add more description for min/max sysfs nodes.
   - convert values from volt to millivolt in the document.

 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/max127.rst | 45 ++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/hwmon/max127.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 408760d13813..0a07b6000c20 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -111,6 +111,7 @@ Hardware Monitoring Kernel Drivers
    ltc4245
    ltc4260
    ltc4261
+   max127
    max16064
    max16065
    max1619
diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
new file mode 100644
index 000000000000..dc192dd9c37c
--- /dev/null
+++ b/Documentation/hwmon/max127.rst
@@ -0,0 +1,45 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver max127
+====================
+
+Author:
+
+  * Tao Ren <rentao.bupt@gmail.com>
+
+Supported chips:
+
+  * Maxim MAX127
+
+    Prefix: 'max127'
+
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
+
+Description
+-----------
+
+The MAX127 is a multirange, 12-bit data acquisition system (DAS) providing
+8 analog input channels that are independently software programmable for
+a variety of ranges. The available ranges are {0,5V}, {0,10V}, {-5,5V}
+and {-10,10V}.
+
+The MAX127 features a 2-wire, I2C-compatible serial interface that allows
+communication among multiple devices using SDA and SCL lines.
+
+Sysfs interface
+---------------
+
+  ============== ==============================================================
+  in[0-7]_input  The input voltage (in mV) of the corresponding channel.
+		 RO
+
+  in[0-7]_min    The lower input limit (in mV) for the corresponding channel.
+		 ADC range and LSB will be updated when the limit is changed.
+		 For the MAX127, it will be adjusted to -10000, -5000, or 0.
+		 RW
+
+  in[0-7]_max    The higher input limit (in mV) for the corresponding channel.
+		 ADC range and LSB will be updated when the limit is changed.
+		 For the MAX127, it will be adjusted to 0, 5000, or 10000.
+		 RW
+  ============== ==============================================================
-- 
2.17.1

