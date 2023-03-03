Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF136A8F23
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 03:24:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSWxf3CwZz3cNX
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 13:24:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=N/Z9S/5M;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ejo7X0yX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=N/Z9S/5M;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ejo7X0yX;
	dkim-atps=neutral
X-Greylist: delayed 320 seconds by postgrey-1.36 at boromir; Fri, 03 Mar 2023 13:23:29 AEDT
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSWwx69Fhz30hh
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 13:23:29 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id EA5185C0143;
	Thu,  2 Mar 2023 21:23:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 Mar 2023 21:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677810207; x=1677896607; bh=LU
	hdyRXXPmIxczgzVvNPzDvK9UoeqNx7DcS6WwKQiJk=; b=N/Z9S/5MCRRCAD1bu7
	eLwfV2vxSX2ZE4gNbOc9kaMaEMUGljk9ri5QtQD81WihKWJd06JUubftjGWfrJYA
	X/MYxeQNkWt5tlb39ra+130D/0LymrCc99pZapF9DOwqtlVl92PaIKj8waAsNa4j
	oplCti6PwQr5I8aTfhIhEEuvmIbGhLPdSmWlaxk+nIbgC0+vET+4OOizyjBpTEDH
	vhjc4aDb6TuLrWCG5N8euLYg5rh3rJcIxBpswaIqBqRqqUY3KZLXotPhCYTVQrlE
	zHwcXC6r9ovGoipzMFFbq1v4irxUKAZcGl6P6jhhnnisMZCB5qr4UQ3iZrlbRX9/
	Pq4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677810207; x=1677896607; bh=LUhdyRXXPmIxczgzVvNPzDvK9UoeqNx7DcS
	6WwKQiJk=; b=ejo7X0yXH4Wfbco6xX0IF+RsI4FGrrqebY0nBZiOdIXj/gxs/gK
	dWR4hSjH8wUSyGoz3fsCPGvA7fovpqGeJ8CDn8E8eboYQwZ9nacbp9kghYOU9zHO
	eLNjttrH6Vg7p0j7hd/IhreYvFoB7b2UwaypWRiYyJVIQT4f5TUWt+icK/iGQ9t7
	teSTWv1EZoq6YJtXt563S/cN+j0RJ/CrOTPcEqYmZ6t3nEnWLo8OXMFbIKJlvKCw
	d96VEmhOMoWio3TqhgiifYvaD5aXy7c0Ow59mlLgl7+zL3ikMiA9Gb1rwKsGH/ak
	m0f10rxcXMnDil/jBEBxJ/H1SqeopdteGZQ==
X-ME-Sender: <xms:H1oBZFRvkRVr1mXkxaAp3G0CC-uuYR81JxXgGlqhpOz7DXm_uWojHQ>
    <xme:H1oBZOz6V5o6R5RczrczP0HwxAKGwrsHeNCFUWnuExfvgej-wgxRST-J8IXghZzfb
    dE7oB3yrvSIi54wqqg>
X-ME-Received: <xmr:H1oBZK021rMwxAfOI7Y_azUpXn9zoHfm17HpjBNF4GOuSVG6J_1WgVsKnIklgrZGcW6hfMw1W7VKYJHV7V746KrcrIRpN8m-0N6BVI21RAzatGJcPZc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelkedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:H1oBZNAhtLmogZ7NaRZGU7Lq0JDb3L4izy8s2wjzohQXvrhDJJ-4tg>
    <xmx:H1oBZOgJF7CRVTbweOVGYBTDuUn40GJQsKRmODU-gB9q8jiCOH0Wkg>
    <xmx:H1oBZBpEfH-UFDR5W8v-_ftJ1UrzXpAYZ-UyguE4XxL1uqynrfxuKw>
    <xmx:H1oBZCaXn__2CyDQxhLpJtcLisrPNGqDYh9gsqYkxk5rQxKnWD2jsQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Mar 2023 21:23:27 -0500 (EST)
Message-ID: <3ebbfacc2f0d7119025402fa6b18dfd6b3bb0276.camel@fuzziesquirrel.com>
Subject: Re: Equinix CCLA Schedule A update
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Zev Weiss <zweiss@equinix.com>
Date: Thu, 02 Mar 2023 21:23:26 -0500
In-Reply-To: <20230303022200.GZ18848@packtop>
References: <20230302223441.GY18848@packtop>
	 <98d5bca2443cfda96791d1640d9817cd44f37c89.camel@fuzziesquirrel.com>
	 <20230303022200.GZ18848@packtop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
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
Cc: Olivier Faurax <Olivier.Faurax@eu.equinix.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2023-03-03 at 02:22 +0000, Zev Weiss wrote:
>=20
> Oh, you're right -- I attached the wrong file by mistake.=C2=A0 The
> actually-updated one is attached now.

Accepted, thanks!

-brad
