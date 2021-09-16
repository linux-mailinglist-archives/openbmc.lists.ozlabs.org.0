Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8E40EE41
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 01:56:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9YsB2YZQz2yPL
	for <lists+openbmc@lfdr.de>; Fri, 17 Sep 2021 09:56:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=OA5wRja4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=s1xQ8tEd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=OA5wRja4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=s1xQ8tEd; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9Yrh191mz2xvL
 for <openbmc@lists.ozlabs.org>; Fri, 17 Sep 2021 09:56:19 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 689593200903;
 Thu, 16 Sep 2021 19:56:14 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 19:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=r7r/1IGXrcfO6EbOA1Il0IAzetQ9yv8
 sgDQOefigS00=; b=OA5wRja4x/aN/87Y4CdYQuAXI6f7Zw/OeIr3Wbh3UT7ip3F
 N9VqHUCp6I6/Nupq36R/yggqqTLVbGN8N+b8KozAHqxqfjt0Q62O7ztr3xA8GrCt
 2AgF4wyFBpyrpuzDPSeh/c2G83X5mQtx79ehofannhpTmo3nW1lMZP52H8AXWTGK
 AXCJg360FGwLJb/0stnlCnoZkhhngJYbTny2a4JREc0G5oQ3JrS2huuaHLn7FmEg
 OUDhA03bXztTSyPQeYIYNqMKt3H0SAU9tjE0UuZQwlv/gse4flK0Atqz6pAFX69v
 XgVwtJgK4rBxPOwAGlN1AcQtW1CFQwT66jGyYBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=r7r/1I
 GXrcfO6EbOA1Il0IAzetQ9yv8sgDQOefigS00=; b=s1xQ8tEdyF+FzUIzJSla8b
 XezZyiy4ss6mgjxf51zTE0d0AhzpFwqRNCuLe3g8Eiq2F5sRIsz28pptxPzIFORd
 mKSlIgVofkLAKIItxtdvx8L95S1amR4VPBSj7m3f1TfE2/FSk0c7jkf9mMmfPsXg
 Gm/12K3MgSuoUYnO6q0Osybcigosv3DUTGL8VD1yP5imQ5sI9ohxODbwItsRhyYz
 w+ugYuU28mzw/BHzYaaetfocVgqEnXj4pyglBo89dWsxgQO/Ir+GaTTqPXbeL8hz
 LsBNfFOOgbimSN37/tEuuUYYIDg/RksHzX/gKIv8Fs+ElsOa3O+KF/sNWjKxiNSQ
 ==
X-ME-Sender: <xms:ndlDYZBJqPqYyYbDKZi1Pkye57ug-mdMLA9phDrKXUGAE38JTNfeEg>
 <xme:ndlDYXjOdOSjYHCPUmm3XyIQHtpSp2mVX-R3mxnVfbpfE5GbNLeARhjx_wq8k-A1q
 PoXEzIHcM30B0VXeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehhedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ndlDYUkRPJWsmyv2ZOSgr8s4IXLtbxCr1YxDpO7YPU1iOcNVwrKmUg>
 <xmx:ndlDYTxeSgQKZB5JanMOYfYSn2QSa6LwEIvSdjuOr-gtA5vIH7p9MA>
 <xmx:ndlDYeTL58cj3cWaHnVm3s40pNm4gW59y_pB9XqS3r7hfWUXQGZv3Q>
 <xmx:ntlDYRJ1ILwLinheb9Sum2hqe15mGubV1qosaQmc34t5ZAhNq_7SGw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0CE2BAC03AF; Thu, 16 Sep 2021 19:56:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1291-gc66fc0a3a2-fm-20210913.001-gc66fc0a3
Mime-Version: 1.0
Message-Id: <c9ca0c42-880e-48a4-8889-a92fddbd35a5@www.fastmail.com>
In-Reply-To: <20210916122652.qi553jxvvvhtnkdn@cheese>
References: <CANFuQ7BWedK3LNh4vy8uVN3Jk8GaG-GJ1BwMHDzpTv+kgzxc+Q@mail.gmail.com>
 <20210916122652.qi553jxvvvhtnkdn@cheese>
Date: Fri, 17 Sep 2021 09:25:51 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>,
 "George Liu" <liuxiwei1013@gmail.com>
Subject: Re: Question regarding phosphor-dbus-monitor repo
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 16 Sep 2021, at 21:56, Brad Bishop wrote:

> In hindsight, I think it is too abstract and enables too much 
> logic implemented with data.

+100
