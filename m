Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F81389B13
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 03:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FltD43Xmpz305q
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 11:57:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=DdUZOQwh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=mAb3vvv7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=DdUZOQwh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mAb3vvv7; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FltCk6z3hz2xxg
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 11:57:22 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D6E825C0100;
 Wed, 19 May 2021 21:57:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 19 May 2021 21:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=4vXhzPog5Hq6J2WjXtfPxmrVmg
 cr+QWujQxLvvNjAkI=; b=DdUZOQwhbNWXyG8+9enS3VN5uJabtxxlR5Ow4cqmh3
 nGABF0S0dTRbmafFRKwi05XGpDBe+LlVNJeGPKORnA/bo8MjQHwprehGyEq9r8vy
 dzDUMCupoGSkNjf6xha5ENNw4SgU9nkuX/3ejKU6FjYaTyI7D9fCAVmjKvF8KF8P
 UcIpszabiJwbEuWi0PMqIBY84y7W4XD+gBl/MRj19CjooNKvmZtNeAlcl2JmzU5D
 D623endwKDSoe2vxm9jULF+iN9W83N7CIkkxXexeYT4uWvMwuipItW5GJNXl2hnH
 zpNioZc6NgPYApSuMvSgFoMr8UXqhmyHUHF1tFIhT5Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4vXhzPog5Hq6J2WjX
 tfPxmrVmgcr+QWujQxLvvNjAkI=; b=mAb3vvv7RK8zpepBxqyeYwXusc1YU5PcX
 DbcnT1fULGJX8oykZu1mj0wa4twQrokHV7XppyW0IN6rWtcqWUKmZHpqUmD0zm7F
 SoBPFmtYGFwR12p87/vagaAZ3mL5B5T32rhMC9SZrGNy8p07SX//3e3Abn/DunOK
 YwrIljYOdljwTdBOxhSB6sCRRsFcTIqXeT2ZPOYYV3E4rzkWRZM44mfRxF0TCzO9
 5DkQBXL6wy/mhKSye5MawbsEc93hQ5sVVHK0yy27cAN4EIHc0BaMFC9IM8tZrqZf
 4v3AiqiSohxUAAsa9bvalQUVuL/6WAGMFHrp0hXxNYjn+/047kCkA==
X-ME-Sender: <xms:_cGlYMvNl6KRyP76dIWZL8w8w1LKuFAGfLmsHVc5wxV1yVPDuZkeZQ>
 <xme:_cGlYJcdoaZ_99PFAJoYnTxEn08Fs2frPzH4clQXBcE8MglhosDUo_thUE1sGZ7yN
 NZneNodln1tAoB5LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvficu
 lfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrh
 hnpeekhfeiffejveefveehtdeiiefhfedvjeelvddvtdehffetudejtefhueeuleeftden
 ucfkphepvddtfedrheejrddvudehrdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:_cGlYHybw-PO72-DkqA_K55jZBW4oa8VS3Sg6cAzZ86TvmhQyw621A>
 <xmx:_cGlYPMHLtuBnWNUviYHMTrS-lnuKLQikuyT2gVul0OpXcVxU_-hJw>
 <xmx:_cGlYM94BfhUZ5aKskDV-HIcN7q76xbjAITQllmfAdE36GU3zux5zA>
 <xmx:_sGlYLlmBDnYI5MRF0Y6ADIZK-m_21I7KXTMUZViswwhtHVkh-uMWA>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 19 May 2021 21:57:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: checkpatch: Tweak BIT() macro include
Date: Thu, 20 May 2021 11:27:04 +0930
Message-Id: <20210520015704.489737-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: corbet@lwn.net, dwaipayanray1@gmail.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, joe@perches.com, lukas.bulwahn@gmail.com,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

While include/linux/bitops.h brings in the BIT() macro, it was moved to
include/linux/bits.h in [1]. Since [1] BIT() has moved again into
include/vdso/bits.h via [2].

I think the move to the vDSO header can be considered a implementation
detail, so for now update the checkpatch documentation to recommend use
of include/linux/bits.h.

[1] commit 8bd9cb51daac ("locking/atomics, asm-generic: Move some macros from <linux/bitops.h> to a new <linux/bits.h> file")
[2] commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO")

Cc: Jiri Slaby <jirislaby@kernel.org>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/dev-tools/checkpatch.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index 51fed1bd72ec..59fcc9f627ea 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -472,7 +472,7 @@ Macros, Attributes and Symbols
 
   **BIT_MACRO**
     Defines like: 1 << <digit> could be BIT(digit).
-    The BIT() macro is defined in include/linux/bitops.h::
+    The BIT() macro is defined via include/linux/bits.h::
 
       #define BIT(nr)         (1UL << (nr))
 
-- 
2.30.2

