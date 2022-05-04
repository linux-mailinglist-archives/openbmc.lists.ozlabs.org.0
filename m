Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AC5197AE
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 08:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtSJ96SCKz3bZC
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 16:55:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=N4uL++YQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=N4uL++YQ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSFp5hjrz3064
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 16:53:02 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id DA0B3A11;
 Tue,  3 May 2022 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1651647181;
 bh=vCwgw617O/ewX8QDmnxBymU7T8PA39aGYTHp7lO2log=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N4uL++YQpdaJ8unIiXshkYfNDpxH9arZNEdbkLa5RClvz581Uo7SaG97xVN7X6lJy
 N/Y/cok5zegTItliQc4ngL+iVbY+QTtEgr8+Uk06OxHfN8AJUOn3h+YAQBx8ajLdXZ
 ztz5vegJQp65Tw6gSLJ+EeD5mZxiq5OHPuhwV07I=
From: Zev Weiss <zev@bewilderbeest.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/6] regulator: core: Add external-output support
Date: Tue,  3 May 2022 23:52:50 -0700
Message-Id: <20220504065252.6955-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504065252.6955-1-zev@bewilderbeest.net>
References: <20220504065252.6955-1-zev@bewilderbeest.net>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Regulators feeding external outputs (i.e. supplying devices we don't
control) can be switched on and off by userspace via the 'state' sysfs
attribute, which is now (conditionally) writable.  They are also not
automatically disabled in regulator_late_cleanup(), since we have no
way of knowing that they're not actually in use.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../ABI/testing/sysfs-class-regulator         |  4 ++
 drivers/regulator/core.c                      | 41 ++++++++++++++++---
 drivers/regulator/of_regulator.c              |  2 +
 include/linux/regulator/machine.h             |  1 +
 4 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-regulator b/Documentation/ABI/testing/sysfs-class-regulator
index 475b9a372657..1c0451730df2 100644
--- a/Documentation/ABI/testing/sysfs-class-regulator
+++ b/Documentation/ABI/testing/sysfs-class-regulator
@@ -23,6 +23,10 @@ Description:
 		'unknown' means software cannot determine the state, or
 		the reported state is invalid.
 
+		For regulators supplying external outputs, 'enabled'
+		or 'disabled' can be written to this file to turn the
+		regulator on and off.
+
 		NOTE: this field can be used in conjunction with microvolts
 		or microamps to determine configured regulator output levels.
 
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 9094bd8772e5..b7617926336f 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -83,6 +83,8 @@ struct regulator_supply_alias {
 
 static int _regulator_is_enabled(struct regulator_dev *rdev);
 static int _regulator_disable(struct regulator *regulator);
+static int _regulator_do_enable(struct regulator_dev *rdev);
+static int _regulator_do_disable(struct regulator_dev *rdev);
 static int _regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags);
 static int _regulator_get_current_limit(struct regulator_dev *rdev);
 static unsigned int _regulator_get_mode(struct regulator_dev *rdev);
@@ -667,7 +669,33 @@ static ssize_t state_show(struct device *dev,
 
 	return ret;
 }
-static DEVICE_ATTR_RO(state);
+
+static ssize_t state_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct regulator_dev *rdev = dev_get_drvdata(dev);
+	bool enabled;
+	ssize_t ret = 0;
+
+	if (sysfs_streq(buf, "enabled"))
+		enabled = true;
+	else if (sysfs_streq(buf, "disabled"))
+		enabled = false;
+	else
+		return -EINVAL;
+
+	regulator_lock(rdev);
+	if (enabled != _regulator_is_enabled(rdev)) {
+		if (enabled)
+			ret = _regulator_do_enable(rdev);
+		else
+			ret = _regulator_do_disable(rdev);
+	}
+	regulator_unlock(rdev);
+
+	return ret ? : count;
+}
+static DEVICE_ATTR_RW(state);
 
 static ssize_t status_show(struct device *dev,
 			   struct device_attribute *attr, char *buf)
@@ -5051,8 +5079,11 @@ static umode_t regulator_attr_is_visible(struct kobject *kobj,
 	if (attr == &dev_attr_opmode.attr)
 		return ops->get_mode ? mode : 0;
 
-	if (attr == &dev_attr_state.attr)
+	if (attr == &dev_attr_state.attr) {
+		if (!(rdev->constraints && rdev->constraints->external_output))
+			mode &= ~0222;
 		return (rdev->ena_pin || ops->is_enabled) ? mode : 0;
+	}
 
 	if (attr == &dev_attr_status.attr)
 		return ops->get_status ? mode : 0;
@@ -6062,7 +6093,7 @@ static int regulator_late_cleanup(struct device *dev, void *data)
 	struct regulation_constraints *c = rdev->constraints;
 	int ret;
 
-	if (c && c->always_on)
+	if (c && (c->always_on || c->external_output))
 		return 0;
 
 	if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_STATUS))
@@ -6114,8 +6145,8 @@ static void regulator_init_complete_work_function(struct work_struct *work)
 
 	/* If we have a full configuration then disable any regulators
 	 * we have permission to change the status for and which are
-	 * not in use or always_on.  This is effectively the default
-	 * for DT and ACPI as they have full constraints.
+	 * not in use, always_on, or external_output.  This is effectively
+	 * the default for DT and ACPI as they have full constraints.
 	 */
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_late_cleanup);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index f54d4f176882..f48e6ea2b97e 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -96,6 +96,8 @@ static int of_get_regulation_constraints(struct device *dev,
 
 	constraints->name = of_get_property(np, "regulator-name", NULL);
 
+	constraints->external_output = of_property_read_bool(np, "regulator-external-output");
+
 	if (!of_property_read_u32(np, "regulator-min-microvolt", &pval))
 		constraints->min_uV = pval;
 
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 621b7f4a3639..a38e7db9f82e 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -219,6 +219,7 @@ struct regulation_constraints {
 	unsigned over_voltage_detection:1; /* notify on over voltage */
 	unsigned under_voltage_detection:1; /* notify on under voltage */
 	unsigned over_temp_detection:1; /* notify on over temperature */
+	unsigned external_output:1; /* output supplies only external devices */
 };
 
 /**
-- 
2.36.0

