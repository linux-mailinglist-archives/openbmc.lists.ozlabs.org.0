Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7E031FF81
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 20:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dj24k1jRhz3cG0
	for <lists+openbmc@lfdr.de>; Sat, 20 Feb 2021 06:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=SQ/Kds74;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=XpUWs8uJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=SQ/Kds74; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=XpUWs8uJ; 
 dkim-atps=neutral
X-Greylist: delayed 417 seconds by postgrey-1.36 at boromir;
 Sat, 20 Feb 2021 06:40:53 AEDT
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dj24P2P4hz30LG
 for <openbmc@lists.ozlabs.org>; Sat, 20 Feb 2021 06:40:53 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 91B2D5C0159;
 Fri, 19 Feb 2021 14:33:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 19 Feb 2021 14:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=h1z
 WbyspFbpeSH971He7DlznInXNvylJ1odUQvVT2mk=; b=SQ/Kds74SifPtv23aWk
 m8TCLGlRllBRZAmadyyed2n7YQ7AhjNtM+GPyhIMMTp7Nw6KoANHtXt9W69SWRs6
 HAbXph6KuIKRunU41QasDkjrlPvJ+e8pTGbkhIOgTCU5j8WJfoZ1SeGAmAwV8vyv
 gKqMUQJsQpI+68yfJncvozXwXyXdJhrYHenhq6uHVcof847RW8g7VvVHrJC11lc+
 KZOskBnqjO+fgisj7uhQ8SBKtJAE9uhkH3R4DSJMdyq8PHJWtqVy3K0tpeHmeswf
 hWFvqP1Z0BtSuWY5Zzz0dyARA2IhZRY0bBNKhfSgCiWozlVRTYE79dFcN9hutDmp
 yAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=h1zWby
 spFbpeSH971He7DlznInXNvylJ1odUQvVT2mk=; b=XpUWs8uJvra3oEaqaqoz2F
 zNWk3AM4Ql2hJc3rCPmNe5HnPPRpo+UzyaCTZHp3QUJoRHbXw1JwJlvX1pLmaBkE
 C2fJB6eKR9vB56Sg9pNOY8C875kfLdf8UYmVFMEHov9jyBT0kSDSXtgqp+amYM3M
 nZng2o/BIxVTXIvPYi1kAWv6vZ0AyPYyHP3OB59nkSgGsqZ3cmMn8B2X7pVXeoo+
 OoJjnp31XOyg1C8aS8qfdnxGjKaTRkX6HuSlDNko5k2vYckO9kdYR+7O59sALEkV
 Kfn3PipWIiREa8R83Au5LrYMB9KWbxJKIJ0FWwGT2gnksMEg17x6Lr+avDKJ43/w
 ==
X-ME-Sender: <xms:nhIwYKQvcDpqCOIMyXwVm8F8fpnEmEYxUDHoQEmid89pHh4UtXomWg>
 <xme:nhIwYDfiMseA6OFo__gGwym394ms334fFNuibNNVtHyjLG_x6rI9VvZu7OuCwY-IN
 q58UUoFNYF1uLr4PtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeekkeeliedthfdvtdeg
 ueehvddvkeeivddujefhhfevhfdujeeugeefffeltdejtdenucffohhmrghinhepohhpvg
 hnsghmtgdqphhrohhjvggtthdrgiihiienucfkphepudejfedrudeijedrfedurdduleej
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrg
 gulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:nhIwYBoWXw2fKQKA2AjUL0Y0NW2AjWymkSCoAsq6MZh9Xt_Ko22rhg>
 <xmx:nhIwYM80Pe-H8p0BGQ2w-719SPVn-rm4IkrjyrYbbVXcuPzJl_wWIQ>
 <xmx:nhIwYFdFy3EXEKrTsH2pMUQXDhROtmVzv0m4XwjWrEHb1g2_cO8WSw>
 <xmx:nxIwYO72nViMNF0Pem55jAgpvY-DJstKRb3AjoznLzB1l1USyJlMdw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5790108005F;
 Fri, 19 Feb 2021 14:33:49 -0500 (EST)
Date: Fri, 19 Feb 2021 14:33:48 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
Message-ID: <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, piotr.matuszczak@intel.com,
 Adrian =?utf-8?Q?Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 18, 2021 at 12:04:57PM -0800, Ed Tanous wrote:
>On Thu, Feb 18, 2021 at 11:16 AM Brad Bishop
><bradleyb@fuzziesquirrel.com> wrote:
>>
>> Has anyone thought about how to implement the Append behaviors for the
>> ReportUpdates property in a MetricReportDefinition?
>>
>
>As an aside, if anyone else is interested in Telemetry Service,
>there's a lot of code there that's not having a lot of community
>feedback or testing on the reviews, so if anyone else is interested
>please pull down the patches and provide constructive feedback.
>
>https://gerrit.openbmc-project.xyz/q/topic:%2522telemetry%2522+(status:open+OR+status:merged)+status:open

I pulled these in and did some quick sanity checking.  I was able to 
create a report definition and then see the report get generated and 
read it.

I have to say - it was really nice being able to pull a feature in and 
having it work out of the box.  So really great job to the Intel team in 
that respect.

I did find a bug with the telemetry service itself - when reports with 
multiple metrics are created, the last (or maybe all but the first?) 
metric in the report isn't updated after the initial reading.  I was too 
lazy to file a bug and didn't save any information.  I'll try to do that 
soon.
