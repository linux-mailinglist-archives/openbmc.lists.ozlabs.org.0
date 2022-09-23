Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA815E7094
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 02:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYXkP4P3fz3c4f
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:16:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=PdORfa5I;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JDGiTChV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=PdORfa5I;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JDGiTChV;
	dkim-atps=neutral
X-Greylist: delayed 538 seconds by postgrey-1.36 at boromir; Fri, 23 Sep 2022 10:15:51 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYXjz5qPSz30Lb
	for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2022 10:15:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 30C693200931;
	Thu, 22 Sep 2022 20:06:51 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 22 Sep 2022 20:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663891610; x=1663978010; bh=no+rZfNo1t
	swuhmK8in0U1if8/WraSIDyduuxHc4AL4=; b=PdORfa5INtmWmq4DTXvDowgBof
	KCR2MH9nRBrPGv9Y7ZvDCzNwyBkRi/NWjz/5os8QROKI3mIRpvn6n/AV4UdapwsK
	0LFUzqXVUw5s2/9DhDPI9nR9S4aE+3vMg4Cx4Hoj8QJHOVf4CXjiCAblDgKX23FW
	CutlbdLWHC4nA+HuF2Zlj+UvR4VF/HHW2eHPZb31hJo394fVuoXjvR/fXXWtKd8J
	HJHyHlcBLAzs7VxTtmdUV+deA2Xigi0OCTKhKJzHKzseSwa3c29Fx24JKIsPck3F
	V7Muua0jL6ZFNO4tlf8RB6AkbaSq3d/vyJh0mw1FTsuNQNN4KaLhIDHZtj0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663891610; x=1663978010; bh=no+rZfNo1tswuhmK8in0U1if8/Wr
	aSIDyduuxHc4AL4=; b=JDGiTChV2+n1f2zXn+LnkzHo9nw4bbVes6MDnhrT6IJn
	dWJMs6mE0zTDJDS+z6FhDeWrthnP3iVArCT+MUN8sEyuoVTERgumRWIXepfdjNLq
	4sD3VNcvrAm25FUNJLkIVNUzm+NhRdaX0n9S2SG37ihGHQhMet7vwPJ7Q52DXbgk
	R1v+vgBPgoRrlxFQWzp7mZLG7YhRNOkZ66c97k+azQgxBlw/lRhW++5vx7Ms+YE1
	11+NHTjDh3VV+LCZrCDeeCj0n6jbt2tLPoKAoaNyAnnai8Co1flsEq/m+p+GnYS0
	yogM2qNdJTmcc23RdceOjwhAe7eJVRauBbrTctL1cw==
X-ME-Sender: <xms:mvgsY_nBJgZeoKJDFAhwD_Liq4_T9TjPMEp7qAHJ61aTCAKyoR9jOQ>
    <xme:mvgsYy1pSHiRBgOFiaVxeOdhCUssATkuH5K794VuXC6t0--z95ORGWwqmMurUDsLL
    sA9ThYIaTKoAaQzbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefhedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:mvgsY1qOLziXANhO0jw-eU2GzDgr6m0tFqkJfoVLsTwlxqVP3b3pJQ>
    <xmx:mvgsY3nk_zG5SnKA5z198nZzJMjMKVEgDUmh2ni_ddsY-daWAde66w>
    <xmx:mvgsY93BCPsHXWe1WlkAFkUEDSCB9l2fdgyj4kBGHQM1e4nUdaLbmg>
    <xmx:mvgsY6i07RC8zyvF6pxU1hy-RlAg6q4qpSxa9861WjbzHTkJ7CARBQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D8F71700083; Thu, 22 Sep 2022 20:06:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <675085d8-46d0-4eac-b6e5-40c9ad868dc4@app.fastmail.com>
In-Reply-To: <8ce9679e73c147f1a220083c6ac7c9cf@ti.com>
References: <66a2cce533124f56b60f68f9f0b807af@ti.com>
 <317d91c1-870a-4370-8ce4-12fc1a531486@www.fastmail.com>
 <8ce9679e73c147f1a220083c6ac7c9cf@ti.com>
Date: Fri, 23 Sep 2022 09:36:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patton, Schuyler" <spatton@ti.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [EXTERNAL] Re: new port seeing ipmid exiting with seg fault
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 22 Sep 2022, at 15:14, Patton, Schuyler wrote:
> Hi Andrew and all,
>
> I have used remote gdb to debug the cause of the seg faults for 
> phosphor-host-ipmid to this structure (MetaPassStruct in 
> user_channel/passwd_mgr.cpp). This structure appears to initialized 
> correctly, extremely large values. I notice that a commit (05703ad - 
> Anton Blanchard, I am using a 64 bit machine) was made to change 
> structure elements of the MetaPassStruct and the commit message 
> mentioned this would fix seg faults. I added a bbappends that pulls in 
> the ipmid current top of tree of a23af1 and this included 05703ad 
> commit but the ipmid now fails before getting to the passwdmgr that was 
> seg faulting earlier. 
>
> Apologies as I am new to OpenBMC but I was looking for guidance on 
> which ipmid commit I should use beyond the bfd3a17 commit that seg 
> faults.
>

You'll need to reproduce the issue against the upstream code before we 
can help much further here. It sounds like you're doing a fair bit of 
munging of the history and it's unclear what upstream base you're 
working from and what changes you've introduced. It's not really 
something we can help with as it is.

Andrew
