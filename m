Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B076E3E0AF5
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 01:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg7jR4nlDz3cQq
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 09:48:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=E/Fyx+nv;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EI7U6CKs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=E/Fyx+nv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EI7U6CKs; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg7j76mc6z2yY7
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 09:48:11 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A12AE3200953;
 Wed,  4 Aug 2021 19:48:06 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Wed, 04 Aug 2021 19:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=oZA0o
 ExeLWrI3ZJ6r2bPQnMcc9+byK7RDOYm23E3Fc4=; b=E/Fyx+nvIya+DAA+wfIKa
 Bz7AVEKcV4PRbI4YIIKUGmRwxyM7dUcm1dul5s7ydlgl0suR0Z1qNqbH5EX1rCIs
 xxyEqzv1lzQk59PJMbsFjzIAwACm7s7Hz/AAbkLDQU2VnzCjQ7NGKksrzF3Xab07
 ulyhEUo+TgU2Jjlu174kXSJQQnChpPkhrPhvezPiIfktvz7sNUDtOqKh9zxTQsmR
 1C4kGkWXa3lNBDvuyccmaysT27J6K+pKkd/ILqKmeanZa28LypO4Ps/ioapnQnky
 EnZRew2GhlAPL8V6q9ndm9D6JvMCHmz3w69MUxHs04rsij7tL8c/WJ4C+EYX50Aw
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=oZA0oExeLWrI3ZJ6r2bPQnMcc9+byK7RDOYm23E3F
 c4=; b=EI7U6CKsElbYCcHYkY1nMDPnmFParX7p8d5Q8BPjFRC8RWV+v5s+eK/Sm
 QX5z3BpPMQPkr1H5j3PNoIf0PS936f0oihmGUf2Osjx3qrhVch5kpHUsymGVsJGq
 plrp4WQvDsgc7poMfb9nLhu/iqLcvU4243HbHaWMDZx0ujddbYDWkH5NSYPiYI9n
 ZvacUIPti+ZEv5hZfuGTvJuhQLCQ7NmtcT0xPY/iVMEIBZB0qiTaZOzKxyZU7Qmc
 YQbmjqQ1QhDkk/cK4PtZ06EkbjvMgYHHa/akBQxPR/sKuYyiAojXb28/qGmngWKF
 xVRsZCvpmC7ljUUyxbuOWf08+ka9w==
X-ME-Sender: <xms:NScLYaHU2C6r4O_bprv5JssL42ajAf3KKTCfRfNxKc-G_saguwUsGQ>
 <xme:NScLYbVKvas3_z8kKPgMHNEHVtiKzDt_BHaj_ES9xFZMaPY8LX987nLJKxUnOHRsX
 Ha31OEm5gUW-3KM1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepheethefghfevheevgfektddvtddvjeetgfevudfhheeghfffffdukeel
 leevjedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:NScLYULF8_wHNG9HjfPDfCVewaDiMhk1gieEygfIKwmDJa3ig3iMwg>
 <xmx:NScLYUG1vxB2F56CT6VQKIo9NhS77wM4AKXtRfFRir31dm9TWFZtRg>
 <xmx:NScLYQVXqBDmS9tkqLkZpBYbyCFur82njQ44l9rnZFQ8Rbd2nW543Q>
 <xmx:NicLYbfHBee1iKW9OpL7sgsRnMpnPI59A_6stbDIEbcOaSmMTU2GEA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2F770AC0DD0; Wed,  4 Aug 2021 19:48:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <6aa885f5-6870-4ca7-b5b5-cfc9568f1f96@www.fastmail.com>
In-Reply-To: <YQr9RWolIR7witlQ@heinlein>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
 <YQr0E+NP+7QKIrf1@heinlein>
 <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
 <YQr9RWolIR7witlQ@heinlein>
Date: Thu, 05 Aug 2021 09:17:44 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 5 Aug 2021, at 06:19, Patrick Williams wrote:
> On Wed, Aug 04, 2021 at 03:39:45PM -0500, Joseph Reynolds wrote:
> > On 8/4/21 3:09 PM, Patrick Williams wrote:
> > > On Wed, Aug 04, 2021 at 01:47:31PM -0500, Joseph Reynolds wrote:
> > >  =20
> > >> 4 Surya set up a bugzilla within Intel and will administer it.=C2=
=A0 Demo=E2=80=99d
> > >> the database. We briefly examined the database fields and agreed =
it
> > >> looks like a good start.
> > >>
> > > Once again I'll ask ***WHY***??!?
> > >
> > > https://lore.kernel.org/openbmc/YNzsE1ipYQR7yfDq@heinlein/
> > > https://lore.kernel.org/openbmc/YPiK8xqFPJFZDa1+@heinlein/
> > >
> > > Can we please create a private Github repository and be done with =
this topic?
> >=20
> > I don't have any insight into how to resolve this question.
> >=20
> >  From today's meeting: using bugzilla has advantages over github iss=
ues:
> > - lets us define the fields we need: fix commitID, CVSS score, etc.
>=20
> These are pretty minor when you could just add a comment template with=
 this
> information.
>=20
> > - has desirable access controls, specifically acess by the security=20=

> > respone tram plus we can add access for the problem submitter and th=
e=20
> > problem fixer
>=20
> So does Github.
>=20
> ----
>=20
> I really don't think that some subset of the community should go off o=
n their
> own bug tracking system.=20

+1

I'm not aware of any effort to use Github security advisories so far. I=20=

think we should try that before burdening ourselves and any bug=20
reporters with yet more disjoint bits of infrastructure (we already
have the two mailing lists, discord, gerrit, and github).

Andrew
