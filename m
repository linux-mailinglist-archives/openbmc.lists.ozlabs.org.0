Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BF2EAD27
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 15:11:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Dv558lhzDqf0
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:11:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=RJlZi1Gt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PB64JgVO; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9DtH2k4mzDqcF
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 01:10:47 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CF765C0125;
 Tue,  5 Jan 2021 09:10:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 05 Jan 2021 09:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=yciC+qTGa/sywuXXi0U9No4Dsh0
 YmoqzrwL3iDMJecM=; b=RJlZi1GtEevXGUpTTTSEEPVD5jwLUHbYYd15SGTEiNf
 NDf/VbBDjnODH7fU/wetjGoJGuJvT7P40FX2kOy03umLF9jFuKOPD6KqHutthGeB
 uMXXt4wa+ThXs4zXTl44c2lR5txyZQVzlRtYGNVxhgIICqhixu6SxO3x+KplyMPg
 Cv1K8lYMPEjDkrPtWZA/vwxnkljfltgyoNYgU9bVWw1rxmPkCP3WymQ0j4tlZ9e0
 3xFf6yqaui481zoxjfFwxh/roEjoAnjc+Epec4wAlZXTmx/I6tvbroCDx61jJqdY
 PGN22JWwahxJVxMAIh7ggB1+OyQFNDvhCIc2SKm0FLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yciC+q
 TGa/sywuXXi0U9No4Dsh0YmoqzrwL3iDMJecM=; b=PB64JgVOSfYP0aXvZJI80d
 iUIgP3YP0rAfaSlIti0Uq/fUfS1DqkRc7Wk+n74QtXDcYfh3Dhw8DsiFxGpI50XG
 lOb1bAq2yX2b2xa681TQEfcEc6Icr40GfJDjW/ZeDx8xzl8O8+9ESxlk7rglojrA
 WRs73C0RsycUBEVchliC1GiUyKJctgiLq9adLw1jwfyPGhsQaCpLJabK9nG/Beec
 JCs6+M5IlYrdQw4W/wfseNB6RAONCElAA1F3evTDJ6Sg+liUa3Gd8VGTncSsDrAd
 hpsLWcXl3/PKOV4g1Jz9qUrxoT1kEW8k/V+o3gnSmQX8Pw+fmWi0wrc3N7V8hMQQ
 ==
X-ME-Sender: <xms:YnP0X_1JoOxzi8P30ga0UmNGPOMFfCuhKx0oZOdqBflQhdqfHm7cZQ>
 <xme:YnP0X-Hq6qWftyJZcFzf1aWQ3Hf3tZDRbdKX-A9b2x4JofDF5cu9pO124N2gzIq0n
 OunqjZwLvLDnQDS30Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefjedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Y3P0X_5_2FBb7GQiP27O0sb9FiWDdP_6WOdn8xvLKXqPQg0mv7STtg>
 <xmx:Y3P0X00fOHb6ArEeeRrO0K8J4xdawGeVBUSDSVlitQwg9XdsC8i8iQ>
 <xmx:Y3P0XyFGRJ-EmERmkUxNMYcRD57S7hzFLTMBZWLXab3hx14W7H0vZQ>
 <xmx:Y3P0X9w4c2zzzEzPzntYFEL1vuojx9wc7TCE6UUWywtkzV6j7_D44g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA54D108005C;
 Tue,  5 Jan 2021 09:10:42 -0500 (EST)
Date: Tue, 5 Jan 2021 08:10:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Subject: Re: add a new yaml interface definition
Message-ID: <X/RzYa7/QqlVUIMT@heinlein>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OVFwJ9589BhkXb@heinlein>
 <SN6PR17MB2558F662101C2B4AE4A09F5096D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OhexuWrZFhy+v6@heinlein>
 <SN6PR17MB255875944AB6F6884DE94FA296D10@SN6PR17MB2558.namprd17.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ctHn7v6bjz/+hc5P"
