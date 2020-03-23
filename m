Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132B1901F9
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 00:37:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mW5G2KHwzDqv3
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 10:37:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::949; helo=mail-ua1-x949.google.com;
 envelope-from=3dud5xgukb-ioyrcmksskpi.gsqstirfqgpmwxw.sdpefw.svk@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QbtMCVGG; dkim-atps=neutral
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mW1W2CCtzDqbc
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 10:34:16 +1100 (AEDT)
Received: by mail-ua1-x949.google.com with SMTP id o13so5603514uad.7
 for <openbmc@lists.ozlabs.org>; Mon, 23 Mar 2020 16:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=tXPEW76sKJjaPQGOZOimHJEP26LY2RMe5WtADrdJadU=;
 b=QbtMCVGGHfrzaPRSTOG6hYYZxOLOAJUOS7nSkIWYeuCBEGvFanrgs59bjGOXXPxZBJ
 bHAuvMI19M1Cl8fmZDd1Zl5BJSmfSmgYX7voMEM64BkT+OmECDkwOmb5kGuBbx326ZYV
 5Xad/Ole1WKEk3xofvjvHLRACG9gqI51bzRUCvXrL+4s3WuorbsJSEoncubX7m7qi6zJ
 oqDheiFmlN5YvzOMowlMkH99wT6l4OvlG+o9VPjh/glIu+slaTwYugVRK6WT45ZghgJX
 ePNxq4qTsD8RWuWw1KNJBVFK+USe9+6bexHrzChg7Mr2MCoGBx4kmV4Mg8whJaBF6qkZ
 YQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tXPEW76sKJjaPQGOZOimHJEP26LY2RMe5WtADrdJadU=;
 b=Z4DUv6QMNvZ3exFUFbxxFSkDb8XtoKlKMnNBBrRj8ws+eLTr9EJ9PJ+yIWecYq2KA/
 RZQPC0d9rIoP2dSBCCOsZD2XBwmpuXiQ5eVrKZsKf6wrZMjGzyvvSFYT0TD7fWYQMvZQ
 2OGyNF6Z/vrtsA9thkXrJLTbF8ZmX4WOnRc5/ExKTht2atIZ7V3sbL3RAOjUelpCGuQH
 GESJjZj8k7D54sWgbwKZs8mX6jy7Mn3JjroKY/xo6ADeUeg5O7dC0+8K5dgibsc8CmaM
 l6+C7g59LG7ZVrl1vuop70Dn3VsBe8fl1h05aezgdXnM2jzju7j1GdWW2mmEQnYpCh4V
 LA2g==
X-Gm-Message-State: ANhLgQ3BOU9BmibGIEt1wINogbw4NsKaQNLNVMYYgF0zW0feycR1H8DQ
 ZC+1lrjL1AryCOqhGAb/b9BV1xXL1A==
X-Google-Smtp-Source: ADFU+vuLxlD+2uO92bRrRaRHd0gjs4zp+jDXUXilAFiN/Eux1EFzVf5TdgZWCwGXv1Yhg1tiwl6PAvstYA==
X-Received: by 2002:ab0:698e:: with SMTP id t14mr16110287uaq.53.1585006453359; 
 Mon, 23 Mar 2020 16:34:13 -0700 (PDT)
Date: Mon, 23 Mar 2020 16:33:53 -0700
In-Reply-To: <20200323233354.239365-1-kunyi@google.com>
Message-Id: <20200323233354.239365-3-kunyi@google.com>
Mime-Version: 1.0
References: <20200323233354.239365-1-kunyi@google.com>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH linux hwmon-next v2 2/3] hwmon: (sbtsi) Add documentation
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
Change-Id: I4b086a124d1d94a516386b0d2ff1cd7180b1dac1
---
 Documentation/hwmon/sbtsi_temp.rst | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

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
2.25.1.696.g5e7596f4ac-goog

