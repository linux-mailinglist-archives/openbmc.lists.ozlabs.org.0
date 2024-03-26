Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124688CD82
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 20:50:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=KYrOJYS4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V40ln2BV8z3vXK
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 06:50:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=KYrOJYS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V40lD59ncz3dVv
	for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2024 06:50:16 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 1006342B3;
	Tue, 26 Mar 2024 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1711482612;
	bh=BQRXTCqA36tRjFMJ2z5wGRpop1ssoSHKkb0fjkWezYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYrOJYS4ByCbqhoMnebnHQrjtfDczaB+UgJeeZy06NZTpRzpu8pYaV7pV2LfvP8ms
	 GUIYE8RtGi5C0uoeCp+CLiuvQk8QJG4NG+E5PG9PFddIGBD39Tc2drVg0Jr/OPDUWM
	 gUMxRKmWzbW9lJgXhyZvboNr8laHRbpD/zXQRa0c=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.6 1/2] prctl: Generalize PR_SET_MDWE support check to be per-arch
Date: Tue, 26 Mar 2024 12:49:59 -0700
Message-ID: <20240326194959.10777-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326194959.10777-4-zev@bewilderbeest.net>
References: <20240326194959.10777-4-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There exist systems other than PARISC where MDWE may not be feasible
to support; rather than cluttering up the generic code with additional
arch-specific logic let's add a generic function for checking MDWE
support and allow each arch to override it as needed.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: <stable@vger.kernel.org> # v6.3+
---
 arch/parisc/include/asm/mman.h | 14 ++++++++++++++
 include/linux/mman.h           |  8 ++++++++
 kernel/sys.c                   |  7 +++++--
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 arch/parisc/include/asm/mman.h

diff --git a/arch/parisc/include/asm/mman.h b/arch/parisc/include/asm/mman.h
new file mode 100644
index 000000000000..47c5a1991d10
--- /dev/null
+++ b/arch/parisc/include/asm/mman.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <uapi/asm/mman.h>
+
+/* PARISC cannot allow mdwe as it needs writable stacks */
+static inline bool arch_memory_deny_write_exec_supported(void)
+{
+	return false;
+}
+#define arch_memory_deny_write_exec_supported arch_memory_deny_write_exec_supported
+
+#endif /* __ASM_MMAN_H__ */
diff --git a/include/linux/mman.h b/include/linux/mman.h
index 40d94411d492..db4741007bef 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -161,6 +161,14 @@ calc_vm_flag_bits(unsigned long flags)
 
 unsigned long vm_commit_limit(void);
 
+#ifndef arch_memory_deny_write_exec_supported
+static inline bool arch_memory_deny_write_exec_supported(void)
+{
+	return true;
+}
+#define arch_memory_deny_write_exec_supported arch_memory_deny_write_exec_supported
+#endif
+
 /*
  * Denies creating a writable executable mapping or gaining executable permissions.
  *
diff --git a/kernel/sys.c b/kernel/sys.c
index 7a4ae6d5aecd..44b575990333 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2395,8 +2395,11 @@ static inline int prctl_set_mdwe(unsigned long bits, unsigned long arg3,
 	if (bits & PR_MDWE_NO_INHERIT && !(bits & PR_MDWE_REFUSE_EXEC_GAIN))
 		return -EINVAL;
 
-	/* PARISC cannot allow mdwe as it needs writable stacks */
-	if (IS_ENABLED(CONFIG_PARISC))
+	/*
+	 * EOPNOTSUPP might be more appropriate here in principle, but
+	 * existing userspace depends on EINVAL specifically.
+	 */
+	if (!arch_memory_deny_write_exec_supported())
 		return -EINVAL;
 
 	current_bits = get_current_mdwe();
-- 
2.44.0

