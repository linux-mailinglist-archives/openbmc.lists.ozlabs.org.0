Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEED4C60A2
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 02:29:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6N8x5skcz3bZf
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 12:29:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=lc4RuxK/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MgU9YW7Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=lc4RuxK/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=MgU9YW7Y; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6N8R2Hddz3bT4
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 12:29:27 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 51F805C01AD;
 Sun, 27 Feb 2022 20:29:24 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Sun, 27 Feb 2022 20:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=faGk0Okip9geS/9xPpFTifPHbVVsIJiSajVYyj
 HYX8I=; b=lc4RuxK/OwTmsdYaYhByAxpmq5d/qR2R0qZ/e/33X/Gue9etd4ad0o
 5LiZCOMcYSeqUK67RWQoorg761DhRRN2iMR8G3/7Ji3WnoQAi/GsdBt7vF+hCa8V
 OTY6lxrDqiwIeeWrw46YLbANieVOV28TJdB4SNTzICjrr5DzQaZ2gxZM9eJgeGoV
 J6jIWRbdifH1gXG6yeZUB+r9eg8+YbqsmN5/KCc8WORZyaN2TTNZaRaI/z/F4+B9
 iEhCXMS5h6ZwFXz9QcD24vip+UaShquN2pTmIjnP1rK4c0UOgIyQs3/UzjrS04Lh
 QDAP9HdsoRUAc+YIsrU7pnhlrhaeBBww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=faGk0Okip9geS/9xP
 pFTifPHbVVsIJiSajVYyjHYX8I=; b=MgU9YW7Y351h3r8hzaJ+wJbUrdoL3TeRB
 tZL/qYAbF+s9miMRSV06ZNh2kXRWVT+fRUEki+AZd6q/xgWgLz1zXYVobgeZbWmT
 HraPCjjnmNwf/ZgxBgbmLIZkS+HvHIl3cduWnCEbQzPHF5Rvs0ALFzTcttQEFl9m
 H2cdQpb5PcqiIbJCizghO5YYQTng5xYwjyO772vfux+EJFGHGbwmTB+VKbEF14YP
 nJw2qbpJ4+7h423FcHqYwbxUDBX49VyoydgBE8Y0TiveRGzHb3oIVZPYczi+3fkE
 1dMb5b+XlIYPtfmDr1OJ2xFKX+cudoIKHc/EeTUUvGAVZqQnartnw==
X-ME-Sender: <xms:cyUcYin1WFqLgOfGs2rUYQku7jcMHAHOcEqz0Z7LDCPQdSyYVrqB-g>
 <xme:cyUcYp1U5TvsgxAWkZOmbegy1Y-Pqlkg6KnaPwu0l5O9Z35He4-QzGe93UItouedN
 R-Gym5MGeAFmMryng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
 feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:cyUcYgptxqiyv8BqQ_ZpOEyh_IESif5yqsSQxPEaXXepJTvYFWFQfg>
 <xmx:cyUcYmnVjpguBnZ8AtyIoeDx0_0otgC1s2JK85dn__q3R5uG4bYBDA>
 <xmx:cyUcYg34nE_3Zq7fC359lfShyg1FqJogeVZghTuCLemxI7GwkvxHOw>
 <xmx:dCUcYk-aS-HcRzDu7nFRDAt6WHDEEXmbwgCtVDDE3kiwR5t37YcKPw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 34C3FF6007E; Sun, 27 Feb 2022 20:29:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <483b87d6-a9aa-4f64-9bb5-04874312a97b@www.fastmail.com>
In-Reply-To: <e4b7fc2b-511a-46f0-8a6f-001c16ebe712@www.fastmail.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
 <YgriLTCF5hvtPCMm@heinlein>
 <06616971-2f88-740d-e805-d229aa86d985@linux.microsoft.com>
 <e4b7fc2b-511a-46f0-8a6f-001c16ebe712@www.fastmail.com>
Date: Mon, 28 Feb 2022 11:59:02 +1030
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



On Tue, 15 Feb 2022, at 13:55, Andrew Jeffery wrote:
> On Tue, 15 Feb 2022, at 13:42, Dhananjay Phadke wrote:
>> On 2/14/2022 3:13 PM, Patrick Williams wrote:
>>> On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
>>>> There's a key-requirement policy already implemented [1].
>>>>
>>>> [1]
>>>> https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microsoft.com/
>>>>
>>>> Board code can patch "required-policy" = none at runtime based
>>>> appropriate logic.
>>>>
>>
>> [...]
>>
>>> 
>>> Isn't this jumper proposal just like the TCG Physical Presence requirements?
>>> This is a software implementation and requires a particular hardware design for
>>> it to be done right, but it seems to be along the same lines.
>>
>> I'm supporting idea of having control on FIT verification, just pointed
>> that it maybe done by board code by just patching U-Boot control FDT,
>> either the "required-policy" property at /signature or "required"
>> property in individual key nodes.
>
> This might separate the logic out in a way that's acceptable to Alex.
>
> Let me poke at it.

I've thought about this some more and adding support for
`required-mode = "none";` or similar seems like a massive footgun given
that (as I understand it) the FIT image as a whole isn't verified. Only
supporting "all" or "any" seems okay because some verification must
succeed in the context of the keys available in the current stage.

After some internal discussion this effort has been set aside so I'm not
going to pursue it further for the moment. I don't think it's easy to
proceed anyway without feedback from Alex.

Andrew
