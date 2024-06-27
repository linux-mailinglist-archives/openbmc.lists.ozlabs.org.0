Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8E919CD7
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 03:07:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=btb2viHd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8gQq4bKHz79wt
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 11:07:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=btb2viHd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8gQH3LM1z79tg
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 11:07:02 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 8EC6A200DB;
	Thu, 27 Jun 2024 09:07:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719450422;
	bh=MWbuELD45Um+0FDT1HX33tsAV/nGekM17pkDrQgEvzU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=btb2viHdzs8AAxJS9swbMvOrkVjKnWaVvQ1Yh8bcdQ+ZYfO0ZAxSbSgL2C4G/i4FP
	 tAc6rv3oe6KqrADDzW/FX6+mKaxvJcq2iVmn8GPba1BNrvsz0efsGha7GDHjbdaCkw
	 5owmVtHTnwf/7Qsz1PNfOu3CwoCU313AW4aLBzVdyoqcMdqnVc2LWQiOy3JeMj96gG
	 6xuZ7XuMROePKFb887By/asqr3PEqYJPVBF+m7c9SReHWV43Npij0baCuPs6OAEGV6
	 cw1qG6DeurPJ7LcFh1IGKlVFrMjyEIoDnc58r7QQ3npNKMmU/zGsXgyB4y79VIFuYC
	 8AXpOdk3OCz0A==
Message-ID: <71b057e4f5584cb3e7cc8a256a3019000a5c10af.camel@codeconstruct.com.au>
Subject: Re: Request for a new vue3 branch in webui-vue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ed Tanous <ed@tanous.net>, Patrick Williams <patrick@stwcx.xyz>
Date: Thu, 27 Jun 2024 10:36:57 +0930
In-Reply-To: <CACWQX81ThWsrObQ1Ob5WV_BX0i3MwtrvAMe2ocrRuOiLmpHeqw@mail.gmail.com>
References: <1403524602.354586.1719434789488@privateemail.com>
	 <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
	 <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
	 <ZnyR5Rw2Zx5I5elg@heinlein.vulture-banana.ts.net>
	 <CACWQX81ThWsrObQ1Ob5WV_BX0i3MwtrvAMe2ocrRuOiLmpHeqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: "kirankumarb@ami.com" <kirankumarb@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, Gunnar M <gunnar@gmills.xyz>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>, "sivaprabug@ami.com" <sivaprabug@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-06-26 at 15:24 -0700, Ed Tanous wrote:
> On Wed, Jun 26, 2024 at 3:10=E2=80=AFPM Patrick Williams <patrick@stwcx.x=
yz> wrote:
> >=20
> > On Wed, Jun 26, 2024 at 02:57:25PM -0700, Ed Tanous wrote:
> > > On Wed, Jun 26, 2024 at 2:40=E2=80=AFPM Patrick Williams <patrick@stw=
cx.xyz> wrote:
> > > >=20
> > > > On Wed, Jun 26, 2024 at 02:46:29PM -0600, Gunnar M wrote:
> > > > > Kiran and his team have volunteered to sync patches merged to mas=
ter to this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migrati=
on to Vue 3 is complete, and all commits are synced over, this 'vue3' branc=
h will become the 'master' branch.
> > > >=20
> > > > We need to be careful about how we do this.  You don't want it to a=
ppear
> > > > on github as a rewrite of the "master" branch and we absolutely nee=
d to
> > > > at least keep the vue2 code in some branch so that it doesn't get p=
runed
> > > > from the github history.  If we don't do this, it will become impos=
sible
> > > > for people to build older OpenBMC releases.
> > > >=20
> > > > I would suggest either:
> > > >=20
> > > >     a. We do the opposite: create a 'vue2' branch and update the re=
cipe
> > > >        to point at it.
> > > >=20
> > > >     b. We use this as an opportunity to migrate from 'master' to 'm=
ain'
> > > >        and use 'main' as the vue3 branch.
> > >=20
> > >=20
> > > My expectation was that this branch continues to rebase in patches,
> > > and once ready to merge, we would just rebase the series on top of
> > > master before pushing it so there's no discontinuity, no merge commit=
,
> > > and autobump would just pick it up.
> >=20
> > We would have to give "Kiran and his team" permissions in Gerrit to
> > force-push to the "vue3" branch in order to facilitate these rebases.
>=20
> Sorry, I should've said "My expectation was that this branch continues
> to cherry-pick in patches"
>=20
> There'd only be one rebase and push (not force I think?), right at the
> end,=20

You don't have to rebase either. Another option is to use `git merge -s
ours` to join the branch histories but set the tree state in favour of
one side.

I have been doing this with our qemu fork:

https://amboar.github.io/notes/2021/09/16/history-preserving-fork-maintenan=
ce-with-git.html

Andrew
