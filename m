Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C51DDC93
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 03:22:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Spd01PrgzDqvZ
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 11:22:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Rr7ZGaUa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P9vEPMFC; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Spc91zDLzDqvY
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 11:21:43 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9C7B5AA6;
 Thu, 21 May 2020 21:21:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 21 May 2020 21:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=Fk4ZmnAzgG4myj1juRwxSMpmByHwwz9
 oWRJoOCWux5Q=; b=Rr7ZGaUa97H8X2HKicDu2tQltv9ZGUkj27eH1emrsKTez8/
 G9BTvkMsTape1kOWTUNsQaQs+jrVBKKocONsQoFrXCee0tEXmbxuDk+rIICIWKlC
 LEQhPljTdfDhMDcOfDTGFHApADcx1RI4yz4u3rqVhREGFi0ZOMcqlqY1WFq6NSuf
 HWjIxdkykkx76j7boEHC3v2NIb1miho409dXGdA4k/yVO9ttbIG3tBp+mLHzgEvi
 ejlkyyY/9vRIo1xmJz8+pnaZdIYjp4AQJ30P2RFzwd72j3CIKUBus1HeyzKPYyVp
 O8uBZ9TBQUBQ9PX/3BhUu0clnrLuH1jgQ/LILGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Fk4Zmn
 AzgG4myj1juRwxSMpmByHwwz9oWRJoOCWux5Q=; b=P9vEPMFCge9Iqxp5XHcU+M
 qZ4nK2vmwGyqKvrDi/5SyGzYi4Q9VxLgg5OY25yUGFL8UhIXa1WEQB81m/cFTUEd
 7KUO1n2/P3itvUjVPad+Tt0FWY88AC9/XEqwhWvzjrlvfoKyUohDx83hoMQg8ER/
 0m3thFcf63hya7CCtCk3z3ojGXHMp8FWGYNq0OCIWjTVffOomQwpg4LOmwceekGi
 RmTJ1OjNn2WjZuQwdLXC8NGVqH7KK1u9ZNyHzoVxfy7ff513copKYZaaRBJ0z5gf
 I5CoHPzZHo5Yg+0IEl6qX7h5lqDe7gZTRCB0txZj9mGbLuOqic3vlnVO2MVBPS/g
 ==
X-ME-Sender: <xms:IinHXueNIxSE0O-KMgFcF_vRGqXOH0tQxrqDbUKZNtWhw0aTRITBDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudduvddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:IinHXoMRi---CXIm9-20VlwRoTx5emRJm6hu3kfCDJQx9-XfHGoJ6w>
 <xmx:IinHXvh-FqajqyNBiPfx-TW2geSSYscOlA8xWyfhfYNez00_PIa_rA>
 <xmx:IinHXr9LKk-AekBc3vDN9k15OcJXJ3-TSviUaR29Dj5435SAB-bl0A>
 <xmx:JCnHXj62aZAgEAmxH_dAjGKFu5rtNbB8LKKKalS-LubxCZGFCaGjYA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C80F8E00B3; Thu, 21 May 2020 21:21:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-487-g38013f6-fm-20200519.001-g38013f6c
Mime-Version: 1.0
Message-Id: <7cc0a672-5a5b-4732-b828-f7e21693530a@www.fastmail.com>
In-Reply-To: <CADfYTpG7M-vvFV4oyPTXTdDDe4zJ23QKL4e7mh2XreY07RgJ2g@mail.gmail.com>
References: <1504A9E7C77EF44697F386AD61B1626015342605@BGSMSX105.gar.corp.intel.com>
 <8ae8365a-ff09-4f4a-9445-17898487cb29@www.fastmail.com>
 <c7996c7f-460a-41df-8d95-4444cee7462e@www.fastmail.com>
 <1504A9E7C77EF44697F386AD61B1626015347268@BGSMSX105.gar.corp.intel.com>
 <0cb06d8b-61fe-4641-960e-f52952bce239@www.fastmail.com>
 <CADfYTpG7M-vvFV4oyPTXTdDDe4zJ23QKL4e7mh2XreY07RgJ2g@mail.gmail.com>
Date: Fri, 22 May 2020 10:51:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Nancy Yuen" <yuenn@google.com>
Subject: Re: MCTP Sockets related questions
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 21 May 2020, at 16:52, Nancy Yuen wrote:
> Hey Andrew,
> 
> Have you pushed a proposal for kernel based MCTP implementation? I 
> didn't see one... I'd be interested in reading it!

I started putting something together but I haven't yet posted anything.
The eternal problem of not having enough time due to internal priorities.

Is anyone willing to help out? Happy to have a chat about the ideas in lieu
of getting them written down.

Andrew
