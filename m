Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AA9EBDAA
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 07:10:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Bcm50ZqzF6Wc
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 17:10:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="dcvyIVV3"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="JYWOqobI"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BVt4HfPzF6W4
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 17:05:10 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2B54C42D;
 Fri,  1 Nov 2019 02:05:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 01 Nov 2019 02:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LdR6yV3wu1zoi
 2TK56nKINYOTd9bMOuHdUvawxGQ3YY=; b=dcvyIVV3W1CR54aPsFp6H30Hi4bNn
 n3sawVSbKtdHAwZwwVRzq/cecXZgbnQbj+XTzUYHcSjDP5/Hch5bmjsIumhZw9xP
 7wuqbDXeVssxtHx1+JAPusSW9E8slh7j4GIIVnT3bVdUXH7IFGevH/DZ9Wb0TXAv
 UvRVRWTahH+QUDnpNcCK718idYiM7N0r+0MRpB0KWEjO6LBYcVWLxloQZJC/5ZeA
 1ocSj6S6hDW62MiAZI78bW9rY/Q5DKFEX0e/x8lCorhCijfJ7oaP5nbFcQhNWcdr
 aYIqHvSgUZue6OhZZd2qcJiQ20pIWpXI9StHT6hZQbYimbkD7nZW7dIDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LdR6yV3wu1zoi2TK56nKINYOTd9bMOuHdUvawxGQ3YY=; b=JYWOqobI
 cpFqGUpWfMZJ0lssrI/dYfXF4GT5MKLK1sIktdkg1k4Zv7Xw79yuexdCa3hOAwbG
 eLAdBE835nY4JRlwZEzuZiSDAz3jV/13OCnIN1nCa3Ac/SAANhpS6ey41wgo5y/9
 N+xzG3lP4rQnuDCsrGxK7YFQpbx2NouNTZ7mYN33GyYRLatFKAd+iCBOXDiKb5xQ
 HtbxKxNbuwFDtm1juBBtcHWqAPAxrAWaG79L32Hsz6XRAtiQnlZ7dnIGYM3IBI4v
 dGbuvAoT/OQNeV8V3aBRdrHCW3dfv+pHBZvM5d/sniW/ogp4Fg66Zidcpijy8gBo
 rtF/Nz0mk17+fw==
X-ME-Sender: <xms:E8u7Xa0aO_wLRFhXnN6tCWY4tF9gDx0NMeHiA8fAY45K76udje-7tA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtiedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:E8u7Xdb3elelrN3r4UYeGllt3Lq5oqSPPgLenoNWT0WwIP3_bziBCQ>
 <xmx:E8u7Xait2MQOe9gld3aXI8ZNZNOMp24pUsrsEQKe-MG1R3CL5QO41Q>
 <xmx:E8u7XWeSWA2EITaY8jMLPN5gSzYwEiTMmiPf9Zhz3bFq0KtklpGk2g>
 <xmx:E8u7Xa9doRvAw3GKKx8x_Bu_aZb-1Js102EG_BEGI0sbQoxvHVPVpw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92C033060064;
 Fri,  1 Nov 2019 02:05:06 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 v2 2/3] trace: fsi: Print transfer size unsigned
Date: Fri,  1 Nov 2019 16:36:00 +1030
Message-Id: <20191101060601.24896-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101060601.24896-1-andrew@aj.id.au>
References: <20191101060601.24896-1-andrew@aj.id.au>
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

Due to other bugs I observed a spurious -1 transfer size.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/trace/events/fsi.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/trace/events/fsi.h b/include/trace/events/fsi.h
index 92e5e89e52ed..9832cb8e0eb0 100644
--- a/include/trace/events/fsi.h
+++ b/include/trace/events/fsi.h
@@ -26,7 +26,7 @@ TRACE_EVENT(fsi_master_read,
 		__entry->addr = addr;
 		__entry->size = size;
 	),
-	TP_printk("fsi%d:%02d:%02d %08x[%zd]",
+	TP_printk("fsi%d:%02d:%02d %08x[%zu]",
 		__entry->master_idx,
 		__entry->link,
 		__entry->id,
@@ -56,7 +56,7 @@ TRACE_EVENT(fsi_master_write,
 		__entry->data = 0;
 		memcpy(&__entry->data, data, size);
 	),
-	TP_printk("fsi%d:%02d:%02d %08x[%zd] <= {%*ph}",
+	TP_printk("fsi%d:%02d:%02d %08x[%zu] <= {%*ph}",
 		__entry->master_idx,
 		__entry->link,
 		__entry->id,
@@ -93,7 +93,7 @@ TRACE_EVENT(fsi_master_rw_result,
 		if (__entry->write || !__entry->ret)
 			memcpy(&__entry->data, data, size);
 	),
-	TP_printk("fsi%d:%02d:%02d %08x[%zd] %s {%*ph} ret %d",
+	TP_printk("fsi%d:%02d:%02d %08x[%zu] %s {%*ph} ret %d",
 		__entry->master_idx,
 		__entry->link,
 		__entry->id,
-- 
2.20.1

