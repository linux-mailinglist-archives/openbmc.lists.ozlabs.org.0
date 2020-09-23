Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68681276348
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 23:43:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxWrQ5bl1zDqdf
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 07:43:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=PkAx71Pt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=UVR6Ig3D; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxWqj3YxPzDqcJ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 07:42:41 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id EB09D5C00DF;
 Wed, 23 Sep 2020 17:42:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 17:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rJZBuh1CIY3NUyUkFkHkAaE2ALh
 9JGZqGhQEjEdxTcU=; b=PkAx71PtAcniWBLBl2rMOZy92R49vV1LNk03g2/wn0E
 I0UyPI3ZCFSyO9+X8z+y/PiEVFDiwHndUPXLASr9zo3zfBqLIO05k102w1+fvtZy
 UrcN2vbblQYZLMv50i8U8369PuJrfIGBqJnadedA7GznrQzYZZ6k/CVRo0nFjwTW
 ZnPeZRzoRZYS0bI81WAAkYrYQp7WUlDp0waPyKNJPwOfzJOToIVNd8a13KmFy8/p
 ORRX3egT3TAz9BP1gWCGmJ4cT8T6OoWb3TTLw4KyoYLWjHxlfl5JvWzcI0vim38/
 yZm8vBrserdnacTFhMLZiHjDX8Q3SwjFkjR79B/tI+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rJZBuh
 1CIY3NUyUkFkHkAaE2ALh9JGZqGhQEjEdxTcU=; b=UVR6Ig3DhNhlf5FK8wIJEh
 yCOhe0/r1yeFxI+El/QGcT0FBkeuhgPTdX8X8UhmkGBg7/x9C3+M4Bz1tJT1jlVO
 HmR15XxFerq6PkV5+/W4bJYTJrO6brCazLjt9pLsaBB/sh/CgHMjWIoBlcUBbHBB
 SfDm4diUA6tCzQVPXnG9S57KQeyNx9fBETJKH9qidERBg7bjKhMO9NPHxcsMJuvS
 /CveFekt2rhD9nn64y5HDzBroBsG7BcV24KvSHBY0Jjw99xsowtZmRzdBJ3dNaR+
 SOaZv30WgUwMu3z2TVtGszhCPAibRiu2socddqmjbechsxFMcthAAxlHkA23eo3w
 ==
X-ME-Sender: <xms:TsFrXyvps8QaFLNeGZWTXGpl53MtvKAR3uUDUibpTM4tTlK0p2ZBGQ>
 <xme:TsFrX3cFsenQAife8oTGmYCiBxWjoyNQnf7QYex-h8JXEA4aBzzPne9hjXN5AyLDx
 NZLl7Rc1B1C38eDNzk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdduieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:TsFrX9yVXL6F2O0gun9NJcI28yX-QBOPTt-2O5AfiO_uyvZ3TbLL6g>
 <xmx:TsFrX9Piwm8CgEcLY_GKmPB5xvT2MvG_ICtnrUTsoHyn6WflwoRTxw>
 <xmx:TsFrXy_qi_5j6OtJm1IAvyVSxsiMGut00PgXJTFzmtAFXYFg0BeY_Q>
 <xmx:TsFrX3ESHIBtgWaJPnsbZKn2ueymVf27CjuvgjL1byoICYYHMsCALg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A2BE3064610;
 Wed, 23 Sep 2020 17:42:38 -0400 (EDT)
Date: Wed, 23 Sep 2020 16:42:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Message-ID: <20200923214237.GV6152@heinlein>
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9xA8aadJAx1hWuKz"
Content-Disposition: inline
In-Reply-To: <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9xA8aadJAx1hWuKz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 02:12:10PM -0700, Ed Tanous wrote:
> On Wed, Sep 23, 2020 at 1:21 PM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >
> > On Wed, Sep 23, 2020 at 12:26:58PM -0700, Ed Tanous wrote:
> > > On Wed, Sep 23, 2020 at 12:10 PM Patrick Williams <patrick@stwcx.xyz>=
 wrote:
> > > >
> > > > On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
> > > > >
> > > > > Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xy=
z/openbmc_project/chassis_system0.
> > > > > Later one is used for AC reset.
> > > >
> > > > Can we do a query to see if 'chassis_system0' exists and use it fir=
st
> > > > and then 'chassis0' if not?
> > >
> > > I don't think it's that simple.  The way the dbus APIs are defined,
> > > one Redfish chassis needs to call the chassis0 path, the other needs
> > > to call the chassis_system0 path.  We'd need a way to key off which
> > > one is which.  I haven't seen any entity-manager configs get checked
> > > in for a "multinode chassis" entity type, so whatever interface we use
> > > to describe that will probably be what we need to key off to make that
> > > path distinction.
> >
> > In Redfish this would be the system path that maps to chassis_system0
> > and not the chassis path.  In Redfish today, chassis doesn't do a whole
> > lot except allow you to power cycle the host.  Most of the control is in
> > System.
>=20
> The way Vijay describes it, it's resetting the Chassis (ie, removing
> power from the board itself). The redfish System resource is meant to
> model the host, and shouldn't be resetting the BMC.  Maybe I
> misunderstood, and this is actually just a host reset?

