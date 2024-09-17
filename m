Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A27297B464
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 21:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7XD53H79z3c5s
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 05:39:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=89.163.150.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726601968;
	cv=none; b=LneRcLO7aDXu/b0p40YjtW2/hdXjoVbCqkdgyAF9s++WQfKUi08xYcfu4AH1bhE6G4pJMOeWURs9WxTioaxjrnE1lf+g1Os6yjost+i/Yo8sSPHk0oXR21KeAqo4nyhCZTf/2mTgE1/6kCsDJ2LZjk+NGT9RBCph10qlVxFUNsKy9p7fK3qAB9NV0GWEzd3sNAel1ovxzouNuN5YGuuyE4M12ezaQz5a8AOlMVESCfOHiNNvCzK9va1f8ZS0Yfz0tAxnR9UB/eV57sI/E1k9zV8OwkG+5+GxbvfGxLw1FqzV6dwz/7gki2sA3CHHi2Jybs3ciGWViiB9c1AaxTqxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726601968; c=relaxed/relaxed;
	bh=cvnaFtmoW4oLmTzrD9eGkO3lofY2BHX1AuX9Zq2rARQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbrHUaObRzyHDXI8xLvIMCgA/owD/GtXOo2uIK2OaBrotJz5J6Dg8f0bvsdZB41BbETkSG0yMJe9fvandNwnDIsiEEzSRWSNkJWMw9q3Rbqbhl9N/NCwmCyhVJA+gPHM0J3Fh4V5GdNklSSm+u7dGsx8ApxHzbUWSqBhbuFjfZ+9a2vsG1/pYkp09WvWewZczYCe9wnYxJfttWDFG6VDl3AcIo1yDDRn71HYwcJ4+/7XHWAJ7R5dfphqFgO/VpXX/08cl8RbPZB010sPz3ypN4xniLjZE32NbDdmFw67TxK/uqEfsFEtvskNmMBRuXDwfEB10lLKJb3DI3fQvi6rhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info; dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=nl3UZTY3; dkim-atps=neutral; spf=pass (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org) smtp.mailfrom=truschnigg.info
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=nl3UZTY3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7XCz345Yz2xJ8
	for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 05:39:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1726601961;
	bh=2aYgP+aWwKwMmSIeeY46z/G1OwR4lVoeQXU8WA0M5sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nl3UZTY39pTd5807ye7GWVam6AMr1ugJA6zx0kcVia0VKXgZZU1R5uCkkdQvf9mE+
	 ANrGWuU5pN4UywZ/8tINJDpmSoAHQqjaKhf0OLubT1OGzC7z5WJYJvMqtL/KOxx/zQ
	 uaGzfF9p6XLmmOLfKwzxJmSfuBYuPfnYnNrLKTIPu2Tx0UR1Oz3clek9eqwpOUwVVi
	 rIkX9YkL670YqmEc1EaIpvdrPbRtxDTNgzfdkQ4RL9sHB4QXlvoidncA7SPLYaLe0t
	 T9zmaGUvrvILWeNGrJLS+EiHRVJ6wervZee2dalGX8tollnPQWrMHB+UPB7zVuMi2D
	 tKxyEDz9X9VcQ==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 9916B200C6;
	Tue, 17 Sep 2024 19:39:21 +0000 (UTC)
Date: Tue, 17 Sep 2024 21:39:19 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: Improving people's experience with technical engagement in
 OpenBMC
Message-ID: <Zuna5z8b8zQzVXT1@vault.lan>
References: <0a691364b0d01644c9ca6dfee4b76e69106650d2.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+k4sQKwX9Js9OTC0"
Content-Disposition: inline
In-Reply-To: <0a691364b0d01644c9ca6dfee4b76e69106650d2.camel@codeconstruct.com.au>
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


--+k4sQKwX9Js9OTC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,
hi list,

I hope it's OK for me - an outsider, a private individual, and an amateur
hobbyist - to comment and try to contribute to your thread. For better or
worse, I might be able to offer a perspective that is (I think) somewhat
different from what most people concerned with OpenBMC perceive and experie=
nced
when starting to concern themselves with the project and its intricacies.

A little background info on my (admittedly very limited so far) involvement
with OpenBMC is probably needed, so that you can better make sense of my in=
put.

I started looking into the project in detail around May this year, because I
had bought a "prosumer" mainboard from Gigabyte (the MC12-LE0) with an
AST2500-based BMC, and the AMI-supplied BMC firmware seemed a bit half-baked
and definitely far too proprietary for my FOSS-loving tastes. Since I'd been
using OpenWrt on my networking gear for more than a decade, I had (incorrec=
tly,
I know ;)) assumed that OpenBMC was kind of a similar endeavor, but for BMCs
instead of for routers et al.

In my day job, I am what people these days call SRE, but I've started out a=
s a
humble sysop nearly 20 years ago. I've been using BMCs in all their
incarnations and from different vendors since the early 2000s, but I had li=
ttle
idea what makes them tick on the BMC's side. (I've always been an avid fan =
of
`ipmitool`, and had some ideas about what was going when I used it to make a
lanplus connection, but what kind of magic made the host and the BMC intera=
ct
the way they did and do has always been a mystery to me). Also, I have
basically zero background knowledge in embedded devices (apart from using
OpenWrt and some userspace-only development targeting it), and a far too fe=
eble
understanding of all things electronics to be any less than a considerable
danger for any ICs on which I bring my multimeter to bear. All I got going =
for
me in this was an above-average understanding of the Linux (and even there,
mostly userspace) software side of things - in other words, really not much=
 of
relevance for what I was about to try. I am rather sure it is not really
representative of OpenBMC's target group for technical engagement :)

