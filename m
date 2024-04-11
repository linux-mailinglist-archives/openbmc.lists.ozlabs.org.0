Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE88A04C8
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 02:28:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=fC8QKHBE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFLCJ2prkz3dX4
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 10:28:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=fC8QKHBE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFLBk5Kr9z3bq0
	for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2024 10:27:58 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9BCE777D;
	Wed, 10 Apr 2024 17:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1712795273;
	bh=65GGx1QpnvI3lHrxY4FZBOPcE11YXigukyX++z/Fa0k=;
	h=From:To:Cc:Subject:Date:From;
	b=fC8QKHBEA1yIJIIKZ57SjN3vZQTAbzpCVLaUwwdxai72yDtoEOxKjwScndQlPwz0k
	 mBs80a+GBThjDe33Gh8bhP/pmaRd8Fq4kxDnFMWdC5DJzllKVbQkRX+nD12rzMGKTQ
	 VSgbI2ZRUvf6YY5ThOnPfRZH+bCj6XC2KmhtTxbU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bash: Fix file-substitution error-handling bug
Date: Wed, 10 Apr 2024 17:27:26 -0700
Message-ID: <20240411002728.15983-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.44.0
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
Cc: openbmc@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is part of a patch that's been upstream for a while but hasn't yet
been released.  The bug is causing some downstream difficulties, so a
local patch to tide us over until the next release makes things a bit
easier.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 .../bash/bash/fix-filesubst-errexit.patch     | 33 +++++++++++++++++++
 meta/recipes-extended/bash/bash_5.2.21.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch

diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
new file mode 100644
index 000000000000..9ef1394e74c4
--- /dev/null
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -0,0 +1,33 @@
+From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Fri, 7 Apr 2023 00:28:46 -0700
+Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
+ enabled
+
+This is a trimmed-down version of a commit in the bash 'devel' branch
+[1] that contains this fix as well as other unrelated ones.
+
+[1] https://git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=ec9447ce9392a0f93d96789c3741285fede8a150
+
+Upstream-Status: Backport
+
+---
+ builtins/evalstring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/builtins/evalstring.c b/builtins/evalstring.c
+index df3dd68e2a7e..6612081cd646 100644
+--- a/builtins/evalstring.c
++++ b/builtins/evalstring.c
+@@ -753,7 +753,7 @@ open_redir_file (r, fnp)
+   fd = open(fn, O_RDONLY);
+   if (fd < 0)
+     {
+-      file_error (fn);
++      internal_error ("%s: %s", fn, strerror (errno));
+       free (fn);
+       if (fnp)
+ 	*fnp = 0;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.21.bb
index 46d921bbe6c6..532adf4c1a0d 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.21.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://fix-run-builtins.patch \
            file://use_aclocal.patch \
            file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch \
+           file://fix-filesubst-errexit.patch \
            "
 
 SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
-- 
2.34.1

