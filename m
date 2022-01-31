Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2C4A3C76
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 02:30:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn9Vv0ZmQz3bN6
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 12:30:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=iVVN8THz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=WmwOhbjJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=iVVN8THz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WmwOhbjJ; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn9Pv0Lgvz3bV8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 12:26:27 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 359CB5C00AD;
 Sun, 30 Jan 2022 20:26:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 30 Jan 2022 20:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=K9Sp3mZLyi9KUrdFdPmMd9sFXOz5/h
 QGJhrU04PAUL0=; b=iVVN8THztUhlNbpsR6Viqp5SrKxXFEz4d9Bjg7geBgqvem
 yDVdV1e9Z0HRnzDFaqAmyklVvUee/IPB43ZwKXJEtRGBLgWyVws20C6er52amvSE
 NdJ4guoMsJsiFK8fyz9ScKpdJbZE6uOQaVZViujY/usmLZGWBd+mhPtMwl7kYDzE
 y8IQaP2YR0Bqw3J1Z5TBtvK0O67phFhGLoj0vl9ZwK4OEvvIoAeaptQIWuyEO2y8
 re8NhcLXU5DOdvSIcnVEw5OdHQLiWdMZnnEo2SwV2du7O16S+ibVj5Rae2XlPjSL
 g0JZTvOa/yGI5jpqhn6gVfHdNLgQWSYkNw3qFTLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=K9Sp3m
 ZLyi9KUrdFdPmMd9sFXOz5/hQGJhrU04PAUL0=; b=WmwOhbjJfm0VBWiRnKInzs
 /fwrotgquLeTfGr+Gl+gxpe2M/iPhCtSCNVquC3Mwla03yTB7g3+mUgMdb0T/dAX
 8XWNUryAmG5NUY9qF5JGqlilmnapha/joO3rSMQESknLqoGFUllNOgtkcYixL/N0
 v/sQ+2tZIG9Jk6IBWVG6YhGE+fFAooB4ff81qpfx8nXtTZKwt0WBU595qsBEvDkI
 5Z/4KlATUQB3GGt+lB6pxz94ds207MqQ2V5gNq1R3RATDKFJap/bRd3gRH3dFkEv
 zIG7eDGLo2y7K2sdn5h02NCER0CwFw6RW/Wwg1LtUFcbH0VJbuCntsCJJpJ/w9sA
 ==
X-ME-Sender: <xms:wTr3YXRYmwI1dFjAwD73KZV2CJFAA6An2c-ArOiemHxkFMSRosl6ZQ>
 <xme:wTr3YYz9ghhN_kxaKK9Y8WK-bB0-ur-ac59gAzd766tMrzC-wMHmVnHJIQPB3lBwK
 jEzElIl6mGqKRfsUw>
X-ME-Received: <xmr:wTr3Yc0UAjwi0RXJbs3wkPV2O5muMLGF_ueSSuzSp_x30SXHogBmdEr2-D-S0mO2f2MwcIz1u_PdwXhk9MBi-PZm-4H6YalNYcXjBUAAtCWIBCGqmmfI8d3ckl8HvmKh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdeffecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedunecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:wTr3YXB1cqOYz26zO9YgGzQXWwYaifpYFxyHSIGiEnD3t8YIukfBsg>
 <xmx:wTr3YQhlwgyQ0RS1ISa6mggzrCeVKEbEfUXYIjvaXUffPZ4bciWDQw>
 <xmx:wTr3YbrQ0Knm-zuB1726bkcFvFu-XvdwdvDy6Csm539xSYNF6S5xlA>
 <xmx:wTr3Yca-OM237xf3g5-9xqZ50usLoQejqsCAG0ucUnjaLy3PXvz5FA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Jan 2022 20:26:23 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 6/6] image: Fix indentation of
 macros
Date: Mon, 31 Jan 2022 11:55:38 +1030
Message-Id: <20220131012538.73021-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220131012538.73021-1-andrew@aj.id.au>
References: <20220131012538.73021-1-andrew@aj.id.au>
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
Cc: eajames@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make it clear which level of nesting they belong to.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/image.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/image.h b/include/image.h
index 19ea743af08f..9bccf00bb5cb 100644
--- a/include/image.h
+++ b/include/image.h
@@ -1093,8 +1093,8 @@ int calculate_hash(const void *data, int data_len, const char *algo,
 # ifdef USE_HOSTCC
 #  define IMAGE_ENABLE_SIGN	1
 #  define IMAGE_ENABLE_VERIFY	1
-# include  <openssl/evp.h>
-#else
+#  include  <openssl/evp.h>
+# else
 #  define IMAGE_ENABLE_SIGN	0
 #  define IMAGE_ENABLE_VERIFY	1
 # endif
-- 
2.32.0

