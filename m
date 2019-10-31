Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949DEAA1C
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 06:14:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473YQz2Wg5zF5WR
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2019 16:14:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="i2mN4uo9"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="vTP4Z4Mo"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473YQ66rpRzF5W5
 for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2019 16:13:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 846BC223DE;
 Thu, 31 Oct 2019 01:13:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 31 Oct 2019 01:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=LdR6yV3wu1zoi
 2TK56nKINYOTd9bMOuHdUvawxGQ3YY=; b=i2mN4uo9Mr+bDxT12Lzs09QB/L+vr
 LeUIHbZJvw34LjJ/LWGVBWZP5BK3ch5IQDGmjkqnHMRbAQKIQ/CA5OlpiVMwU9P2
 xy2YfabiRJqlPkaPDHTWANYs4A5yPZ2m08yZvcpH3Ur1x2NYyQc8Hz6baBczeMNt
 yzv/dijbO63LEn++puO7UuQ05diAhXpLi9qIx+JdYkg+QV0RNtEtLuNUTOcSjOju
 h/+4l6Po2yl34Sh9WYwwKt8eom71PUnCKYBNLqQnQBfDKbyXvgi4qiJOKsLNMtfP
 NB9LfTgDn0nJeN+Up70KYPBFql67TRViJjfcINLbtgQGEYEGyHQE2V+NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=LdR6yV3wu1zoi2TK56nKINYOTd9bMOuHdUvawxGQ3YY=; b=vTP4Z4Mo
 8DVotFZ98M2Sa+xtEWtoLEtelC1zYKqm37sDK6MMxaXJJhliqAtHCA5OBpZgJT3C
 GUAcFIBKUlvhvxGOGhhzkSNoJ3ahg83iqwcEL2OCWCx+l+oWpom0a4fO7QA8sRy+
 5gfc3fAuEDYhEvrd3jg4xhZ914YH7ZELVtQRLFJKpMRDqS8iT0ZGtdG6u1BnvUjp
 ldeLuevHw2jkOMyZqZc3kEmzMmasShKebDvqTFj1wE1CiG9fZmg9nSp06/M0zczk
 qGCjIE2CpxmiGcV2IrUgKViHNOwbYJiqDfTuK6ofmHRCUgEDbHU2/MjToorkZh4c
 q8U1XAj9lSvrzQ==
X-ME-Sender: <xms:im26Xe7qPfo9SlE_-hDIwySJDVLFF-wrYEml0TF5WSAJM3e6C453Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtgedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppedvtddvrdekuddrudekrdeftdenucfrrghrrghmpehmrg
 hilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigv
 pedt
X-ME-Proxy: <xmx:im26XSOChLdpTbu4FxTpADCyqC1vQPW0iiF2Ho0GgcqOxOIqEA7Cfw>
 <xmx:im26XU_LLcWyJJzngP447wzErwBUNzlhe1Qf9MRQF70VF3lD094VjQ>
 <xmx:im26XZ6_rNtxJoRiI7ZxNWw9AH9OtFouyQfMqb2QJOz2cH75pEi4sQ>
 <xmx:im26XTyPbTzk2F1VDDYjo3mXoEuyGgdw23tqLv8UCdHDeO_t9pRpGQ>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 610543060066;
 Thu, 31 Oct 2019 01:13:45 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 1/2] trace: fsi: Print transfer size unsigned
Date: Thu, 31 Oct 2019 15:44:37 +1030
Message-Id: <20191031051438.28589-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031051438.28589-1-andrew@aj.id.au>
References: <20191031051438.28589-1-andrew@aj.id.au>
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

