Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525B308486
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 05:32:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRkvV1KZQzDsNZ
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 15:32:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mendozajonas.com (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=sam@mendozajonas.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.a=rsa-sha256 header.s=fm2 header.b=MRXKa/hH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=FgRY9kul; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRktT5s33zDrj2
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 15:31:05 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EBB45C01A7;
 Thu, 28 Jan 2021 23:31:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 28 Jan 2021 23:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:date:in-reply-to
 :references:content-type:mime-version:content-transfer-encoding;
 s=fm2; bh=TR7tT4jLRaHFNaDFSXBanLiWakToVZvxVg6+x7Py0+U=; b=MRXKa
 /hHA/SwyHziTYTjsM3imER3OFX58LKFT5UmUXFrdu3uXY5rBAy39Vg8WtEYE/61y
 4rbYNfJg/mEr7iGQVaBUKsI5YkheJlTVw7tNZBqXC5QWiIqkgvpkgUapRWRivuBM
 c2nzMxEyLZUTtOVl1v0uwOVOPcrLuol7t9jY8wY7KgWzUQMogknKDoZE8dzs9Y4x
 CFjvlfVCwv+7Ol4Hkt7ZNWB4CtVtmmEAzWlNapkZCWt6deO62l6cSAZAbXSP/ILQ
 dqhad+FGbkm++rdRPV6zNtQ1uBRDdi8nvItxnuoxrbP59s1RDiOI6mMzs100Sf/3
 Fd/6bGepr3qmS9c1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=TR7tT4jLRaHFNaDFSXBanLiWakToVZvxVg6+x7Py0
 +U=; b=FgRY9kulTBTKMqM3TSN/f24pykjg55sE1CEJQlwbDSfCRWSmDrkOqd7zd
 jkM+vNofx3TXI4zF6w7185+4gIggW6tSb+EN9aM/YoqjfieKdMBbrU3hRV3GW753
 pFyu1VSfdI6zCKOW/34G23/vQKNd0/12vGo2GWZlpQaXXnX7/00R8hdzYMugXVeW
 1ysqyEEaY9WBkngatuOdVT1YmLUIljowR/oOC5ytfBpcPBjDGfPF33m8U+d6m9JQ
 g0JF0EFI6+ergfWji7DPYMpjX5cGpL1uImf8JZFGuhOyueXGPn/wGMFCcdglhIJq
 uYN8hxF7lpl2nYOE/5DQwu3g1/rRg==
X-ME-Sender: <xms:hI8TYKEK4srwAwoee3_I63SFaRrebtoaOjLs2Ki6ZWxjNh1M7C8tXA>
 <xme:hI8TYLVILSq3PO7LxE6r-TGLXzDIiu_TvxPgsk7j2wpk9UNW7mEUGtnOaMDUyMR51
 w2I78Z6dIJdCfJyjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedugdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfggggfesthekre
 dttderjeenucfhrhhomhepufgrmhhuvghlucfovghnughoiigrqdflohhnrghsuceoshgr
 mhesmhgvnhguohiirghjohhnrghsrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvge
 ffgedtkeefveeuvdeuheegieeigeekudeggeegueetffefffejgedtveenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepjeehrddujedvrd
 dujeehrddvudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepshgrmhesmhgvnhguohiirghjohhnrghsrdgtohhm
X-ME-Proxy: <xmx:hI8TYELr1pgAmNBqB1_tKgIS4mxy_46R7Yb3pik8M_SJv3F6ClzXkw>
 <xmx:hI8TYEHjmozROmnvGGqNONBoKDZpQYtxkShrojfiB9M2P97yByuVPw>
 <xmx:hI8TYAXtTiAZAlnMWppdLZRIS69idnjGSpcGPKZgKJCyFuAjF53ozQ>
 <xmx:hY8TYDD96-zv6AQgAq-b5iRSJXpWnJxzgdQ595hhw5utuVgBLWaSPQ>
Received: from [192.168.0.8] (unknown [75.172.175.213])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9448B24005C;
 Thu, 28 Jan 2021 23:31:00 -0500 (EST)
Message-ID: <433e0bc52d04c6bcc2a201d80f4faf831461c79f.camel@mendozajonas.com>
Subject: Re: NC-SI driver: update multi_package, multi_channel base on
 package_num and channel_num.
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Thu Nguyen OS <thu@os.amperecomputing.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 28 Jan 2021 20:30:59 -0800
In-Reply-To: <A713E48F-9CEB-421B-A774-34F770BCC2C1@amperemail.onmicrosoft.com>
References: <A713E48F-9CEB-421B-A774-34F770BCC2C1@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2021-01-27 at 23:00 +0000, Thu Nguyen OS wrote:
> Dear,
>  
> I checked the NC-SI driver source, the driver will work difference
> when the interface have multiple package or multiple channel.
> Such as:
> If multi_channel is enabled configure all valid
>                          * channels whether or not they currently
> have link
>                          * so they will have AENs enabled.
>  
> By default the search is done once an inactive channel with up
>          * link is found, unless a preferred channel is set.
>          * If multi_package or multi_channel are configured all
> channels in the
>          * whitelist are added to the channel queue.
>  
> Look that the code:
> multi_channel is set in ncsi_set_channel_mask_nl base on the
> configuration of NCSI_ATTR_MULTI_FLAG.
> multi_package is set in ncsi_set_package_mask_nl  base on the
> configuration of NCSI_ATTR_MULTI_FLAG.
> Do we have any special reason to add this option?
> What should I do to enable this option?
>  
> As my understanding, multi_channel  and multi_package  will be mapped
> with the number of  the physical package/channel on OCP card.
> In the driver, we have section to add/remove the package or channel
> in functions ncsi_add/remove_package,  ncsi_add/remove_channel.
> Why don’t we update multi_channel  and multi_package  in these
> function as below?

Hi Thu,

The multi_channel and multi_package variables represent whether
multiple channels and packages should be used simultaneously, not
whether they exist. The commit introducing support for this has a good
description:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/net/ncsi?id=8d951a75d022d94a05f5fa74217670a981e8302d

Behaviour like this can be configured via the NCSI Netlink interface,
e.g. via this tool: https://github.com/sammj/ncsi-netlink

Cheers,
Sam


