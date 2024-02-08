Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC384D79F
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 02:35:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ONjRy3aH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVfgk2bW5z3c12
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 12:35:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ONjRy3aH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 409 seconds by postgrey-1.37 at boromir; Thu, 08 Feb 2024 12:33:22 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVfdG2Fsbz3bn0
	for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2024 12:33:22 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id ED594D98;
	Wed,  7 Feb 2024 17:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1707355589;
	bh=3HS5yhO/DTt8/grju8Sqzw88K9FEC/162WIjUF71ihQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONjRy3aHpvhgvdr/qZopPFDDk9gJT0Cc5cn1ptSvy4EpaL5K7ZCgYTwrWu+Pty3Wb
	 FZJfZ784SCOysGyooOeqod7rgLZS9cjuzJ3WNFHtv5+CQyU9dcdZEKM4TWtPfJaG3N
	 eFGWY8+D/ROgtTNbHFzNbcJwhr2E3vXpCERbyNMI=
From: Zev Weiss <zev@bewilderbeest.net>
To: Helge Deller <deller@gmx.de>,
	linux-parisc@vger.kernel.org,
	Florent Revest <revest@chromium.org>
Subject: [PATCH 1/2] prctl: Generalize PR_SET_MDWE support check to be per-arch
Date: Wed,  7 Feb 2024 17:26:19 -0800
Message-ID: <20240208012620.32604-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208012620.32604-4-zev@bewilderbeest.net>
References: <20240208012620.32604-4-zev@bewilderbeest.net>
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
Cc: Sam James <sam@gentoo.org>, Ondrej Mosnacek <omosnace@redhat.com>, Zev Weiss <zev@bewilderbeest.net>, Stefan Roesch <shr@devkernel.io>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, Oleg Nesterov <oleg@redhat.com>, stable@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Yang Shi <yang@os.amperecomputing.com>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
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
index e219fcfa112d..8d4bd24fa555 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2394,8 +2394,11 @@ static inline int prctl_set_mdwe(unsigned long bits, unsigned long arg3,
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
2.43.0

