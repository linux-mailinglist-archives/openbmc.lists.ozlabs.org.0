Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A358519CDE6
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 02:44:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48th5v6ymNzDrfT
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 11:44:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=N9C2Znvn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rcPB9gs6; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48th5D5bzCzDrcY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 11:44:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CA7765C01DA;
 Thu,  2 Apr 2020 20:43:57 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 02 Apr 2020 20:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=VmiaW
 /ZHqnWfO7oQvE7K29LowteoSZmZ4NbVavpeJ4I=; b=N9C2Znvn/20KPH6MlQ6t3
 IrsNCCBSYWu3JEAykyc6c64/OUgZje3ZDHf0krvAFZeIGfTgWGVopuLQPUTWBntQ
 UvQaac9nsGLVc+5iTy+SBp0v2iXmBi+E6HtU5/WqQ3ZgTidlylJJVYc2i93EzjTC
 4qUn95qHNCeJcis8f+MoQs18M7F54g5HpIDup1RsVqf2mRijc42rMWO/dVoDeD24
 jkYgryOM7LERo39tI4xIqzrHBvcapd+5JuXRtJGQUiG56qRRbd24uQ7PN5Xx9fIE
 cPmXVjKpaoQUOlWboqGnKFD7LlAvo3GBqbWuwxzH//th7jH26cNGWiC2H29htjlM
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=VmiaW/ZHqnWfO7oQvE7K29LowteoSZmZ4NbVavpeJ
 4I=; b=rcPB9gs6ll38yL+sO/UJ/sMeGbr00FZsSOrxcby/7oN8BnwALSrMt9A0/
 yVVAX+XVWLt5lM5I3UYpZiAmN1CJ4NXieRUlcgmr3uMoTlqd+2qsnT3+b5bROX2p
 SgrA6vOj0Q/IzbJEbbZOAMC5pNokBsyfwNCV6KTxU5DLaxIWIGpGdTPJmaD1suFG
 PlR5CjcU9t0qceYcbuRT1HgrUR/WHVUvYBn8fTzwz0kbEMSmyS59DtOBUmANdrwT
 cU/KPS26ScLPCMAmcPsm6gpjxfO1oAYGm0N9BZEhmOVserGMZunJyAY6VnOJ5ypU
 QD5Ea/ophii1BfmSc+6+20tMliaAg==
X-ME-Sender: <xms:zYaGXq0ypECiKz2BE09c9rJGIgtHxlWdGVv_s_-4h0GLmIpzPj-y-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdehgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:zYaGXhX3EWoDIDRBzX_il6oDx5TissruPrg5eSs6Z8SsR-nlrEMxYQ>
 <xmx:zYaGXt7-qQx1OVyXSxIT5Dq1t8w96MEbOyDnpJbHPqv7S2wmTZ3OwQ>
 <xmx:zYaGXgICBKffaVEF_I2a4VqT0lMIBWTy4LmXi2mCFN4JfFfFbi2etg>
 <xmx:zYaGXmIlNA-ZQadjvPbtHUA52OxVQLik8IH92XaQ8HD2I7faszq2Iw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 75F67E00B0; Thu,  2 Apr 2020 20:43:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1080-gca5de7b-fmstable-20200402v5
Mime-Version: 1.0
Message-Id: <a6e0208b-3de4-4383-986c-67c61cfe2964@www.fastmail.com>
In-Reply-To: <D5247659-8187-4C5E-8CDB-452BA6B411E5@gmail.com>
References: <CAH1kD+ans6=BbPP9Sut7OQC3Fdt_=+=QEgzyFgyPa_9vwLS0TQ@mail.gmail.com>
 <D5247659-8187-4C5E-8CDB-452BA6B411E5@gmail.com>
Date: Fri, 03 Apr 2020 11:14:18 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>,
 "Richard Hanley" <rhanley@google.com>
Subject: Re: OpenBMC Janitor/Gardener
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2 Apr 2020, at 23:54, Andrew Geissler wrote:
> > On Apr 1, 2020, at 12:34 PM, Richard Hanley <rhanley@google.com> wro=
te:
> > The other thing is, what do people think would be the best way to pu=
blicize these kinds of refactoring/janitorial/gardening tasks. One way w=
ould be to create a *gardening* tag in the github issues.  That way peop=
le can set up filters for ideas that experts think are a good idea, but =
probably won't need deep design discussions to get started.
>=20
> I think we used to try and do this with the =E2=80=9Cbitesize=E2=80=9D=
 tag=20
> (https://github.com/openbmc/openbmc/issues?q=3Dlabel%3Abitesize+) but =
it=20
> really isn=E2=80=99t used much anymore. I=E2=80=99d vote we try and be=
 consistent with=20
> whatever tag others use though. =E2=80=9Cgardening=E2=80=9D or maybe t=
he yocto one of=20
> =E2=80=9Cnewcomer"

I think 'bitesize' or 'gardening' are better than 'newcomer' as you don'=
t
necessarily have to be new to do small jobs or should only be restricted=

to small jobs if you're new (though newcomers still need to build trust)=
.

Anyway, I've tagged #1057[1] as bitesized given that's the tag we have. =
There
have been some queries recently about getting runqemu to work with our
Aspeed qemu models and I think that'd be a great piece of work for someo=
ne
to pick up.

Andrew

[1] https://github.com/openbmc/openbmc/issues/1057
