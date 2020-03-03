Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCF1785CC
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 23:42:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XBpj14g3zDqWM
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 09:42:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=tK562M8g; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=1DjWJkVn; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XBnr3ZrHzDqRx
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 09:41:35 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 08B08698;
 Tue,  3 Mar 2020 17:41:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 03 Mar 2020 17:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=nHnFCN9Z3BPalSmkAOzcYDWrbQt
 zpQEFq+vHXGqDPQo=; b=tK562M8gitzFbXBpi2BbrVRSGwBZVFGLtT+6umpqLsN
 15ON6OHWpYAe4FQoZ8Drw5Y0MtTcb5QkXTY25ee7JQIy0BvQRQ3aFaowLK+ypUx4
 xvqy0qYkx9ooDWB2WwBc8DXG6Qfc/87itWpOpRNxbwY60Z55Pr36BQ7zjUeh0oEg
 8bjCfvKIvSeg7yXhK6RNZEr90j6fH2Q+HqtiAOhlQblKZfVoa0Dl94+ceJFIbLFu
 1T8MFH4qCPPl5LnfDdWdKpf0HGRMyo8EeOR3I/Gw/xXO31r2Dj+VA0LEKtdQ97Q5
 aQp0U4weSgSJM4dOEf3Q+7jQTAha0oM59fpR62uBRGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nHnFCN
 9Z3BPalSmkAOzcYDWrbQtzpQEFq+vHXGqDPQo=; b=1DjWJkVnDsCqMfaHVfIOx6
 s5ZQTs5P3jaaHwXY/VwIT/U6gSO8hCo297PPlHajv65N8vutuTJhOueWuXnuaCBk
 asvti12sr4gsRgYUOtalq0J8Hdr5rY73Ew+RN7tTCOn+v8MkpjDTeoXYfL0s0vdH
 Y7AhBUNH8ApoWKW7yJrdObfaGX+RYiU1pSm4p2ENd8bPKzhWszEim3Y82dT8rxkd
 B1n6HJ9Brhpx0D38KYJ7TIeeaFNWARkB702/Ni3KIYJND+fXr/GdD8vHtbLp0qup
 HwZ5g6qT/Jh+/W1/yKx+MYx4zHKYRbhVzuRecIviaXLtApEnuRBRE/wkO/tZy69w
 ==
X-ME-Sender: <xms:F91eXkBN7AGc-UgZR9VCkTFs4belmcDlU_IS5S23KbGaV4WbkSl2KA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
 cuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecu
 hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
 igrdighiiiqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduieefrddu
 udegrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:F91eXoLDExpSIV5Bbpw48pGF1Hfs0cKKWOjtdR1AJNLtAVumgO7H5Q>
 <xmx:F91eXmS02ncglbBBfhRH7-7QTCHpryG7OAMIHFG4ZLOVbBub9F7V6A>
 <xmx:F91eXjT-V0K_IUrYGPGN4hs_Ldk-9stSGpfDM8r3m15OsQP_p8kSiw>
 <xmx:Gd1eXqcQIL5Eoh5pXcSgWn4GG6A_XdQP-ZeeGsmYZD7kkE49zt8K39zAnkA>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5B7B1328005E;
 Tue,  3 Mar 2020 17:41:27 -0500 (EST)
Date: Tue, 3 Mar 2020 16:41:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Functionality vs Security
Message-ID: <20200303224125.GA26971@patrickw3-mbp.dhcp.thefacebook.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
 <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
 <20200225155202.GK67957@patrickw3-mbp.dhcp.thefacebook.com>
 <a9d059b8-52d1-aa17-937d-7006a591e74d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline
In-Reply-To: <a9d059b8-52d1-aa17-937d-7006a591e74d@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 05:26:20PM -0600, Joseph Reynolds wrote:
>=20
>=20
> On 2/25/20 9:52 AM, Patrick Williams wrote:
> > On Thu, Feb 13, 2020 at 08:15:29AM +0000, Mihm, James wrote:
> > > Exposing the REST D-Bus APIs via a network interface is bad practice =
and should be disabled by default. Just because it was done that way in the=
 beginning doesn=E2=80=99t mean that it should remain that way.
