Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4461155CA
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 17:52:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TzCl6ddhzDqfY
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 03:52:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.59; helo=sender4-of-o59.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="jenIJHF/";
 dkim-atps=neutral
Received: from sender4-of-o59.zoho.com (sender4-of-o59.zoho.com
 [136.143.188.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TzBy04qJzDqRC
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 03:51:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1575651108; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QANboQmedujo4umcV5Ui8wYFfqkz5uvJzLTFJKHV0gRyiTIF+4+29Y6KWjkOQdtJ2EvOBcBEyhVHpQBJ98uDgNIIie+QcZVGunJQ7aRlhJN5gC0JSR6OSYd6H8b0K/XJBZ8LCIgeV/XV4ZsI8ZfHur/PiZgjfa1vPOQ9ks8WsoI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1575651108;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=xK5MyfnQuSZ1oDKBENhBHGIFLfnnxw9CaT0Y/0xAN30=; 
 b=EBsYnTJaaOcmaeSVk9mp74B8p1aQNZw2mp25Us36WcTXwcK6aOUau6RuOwzCChZgJBSUJ7S+l1+2BNXnc4aJ8BKq4iW+f+CxfVV5JHb9KbZIH8V+sRotaQL6AYsYbahG4caNlJMlBgBKW7N9TtTK3JHmQ06v8PQFulErISwMhyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1575651108; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=xK5MyfnQuSZ1oDKBENhBHGIFLfnnxw9CaT0Y/0xAN30=;
 b=jenIJHF/eLlIH594mH5iKKkbpH6Wjm2DySjx2bLb20WOmz3Vy6OJT63EZywzZ8eK
 aeHuv1/JrRAK1pYqJdzjGQojfx9ROnc2QhLkzrQxQvazG08f9C+TW4KwKtseBaIumbX
 6y+1/PheNPscxY+ATdvGlh40rysi5hAbOjoRz+2g=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 1575651106810554.794342031836;
 Fri, 6 Dec 2019 08:51:46 -0800 (PST)
Date: Fri, 6 Dec 2019 10:51:44 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: krtaylor <kurt.r.taylor@gmail.com>
Subject: Re: OpenBMC Project metrics
Message-ID: <20191206165144.GA48825@patrickw3-mbp>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2019 at 07:33:26AM -0600, krtaylor wrote:
> On 12/4/19 4:33 PM, Andrew Jeffery wrote:
> > On Thu, 5 Dec 2019, at 05:14, Kurt Taylor wrote:
> > >=20
> > > NOTE: these metrics should be used *very carefully*. They do not
> > > represent the total contributions to the project. We value
> > > contributions many that do not show up in these charts, including
> > > reviews, mail list involvement, IRC involvement, etc.
> >=20
> > Given all the caveats and the lopsided view the graphs display, what
> > are we trying to achieve by graphing the metric of commits per company?
>=20
> "What gets measured, gets managed" I am a firm believer of this simple
> quote. Measuring a project always improves it. That, and I have been asked
> to start gathering metrics from several of our contributing companies. Th=
ey
> appreciate it.

I recognize some other projects publish statistics like this and it is
all publicly available information but I personally have slight
apprehension about this data.  This project is no where as mature as the
Linux kernel and the data is highly skewed towards one company.  I have
some concern that this data could be used for political purposes, both
externally in community interaction and internally to member companies
w.r.t. their decisions on future involvement.

The data is public (from Gerrit), no doubt about it, but I think it is
reasonable to question if it is a net-positive or net-negative for the
community to gather the data and put it on Github, to put it on Github
and advertise it, or to put it on Github and the advertisement coming from
the Community Manager.  (ie. there is a spectrum of possible ways to
deal with this data with different pros/cons)

> "Measuring a project always improves it."

Maybe a first step here is answering what is the desired change by
publishing this data?  And who's desire is it?  That isn't obvious to me.

> > It's also not clear to me what the inputs to these graphs are, for inst=
ance
> > whether changes to Linux, u-boot, qemu or other major projects that we
> > consume and contribute to are included or whether it's just repositories
> > under the openbmc org on github. If we're excluding upstream projects,
> > why?
>=20
> It is only for contributions under openbmc. Other projects have been
> excluded simply because they have their own project metrics. For example:

The commit-count-from-Gerrit approach is slightly disappointing to me for
two reasons:

    1. Commit count does little to assess the impact of the
       contribution.  Ex. a one-line recipe update to add a dependency
       counts the same as a feature.

    2. There are significant contributions on the kernel side done by
       and pretty much exclusively for this project.  The effort
       involved with getting kernel patches upstream is at least an
       order of magnitude higher than userspace changes (see also
       "impact").

> > Where are the scripts to reproduce the graphs? Can you contribute them
> > to openbmc-tools?
>=20
> Eventually yes, if my employer will let me do more upstream. :) But, the
> data is publicly available, you can get it yourself from gerrit. Simply go
> to our gerrit dashboard and search something like: " status:merged AND
> after:<date> AND before:<date> AND NOT topic:autobump AND owner:<gerrit i=
d>
> "

One aspect that isn't immediately obvious, since it isn't available via
source code, is how you've done the company assignment.  I suspect the
ones for your employer are correct but for other companies there might be
mistakes or oversights when people are using personal email addresses.

I think this concern also ties into the ask a month ago with the
"computer readable CLA database."  If we had a CLA database and this
tool used it, we would have one place to audit for correctness.

--=20
Patrick Williams

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl3qhxwACgkQqwNHzC0A
wRlpng/+LPBf6uXsh8zum/7rds1RrfKaJqztaAzeax0pgCx2LdHK7qnvs/2JuMAq
oWIuOOdN88IpZPHcRJiH8CA8Mmu5BHFNLRyJNJNZx++8P66GfR1qAUMrbad68JOt
0IwCY8t9VQCaHz7zamQC0YmE50LnH7xb+lZ3FHhVtib9hpHQkQUF7lTiKjh5sKdt
H5TAl67XixxMi6A1/4xF+1ScQq5l4f8i0/01fAQUGxu/mJz4/1uoIN6WFupGaLuA
gaq4gCY7x99qkPohypmq4dYQGTcdxCbbFwXgM8XDD6+vpRNaIuG7FjHC/B/SPIU4
DL6gvqiGhZ/TFrTbuIACTSTZYCwGEzN9rK+aOmjAJF+StcEFYtCj8uoXbEUcPZbx
tQkbq7CEPbsdZRgU5Hnend8DrS+54mGJew0Q8pYjubaCFNWwSqK6Y36VauohfdLB
Qq+vRUPLkThSit0w+UvEzXegDhprUwMXWwhL2L7ltF0+Wi9epgwuACOiiDNwMSsD
ZEvvPKD4JBZLs34p8FGh1vSBEsh+Pagx9grYlpdDp30wWq9yDPft0o+ux0JuvNY7
btfnqc23/RaTlSh4hfIWK5ayd+Tqo5cHTCGdSoJe7uxCmsfNYLoBdFuuGhzVMdqS
+4pAuRS8P0rsshiOsmyyXmxATOHa9W1Zgnq0jkYqQZbSdxvMobE=
=49DC
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--

