Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF241C3EA
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFDh6Qj0z301N
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:55:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=kbG2Osc2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=kbG2Osc2; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFCl0jk1z2yLm
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 21:54:26 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 89B6E5BB;
 Wed, 29 Sep 2021 04:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916463;
 bh=VvdpB8mbsYf/DJVsjaHTusalreawtUz+RvXRNF7RnKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kbG2Osc2t+/QFFAWn9ongmo33wgHSa7nxJfnis/84QRCheip6ACs4vk2ndlhTeMTH
 bz/yF1Ts6JL7fgwosxPYf2Iw0VYA9PY48tqBiWnt491P7dYMMQ3/5oXyCUqHMoS/Cu
 1YUOITs+uvDqowgJN5PVsI8EiuTRqCcUOrpOLNIs=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/6] of: base: Add function to check for status = "reserved"
Date: Wed, 29 Sep 2021 04:54:03 -0700
Message-Id: <20210929115409.21254-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Per v0.3 of the Devicetree Specification [0]:

  Indicates that the device is operational, but should not be used.
  Typically this is used for devices that are controlled by another
  software component, such as platform firmware.

One use-case for this is in OpenBMC, where certain devices (such as a
BIOS flash chip) may be shared by the host and the BMC, but cannot be
accessed by the BMC during its usual boot-time device probing, because
they require additional (potentially elaborate) coordination with the
host to arbitrate which processor is controlling the device.

Devices marked with this status should thus be instantiated, but not
have a driver bound to them or be otherwise touched.

[0] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/base.c  | 53 +++++++++++++++++++++++++++++++++++++++-------
 include/linux/of.h |  6 ++++++
 2 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f720c0d246f2..c5cc178fc6bd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -579,14 +579,18 @@ int of_machine_is_compatible(const char *compat)
 EXPORT_SYMBOL(of_machine_is_compatible);
 
 /**
- *  __of_device_is_available - check if a device is available for use
+ * __of_device_check_status - check if a device's status matches a particular string
  *
- *  @device: Node to check for availability, with locks already held
+ * @device: Node to check status of, with locks already held
+ * @val: Status string to check for
+ * @alt: Optional alternate status string to check for (NULL to check only @val)
+ * @dflt: default to return if status property absent
  *
- *  Return: True if the status property is absent or set to "okay" or "ok",
- *  false otherwise
+ * Return: True if status property exists and matches either @val or @alt.
+ * @dflt if status property is absent.  False otherwise.
  */
-static bool __of_device_is_available(const struct device_node *device)
+static bool __of_device_check_status(const struct device_node *device, const char *val,
+                                     const char *alt, bool dflt)
 {
 	const char *status;
 	int statlen;
@@ -595,17 +599,30 @@ static bool __of_device_is_available(const struct device_node *device)
 		return false;
 
 	status = __of_get_property(device, "status", &statlen);
-	if (status == NULL)
-		return true;
+	if (!status)
+		return dflt;
 
 	if (statlen > 0) {
-		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
+		if (!strcmp(status, val) || (alt && !strcmp(status, alt)))
 			return true;
 	}
 
 	return false;
 }
 
+/**
+ * __of_device_is_available - check if a device is available for use
+ *
+ * @device: Node to check for availability, with locks already held
+ *
+ * Return: True if the status property is absent or set to "okay" or "ok",
+ * false otherwise
+ */
+static bool __of_device_is_available(const struct device_node *device)
+{
+	return __of_device_check_status(device, "okay", "ok", true);
+}
+
 /**
  *  of_device_is_available - check if a device is available for use
  *
@@ -627,6 +644,26 @@ bool of_device_is_available(const struct device_node *device)
 }
 EXPORT_SYMBOL(of_device_is_available);
 
+/**
+ * of_device_is_reserved - check if a device is marked as reserved
+ *
+ * @device: Node to check for reservation
+ *
+ * Return: True if the status property is set to "reserved", false otherwise
+ */
+bool of_device_is_reserved(const struct device_node *device)
+{
+	unsigned long flags;
+	bool res;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	res = __of_device_check_status(device, "reserved", NULL, false);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+
+	return res;
+}
+EXPORT_SYMBOL(of_device_is_reserved);
+
 /**
  *  of_device_is_big_endian - check if a device has BE registers
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 6f1c41f109bb..aa9762da5e7c 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -345,6 +345,7 @@ extern int of_device_is_compatible(const struct device_node *device,
 extern int of_device_compatible_match(struct device_node *device,
 				      const char *const *compat);
 extern bool of_device_is_available(const struct device_node *device);
+extern bool of_device_is_reserved(const struct device_node *device);
 extern bool of_device_is_big_endian(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,
 				const char *name,
@@ -707,6 +708,11 @@ static inline bool of_device_is_available(const struct device_node *device)
 	return false;
 }
 
+static inline bool of_device_is_reserved(const struct device_node *device)
+{
+	return false;
+}
+
 static inline bool of_device_is_big_endian(const struct device_node *device)
 {
 	return false;
-- 
2.33.0

