Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B21C424AFD
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:14:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsJp2K9Dz2ynL
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:14:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=LJnbGq7T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=LJnbGq7T; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCT4M9tz2ynx
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:13 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C94CFC65;
 Wed,  6 Oct 2021 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565412;
 bh=X7NcKoZNi7nh2DbYzKpYnZIhtNF3Gmm/jHD3A05+bD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LJnbGq7T4ITbr8iPodDndpzFsO83HayGNRUaqWxHfxLjDGm94vkTZoCtoI7sIULoj
 buTVz6hkQIaZJUMCSbGdDevAAoFHUZ3PPZ6M6AhLFBbhTLGlfwp79l0vouM8SYY29D
 7E9N6KqIf0NLcQ7yLNK1JPJJD6uz4n0WtJ9PAzQ0=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 6/9] of: add support for 'dynamic' DT property
Date: Wed,  6 Oct 2021 17:09:51 -0700
Message-Id: <20211007000954.30621-7-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007000954.30621-1-zev@bewilderbeest.net>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
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
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Nodes marked with this (boolean) property will have a writable status
sysfs file, which can be used to toggle them between "okay" and
"reserved", effectively hot-plugging them.  Note that this will only
be effective for devices on busses that register for OF reconfig
notifications (currently spi, i2c, and platform), and only if
CONFIG_OF_DYNAMIC is enabled.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/kobj.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 378cb421aae1..141ae23f3130 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -36,6 +36,69 @@ static ssize_t of_node_property_read(struct file *filp, struct kobject *kobj,
 	return memory_read_from_buffer(buf, count, &offset, pp->value, pp->length);
 }
 
+static ssize_t of_node_status_write(struct file *filp, struct kobject *kobj,
+                                    struct bin_attribute *bin_attr, char *buf,
+                                    loff_t offset, size_t count)
+{
+	int rc;
+	char *newstatus;
+	struct property **deadprev;
+	struct property *newprop = NULL;
+	struct property *oldprop = container_of(bin_attr, struct property, attr);
+	struct device_node *np = container_of(kobj, struct device_node, kobj);
+
+	if (WARN_ON_ONCE(strcmp(oldprop->name, "status")))
+		return -EIO;
+
+	if (offset)
+		return -EINVAL;
+
+	if (sysfs_buf_streq(buf, count, "okay") || sysfs_buf_streq(buf, count, "ok"))
+		newstatus = "okay";
+	else if (sysfs_buf_streq(buf, count, "reserved"))
+		newstatus = "reserved";
+	else if (sysfs_buf_streq(buf, count, "disabled"))
+		newstatus = "disabled";
+	else
+		return -EINVAL;
+
+	if (!strcmp(newstatus, oldprop->value))
+		return count;
+
+	/*
+	 * of_update_property_self() doesn't free replaced properties, so
+	 * rifle through deadprops first to see if there's an equivalent old
+	 * status property we can reuse instead of allocating a new one.
+	 */
+	mutex_lock(&of_mutex);
+	for (deadprev = &np->deadprops; *deadprev; deadprev = &(*deadprev)->next) {
+		struct property *deadprop = *deadprev;
+		if (!strcmp(deadprop->name, "status") &&
+		    deadprop->length == strlen(newstatus) + 1 &&
+		    !strcmp(deadprop->value, newstatus)) {
+			*deadprev = deadprop->next;
+			deadprop->next = NULL;
+			newprop = deadprop;
+			break;
+		}
+	}
+	mutex_unlock(&of_mutex);
+
+	if (!newprop) {
+		newprop = kzalloc(sizeof(*newprop), GFP_KERNEL);
+		if (!newprop)
+			return -ENOMEM;
+
+		newprop->name = oldprop->name;
+		newprop->value = newstatus;
+		newprop->length = strlen(newstatus) + 1;
+	}
+
+	rc = of_update_property_self(np, newprop, true);
+
+	return rc ? rc : count;
+}
+
 /* always return newly allocated name, caller must free after use */
 static const char *safe_name(struct kobject *kobj, const char *orig_name)
 {
@@ -79,6 +142,12 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	pp->attr.size = secure ? 0 : pp->length;
 	pp->attr.read = of_node_property_read;
 
+	if (!strcmp(pp->name, "status") && of_property_read_bool(np, "dynamic")) {
+		pp->attr.attr.mode |= 0200;
+		pp->attr.write = of_node_status_write;
+		pp->attr.growable = true;
+	}
+
 	rc = sysfs_create_bin_file(&np->kobj, &pp->attr);
 	WARN(rc, "error adding attribute %s to node %pOF\n", pp->name, np);
 	return rc;
-- 
2.33.0

