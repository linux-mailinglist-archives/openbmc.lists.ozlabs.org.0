Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972B2761EE
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 22:22:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxV2c5jc5zDqSs
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 06:22:00 +1000 (AEST)
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
 header.s=fm3 header.b=fkPZaTJy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kYLo5tzW; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxV1q2L24zDqRt
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 06:21:18 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 97C325C0189;
 Wed, 23 Sep 2020 16:21:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 16:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=pH3IavX3Z74PJXMEW/WF6wgpLU5
 g6gwnE8n6E/1WMpY=; b=fkPZaTJyQUVKQjJBo/+PevlD7q2KEkGs901vQfB01zc
 jd+9krz3930hGs7rup7KqA4q5DDt84zvJmODAyReE39ggTMjgjqh6g4+vK1eIPUK
 ZsqMsH0DdrKTmIgYFdVi6DvouQ07ISwLtSW6Js3rbnmcdbWk273AdWXduj8mITwL
 QNOMT8D3UdcnFatwBQRPbgnQZGZiEfNSq+mmVFWG3WrPdITTuGvRWFXUMigRGqf6
 WGqoGN869DUbyO5JCv4fd+7Wvgi1H1TNVvZ06d9JHrvEq/M2yJQpqn9DKXhgp7n0
 pXakAQMiLHgiShCa1hDhJ1AAPFk6+HUZDtdjhk4Fw3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pH3Iav
 X3Z74PJXMEW/WF6wgpLU5g6gwnE8n6E/1WMpY=; b=kYLo5tzWfdYafGnejnQ7PG
 BSEVwS+r/tthbAjOFy8P0yER1ipEkEiZxQFRMlTHoO/x2xX2BxX3pacjLJ4e0Z8e
 D6vLm3mp0LTT+JeK4D/DK3IFH2h/SwNdb23kopVQEv3r/Zl8KNvpQrbXcYBPNL4F
 6/9IycL4hQgYEzm5SVXKQQ3hECg4vtr7B88V04ch9SqOwsj8ziNNzYb12A8EBFYD
 hrNSkI6L4gNPfj8H9mqGSA63JT4PHTT69JsznnrrFIpN6DFcw0mTRbSbqxE/iuN7
 Vx0xyyxSiwTO5uKFHTh0oR7tgn3vG5TRmQ7sZY6NOkH6c11hsYIABLYC0LwbSMqw
 ==
X-ME-Sender: <xms:O65rX9xG6M8sXsoukxAZBwApqJqZC-3CEBECKijqnQn072DB2OgM2g>
 <xme:O65rX9TvVZiDWUrXe4fJKyNQ_O8l8QLbMNUid1GUbyycWrBA8TWyGSMeiT6RVY0eo
 xi0DiNOFFspuZTL6qo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigddugeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:O65rX3Xt3_h68Wt2H2m669V_LYKGFUkmxSkAbKuDZv_cvpvN3NrFLQ>
 <xmx:O65rX_ikbsnvLr9ydvaRLU2Cj2BQg-yKJH9D_SSnp_lJr_4s012KTw>
 <xmx:O65rX_DRNo2BQGVf49Y3XFSSFeWmvooKvfHXqsJT4JWBrexaZNYVsQ>
 <xmx:O65rXypkj07tI1dWbO6n5b3XvoebSs5VzdjzjQGTOvIdWNDmhZWEKA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4D883064680;
 Wed, 23 Sep 2020 16:21:14 -0400 (EDT)
Date: Wed, 23 Sep 2020 15:21:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Chassis reset
Message-ID: <20200923202113.GT6152@heinlein>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h/77pM/XNBmEJr8g"
Content-Disposition: inline
In-Reply-To: <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
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


