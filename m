Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8C2C1365
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 20:00:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfxLk1yt6zDqCg
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 06:00:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LJDYqiwl; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfxGd5nH3zDqM9
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 05:57:12 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id x15so9312699pll.2
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mGyTIo1G7d0U3CZUJffCDlu9eTw6Qo/mWhnC32TeIPQ=;
 b=LJDYqiwlg6i/r6499eoEQQJ557GyuGTnQjjEKIiKSTuBPpFKsHh9EWDxYdV0vyueS9
 brwtIBcZ0SqWqlQtLjx89ssGZ+6GCdnBlp94rPtIRYcQk/KsS67PjQHoT9EcV/ykjK9N
 1Ch266ZOoHRh3Kfd64wY9X0VMqDi/EHat9NTkevHjbeVq8AGOQR/BBGhRzPWcZ3GsFBX
 /2LB3rhsxcWWgKvSmEUjXyywi4PEABpUNkvTG3JwHtyOsbl1ZUlQWVMzT/yMIJD8mN24
 mDxq2s0nDd47POwIkz2JaQD9fMNDFouwynH/DZA01ZRPOhwjkbgHWBGY03rNPAY2EMq3
 I4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mGyTIo1G7d0U3CZUJffCDlu9eTw6Qo/mWhnC32TeIPQ=;
 b=Dvp5FtZXHLg8ubfDKmcVsexZbqI9hTFL6AslsuNKC1WR/Fwq70Dn8iTSrWlwAN8VCq
 mBwor7snF8jf2wtju2AUmxm3jKAu3M36jZi6LdKa87kz7Ufhxoo/haErvoB3v0bk+QaZ
 EoMDoYJvGkt3RQj1VqDExjKMo5LsS1MOsl+36Y+2dWIp3vGpycqjOXDmLIs2bAGMBrZc
 giBP9o711Im/18QwvZUcTl2iAJ+REM13ntcJ0oIER3r/0yy/qZoMAprx1sIIBdcmVj26
 Z1mKsTTKkOIrH7+vSYfHEGDZTQyRmLunosPq7Y/cdcX0fbR2J8Hj9nbjA8ZOXq8NjfE8
 oYZg==
X-Gm-Message-State: AOAM531Dql2S1VlPNEbRnFKyRFr394ihK19Qns2iBewEvgjYFh9sJVTq
 ZED+aaD8fSjKIwxCw4CABqM=
X-Google-Smtp-Source: ABdhPJw8JNcyGAoQHESmkKHqaXzYbP9kaRaJ3DOOwMke7AVf/Df85q05BWSUVyyq7VzG63Q7c/imIw==
X-Received: by 2002:a17:902:b103:b029:da:b9a:e9a7 with SMTP id
 q3-20020a170902b103b02900da0b9ae9a7mr832213plr.45.1606157830358; 
 Mon, 23 Nov 2020 10:57:10 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id w15sm11043098pgi.20.2020.11.23.10.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 10:57:09 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com, mikechoi@fb.com
Subject: [PATCH v5 2/2] docs: hwmon: Document max127 driver
Date: Mon, 23 Nov 2020 10:56:58 -0800
Message-Id: <20201123185658.7632-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123185658.7632-1-rentao.bupt@gmail.com>
References: <20201123185658.7632-1-rentao.bupt@gmail.com>
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
 Changes in v5:
   - None.
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

