Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BFE37438E
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 19:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb3mc10ywz309k
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 03:36:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Mzm1yVXA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Hp0/cX+i;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Mzm1yVXA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Hp0/cX+i; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb3mD536gz2ypn
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 03:36:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 522125C012F;
 Wed,  5 May 2021 13:36:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 05 May 2021 13:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=9a9/hPhWprgNn8lR3EwHxNFYTGj
 RFWhoZhT/Xs/5r4w=; b=Mzm1yVXA1Jukh6rURDS2XT1PQ00P2Z+dnpdUtlTC4Ft
 a3WSJ/GTIK+TScFSWZPmRh0EK/agF3OMeSx+L3t3ldHNGLJ2ut8dSnKCJ1gzfOXT
 3hR2Zkqtk9FCsZ5HFCtmk01q3ex8vDdl2bqm7kTwPt+e6cpKiH8zUmo/HFeYuo1v
 PThgqRp//xpwyY2YQowtB0QWXl8vTd1uOcJuOqG8cupBbeUpC67+k+8aywZhj7Pl
 BFZ6C/7u6amjXKyBoGf9ZJ02GySvErK1jzfAHDnLyqrAMvl7nEK5rJcyWQCFuq+B
 NRqfClnLg23XBOkPwY85RKeb8cyoz5IsLQ4NeJDAtIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9a9/hP
 hWprgNn8lR3EwHxNFYTGjRFWhoZhT/Xs/5r4w=; b=Hp0/cX+iToTatxFkVyQF8S
 NrbXxxDvjMZNnmpMi1Ou2EPcfYTaddq4nbUfVwUrKGU+YhB93MtB3r6+j6oGR2eR
 mMHcUPz89Fg0DpfAcNcQQV1l/1tLbpAluXHsx+OV2VefOfexL/e2SHaxjbdrAONf
 sdSnMS1wyi6/Ho7fzfcG2IkdoesYU9dk8FPv+L0cb9fmUVeJFDYxmXN1F8jopfcX
 gbRoEZ/mtblfqBAxl252mcUBzaYngqDhtzircKugwiO+ZVVEm5JZwKET2Q1FEj5e
 hBranyy5pP8FC9Gc621tosd3f/Vf9y0SAvu9ENy/sw47D3aMkgytK5L162562c8Q
 ==
X-ME-Sender: <xms:lteSYL7I3GnCk_Prw4W9ebSXdaAxiFC7MOjRZzU0RoDxFwzcgYMAGQ>
 <xme:lteSYA5JeorCA4NzBd8VuKLNUd6sBT-ADMXI__xQysLJPsyMxAWqYgZ9uhz4F4CWn
 Y6df_UxLqK5KGVVpYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefkedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeufeetveevfedttdefteffveet
 gedtgeeutdevgeeiffehvdeifedtffehkeehhfenucffohhmrghinheprggtmhdrohhrgh
 dpohhpvghntghomhhpuhhtvgdrohhrghdpiigunhgvthdrtghomhdpihgsmhdrtghomhdp
 thhhvghguhgrrhguihgrnhdrtghomhdpihhtrhgvnhgvfidrtghomhdpghhnuhdrohhrgh
 dpfihikhhiphgvughirgdrohhrghdpvghffhdrohhrghenucfkphepjeeirddvhedtrdek
 gedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:lteSYCcH_Ef4mWDWTaHQsNUOihsi6-cOnSH_mKkJ5UjGZN0DUMarQA>
 <xmx:lteSYMKBk8MQzh3ZRy7XPbCBrbaR-R5UYlsSN3EfUpKoQDvpp-B_Cg>
 <xmx:lteSYPJPfuOn0U9-c-KQtSLkLM1KoJS8p92VnOsY5hI_gts2FK1eGA>
 <xmx:l9eSYFhD_C2o0TQsKQMs1ovsjeg39xlXUQwpTGhYgD8FEi4LJMBkEw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed,  5 May 2021 13:36:21 -0400 (EDT)
Date: Wed, 5 May 2021 12:36:20 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: D-bus model proposal for pay for access features
Message-ID: <YJLXlNyk/c8IVf9e@heinlein>
References: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
 <CACWQX83=CG_H8YUvEYj4BpDWFPoYkVLdpxo6n9V5LneTeeM7Bw@mail.gmail.com>
 <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9YIfAikcL7Ltynq6"
Content-Disposition: inline
In-Reply-To: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9YIfAikcL7Ltynq6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Brad,

