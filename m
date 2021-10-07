Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE3424AF5
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsDx49F7z2ypC
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:11:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=keZbSDNA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=keZbSDNA; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCQ0jJ8z2ynB
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:09 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id F2E326E4;
 Wed,  6 Oct 2021 17:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565408;
 bh=ER5WeqZHv4e5QUzYa734QUR0PoxbR0U3SjMD2lEHAUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=keZbSDNA1mMasatHDQtMaMkueuv/Wl/NrVxagKzSv9B2w8npcfZGhAiaoF/dNtDER
 98B2ey8BNFF1lhoTJc0FXByC7wJz63gmpbx1r9/VHzznuwcPdM8OV/l3krJd2TqiSp
 u1ld/Adc8PuzQ9G8CgUPBkNOwKQCzWRQxjBbcbGQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/9] sysfs: add growable flag to struct bin_attribute
Date: Wed,  6 Oct 2021 17:09:47 -0700
Message-Id: <20211007000954.30621-3-zev@bewilderbeest.net>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Dan Williams <dan.j.williams@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Previously, sysfs_kf_bin_write() unconditionally disallowed writing
past the existing size of the file.  In order to support mutable
device-tree status properties (which are bin_attributes), we need to
be able to write a longer value over a shorter existing one
(e.g. writing "reserved\n" over "okay\0").  bin_attributes that
require this can now set the growable flag to disable that checking
and allow arbitrary amounts of data to be written at arbitrary
offsets.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 fs/sysfs/file.c       | 2 +-
 include/linux/sysfs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index b2b85be95adf..156df003ea8f 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -147,7 +147,7 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
 	struct kobject *kobj = of->kn->parent->priv;
 	loff_t size = file_inode(of->file)->i_size;
 
-	if (size) {
+	if (!battr->growable && size) {
 		if (size <= pos)
 			return -EFBIG;
 		count = min_t(ssize_t, count, size - pos);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 49de5189cf88..f8a56094c6c9 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -175,6 +175,7 @@ struct address_space;
 struct bin_attribute {
 	struct attribute	attr;
 	size_t			size;
+	bool			growable:1;
 	void			*private;
 	struct address_space *(*f_mapping)(void);
 	ssize_t (*read)(struct file *, struct kobject *, struct bin_attribute *,
-- 
2.33.0

