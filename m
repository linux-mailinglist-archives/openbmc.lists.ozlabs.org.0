Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE6716FBE4
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 11:20:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SBcv3J2JzDqbD
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 21:19:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=D/kWn/4m; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WaDI/cDi; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SBc2516RzDqZ2
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 21:19:13 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id CD28E6190;
 Wed, 26 Feb 2020 05:19:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Feb 2020 05:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=edYY4L3oEMPAfM3ViYs3IHoUGNS
 np0tBfJ4UJLEu7Q8=; b=D/kWn/4mFAMSXEFu1zsFib+C19b/IE+UP3WQf2JRBq0
 xnBi3YwnvgO+WXaVos6Dy6rD3RG7vchEfKPkHt9Qg+gmXM+782wLxmWrenIBILDi
 gmbV6Z+aci/ILn/drV7q2/H+jYThfA+r98k1OYyauGO9usH/qu02NjotIysHVPp1
 dr221NYYh4VIWkamompvrxVhQfR3ctCf9P5wrQSWMRt3Yyfh7xPx5QGopy0YBptA
 vO4ohtSQLvqhuBUB91FRZjDPqD2TFJ3AQdlTehHZdJMpLhNmJKqSuG+dpQj+/zi4
 aR5nRJwKHGfQF1OSoZTKlAF2Qki9BEnHFk5pXsVchbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=edYY4L
 3oEMPAfM3ViYs3IHoUGNSnp0tBfJ4UJLEu7Q8=; b=WaDI/cDi96gEmLGdB6oEBH
 yAoFBDtALwJ9/Bw2Aa7jPsufxZlM5JskPWYl41vHQUPzmx7vM+lRFVzlAyLRxSus
 TJlliG3S0SZCZ8CbsV0OXGOpFwIzxCiRpP1r4i9hw1ge3Dw5wHA1CmzIB5sl4qpq
 geKbOS9dFYH/o+GgwgfPXSHpNEfk4o8CXiTeN10JVwZW1QvAcN09CwVZAusbltsA
 CIO+DKd5kBHUTt4auVNEIUAs9GzScAcXyy2Ou5RyGD53OjeBkP0PG6FJKFaP3+ZV
 u3GToXVburknOCBcpwkDuVkODU+bsjyQCdFbbnXW5k1f4p+63dFCOFDJe0oCgBeQ
 ==
X-ME-Sender: <xms:HUZWXsVFAKmtNHRMvZjG4dj3WMCzPsS_YPYDXzvHSBq6UkZQloUVig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeggdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhephhhpphdrshhonecukfhppeduieefrdduudeg
 rddufedvrdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:HUZWXk2ojfxwcSBNF-q4QFyMIHleUdQXdHAVT8ap1HwDhuelKr0W7g>
 <xmx:HUZWXrbDLHzReGVtdQQ2e6sL3HBY1zbQTmw950zXv42dwq5dgJNK7w>
 <xmx:HUZWXvrhq2WTLEC39b88uvpTHaba1MV7JNgpKSCven47wrb7dpAnag>
 <xmx:HUZWXjh3fEbuHaEMr-9eBdHqAaisi0xNSg-_9Sx4dtw28cZhzZY2ag>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id C27413280059;
 Wed, 26 Feb 2020 05:19:08 -0500 (EST)
Date: Wed, 26 Feb 2020 04:19:07 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: [sdbusplus] To generate client header (was: Re: To generate a
 common header for public information of interfaces)
Message-ID: <20200226101907.GN67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAARXrtkPQWxhC3XdR-7kE8Kj4HC10gPk8=v7gPDVoZa_L7x-6w@mail.gmail.com>
 <20200218203934.GB2219@patrickw3-mbp.lan.stwcx.xyz>
 <CAARXrtkwsy3t=bz7wHa=oEG-KwE7dBJ0Upkft-RN9XNgiFdSHA@mail.gmail.com>
 <20200220163830.GD41328@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrt=7=X53tQ33C9+wBkUV7tZXgVZCtf8un7y8wpRxVdVufw@mail.gmail.com>
 <20200224203215.GE67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtnykCRL2EXekwb62aBie6YRQuSLBftZAg2AzheKA0vGug@mail.gmail.com>
 <20200225155947.GL67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtmqL5rg=n02b0nWagFOMsdRMp0BpN4nJTXiqEE5sBVDZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JLiXfqD9/Kt1b+Pq"