How do you determine this about Redfish's ComputerSystem?  It seems
really ambiguous.  The only words I can find are this:

| The ComputerSystem schema represents a computer or system instance
| and the software-visible resources, or items within the data plane, such =
as
| memory, CPU, and other devices that it can access.  Details of those reso=
urces
| or subsystems are also linked through this resource.

You understood correctly though.  This is effectively the same as if you
had a PDU and toggled power on the whole device.  Or pulled it from an OCP
rack and plugged it back in.

> > > > I think we need to do some enhancement to x86-power-control though =
also
> > > > to only create this 'chassis_system0' object if configured.  I beli=
eve
> > > > the current code change you did does it always, even if the
> > > > systemd-target is empty.
> > >
> > > I keep getting the feeling that xyz/openbmc_project/chassis_system0 is
> > > just overloading what /xyz/openbmc_project/chassis0 is intended to do,
> > > x86-power-control just had that already defined, so we went another
> > > direction.  I wonder if we just need to make the "Can I do a real AC
> > > reset" configurable, and have it change the behavior of
> > > /xyz/openbmc_project/chassis0 in that case.
> >
> > No, these are not overloading each other.  They are vastly different.
> >
> > host0 + chassis0 make up the 'BIOS/OS control' and '12V power on rails'
> > portions of host power control respectively.
>=20
> Right, I think what I was saying is that we need a mode where chassis0
> is freed from host control, and that would simplify the problem a bit,
> as the chassis0 api would just do the "right" thing for the platform.
> If the platform is capable of an AC reset, do that, if it's not, do a
> host reset as x86-power-control currently does.

'chassis0', in dbus, is the DC power control that goes along with booting
the host though.  It is not ever related to AC reset.

>=20
> >  chassis_system0 controls the
> > '12v + 5V standby rails' part of the system.  In my opinion, it should
> > only be present when a system actually allows manipulation of the
> > standby power, but that isn't how it is currently implemented.
>=20
> Sure, that seems like a fine way to model it, but then we need to come
> up with an API to "steer" the Redfish API to the right resource so we
> don't break backward compatibility for the things that work today.
> That seems harder, and more error prone, but could certainly be
> defined.  Whether that shows up as chassis0, or we just redirect to
> host0 if chassis0 doesn't exist seems fine to me.
>=20
> If I can clarify what you're proposing.
>=20
> host0 controls the host.
> chassis0 also controls the host.
> chassis_system0 controls the chassis power unit.

The only clarification I'd say here is that 'chassis_system0' controls
the Host + BMC.

I'm not understanding what you mean by "come up with an API to steer the
Redfish..."  I think everything is specified here at a dbus level.  The
issue is figuring out the appropriate Redfish model of
Chassis/ComputerSystem objects (along with the included Resource.Reset
types).  To a casual reader, who hasn't been involved much in Redfish
implementation, the current mapping of these ResetTypes seems fairly
arbitrary.

With CIM there use to be these Profile documents that showed "the right
way" to fit all these pieces together.  Does that not exist with
Redfish?  How does any external application consume Redfish in a
consistent way?

--=20
Patrick Williams

--9xA8aadJAx1hWuKz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9rwUsACgkQqwNHzC0A
wRmXuRAAnw6JUeNWOYh+60k3O//WPVOumnX87ZN4gciB2zNJZjhqyJx50cWUppHm
i+NKyvQSLhR6Mm/a++cfymMKHXc1Jz+wVZZck8Dk5gsQj1EuqOsyeMwfoGWPO5Qk
9ViEkiIC0+ikT0z54TkIFDzZK8hrdVAArF4QfPBY7apAmYJ6sqBv3xrtvOWKBlaT
cEIb8tqIXwVTa5YEf69mI8KOLRR3m0CXJwJekWpokimahc3Iw72DYUMo7B/iKIE9
1c9YxxR8WUxXsSKUO7qKHCTla/gJCPBDFjlbDb5O7Pe/pIp1sUYpdk4b1qhUTami
ZRSKRZBYNTifaPXEGUgnrNLviDqDRs2O5zEQRy3zizu8RMTuUJdtBPgNbTZ+xiXe
TfLyTg8CnQBblqqrtXEyT55/hyb1L/4mtsWmwZQ88XBt0mlosKl0c1EvmFz7g9HK
/fWeBF36Ax+mLTzoLTJ4fqXF/SHwGvzTG2wgaEVf6xxgI2exUpMtECBNDtFgUdQz
/XSnyJHdGXpe9AfeZ9iZCiqZgysvuxF96nahETv/oN3ZbrLrv9ka94uJDoA86YQu
RVyT3XfEF+y8ddVXxbr6kN9NXbrgPfQQWAjz7MZmbqr/8c6GEnL2Oi3kePZh9BXf
M+MBNyZeI4MeC0liCj0Va1tXG/SojMzWL8CeURh1LeTSa2BeLO4=
=QnXt
-----END PGP SIGNATURE-----

--9xA8aadJAx1hWuKz--
