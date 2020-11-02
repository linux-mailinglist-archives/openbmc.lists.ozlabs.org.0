Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F029C2A36A0
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 23:38:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ79b1cZnzDqM3
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 09:38:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=i8iOtgTP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=oxDfoQ1A; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ78r5RmwzDqJt
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 09:37:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D84115C0126;
 Mon,  2 Nov 2020 17:37:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 02 Nov 2020 17:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=EH/8SEOgoGAq1j/0pxBtwKvsRIC
 ePYQJpxLpuzLAOuA=; b=i8iOtgTP5wgTJxy0lF/lbqhje2yrSavj/sWKjYG8W7e
 hck5PJFvklxfnxn6vNRV/spgMuFmYN8Vyh8RVVgBPoK3M15ren5hdLMvlvbqlpub
 6ELs4znwxBwV+QfILoUJU8LYlXostk+SmAV9FdLdqRPn/FqH9N3DFOKwsJY/tyii
 o793DvKpbUbO/gyACl0mMOrKiStKKakK56JWyZbnlmfRAk6UgFTXR5xkUAHHk7Du
 1CDAWCFOTPAEiFkkOAKH8s1SXtrG9k72Nfn5nDPmHqm0I/FRYaWaSIw4wPwdCnPl
 NGTwWvF+gK634PvQ3A3xbSD+iF6rHwmGV0HhqdbQx+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EH/8SE
 OgoGAq1j/0pxBtwKvsRICePYQJpxLpuzLAOuA=; b=oxDfoQ1AEZIdzzzw978jhY
 YGdePLiyzKvimnMNvvYCxrt2q1OueKJQUv2ZP8AhKb/EVCOZ6J1ryaTc3+kge3BR
 N4lSyDgyCh6NDrk39V9dbBe/JOkZTRVVonwT8OuwfNKKTnWk5JbDGd0KRTkV1qz1
 eET4z2ynHgbTzSD48tXT1dUwLN7FQMHUdlFC5itD5nf980LJvd53zH58Grsj+kba
 1zomf9JHTZ7W20UhJInMm1qpmRHuwGYBLVhqlXGQyy7Ms2P1RZfrxNcgZInG82M/
 C709TYAA76b/Cp83SkRCgT11mOACYUlsy9FJ4S/LEJCXpnbp78l9u4FwXb94Fz8Q
 ==
X-ME-Sender: <xms:OIqgX_rjMCXhw6FUVtaglqNG5o0UQyRdCT3wZSYuqZQK8wHIh2-W8g>
 <xme:OIqgX5rJEQHJ1RszD9xaYwRRIJRqjB15jjoMMVLRoWbk1ruoK5oiQKGLinrLPXfxA
 hDATQFAM7Ou8TVNeys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgudeifecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:OIqgX8OKC81K6SGEMVmHCjb8r3hBLwSlPJxqMSL0zVbTYcl3jrUbdg>
 <xmx:OIqgXy6zPPc0EdlO9jEJOo-UXU0ggUH0Jk4KDhE-IsRA2rrhUanQXw>
 <xmx:OIqgX-5ifxx7EST6vggsHT6srg8HwvMMmMjnYhgckWn2z2tIibPszQ>
 <xmx:OYqgX-GfDqaoHWxAdyM8ZSlb2AN4iWoay8rLr7LmDwN6Tk_G8FmVMg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5DF43064674;
 Mon,  2 Nov 2020 17:37:44 -0500 (EST)
Date: Mon, 2 Nov 2020 16:37:43 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: 2.9 planning/progress docs?
Message-ID: <20201102223743.GH3614@heinlein>
References: <AT5PR8401MB06263771D26D0EE53D41A5818F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
 <CACWQX836VGj9JOB+h75cODoti9+0mGeMioQbdiTwmVG_8ydFcw@mail.gmail.com>
 <4e6a40c2-a059-4928-8ccf-db060d6600b2@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline
In-Reply-To: <4e6a40c2-a059-4928-8ccf-db060d6600b2@www.fastmail.com>
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, kurt.r.taylor@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 03:45:07PM +1030, Andrew Jeffery wrote:
>=20
>=20
> On Tue, 28 Jul 2020, at 01:22, Ed Tanous wrote:
> > On Mon, Jul 27, 2020 at 8:22 AM Garrett, Mike (HPE Server Firmware)
> > <mike.garrett@hpe.com> wrote:
> > > We have some patches for dbus-sensors specific to our platforms that =
are frequently being invalidated by updates upstream, and instead of consta=
ntly regenerating our patches, it would be nice to know when the upstream h=
as accomplished its goals for 2.9 and we can regenerate our patches once.  =
We are still getting acquainted with the processes here.
> > >
> >=20
> > The best answer here is to get your patches into review and onto
> > master, then you shouldn't ever need to regenerate your downstream
> > patches again.  Pushing a gerrit review is significantly less effort
> > than even a single rebase, and you might gain some valuable insight
> > from the maintainer doing so.  I understand the realities of that in
> > the corporate world are not ideal, and sometimes you have technical
> > conflicts that are hard to resolve, but at the very least if patches
> > are "unmergeable" but in review, the maintainer can take this into
> > consideration when other patches are merged, and possibly point out
> > breaks.
>=20
> Very late to the party here, but 100% on the above. As a maintainer I'm n=
ot=20
> really prepared to cater to code I can't see - taking the time to push yo=
ur=20
> work to gerrit will get my attention, and:
>=20
> 1. Help me appreciate your use-cases
> 2. Help you reduce your maintenance burden, and
> 3. Help others who might share your use-cases.
>=20
> It's always possible that others will pick your patches up and get them m=
erged=20
> for you.
>=20
> Andrew

Good points Andrew.

It seems like in general we have a common misunderstanding about our
release process.  Maybe Kurt can weigh in.

For the most part we have a time-based release cycle and not a
feature-based release cycle.  This project isn't ran like some
products where they say "we're not shipping this until feature X is
done".  For the most part, people are not even able to effectively
communicate what features they *are* working on and *when* they plan to
have them done.

The Linux kernel also releases on a time-based release cycle.  There is
no where to look up and answer "when will I be able to boot a kernel
compressed with zstd compression?"  Someone decides they want to work on
it, they put the code up, and eventually it finds its way into Linus'
tree during an open merge window.

Our releases have been pretty similar.  People work on code; code gets
merged.  Eventually the upstream Yocto release happens and someone
(Kurt) volunteers to manage a corresponding OpenBMC release.  Whatever
is in at that time, is what is in.

Maintainers of the individual code repositories have never managed a
"closed" merge window in order to stabilze our code.  Code changes
because someone contributes it and the code is approved for merge.
There will never be a particular point in time that a maintainer can
tell you "I'm not going to merge code for the next month."

--=20
Patrick Williams

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+gijcACgkQqwNHzC0A
wRmX4A/+N3vr85THgqQdsf/F2mMki1cRkr7ljMbo4F6/3jiwScpS4JmMjUDLg372
tS1JWxHkH++3WviXUKCyH6JmJJX6Ec0SOlaEgjWsuQo1I9TClVgBakEj8bkikn5a
0bfOFe1coZR15wrWnsZGHNjjDyulFgubncbQ75mnWNXnxRwh30ss83N36Aeq7r0m
KUo+7VO2VfIBwb7XOkrBxzVLMR16+I8HPCNiYhN7yxMhOympI4gpZCuPiHurGxGM
wcvLtf1CdKA6CpqBmVhpJrOMHyg2hz5q+5MjAUV4DM/pq0S4DHNmQ46GVqpT6Op6
tOVwjIgiWIBR+GSm4bEgHnoW4VPdWKmjqRCQc1GEsWgFHyHjL33WDdvE6GVb6v04
uw1qh29nl7MSWMoMhUGCEtK8lCkZh3kpJbfKO8kuexkxPgP6vT7G8H9IDvAphID5
NMhDr3VDO0I97ELg0a7Uoor/ev5IYDjAJdfiTKIda9p+NwYznTEsylnB6+qd/DkP
MkCzQ7dxkRDDh7IKEsW3fGPTHGOdarN6inF3DXtFBApyyiRtXZphi06dCvQJgox6
DvPTtcxA9SlQD2tQpZG1QROLqrZiGr2uKcuzvzPED7Q6bZljQJf0ru5mQDiuBPGV
GcpzNZe8dwqj/URmXa9JuAmqyRtUatOrO1UIaB6tyEieT+t9m/g=
=6EGn
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
