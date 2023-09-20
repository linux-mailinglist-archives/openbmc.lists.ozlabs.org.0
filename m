Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F867A8CDA
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 21:29:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=s/eetGNI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DYp188xk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrT9s5Hc1z3cJ0
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 05:29:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=s/eetGNI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DYp188xk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrT8W5M2Fz3cJN
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 05:28:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D7B7D5C015E
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:28:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 20 Sep 2023 15:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:resent-date:resent-from:resent-message-id
	:resent-to:sender:subject:subject:to:to; s=fm3; t=1695238089; x=
	1695324489; bh=KjunuL370BAnd7gjcVIIY601W7kpKQPcTcCc5D+V1UE=; b=s
	/eetGNIOPgwLcfJwDzes2Ttz7rDFPVcOskAyKGrd2fackWvk3/iZvd59KDYF2c7q
	sLia2ormcmWfMqSF91kQaTxhVNt9YIqYpgpxY9OmFl1djedybfgPnEb9nwQrR2dS
	zLqfXCNb6ssoMl5ifIKLbTJdjkyJXQIf3o+xDg5BZis5aFLzfBGHEo9DM7Cvz3+T
	s3VL64ODWg1NY8KtVmXuy2GpXnUAEA32vHzNTUFdd4uB/vonW/JBb7B8Xl09rvj6
	HSI94btv6saR01+ZHejhHyMm5llUQ003wA/W45fmoG4sgQy04PwXI5+eRtzOGcqj
	gmaA3Go4clPWleX9fZC6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:resent-date
	:resent-from:resent-message-id:resent-to:sender:subject:subject
	:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc;
	 s=fm2; t=1695238089; x=1695324489; bh=KjunuL370BAnd7gjcVIIY601W
	7kpKQPcTcCc5D+V1UE=; b=DYp188xkFgxRj9zuaCrR/5l0DLJE0uvCYWDZTo39d
	yBvffrENJD/fYSvfaVA67vkFiDhtSheEOM+TYn6RC2PLjOA4xxbh9JuFNwxWfR5N
	k8Kg0OcdTS78wFPqopy8krvUgJBKAqUSM3CHPO5KT4SqtTIl6OUC7I2G84QVZQlh
	ERgJML58ReYwmCZ01Bbj7JioKY1HJQVhQYOLUycoYo8Yt1SN1WfhtMQwCGsvZ4fv
	Dsa71hZpUfhLKL8yH9h9YZxW1UwAnFTX6JtDc1NpaftrhnNr2Zc9sog1ON7xPGnE
	YIeu3UwIpBCaBo9a+57xwJ9IZs8+0cO49T2qvXFFNfrNQ==
X-ME-Sender: <xms:yUcLZfO7OaCNTcGi_ElkNyCHulBAKblXURJjuwl6oscdEN_pgOah9g>
    <xme:yUcLZZ90a12vGnArJtf77A3T3fPvCBjS2yBt6W_Vt8gA6VQNAPtSMwLccd_U09bYq
    PpCoG4XhMsR3flSXL0>
X-ME-Received: <xmr:yUcLZeTZe60_0H7LSQoz7pT9-sCz6ffEU3VyYefO8b3n4OJu9zwMDMSp_n6QZ7WOfCNHO8uyaDlOXggKMI2woMkgR3-c8vtEalG4bOgo6xD_vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekfedgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtsfdttddtvdenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeljedvledtjeelkeehvdeludekvefhgefhieevtdel
    hfdtffejteevvdfhiefhgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:yUcLZTsKkv4Qki9GIWgyk9QTOXKzOHIM2goHaBgeUH1DCsbgvubNcg>
    <xmx:yUcLZXchB26Y6p-SleJt8Ha2STqgVPPZhZJeE7Wk6K8JdJpQt-HOQg>
    <xmx:yUcLZf3FtM3G3aK_3e34aKF1Qoo5viMmvNikwxK4p87nJwRdmJzI6A>
    <xmx:yUcLZVr8B9QJ5mrKG-ko9S_66kqSNsTRw2FLU1ROJhZoy-xNeAhjmw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 15:28:09 -0400 (EDT)
Resent-From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Resent-Date: Wed, 20 Sep 2023 15:28:07 -0400
Resent-Message-ID: <sm4zydradstbugcdot7s3hrj2b2ifvai2rsmiij3w6hyz3thu3@fl2jvew4rtzz>
Resent-To: openbmc@lists.ozlabs.org
Date: Wed, 20 Sep 2023 13:27:54 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Towards less magic strings.
Message-ID: <r23a3loyqtas6tor7to4xlemskvv2w536uv7naw6yqdmtfszeq@csexjlaqkzlh>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
 <89fe1392f0a35c6c2ed14d222d2d324730dc4b44.camel@fuzziesquirrel.com>
 <ZQQgkQyF9nK8H_pt@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZQQgkQyF9nK8H_pt@heinlein.vulture-banana.ts.net>
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

On Fri, Sep 15, 2023 at 04:14:57AM -0500, Patrick Williams wrote:
>On Thu, Sep 14, 2023 at 10:33:10AM -0400, Brad Bishop wrote:
>> On Thu, 2023-09-14 at 01:36 -0500, Patrick Williams wrote:
>> >
>> > ## Service Names
>> >
>> > I think it should be rare that you need a hard-coded service name in
>> > your code, since typically you'll want to do some kind of mapper
>>
>> I would actually propose the opposite - we should use mapper lookups as
>> a last resort and prefer hard-coded service names.  Mapper lookups add
>> latency, and require developers to have OpenBMC specific domain
>> knowledge to do something that should otherwise be simple and well
>> documented.  Mapper indirection also prevents the use of dbus
>> activation, which drastically simplifies service dependencies.
>
>I do like dbus activation when we can and do think it would be
>beneficial to transition to it where appropriate.  I don't think
>anything I've added would get in the way (except possibly that
>opinionated statement you quoted here).

I'm glad you agree and I'm glad the work you have done doesn't make that 
harder.

>You can certainly document
>service name(s) in the YAML with the support I've added.
>
>I'm not positive how we get to what you're proposing from where we are at
>though.  There are a good number of dbus interfaces that are anticipated
>to exist in multiple daemons.  Sensors, inventory, software versions.  I
>don't know how "interfaces should live in a single process" meshes with
>support for PLDM, Redfish aggregation, and multi-host designs.

I don't think they need to mesh.  All I am suggesting is that our best 
practices be:

1 - prefer a hardcoded name until...
2 - multiple names become necessary because of some other part of the 
   architecture.

Perhaps my word choice of "last-resort" was too opinionated as well.

Thanks,
Brad
