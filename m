Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EFA19E8BD
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 05:04:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48vz6P1lDfzDrdg
	for <lists+openbmc@lfdr.de>; Sun,  5 Apr 2020 13:04:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3c0qjxgukb74oyr2mksskpi.gsqstirfqgpmwxw.s3pefw.svk@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Sqzp3tVr; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48vz371Gd8zDqSg
 for <openbmc@lists.ozlabs.org>; Sun,  5 Apr 2020 13:01:32 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id a12so4940657pju.2
 for <openbmc@lists.ozlabs.org>; Sat, 04 Apr 2020 20:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fKzqXXNg9xzVu4YyDWxMV1+X7kCrAroDFOfHUGlJ58E=;
 b=Sqzp3tVry5VikJhBtbH8S7i4F6HSXFPxPg6DEQnSre+2NtOuwKjqzVf2IafEjNUj5a
 C+NeeLsqpbOdoq6OArVTZ59Shl26lYDf8U99URzAqd1/lAnJTqHhkFzvl9zaUrBc0+Um
 aZkwhBOzc8dttV849FyKs7dkxhWKMgu6NGpcJjCUnXTu2gMvQTTOIbG/pVeXwhBjYUES
 H2izvR9dW09AslLmDdTthnbsq5Uzjsdej71g4Fsiclb1VKaGef2DU8o78DbMxdNZlqVC
 1aqWRKz5VKg/P2J7t2XPKkPYFJHZk2JlCRe6HSw2x3nALCJcPpoBWcPY/TJYw6hOiaOX
 027Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fKzqXXNg9xzVu4YyDWxMV1+X7kCrAroDFOfHUGlJ58E=;
 b=Ghyp/68lTFjMWyKw5fkfLexnnE/ZzKw9o43uYmghHgddFO79DGrvJOjvJuyxrxD81P
 tkXbFtSvnaPpc18sqRfqrBZca/dyf2jrX+bmrOvQwiF8QQhySj1jkEBztzYfWJHcYcex
 LJmAutZEvdakTNFvyWLUow7gBM8QVXSeuz2hGMeSTnOKB9BHA4JG++WnjiqHNKGd133j
 QeF6TILMZDddvoRfb5WgcSmNNweHL3FxN53/mSazKUXjv/bDIzK9wSTrF+B3DWZ7qTs7
 KxeHf7RPyx7eluVBgQWzSEwTDLhlKXxTLqlxDYf8bvMBz80v3Mcnabfq7285tZduFZ3c
 lAPg==
X-Gm-Message-State: AGi0PubH4vuNk9PwCmrjxSAyclLJ6SvBuXhmkgknPNaRaZP0gvLEhfIr
 /JjOn8CExOC8zYKElIrtVVbeG9mt9A==
X-Google-Smtp-Source: APiQypJzQ/VynmzGryKqwj/Q41W7uFyHr7iB3BAtTwC2kBApBZa8RfvrjcVzbMMt18OmXIjc52phN4ZmNw==
X-Received: by 2002:a63:9a11:: with SMTP id o17mr3738011pge.234.1586055691194; 
 Sat, 04 Apr 2020 20:01:31 -0700 (PDT)
Date: Sat,  4 Apr 2020 20:01:17 -0700
In-Reply-To: <20200405030118.191950-1-kunyi@google.com>
Message-Id: <20200405030118.191950-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200405030118.191950-1-kunyi@google.com>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
Subject: [PATCH linux hwmon-next v3 2/3] hwmon: (sbtsi) Add documentation
From: Kun Yi <kunyi@google.com>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, 
 mark.rutland@arm.com
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
index 8ef62fd39787..c17cf38f22c2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -140,6 +140,7 @@ Hardware Monitoring Kernel Drivers
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
2.26.0.292.g33ef6b2f38-goog

