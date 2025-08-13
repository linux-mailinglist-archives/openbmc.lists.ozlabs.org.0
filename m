Return-Path: <openbmc+bounces-441-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB92B257DA
	for <lists+openbmc@lfdr.de>; Thu, 14 Aug 2025 01:52:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2QBK0fXbz3cQq;
	Thu, 14 Aug 2025 09:51:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755102309;
	cv=none; b=BBWX+LKWiFrjNvVgNTZU0nBCmDxP6JsoHwpoSJc8rxinwQDuMSIJTbVWNskHFEmQPuUatd7ZSg6fvrkTKOObgR6cOo7p4VQN0nQ+SThUMKvSNozfGxhiS5ECWZ5MAsOxfNVIl5tf6z1wNMtgAxSQqe/uVeA3qtvD14rvDJJXFPpU/PpQbotxytc3g8gdVe6blIluTRzJ74W+20wWHnGvvmodnURiya+BZ3fnXTc1GdVf/H25orz/pyna9U74VgZXrElmZdNVBgUZyzBqXcG9KG+tLObxdNbCcO8Ct/a9RXN+ruL836WRm0sYCPEWyzTwa1TsKbAU/UFgWSKZCE3z2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755102309; c=relaxed/relaxed;
	bh=2Z8b0tA6giS8n4O6KDji8VyXizH69Pnanef04kHHLwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvuFTW482xQQ3Gop2mdfV0UntRPQ4AM3RFzyYpFfHxLZa3qPf2lrw3o5Qpe1Vm0/D1K1g+U4c/LGd1R7Luq8Lxjj/POic9tNDiisV1C1ySqpuygqWL9A3HvJV84PxnACb9vdMt72Y/f8Y3CiOFYTmFJ1teeq2IDyR1YFPKYEnPM3cCy3c0dILjyhsJuqvCEl90AqIZOMshi5vJLfibwm9XxAo9VYZzZFzVfL1gOVevXAZONsEP7L7hJqha5fSg6StpLa7ZfMBpP4rFWBQe9XaZS1aT9/LP0sJa+zoeOKwhp2Mks0i4Blov19KUmQg1Q5vLB4rY2N6l9jU2oPzPGhoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TpwPmPUA; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=TpwPmPUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2DHS6S73z30Tf
	for <openbmc@lists.ozlabs.org>; Thu, 14 Aug 2025 02:25:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=2Z8b0tA6giS8n4O6KDji8VyXizH69Pnanef04kHHLwQ=; b=TpwPmP
	UAkWsHGWTOJ96wf0Xm8ASUQbM8WFN3k0wv7z3bceGB2TBJc49lhn11GuDdp0Ec3s
	zyZ+0z0r7m+u00ZxkVz1P8GoTtQ9g0eiAofYmOGCKTsigex8taUB/9iYsQCpCdXy
	GebgMFq6w2V69FSMBqB3BhiebgXPLJJIOs8NRMf9k9SHb7QoyvDvI9dVLftQBj4v
	dMPZu79GLrHMWouEHF9gBIsbCu5gMjiZCbGcCdOMGP3eDZmUSR2YWJqfEhHNsHj+
	jSD44mdaiOo8Jf9Ah8GCFypKeKDp9jugJJ6jLd4NcFxHW9NKCoWenW/wBz3Pljih
	iHz6iAhPqmWZQ8ZQ==
Received: (qmail 695149 invoked from network); 13 Aug 2025 18:16:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:17 +0200
X-UD-Smtp-Session: l3s3148p1@vWXreUE8JtttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	openbmc@lists.ozlabs.org
Subject: [PATCH 11/21] peci: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:14:57 +0200
Message-ID: <20250813161517.4746-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/peci/controller/peci-npcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
index c77591ca583d..931868991241 100644
--- a/drivers/peci/controller/peci-npcm.c
+++ b/drivers/peci/controller/peci-npcm.c
@@ -221,7 +221,6 @@ static const struct regmap_config npcm_peci_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = NPCM_PECI_MAX_REG,
-	.fast_io = true,
 };
 
 static const struct peci_controller_ops npcm_ops = {
-- 
2.47.2


