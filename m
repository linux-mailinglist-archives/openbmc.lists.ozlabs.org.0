Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53411424AF8
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsH11kp8z305Q
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:13:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gbOT1++M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gbOT1++M; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCS3dpGz308J
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:12 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B13EEB11;
 Wed,  6 Oct 2021 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565410;
 bh=m1RXT0HKfhkF80qBBFrD7o1Digzwr88Vjm6uogtzkXw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gbOT1++MJbeyR+JEdu/exweu5sXz1+O20WUNQ5n+F4mEMLiTZAQDj7TPnLRB7PCnJ
 c/fIYdJ5gmDoeuX8WLApoapKBdA0UQ/VQteF29l3L5oUkr26LdRU5jA0lVE+gL2N0y
 ImJ+ORbdxfmZEa5GTX9UgHpYWwmbktXLq8xlGTl8=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 4/9] of: add self parameter to __of_sysfs_remove_bin_file()
Date: Wed,  6 Oct 2021 17:09:49 -0700
Message-Id: <20211007000954.30621-5-zev@bewilderbeest.net>
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

This allows using the function to remove a bin_attribute from that
attribute's own methods (by calling sysfs_remove_bin_file_self()
instead of sysfs_remove_bin_file()).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/of/kobj.c       | 13 ++++++++-----
 drivers/of/of_private.h |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 6675b5e56960..06d6c90f7aa1 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -84,12 +84,15 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 	return rc;
 }
 
-void __of_sysfs_remove_bin_file(struct device_node *np, struct property *prop)
+void __of_sysfs_remove_bin_file(struct device_node *np, struct property *prop, bool self)
 {
 	if (!IS_ENABLED(CONFIG_SYSFS))
 		return;
 
-	sysfs_remove_bin_file(&np->kobj, &prop->attr);
+	if (self)
+		sysfs_remove_bin_file_self(&np->kobj, &prop->attr);
+	else
+		sysfs_remove_bin_file(&np->kobj, &prop->attr);
 	kfree(prop->attr.attr.name);
 }
 
@@ -97,7 +100,7 @@ void __of_remove_property_sysfs(struct device_node *np, struct property *prop)
 {
 	/* at early boot, bail here and defer setup to of_init() */
 	if (of_kset && of_node_is_attached(np))
-		__of_sysfs_remove_bin_file(np, prop);
+		__of_sysfs_remove_bin_file(np, prop, false);
 }
 
 void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
@@ -108,7 +111,7 @@ void __of_update_property_sysfs(struct device_node *np, struct property *newprop
 		return;
 
 	if (oldprop)
-		__of_sysfs_remove_bin_file(np, oldprop);
+		__of_sysfs_remove_bin_file(np, oldprop, false);
 	__of_add_property_sysfs(np, newprop);
 }
 
@@ -157,7 +160,7 @@ void __of_detach_node_sysfs(struct device_node *np)
 	/* only remove properties if on sysfs */
 	if (of_node_is_attached(np)) {
 		for_each_property_of_node(np, pp)
-			__of_sysfs_remove_bin_file(np, pp);
+			__of_sysfs_remove_bin_file(np, pp, false);
 		kobject_del(&np->kobj);
 	}
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 75e67b8bb826..fff157c63907 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -134,7 +134,7 @@ extern int __of_update_property(struct device_node *np,
 extern void __of_detach_node(struct device_node *np);
 
 extern void __of_sysfs_remove_bin_file(struct device_node *np,
-				       struct property *prop);
+                                       struct property *prop, bool selfremove);
 
 /* illegal phandle value (set when unresolved) */
 #define OF_PHANDLE_ILLEGAL	0xdeadbeef
-- 
2.33.0