Content-Disposition: inline
In-Reply-To: <SN6PR17MB255875944AB6F6884DE94FA296D10@SN6PR17MB2558.namprd17.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ctHn7v6bjz/+hc5P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2021 at 12:42:40AM +0000, Mahesh Kurapati wrote:
> Hello Patrick,=20
>=20
> Thank you.  Updating the meson fixed the issue, and I see the cpp, and hp=
p files generated.=20
>=20
> ixia@ubuntu:~/git/development/openbmc/build/fender/tmp/work/arm1176jzs-op=
enbmc-linux-gnueabi/phosphor-dbus-interfaces/1.0+git999-r1/phosphor-dbus-in=
terfaces-1.0+git999/gen/xyz/openbmc_project/Control/Alarm$ ls
> client.hpp  server.cpp  server.hpp
>=20
> I have two more follow-up questions on how I include this code in my serv=
er:=20
> 1.  Does the libsdbusplus.so contain the methods that I defined in the Al=
arm.interface.yaml file?  I thought it would.  But, I don't see build time =
stamp changed for it.  I thought, all I need to do is include the header fi=
le in my server code, and link the server with libsdbusplus.so. =20

libsdbusplus.so does not because that comes from sdbusplus repo.
libphosphor_dbus.so does because that comes from P-D-I repo.

You should link with both libsdbusplus and libphosphor_dbus.

If you're using Meson or CMake as your build you shouldn't need to directly
add "-l" flags, because the package dependency will do it for you.
Yocto will want you to link against the versioned so files, so if you're
trying to hand-write makefiles you're probably going to have problems
with Yocto integration.

> 2.  I see that in the example/Calculator_server.cpp file, both the genera=
ted cpp, and herder files are included.  While the corresponding server and=
 header are not included in the x86_power_control.cpp server.  I see that i=
n x86 server code, namespace is referred again.  Is that the reason why the=
y are not included? =20
The authors of x86-power-control decided not to use the generated code
and instead hand-wrote their interfaces using the Boost::ASIO support in
sdbusplus.

I see the code using 'sdbusplus::' namespace elements which come from
the sdbusplus library but I don't see them using any of the
'sdbusplus::<TLD>' namespaces being used (ex. sdbusplus::xyz::openbmc_proje=
ct)
which are the ones generated from YAML using sdbus++.

--=20
Patrick Williams

--ctHn7v6bjz/+hc5P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/0c18ACgkQqwNHzC0A
wRmP7RAAhP6b1XgFRCeJryEwJZ8fxzXOwoITKqeJT/2RyT1ffCOWQpVsaoeTHJN1
NI8kJG1HsU0gcziAGPEV2gJKTOnNZxiBmW92s70NOpG5HOI96zvJCcQDOHdQXQSG
TE1A+NbG0ebly0lyuhJKZ1pzYfAzgOJjSJwg2laF23sTfuXvPMxIGtbKPJbDP3C0
kP8p0A/pZZvgb8mzv4ter8oWRSZGdin6VG/1aL2y9JPsPvqITkW4WMVfPAwSK8/H
Yq2zxMSCOIcpre3j0qiI2t3MshgKkS3ODlNybDnGWp9pnbjv/327UeaGLvOelS2G
eoAiZBhWOsqwwPRIoOSEtY4g7jYtDZriLk7ac3kdK/cPscBhxjME37uuu6VyqvTf
dZzuPxtgZqeErVvZmfvaKXN5juflO0R1tcCxmr1C9BxLqEZDubmi6qJJcWDlk8Jr
WtpnDLRCaIBiZ+gjBDiLbjCRIH04CcCbx3Ihakfy6smWjxgFgWy6KQ74iawEjiz6
5tS4jC5Kotuqzf5l03Gg57VYExYCy9HypjQnu9YGGp2m16w/3bwnfKuSuNoRrxA+
42tRXmZwT/XjPzDt5BcSO6YkFA1rsZNLqZ3TGSjTvURVdAjei/+4W/T/ByaFean/
Da8cs8GVLo2d0Z2WdavmNk1+kU4Kqr3f7KF/20d/AaDop1WqEII=
=VQgm
-----END PGP SIGNATURE-----

--ctHn7v6bjz/+hc5P--