I've reshuffled some of the quotes around because it makes more sense
with the points I'd like to make.  I've tried to add color to what I
think the OCP perspective would be.

Typical disclosure: these are my thoughts, not my employer.  I am not
a lawyer.  Blah blah blah.

On Tue, May 04, 2021 at 07:38:43PM -0400, Brad Bishop wrote:
> On Tue, May 04, 2021 at 10:02:19AM -0700, Ed Tanous wrote:
> >How does this affect our standing in things like OCP open system
> >firmware groups? =20
> I wouldn't expect this to affect our standing in OCP in any way.
>=20
> >Does this OpenBMC systems that enable this feature
> >ineligible?
> Do you mean to ask, do systems that configure OpenBMC with something=20
> like this enabled make them ineligible for some kind of OCP compliance? =
=20
> Probably, but isn't that a problem for those configuring OpenBMC in that=
=20
> way?  I would say if you are looking for OCP compliance, don't use this=
=20
> feature.

I'm glad things were broken out this way because both of these questions
need to be resolved.

I agree that the presence of this feature, or any feature which isn't a
violation of widely accepted ethical guidelines[1], should not on its
own affect our standing in or usage by other communities.  But, it can
certainly affect their opinion of us, which can diminish our standing.

The other question is: would OCP accept the usage of this feature in an
OCP Accepted / Inspired[2] system?  I strongly suspect the answer here
is no.  It isn't just this feature, but this feature coupled with the
code signing, which is what would cause the denial of certification.

OCP machines are expected to be owned by the entity that purchased it
and not the manufacturer.  To quote from an OCP website[3]:

    Open system firmware is an open development project, the goal of which
    is to allow OCP owners to "own their firmware" -- to move the point of
    control of firmware to the system owner. Owners must be able to change
    firmware and share it -- including any binary components -- with other
    owners. Starting in March, 2021, OCP badging for servers will require
    that systems support OSF.

Compliance with this statement would render any firmware-based license
enforcement moot.  (Note that this above OCP statement is in reference
to OSF, the UEFI implementation, but I think the intention is reflected
elsewhere in BMC expectations.)

This is very important to both OCP and Facebook for the obvious reasons
that it allows us to enhance the server firmware to suit our own
purposes but also the non-obvious reason that it reduces the
environmental impact of our business[7].  If ownership of the firmware
is a one-way door (either us or the OEM/ODM), it means there are more
components which have to be scrapped when the servers are decommisioned.
If we can transfer ownership, in a secure manner, those parts are then
able to be reused and/or repurposed.  ITRenew is one company I am aware
of facilitates this kind of reuse[8]; they are a platinum member of OCP
and Sri hangs out on the OpenBMC Discord.

> > Assuming you did this, wouldn't anyone be able to simply
> >recompile the code with the license checks disabled, load it on the
> >system
> In our system design, the BMC is not doing the actual license=20
> verification.  It is only a proxy, providing an interface to a user=20
> interface application.
>=20
> Further, we don't allow BMC code to be loaded that isn't signed by IBM,=
=20
> so unless I'm really missing something I don't think this can happen=20
> even, if the validation was being done on the BMC.

This feature was originally presented to us as being used to activate
"unlicensed" hardware or enforce license agreements with your OS.
While I think that is a lousy business model, that is between you and
your customers.

But, IBM (and other OEMs[4]) also uses this feature to prevent people
=66rom applying IBM-signed firmware updates to their own machines,
unless they have a current maintenance contract.  So when we have a
CVE in some software package used by OpenBMC not only can a machine
owner not compile their own fix for their own machine but they can't
even apply the fix already compiled by IBM unless they cough up
additional money.  This behavior is why I used the phrase "openly
hostile to your customers."

IBM calls this entitlement to install firmware updates an "Update
Access Key"[5].  The referenced website describes how the machine
will only accept firmware updates if the UAK is not expired, how the
original UAK aligns with the system warranty, and how you can get
additional ones after this point (expiring every 180 days) if you
have an "IBM hardware maintenance service agreement".

This behavior, and not the hardware licensing, is a big motivating
factor in why I said "I have no interest in providing any assistance on
this feature" and do not feel the project should support it either.
You might say "well, we'll just keep this part of the code private
then", and it would likely be pretty trivial to privately hold a few
patches to phosphor-bmc-code-mgmt to do the UAK work once you have
the rest of the framework in place.  The triviality of it is partially
why I don't even want the framework in place.  This feature provides no
benefit to anyone except <<insert OEM>>'s [bad] business model and provides
no benefit to users or this community (and I'll posit later it actually
harms this community).

