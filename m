Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C4424AF6
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsFd2gLVz3bWB
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:12:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=CzSq95tb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=CzSq95tb; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCQ6Ss4z306R
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:10 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 71073631;
 Wed,  6 Oct 2021 17:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565406;
 bh=4NkVLqGg/KjNptjTQZ/atTM1MYPT1i0umkxcy4BLe98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CzSq95tbOSKIzT6diFAHOJsgLiMCNcj5ajO00p1C5HcInWN9ksZR/bd0WjLe6dBGX
 RNX+QqLt7veMKgWlTCog4xgySxQadL7iZVufNPu5ud8/4AvocYLbQN4JOaS3PFXKKk
 EY0IrOBtNn5Rng7h8pEcUZnxxX46TLGLyPNWAP6Y=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 1/9] sysfs: add sysfs_remove_bin_file_self() function
Date: Wed,  6 Oct 2021 17:09:46 -0700
Message-Id: <20211007000954.30621-2-zev@bewilderbeest.net>
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
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is simply the bin_attribute analog to sysfs_remove_file_self().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 fs/sysfs/file.c       | 13 +++++++++++++
 include/linux/sysfs.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index d019d6ac6ad0..b2b85be95adf 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -572,6 +572,19 @@ void sysfs_remove_bin_file(struct kobject *kobj,
 }
 EXPORT_SYMBOL_GPL(sysfs_remove_bin_file);
 
+/**
+ * sysfs_remove_file_self - remove binary object attribute from its own method
+ * @kobj: object to operate on
+ * @attr: binary attribute descriptor
+ *
+ * See kernfs_remove_self() for details.
+ */
+bool sysfs_remove_bin_file_self(struct kobject *kobj, const struct bin_attribute *attr)
+{
+	return sysfs_remove_file_self(kobj, &attr->attr);
+}
+EXPORT_SYMBOL_GPL(sysfs_remove_bin_file_self);
+
 static int internal_change_owner(struct kernfs_node *kn, kuid_t kuid,
 				 kgid_t kgid)
 {
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index e3f1e8ac1f85..49de5189cf88 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -273,6 +273,7 @@ int __must_check sysfs_create_bin_file(struct kobject *kobj,
 				       const struct bin_attribute *attr);
 void sysfs_remove_bin_file(struct kobject *kobj,
 			   const struct bin_attribute *attr);
+bool sysfs_remove_bin_file_self(struct kobject *kobj, const struct bin_attribute *attr);
 
 int __must_check sysfs_create_link(struct kobject *kobj, struct kobject *target,
 				   const char *name);
-- 
2.33.0

