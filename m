Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7D94B6199
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 04:26:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyRM14t2Xz3bcZ
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 14:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Fyss2rLI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RyvtEKlI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Fyss2rLI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RyvtEKlI; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyRLY39qKz30Ld
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 14:25:41 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F10A25C02C1;
 Mon, 14 Feb 2022 22:25:36 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 14 Feb 2022 22:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=iDQeASY6QoW5QQYO02Rgb+xYbxTR6+yCsph8o2
 y3ylU=; b=Fyss2rLIm3f7zkP9SjaYk9i3Kwq8ZOJhGRJN+Pu49CXDdz88E16N+C
 kLLwtnFltfDuZ4SG86wgPJoiBKueaYWfu6sSd7ANBqmDfmonuZPZwLHpsb7NPQCj
 wrjgybsuCpPgWdv30E6dRM+Yc2o8P4gKOBqCLlcCHhiIlmZAsW8DI+pGQAMqUwse
 U5IeqLCmEk4tuGxALpl62YGqIEvhi/8LqyLm1z6OC6DMg9XqAypxBKUgDTgW/dSu
 29F27syMyviyUbfM1tkjSz6PzQLYzJT8BQrD9+egfJ6A7PHxURX3KSO47YdAwRfe
 OklZ/9DWLLwV2zkmBuF7v1/hWx33erOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iDQeASY6QoW5QQYO0
 2Rgb+xYbxTR6+yCsph8o2y3ylU=; b=RyvtEKlITb43/69y0Bd7XZCkmyp4thHps
 FYwZjehh5DlZgrtX/SEfos+cEaoYUkOUJ9aHc2MLRAVm70/47AypgDheUY4rGsEy
 r72+vpiFqV2kx9NPoSJt5LnKVXJMEuZDfusObZ2H8lP9iNKurKkVxZsr1PHvGYyo
 S1VauSxat5jOR5w9ygplRGgKjsy4UeDHTJF8SKThqrFXU0C7/8AfvIiPxy8pAnuy
 W2M6K0W3Cpcnmp9T6Q/ktziDxyv2Uzd0Nax839MoPbaXxXzmyH9i1hEQgpbnpQfb
 XosqR735fPk4BYck6Gg+vOsGyY635rRMu+csrHBuvfwFBPgS//dDA==
X-ME-Sender: <xms:MB0LYkjfWyAbluE8v7g8ntUPwKxZAUK4hpt-uRCx6YPFomcBgOgNgw>
 <xme:MB0LYtDdDuCR1sjH6v20JQ9Sz9236ZzAnDVJvLpzvPWvwh0mv30aiPOy6UmR0N8-W
 Is3yYIpbHe4Bu-7AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
 feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MB0LYsGpvZRI95NjDIrHfOMnlZvhG5ekVBI2W5Xky0_RkyJNVviwUQ>
 <xmx:MB0LYlQZFNxQlRNZWi4uGdFMzImSKg8A7f4XfJlOhjnkNbKGBTk2lA>
 <xmx:MB0LYhwFBDHb-iU5iHcyqnh0P7kwKw3i3pYOSoByGD3-aL1Lz_uBFQ>
 <xmx:MB0LYkqKZFj-tcTj4sKh2OuULxtj_IVWPkgvYHk3cDUb6AYx8inXng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 431FE1920081; Mon, 14 Feb 2022 22:25:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <e4b7fc2b-511a-46f0-8a6f-001c16ebe712@www.fastmail.com>
In-Reply-To: <06616971-2f88-740d-e805-d229aa86d985@linux.microsoft.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
 <YgriLTCF5hvtPCMm@heinlein>
 <06616971-2f88-740d-e805-d229aa86d985@linux.microsoft.com>
Date: Tue, 15 Feb 2022 13:55:13 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
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
Cc: Christopher J Engel <cjengel@us.ibm.com>, openbmc@lists.ozlabs.org,
 U-Boot-Denx <u-boot@lists.denx.de>, "Alex G." <mr.nuke.me@gmail.com>,
 Simon Glass <sjg@chromium.org>, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 15 Feb 2022, at 13:42, Dhananjay Phadke wrote:
> On 2/14/2022 3:13 PM, Patrick Williams wrote:
>> On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
>>> There's a key-requirement policy already implemented [1].
>>>
>>> [1]
>>> https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microsoft.com/
>>>
>>> Board code can patch "required-policy" = none at runtime based
>>> appropriate logic.
>>>
>
> [...]
>
>> 
>> Isn't this jumper proposal just like the TCG Physical Presence requirements?
>> This is a software implementation and requires a particular hardware design for
>> it to be done right, but it seems to be along the same lines.
>
> I'm supporting idea of having control on FIT verification, just pointed
> that it maybe done by board code by just patching U-Boot control FDT,
> either the "required-policy" property at /signature or "required"
> property in individual key nodes.

This might separate the logic out in a way that's acceptable to Alex.

Let me poke at it.

Thanks,

Andrew
