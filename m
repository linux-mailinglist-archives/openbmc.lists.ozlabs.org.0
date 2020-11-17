Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EAA2B5616
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 02:14:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZnyq1zthzDqH4
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 12:14:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W4EdQQK5; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZnt15mGRzDqPQ
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 12:10:01 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id q10so15890885pfn.0
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 17:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tLK4An+hDGibqk+F+KB9Iylic4mHms0AyKGZoLHI+Fo=;
 b=W4EdQQK5c99k1YHeZ5PdPfwRC8Gpa/e69373mXPobeW92VK94XgaPhJ7Lia/01VVpc
 +C0O5aKlrRsUwaAmIYSbEBPt+X3Dd1EW8chADG+6RbSkyZZJB3d4uWi7VD7mPpssPfdq
 QEGa04fY2BH2CBBdtQWEIs03StolYUB2a6rhJBSOGPn1w1ld7qLyGDz9O2ZV0BrnMpY7
 3sCAu4LQeWCztXrLpGgYf/ovvJfQpg+i4FKVpraBdG9pY1d7Im/tfrUXaG3IfczRfjeb
 7ICS9g3uSaYwQ64BQFlC0dZ964Cs76THuj14LmY/CBxQREHuttauSlLHmyiRnHoVrOL7
 TZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tLK4An+hDGibqk+F+KB9Iylic4mHms0AyKGZoLHI+Fo=;
 b=KJ9hM8+sFInsJL5ftOaduLh+nX2TmTWEt6TejmE6cX9oxA9QucLpYzoa4eIwc5egl8
 MtkPyVkAonmihMrDr62xjo3uMl4ZqMA+QKeMhmbs/IlUGPlvRRTApwBhfQdmriyIVHmV
 qwlrKxpgemxeypnZRNmmeKbkzqEAZkwN8Y0kKkd1+FKIG+ei4Er2cPc8i5JQHFr7UPQS
 MaSZYssu/MLfLIi2Sw3aqq+olGCz+m6giAO3NAXR3FkNogIMLnidregou33JFSboDNsl
 8ry6sekxvLRS/Mv6wkYDs8v0020Xj2G7L8YBR1Ixd3XNxLOO8mwC+/zdA2LIhjui486j
 evuA==
X-Gm-Message-State: AOAM533i8I9Ywzs+PEF+OCPlaznzYMOUq4slyYfLctko0lhy9qpbtkDg
 Sw4o0mAcVS5E0FucLEqKi4E=
X-Google-Smtp-Source: ABdhPJwKqCZdq0GrtoR6CKHJ9lffDESA4ZjLWcy9Axn4FuX/WQCGOH1oxy+fII7QPTvqfsbwnQJZcg==
X-Received: by 2002:a63:441c:: with SMTP id r28mr1581268pga.184.1605575398722; 
 Mon, 16 Nov 2020 17:09:58 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id m23sm7362091pfo.136.2020.11.16.17.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:09:58 -0800 (PST)
From: rentao.bupt@gmail.com
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, openbmc@lists.ozlabs.org,
 taoren@fb.com, mikechoi@fb.com
Subject: [PATCH 2/2] docs: hwmon: Document max127 driver
Date: Mon, 16 Nov 2020 17:09:44 -0800
Message-Id: <20201117010944.28457-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117010944.28457-1-rentao.bupt@gmail.com>
References: <20201117010944.28457-1-rentao.bupt@gmail.com>
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

Add documentation for max127 hardware monitoring driver.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Documentation/hwmon/index.rst  |  1 +
 Documentation/hwmon/max127.rst | 43 ++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)
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
index 000000000000..e50225a61c1a
--- /dev/null
+++ b/Documentation/hwmon/max127.rst
@@ -0,0 +1,43 @@
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
+  in[0-7]_input  The conversion value for the corresponding channel.
+		 RO
+
+  in[0-7]_min    The lower limit (in Volt) for the corresponding channel.
+		 For the MAX127, it will be adjusted to -10, -5, or 0.
+		 RW
+
+  in[0-7]_max    The higher limit (in Volt) for the corresponding channel.
+		 For the MAX127, it will be adjusted to 0, 5, or 10.
+		 RW
+  ============== ==============================================================
-- 
2.17.1