> >if we're now supporting firmware locking down systems?
> Don't we already lock down systems with things like secure or verified=20
> boot?  Can you help me understand lock down better?

Yes, we support secure / verified boot, even on OCP servers.  But the
OCP model is that the machine owner owns the machine, not the ODM/OEM.
The other model, which is what you're doing, is only advantageous to
you (and is deterimental to everyone else).  This isn't a matter of lack=20
of technical capability because IBM's own security research team provided
a whitepaper to OCP on best practices for providing transfering ownership
of the device firmware to the machine owner[6].

> I'm pretty certain this is something many server OEMs do and will=20
> continue to do.  So let me ask you what is better?  A single place for=20
> those with the common use case to collaborate, or a bunch of one-offs,=20
> likely full of bugs and security problems.

If I had to make a choice between supporting code that is a net-negative
to the community or letting you make a buggy implementation of a bad
feature... letting you make a buggy implementation is a double-win to
me because if you fail in implementing this it means [various people with
an ability to reverse-engineer] it can **help** users by giving them a
way around your terrible firmware update lockout. =20

> >2. This is harmful to the intent of OpenBMC and open source firmware
> >as a whole, and shouldn't be supported in any capacity in the OpenBMC
> >codebase.
> If you don't mind I would like to hear more about the intent of OpenBMC,
> and how any of this harms those intents.

> >How would open firmware principals be retained=20
> Can you elaborate on these principles?  I'm curious.  I may even=20
> document the answers :-)

I've badgered enough on the firmware update side of this, which is
the primary hinderance to "open firmware principles" I see.

On Discord I said that I didn't think this feature is in the "spirit of
open source software" and I think Ed's statement here is along those
lines, but I realize there is a lot of potential perspective encapsulated
in that one phrase so let me try to unpack it.

Corporate attachment to the Open Source / Free Software movement has
often been around the collaboration (and thus deduplication of effort)
side of it, but that is an outcome and not a principle of open source.
To me the draw has always been about freedom to read, debug and modify
the source.  It is immensely frustrating to me when I have to use non-free
software and I find a bug: you have no visibility into what is going
wrong and you have no possibility of fixing it!  As the GNU/FSF often
states it: "'free software' is a matter of liberty, not price... you
should think of 'free' as in 'free speech' and not as in 'free beer'.[9]"

Again I bring up firmware update, but the emergence of GPLv3 (and
similar licenses) was instigated in response to the the Tivoization
of consumer devices[10].

[ Side question: are you sure your statement that "only IBM signed
  firmware can run on our machines" doesn't violate the terms of the
  GPLv3, which is used by a good number of packages used in OpenBMC? ]

We often have people show up to the project with some 5 year old server
they bought off eBay asking "how do I get OpenBMC to run on this?"
Which is a worse answer?:
    1. Well, we don't currently support it specifically but we support
       <XYZ> which is based on the same reference design.  With a little
       bit of reverse engineering, or the schematics from the
       manufacturer, you could probably create a port.

    2. Yeah, we completely support that machine, but unfortunately the
       manufacturer locked down the system in a way so that you can
       compile all the code but the machine won't recognize it.  And if
       I told you how to bypass that, the manufacturer could sue me for
       violating the DMCA[11] because the same bug that allows you to
       bypass their signing is still present on their current systems.

IBM does great work on this project and having upstream machine support
is good.  But, there is a big part of me that would much rather answer
#1 than #2 because of the implications from a Software Freedom
perspective.

> >and something
> >that, if done wrong, could be very harmful to the goals of the
> >project.
> Can you elaborate on the goals of the project that would be harmed?

I hinted at the DMCA above.  The inclusion of this feature by the project
pushes DMCA risk onto me, a developer on this project, from IBM.

A long time ago now, I did an internship at IBM and at the time someone
had figured out how to circumvent exactly this feature on Power3/Power4
AS/400 servers and was contacting IBM customers to sell them black-market
activation keys (my cubical happened to share a wall with one of the
inventors of the hardware used at the time to confirm the activation
keys so I got to hear plenty of details on this).  The DMCA was new at
the time and first applied for protecting from DVD copyright, but I have
no doubt that if this situation happened today IBM would leverage the
DMCA to stop this rather quickly (and honestly, rightly so).

