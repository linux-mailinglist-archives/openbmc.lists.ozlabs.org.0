Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF97604990
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 16:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MstlN0KDYz3c5q
	for <lists+openbmc@lfdr.de>; Thu, 20 Oct 2022 01:43:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ITDu+9ro;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rdpan9zX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=ITDu+9ro;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rdpan9zX;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mstkl2qySz2xGB
	for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2022 01:43:10 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C32455C00C5;
	Wed, 19 Oct 2022 10:43:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 19 Oct 2022 10:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1666190585; x=1666276985; bh=xDI3tn5Bcq
	5y35207gEYPeVuw2KD93Sqyi7q4Ot3ajk=; b=ITDu+9royA6Gha1NUZ978xgTKE
	8CRhMhuBf+1+pRH2lqUuBTgvVruVVZVdEG+7AePB43MC4gkQkyoWRB6XmTVXg0eK
	wTIGJruILh7MoAZTeSoQ+B6q6QPMlshlpLDE10V1uBuvpzhbDCZzsJYSKq+dOQBB
	OKxcyGhUfCVUd1bdsodsmtXVgoCbFxForWu0REna3ULA5d0wyGZXBGyz1Bzu8TyA
	9YwysLC+Zs7eKhmw9AMdUiIZm4PJ7nJxx/KcFm9g+lwZavzDLAgqA+O6VSwUzKGC
	6UgIKUSSvpp9p4yE7poflZdgyCp5kgXJzTGak/P6wuP6VaqqnVjqBhCJFk2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666190585; x=
	1666276985; bh=xDI3tn5Bcq5y35207gEYPeVuw2KD93Sqyi7q4Ot3ajk=; b=r
	dpan9zXdHHuwQyYfOe/fRSyZjkkFfmHylRBMitlmXED/DruPUOVniki9479di/UW
	/DUkldCZJ4G70zE7SpRDhql2XHwSNiCCwy1Q1g0kai7r1Bqi6dAjVDk/BXBOo6Nv
	lob0kDOm4EFEtE9gghdtelN9b2/uR3vL0DMXlpGANjhyqhGu/FrIen6RVhmbmn2Z
	mhH6E+ZAiSgtoGOSxykxNUbcohmVS00kvebaWE6zbRVeL8gOc/gi8p0pelr9R6rd
	lmNtfzQK0JXloXyhAWCXqoexrKp0tw92RbcT0aOUizSNA6AaSi32O/oaz6rPwYt3
	Fw9948IVuaMp2xyzwqOPg==
X-ME-Sender: <xms:-QxQY2fWQBVxMIegjORqmNo65f6HCfWcc_dX83dSMUuROFGPMGhj4w>
    <xme:-QxQYwPwJY7RSgfc9j6fcwYjUUgzEqB385xQ1fMOI7Av9l4JLgIrMDwqvqt3oRPh9
    7spjnrklYCt58B0Wx8>
X-ME-Received: <xmr:-QxQY3g77m9r8-hrk51NRSafJcccxotoxfhm3tHF4ZeOKW9-uscKJYRWcHoU1cgRZO5pUwC4_WDxqIpEHX8d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:-QxQYz-OYNm8S9KcbEg0G6edlsG0-eUC_DsBI4xQNJpURmV6j792mw>
    <xmx:-QxQYyvvQE5-VyVaAt5Y2VuUoLOIyv1m0BuDv9Q42xEyi7lTRpP8YQ>
    <xmx:-QxQY6ETEe-qD_lBl3un2gCNtChPg6ATlcWk6EMsw4aHzSByuLuh5Q>
    <xmx:-QxQY3WCPcmdZFGA_0U5cFvzWzpseZwqUDWaWAWDdfy-utPoQ4AcdQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 10:43:04 -0400 (EDT)
Message-ID: <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
Subject: Re: Adding support for custom SEL records
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lei Yu <yulei.sh@bytedance.com>, Jason Bills <jason.m.bills@intel.com>
Date: Wed, 19 Oct 2022 10:43:03 -0400
In-Reply-To: <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
References: 	<CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
	 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
	 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the reply Lei Yu.

On Wed, 2022-10-19 at 10:05 +0800, Lei Yu wrote:
>=20
> 2. The rsyslog way puts the SEL in a file and thus there are no DBus
> objects, which makes it harder to work with other services.

Are there other services that work with IPMI sels?  I know there is a
Redfish SEL log.  Anything else?

> Indeed, but the rsyslog way is not really (and fully) upstream.

I'm trying to determine which implementation is a better fit for me
based on the technical merits of the solution, not based on what
repositories the source code is in.  If that ends up being the rsyslog
approach, I'd consider helping to move the code and make it fully
upstream.

In the hopes that it generates additional information about the
motivations behind the differing implementations, allow me to ask a
somewhat rhetorical question.  Jason, to avoid confusing OpenBMC users
by having to select from two different SEL implementations with pros and
cons of each that are not obvious, would you accept patches that remove
the rsyslog based implementation from intel-ipmi-oem (provided the Intel
metadata is also updated to use the alternative)?  If not, why not?

Thanks,
brad
