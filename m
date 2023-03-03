Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 420816A8F29
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 03:26:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSX0V4M6Dz3cMK
	for <lists+openbmc@lfdr.de>; Fri,  3 Mar 2023 13:26:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=lGhRdofL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jZOrXZob;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=lGhRdofL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jZOrXZob;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSWzt0Ffyz3cBq
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 13:26:02 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 9FDC95C00BB;
	Thu,  2 Mar 2023 21:18:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 02 Mar 2023 21:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677809883; x=1677896283; bh=YU
	PSNRDb+ylBPSuHV1Aerxf48n/N02bSiMDuAyHZifE=; b=lGhRdofLGU3PPCbmxr
	tbSxKgHdmUAb8iQ4BuunxK/w2vAnDnbCbVEu6Wc3xeOjZg7ZZSWI7ViGI77i+PGq
	vPbDzvS0+pORN3eeyoFVkgBVz9dlDQUT7arqB+IyonJ9cZRnV4O+H+gV/DCrqb0g
	eoWyz1ac1RMDW1fNbqLg8GxuSfFPUEAHFAxwtjTBRzKBQibs1TC7voIJIlzra4eY
	8XJXoS5yeZaLjan2iSvyDCnB+h70GS6U7r0+Xs55+pLucaXN1qvOkwjhRi4gKpnv
	CH0JChK4XWWnUaDyaAKpiN9Z4svw3ZSVr1sa+HneVi5eUbKyP7A3nLNBfmDCnf5x
	B0AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1677809883; x=1677896283; bh=YUPSNRDb+ylBPSuHV1Aerxf48n/N02bSiMD
	uAyHZifE=; b=jZOrXZobFoTFuM9dy0/fpaZVuepCk3vamr12shUl2w2tUGgJ7VL
	5a4GfvxtSHfDeL6u03P33ftn0XckjYXwOgZIS7hAMJwYsdS7ZySVvIrCCu7gLJLW
	gJdJvoYJ6aNcn154Ifra9CJeZVcc1r8CwdI2FPl+TPTSRMDZ5d484h5veEWZUjw6
	Iv0uTqdll9UILPDE5C/GByouKrZdFMrv1iKV/j9vdAf4acDYvHKaU6LQgeqA4gwm
	y+fhFwbf+e3uwh7IBHZj+BMxb8SwG9AJ2OvvmAUITo9zyZzzyRPov22oWW4NrMok
	E+SraUNAV9SF1J58wNr1O/q4UlKsvX2oLWw==
X-ME-Sender: <xms:21gBZLieOGcHvsdoQ1Jt35ZrB5hODAUrO5a0lTEUPenKxgWzgcEK8A>
    <xme:21gBZIAAS_tR5tTHsu3-cfxJ6uz0N9oqKQFPhskiJYfZHWdHRZmQSsa0_Zra1mekG
    4-rHfhREGL5rBkvwbw>
X-ME-Received: <xmr:21gBZLGOws72v1Egw-WsD0urbzrF0GzEKv2sS1pzngqaTyzOCV08elDUhTGF5z83bitQdQUu737ggOOfJ31iOz-rzGcGUdqIbvJsto8rnWY0lMqogvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelkedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:21gBZIQzGSN13JgCjXae7Inp5ZTP1LEkV2xHpJk2XwGl-BvPLN_E0w>
    <xmx:21gBZIxL98cp2hdrbPkIEdH641jaIHQKxZZtDoj8yCfmjxg-22yhWQ>
    <xmx:21gBZO6OIeBoG0RFAs8iSK_JvymHqfkZWeBOLYbQIy9nqoFWy7s5CQ>
    <xmx:21gBZFqrqbZ35sJnOu5ubnUCqlU3cpWyrX6qvIhcIa4kv7GCKtXwVA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Mar 2023 21:18:02 -0500 (EST)
Message-ID: <98d5bca2443cfda96791d1640d9817cd44f37c89.camel@fuzziesquirrel.com>
Subject: Re: Equinix CCLA Schedule A update
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Zev Weiss <zweiss@equinix.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Thu, 02 Mar 2023 21:18:01 -0500
In-Reply-To: <20230302223441.GY18848@packtop>
References: <20230302223441.GY18848@packtop>
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
Cc: Olivier Faurax <Olivier.Faurax@eu.equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-02 at 22:35 +0000, Zev Weiss wrote:
> Hi Brad,
>=20
> An updated CCLA Schedule A for Equinix is attached.

Hi Zev.  I couldn't find anything different from the previous one?

-brad
