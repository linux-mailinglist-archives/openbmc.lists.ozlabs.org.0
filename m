Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48741B6FC9
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 01:48:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YcBG52R7zF1Xx
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2019 09:48:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fWLTFP/a"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="eRtQjmu9"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Yc9P5KfQzF4TL
 for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2019 09:47:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7271C72F;
 Wed, 18 Sep 2019 19:47:48 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute4.internal (MEProxy); Wed, 18 Sep 2019 19:47:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=UCs1g
 Druaq1BEVXOjQAj9t/J8nnTegrEFFF2+Q1FbRA=; b=fWLTFP/a2EVesuj/vxGJ2
 86VnYi/2gcURdFK+qKGrv2KTYAO9Ttvbj2+21KI7HEmRPD+QS8gR+gdEqUbQgKWW
 BlPKCT63/Qw1UG95YyXxVhedQTdSKRAAiZJv/bmVoIldu9BQSM7/Jh3S4cO9EvL1
 oIftsr4dNWuM/AaImSl4Yk+u+18gEsEDjSJ3cBe6kMRP1xtvJqX0r2Phl4kIGh8v
 iwAnaBDIQ5HOp+Xtn+QwtcwD/tSOTCxLdMXFJQM+D6Oa+GzpHGDbQ82VgwjB5QW/
 23wQPGp7GNYMYg9Z6s0aIMfK0bYaxLsa1kqEeKmXDOvAe8HGmYEmKYAYiWJqhcgH
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=UCs1gDruaq1BEVXOjQAj9t/J8nnTegrEFFF2+Q1Fb
 RA=; b=eRtQjmu9woMJ0Nhov7G8o/cdbvdMGvZjioESLgz839LbC5gnUmGAjF/NI
 QHD3Er/TduCJqUpPW+h0PS5uVqpzNBhBguTKfuh6D/8JzS49n+zE/n35HCBfDvFi
 29CHwIaQPk58Mg1NQ5WGwBoVkZhxTPk4isfsIMixbVvsqHPwOohcNNRVJYliBVGf
 MekMg7RVW5pOk9O8XBoSZaFqcDkd+Lx8PFSAVzvFIsH1zW9bJ9TEIJg0NHdbFbmY
 SrFh5jO1mPk7e8443m/cEq6DTX0KKCTN/NWaAA2T4ZlMZI+p2AtbqezRKS1EQoGf
 fvcj/DpOfETdHIuWoFwcD2UWJ7wFg==
X-ME-Sender: <xms:I8KCXQLGsXW5rsxjALI23tyDtmI6bQBE95Ja9fUnhlo45z6A8qyr8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:I8KCXUYQlLvYdE32z-26OVxm1ntAeA9dYPmWcsk7jOKkdGHlQN0VRQ>
 <xmx:I8KCXbu-3Fr3A22SJXWBalyGUbbixbIamhC9pnPCxVWgiVVEru6aHQ>
 <xmx:I8KCXRtBvBCRx3v_bBchnIz_sgT9ufr74W0aBlZb3B6exCfppYPOzQ>
 <xmx:JMKCXdbsmQ7sKltUJyN9G3ebphthcaBOfzJ9qpAVQ9pp746PphhQMQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 23EB5BC00C3; Wed, 18 Sep 2019 19:47:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <1a5c8f66-1d5a-4f6b-9326-816831934c14@www.fastmail.com>
In-Reply-To: <CALLMt=r15qn+kFJdTWpbAzorjr+kfBoyz2mOJ3QsTwrfJKDUhw@mail.gmail.com>
References: <DECB9459-108C-40DF-AB18-65A38169223D@fb.com>
 <e9f88063-77e0-42e4-b63d-92d5b8d8c299@www.fastmail.com>
 <CALLMt=r15qn+kFJdTWpbAzorjr+kfBoyz2mOJ3QsTwrfJKDUhw@mail.gmail.com>
Date: Thu, 19 Sep 2019 09:18:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>
Subject: Re: BitBake Apache License and Packaging for OpenBMC Components
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
Cc: Andrew Geissler <andrewg@us.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 18 Sep 2019, at 22:31, Andrew Geissler wrote:
> On Tue, Sep 17, 2019 at 6:59 PM Andrew Jeffery <andrew@aj.id.au> wrote=
:
> >
> >
> > > (5) How should I handle being in a subdirectory of a repository? T=
he
> > > code I=E2=80=99m checking in will go into openbmc-tools. How does =
that work for
> > > CI?
> >
> > There isn't any CI for openbmc-tools at the moment, as it was origin=
ally
> > intended as a collection of quick hacks that made people's lives eas=
ier
> > without any particular guarantees. This was done to lower the bar fo=
r
> > entry and get people contributing their scripts.
> >
> > CI is probably something we need to think about though, so I've adde=
d
> > Andrew G in To/Cc:
>=20
> I know for openbmc-build-scripts I did eventually make a jenkins job
> that does basic validation of the scripts it can (building docker cont=
ainers).
> We were getting some regressions which were breaking our CI so this wa=
s
> a quick way to make sure the docker containers at least built when the=

> scripts were updated.
>=20
> We could do something similar with this repo, even if it's just runnin=
g --help
> of the tools to ensure they execute. We could get more complex and
> connect them up to a QEMU session running openbmc to validate
> more. I don't have any bandwidth to do much here though so someone
> else would need to drive it.
>=20
> Would we want a run-ci.sh in each subdirectory where a tool owner
> could configure it to setup their env and run their tests? Most of the=

> tools are python, is there a python CI framework we should look at?
> Maybe easier to have a master script from the root dir that runs all
> CI for all tools? Just throwing some thoughts out.

The run-ci.sh approach might not be too bad - that way the jankins
job can just run a `find . -name run-ci.sh -exec \{\}\;`, which feels
kinda horrific but doesn't need much in the way of maintenance.

Andrew
