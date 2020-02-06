Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDC153C5C
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 01:56:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Cg3h6t04zDqHH
	for <lists+openbmc@lfdr.de>; Thu,  6 Feb 2020 11:56:16 +1100 (AEDT)
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
 header.s=fm1 header.b=FlMlZfGg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3WjBN8ZW; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Cg2j1nh2zDq8B
 for <openbmc@lists.ozlabs.org>; Thu,  6 Feb 2020 11:55:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 25F556A0
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 19:55:21 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 05 Feb 2020 19:55:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=+VpY2uO6JywHixWz0pVJLS6ReI6VTGI
 OZY+qXvUsZh0=; b=FlMlZfGgl8KoMFtvhq5d5gHdj3LlOziWMtLpgCfikM7m6Rx
 Y9Kah14u1jJ9w5QSbGzLkIKN1s6klJ0fFNldQiZBJWY8pp26GMgEMe0i3Cza2iMV
 nVi+5UcaPZHZNk256LgAlLyuffudN/r/gsusPlVq0WQR9pGzcWlIVIPL3yaljBN5
 Mefy0Dx9Pm3NT7SGzyGwNq3Oc05hn0f9HzWEektC85zLdaXsiYBfWZcLeY1hLV20
 9cbj176UshO00k8Bg+cPCWJGrTDPZ54CiTJtP1xcZxm8tAIp/hi1d1vcCwGA4tbd
 9bjiuQMjbejMdN1thUeAEigwrf5VxcB8ld1uTpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+VpY2u
 O6JywHixWz0pVJLS6ReI6VTGIOZY+qXvUsZh0=; b=3WjBN8ZW/7l8sDeRLrrhju
 lEd9yiy9AnxmXOIJPrspHYYvXbkJ9VwKNHIM7U+OAhTK9SgBZNyt2Ep7WEJeyf7L
 9eO34EeotBDTb82qtKshKfkMiAQoT+yqzFWW/KgM4k79XqsFPa5e4iZYLaEW/T5W
 2ce/pb2fiagIeq5hhi/z+Hld4+tJovNKbJ0CJGCEhOYkQVNJx5RHWaQFpXPcn6qq
 qv13IDH+MaKT081tZ9EsNS87MvySZr6D+tMvQYUusAv5Yayv+JaIYyqIH1SOfNSj
 bi2jbIONlNtX8TG9Ukwu2VaXiO7cnEh8yUhQamqBvDMIFZUFXPbx73ENJgHJErsQ
 ==
X-ME-Sender: <xms:-GM7XpwtUvfPTa78TqvFoHCvJ9jKd9EAdPMDqaIEKYxIU4uXmixHwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedvgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtrdhorhhgpdhgohhogh
 hlvghsohhurhgtvgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-GM7Xlju3YpHyL-uHsHPyXBOjO7ZTpyRIdbzlW_FnPyi5ObaIGgEoA>
 <xmx:-GM7XplJWVtVflo7OTlmemaJNdo9UEoJk9mq4QUKWs-klNbU6PS5IA>
 <xmx:-GM7XpJt4wGzSP9VnbNxnvOzs0V71PnsD8duav8n378mkL_fAjjGww>
 <xmx:-GM7XmfTlJimVDmQimofjcRoMazfVsjjNFLok1cDa5yRgrnuFnOaEw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4DAB6E00A5; Wed,  5 Feb 2020 19:55:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <77d0f857-e263-4000-b884-46326fc28a74@www.fastmail.com>
In-Reply-To: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
Date: Thu, 06 Feb 2020 11:25:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: Community support - where do want to be in a year?
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



On Thu, 6 Feb 2020, at 10:32, Kurt Taylor wrote:
> The new year is well underway, and I have started thinking about more
> that could be done to enable a stronger, more open community, and to
> have a better developer experience.
> 
> I'd like to get your feedback, but please, this is not meant to be a
> complaint platform, reply with ideas and solutions, or at least an
> open mind for how we can fix it. I want to hear ideas!
> 
> I am looking to organize a prioritized list so I (and others?) can
> focus on making things happen. I am hopeful that my downstream
> responsibilities will be reduced in the coming months and that we can
> start making real community progress.
> 
> Incomplete list (for priming the idea pump):
> 1) Existing (donated?) services - Gerrit/Jenkins hosting, email
> service - what about hosting? what about disaster recovery/backups?
> How can we improve?
> 2) Automate openbmc.org wordpress content/updates, current events?
> meetups? blog planet?
> 3) Metrics - what would the community like to see?
> 4) Early development plans disclosure (new features),
> charter/policy/culture changes for upstream plans, improving speed to
> commit, review commitments?
> 5) Third-party CI testing/review reporting, supported platforms,
> release testing commitments
> 
> What are *your* ideas for improving the community?

Make use of the Contributor Agreement Gerrit configuration if we're
going to retain CLAs going forward:

https://gerrit-review.googlesource.com/Documentation/config-cla.html

Andrew
