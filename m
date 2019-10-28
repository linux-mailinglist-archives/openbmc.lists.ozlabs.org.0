Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD0EE7D47
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 00:54:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472BQT6TfVzF0WG
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 10:54:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jmgrSRXQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472BJm1BRQzDrb6
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 10:49:27 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id k7so6565758pll.1
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 16:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NeObGC1EVOm6spx2L51L+hiPcYQEKVP788D+xQH3iTs=;
 b=jmgrSRXQFYNKQm1hb2rj6HrFWqHgWaQ39FpQ0UpBcCmGfMxW781W8EHKBZmZpa/JGQ
 J099MviYtme/JO9ZJyJRpjURYu/lXNzYg4LS4XHB0n0ihf8uzWH6kN6NVxLeCOLGaDiH
 hXc9xQ+UQqBFzaRovTZkJD2Vucrz4mAJ/DwW0fsBEnFX8IhsNc1TPVRnT03M4fFMQoLv
 jTJFkoTLYF38ia2JARE2xqu3VP4Mq23QN9wN6SLsHUR+UpwnzeF/bbNAx6nH+n0FWYS2
 U982G55vfGV+doZpsXO5pCN4tB/R2dpCpzsws24HnRpFHbEhZZuwb9KUwgFSvEyFq6dY
 9oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NeObGC1EVOm6spx2L51L+hiPcYQEKVP788D+xQH3iTs=;
 b=dZFjk7YPGYBMuzQVkU/C1DtigXkasa21veniQTuGgik3GIwoE7C6eY+koUrkhIAwlc
 OFioo9f+JjzgXkiJkHqdFgOWeaM6UwuV2HMg4Jh1T9N4jQ8HgSrymgZAUYc5zeRZot38
 n9eOPQUfTnOGchZXvF+zBPA7kV0f3+aK1DwYITnp1KZ2TEfNcsH7ay0qD/QMmby97EAY
 RrJtQ9mO3/l4It15NEBgMBWU8rJhF9bJe2abclINi6HFg4LMxqGeJtUqQ9wrwJbhfX9a
 7MZeY7yPScTS3MRe/A78drdZ0QpMKhkKcTlb5RJnUzOlnVu2N8+8YNM42rGvAJcSpYz7
 /LAg==
X-Gm-Message-State: APjAAAWyovR1RYJyEBJXA3rMub0otFCuLzuimkskdfzj6I28GyaU35ll
 ZyfuqpP8q63G/80/W74VURw=
X-Google-Smtp-Source: APXvYqyXhcsYcTw+hWCPyqQEdoxc4SNoZS1I6wVveEcHdz3y6Xf26+c4UD09iS+BSoFx40pyATYn4A==
X-Received: by 2002:a17:902:a714:: with SMTP id
 w20mr753018plq.116.1572306565426; 
 Mon, 28 Oct 2019 16:49:25 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2:c0c7])
 by smtp.gmail.com with ESMTPSA id d4sm597119pjs.9.2019.10.28.16.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 16:49:24 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 3/3] docs: hwmon: Document bel-pfe pmbus driver
Date: Mon, 28 Oct 2019 16:49:04 -0700
Message-Id: <20191028234904.12441-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028234904.12441-1-rentao.bupt@gmail.com>
References: <20191028234904.12441-1-rentao.bupt@gmail.com>
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

Add documentation for bel-pfe pmbus driver which supports BEL PFE1100 and
PFE3000 power supplies.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Documentation/hwmon/bel-pfe.rst | 112 ++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/hwmon/bel-pfe.rst

diff --git a/Documentation/hwmon/bel-pfe.rst b/Documentation/hwmon/bel-pfe.rst
new file mode 100644
index 000000000000..4b4a7d67854c
--- /dev/null
+++ b/Documentation/hwmon/bel-pfe.rst
@@ -0,0 +1,112 @@
+Kernel driver bel-pfe
+======================
+
+Supported chips:
+
+  * BEL PFE1100
+
+    Prefixes: 'pfe1100'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe1100-12-054xa.pdf
+
+  * BEL PFE3000
+
+    Prefixes: 'pfe3000'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.belfuse.com/resources/datasheets/powersolutions/ds-bps-pfe3000-series.pdf
+
+Author: Tao Ren <rentao.bupt@gmail.com>
+
+
+Description
+-----------
+
+This driver supports hardware monitoring for below power supply devices
+which support PMBus Protocol:
+
+  * BEL PFE1100
+
+    1100 Watt AC to DC power-factor-corrected (PFC) power supply.
+    PMBus Communication Manual is not publicly available.
+
+  * BEL PFE3000
+
+    3000 Watt AC/DC power-factor-corrected (PFC) and DC-DC power supply.
+    PMBus Communication Manual is not publicly available.
+
+The driver is a client driver to the core PMBus driver. Please see
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
+
+
+Usage Notes
+-----------
+
+This driver does not auto-detect devices. You will have to instantiate the
+devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
+details.
+
+Example: the following will load the driver for an PFE3000 at address 0x20
+on I2C bus #1::
+
+	$ modprobe bel-pfe
+	$ echo pfe3000 0x20 > /sys/bus/i2c/devices/i2c-1/new_device
+
+
+Platform data support
+---------------------
+
+The driver supports standard PMBus driver platform data.
+
+
+Sysfs entries
+-------------
+
+======================= =======================================================
+curr1_label		"iin"
+curr1_input		Measured input current
+curr1_max               Input current max value
+curr1_max_alarm         Input current max alarm
+
+curr[2-3]_label		"iout[1-2]"
+curr[2-3]_input		Measured output current
+curr[2-3]_max           Output current max value
+curr[2-3]_max_alarm     Output current max alarm
+
+fan[1-2]_input          Fan 1 and 2 speed in RPM
+fan1_target             Set fan speed reference for both fans
+
+in1_label		"vin"
+in1_input		Measured input voltage
+in1_crit		Input voltage critical max value
+in1_crit_alarm		Input voltage critical max alarm
+in1_lcrit               Input voltage critical min value
+in1_lcrit_alarm         Input voltage critical min alarm
+in1_max                 Input voltage max value
+in1_max_alarm           Input voltage max alarm
+
+in2_label               "vcap"
+in2_input               Hold up capacitor voltage
+
+in[3-8]_label		"vout[1-3,5-7]"
+in[3-8]_input		Measured output voltage
+in[3-4]_alarm           vout[1-2] output voltage alarm
+
+power[1-2]_label	"pin[1-2]"
+power[1-2]_input        Measured input power
+power[1-2]_alarm	Input power high alarm
+
+power[3-4]_label	"pout[1-2]"
+power[3-4]_input	Measured output power
+
+temp[1-3]_input		Measured temperature
+temp[1-3]_alarm         Temperature alarm
+======================= =======================================================
+
+.. note::
+
+    - curr3, fan2, vout[2-7], vcap, pin2, pout2 and temp3 attributes only
+      exist for PFE3000.
-- 
2.17.1

