Return-Path: <openbmc+bounces-435-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF2CB257C9
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:51:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBD3l4yz30Vs;
	Thu, 14 Aug 2025 09:51:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.23.235
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755123489;
	cv=none; b=g6kTjychkw2OXOQ9yIIvOdqAB2WVYAS7SvMYn3nQ/R8Zt0zJr+UlEDXodYEwNpeYXund+Q2ptQq6dh+MWfGkER4lxgQ1FVJiSAhfnNEQXTkWW8ayuJXh9fuA7gvkuyXsZAOC6m5GZEkur0nwa56I6aDrxCu1spXTfjlJwlL+tUh7BFeEKEvxK5ZBdCV3PTly6PsYKqnlp42s3rNpQs+/vqIrB3ZzZNr2DyKLqxQqLa0aVo25MnC0tSIJ2TIZqCUkATyQoNWVM9/PcR6SdNGWZa84k6U2K8Jk3fdIzKMH6ZucfMxjPoejLbeLC1bCKHDsXDmBC+qd60ME4DjtasKB/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755123489; c=relaxed/relaxed;
	bh=QCw9ZRUBeub09uFvPQECFJsWt5dS1/m+zZsohfeUKA8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AcR1HBqsf9KDn8vQ58efA4ffTP1xY6+qngD51DqcfQIhsUKaiDQIgNr9FhDr0JzG1G6qmNEeijsfVLihiWdqo86t8/anP5h4DZ4kfn52joie+bRes1kzGIxBcPfc7XDqgxktwyFmoQx1Wrl2Y2nj9pW0jFTQiEPQFkcqwjxk81Flnq5MWA8RyeNWi/M2GmXkm4aF9IS/Gc7WWmgK3QnTjbhXYlMiUGkxiMeTc0JtEZay4EMDGbhwz1i/BP69lw4oFmBUHNvLj/7e2Peh5yVNKqQBFQ9B/BJ/sB1ws0j2I6VTmgXdd+HloFp7CF7lgkEE+U54TpFbtZL5hy2MHSbC/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=N3/8Ha0y; dkim-atps=neutral; spf=pass (client-ip=198.47.23.235; helo=lelvem-ot02.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=N3/8Ha0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.235; helo=lelvem-ot02.ext.ti.com; envelope-from=afd@ti.com; receiver=lists.ozlabs.org)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2N6m2hRXz2xHp
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 08:18:06 +1000 (AEST)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DLfec32238051;
	Wed, 13 Aug 2025 16:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755121300;
	bh=QCw9ZRUBeub09uFvPQECFJsWt5dS1/m+zZsohfeUKA8=;
	h=From:To:CC:Subject:Date;
	b=N3/8Ha0yi8GyRekTCrFV3yVdC13AEQGJfrlGGkSszmDEXeGSfWR0n3sObGPfi8ct5
	 1ML7k6o5iT3P7wp78uc0k2v0NOlqUPiAH3zapHt9OWD/Y0PPPTmj1k/t3zuaF0YZf7
	 sKz5bjmhoEOsAk+WoZTHIuK/+z/WJv1N6nRpkng0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DLferc1363621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 16:41:40 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 16:41:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 16:41:39 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DLfdNF2611079;
	Wed, 13 Aug 2025 16:41:39 -0500
From: Andrew Davis <afd@ti.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian <qinjian@cqplus1.com>
CC: <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 0/6] Remove register_restart_handler() from drivers/reset
Date: Wed, 13 Aug 2025 16:41:32 -0500
Message-ID: <20250813214138.477659-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello all,

Continuing to remove users of register_restart_handler(), this series
removes the remaining uses in the driver/reset subsystem.

Build tested, but I don't have any of these platforms, so some
sanity testing always welcome :)

Thanks,
Andrew

Andrew Davis (6):
  reset: ath79: Use devm_register_restart_handler()
  reset: intel: Use devm_register_restart_handler()
  reset: lpc18xx: Use devm_register_sys_off_handler()
  reset: ma35d1: Use devm_register_sys_off_handler()
  reset: npcm: Use devm_register_sys_off_handler()
  reset: sunplus: Use devm_register_sys_off_handler()

 drivers/reset/reset-ath79.c    | 12 +++---------
 drivers/reset/reset-intel-gw.c | 11 +++--------
 drivers/reset/reset-lpc18xx.c  | 12 ++++--------
 drivers/reset/reset-ma35d1.c   | 11 ++++-------
 drivers/reset/reset-npcm.c     | 12 ++++--------
 drivers/reset/reset-sunplus.c  | 12 ++++--------
 6 files changed, 22 insertions(+), 48 deletions(-)

-- 
2.39.2


