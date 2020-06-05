Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6101EFCB2
	for <lists+openbmc@lfdr.de>; Fri,  5 Jun 2020 17:41:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dn1S3v87zDr08
	for <lists+openbmc@lfdr.de>; Sat,  6 Jun 2020 01:41:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Q8qBxziq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=BiUn7zzq; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dmrV6Br9zDqwC
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jun 2020 01:33:28 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E3DCD5C00FC;
 Fri,  5 Jun 2020 11:33:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 05 Jun 2020 11:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=BQyOEmpGO99OhNP3IfSngF0Z3rk
 Ll8c1NEeb9RTB8JI=; b=Q8qBxziq72vihEqjDpjcWwJ0YE0zFFwUs72ucLrMnpl
 /oNtbRax4xNdyczp6UWnSwD53aac6jDE6ra5RWlL6cpvjS+EiIF9wpxM3EGH12OO
 PJGKnKDdUO41DVrcS9w6amOhU06nAyrG2jM0KSPUopCrphRC2Wcu1LwYxQfcgiqE
 MwIrji+Hv7wznik6mBn9U9JX7Dee/XJzjhS6G/GgOq4ErUG5WG2lywXjniL2ujze
 94e1Mvlj56oX65Evdomi3nR2mcfojV7FSJtxyd0RoZoW14NtzVnR1qGk8Kv8RihM
 QjLIINYti7+vynZiZSGacsbkucFSZXCK6nYulcTJI3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BQyOEm
 pGO99OhNP3IfSngF0Z3rkLl8c1NEeb9RTB8JI=; b=BiUn7zzqpH6Xaor5f9upL/
 RPVXgJtN6oHO4ET3wpyD3AGa+4u6xaAovqzwLX6VBVMhD4mn3yv8r32QOm2/TV0O
 n0qm1Yz48BhzHlIiTNc8avt8C3Sb/RNo0SW4UtnVzy6pGv+eAjkirZcxNm+PRwii
 qZ/4Cp7DEUS4A/soGbmhbEf+IyFnMmAAYTMvN8gQMcgpeli24J6OVJJV8/o8UBMr
 mSkLwXmez4LRLw1lfwekPCRHKQGKkG/3x5o8HPkvFTUHEC1ay6iffrtSOLhfCu7m
 htDyfTbFwC8AY9acb1qTRH53t4AKuQhKS+R0Zww74Dgqmp7pgmap+bSNBysgGcJg
 ==
X-ME-Sender: <xms:wmXaXuWOp-blQulAuhyx0QRg8zX5slh7B3RLdiohhepvxhhlWqyvdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehgeeugfehuefhieduleelledt
 geeijeffhffhjeetgeekheehleevleevkeefnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpfhhrvggvuggvshhkthhophdrohhrghenucfkphepjeeirddvhedtrdekgedrvdef
 ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
 htrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:wmXaXqmxy1gBko0ua7D5EE8M_WwRZFJrNa36k8t2z1uzfxGaf8HB3Q>
 <xmx:wmXaXibThB2Cj5VSe9iQL_l4PdGwA5dCo1aKu-wqC38lmRyub9aegg>
 <xmx:wmXaXlV3Lcf-4-VC0qd7xDL-Jmh5S-gGpTH3UAGBScaazLVO16S83Q>
 <xmx:w2XaXqQQywnTkjQ5scq5leFg4l1yGQ4sAgXAbF1hPWaA-rSw9p4ygw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32E423280059;
 Fri,  5 Jun 2020 11:33:22 -0400 (EDT)
