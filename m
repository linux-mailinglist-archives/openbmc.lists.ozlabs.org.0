Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD1424AF9
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsHj5DsXz2ywX
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:13:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cz+GMC44;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=cz+GMC44; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCT1HVZz309K
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:13 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 597DAC4F;
 Wed,  6 Oct 2021 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565411;
 bh=cSziyfy743JedtW4xRUNVrSzMdvpgBMMh/fwJwFcHxU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cz+GMC44xNjrax4KSWP/45q0mdz1QwTmEvoQGPUcQCseAE9LUQC/RE/X8f1mlkMAM
 Db3hnwmr5IvBUUDwHGN8kGnQE+4blLSqov7KASCyW3vr6Tcq2fS4YfVq/GWlvjNVp7
 fLDBmr8MPQBql/mYuuCMznAg6RfPMvpPaIYMisOo=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 5/9] of: add self parameter to of_update_property()
Date: Wed,  6 Oct 2021 17:09:50 -0700
Message-Id: <20211007000954.30621-6-zev@bewilderbeest.net>
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

This is to indicate that the property is being updated via its own
sysfs method so that we ultimately call into kernfs_remove_self() and
avoid the deadlock that would occur otherwise.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/base.c       | 7 ++++---
 drivers/of/dynamic.c    | 2 +-
 drivers/of/kobj.c       | 4 ++--
 drivers/of/of_private.h | 4 ++--
 include/linux/of.h      | 7 ++++++-
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f720c0d246f2..ce4d3bc2f8a6 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1902,8 +1902,9 @@ int __of_update_property(struct device_node *np, struct property *newprop,
 	return 0;
 }
 
+
 /*
- * of_update_property - Update a property in a node, if the property does
+ * of_update_property_self - Update a property in a node, if the property does
  * not exist, add it.
  *
  * Note that we don't actually remove it, since we have given out
@@ -1911,7 +1912,7 @@ int __of_update_property(struct device_node *np, struct property *newprop,
  * Instead we just move the property to the "dead properties" list,
  * and add the new property to the property list
  */
-int of_update_property(struct device_node *np, struct property *newprop)
+int of_update_property_self(struct device_node *np, struct property *newprop, bool self)
 {
 	struct property *oldprop;
 	unsigned long flags;
@@ -1927,7 +1928,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	if (!rc)
-		__of_update_property_sysfs(np, newprop, oldprop);
+		__of_update_property_sysfs(np, newprop, oldprop, self);
 
 	mutex_unlock(&of_mutex);
 
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index cd3821a6444f..8a67f3e1b223 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -652,7 +652,7 @@ static int __of_changeset_entry_apply(struct of_changeset_entry *ce)
 		__of_remove_property_sysfs(ce->np, ce->prop);
 		break;
 	case OF_RECONFIG_UPDATE_PROPERTY:
-		__of_update_property_sysfs(ce->np, ce->prop, ce->old_prop);
+		__of_update_property_sysfs(ce->np, ce->prop, ce->old_prop, false);
 		break;
 	}
 
diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 06d6c90f7aa1..378cb421aae1 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -104,14 +104,14 @@ void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
 }
 
 void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
-		struct property *oldprop)
+		struct property *oldprop, bool self)
 {
 	/* At early boot, bail out and defer setup to of_init() */
 	if (!of_kset)
 		return;
 
 	if (oldprop)
-		__of_sysfs_remove_bin_file(np, oldprop, false);
+		__of_sysfs_remove_bin_file(np, oldprop, self);
 	__of_add_property_sysfs(np, newprop);
 }
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index fff157c63907..3c6816237278 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -64,7 +64,7 @@ int of_node_is_attached(struct device_node *node);
 int __of_add_property_sysfs(struct device_node *np, struct property *pp);
 void __of_remove_property_sysfs(struct device_node *np, struct property *prop);
 void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
-		struct property *oldprop);
+		struct property *oldprop, bool self);
 int __of_attach_node_sysfs(struct device_node *np);
 void __of_detach_node_sysfs(struct device_node *np);
 #else
@@ -74,7 +74,7 @@ static inline int __of_add_property_sysfs(struct device_node *np, struct propert
 }
 static inline void __of_remove_property_sysfs(struct device_node *np, struct property *prop) {}
 static inline void __of_update_property_sysfs(struct device_node *np,
-		struct property *newprop, struct property *oldprop) {}
+		struct property *newprop, struct property *oldprop, bool self) {}
 static inline int __of_attach_node_sysfs(struct device_node *np)
 {
 	return 0;
diff --git a/include/linux/of.h b/include/linux/of.h
index 6f1c41f109bb..0e6479a884eb 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -401,7 +401,12 @@ extern int of_machine_is_compatible(const char *compat);
 
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
-extern int of_update_property(struct device_node *np, struct property *newprop);
+extern int of_update_property_self(struct device_node *np, struct property *newprop, bool self);
+
+static inline int of_update_property(struct device_node *np, struct property *newprop)
+{
+	return of_update_property_self(np, newprop, false);
+}
 
 /* For updating the device tree at runtime */
 #define OF_RECONFIG_ATTACH_NODE		0x0001
-- 
2.33.0

