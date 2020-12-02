Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B92CC2E6
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 18:00:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmQFr2b6qzDqlm
	for <lists+openbmc@lfdr.de>; Thu,  3 Dec 2020 04:00:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::f49; helo=mail-qv1-xf49.google.com;
 envelope-from=3nsfhxwukb-ctdwhrpxxpun.lxvxynwkvlurbcb.xiujkb.xap@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=wEjjFZwD; dkim-atps=neutral
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmQ9F1HDczDr31
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2020 03:56:26 +1100 (AEDT)
Received: by mail-qv1-xf49.google.com with SMTP id b15so1659301qvm.10
 for <openbmc@lists.ozlabs.org>; Wed, 02 Dec 2020 08:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=C5cH1+u6QihF0HJXhluYkOAp5Dcp6gIMnhnwCWhDyK8=;
 b=wEjjFZwDRrIcR76cg+sG6O0U6N9QbH2Tn+HAfT7TifoZST/nqkVooTuo+JECaT6v16
 4+9sqSBt20RoKZ0THxx1IGevWBzcwtfWtS6xmrWQCDIywaC4puWSRN76rJCtbfVeBA1J
 1FuMFCW00LG86mj6uQhLdR4MezFXDYu03R2X1ApUsGta4lfb+CPKHKvqhsJeJ4z7uM2Z
 GX61rZXutWDzKP5A9VXTh/+JkpuzZM6Hu+CCPf+/2M44FDQhLUt4tXPBQud/1JFM/qKR
 6eY+E5Bdi280/0aL+StKLKuefHI8dCGwDFBvZrUS8CnDWKHhwQdHc/POQpykhZwPZb/5
 n1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=C5cH1+u6QihF0HJXhluYkOAp5Dcp6gIMnhnwCWhDyK8=;
 b=k8Ml7xtZ2YRkT7nXwXhRaqxT1bpzSWbfErrGhLRUULTe2fTeWw6HrDFVa9M3j7rFVr
 bs6Ea8JdukwUkQmQodw7JAp/vVqRGpofUglzqsq14q1mqkRNbWXPbI6KAWAfHPyfEgTz
 j0zQDlVZcRuii23R5ZsnzESb1D9pq8pdeq+mhNqJi6Rh9QJOlnkcOXiI+zzXJabMk67+
 wWML+MSKd4lplB7yOweK4pHMgS1b4NOEysAVZm6mpK4Utc9kbGxePjxn1aApAgQELGq/
 1D2BljIwrgPh5xf2uEaHExIv1DEorPN9ldxsUXNT3sZ6vsjfw8ZzTOwI9T90dpeFr3Hh
 4/4A==
X-Gm-Message-State: AOAM531zTNWF/35M809BF0pCUi93NmgRcg/aT98TAUwiV4rhdkAHegWN
 KDp7zO/WyHNOAt3QzdYrCQzriBEUtA==
X-Google-Smtp-Source: ABdhPJxjTellGg62Ft0dtoF7EbHO59fZZvLSVTJo7d/PZdgwmGf/EuFIpKUmJSX7HwwygZQlnP8HnD8pPQ==
X-Received: from kunyi0.svl.corp.google.com
 ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:ad4:4e47:: with SMTP id
 eb7mr3692938qvb.39.1606928182920; 
 Wed, 02 Dec 2020 08:56:22 -0800 (PST)
Date: Wed,  2 Dec 2020 08:56:00 -0800
In-Reply-To: <20201202165601.1532213-1-kunyi@google.com>
Message-Id: <20201202165601.1532213-3-kunyi@google.com>
Mime-Version: 1.0
References: <20201202165601.1532213-1-kunyi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH linux hwmon-next v4 2/3] hwmon: (sbtsi) Add documentation
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com, supreeth.venkatesh@amd.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
---
 Documentation/hwmon/index.rst      |  1 +
 Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index fd6fae46b99c..509fb3bcafb2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -151,6 +151,7 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    raspberrypi-hwmon
+   sbtsi_temp
    sch5627
    sch5636
    scpi-hwmon
diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..9f0f197c8aa2
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,40 @@
+Kernel driver sbtsi_temp
+==================
+
+Supported hardware:
+
+  * Sideband interface (SBI) Temperature Sensor Interface (SB-TSI)
+    compliant AMD SoC temperature device.
+
+    Prefix: 'sbtsi_temp'
+
+    Addresses scanned: This driver doesn't support address scanning.
+
+    To instantiate this driver on an AMD CPU with SB-TSI
+    support, the i2c bus number would be the bus connected from the board
+    management controller (BMC) to the CPU. The i2c address is specified in
+    Section 6.3.1 of the SoC register reference: The SB-TSI address is normally
+    98h for socket 0 and 90h for socket 1, but it could vary based on hardware
+    address select pins.
+
+    Datasheet: The SB-TSI interface and protocol is available as part of
+               the open source SoC register reference at:
+
+	       https://www.amd.com/system/files/TechDocs/56255_OSRR.pdf
+
+               The Advanced Platform Management Link (APML) Specification is
+               available at:
+
+	       http://developer.amd.com/wordpress/media/2012/10/41918.pdf
+
+Author: Kun Yi <kunyi@google.com>
+
+Description
+-----------
+
+The SBI temperature sensor interface (SB-TSI) is an emulation of the software
+and physical interface of a typical 8-pin remote temperature sensor (RTS) on
+AMD SoCs. It implements one temperature sensor with readings and limit
+registers encode the temperature in increments of 0.125 from 0 to 255.875.
+Limits can be set through the writable thresholds, and if reached will trigger
+corresponding alert signals.
-- 
2.29.2.454.gaff20da3a2-goog

