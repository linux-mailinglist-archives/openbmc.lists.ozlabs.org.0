Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992EE868607
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 02:36:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AxLlMvyX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkKp32zdXz3d2W
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 12:36:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=AxLlMvyX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkKnT0RG5z3by2
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 12:35:56 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BAB8642BE;
	Mon, 26 Feb 2024 17:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708997755;
	bh=djflHMn74Aoza7I3oyPhQDEGULANvQSmtPsfFrwIYIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AxLlMvyXHvt14ldDBhIa4S0wWMk7ibuO9rV2OF7ak9xXdpCJTaFgDzP64nK/sv6Gm
	 Fowrni/G+U1w2BihQcqwfrtfhR1BA4Cl1XVSXbu659qFAh+yQDK1nNCqPM1hssMDdE
	 bWpi/y082Tr2j+A0xZ8/9iE6fD6FJJPTY1hpF18o=
From: Zev Weiss <zev@bewilderbeest.net>
To: Russell King <linux@armlinux.org.uk>,
	linux-parisc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Helge Deller <deller@gmx.de>,
	Florent Revest <revest@chromium.org>
Subject: [PATCH RESEND 1/2] prctl: Generalize PR_SET_MDWE support check to be per-arch
Date: Mon, 26 Feb 2024 17:35:41 -0800
Message-ID: <20240227013546.15769-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227013546.15769-4-zev@bewilderbeest.net>
References: <20240227013546.15769-4-zev@bewilderbeest.net>
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
Cc: Sam James <sam@gentoo.org>, Ondrej Mosnacek <omosnace@redhat.com>, Kees Cook <keescook@chromium.org>, Zev Weiss <zev@bewilderbeest.net>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Stefan Roesch <shr@devkernel.io>, Yin Fengwei <fengwei.yin@intel.com>, stable@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Yang Shi <yang@os.amperecomputing.com>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Josh Triplett <josh@joshtriplett.org>
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
index dc7048824be8..bcb201ab7a41 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -162,6 +162,14 @@ calc_vm_flag_bits(unsigned long flags)
 
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
index f8e543f1e38a..8bb106a56b3a 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2408,8 +2408,11 @@ static inline int prctl_set_mdwe(unsigned long bits, unsigned long arg3,
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
2.43.2

