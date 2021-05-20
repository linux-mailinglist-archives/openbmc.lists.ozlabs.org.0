Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277038A26E
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 11:40:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm4V12WK9z307T
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 19:40:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=slOL6qNS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IyGn/yUX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=slOL6qNS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=IyGn/yUX; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm4Tg4F3mz2yXK
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 19:40:06 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 62A861AA7;
 Thu, 20 May 2021 05:40:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 20 May 2021 05:40:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=x2k0UiONZCObGpvODgZnHAg9eN
 EhLhqxabKrZsSDvjI=; b=slOL6qNSXs7we0zun5eCgQqDc4sDuaCxRsZDYeo4zh
 nvEfSxtYRo8mE/7Mgvb3uO4GLFSNk7rvmUuqsKj5XHpUg5LQ9B3Zy/Q1ZwVh5NZX
 NYNagULLZMVlQALqNZlxfHXcJex7KnQpkf921f9SlfQdXsxp+UUKHflC34C2MUJy
 ytnwBjdOoMVlCMaSXkTCTfZ8S5WkG+ViuDVCa9rIwwq36TRcnkLZ7GylXmZVDiEh
 8Qw40I3vtyLd2usEU5n8Ctfw576Uc1SfaeylFrcsdJtC5ycPrmFghhS1ejPVLVSG
 0qa9aL5ZTxOJLzRGovh55IHZH4odDYrSBMxLfaEEk2GQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x2k0UiONZCObGpvOD
 gZnHAg9eNEhLhqxabKrZsSDvjI=; b=IyGn/yUXBB4Bpz5cZSmPcI0f41zN6l8Nv
 URV5aWiFPa62Qk+CbttH+aVLnE0BJAtPXcbSppwFOfoPQ9ancllnaQsj5GO5gow3
 gFo0wEjnAx4oYv4YxRILCteMksdHyFG2Irf+IGwhr0lMD3sMa0Evt1u2mJkrJCWT
 oiHTH1NTDgM6EIbPeejn9M0DfeEqbYhnVASN66cYcbfbd0cpwc1q7DHtLlziLhQ1
 5C3AoRHQ8RZ98sT3EP0essqX1/2uxlCa/1+4cWqvkS7YMt7nacFYS842vDpcAyKY
 nJDr2gjDnXU4WWQ/v4Bqg1+K7/0LCvCat5ldj1KNZdlyqoox+0CkQ==
X-ME-Sender: <xms:cS6mYJ-olAe6v6nJ4uwn54DypilDqwyK4EsBKn_N5QHCrnKiimlCDA>
 <xme:cS6mYNvBVGZSri_6I2cEsad90RWtLHP3OvFtFs2JKXsZ-EHwm1xJQcG4ACsBf9diW
 hY4MLLYFhR9TKb5kQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvficu
 lfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrh
 hnpeekhfeiffejveefveehtdeiiefhfedvjeelvddvtdehffetudejtefhueeuleeftden
 ucfkphepvddtfedrheejrddvudehrdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:cS6mYHCkhU8hukniFB3POLltZobtA5dPgKJ37BZiVWsyYViGcncrMQ>
 <xmx:cS6mYNcPx-nyCX9Fj2gdy4oFkhmCTAT_tD4zWZapYScaXhtvlkRbmw>
 <xmx:cS6mYOOsdKq-TgDmKbz9socMfMElcSZNPMt4oZyTm3Z8cCis6b26Iw>
 <xmx:ci6mYF0pmPR4exQRE7ng3ZtaMVj1MksP-UtC9jFYBYDouVFmli1krQ>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 05:39:58 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-doc@vger.kernel.org
Subject: [PATCH v2] Documentation: checkpatch: Tweak BIT() macro include
Date: Thu, 20 May 2021 19:09:49 +0930
Message-Id: <20210520093949.511471-1-andrew@aj.id.au>
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
include/linux/bits.h in commit 8bd9cb51daac ("locking/atomics, asm-generic:
Move some macros from <linux/bitops.h> to a new <linux/bits.h> file").

Since that commit BIT() has moved again into include/vdso/bits.h via
commit 3945ff37d2f4 ("linux/bits.h: Extract common header for vDSO").

I think the move to the vDSO header can be considered an implementation
detail, so for now update the checkpatch documentation to recommend use
of include/linux/bits.h.

Cc: Jiri Slaby <jirislaby@kernel.org>
Acked-by: Jiri Slaby <jirislaby@kernel.org>
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

