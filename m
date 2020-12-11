Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026EB2D8162
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 22:57:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ct4QG5vzqzDqx4
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 08:57:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--kunyi.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3n-rtxwukb8gy81cwu22uzs.q2023s1p0qzw676.2dzop6.25u@flex--kunyi.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Ei3QYeJa; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ct4MB2RJZzDqwy
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 08:54:42 +1100 (AEDT)
Received: by mail-qk1-x74a.google.com with SMTP id t127so7619733qkf.0
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 13:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=NTgAB1mD14VMd3H1Bqnr5TwzQles0E7KUIMRK7pxIo4=;
 b=Ei3QYeJaw8u4bJidom09HkjHpuNV7TW9znoZOUb4X/jhtx5u9U56HbhV+e516TF4hb
 jMB34gJcOiEZVx+fMAoVtd2qcWnyt+PmV/MnDZvivzmRyULPhLwARgL284zy+Dv+Tho2
 +/ABEs3efbNCRvq/WLBlQDJXGtffyi1nhN0kbgqpmzfot6OoYLqM+jKzg1gsGCz8AEza
 eZOhhV7W3kwLJcu2n31rHlOuZ+pre9AQx8+zb9NPvCnnIpv72c0zfQ+yJONXMVQO4FlB
 IneCRunuV8ftUt56bvXRXnF0OlJgLXClej/rWPmZ7ONQb3ekrOU4Qt9TiY7wyS3zIyrx
 6EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=NTgAB1mD14VMd3H1Bqnr5TwzQles0E7KUIMRK7pxIo4=;
 b=rmQGN7E0Mj+QSsXSWDAn820Ey+cHQSqYSWZJbu8cMwVAkDmvd+9AQC/1Jcm/4ue/eu
 rhHOCs0dnqII7vGWahgISEAnEUSes/msRaPLtn1GJaMb7hvZKPQezT80GWlR3lAfnPZY
 0tOEFKO6Y6+hg7C6YLI1VJG4/HC/u29q4uoOxZZmgkZssCNZ1b9/4XA3CX51kPwHIRb1
 alXFyFl6Yl8U06TQdQChveFhjs5ry9dZpUSkkfKsj4RczEVlWd+nYSI2Uvjj12Dx/xP4
 2S3WHMcIVKTc0qWz2apzIuj9Oa2+ecUmkyhAm2+20fJ/NYWf1bx33GK5O1NT8Iusw8Tj
 b9wg==
X-Gm-Message-State: AOAM532j8Z6gbwBRnjpdc3j0um4bfSwT6sCRrnKM+FmvNZbfEpwHcDbo
 jF2R+om2kTOQO+w7DwQWqegxo93bsw==
X-Google-Smtp-Source: ABdhPJyVa+Y3FutrLWi8X1KGlRYrBlVNq40nJupQDbBYEPgST1GAmYH1QW4XMUiAfDuET0G/NH3iztLh+Q==
X-Received: from kunyi0.svl.corp.google.com
 ([2620:15c:2c5:3:9657:a5ff:fef2:53bd])
 (user=kunyi job=sendgmr) by 2002:a0c:bd2b:: with SMTP id
 m43mr17844211qvg.32.1607723679283; 
 Fri, 11 Dec 2020 13:54:39 -0800 (PST)
Date: Fri, 11 Dec 2020 13:54:26 -0800
In-Reply-To: <20201211215427.3281681-1-kunyi@google.com>
Message-Id: <20201211215427.3281681-3-kunyi@google.com>
Mime-Version: 1.0
References: <20201211215427.3281681-1-kunyi@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH linux hwmon-next v5 2/3] hwmon: (sbtsi) Add documentation
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
2.29.2.684.gfbc64c5ab5-goog

