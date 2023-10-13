Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63B7C7C7B
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 06:13:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=V+7SxcB8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fKKWgnQ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6Cmn21dmz3cmr
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 15:13:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=V+7SxcB8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=fKKWgnQ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Cm50Hf5z3bV2
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 15:13:08 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D80915C029C;
	Fri, 13 Oct 2023 00:13:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 13 Oct 2023 00:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1697170383; x=1697256783; bh=jE
	j+NKa91weEj4gf1h4xgMsjGF2mEwfujGLjsZ+0VTA=; b=V+7SxcB8pxcYN6eCc4
	boC+Qw0zoKMWvoRG5FpyGO8ZC1rO70InD4ghefkW4ew2vSSPeBSs0A/2LWfVgjWK
	mrb3/tPjGXznpR/X1o3JQJ7ir+vjT9jXG/pxJpgFJYgPiIadnWzbXVtRuaUX6wMi
	arqG7l7hlUt1no1SKVt6p42VvPSjZjdhFDEffrj62s6lumO2+B/fcunVNk0BBnul
	AEjs+Qo74rT+eBFx7AfRSTQ1QQouFlfsEJjKUM0F6mY/hiSsObdxpQkCcYrHEwiP
	4YwzRwsplDQH2hpL7JgU39yKnL2c2GD0iQmVyzTWRN8qAtjnFj55/fpnFSl2rpwp
	bmFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1697170383; x=1697256783; bh=jEj+NKa91weEj4gf1h4xgMsjGF2mEwfujGL
	jsZ+0VTA=; b=fKKWgnQ6MNtPd/dQD5mIxSyv5VIpPCN6kEkva/5nltW8UjptDKQ
	yFkjOXwFA4Ez4upV1wSEOJsmeC9Y3rddyTWGuG4VWnU78zleszZhJWTMj6lQGG2A
	QZdPsxVjNYQhKeVLOmY0TCqm6aWlTHW/1c4vq9kOSZlTml+qTcQqYjS3Cpll1FIs
	HzuuEc+13wZmvP1RS2cdWVEhuPcnaYKChxeafCYdXy2LHUOSgG5KbKq1kCe1xBdo
	tKseLRY8n6gZbUDfy1ueYLD0/szbYKj3dKEAD5gKW3TWH6Tf7H+B3wunszT99MNV
	/8+j71zJrT3v3WKV4DGr9dKjjWw/m9O7/PQ==
X-ME-Sender: <xms:z8MoZUFdEJmK071le1m-dgbVHnFFkZQd-WJfSfmW_7qsYPoUuvfO8w>
    <xme:z8MoZdU2on0ViKeFnPDwZw8YQcyFX3EMeZgdgXcB9gNwOI4AEgU2ItKwsGj-OaPva
    KDyvY8qtUaPUUamBeE>
X-ME-Received: <xmr:z8MoZeIOEXXSrV1Gav6Pqic9qO2Z5vy0Fc1EQH5fD-IKfoywlfC1CgXIfRqDWWVoCANEFxHxoBnU-6hwhk9ibct57Baifw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedriedugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeggeefjeettddvtdffvdfhieffhffhgfeffeffvdei
    ieduveevheejteefudegjeenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgih
    sgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:z8MoZWHO3SQ9viFBWgmKx_VXfz8ZRUzbYKhlOVB5lTgOg7CO2xzUnQ>
    <xmx:z8MoZaXJi5VaShVGu_3HKIWr49TZuxHQTO3RlfhBzhNPXHrJabytqQ>
    <xmx:z8MoZZO1sb7pwHHEQYb9GhQHGuV7vdh6RJ9rtNknk55Nae94Mb_Yzg>
    <xmx:z8MoZcKUw0pHLmww-1waQtZhQMhhdJT8cwrjeWzVykvY7yaS9MT7fQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Oct 2023 00:13:02 -0400 (EDT)
Date: Fri, 13 Oct 2023 00:13:00 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, Sunitha Harish <sunithaharish04@gmail.com>, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 13, 2023 at 12:32:09PM +1030, Andrew Jeffery wrote:
>On Fri, 2023-10-06 at 13:17 -0400, Brad Bishop wrote:
>> On Fri, Oct 06, 2023 at 07:29:27AM -0500, Patrick Williams wrote:
>> > On Fri, Oct 06, 2023 at 10:21:01AM +0530, Sunitha Harish wrote:
>> > > Hi Patrick,
>> > >
>> > > Re-starting this discussion with the design that is being worked at
>> > > License Manager: Add license manager design (Ibd6c6f35) · Gerrit Code
>> > > Review (openbmc.org) <https://gerrit.openbmc.org/c/openbmc/docs/+/64710>.
>> >
>> > I've already written enough on this topic.  You've not added much in
>> > terms of what I've already written, so I'm not sure what more you want
>> > me to say.
>>
>> I just want to say that OEMs have many, many happy customers that gladly
>> pay for unlocking things.  They just don't typically hang out here 🙂.
>> I just bought a BMC license key the other day for my ~8 year old
>> Supermicro x10slh-f.  For what it is worth.  I know a lot of people have
>> a problem with charging for security fixes but this is bigger than just
>> that.
>>
>
>Brad: Given the interest, are you able to provide feedback on IBM's
>design proposal?
>
>https://gerrit.openbmc.org/c/openbmc/docs/+/64710

Hah - that's what I get for opening my mouth 🤣.  I wouldn't say I'm 
interested.  I'm not sure why I felt compelled to respond - Maybe I was 
just feeling chatty and wanted to support one of my fellow server OEMs.

Anyhow, I took a quick look and in general the proposal seems lacking in 
details.  References to dbus objects and interfaces need to be filled in 
with details.  "License data" needs to be explained - what is it, in 
terms of Redfish and DBus?  Other vague statements about Redfish need to 
be explained in specific terms of the new schema (resources, actions, 
etc). Interactions between applications need to be spelled out 
explicitly (more dbus interfaces?).  The resulting Redfish data model is 
not apparent to me (I admit I've never looked at the new schema, but I 
do know a thing or two about Redfish so ideally I shouldn't need to?).  
Much like the Redfish concern, the PLDM data model needs to be expanded 
upon and explained in terms of a PLDM specification.

>More broadly, setting aside Patrick's legal concerns,

And they do seem like reasonable concerns, but I am not a lawyer.  I 
don't think engineers are going to be able to allay those concerns. 

>I think for this
>to go anywhere it has to be demonstrated that there's a group of people
>needing a solution 

Isn't this self-evident from the schema being adopted by the DMTF?

>and some collective interest in maintaining one. If
>we can't get multiple parties to collaborate on a design then I don't
>see a reason for trying to maintain it upstream.

How many parties collaborated on getting FSI into Linux?   How many 
parties are collaborating on <foocorp>-misc or <platform>-misc?  Are 
those different somehow?

>From a personal perspective, the concept grinds badly against common
>believes and values in open source software projects and I'm not going
>to go out of my way to support it. 

I'm sure it probably sounds like I'm advocating for this feature.  I'm 
really not.  I'm trying to generally improve my understanding of what 
types of code submissions are welcome and what kinds are not through 
questions.  Maybe I just need to stop looking for patterns where none 
exist...
