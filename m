Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031730B46E
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 02:09:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV6Ck3gMszDr3D
	for <lists+openbmc@lfdr.de>; Tue,  2 Feb 2021 12:09:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=l9kjHSfM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=hv6Ph+e8; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV6Bs0N1kzDqwl
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2021 12:08:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6BB665800EB;
 Mon,  1 Feb 2021 20:08:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 20:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=QwH
 o7qf6IDw4hVdTDGXxFVwEYWWYT4+qxNTQhY4825A=; b=l9kjHSfM/t3UszD+z0F
 RWeEYlrkPJuTRM1tjVmjpkyMFymH1LabrWuvb6839t4l49AGX2HQxEcDiP7oc2+K
 LfVSTuDhDla3xgR5E2/ep6LFMSOGA0BhCpwoRXWXJ/ENc8s+J/geD89DtaOjHh/C
 7uar4Aylnmzxpp6umUXClC53iSxsEOXLsKpxw4F7z2CK8K/H4j3oQocRgNkpCV9M
 b47jMnuFpt+8XJWmdsMQQ2TBBGVTnDCx8r+Zx7fzn/o4XTVsWImN7R/CVUt2F1kZ
 npg3ezOeCy2OOwjTAXqn48QQBMkoK8pGTplk1doroeM/JUAXSmrJW34FCPzRST80
 etg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QwHo7q
 f6IDw4hVdTDGXxFVwEYWWYT4+qxNTQhY4825A=; b=hv6Ph+e82uDwl95UfMb6wA
 2nZkjAuMktZaJa8PHfJ+NPDm2u5B0SGkmNesxzyBRoAmWhZbaGDeAr5IL3LwMeNy
 qKCFnUj4nk2wzaiSUXEoZ6R7OrUwSDGUij5U26ZQK+W1YzbL9Tbk7/3PoO4o6IMG
 1YmW2wvhw8AaMnnn3VZucd+ITHnKLb35x1WLMsjvEi1NViv9Nwa6cI9lBLqA/D1k
 EFYbRM6jytQ07uS2rfIgILlWEmKFdDKHFUDB/OnA4uVyVEc+35Had7sqN17BTDr+
 x6Z9meMLpbcMAI6zU8Vt6MfryqyexVKkOv51swWozddjfTqyzIIJFZyAxDyV0RXQ
 ==
X-ME-Sender: <xms:D6YYYDEvGpLckR01TotlXN-kgX2R5Ssu_IbzYn1jJkBuFsbytuudyg>
 <xme:D6YYYAU6rgKhwzjY5ISDoCHF4kO57TxAesC9R6noISp-fUtpm43gvNuT410RJTtdJ
 K42HlQ-LN9cNxHhY48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeegheejgfeutdffteegfeefheeileejtdefgffhgeeuhfdu
 veejleefkeejgeeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduje
 efrdduieejrdefuddrudeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hm
X-ME-Proxy: <xmx:D6YYYFKKS3Yz3DeWxKqIbfgtwLi1-G0HBjiyi1ow-ryiU5tTP7Ofxw>
 <xmx:D6YYYBH96iBRlaXN1jZeFmuxFzCW_T9DyNfDZD3fcpMgkrfXHiITQg>
 <xmx:D6YYYJXKWmkOnM-I4nxpo-z799waeUZPdgY0Iq5KBnfOzKvM0KtUoA>
 <xmx:EqYYYBSEbVrC0w2z9l75MlwOTyaHP94SEns4CWXvXA4D2aAEy8DvcA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44B7C240057;
 Mon,  1 Feb 2021 20:08:31 -0500 (EST)
Date: Mon, 1 Feb 2021 20:08:29 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Progress Codes in BMC
Message-ID: <20210202010829.vthivsovil7mxdhj@thinkpad.fuzziesquirrel.com>
References: <4795347F-477D-45EF-A145-0C7B163FE01B@getmailspring.com>
 <CAM=TmwXEmFc95mBEg4G8bUNoBq7qDL9i_vv=YtomRDrVPDYBEw@mail.gmail.com>
 <7821f27b-31d5-a9d9-a6e6-d709e5456af5@amd.com>
 <YArmnhlS33TpVo63@heinlein>
 <20210128010526.wice3o5qznh4lglw@thinkpad.fuzziesquirrel.com>
 <YBVtvlsJJJ4faFpt@heinlein>
 <20210202002139.jsjkl4icge5bf5cb@thinkpad.fuzziesquirrel.com>
 <CACWQX82G3wbD-Q+RVoT1xx7eru+Y7zk5AdAQT9iQoiR=-xdfRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACWQX82G3wbD-Q+RVoT1xx7eru+Y7zk5AdAQT9iQoiR=-xdfRA@mail.gmail.com>
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
Cc: kunyi731@gmail.com, Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 gmills@linux.ibm.com, vishwa@linux.ibm.com,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, Vijay Khemka <vijaykhemka@fb.com>,
 wak@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 01, 2021 at 04:49:31PM -0800, Ed Tanous wrote:
>Considering that bmcweb already has an LogService implementation to
>access post codes, yeah, log service seems reasonable to represent
>post codes

Nice!  I didn't realize this.  I hope the backend is simply the Boot.Raw 
interface and doesn't require any other applications...

>I  don't see how you're going to fit the vector<uint64_t>
>thing into a log entry

My straw-man thinking was as an additionalDataUri attachment.

>the way that Redfish defines them, you're effectively limited to a
>uint64_t for a numeric argument anyway, 

I'm not following this.  Redfish log entries are limited to a uint64?  
Which property in the LogEntry object are you referring to?

>arbitrary precision, so I'd be interested to see what the proposed log
>entries look like. 

What is the best way to go about making a proposal?  Are additional 
details needed other than I want to stuff all the data in an 
additionalDataUri attachment?

>I was hoping to look into exactly how the existing
>one worked so I could give a better technical answer, but a pointer to
>the code is as good as I can do for the moment.
>https://github.com/openbmc/bmcweb/blob/88b3dd12851cd7bdd4b5c065ba99f40feafb775e/redfish-core/lib/log_services.hpp#L2984
>
>if you're hoping to get human readable post codes, and not just raw
>values, there's probably a discussion that needs to be had about how
>the message registry would work between systems, considering that
>every system implements different post codes, we'd have to switch
>registries dependent on the processor present, and there are likely
>multiple processors in the system, possibly with different post code
>definitions, so the needed configurability explodes a little bit.  If
>you could avoid that, I would.

Agreed - I am not looking for human readable post codes.