The problem is that the DMCA has also been leveraged for cases which are
not a direct theft-of-service[12].  I am not saying that IBM will, and I
can't expect you to get a committment on that, but you are pushing the
risk onto me, the other developers here, and the project as a whole.

What am I even talking about, you're probably wondering?  Since IBM is
using this feature to protect your intellectual property (AIX licenses,
firmware update lockout, etc.) everything about it falls under the
purview of the DMCA.  If I find a bug in your open source implementation
and report it in a public forum, you could issue a DMCA take-down
request.  If I review a code change and conceive of a way it might be
used to circumvent your implementation, and I bring it to your
attention, you could issue a DMCA take-down request.  If someone comes
to us with a 5 year old server and we figure out how to bypass your
security lockout so they can flash on the Github version of OpenBMC, you
could issue a DMCA take-down request.  If I do a presentation on
debugging with dbus and it turns out someone figures out how to use that
information to circumvent your licensing feature on the SSH interface,
you could issue a DMCA take-down request.

These might sound absurd or you might think "IBM would never do that."
How do I and the other developers here know?  You're asking us to take
on that risk.  And why should I?  I want to stay as far away from
anything related to your licensing feature as I possibly can.  It does
nothing good for your customers, it does nothing good for this project,
and it puts me, a developer, at potential legal risk.

While you might have a little bit of code that you're sharing, that
maybe other companies can leverage, you are also giving us baggage
that reduces our collaboration.  Now, anytime I'm even close to this
code, I have to think about not only the technical but now legal
ramifications of what I'm doing.  That means, I'm quite likely going to
have to just say "do whatever you want and leave me out of it" anytime
this code comes up in reviews or discussions.

-- References --

1. https://www.acm.org/code-of-ethics
2. https://www.opencompute.org/products#ocp-accepted-inspired-modal
3. https://www.opencompute.org/projects/open-system-firmware
4. https://www.zdnet.com/article/hp-to-begin-charging-for-firmware-updates-=
and-service-packs-for-servers/
5. https://www.ibm.com/support/pages/management-power8-and-later-update-acc=
ess-keys#q45
6. https://www.opencompute.org/documents/ibm-white-paper-ownership-and-cont=
rol-of-firmware-in-open-compute-project-devices
7. https://www.theguardian.com/technology/2021/apr/16/facebook-says-it-has-=
reached-net-zero-emissions
8. https://www.itrenew.com/resources/the-tco-of-ocp/
9. https://www.gnu.org/philosophy/free-sw.en.html
10. https://en.wikipedia.org/wiki/Tivoization
11. https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act
12. https://www.eff.org/wp/unintended-consequences-16-years-under-dmca

--=20
Patrick Williams

--9YIfAikcL7Ltynq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCS15IACgkQqwNHzC0A
wRlU8w/6AlHdDSI4maAqreCo2ZK8TjD342gRiwAGX/7yGmsmjE1A7MCqOOuPYKRr
ZUoamCJZBJ00y0vaHZTGu+5eSHKMFPaZe/QDW0f3KxwGdScwJLaK04otpoYVhypg
8zhhRzzFxr9l0gtVKhaCLllYeR4b/aR1Jl2mY+pe3Je1AgBrBthDBNbRlCM8Jz8c
+Uxc1jpkrhyEKLBz2BjcBXaznwvNRwF/sxiy39KiOy8BXq3QEJUQHMZ+KsOx8kVS
dT0y8mbLtg7duFWRmKgffjkULbL2qE+3XryOsJYnslynFFeSXKb8W4oo2ULaGYeN
TADn1noaI1+xPALXVouJkQ0mT7jq06Uj3q8uZ1sZZka7NbxntHqkNA0vr6uR9yUm
iRThunZjpzhKPaA0UH61JuTToqcS04D1w1jAB/uBzHmRFJ44I2pLNNj9MSp6UGsc
cugpLbdf5fMgApQ0eiXNMX2+CMuMp4x9cblCjE48tZpx4sFIl57NbWzZa3I21FHo
9D2vQruOXZloT4npzw3QVpqh3U6ntVDq8rRYpCXAHqUpzr/vtar4P3r8KHUvmav3
EzvTR5s8+hDU4aJ8muRYC4fXmXqivdl8bnDfLulDYFKPLO0KVY49AK4w9lPGqa/y
dMR+CtmTsoZm5OtY2T05Uq2UnNLHT9FOwX6cwBkQTN3PTs+a14A=
=F+jm
-----END PGP SIGNATURE-----

--9YIfAikcL7Ltynq6--