--h/77pM/XNBmEJr8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 12:26:58PM -0700, Ed Tanous wrote:
> On Wed, Sep 23, 2020 at 12:10 PM Patrick Williams <patrick@stwcx.xyz> wro=
te:
> >
> > On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
> > >
> > > Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xyz/op=
enbmc_project/chassis_system0.
> > > Later one is used for AC reset.
> >
> > Can we do a query to see if 'chassis_system0' exists and use it first
> > and then 'chassis0' if not?
>=20
> I don't think it's that simple.  The way the dbus APIs are defined,
> one Redfish chassis needs to call the chassis0 path, the other needs
> to call the chassis_system0 path.  We'd need a way to key off which
> one is which.  I haven't seen any entity-manager configs get checked
> in for a "multinode chassis" entity type, so whatever interface we use
> to describe that will probably be what we need to key off to make that
> path distinction.

In Redfish this would be the system path that maps to chassis_system0
and not the chassis path.  In Redfish today, chassis doesn't do a whole
lot except allow you to power cycle the host.  Most of the control is in
System.

>=20
> >
> > I think we need to do some enhancement to x86-power-control though also
> > to only create this 'chassis_system0' object if configured.  I believe
> > the current code change you did does it always, even if the
> > systemd-target is empty.
>=20
> I keep getting the feeling that xyz/openbmc_project/chassis_system0 is
> just overloading what /xyz/openbmc_project/chassis0 is intended to do,
> x86-power-control just had that already defined, so we went another
> direction.  I wonder if we just need to make the "Can I do a real AC
> reset" configurable, and have it change the behavior of
> /xyz/openbmc_project/chassis0 in that case.

No, these are not overloading each other.  They are vastly different.

host0 + chassis0 make up the 'BIOS/OS control' and '12V power on rails'
portions of host power control respectively.  chassis_system0 controls the
'12v + 5V standby rails' part of the system.  In my opinion, it should
only be present when a system actually allows manipulation of the
standby power, but that isn't how it is currently implemented.

> Also, I'll reiterate that a chassis reset really should be going in a
> separate repo/application from x86-power-control.  x86-power-control
> should be focused on managing the host.

No disagreement from me; that was my recommendation originally.  But,
the current implementation landed there and was accepted by the
maintainer.  I don't honestly think that matters much at a "how should
Redfish APIs map to these dbus objects" perspective though, which is the
current discussion.

--=20
Patrick Williams

--h/77pM/XNBmEJr8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9rrjcACgkQqwNHzC0A
wRnpDBAApdbiNVi/8gaEGUIJD8aWJmFlOeSpttZNly4isEJGDH2Zlg29zSudVGU5
dK7doUhIUyAyCypEtH8WEBcLrHLSqQi0yWeYB2aQ4VInmq1iUQx8oXTJbz2ZGgsK
JpyNnMBDwhdBAwPTW2oHEPZs7LL0ofllFapyGF8ib3Oeaz4FYVaxVKANdthEc7uK
HiNsc8sj7/VuplAj5vVNcZ/4JMggp0yScCybKIXkmiJ+NPZN2AIv9A/wTvIfk8jy
0k+ZTRLSHIFi3jV22yrRV89ybFLqSVtjSczKnxS9ouB8kMvUETjiU2wQQ4/Yu3Zw
weYfoD5OOPd2GIZi2UcvRbi5l6Aby/Ej1Ru6v3In3KIv2pwLh5rH/piwB8cJamrr
NCAFPpaEz5A2wblf/SFOICNpTrawgJbdOC7OWCbTwCyn93fIA+XDbL6j7NR/oBme
R8SFtePzqLxnrjAi/ta8DA4zJPMreTltcnROmmZJZ157oiq1njtND6M33cUOWpIN
Do/qUTdsLxHr3ngS1+718mdZXL4PJVuGQwJcsxafhdhr1THlibKtBkxQwSwHpsdW
y7IRNQqTD4Ca+dt60rXN1BnXgt4L6C6hqLyOo7TeuU/F3+CKidHZX5R2e1eJNzH+
agkR8R/mQ4iMALzz1LMP/IzL05i+bcn3lHkmAOJ9Ncx9egHx2Tw=
=oYkh
-----END PGP SIGNATURE-----

--h/77pM/XNBmEJr8g--
