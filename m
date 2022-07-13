Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25315735D4
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 13:51:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjbYY4dnPz3c4K
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 21:51:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=VaCzigp4;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T+TbOBcU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=VaCzigp4;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T+TbOBcU;
	dkim-atps=neutral
X-Greylist: delayed 363 seconds by postgrey-1.36 at boromir; Wed, 13 Jul 2022 21:50:51 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjbY70zwPz2xmr
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 21:50:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 030B63200583;
	Wed, 13 Jul 2022 07:44:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 13 Jul 2022 07:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1657712684; x=1657799084; bh=d4p6Sh+EgvN0SHBmKdk8buqp1
	++uq7wyk5Wvx2M724M=; b=VaCzigp4t+Bxl5s3z3ChExkSUq45wjGgU8/RlezWh
	felnrKGiNvD036ScD2Exf0ZH8YhsDq3AMuB8aNVyIhJH5l5hJd6Y1q9Bf1u1QLpE
	XKkQ+ns7bbvmRtrZ89YHJEb/VE+Iw3a9WKxTj6W+yKXWupOI6YpevWfjWoC65kLT
	WLydnYRZhw/t4OsSsHYKZkb1oGBDy+z0W+RY8+JR5Dwfs0YQXqMBRaUpogNosO5V
	iROFmWEjMxbAJxe8wxqd+EngZU97V+xXX8F3HX2g8WotlUe6stT06Ka++IxGfuvg
	2ktg6lLbTzLBuQq1sJu1UIGvv1nhKcaDQP7ozn3rj2Jpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1657712684; x=1657799084; bh=d
	4p6Sh+EgvN0SHBmKdk8buqp1++uq7wyk5Wvx2M724M=; b=T+TbOBcURBr8nHGJB
	CcRc79whj3rCZ8m0zq++C/96VgG6AJkdsEovd97k4VIxYtRLti9TrSZO97mzSugw
	waIoSWV6lThKcfQOri9zK1AjgFqRqQhqGIVUbrfMfjE4ZUkuqi3jlEQf7nx90fFz
	VUE2RHxnf9xUZABWYUsq95lUB5MqXMSfvbSWXOq/RhoewD4rnwgYSeAoAPpLwHuv
	qo9G28m2RAnp4rRM6OCWrwgPIfp4ohM3kc38GLjZV+Z+j8KVw4AEkltUa1Z+DMQm
	JvGo+yNkYMo8/0Cl7s8oeYSF5nN2ib6aPHMHAMTbJu9QK5DZrjobFr//coZzAYsx
	objBw==
X-ME-Sender: <xms:LLDOYkI7NR9fwcai0PlstIb-1ED_WuTLCZ_H1YJGZmK1MRl63BbvQw>
    <xme:LLDOYkKjtUFDbp3IDpua2dCl7jtgv--SwR_NcRbM6cdhGXdEmCBlPq2nV7xVGKYTO
    cJv9sSI4Dz2NNV_Fww>
X-ME-Received: <xmr:LLDOYksnPN80Y_myHK_OBDaXPFKwwg3YdWnnAFX93c5_WME2GXSYi-7ofpNVOswDZVkhV9ve8KNQlJu69Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpefgffdtteetheekhfdtueehffegiefhuddvkeettddv
    ieetleegleejtdefjeeukeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhmvghtrg
    dqlhgrhigvrhdqghhuihguvghlihhnvghsrdhmugenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquh
    hirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:LLDOYhaJ8Z8A1xrGDbDlR4doRCvyY2GkqlAcaQ8bQ9mGhjtJy67Eyw>
    <xmx:LLDOYrbmjMsr2c8PKe5QURHU5dWukrXp3B5qblNTjSj6MkDznzEVDA>
    <xmx:LLDOYtBb9EY5IdutvTG3aTYNZ0znv_0oxek2qZtkc1Bia0Rh7p-cZw>
    <xmx:LLDOYsDCTI6XSA1Jm700PPcW3OH-X0nkCV8z6cp0gdjvaoHEXG4R1A>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 07:44:44 -0400 (EDT)
Message-ID: <06cc4765d073927e5fc7c8c3d4dfc020c2e8b80a.camel@fuzziesquirrel.com>
Subject: Re: Request to add
 "meta-google/recipes-google/console/glome_git.bb" to auto bump
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Brandon Kim <brandonkim@google.com>, "OpenBMC
 (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Date: Wed, 13 Jul 2022 07:44:43 -0400
In-Reply-To: <CALGRKGMTT4Rb-VzxBh-2zQKXkDHH7Cye1YzqyHxJZp-09A=ggA@mail.gmail.com>
References: 	<CALGRKGMTT4Rb-VzxBh-2zQKXkDHH7Cye1YzqyHxJZp-09A=ggA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brandon

On Tue, 2022-07-12 at 11:42 -0700, Brandon Kim wrote:
> Hello,
>=20
> Following the instructions in
> https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md#dont=
-use-srcrevautorev-in-a-recipe
> we'd like to request "glome_git.bb
> <
> https://github.com/openbmc/openbmc/blob/master/meta-google/recipes-goog
> le/console/glome_git.bb>"
> to be added to the autobump list if possible (or let us know if the
> instruction is outdated - or if there is concern for adding a meta-
> google
> recipe to the autobump list). It points to a public github repo under
> google: https://github.com/google/glome

You'd have to add support to the tool for looking in additional github
organizations.  It is in the openbmc-tools repository in the openbmc-
autobump folder - you can submit changes for review on Gerrit.

Thanks,
Brad
