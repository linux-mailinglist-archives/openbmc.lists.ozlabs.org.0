Return-Path: <openbmc+bounces-1086-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F97BCF0776
	for <lists+openbmc@lfdr.de>; Sun, 04 Jan 2026 02:03:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkK1N0Bsjz2yFK;
	Sun, 04 Jan 2026 12:03:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767488599;
	cv=none; b=eJnpB9aCKiHfjjZXP/Ko4HVzZlQMpCp4VbVx2wJygRqVxc9KH2NlNlW7Ky+1BwOZNEEU1pt5pH9sIjkS2bxIYh2OkTx/6YElqFKL9GEtmKuBu7kQ5SKy9BAX4wXEfw+ZYPUi/4VpxAXn2cTD4I1cxKTqmmDkOKuEvm3ksZyZNsMahz3yQceEW0aQlVj6indyIiBBKSnBmcYKGuxQeINb4PIVSCElHpKH4/VfnFIV6AHTEHgNHKAsKkW5K7AX282EppPlGSaBMB1v9cTemip9uUSVqH4bJmnMDbN4p2Mq4TahPy+Z0CTSteqnshqdBWzJ/ost5nYD8bTsqT7OotfZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767488599; c=relaxed/relaxed;
	bh=N57mnL6wt0fuOfjKFskP9NcSwGO+rVN7oKZpLZ16Cc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jt090MiGU+0a1eda7KTq09I6vn4z+49chNbVzfVn7/v4/+9cWBa4yofF3Gze6zl7ABQfMVFfqiTqunJXV2xDnIKH5NO6Wioks1kv0/BqSYTrKOsN8yUVAZNTklUvT74SPPPRFnQyoqLH/b0zgUPZerCoeHgg/gQOJJCe+Q2jRey6ukaTd2/328qEyieFcS7eEy/IxxsdIdZ6Nh3PAopK43dsbZNhcwXI4V5l/RfdYC5pAmqZ8swBiet99VG+25l0xZqebkn+QSUgylVXd5yAjXdhCSh3Sbf3/lfZzxikKAvBeHhqpPCNXobdNXiytMALNBpIJT2G+qJs/eMCW/SxIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkK1D5gv8z2xc8
	for <openbmc@lists.ozlabs.org>; Sun, 04 Jan 2026 12:03:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=N57mnL6wt0fuOfjKFskP9NcSwGO+rVN7oKZpLZ16Cc8=; b=fubEpus6wvRJbgWfPmtXWYghCa
	W7958ghg9JyxbK4XptTHO6O14RIM9dxJ14lH2GIZv76t/yHuT3hgvgWnBd5aFBUHVviTRCoUdiJWv
	JTE/VhP8Nqs+r7e1c/s6CKnTmVk8M4RTHbRjP7bAwKtcYYq0YZlH2B3GyXdCJu6sIE7H6SORU5LPd
	fzZiE7locGK9jHkbRgxVgvkYc4nwYhoVDPivh6WbuWAri+ur73hB4EUhdjGj6lXmiKDL9+vq/mONY
	vG7zWVp7M/fYWVzY01QSleTmEmvpJ4FhpRGH59h0bImbU8zF1h2RIg1xa2wgt5MXbIt4hbgD8Ov7O
	GJVxc/kw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcCU8-00000009vTa-41CE;
	Sun, 04 Jan 2026 01:00:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	openbmc@lists.ozlabs.org,
	Russell King <linux@armlinux.org.uk>,
	patches@armlinux.org.uk
Subject: [PATCH v2] arm: npcm: drop unused Kconfig ERRATA symbol
Date: Sat,  3 Jan 2026 17:00:44 -0800
Message-ID: <20260104010044.2722221-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The code for this errata was not merged. See
https://lore.kernel.org/linux-arm-kernel/CAL_JsqK--G_7nO_UQ6jyomA1Sq6GUKtXVZpBF0dXjYA2iE047w@mail.gmail.com/

Fixes: 7bffa14c9aed ("arm: npcm: add basic support for Nuvoton BMCs")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
KernelVersion: 6.19-rc3

v2: correct Brendans' address; add Cc-patches@armlinux.org.uk

#Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: openbmc@lists.ozlabs.org
Cc: Russell King <linux@armlinux.org.uk>
Cc: patches@armlinux.org.uk

 arch/arm/mach-npcm/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/arch/arm/mach-npcm/Kconfig
+++ linux-next-20251219/arch/arm/mach-npcm/Kconfig
@@ -30,7 +30,6 @@ config ARCH_NPCM7XX
 	select ARM_ERRATA_764369 if SMP
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754322
-	select ARM_ERRATA_794072
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
 	select MFD_SYSCON

