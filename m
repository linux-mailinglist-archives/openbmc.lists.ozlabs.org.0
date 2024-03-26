Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE27688CD8E
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 20:52:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gDRFGPTj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V40nd3NRnz3dhR
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 06:52:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gDRFGPTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V40lD586kz3dV7
	for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2024 06:50:16 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C6EE621EA;
	Tue, 26 Mar 2024 12:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1711482611;
	bh=17iBI4G9F67ykK4/m+YIQXrVKF/YrwOQ8DpUpZknaF8=;
	h=From:To:Cc:Subject:Date:From;
	b=gDRFGPTjdUZHNCAcxXx6W9EHPCKZRYYSEiRFI+kXYYLY68B3/8kT1b1aWYr2NE8ni
	 ydzFRPrMuzAjcRXUB+VlYVQ/GdhtzJFbGjzfddG8/MhSVKRZqS8HqG9jyGlzET/dAp
	 f1Aje+j8J1G6ergXMvAUUUEpoS01uV4idev1vKPQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH linux dev-6.6 0/2] ARM: prctl: Reject PR_SET_MDWE where not supported
Date: Tue, 26 Mar 2024 12:49:58 -0700
Message-ID: <20240326194959.10777-4-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

[Re-sending as I forgot to CC the list the first time, apologies for
the duplication.]

OpenBMC on AST2400 has been badly broken for some time now due to
systemd services segfaulting on execve() after calls to
prctl(PR_SET_MDWE) spuriously succeeded.  The MMU of the ARMv5 CPU in
the AST2400 cannot meaningfully support MDWE because it lacks distinct
read & execute page permissions (read implies execute), so these
patches ensure that the prctl to enable MDWE properly fails on
hardware where it isn't supported.

These patches have been posted and approved upstream [0], and while at
time of writing they haven't yet reached mainline or stable upstream,
they're on their way and should hopefully get merged soon [1, 2].

Thanks,
Zev

[0] https://lore.kernel.org/linux-arm-kernel/20240227013546.15769-4-zev@bewilderbeest.net/
[1] https://lore.kernel.org/mm-commits/20240326180820.88CF4C43390@smtp.kernel.org/
[2] https://lore.kernel.org/mm-commits/20240326180821.BF06BC433C7@smtp.kernel.org/

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
2.44.0

