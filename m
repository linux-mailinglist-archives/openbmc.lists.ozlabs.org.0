Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6A9269A2
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 22:34:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=f4D0NAI4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDs2d3g0jz3fQl
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2024 06:34:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gmills.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmills.xyz header.i=@gmills.xyz header.a=rsa-sha256 header.s=default header.b=f4D0NAI4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmills.xyz (client-ip=162.0.218.230; helo=h7.fbrelay.privateemail.com; envelope-from=gunnar@gmills.xyz; receiver=lists.ozlabs.org)
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com [162.0.218.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDs261xzQz3cZy
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2024 06:34:05 +1000 (AEST)
Received: from MTA-11-4.privateemail.com (mta-11.privateemail.com [198.54.118.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 1C8716066B
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 16:34:01 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id 1BC3418000BE;
	Wed,  3 Jul 2024 16:33:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gmills.xyz; s=default;
	t=1720038835; bh=R5Iioy16cXaLer+R2DeGeNzQTryXF4kxxAWZRmz1VQY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=f4D0NAI4ufryoJ6bdj+TEsDxjOtVPruEptE7VjUafYT0wAoIbDycHNRh7MHVTPzrx
	 3nd77VcGehmx5AXUU20uYGF6cP6AIRRTebSumJsbdeBGjltuoa/zwoUg9VJ0kr/i5r
	 xYBoIAa1LpAq1rDhF+PMk4O/4cJAquF+xkm7ZLd17X9grNGeAYoHO6HXuSDNtbjrdr
	 hLHx5QiSicxN7dhorbjBBmGOTlnvfInC5kzZm06hko/9xZ7AULw5DpL2m666+TliqQ
	 akJsEcqH9mXUtFRXALE6CXgaAL8JAQDUvfP9SkYoO1bjszGX7Le6fOh+rx/3INu7TK
	 dyIkHUdXx1ICg==
Received: from APP-19 (unknown [10.50.14.243])
	by mta-11.privateemail.com (Postfix) with ESMTPA;
	Wed,  3 Jul 2024 16:33:47 -0400 (EDT)
Date: Wed, 3 Jul 2024 14:33:47 -0600 (MDT)
From: Gunnar M <gunnar@gmills.xyz>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ed Tanous <ed@tanous.net>,
	Patrick Williams <patrick@stwcx.xyz>
Message-ID: <407562382.874833.1720038827793@privateemail.com>
In-Reply-To: <71b057e4f5584cb3e7cc8a256a3019000a5c10af.camel@codeconstruct.com.au>
References: <1403524602.354586.1719434789488@privateemail.com>
 <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
 <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
 <ZnyR5Rw2Zx5I5elg@heinlein.vulture-banana.ts.net>
 <CACWQX81ThWsrObQ1Ob5WV_BX0i3MwtrvAMe2ocrRuOiLmpHeqw@mail.gmail.com>
 <71b057e4f5584cb3e7cc8a256a3019000a5c10af.camel@codeconstruct.com.au>
Subject: Re: Request for a new vue3 branch in webui-vue
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.6-Rev65
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: "sivaprabug@ami.com" <sivaprabug@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, "kirankumarb@ami.com" <kirankumarb@ami.com>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On 06/26/2024 7:06 PM MDT Andrew Jeffery <andrew@codeconstruct.com.au> wr=
ote:
>=20
> =20
> On Wed, 2024-06-26 at 15:24 -0700, Ed Tanous wrote:
> > On Wed, Jun 26, 2024 at 3:10=E2=80=AFPM Patrick Williams <patrick@stwcx=
.xyz> wrote:
> > >=20
> > > On Wed, Jun 26, 2024 at 02:57:25PM -0700, Ed Tanous wrote:
> > > > On Wed, Jun 26, 2024 at 2:40=E2=80=AFPM Patrick Williams <patrick@s=
twcx.xyz> wrote:
> > > > >=20
> > > > > On Wed, Jun 26, 2024 at 02:46:29PM -0600, Gunnar M wrote:
> > > > > > Kiran and his team have volunteered to sync patches merged to m=
aster to this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migra=
tion to Vue 3 is complete, and all commits are synced over, this 'vue3' bra=
nch will become the 'master' branch.
> > > > >=20
> > > > > We need to be careful about how we do this.  You don't want it to=
 appear
> > > > > on github as a rewrite of the "master" branch and we absolutely n=
eed to
> > > > > at least keep the vue2 code in some branch so that it doesn't get=
 pruned
> > > > > from the github history.  If we don't do this, it will become imp=
ossible
> > > > > for people to build older OpenBMC releases.
> > > > >=20
> > > > > I would suggest either:
> > > > >=20
> > > > >     a. We do the opposite: create a 'vue2' branch and update the =
recipe
> > > > >        to point at it.
> > > > >=20
> > > > >     b. We use this as an opportunity to migrate from 'master' to =
'main'
> > > > >        and use 'main' as the vue3 branch.
> > > >=20
> > > >=20
> > > > My expectation was that this branch continues to rebase in patches,
> > > > and once ready to merge, we would just rebase the series on top of
> > > > master before pushing it so there's no discontinuity, no merge comm=
it,
> > > > and autobump would just pick it up.
> > >=20
> > > We would have to give "Kiran and his team" permissions in Gerrit to
> > > force-push to the "vue3" branch in order to facilitate these rebases.
> >=20
> > Sorry, I should've said "My expectation was that this branch continues
> > to cherry-pick in patches"
> >=20
> > There'd only be one rebase and push (not force I think?), right at the
> > end,=20
>=20
> You don't have to rebase either. Another option is to use `git merge -s
> ours` to join the branch histories but set the tree state in favour of
> one side.
>=20

Does `git merge -s ours` work? And then go with a new `vue3` branch?=20

If not, I am okay with using this as an opportunity to migrate from 'master=
' to 'main'. It is just a bit unexpected. If we go that route, we can add s=
ome temporary documentation.

I was thinking Kiran and team would cherry-pick patches merged to 'master' =
and push them to the 'vue3' branch, leaving the original author's signed-of=
f, etc. I wasn't thinking any special permissions would be needed until "me=
rging" the branches at the end.=20

Thanks,
Gunnar
