Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E508497B6A0
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 03:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7hQY278Hz3c5J
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 11:49:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726624144;
	cv=none; b=CRIpdYGVr+2KJ90xvbIGuBts6//hJa42YFKKmAqb0QycsKh2Rogof3UZ/Q4Sl9zs2gKgLuB+Q7fC3NWNyIFs5tQ2Pu3ZhHLJGCKw+IVZx1g14icarRhYhfQFbYUdRoZLyctaX75XXJGgcUJCJIPeuHVEu5g4LS6j65SSlp7+5r5YVuP++n431tOPBBatFBlLJ479F0QRAuR4CDwOLMQ0H3bMALerUngJnMv1x5DgStw1G+KlwzPIytSXDvyS4ewHkSH8RgrFTXdpdrXt4KgHEr3EUg90DI7K3Mii8KdksVkhKYYxv3DJ/M1FMkI2nqOcQQsePJ0lTUPluQ7TqeRUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726624144; c=relaxed/relaxed;
	bh=cROfsLIDpXOOEKD9DQAEpTEJDyb8AXKB8BV2bE/Fgx4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZkydCL1fBkqj4QK3oB2EDxpdbGgM6sioR125uRtz+V3Le5aUs2j64RfO8pEiP1X/wTM4tVVP4E8u5e9vV0LBlJF5bkOIeYk+P4TcUMYUWzh98GzuWQNU35lGwu3FNiNzNkGTht2Lun9L7P+StF4Y08fe3i+EAqToAcSfpj7jtIO+bJWejsIm8MZdxQOuo/uYME8nJDI/lxLLGLU5mRwC5MXxKXLfcajw2UNaQpJnV49ZshdyQDz2ZTxW8p/6h8BIip9ZdqhRR51XRgH3/X9K+RJkpgvJvKAKWSHeSA7iBFhM7oxyjVUMVsu5vtLqG8NKeNIGgp6ebnDavYrohfA6qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lUXO54YU; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lUXO54YU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7hQS2Bd8z2xJF
	for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 11:49:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726624142;
	bh=cROfsLIDpXOOEKD9DQAEpTEJDyb8AXKB8BV2bE/Fgx4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lUXO54YU5UYE1r6CrAHKR7H5cJO0Kt89em8J8ReZbdQd0p0hkT2y69L5+h16TrlIE
	 qjdz1n0suxmyexyFnmkFzo0045a/SkWCgyPHG1HHHOSpcbxR+gvuQbTv/2fcQ+VvZi
	 ILG1G9n7GRD07HkvSiUi0r5ik1Of0UnckDYWofpfxvnEU5/9l0/0hidQnv4ZiAo1YM
	 VjffUw7oys0bzmaLk2mTTFae7ZBXnak61hyTkhVMMOOcpbwm/CwGFE2GvPqVu3UeXp
	 BOriifJafYJ6SRFnwGeJkRoa6eNDvgbfaIC2PcNP2idz8v9qbwdmz1pkVoqb4Ibo3a
	 nzLUj79fFeVVA==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 09BA56506F;
	Wed, 18 Sep 2024 09:49:01 +0800 (AWST)
Message-ID: <5bddcdb13047287a97497fb9cae1f1bda90c4626.camel@codeconstruct.com.au>
Subject: Re: Improving people's experience with technical engagement in
 OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Johannes Truschnigg <johannes@truschnigg.info>
Date: Wed, 18 Sep 2024 11:19:01 +0930
In-Reply-To: <Zuna5z8b8zQzVXT1@vault.lan>
References: 	<0a691364b0d01644c9ca6dfee4b76e69106650d2.camel@codeconstruct.com.au>
	 <Zuna5z8b8zQzVXT1@vault.lan>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-09-17 at 21:39 +0200, Johannes Truschnigg wrote:
> Hi Andrew,
> hi list,
>=20
> I hope it's OK for me - an outsider, a private individual, and an amateur
> hobbyist - to comment and try to contribute to your thread.
>=20

Oh, please don't consider yourself an outsider :)

>  For better or
> worse, I might be able to offer a perspective that is (I think) somewhat
> different from what most people concerned with OpenBMC perceive and exper=
ienced
> when starting to concern themselves with the project and its intricacies.
>=20
> A little background info on my (admittedly very limited so far) involveme=
nt
> with OpenBMC is probably needed, so that you can better make sense of my =
input.
>=20
> I started looking into the project in detail around May this year, becaus=
e I
> had bought a "prosumer" mainboard from Gigabyte (the MC12-LE0) with an
> AST2500-based BMC, and the AMI-supplied BMC firmware seemed a bit half-ba=
ked
> and definitely far too proprietary for my FOSS-loving tastes. Since I'd b=
een
> using OpenWrt on my networking gear for more than a decade, I had (incorr=
ectly,
> I know ;)) assumed that OpenBMC was kind of a similar endeavor, but for B=
MCs
> instead of for routers et al.

Well, from a pretty zoomed-out perspective, perhaps it is. But I think
the details differ quite a bit, not the least the complexity of things
to which the BMC is attached, setting aside OpenBMC's implementation
complexities.

>=20
> In my day job, I am what people these days call SRE, but I've started out=
 as a
> humble sysop nearly 20 years ago. I've been using BMCs in all their
> incarnations and from different vendors since the early 2000s, but I had =
little
> idea what makes them tick on the BMC's side. (I've always been an avid fa=
n of
> `ipmitool`, and had some ideas about what was going when I used it to mak=
e a
> lanplus connection, but what kind of magic made the host and the BMC inte=
ract
> the way they did and do has always been a mystery to me). Also, I have
> basically zero background knowledge in embedded devices (apart from using
> OpenWrt and some userspace-only development targeting it), and a far too =
feeble
> understanding of all things electronics to be any less than a considerabl=
e
> danger for any ICs on which I bring my multimeter to bear.

