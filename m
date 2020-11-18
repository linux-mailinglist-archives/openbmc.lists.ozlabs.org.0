Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3652B883D
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 00:15:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbzDn1585zDqH6
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 10:15:21 +1100 (AEDT)
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
 header.s=20161025 header.b=uMnzVzhm; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbz6Z33hvzDqW9
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 10:09:57 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id w14so2580720pfd.7
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 15:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S4SV7UWqaAO4+KNigQEQ+xlXa5i4hvXUtpTZN2jrHlA=;
 b=uMnzVzhmPlLPZ0/M2t6pQ+/a395zQleD37ySHopmwQHi4ghvFtsIYAuEEUi6scn2oE
 WjTuRb77VxCgNSlatY0O5bWDL2EiY+PXnJbPwJaluV4vC2qtJKuzyyJMxCW/ucs4NyKe
 D6UQC1mlWQe/JZJGxrieQSi4pgLDj+AeWS5cTJzd96Usyo+5jw+yzp2wMIDEU2Q9ZqsZ
 ICJCcPd5L9Du5QfGItxLs1Jhao0h5CbGZLyD+J5V3qIdveZ3hSKzNiEmBUhjBP8agbM6
 YzZytOLol+oTy2zCVuyaCvIhJkmTPA3GMplkkuDpFGzSVcWrWuWLHLy2h6EiPXUMw4ib
 rC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S4SV7UWqaAO4+KNigQEQ+xlXa5i4hvXUtpTZN2jrHlA=;
 b=U5GMeZwnXWBuVzymBt6Q+peVhFEJZnuG9cFNUDpoPC3E9wpdLYVISTDSAHFSkRYQyP
 uffcO4GDWsZVvqCuIPWhq9nqu0DYPmCxm5k1V7PR24zbTICB+8tOn0YGEDxhY5Zblx51
 SFBm78EcFQDQ3oxMj798w695Gf9OYE1auoJ8WAel/CQembYe68lbXkb0Y0L/krwS9TPi
 rRgXOy7TBYgeow5d1Oj5NWZtvdMDhUz7FD5n5HsLF2g7g6mwgqMVUuqzKtiUfAQrsV1o
 e5ki6rZnN2AWMyFENefFgdFt9CiVRukKtY29vFap8+4wWrg5xwg9yNpALYyPEx9YYRgG
 OZLw==
X-Gm-Message-State: AOAM532GGF6JObdetDo96rwMl6jVgWtXXF/alSYUCv95KCbKA0RJDpqP
 gip1BPYprgBk8Brav+MWI1I=
X-Google-Smtp-Source: ABdhPJzu9wrEysVlRm1/cjj7lif5xoT+FkSGrGUKs2fsSy8kVxEFM/1XL01MQtqHSGgEVT7zhSxWRg==
X-Received: by 2002:a63:154e:: with SMTP id 14mr10380799pgv.49.1605740995078; 
 Wed, 18 Nov 2020 15:09:55 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id b21sm2565304pji.24.2020.11.18.15.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 15:09:54 -0800 (PST)
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
Subject: [PATCH v2 2/2] docs: hwmon: Document max127 driver
Date: Wed, 18 Nov 2020 15:09:29 -0800
Message-Id: <20201118230929.18147-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118230929.18147-1-rentao.bupt@gmail.com>
References: <20201118230929.18147-1-rentao.bupt@gmail.com>
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
---
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