Date: Fri, 5 Jun 2020 10:33:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Fran Hsu =?utf-8?B?KOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
Subject: Re: kcsbridge cannot work with the latest sdbusplus package.
Message-ID: <20200605153321.GM17541@heinlein>
References: <25e5caa0753f41f1b6524c351ee87011@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cGfB/trNgB3WtPHu"
Content-Disposition: inline
In-Reply-To: <25e5caa0753f41f1b6524c351ee87011@quantatw.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--cGfB/trNgB3WtPHu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 12:57:35PM +0000, Fran Hsu (=E5=BE=90=E8=AA=8C=E8=
=AC=99) wrote:
> Hi All,
> 	I built the BMC FW from the latest OpenBMC branch. And I found the ksc c=
hannel is not working.
> I got the following error message:
> 	kcsbridged -c ipmi-kcs1
> 	terminate called after throwing an instance of 'sdbusplus::exception::Sd=
BusError'
>   	what():  Invalid path or interface: org.freedesktop.DBus.Error.Invalid=
Args: Invalid argument
> 	Aborted (core dumped)
>  So I did a check of the recent package changes.
> The latest sdbusplus add the "validate interface and path passed to DBus"=
, but there is a problem when kcsbridge call the "add_interface" API, the p=
art of the regex checking function.
> https://github.com/openbmc/sdbusplus/blob/7f664254a4365612b82db2fd8fb8279=
8686e777b/include/sdbusplus/asio/object_server.hpp#L811
> kcsbridge takes the one parameter of the /dev/ipmi-kcs*. But regex functi=
on didn't allow the character '-', so I got the exception message.
> Does it need to add the regex checking to the "add_interface" API? Or add=
 the character '-' to the regex checking pattern?
>=20
> Thanks
> Fran Hsu
> E-Mail : Fran.Hsu@QuantaTW.com
>=20

Hi Fran,

kcsbridged needs an update to not use a -.  This was added because:

    - The dbus spec is very clear about valid names for Interfaces,
      Object Paths, and Services [1].

    - In some cases, sdbus itself and/or the dbus daemon actively check
      for valid names and give an error, but in a few cases the error
      was being ignored by applications.

    - For names that sdbus was not verifying, it is possible they add
      verification in the future and cause code breakage.

I know I was helping one developer recently who was adding a new dbus
element and they were stumped as to why their object was not showing up
as they expected.  It was due to an invalid name that sdbus was
dropping.  Rather than a silent error from sdbus we made this a hard,
obvious error, by throwing an exception.

Thanks for reporting the issue.  Are you interested in working up a fix,
otherwise Vernon is the only listed maintainer presently?

[1] https://dbus.freedesktop.org/doc/dbus-specification.html#message-protoc=
ol-names

--=20
Patrick Williams

--cGfB/trNgB3WtPHu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7aZb8ACgkQqwNHzC0A
wRl2oxAAmEHe1ngkZBBMOZbF4aJBzmy39l8woIs10NVpqz90NiAC6QM0O/0JkFKI
RNMWp+vPGfdY75no6iGIN0t2KU5a8FhCyOF11DysOw1PSnkiGxkuw0/l5JJOpjDr
RDyPrG8fhkDG6Slw3R7etRK2Yh1zETeMtqdpIwpoS96s7z1ubIvVGJEcnBbhSFw2
2D5qObbsc4PhjH34UA7IP0SfIOh4FvdKxfEDWwNljNHSPOdZjvTF5BzbsuuMmuSE
etCxzzhfdOKV8Rj0mt3Xcyo3mSJfe+YuqvaJfsR67rcCSw6djz8UdVcCDUKUPBNu
oGslkf4s1GiW+pRwd++oFS4EcU1Sn6SK6Auyg6DMKBQheunvnL3EfgcGNgO0Komo
0X07X/bACEus7BDbkOtXYaUyLUukl8LcVI9QesH0gk/rX30eN/KDoUtZ1jAla2cA
whDblG1RClEKmbgb6WqrbFZ+EZLKbLQM5Uh/rW3xBPm768ihW4rK+S+Sf51CtRFy
GlFQ5r/DMKOv41buAfcLWMZphg3rc6CioMlrBSF6ie7FwGtrX9buDjwlDn6hBTcL
W7RaI1/Mhl9s1b8rWeLg62/KK+Y0mIysWqWBLBF/GOWd96dSG+gbWpBGqxK1i9an
hwsyU6a4VkN6SYGNXxmLZ7BoBtaru+6uWMR9/sAkgh7b0lGQSnc=
=Bv6e
-----END PGP SIGNATURE-----

--cGfB/trNgB3WtPHu--