Relatable.

> All I got going for
> me in this was an above-average understanding of the Linux (and even ther=
e,
> mostly userspace) software side of things - in other words, really not mu=
ch of
> relevance for what I was about to try. I am rather sure it is not really
> representative of OpenBMC's target group for technical engagement :)

I think that if you're playing with it at all you're the target group,
so don't discount yourself too quickly.

>=20
> Several months later, I've now had chances to dip my toes into the offici=
al
> OpenBMC mailing lists, had some friendly email conversations with subscri=
bers
> both on- and off-list, and interacted with OpenBMC-involved individuals (=
such as
> you, btw!) on Github issues. I have to say, the social experience has bee=
n
> absolutely stellar - the people involved are so very friendly, willing to=
 help
> and welcoming that all these interactions have been an absolute delight!

Thanks for sharing that.

>=20
>=20
> What I've had trouble with is... well, the more technical side of things.=
..
>=20
> I had quickly discovered the openbmc/docs repo and read through most of i=
ts
> contents, but I mostly felt overwhelmed by most parts during my irregular
> evening lecture.
>=20
> There are some commendable and promising documents in there that,
> unfortunately, don't always push as far as it's needed (for me, personall=
y) to
> connect all the oh so many dots - for instance, the glossary.md document[=
0].
> It's great that it's there, and it explains a number of acronyms and conc=
epts
> that are crucial to have heard of, but I think it could and should be sev=
eral
> times as long as it is! ;) If the OpenBMC community could come together a=
nd
> extend that document (and other resources similar in spirit) by as much a=
s
> possible/feasible, the next person like me - with mostly a severe lack of
> relevant background - would have a much easier time becoming somewhat
> productive with this whole BMC-understanding and eventually -crafting aff=
air, I
> think.

Okay, that's a good practical suggestion.

>=20
> A few weeks after I had started looking at OpenBMC, I somehow managed to
> stumble over the youtube-hosted recordings[1] of a number of OpenBMC-rela=
ted
> presentations that were given during the earlier days of the Covid19 pand=
emic,
> and that stuff helped me understand a *lot* of things a *lot* more clearl=
y. I
> think it would be amazing if that series could be extended upon, but I th=
ink it
> also really just needs to be more prominently featured in the docs/on the
> project site so that it's not like the twenty-third, but second or maybe =
even
> first thing to find when just starting out.

Ah, I'd forgotten about the youtube series. Great to hear that it was
helpful, I'll try to work a link to that into the documentation.

>=20
> More "OpenBMC - The Big Picture (for the Uninitiated)"-content - be it wr=
itten
> prose or video (or, ideally, both) would certainly be great to have. I th=
ink a
> kind of "OpenBMC Tech Tree", where both mandatory and optional components=
 for
> the operations of a BMC system, are presented and explained on a high-ish
> level, with included (lists of) available implementations in OpenBMC woul=
d make
> for a terrific "map" to have handy, because it's very easy to get lost in=
 the
> woods without.
>=20
> And finally, these days, after I've been toiling away for months during t=
he
> evenings at my still-secret git branch that shall one fine day make the
> MC12-LE0 a fully-featured OpenBMC board, I find myself wishing for two th=
ings
> quite often:
>=20
> 1.) For each project/software artifact under the OpenBMC umbrella to have=
 an
> up-to-date, (at least) top-level README.md that explains what the thing I=
 am
> looking at is about and useful for, and ...

Ideally, yeah. This needs some maintainer action, I suspect. I don't
think it's feasible to have one person go around and update all the
READMEs. But following from that, we have to motivate maintainers to do
the work.

Maybe this discussion is a bit of a nudge.

>=20
> 2.) (if possible, without breaking backwards compatibility) to have all
> executables built by OpenBMC conform to basic getopt(3)/getopt_long(3)
> conventions when invoked with (e.g.) `--help` and/or `--version` on the
> argument vector, and give me glimpse at their purpose without having to l=
ook at
> the source. I realize that this might sound a bit silly, but it would hel=
p me
> very much when doing triage, and deciding on which kind of failing/non-wo=
rking
> service to focus on first.

Ah, we're trying for consistency there, but there's some historical
baggage. At least, we have the following:

 * https://github.com/openbmc/docs/blob/master/anti-patterns.md#custom-
   argumentparser-object
 * https://github.com/openbmc/docs/blob/master/anti-patterns.md#non-
   standard-debug-application-options-and-logging

Maybe something further for adding `--help` and `--version` is
warranted (though `--version` might not be super helpful with the way
the project currently approaches versioning things).
>=20
>=20
> In closing, to extend your list of "personality profiles"/perspectives ne=
ar the
> end of your message with another possible kind, I will put forward this a=
ttempt
> at a definition/characterization of myself in regard to my interest in Op=
enBMC:
>=20
>  6. I'm not affiliated with any corporate or commercial entity, and would
>  like to help make use of OpenBMC on COTS hardware that is capable of
>  running OpenBMC, but effectively cannot run it yet.

We had a suggestion on Discord for a "enthusiast" category, so you're
not the only one thinking along those lines:

https://discord.com/channels/775381525260664832/867820390406422538/12852347=
49979230259

>=20
>=20
> If you think that's a perspective worth taking into account (and I could
> totally understand if that weren't the case - I get that it's kind of an
> outlier, esp. given the project's obvious industry/corporate focus), I th=
ink my
> wishlist would go a long way in meeting that demographic's (maybe not eve=
n
> overly specific) needs.

My main trouble with it was figuring out how to narrow down the
documentation to link to for this category. I didn't immediately come
up with any ideas, all of it seems kinda hard to exclude for this case.
Do you have any thoughts?

Andrew
