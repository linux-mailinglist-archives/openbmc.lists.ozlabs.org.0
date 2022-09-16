Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6C5BA67A
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 07:47:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNPL1058z3dx3
	for <lists+openbmc@lfdr.de>; Fri, 16 Sep 2022 15:47:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Xs8UXx84;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IPZ82tlD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Xs8UXx84;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IPZ82tlD;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTN8w41wCz3f9f
	for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2022 15:36:16 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 70FEF5C0077;
	Fri, 16 Sep 2022 01:36:14 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 01:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663306574; x=1663392974; bh=83x2YbG67a
	SQkrZdgGwqnaamrj+2nv0cyyhi7uo1xWo=; b=Xs8UXx84Vp6hmzhQ40KUC3aDFZ
	llz55TIksbVz7maSPMEKNS9nEI/iR+rHQX74MLGt+w3u9AcgNxOo7PhppURXrIun
	aVW53gn8d04BLWFD1Es9o8jxhBN6RsaqIJDQ6R8XULW9jtnv9dzqbUwUGTwSmvtA
	9Dj0zDbtDULYbSEXiVGqFfYzTORagqZF86QjFQlwTYQ2GM14gwsGtWgAfVLxDyXR
	Xopz/wVkLInSMz/iCCS4nNqlBMSPdgXIYa+9FNasIyrhM+IVFnYBx+OKcArepUrZ
	ktLwvXKZf0m/Z3mTldcU+zusZ0rQ5l5OD80HBU4n2IirjQXv0Edmr2YcQOhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663306574; x=1663392974; bh=83x2YbG67aSQkrZdgGwqnaamrj+2
	nv0cyyhi7uo1xWo=; b=IPZ82tlDrrKkRAovXZ/iBZ70xyW33+9HbegTp27OIOIg
	gGj5TyxAvXgRWlk/wZul57P5QNAy4qhWxz4VdEnmk/WcYV+vhk9FO6mS3tVd1wGk
	C7yR19W9CKpkKQXjBN4S+lJjwS4Ifu3X7v/U6J/73nqaRsIID+R3t0YlGGiF3GDW
	7ujGVnChtNXjm4fk4O3+PMdGRbLJg13zIf9Q6qwhqVToV4hL76VD0Cw5DVhpkQJK
	tpFQ9h2Xl/8KHJHD13J8NRKsAae+aQq1B1RgjnwJjfS3OBuRVgSKKaUScyfecJuw
	WW9tBtoyIJ2OlpcVGltjd9t6iY9+9uUceAaSAruFXQ==
X-ME-Sender: <xms:TQskYxMKJXR5FEsnKkXj5pw7ukmfWnEKE03fQ4vqr4bInlFTuzMLjg>
    <xme:TQskYz94TMYbvT5kCTGkl_-85PnI-URXPw7jlveKUFsAk6h76CpAeiAeyXkyxh53c
    clQiVKcE8Wm3HhW1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduledgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:TQskYwQlDJZRxQKf1RpoP0gHMO3FlecGHkMJLIJp1-2wY5B_w5yawQ>
    <xmx:TQskY9vGAKlR_eDF_3UZZwI_3bCz6y0cZ2atwpAYVDRoGeBF7gHURQ>
    <xmx:TQskY5cxJSCpVyqedZbvNkOBYYOjJwM2xlxoBXwHdG5E2LPg-RV_Lw>
    <xmx:TgskY5GymSIMCaGhnZ33zoDa-WiIe2h0O2BOdmRsoJfkAg_iQbKmsg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D55451700086; Fri, 16 Sep 2022 01:36:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <4a2f1f13-cd98-4a0f-8e4a-b297cb81a382@www.fastmail.com>
In-Reply-To: <20220915210852.858170-1-anoo@linux.ibm.com>
References: <20220915210852.858170-1-anoo@linux.ibm.com>
Date: Fri, 16 Sep 2022 15:05:40 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Adriana Kobylak" <anoo@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH] ARM: dts: rainier,everest: Move reserved memory regions
Content-Type: text/plain
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adriana,

On Fri, 16 Sep 2022, at 06:38, Adriana Kobylak wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Move the reserved regions to account for a decrease in DRAM when ECC is
> enabled. ECC takes 1/9th of memory, bringing the size down from 1024MiB
> to 912MiB (minus 16MiB for VGA) for a total of 896MiB available DRAM.

The 912MiB mentioned here struck me, so I poked at the numbers:

ECC(1024MiB)
= ECC(1024 * 1024 * 1024)
= 1024 * 1024 * 1024 * 8 / 9
= 954437176.888888889
= 910.222222222MiB

From there subtracting 16MiB gets us 894.222222222MiB, which isn't a 
number we see in practice.

On the other hand:

ECC(1024 - 16)MiB)
= ECC((1024 - 16) * 1024 * 1024)
= (1024 - 16) * 1024 * 1024 * 8 / 9
= 939524096
= 896MiB

We do see 896MiB in practice which implies that MCR54 is configured for 
ECC to be bounded at the bottom of a 16MiB VGA memory region. 912MiB 
doesn't fall out of the numbers, so I think we need to rework the words 
to avoid confusion?

>
> Move the regions by 128MiB since the flash_memory region needs to be
> aligned to 64MiB. This change doesn't affect the host if ECC is not
> enabled.

So I was curious about the 128MiB relocation as well. More on this 
below:

>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 11 ++++++-----
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 12 ++++++++----
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts 
> b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 1bba5ad7378e..9a09301dd79e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -163,15 +163,16 @@ reserved-memory {
>  		ranges;
> 
>  		/* LPC FW cycle bridge region requires natural alignment */
> -		flash_memory: region@b8000000 {
> +		flash_memory: region@b0000000 {
>  			no-map;
> -			reg = <0xb8000000 0x04000000>; /* 64M */
> +			reg = <0xb0000000 0x04000000>; /* 64M */
>  		};

0xb8000000 is an offset 2944MiB into the address space. The RAM base 
address is in the middle of the address space, so 2944MiB - 2048MiB, 
which means the buffer is offset 896MiB into RAM. This drives the need 
for the patch with ECC, as our RAM address space is now only 896MiB in 
size and basing the buffer at that offset is obviously invalid. So 
change is necessary.

We know that the flash_memory buffer needs to be naturally aligned, so
the fact that it was where it is we know that 896MiB is valid alignment
(as it already works). We also have the ramoops buffer below, which I
initially put after the flash_memory buffer to reduce the "hole" in
between vga_memory and flash_memory. However there's no other reason to
order it this way, and we can shift it as we see fit. Specifically,
we're free to order it before the flash_memory buffer.

Focusing back on the flash_memory buffer, if 896MiB is 64MiB aligned, 
then (896-64)MiB is also aligned. This means we can butt the 
flash_memory buffer up against the "end" of RAM, and with the 
observation that we can put the ramoops buffer before it, we can butt 
the ramoops buffer up against the start of flash_memory. This minimises 
the address-space fragmentation.

So maybe we can go with this arrangement?

ramoops@b3e00000 {
    compatible = "ramoops";
    reg = <0xb3e00000 0x200000>;
    ...
}

flash_memory: region@b4000000 {
    no-map;
    reg = <0xb4000000 0x04000000>;
    ...
};

Thoughts?

Andrew
