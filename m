Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 774895BF295
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 03:10:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXL1X3X5kz3blJ
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 11:10:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Fc4sHKeN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DLOZHzOk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Fc4sHKeN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DLOZHzOk;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXL150NWWz2ymS
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 11:09:44 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 25D805C01D5;
	Tue, 20 Sep 2022 21:09:39 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 20 Sep 2022 21:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663722579; x=1663808979; bh=UWO+yzXtMk
	sgG7pvBV/mscwn5HJF0IQjphfxqgOCIhM=; b=Fc4sHKeNTg40RVTKvu5ABtzxy8
	A2b5KRjeCnnDQW0ivwNnvyFHCYbA7a9B4NUreYxTp/l9X5vSFG5Wg0zCMqociJKD
	N5iNYaLSzr+GvpDWrq2ghy4iw+eBe1+Ib3WzNCg1CCASTtGrHLB/rJKzKiUw2slq
	glgegsHnlIX9mwy4MxloSQGlTXZENLoGyTVkaVjqKgqmsu3MQB/s9AfvvsdzFdne
	WlXdkJ6vRw/Ey9BiKwAgzppnfiHjnE8cXblAWtA4H+zRGGv1d4fzGmqBQe94CLDi
	2w/osvcyJ2FRGsGRfK5rrn2qzOSOjQoJmUQzMpBoLWhs+0xWAgRBl+BRopLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663722579; x=1663808979; bh=UWO+yzXtMksgG7pvBV/mscwn5HJF
	0IQjphfxqgOCIhM=; b=DLOZHzOkrdRC37qj3dzFt5kzV2zAUzSioQxfnEc+gAkR
	sN9t213krdF0XmFnzKTeobrK5JfjqguU7rgojG8pRG3XmWq7zrX9Nfy5NdHOsOCn
	RGLs3pPd0XfUYCj63GY1FYBWo41eJO+kgK0Qb7TyS2R/8N88TRnpVs9+MzXyieSe
	lJWc5sWHidD2X14NBIsYOuK4310xAC9n4wApKbaCAKgHEl4Le3O3aogjDpFWe6Sd
	/U6xjufAtdektC6SnBFCnXT1f/oyNz3mcpSJvyv1UIdxspnfXWOrKCcqcSr67cg9
	Y1Ci6a93J59BKaxLu09uNi8tDwozOstEBilCoS+uBw==
X-ME-Sender: <xms:UmQqY-hgRUhehKDxtZ8KCCoH_ZLxrrSNgF2GjGYug7riR2-sMRpHbQ>
    <xme:UmQqY_DOcOjqgrGVUDJB4ty5I69l3uHEdr7W7pm53WgvH4c994_LkZcqxkTh7vzyI
    nTBip6cj3W41tlNqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:UmQqY2EUlC59vbCUxZtoVf8t6thEHytXbcEJ2gXajGhb-N1CrGOcYw>
    <xmx:UmQqY3Q_qwtPZ4Xj2B-5oRHEYB0mkxtNYGYv1VpLrOvWwgvgPs4M4A>
    <xmx:UmQqY7wAICYvEarB7bvkp4H6PoOaJFzvw6TbBPPKhaukY3PrF0CXiw>
    <xmx:U2QqY0pFlzBbQQSg1KcW6TKcWQx3FawsC_tW1ZtJ3fHwbzNHXwWGnA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 649D31700083; Tue, 20 Sep 2022 21:09:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <60dfd5b4-bdd6-4e3c-93ed-727f0b91e3cd@app.fastmail.com>
In-Reply-To: <20220916195535.1020185-1-anoo@linux.ibm.com>
References: <4a2f1f13-cd98-4a0f-8e4a-b297cb81a382@www.fastmail.com>
 <20220916195535.1020185-1-anoo@linux.ibm.com>
Date: Wed, 21 Sep 2022 10:39:15 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Adriana Kobylak" <anoo@linux.ibm.com>, "Joel Stanley" <joel@jms.id.au>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] ARM: dts: rainier,everest: Move reserved memory regions
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



On Sat, 17 Sep 2022, at 05:25, Adriana Kobylak wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Move the reserved regions to account for a decrease in DRAM when ECC is
> enabled. ECC takes 1/9th of memory.
>
> Running on HW with ECC off, u-boot prints:
> DRAM:  already initialized, 1008 MiB (capacity:1024 MiB, VGA:16 MiB, ECC:off)
>
> And with ECC on, u-boot prints:
> DRAM:  already initialized, 896 MiB (capacity:1024 MiB, VGA:16 MiB, 
> ECC:on, ECC size:896 MiB)
>
> This implies that MCR54 is configured for ECC to be bounded at the
> bottom of a 16MiB VGA memory region:
>
> 1024MiB - 16MiB (VGA) = 1008MiB
> 1008MiB / 9 (for ECC) = 112MiB
> 1008MiB - 112MiB = 896MiB (available DRAM)
>
> The flash_memory region currently starts at offset 896MiB:
> 0xb8000000 (flash_memory offset) - 0x80000000 (base memory address) = 
> 0x38000000 = 896MiB
>
> This is the end of the available DRAM with ECC enabled and therefore it
> needs to be moved.
>
> Since the flash_memory is 64MiB in size and needs to be 64MiB aligned,
> it can just be moved up by 64MiB and would sit right at the end of the
> available DRAM buffer.
>
> The ramoops region currently follows the flash_memory, but it can be
> moved to sit above flash_memory which would minimize the address-space
> fragmentation.
>
> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