> > > Applications should be configured to be secure by default. Consumers =
of the code should have to intentionally select an insecure configuration -=
 it shouldn't be provided by default.
> > I'm not going to argue one way or the other with respect to the REST
> > D-Bus API.  I do feel like we're becoming a little too tightly coupled
> > to Redfish though.
>=20
> Do you mean you are concerned that the authorization checks are performed=
 in
> BMCWeb, and the D-Bus APIs are expected to be run with root user authorit=
y?

No, I don't have as much concern about daemons running as root (which
was the topic of the issue you pointed to below).  My concern is that
we're focusing our efforts on a *specific* implementation inside bmcweb
when we could likely come up with a *general* implementation at the
D-Bus level that gives us similar functionality no matter what the
management interface.

>=20
> > When we first put together the REST / D-Bus API we did have discussions
> > on how to secure it.  There isn't anything inherent to that API that
> > makes it any more or less secure than Redfish might be, except for
> > missing code.  D-Bus has policies that can be used to lock down access
> > for specific users.  What we had talked about was creating these
> > policies based on roles and having the REST end-point do something like
> > 'setuid' to the logged in user so that those roles took effect.
>=20
> There is a related issue to run daemons as a non-root user.
> https://github.com/openbmc/openbmc/issues/3383
> We tried briefly, hit an authority issue, ran out of time, and haven't got
> back.

What I was referring to was not that the whole bmcweb would run as a
different user but that when it is performing a D-Bus operation on behalf
of a particular user it could de-escalate permissions, for that
operation, similar to what you might do with 'sudo'.

> > By writing all of the access policies inside the webserver based
> > specifically on Redfish requirements, none of that code is helpful for
> > any other management interface.  If those access policies were instead
> > implemented as D-Bus policies then we gain that feature across every
> > management interface available, with SSH being a trivial example.
> >=20
>=20
> I agree.=C2=A0 Although we are full speed ahead with BMCWeb/Redfish as the
> management interface.=C2=A0 I would welcome some internal authorization c=
ontrols
> for BMC users.=C2=A0 As far as I know, when SSH'd to the BMC, if you are =
root:
> you can do everything; if not: your authority is severely limited.

Correct.  We need the D-bus policies in order to allow non-root users to
perform *some* operations (based on the users role).

--=20
Patrick Williams

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5e3RMACgkQqwNHzC0A
wRkIyhAAo5XyVx3Co54fFh7UGHJOyjLEir6CT9xchq+8HkDjYMoC3zR9HqRgnKLL
3qTKq71I3q5ECNgIsjxT7ULQoip1NcZ3lPWYlCFTuEuRN62xBopaVN05GJkpTqAT
BMd8t76igUrjKPr9BeRPYN1b1ZcxEoOXk2321lUeMOBFwXVRTa8dBDX61lG82cjw
+//I4gy3vtyYT3LbrUyA8ppwg5J1SdfuxtKjz8TCG/sXB47jwMt6Y7y3NgKEbyw1
p3HrnXYR0td0ffF4NM/oh8iLB3i834gzkuYTGDsxa0z1rdY7c9xoJ9gJpdLmTMiC
czhn9UNM8Fbs00qBErmb2wkia7dDSuhVyIUzEfCFZO3W0jcukDlYV7FIGIpBfFEl
LF2Qrd1PpvUSuUrSoMZi3r3SniHiAMk43pD8+vUCegQ26L/SppFEr36LqtisbshC
HhR9EYfNbWRrJNhUflc1Y5McMdnKtHNqFs6fTs+qO3ILdcmQ6O0xwAiZeIChv/Vj
hjCPXIeo44SMXXygmJGe2g7HW5f+sR6UtzgWqFfXQ+ChZdYMp90EYP05FPi9z215
QfnQdAdjpizLrdmozC04HOYoLvypUha60FjGaHbr+EmcHFi99jTf7gS80Ckb7Ryq
H0S6dOLiEaRc+Nemq364yZWhZHZzO2Aj6xmaAZypa5LfG3RQTEg=
=VUyw
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
