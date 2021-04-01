Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC9351C11
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 20:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBBr84Ktgz3c0g
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 05:42:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=stpsh2Qy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=stpsh2Qy; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBBqS6Jb2z2yQy
 for <openbmc@lists.ozlabs.org>; Fri,  2 Apr 2021 05:41:55 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 12so4210074lfq.13
 for <openbmc@lists.ozlabs.org>; Thu, 01 Apr 2021 11:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EPMsYV5ZYnKBw8Y4RivjtKx8N+DFsPVb3I3J/f2RM/4=;
 b=stpsh2QyC1Gk0RU1as/1JUMnneRcTvsXDhGHbmfaSWshYfgpLjanpEH0eNIneG/Dnp
 WZRKPlzlJQoze5ES2bP8R1JOq/Zm0A4MEAmul/JL+jethTs8LnoAV2KI9U2LY62HuVOp
 uTlkL6CHJopnNJtbo0CoZC3yzIgppCEJa8Z+QqIS6P1IURaJtObk2xQMZahZDv7Ws/zY
 er7G726Iqp4stecQo0ErvrO5r3aY/0e/gy+MjdH1P/HOPW1ACmY8nUnMIy3OVI5VQ6jF
 MW8a7NbXm14w7r2XKLNF4k6FAHtsKK+TwxHUDBxG8al7Nfe+QLhbFpSZ6RZEU+PWe2pq
 Zmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPMsYV5ZYnKBw8Y4RivjtKx8N+DFsPVb3I3J/f2RM/4=;
 b=Qi3WM34wN09/OjcXpEJLiFfuF9lQCgnMlsIXe6yMvrBb34chAUskKijY7jBI784zwE
 FGOzwQ3x/2ObOLjXt+9syNzGx20l2T3mujkIbBbIvCuQ9J5K/bbJ5swxRm6FkPrGBffi
 8yVn0AuC1ShHwPKEG0o0wSZzzwuR6Bj9hyB7F6pm24SScpKO5uju3YL3kJirnhfe6nNs
 yjessPnOHq4lr03UUerZUUHMGsISlysUkUND5uUtyHWHQ9Zdem9JTkS9ZAZyLZkZIWy8
 YhbaYRX0OgSAIFscVvRRNrBDFp+4zM9NvIgLmKKHa7a/ywNely0qqEwfehfxLYs16b3V
 MIgw==
X-Gm-Message-State: AOAM531aS6ru4RVznWcENGdLwbjvLzFi0gXihjuQJ/n3EpcDmJQ5nIpJ
 PNM3fMux5wIDNPeSMW6QUsw=
X-Google-Smtp-Source: ABdhPJy56g4NKx+yEpAKl6pwU6hnsHoulS7dL1pUXm61gxOYjqvr8XclBmewJh4W5IbWbY+jzYm0OQ==
X-Received: by 2002:a05:6512:1192:: with SMTP id
 g18mr5942343lfr.408.1617302510941; 
 Thu, 01 Apr 2021 11:41:50 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-10-29.ip.moscow.rt.ru. [46.242.10.29])
 by smtp.gmail.com with ESMTPSA id 80sm621321lfd.14.2021.04.01.11.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:41:50 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: aladyshev22@gmail.com, Joel Stanley <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 3/3] hwmon: (sbtsi) Add documentation
Date: Thu,  1 Apr 2021 21:41:47 +0300
Message-Id: <20210401184147.2506-3-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401184147.2506-1-aladyshev22@gmail.com>
References: <20210401184147.2506-1-aladyshev22@gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Kun Yi <kunyi@google.com>

Document the SB-TSI sensor interface driver.

Signed-off-by: Kun Yi <kunyi@google.com>
Link: https://lore.kernel.org/r/20201211215427.3281681-3-kunyi@google.com
[groeck: Added SPDX license identifier, same as source]
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/index.rst      |  1 +
 Documentation/hwmon/sbtsi_temp.rst | 42 ++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 Documentation/hwmon/sbtsi_temp.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 37e1925735c7..97747457cef3 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -148,6 +148,7 @@ Hardware Monitoring Kernel Drivers
    pxe1610
    pwm-fan
    raspberrypi-hwmon
+   sbtsi_temp
    sch5627
    sch5636
    scpi-hwmon
diff --git a/Documentation/hwmon/sbtsi_temp.rst b/Documentation/hwmon/sbtsi_temp.rst
new file mode 100644
index 000000000000..922b3c8db666
--- /dev/null
+++ b/Documentation/hwmon/sbtsi_temp.rst
@@ -0,0 +1,42 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
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
2.25.1

