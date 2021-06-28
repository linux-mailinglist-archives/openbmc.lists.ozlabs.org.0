Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F03B69EA
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 22:52:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDKY13Pmsz3bYw
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 06:52:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=K4MF+glu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j+jIj5DK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=K4MF+glu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=j+jIj5DK; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDKXg13FWz2yXX
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 06:51:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 21D013200900;
 Mon, 28 Jun 2021 16:51:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 28 Jun 2021 16:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=zCw
 DsPvkkIBUI8OMNfSNkMYLOFHRKbZQrZEq0VR2AAY=; b=K4MF+glulEkr3xYJ5GY
 cfkKa4WHiSXvd87WNG7jGRU/xGwIBvp7ds6FcQKLePcAdXpvscIl8Fp5w+Qx2NC0
 N4dEGO1gNhLbleIjhB3FJQqrZ6ZfvH9ynDok+CqCZLPN5k0QqFyH3jh3MC0d1sjQ
 nopM2+Ow2NaNvN6v6GsyZ3S8kFCs2kF2UybiexEA1k7SuwBzMAIjkjSF64mSwV4n
 XCV3xSMEl6Z+qnRTsIVtOMRYs9mlQxFcd+BIoZPLOU3yR2fGx1uymx8NMfeEAUIX
 97/ChxNHSWReD1VLRu1W3zkWxzS/DXmlPSveP9MjONdAwWaa31IXtHvkm2lLdNjS
 UIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zCwDsP
 vkkIBUI8OMNfSNkMYLOFHRKbZQrZEq0VR2AAY=; b=j+jIj5DKIBk69+RBy4pvm9
 q5V51B0a4jnrZMUPzL/1RxpXIjY7hejAe1YIWCkY/qcS3LQuEmHsT3ma+wRgJHSV
 ulnSaLN41oBk6o7JAPp1I9j6OEhhJGmv9C4Goz6sRWHXzHKXIKk8PsJHQO89v8Zw
 gDZo4uqr0Pid4yyWiTQwXVO9kwLwH0ht1MQXvjMn5cAATJoit0AcnjJzwGw34ynD
 ovvBTcDO6a5wCmrXmSwpREyelcGiNhbCZFptp+D9bUeNJWtilwC0XhZsBb64FuMl
 mgWC1BRRcDVp5B3218tKGR+5GC9Rk/51T4UEqy1pXVje5aueTfLNApizkK4QvflA
 ==
X-ME-Sender: <xms:WzbaYLBNcEwfEAOOmoZPC7mcGiS309HYzfpejo5GQ_KQU0ArbmI_fg>
 <xme:WzbaYBhQ0_dTDD0MBD_wjIEthSNCQFIcdMpCUMFMiTWtb21GB6peMEghA8wYNT6Nd
 rxD_ZH_1vvaC6c053M>
X-ME-Received: <xmr:WzbaYGkCb_y8z5AbARyA0hoIltrvL8yCYUVAEvc_Z30JCptGFZZCErBRxNN0aB8r9wcMyBiRycxvEBrXVf8i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehttdertddt
 tddvnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiii
 hivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepkeekleeitdfhvddt
 geeuhedvvdekiedvudejhffhvefhudejueegfeffledtjedtnecuffhomhgrihhnpehoph
 gvnhgsmhgtqdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrh
 gvlhdrtghomh
X-ME-Proxy: <xmx:WzbaYNzIHcNuevrLrzIPrU6IHq3GqcgZeEMQtA4qE3Hzhsf4-CzNNA>
 <xmx:WzbaYATyNwUwx54iK5wu4K_F02dNhrCVtdtdAs0dytbucRyWO8WNaQ>
 <xmx:WzbaYAZA2JDqukLalR2T_GVct9LBnuVlhGSf7a48tv2slCdH1TflRw>
 <xmx:WzbaYLKTum0nZZKwoxGkb3RIVTy6CIp-5sopUrcJMnNgbeAMzCSbsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 16:51:38 -0400 (EDT)
Date: Mon, 28 Jun 2021 16:51:37 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Subject: Re: Request for debug-trigger repository
Message-ID: <20210628205137.zrww6xxheukt3q2y@thinkpad.fuzziesquirrel.com>
References: <fb9071bf-f2ad-417b-b9a6-d0baeed67e06@www.fastmail.com>
 <20210601202613.7o3kplhw2z7mrdvw@thinkpad.fuzziesquirrel.com>
 <0f0408a1-45f4-9c10-59ad-ca9428260c79@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0f0408a1-45f4-9c10-59ad-ca9428260c79@linux.vnet.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 01, 2021 at 01:48:16PM -0700, Bruce Mitchell wrote:
>Hi Brad,
>
>I think Andrew has is default branch as main, and it looks like you 
>created a branch called master.  Do you want that changed to match 
>what Andrew has done prior to him making any commits on it?

Hi Bruce.  Andrew is certainly free to do that at any time.  I sort of 
want to encourage any repository maintainer to just go do this right now 
but I don't understand what the impacts might be, if any.  My thinking 
is that the next time I make a repository I'll just make 'main' the 
default branch and we'll discover and work through any issues that 
arise.

Should we add something about branch names in
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/44522 ?

thx - brad
