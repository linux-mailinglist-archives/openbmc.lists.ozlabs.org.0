Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBACB521E7E
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 17:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyMLL5SVVz3c7H
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 01:25:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=X/vr89t3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Ivz2lRtL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=X/vr89t3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Ivz2lRtL; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyMKs6PjZz2yY7
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 01:25:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D49BE32008FD;
 Tue, 10 May 2022 11:25:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 10 May 2022 11:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1652196300; x=1652282700; bh=5OGb2pwbTh
 +E/G+99M3Um8W4nGCCMkyCIkJaUXl+uMY=; b=X/vr89t3gkfOdAGYmYaNxLx2Py
 NHy1SjnWkC8RgZLMO63aKaG8OPoSdiBvNaaiWFhx+ztWqs5UXBn7MNEQLH+7zqKQ
 gcyEJbHyPOnSBgklyU6kx1GbF0Nz0JQC2pFTmGtS3609X6PfKOK9LqrJb17BH+/v
 SpTWv4OETcMxI/KUz+Np3wRmPqCIrq50lwfKWhz0JWdW9f/5ZdKWGInOvjgE0201
 3QnYUjS78pp0rzNTCn4nAIdfavsrjS8+c57GpipCVimaYPcG+xZoR3uebTVjSSSj
 uzyopRcsPS0RIY/vVzKLMmtPDNZx8hBecNsfVCzNELdX/m6RZTq3CiG5v7dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652196300; x=1652282700; bh=5OGb2pwbTh+E/
 G+99M3Um8W4nGCCMkyCIkJaUXl+uMY=; b=Ivz2lRtLOfMjCkdn8WzAtmHfYY8nH
 h8RLvLOjfO3YpD9u6CL5xN7M+sqGcg3EM4jlny7PzZwFteXZdskJ44JGhwIo5oHm
 1WGqBeq8PvQSLDcDwQgei+4ZdaFJKM1ZtLyFaF7S1x6/cOsXWzAO6WhhwVaCm/ju
 EcstlGdiO9I8boLrzt7+WslORFBYCgGzW1OKT/DUJELPPj1dykRoBM1eBxgJfKJk
 d5/P7GmqoQCWGdtAbaPnO5xBmbODy6RLFmvR9kOBw0U+fsBZByhqbmCl5TYHevwM
 3TWOg5xWBQ9AYudKwfqXXHQH7x5uhHMPDHFoqHBmxJ/Zdpp4zMYw1KiRQ==
X-ME-Sender: <xms:y4N6Yq4-Vy1QurjbR147UkSrvDUu7QrTrdWVdZYqWF2hXKk7ox27QQ>
 <xme:y4N6Yj4g1KSvopzrRcFGDuM4PygooJ99H17sYqeZLgkAklwLPzaPjNwu5UVyDqK4n
 LQHCE_qpqt_PKNHEsE>
X-ME-Received: <xmr:y4N6YpfG0TcTIDAGq1U8MP6Dg1gG_erystprmdxVTH_6jNHtRYiBjUJ5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedugdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeetveegfeduhedvveeileethfegieeigeehtedtjeej
 veejkefgjeeujedujeduudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:y4N6YnKk1IbypHz9GUt31OBdRkhMaWP2j_fyFeiOjjW3ltg3yBERIg>
 <xmx:y4N6YuI0pCXmn4qpgV2oi-0Y6StWYlQzaXqQhx2gF7rHGvaSKfxwkQ>
 <xmx:y4N6YowsrMsyiMvV16aIbnQMrUOCOydE9fXHrMF5-hrAxMOET-LKWg>
 <xmx:zIN6YggMXSE7xkGhG1bqX9AABMX22BzRBi-gdGqvLL_qksWMt6neRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 May 2022 11:24:59 -0400 (EDT)
Date: Tue, 10 May 2022 11:24:57 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: snow yang <snowyang@linux.alibaba.com>
Subject: Re: Alibaba's CCLA Schedule A update
Message-ID: <20220510152457.22ejuqepvgkknp2t@cheese>
References: <982767f8-9de3-62af-3dbc-2eeee55aefa3@linux.alibaba.com>
 <5f97bfe8-4c0f-0c71-6ebe-8682c3a4242e@linux.alibaba.com>
 <0de6ea3d927ce2dbbda431ccf798d9b4e8311a81.camel@fuzziesquirrel.com>
 <ddaf32d1-5b51-1599-c7a7-7826688d8346@linux.alibaba.com>
 <6afb6613-49d2-c987-1458-1162c1a18bf3@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6afb6613-49d2-c987-1458-1162c1a18bf3@linux.alibaba.com>
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
Cc: openbmc@lists.ozlabs.org, guoheyi@linux.alibaba.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2022-05-06 at 10:47 +0800, Snow Yang wrote:
>Hi Brad,
>
>      sorry. This is an update of Schedule A from Alibaba. And please
>help  to review and update it.

Schedule A updated.  Thank you for keeping it up to date.

-Brad
