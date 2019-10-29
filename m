Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8DE8F59
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 19:34:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472gGl0KsDzF12j
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2019 05:34:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HVDOx6Sp"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472fzr3lGHzF0WC
 for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2019 05:21:28 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id 3so10140117pfb.10
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 11:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=71OLTh41XrKOgl2b277xHxckY89HIxO01AHDWRPgmpQ=;
 b=HVDOx6SpM3iNoabX6kbFg8wVXEL7fQYdvrcfljTSfGQv1BcHl95QQPafoBrA3RQpBm
 d8ukeqaLVeYLTDzfPqc3BfkSk/Igy6rdUPTRF3s0Jt41s7U/wlNGo3EJoCuXffEP0+hd
 YVJUhgi3RqwkTdj8oyAArB3ERCUeG1SHRkkS55g32s89MinQZtg92aBgFEKOhf+Xp+dJ
 fmiBEoKzgJ/UELxLK1GJy/PwhZTDA5vU2Q3/7Rx2t3/Q9oXuy8YJzXdjCimY5nFJvTxu
 U8z28v7X8SgBixQ7aiPTaLqb/0CUcaCF8i9niyIac/+Q3Ku3ZaGnZEynjzq1dOXVSFe/
 OO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=71OLTh41XrKOgl2b277xHxckY89HIxO01AHDWRPgmpQ=;
 b=Ruor+UI6pQHf8t1zLy7anQjIPW5uoERLanz9XGEyTXKAIHHcLed0oU/SxhXSdCCNwF
 xa+bX/UeFDrm3iayc27eKL+sc+YOjUSGwqNdaMVzwsC57F+SzSm6wW2UfevyoXbWqGE2
 xFHVyo3ufaa980SXD2sUQ8B5FuyRxP5ua0xxp7I9fM0gJnqn1EAZjBcK5l9lq5Ewo981
 6zuJrfOXPIAIyLcQr7/Mt9BmY7eipDvsHx+Qv26EQaLuD8yLRg1gjQlnCmnn/+ZHD+nG
 3oY71JgmBgB5Yr5SwUYPfiahheJn4EKSanQBHHTvl/yTcHleo8dOLdLlhhsThoAC4FUl
 5f9w==
X-Gm-Message-State: APjAAAVu1mQ5sOWOcPJXepttSODXPhDwhjLulYC68DjIIaLhYVORGcMD
 Tp9JmawuWdHvSXPbLKCSUno=
X-Google-Smtp-Source: APXvYqx8/f20Koaa9igAtGwiT6Fa2k/qo+Kax/K+OlebL05JtE02KjKFn+X4YH1sFALw4hbn8dqL0A==
X-Received: by 2002:a17:90a:c097:: with SMTP id
 o23mr8477800pjs.41.1572373285690; 
 Tue, 29 Oct 2019 11:21:25 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:3a3e])
 by smtp.gmail.com with ESMTPSA id j10sm13488418pfn.128.2019.10.29.11.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 11:21:25 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH v2 2/2] docs: hwmon: Document bel-pfe pmbus driver
Date: Tue, 29 Oct 2019 11:20:54 -0700
Message-Id: <20191029182054.32279-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029182054.32279-1-rentao.bupt@gmail.com>
References: <20191029182054.32279-1-rentao.bupt@gmail.com>
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
 No change in v2.

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

