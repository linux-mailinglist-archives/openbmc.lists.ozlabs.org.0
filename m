Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F076868615
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 02:38:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=i8pi9UQD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkKqx1Z8xz3brl
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 12:38:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=i8pi9UQD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkKnT4M6yz3by2
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 12:35:57 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 70FAB42C7;
	Mon, 26 Feb 2024 17:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708997756;
	bh=BpkbZoKcb/ElcmyFvuLHFS6Mz0ozyOSKWVwGl1poh1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i8pi9UQDl+FTEkyoh7hOS5J5lRGjMIL8a3rV/L92/Ad3dZCdBxJOWKlDIP2Mxec0c
	 LnnIgq4N20v+KoqvA71dCi7nzTaFMc4gZN0pNNwiND5AEDG/ShB0ouziEmHKwtYsxD
	 cZIMb7RFbVGdMffzTaUtGY0JwePwtrzZORnDBQKc=
From: Zev Weiss <zev@bewilderbeest.net>
To: Russell King <linux@armlinux.org.uk>,
	linux-parisc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Helge Deller <deller@gmx.de>,
	Florent Revest <revest@chromium.org>
Subject: [PATCH RESEND 2/2] ARM: prctl: Reject PR_SET_MDWE on pre-ARMv6
Date: Mon, 26 Feb 2024 17:35:42 -0800
Message-ID: <20240227013546.15769-6-zev@bewilderbeest.net>
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

On v5 and lower CPUs we can't provide MDWE protection, so ensure we
fail any attempt to enable it via prctl(PR_SET_MDWE).

Previously such an attempt would misleadingly succeed, leading to any
subsequent mmap(PROT_READ|PROT_WRITE) or execve() failing
unconditionally (the latter somewhat violently via
force_fatal_sig(SIGSEGV) due to READ_IMPLIES_EXEC).

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Cc: <stable@vger.kernel.org> # v6.3+
---
 arch/arm/include/asm/mman.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 arch/arm/include/asm/mman.h

diff --git a/arch/arm/include/asm/mman.h b/arch/arm/include/asm/mman.h
new file mode 100644
index 000000000000..2189e507c8e0
--- /dev/null
+++ b/arch/arm/include/asm/mman.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MMAN_H__
+#define __ASM_MMAN_H__
+
+#include <asm/system_info.h>
+#include <uapi/asm/mman.h>
+
+static inline bool arch_memory_deny_write_exec_supported(void)
+{
+	return cpu_architecture() >= CPU_ARCH_ARMv6;
+}
+#define arch_memory_deny_write_exec_supported arch_memory_deny_write_exec_supported
+
+#endif /* __ASM_MMAN_H__ */
-- 
2.43.2

