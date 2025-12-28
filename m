Return-Path: <openbmc+bounces-1063-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDECCE58D6
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 00:30:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfbFS3YNNz2yD4;
	Mon, 29 Dec 2025 10:30:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766964652;
	cv=none; b=XBp2wLQ9Y5Lm6tCabjSnuqVxIFRQHKvsmqBnhtKssNndf8ssn0i5xOt/W9SQme34ZBDF+7drQr2DzqnA3hJr6Ua13QGRZI6n/iaZEOgpNufGYbqJLfz0+XrAgNeqsWcUqOYAtMvVWlLRePQIyqB1ebcYpD/1HE+RirtpdnHHUEGTSSIGA/YGQR8ukd9SCs3lk3r6IFkMaa5J8TmOrMyDTQpil3ZEFjAwlDy4Tg9mRqnY+UMHn652WsG7DcwsEnLsKc4PQ/X+UcEUtQhcfB5+Hl1uDGRLS3458QawVijP3EopuN0nsND2ylcfnbdkEY70afsSBvk/GitRpl8SDqS9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766964652; c=relaxed/relaxed;
	bh=30+U/96mvL8LCRxwo1qdrVfds9s4Wy5c8NIcySQynDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWtRt+AUUnF0WX0pWRnL5AWV2vEVOgJctpZQBh4ELY21xULbtaZMdkbSOGybQN7XHsjfqrmj8O4p+l3jvNK9WELdfTxQ513+NH5NKdqkOszvhnhxoqOVIBqNpEY5s60wxvYnFrisH9Py8ZbMBNHB7XZMDi8Ymb0lmdl+97H6jPj7ZvI0zmoSMiIsbFT5qnDEDGXhFjt3yqGa6o202JhBi4Fns6tHTg2C21LSOSKtny5ITZnbXD9WxTL0xvpnO2eqHMmqNxO2FB5pawmT5v8SgrguIlgkMeTshXHG7WmxtLuo2L8NN6cGtt9KMpUvHyEiKHSAuWJl19l1kORUZ6ZZug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DtiIOvS0; dkim-atps=neutral; spf=none (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DtiIOvS0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=198.137.202.133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfbFM085Pz2x9M
	for <openbmc@lists.ozlabs.org>; Mon, 29 Dec 2025 10:30:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=30+U/96mvL8LCRxwo1qdrVfds9s4Wy5c8NIcySQynDw=; b=DtiIOvS0lOuESZPKqkCN5PJ0e4
	A869d4vc9vI7uuNTcKlKMNO7haFfdhwX2YKMw8jZXCT/UBOAXpotbHchdEahkgXCdgdq7/03cIkUY
	SSjZd2ZQ6zBIFD32AcpJmnoKNjzQleWKziiVddpB/vJr05aNvzLTN/LcsV1RY+t+vVvppeXjUtyiR
	GNXnbTJ/rPvmyHWMSDga4LszNqBCpVS2JSXFkNTrhaFjY78kUyW1oVFfDo1oph515/q1gxGPWaTok
	amk3nmeS00NwzXYIGOyLLh0KWCmr3xRjnlg1qeaStgVqKOcaducIvuyGjIT1JKQLcINTlcuM6BpKT
	IyLF7GMA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0BX-000000036Nz-3vIW;
	Sun, 28 Dec 2025 23:28:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	openbmc@lists.ozlabs.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] arm: npcm: drop unused Kconfig ERRATA symbol
Date: Sun, 28 Dec 2025 15:28:27 -0800
Message-ID: <20251228232827.2638379-1-rdunlap@infradead.org>
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

Cc: Brendan Higgins <brendanhiggins@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Tali Perry <tali.perry1@gmail.com>
Cc: openbmc@lists.ozlabs.org
Cc: Russell King <linux@armlinux.org.uk>

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