Several months later, I've now had chances to dip my toes into the official
OpenBMC mailing lists, had some friendly email conversations with subscribe=
rs
both on- and off-list, and interacted with OpenBMC-involved individuals (su=
ch as
you, btw!) on Github issues. I have to say, the social experience has been
absolutely stellar - the people involved are so very friendly, willing to h=
elp
and welcoming that all these interactions have been an absolute delight!


What I've had trouble with is... well, the more technical side of things...

I had quickly discovered the openbmc/docs repo and read through most of its
contents, but I mostly felt overwhelmed by most parts during my irregular
evening lecture.

There are some commendable and promising documents in there that,
unfortunately, don't always push as far as it's needed (for me, personally)=
 to
connect all the oh so many dots - for instance, the glossary.md document[0].
It's great that it's there, and it explains a number of acronyms and concep=
ts
that are crucial to have heard of, but I think it could and should be sever=
al
times as long as it is! ;) If the OpenBMC community could come together and
extend that document (and other resources similar in spirit) by as much as
possible/feasible, the next person like me - with mostly a severe lack of
relevant background - would have a much easier time becoming somewhat
productive with this whole BMC-understanding and eventually -crafting affai=
r, I
think.

A few weeks after I had started looking at OpenBMC, I somehow managed to
stumble over the youtube-hosted recordings[1] of a number of OpenBMC-related
presentations that were given during the earlier days of the Covid19 pandem=
ic,
and that stuff helped me understand a *lot* of things a *lot* more clearly.=
 I
think it would be amazing if that series could be extended upon, but I thin=
k it
also really just needs to be more prominently featured in the docs/on the
project site so that it's not like the twenty-third, but second or maybe ev=
en
first thing to find when just starting out.

More "OpenBMC - The Big Picture (for the Uninitiated)"-content - be it writ=
ten
prose or video (or, ideally, both) would certainly be great to have. I thin=
k a
kind of "OpenBMC Tech Tree", where both mandatory and optional components f=
or
the operations of a BMC system, are presented and explained on a high-ish
level, with included (lists of) available implementations in OpenBMC would =
make
for a terrific "map" to have handy, because it's very easy to get lost in t=
he
woods without.

And finally, these days, after I've been toiling away for months during the
evenings at my still-secret git branch that shall one fine day make the
MC12-LE0 a fully-featured OpenBMC board, I find myself wishing for two thin=
gs
quite often:

1.) For each project/software artifact under the OpenBMC umbrella to have an
up-to-date, (at least) top-level README.md that explains what the thing I am
looking at is about and useful for, and ...

2.) (if possible, without breaking backwards compatibility) to have all
executables built by OpenBMC conform to basic getopt(3)/getopt_long(3)
conventions when invoked with (e.g.) `--help` and/or `--version` on the
argument vector, and give me glimpse at their purpose without having to loo=
k at
the source. I realize that this might sound a bit silly, but it would help =
me
very much when doing triage, and deciding on which kind of failing/non-work=
ing
service to focus on first.


In closing, to extend your list of "personality profiles"/perspectives near=
 the
end of your message with another possible kind, I will put forward this att=
empt
at a definition/characterization of myself in regard to my interest in Open=
BMC:

   6. I'm not affiliated with any corporate or commercial entity, and would
      like to help make use of OpenBMC on COTS hardware that is capable of
      running OpenBMC, but effectively cannot run it yet.


If you think that's a perspective worth taking into account (and I could
totally understand if that weren't the case - I get that it's kind of an
outlier, esp. given the project's obvious industry/corporate focus), I thin=
k my
wishlist would go a long way in meeting that demographic's (maybe not even
overly specific) needs.

Thanks for taking the time to read this far, and have a nice day! =3D)

Johannes

[0]: https://github.com/openbmc/docs/blob/master/glossary.md
[1]: https://www.youtube.com/@openbmc9752

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--+k4sQKwX9Js9OTC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmbp2uIACgkQ95W3jMsY
fLWegRAAhvn8hYlNpEE3LfNvKAoRaIGBQNHvHct578t74pdjXaPu+Is89G41CwfQ
pagk6tu7pyg0zS56bdOX8CzPLs3m4kiBmaNNJSguyBuKxemqNTBOv9YWyz52Erml
dzv6U/V3RwpkW3Cc+OchjqVvZP9eCOaKQFFl5Anrqax5XlV+csnHHdBjliFEqEEw
q+Q31Ihj72cpFb6KmcFFC554nMXXwlMV8T5rcy8wBl5VemBcQ4hghCD1CNNv0yA6
wKHNqooYo02rE+KsXB5Ti3RNqMiZdsrGiiqXtmfjCQV/IeEvkcAud6Mw6JqJZS8S
PcpxbhK0ha7EYR0g8Qzjb3oVlrho7EDV5PI5SMueAiUvGSnUFkHi3UdOX6a49gvT
gABSlH9pax0PsCmOukCYsBW9+KgIwUqYoUOpYv3UAcExkDi57HeLKYlyG28Bs84R
EoLKuQpqxrlgvKxgXV6UfiY/+LLbBTnCKErnczrfGPIGUzVgyJNeUkXyjBzY+uCp
jlEh2YYtH7HiV8If4XzVTvtQPJNHrsKJHKUO+zkIYrR49WTu6ub20G0I2Ff7VFb4
JT59p1/a4PEMoAZOo/t9x6tvrFaOvXfGB/574oOuLhRKrRJZIJugYz9Tydr0Z4V4
MxqLcWSp2scNzQdNab5CpAK1wGbzAWOQ+IEyQdbSTajjUdHY5Tc=
=LXwZ
-----END PGP SIGNATURE-----

--+k4sQKwX9Js9OTC0--
