Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1C868613
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 02:37:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=FJ6YLI7s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkKq01XwYz3cBG
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 12:37:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=FJ6YLI7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkKnT0T8Pz3cBG
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 12:35:56 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0D6F48A;
	Mon, 26 Feb 2024 17:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708997754;
	bh=2LGMoG5lzw93A3enN/2kw2d60L6ZTNDD2AvAsIcBPUA=;
	h=From:To:Cc:Subject:Date:From;
	b=FJ6YLI7sYbcpLH87YNKyDBadQUCtbuQwg4rTyYqz82ieGu866VqzLPH9zFr/wftHg
	 /ZlGqrj5BMlSWjMcPcAhBIqAlS2fWO4rWhGjUgjSiz2mBSatUs9hQR4xht8Fud0WPh
	 QJSVNGF2oJ0NU7A7ElTtq0x2ZjoxEH3TSSWL9hdU=
From: Zev Weiss <zev@bewilderbeest.net>
To: Russell King <linux@armlinux.org.uk>,
	linux-parisc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Helge Deller <deller@gmx.de>,
	Florent Revest <revest@chromium.org>
Subject: [PATCH RESEND 0/2] ARM: prctl: Reject PR_SET_MDWE where not supported
Date: Mon, 26 Feb 2024 17:35:40 -0800
Message-ID: <20240227013546.15769-4-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.43.2
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

[Resending as per Russell's request...]

Hello,

I noticed after a recent kernel update that my ARM926 system started
segfaulting on any execve() after calling prctl(PR_SET_MDWE).  After
some investigation it appears that ARMv5 is incapable of providing the
appropriate protections for MDWE, since any readable memory is also
implicitly executable.

(Note that I'm not an expert in either ARM arch details or the mm
subsystem, so please bear with me if I've botched something in the
above analysis.)

The prctl_set_mdwe() function already had some special-case logic
added disabling it on PARISC (commit 793838138c15, "prctl: Disable
prctl(PR_SET_MDWE) on parisc"); this patch series (1) generalizes that
check to use an arch_*() function, and (2) adds a corresponding
override for ARM to disable MDWE on pre-ARMv6 CPUs.

With the series applied, prctl(PR_SET_MDWE) is rejected on ARMv5 and
subsequent execve() calls (as well as mmap(PROT_READ|PROT_WRITE)) can
succeed instead of unconditionally failing; on ARMv6 the prctl works
as it did previously.


Thanks,
Zev

[0] https://lore.kernel.org/all/2023112456-linked-nape-bf19@gregkh/

Zev Weiss (2):
  prctl: Generalize PR_SET_MDWE support check to be per-arch
  ARM: prctl: Reject PR_SET_MDWE on pre-ARMv6

 arch/arm/include/asm/mman.h    | 14 ++++++++++++++
 arch/parisc/include/asm/mman.h | 14 ++++++++++++++
 include/linux/mman.h           |  8 ++++++++
 kernel/sys.c                   |  7 +++++--
 4 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/include/asm/mman.h
 create mode 100644 arch/parisc/include/asm/mman.h

-- 
2.43.2