Content-Disposition: inline
In-Reply-To: <CAARXrtmqL5rg=n02b0nWagFOMsdRMp0BpN4nJTXiqEE5sBVDZg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--JLiXfqD9/Kt1b+Pq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 10:46:46AM +0800, Lei YU wrote:
> On Tue, Feb 25, 2020 at 11:59 PM Patrick Williams <patrick@stwcx.xyz> wro=
te:
> >
> > On Tue, Feb 25, 2020 at 04:22:40PM +0800, Lei YU wrote:
> > > > Examples of poor code are not a use case.  Both of these examples a=
re
> > > > trivially converted to convert<enum>ToString APIs.  We should do th=
at
> > > > rather than facilitate unmaintainable code.
> > >
> > > My concern to use "convertXXX" APIs is that it requires the client
> > > code to link the server code, where logically all it needs is the enum
> > > string.
> >
> > I'm not sure if you're referring to an API level issue or ABI level
> > issue.  Almost anything at an API level can be dealt with by headers (as
> > you're proposing to generate) and light-weight indirects.  Being worried
> > about linking at an ABI level seems like a premature optimization (we
> > only make libphosphor-dbus.so today anyhow).
>=20
> I am referring to the code structure. Clean code should include the
> headers it really needs, and should not include unnecessary headers.
> If clientA's code needs to talk to serverB, it ideally includes
> clientB.hpp instead of serverB.hpp.
> So the proposal here is to make sdbusplus generate the client header
> to be used by client code.

You said that "using the convertXXX APIs ... requires the client code to
link to the server code."  It doesn't.  Just like you can generate
strings in a client header, you can generate those same APIs in the
client header.  That's an implementation choice.

I'll say it again: I don't have any problem with generating client code.
I don't think that's where the high-value problem exists right now
(w.r.t. enums specifically) and I definitely don't think we should
continue to perpetuate bad practices.  That is my own issue.

> > > This is exactly why I propose to provide enum strings in by the clien=
t header.
> > > Currently, client code (poorly) uses "hard-coded" strings directly. If
> > > we provide the constexpr strings in the client header, the client code
> > > could be "refacted" to use the definitions from the client header.
> > > Then sdbusplus is freely to update the string format without breaking
> > > client code.
> >
> > Why not just fix them to use enums properly?  There is zero reason for
> > applications to be dealing in string manipulation for these.
> >
>=20
> It still does not resolve the case when user *does* want to use a enum
> string as constexpr.
> If sdbusplus could provide constexpr function to convert enum to
> string, it will be fine.
> Do you think if that's possible?

I'm totally willing to be shown some neat code that uses them as an
argument for why it is an "ok" practice.  As of now, I haven't been
shown any, I haven't seen any, and I can't think of any.

When I originally implemented the sdbusplus enums, I chose sending them
as a string because it was best for humans if you were using something
like dbus-monitor.  I could have just as easily sent the raw enum value
or 'hash(string)'.  I get that because it is strings it feels more natural
to see it in code, but if I had chosen to implement them as
'hash(string)' I don't think you'd be arguing with me today that people
littering their code with magic hash values was a good idea.  Replace
"hash value" with "string that looks useful to humans" and hopefully
you'll see why I don't like their usage.

C has enumerations for a reason.  C++ makes them an even stronger part
of the type system.  The reason sdbusplus enums exist is because they
are useful in C/C++ and we wanted a safe way to transfer them between
processes.  Subverting that, in C/C++, with strings just isn't
beneficial.

--=20
Patrick Williams

--JLiXfqD9/Kt1b+Pq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5WRhkACgkQqwNHzC0A
wRkPuQ//U1fLUZcN6bdaYdr7oO72BFzlhZmfqoe8x4M7fUMiqcBXy22+slJRKGA9
/ekBWcTOzTaBrjbRZqu3SPV6mrrrSGmtomrgWdtAE81ey6T28jQz4t/vwy4NlrO1
yONp/PQLlRhuRxMyfu5Dqfl9PvPS6OiXEIpb+Zu8bcCZex8EXkDWeC6JpX6k5HTX
2BxxUwxyRjxcJ0qIJLip37DzuCHg5rPJGLluIw8yw5PZjnBxTLcw/9DTMEQSjao4
fbCbAV2q/pfWN2kCpD7J9MLWAYTc3PGQRqoIJON1ONPG6IEfT/Y1JZ6scWAXmWbM
HmTnK2K6a4aOAljKwWuJM3+t1rO0ADRDushI+babt2yjOxKayMBl/BJNfocp1pKW
qkv0+gHlmoRxNKB9MDOfYe8Ql3h1dlndsmI9Xu4PrTYdGNpOunJ0miSUnteV9DH0
t0wDA5AiBleRhQ+WufdGRbjfbSOlOEy2UtHsOyqOYlFsEVtRypBEUjZpggwHI7B7
IbqCTZb/k5L+PRG4fwHqdwydvpylLK6dzlGBwleq93MCzD2EssyFSR8iaPbtUVod
MQBjjCb8P8XAjHP8+70e1e4prE+mgV1c45QPGUybTGvGPsKPMniBSxRjtW+gbAZX
zEy3OHcYWkTTMVeEzEMLHIDEMkvse3CjVLkm0wDddY69Ne/jtW0=
=v5G8
-----END PGP SIGNATURE-----

--JLiXfqD9/Kt1b+Pq--
