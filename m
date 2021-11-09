Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BF44B2F1
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 19:58:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpchC5x94z2yPq
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 05:58:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=LYL+4SUD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RtFjVHTv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=LYL+4SUD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RtFjVHTv; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpcgn3t6lz2xCM
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 05:58:13 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9BC6B5C018C;
 Tue,  9 Nov 2021 13:58:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 09 Nov 2021 13:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=xnxU2DBO907it1wJ2nPwH6D7kE
 QUOc7yKF+6aJQjheA=; b=LYL+4SUDjWwvn4Vf8tMoYzTaUY2mNInaLuOsvz/MOt
 iH6+OqGsLTklTK0+0d4XbiKa49Qdm8fWEAe7gHS31kR32mm7VNRk8PibYzpXQY5z
 roBAhsb0CJ5rErRJpL3VM13u5ADJWTsrWGIldBygowhODycuzKlN3Of/u2ROq4Ma
 Q6s/AGaBsYpxAn7wYi1pLNLsoS6ARmMw29303tNE0FFDNEIC2bdd3kA87KbAhUDx
 +kFK/mb1mYC+UGqpMK9vtZ8rmUjpNp4JTJ2mnNqJH3MrdhCzwuPqW+bq0IugUxlf
 c9wM65izaNdKLttNykibxFWf01sybm/yCUU6JYbhbkIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=xnxU2DBO907it1wJ2nPwH6D7kEQUOc7yKF+6aJQjh
 eA=; b=RtFjVHTv5zV3/gWxu0dbSrTJD3HIjJbWTh0mI2lk2iX/kzm3WOF7w2Ajx
 dbj279IdPrCCfTIjgUKMI1wRgtkgmca0ufQZYBdggVTu04JfwZN1froApHLI39re
 JaxeE8QZfIGzNWoedBk5dReM/zy2Y4qWF4EFMn8Vj1DOet4uNJz8p/xt8b0uTc/0
 YW5qk06Z7k7agFfoCdINU0RComf5+qz86Ksm0cw/KtVgmhZMMcNDPtMUoqEinUkK
 ebBkcq+mlzPCyiav/sLgh/vh5+lmRHYvHGzEqdZco1IIxzl1hLgllp3CFnIvSgzK
 b36VcnyyeDQ4FmY8GCK+DxywD11vQ==
X-ME-Sender: <xms:w8SKYX_oY65wCpEKFjcVwDp27LKEsv-piT9YTH43Bn8_ILwBj8LCzw>
 <xme:w8SKYTs0dsIMvw8fVD21dQT8w_hS8d1_HzS6RtC-LX_QRH-5VOak2Ncy9yflY54CQ
 eM0CA6U58tsHy9z7v4>
X-ME-Received: <xmr:w8SKYVCXBUcAoZXVmAjjdpTJHsT5Acj05a4L1jwsZGTxueBuifE3XiLl9nipkGMNvUsmmfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeggdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpedujeefteekgeeigfegtedtgfejleeluedthefhtefh
 tedufeekueeiieeffefgteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:w8SKYTe59mVzKTtyrpEeJzEizZnl1nqp9jR7GqzidzEXC6akPfsqug>
 <xmx:w8SKYcMKbMHHuDV_XyjENj5c3gvdJVlSnGJwTONgXtZrKqN1gP9QUQ>
 <xmx:w8SKYVljVvMjCFckr5HJEAjgZ2SRrImGsU37gH8Q21pBfiMY4BpJhA>
 <xmx:w8SKYWVOkFfA0GWsm7odFrBXY43bt4MKDdmS3zqPvSNAIB-1uIsEVw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Nov 2021 13:58:11 -0500 (EST)
Message-ID: <bff66cb8fd5ae955212a8c129cd987220f07b86a.camel@fuzziesquirrel.com>
Subject: Re: FW: Cornelis Networks CCLA
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Srinivasan, Usha" <usha.srinivasan@cornelisnetworks.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Tue, 09 Nov 2021 13:58:10 -0500
In-Reply-To: <BL0PR01MB40177ACD8D09BA45673232A39E8B9@BL0PR01MB4017.prod.exchangelabs.com>
References: <BY3PR01MB66129A1D908203312857D3E1A5879@BY3PR01MB6612.prod.exchangelabs.com>
 <BL0PR01MB40177ACD8D09BA45673232A39E8B9@BL0PR01MB4017.prod.exchangelabs.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2021-11-02 at 22:05 +0000, Srinivasan, Usha wrote:
> Forwarding CCLA for Cornelis Networks to openbmc mailing list.

Hi, CCLA accepted, welcome!

-brad

