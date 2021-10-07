Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA199424AF7
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 02:12:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPsGK4BdKz2ywB
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 11:12:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Z2Snd7k8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Z2Snd7k8; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPsCS1DRHz2yxm
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 11:10:12 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0A7C772E;
 Wed,  6 Oct 2021 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1633565410;
 bh=UaP+I3aEfwYCqu+AhNqB3qb/bc06VjyurZYTcvpHLj0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z2Snd7k88x1gsHrzmMujLVxsaywkIr7HTLXrlaC7srgZaYPg+pJzqHfMo8wsy70ol
 QTU/iO/cgyzOYdcdlwjGmERFA8qiXXqzWLEeSr8mSCyCf4SKYh6Q7Mx0WWfHjxQdTh
 K+3X9qVLMl59O+YXwafMJQJ4Wq3nArSYPK+JNRJw=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 3/9] lib/string: add sysfs_buf_streq()
Date: Wed,  6 Oct 2021 17:09:48 -0700
Message-Id: <20211007000954.30621-4-zev@bewilderbeest.net>
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
Cc: Andy Shevchenko <andy@kernel.org>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is intended for use with mutable device-tree string properties.
As with sysfs_streq(), it accepts a trailing linefeed for convenient
shell access (e.g. 'echo foo > /sys/firmware/devicetree/...'), but
also accepts a trailing NUL terminator to match how DT string
properties are presented when read (so that we don't reject userspace
writing back exactly what it had previously read from the file).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 include/linux/string.h |  1 +
 lib/string.c           | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index 5e96d656be7a..d066ff82d1ec 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -183,6 +183,7 @@ extern char **argv_split(gfp_t gfp, const char *str, int *argcp);
 extern void argv_free(char **argv);
 
 extern bool sysfs_streq(const char *s1, const char *s2);
+extern bool sysfs_buf_streq(const void *buf, size_t blen, const char *str);
 int match_string(const char * const *array, size_t n, const char *string);
 int __sysfs_match_string(const char * const *array, size_t n, const char *s);
 
diff --git a/lib/string.c b/lib/string.c
index b2de45a581f4..aab5cadb6b98 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -715,6 +715,40 @@ bool sysfs_streq(const char *s1, const char *s2)
 }
 EXPORT_SYMBOL(sysfs_streq);
 
+/**
+ * sysfs_buf_streq - check if a buffer matches a string, modulo trailing \n or \0
+ * @buf: pointer to the buffer to check
+ * @blen: length of the buffer to check
+ * @str: string to compare against
+ *
+ * This routine returns true iff the buffer equals the string, treating a
+ * trailing \n or \0 on the buffer as an accepted terminator, the length of
+ * which (aside from the optional terminator) must match the length of the
+ * string.  It's geared for use with sysfs bin_attribute inputs, which may
+ * terminate with newlines or NULs (the latter to match how device-tree string
+ * properties in particular are presented on read).
+ */
+bool sysfs_buf_streq(const void *buf, size_t blen, const char *str)
+{
+	const char *p = buf;
+	size_t slen = strlen(str);
+	if (blen < slen)
+		return false;
+
+	if (memcmp(p, str, slen))
+		return false;
+
+	switch (blen - slen) {
+	case 0:
+		return true;
+	case 1:
+		return p[slen] == '\n' || p[slen] == '\0';
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL(sysfs_buf_streq);
+
 /**
  * match_string - matches given string in an array
  * @array:	array of strings
-- 
2.33.0

