Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0A7C8984
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 18:04:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=jhb+Y+xp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TFdMt56A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6WXL1jPnz3cPN
	for <lists+openbmc@lfdr.de>; Sat, 14 Oct 2023 03:04:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=jhb+Y+xp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TFdMt56A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6WWh3NTLz2ygZ
	for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2023 03:03:27 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.nyi.internal (Postfix) with ESMTP id E34575C03DD;
	Fri, 13 Oct 2023 12:03:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 13 Oct 2023 12:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1697213004; x=1697299404; bh=oJhbWVjuevzNlXP1QCzW5zS0y0z90f7UBj1
	wafMNBlE=; b=jhb+Y+xp2fdjIMoIjH3Ve4WFGyN+NI1TUqjLL5KqoMsr/0UspYS
	Z9KaDM1cfKIPqaFt82ON1BJVK3M366CahrobcNkwal8kEBgVH44dQYjHs8TxnVwC
	szL2ZvLTagzOXz9GFpb/0wQDdwOCjyfA5N3gxNeFN+beLSUah8XHqyZ4U6GyCNnu
	NH2WOO0z09dZvZ95yLFIdN90SnW/1bEmPz99MAnIkFE0OgkYLpZCdTm5fJavM+Z+
	yhrvzhORBiEp89ZHF4imzbFX0YWNZfO7iPe1rBpFZmggrt6D0rFFplMbbeepdWFz
	6FXmoCQYlp4YDs8gRj9p3T5E0Ie8pl4T+EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1697213004; x=1697299404; bh=oJhbWVjuevzNl
	XP1QCzW5zS0y0z90f7UBj1wafMNBlE=; b=TFdMt56AO17FLqmgsyr2Pr6oZrmVD
	/NJjQTNfbutvz4tQOWTVgi+ELA7BWH44OZyCZhCXH2f4igy26SmWn60ScMZ0EIIz
	qsoOXfW+MWuBi0mVdpfq4aTNSxemT3JvKwY1930tiIQH6f8rTSzkzU/7hzvg1Cd/
	0IXbscI75Mm492MeWE90ZJ9Qc//NxUGRIjlzDt7MPfEK2evZq8sLP+0uOHONeyjV
	BKPPrkPsP5MlL+ttpVz0diffCe7v95YI6BInvy9IBx17jsPcQfphpClC5l00x3z8
	njImLHLNfXsVrYrMPCsvUiOhedAnzifYGzn1eKQkwY4s/0mUH8UzoRbXA==
X-ME-Sender: <xms:TGopZZUwmxTGVdECqqYxb5fJfQTwHzYqAajWSAkZ0ysaWf3DONo2Bw>
    <xme:TGopZZmpC3tIF_DgHCx-awOoVbWoMgtBcMdDQTkZXJTqOs9UtigVqf09MbldXB0qS
    rjJfZK_h3MGDYDYX5I>
X-ME-Received: <xmr:TGopZVYEw9yqho-6FvazgxH0aW5JmW-hyCNpOYaq4zTOOMvZVPgP2l33CzZwb4JcNStFLPDMVl_zFrzKQiG8BueCTVjqxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrieefgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnhepkefhgedtfeevvdffheevgfefueevkeevueeghedufeff
    feffgefhgfeiveelgeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:TGopZcWIGQ3iEj9_1ckID6LtadS9aqK4_xMw4n_T4fHNYhs9drVIQg>
    <xmx:TGopZTn-n6z-oMBqffEoEqlwFbZTJL8rKmsGtJTVgbdjICskFP65Pg>
    <xmx:TGopZZcQ-YnRgVTgEI-W1Ppfq91Gr922l_Cn3HWoJ4mHUS6okoVP2w>
    <xmx:TGopZRbluQCeDTN_UHqNEf9Wkfp7PFK2uOPxgylS3wY7yxpWCAxmLw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Oct 2023 12:03:23 -0400 (EDT)
Date: Fri, 13 Oct 2023 12:03:20 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
Message-ID: <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein>
 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
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

On Fri, Oct 13, 2023 at 05:04:23PM +1030, Andrew Jeffery wrote:
>On Fri, 2023-10-13 at 00:13 -0400, Brad Bishop wrote:
>> On Fri, Oct 13, 2023 at 12:32:09PM +1030, Andrew Jeffery wrote:
>>
>> > I think for this
>> > to go anywhere it has to be demonstrated that there's a group of people
>> > needing a solution
>>
>> Isn't this self-evident from the schema being adopted by the DMTF?
>
>My comment was more in the context of OpenBMC and less in the context
>of the DMTF. Standards that the DMTF produce are more broadly
>applicable than to OpenBMC, so not all interested parties pushing it in
>the DMTF are going to be parties willing to do the social legwork to
>gain acceptance for and to maintain an implementation in OpenBMC.

Makes sense.

>> > and some collective interest in maintaining one. If
>> > we can't get multiple parties to collaborate on a design then I don't
>> > see a reason for trying to maintain it upstream.
>>
>> How many parties collaborated on getting FSI into Linux?   How many
>> parties are collaborating on <foocorp>-misc or <platform>-misc?  Are
>> those different somehow?
>
>How do FSI, <foocorp>-misc or <platform>-misc run afoul of common open
>source beliefs and values? 

Obviously they don't.  I asked this only in response to the comment 
about a lack of collaboration from multiple parties as rationale for 
exluding something.  It sounds like that is a red-herring.

>I'm asking for a higher bar to establish whether a license server
>implementation that constrains user freedoms is something the OpenBMC
>community significantly values. Satisfying that (in my mind) requires a
>diverse set of community members come forward and demonstrate that
>they're willing to collaborate on design and maintenance, as a proxy
>for value.

Fair enough.

>However, there is an escape hatch for project social issues. For
>example interested parties might choose to collaborate on the license
>manager implementation outside of the OpenBMC org, and package it
>through Yocto or OpenEmbedded.

I've been thinking along similar lines lately and I like this idea.  For 
a license server and even in general I think less centralized control 
and less tightly coupled software would be a good direction to take.
