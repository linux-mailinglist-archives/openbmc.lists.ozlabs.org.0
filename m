Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C84333FAA
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 14:53:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwYSS4J0nz3cQc
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 00:53:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=bqX0YNYU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oxi6ZErT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=bqX0YNYU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oxi6ZErT; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwYS93Bbtz3cGn
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 00:52:56 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8CE1E19E0;
 Wed, 10 Mar 2021 08:52:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 08:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=Bl5
 Z5pIxEJ4npoXqIM6DZ0Uta5vaxNGrMdTVHQ1sL7Q=; b=bqX0YNYUFmSFIJ2VUGH
 sRgzFjqHfMVXrNseSIoVO3n0LExiMzxBObJaY6orM7tB0sTSWTPH2VgH17fBUjVb
 g/6H8CcG1wDSY2H10yD5MEpC7cvKYPunOgkorrDlU32AJZc2s8CVJNf+VzhMZkLc
 GHUC4yodIkuMwBWqcpMbYPdpnjFmfEyDbLeK2PF5Be6IuzLOYkraYP+hTjnGPuWB
 GdoN9oHjurhDdydRvbRsHh7RH7qtqm1KQSc109iF/zG6I3wNpYg1BJ1hJyZ2kPgC
 PRrmNQ7wMZ6HuHe9pK7XIsOITE01onNLfZ76iUmieJch7fBwl1AWsaVVm1ZIfJZn
 bVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Bl5Z5p
 IxEJ4npoXqIM6DZ0Uta5vaxNGrMdTVHQ1sL7Q=; b=oxi6ZErTB9+F/EyMmd1qRe
 VfXBtAfhY/tRkl8EpCtT7alDDWrIMik6o1Cn8jXxsvVbT5mc6tYR41ecVwQisqaL
 D7CMy05VSz8xroM/dgUGl63d0xuHMvCeg8a1n+zCrO32XZug4ai4O/EHSXLa5n9w
 GcEWV9hkC+oRgP27Qx0E44nZzFgAOoI6hoqcmYM5I2khK30VWhB/z0MW9fMK2uLw
 5kVAf3D+wwiupXC7jIwHCxwxMBe8JdkxXf1tvmo/J3oxb8DqeGQB48OLqvzZ7qJo
 Ay0t46At2Fodd7C5yz3fb3mMK9wlkU71A+AnBAyARWSUQOrCZaQBzVn+KnJB8/fw
 ==
X-ME-Sender: <xms:Ms9IYBN1TGneQON06UdTgOKStRtOaLEILMIFVAKN6NUfbToQmSS-Iw>
 <xme:Ms9IYD8HNzboHi3oL72qu5O5cYzA7HJtT0bU-ErPicR8vO1pW5RETTmU28-WLXHkd
 DINngaiEhZ-8dvNQcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddt
 vdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiih
 gvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeekffdtgfeuvddukeet
 feefvddtkeeivddtkeekfeekjedvffefleejgeduueejffenucffohhmrghinhepghhith
 hhuhgsrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecukfhppedujeef
 rdduieejrdefuddrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:Ms9IYAQIZc3b87SjeHibjtgkZpcxu92-ZqDb2iXUMq4h9XnLxCtJ-w>
 <xmx:Ms9IYNtty1llflxZB-INHKV8IbFZFiffMyFxRTUyxxU2qClWqSumjg>
 <xmx:Ms9IYJdMeGwh_d76xsCLjtVRZxc7HhxQZe7DZqnrWK4jVHmBaUsUzA>
 <xmx:M89IYJE5cu0Eqg03uMYncrGatFYoHoJ8P_bf4hASkOwneopFsZj7IQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 30F2D108005F;
 Wed, 10 Mar 2021 08:52:50 -0500 (EST)
Date: Wed, 10 Mar 2021 08:52:48 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: any in-progress Redfish TelemetryService enhancements?
Message-ID: <20210310135248.wvy7xwwjhjxe4hlh@thinkpad.fuzziesquirrel.com>
References: <20210218190654.kkdsmrlxgenzr6nz@thinkpad.fuzziesquirrel.com>
 <CACWQX81HtHCqXZCzmJqppR+tBy5xDjBHa_q5gw7YTHZ9UaAH2w@mail.gmail.com>
 <20210219193348.n5e6w4e2vr4sk5ge@thinkpad.fuzziesquirrel.com>
 <47d61387-d71f-b72a-fe30-316a3a37829b@linux.intel.com>
 <20210301150552.hfwsnzgb5wczdpyx@thinkpad.fuzziesquirrel.com>
 <CANFuQ7CaZW6mY11MjYQjk7heq00UuAFgS37JiFBw0WFBCGQNtw@mail.gmail.com>
 <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX80ZKiXJGH58L_1HVGie=CB0+3XD8RJq6sAZhdTq6UadtA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Wludzik,
 Jozef" <jozef.wludzik@linux.intel.com>, George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 09:07:51PM -0800, Ed Tanous wrote:
>On Tue, Mar 9, 2021 at 7:23 PM George Liu <liuxiwei1013@gmail.com> wrote:
>>
>> Hi, Wludzik, Brad:
>>
>> Since we have some open-issues that need to rely on Telemetry service:
>> https://github.com/ibm-openbmc/dev/issues/2968
>> https://github.com/ibm-openbmc/dev/issues/2969
>
>The people that care about those things should really be reviewing the
>patches that are already in flight.  Unless I'm mistaken, I see no
>reviews from George on any of the telemetry patches:
>https://gerrit.openbmc-project.xyz/q/topic:%2522telemetry%2522+reviewedby:liuxiwei%2540inspur.com

No disagreement that those who care about telemetry should help review 
telemetry patches.  

For what its worth I asked George to post to this thread so that 
everyone is aware of his intent to work on these features.  OpenBMC is a 
siloed project and I'm trying to set an example and break the silos down 
by overcommunicating and asking others to do the same.

>> I want to make sure that Intel team will finish it by summer?
>> If it is, that is great, we will always focus on and participate in
>> the code-review.
>> Otherwise, as Brad said, we will come up with a proposal and report back here.
>
>You should participate in the reviews and help test either way.

I think there is a misunderstanding here.  The point of this thread was 
simply to find out if the telemetry experts (or anyone else that cares 
to comment) had any opinions on how these functions should be 
implemented.  Clearly George can't review his own proposal can he?

>If the initial feature doesn't land on master, there's no point in
>working on or planning secondary features.

I understand you are focused on reviews and for good reason.  Does it 
not make sense to work on reviews and design/planning in parallel?

-brad
