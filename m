Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389A60B96D
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 22:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx5nZ00cjz2xkx
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 07:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IZwUX721;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U4kuR+K+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IZwUX721;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U4kuR+K+;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx5mv05fHz2xGD
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 07:11:09 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id D4E583200312;
	Mon, 24 Oct 2022 16:11:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 24 Oct 2022 16:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1666642264; x=1666728664; bh=B2tsF0A5ol
	/pQeIPfyACEd+P6d4qWWsEaXPd+CpYcDQ=; b=IZwUX721Xd+CX1jHqKVHIXbwNd
	/iQ+iZ45NGrWXDTdj6RdhxjuJK68b6w+Bvb3gDUkrvMKCSFxiv5vMcVkze5oAOxS
	BU9aSNLlyvSjX56lZUY6D9XFeANXu3OP6aWjDIZWqIrHSvT9Ot1289n5Fhdc4Ncv
	EAydFdKQfs2k4J/b2oOVd6ZXCykyDFJ1CxH32KaaQzCNUvbGGQXtSuhN5c4VT4W0
	a5znYwf0euVfMLZLrHUZ8q53D205o8wZojKyCqEi7isCpghikjfWHqCwJLRffEsq
	RAin6lKyhZC7Uwhgy1FipsuD6vx7EgWwkT1J159DFOHNyCNKKdutHqXHISYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666642264; x=1666728664; bh=B2tsF0A5ol/pQeIPfyACEd+P6d4q
	WWsEaXPd+CpYcDQ=; b=U4kuR+K+/3pvTCF2n0Gb2CqGZY6VJ9Kp06MuF/9VhR8v
	3UHWoj5waVj5oRzMQeFh99B/np0xhcMM2tJEX66dhGKoUOMPWxvx0+bFRll2Y0la
	HbSAfs0JTWHE3QXXYz4LHDwASMj7Q/tBQC2h7k/WtS/1F0lcT6ZDGdRvA1XZEDwY
	/5v1vvfOqo6N8w3B0JfCXuGBxal15pybkGezDM9yG2veT4s0N/QLjeoxUlBKIzDD
	UQi/gfbnN5OrXuuts7IkuHq8oKwVdKLNusN5LcHBs8ZR4Lz9leze04asgIzYflMq
	EhTWLiXA6b1XN1RGHXND4ee4VNN0qprrgxyqEWiHRA==
X-ME-Sender: <xms:V_FWYyD5Tw55cnz14P-AsQ184CrJH4egICqqHeTmr-WfmwnYctNAZg>
    <xme:V_FWY8juVaMNwUKhbRYmTmLqjLPxNbUySfdR8PcCZo7MXrDvSPJ13yx4OqKY_SwCf
    3Lr_umNT_LMwpRkxqM>
X-ME-Received: <xmr:V_FWY1mz3keXAviVgRNaaQ1bTvJZoj8apIIbjGzm_cYu_NjyVJuXkc022t06PXB_zhVuwUtJeNFLpfABTer5iUMbVg10OVhi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepueehheefvdegffdvheegleel
    tdeuleegfffgteetteffvdfftdetueetheekfffhnecuffhomhgrihhnpehgihhthhhusg
    drtghomhdprghtohhsrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:V_FWYwy_43cEnuRrEirv8w2ybNtHKZTTXUhht6v7AM7nRSykh1Hn8Q>
    <xmx:V_FWY3Tk8Gxw0uLpJHTTHVk4Sff0hIAhOYemVhFZ68eRAUCI2MR6lA>
    <xmx:V_FWY7YZqIO0MhoOHe2_bqn3yyss5zGDDimEgwvhuCRB71EnyfZUHQ>
    <xmx:WPFWY46CQ_BI9-3CHpxPZpw_vY8nK8XDQO_MQ6Cf8aYApFRnT60Xdw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 16:11:03 -0400 (EDT)
Date: Mon, 24 Oct 2022 15:11:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Francine Sauvage <francine.sauvage@atos.net>
Subject: Re: compiler error : get_if<> with a variant enum ?
Message-ID: <Y1bxVdFInc9G7gJ9@heinlein.taila677.ts.net>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <PAXPR02MB7680E1F677D12D5656CA3F72E42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y1MDmAFeL1kg/5ip@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680BF2C5955F6977D83B2D3E42E9@PAXPR02MB7680.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WNTRapJsffz0YLoY"
Content-Disposition: inline
In-Reply-To: <PAXPR02MB7680BF2C5955F6977D83B2D3E42E9@PAXPR02MB7680.eurprd02.prod.outlook.com>
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


--WNTRapJsffz0YLoY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 04:31:03PM +0000, Francine Sauvage wrote:
> Hi Patrick,
>=20
> Thank you to help me !
>=20
> I tried :
> variant<MyEnum, std::string>=20
> =3D> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString:

Can you confirm you are using the latest code?  This symptom sounds like
something that was fixed over a year ago now:

https://github.com/openbmc/sdbusplus/commit/a22dbf40a115d5cd133e67500afa387=
b317cac14

We even have test cases that verify this exact scenario:

https://github.com/openbmc/sdbusplus/blob/293c8a26901f39fa3c9a34be9b4ad530c=
5592f90/test/server/message_variant.cpp

>=20
> " I think you could unpack a `variant<YourEnumType, std::string>` from th=
e message (or dbus call result) and if it is your enumeration it'll be inte=
rpreted as so but if not it will fall back to the string. "
> I agree, theorically, but the "read" fails (even if callMethod is OK) :
> -------------------------------------------------------------------------=
-----------------------------------
> using FlexDbusVariantType =3D std::variant<
>                 sdbusplus::xyz::openbmc_project::Inventory::Item::server:=
:FlexibleModule::ModuleTypes,  <=3D=3D=3D=3D here is MyEnum
>                 std::vector<std::string>, std::vector<double>, std::strin=
g,
>                 int64_t, uint64_t, double, int32_t, uint32_t, int16_t,
>                 uint16_t, uint8_t, bool
>                 >;                =20

What happens if you drop the ModuleTypes out of here?  Does it run
successfully, but parse as a string?

Is it possible you're missing some other type out of your variant list?

> using FlexDBusPropertiesMap =3D boost::container::flat_map<std::string, F=
lexDbusVariantType>;
> using FlexDBusInterfacesMap =3D  boost::container::flat_map<std::string, =
FlexDBusPropertiesMap>;
> using FlexManagedObjectType =3D std::vector<std::pair<sdbusplus::message:=
:object_path, FlexDBusInterfacesMap>>;
> .......................
>=20
>     std::cout << "Before calling callMethod" << std::endl;
>=20
>     auto respMsg =3D bull::dbus::utility::callMethod(
>         bus,=20
>         "xyz.openbmc_project.Inventory.Manager",=20
>         root_obj,=20
>         ORG_DBUS_OBJECT_MAN,
>         "GetManagedObjects");
>=20
>     std::cout << "After calling callMethod" << std::endl;
>=20
>     FlexManagedObjectType managed_objects;
>    =20
>     respMsg.read(managed_objects);  ,  <=3D=3D=3D=3D here it fails
>=20
>     std::cout << "After reading" << std::endl;
>=20
> -------------------------------------------------------------------------=
------------------------------------
>=20
> If I don't declare MyEnum in the variant, I cannot use get_if<MyEnum>
> If I declare MyEnum in the variant, I always get a runtime error
> =3D> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString:
>=20
> If I remove MyEnum from variant, it works, but I cannot compare strictly =
the Enum, I need to convert.
> get_if< MyEnum > is not possible if my Enum is not in the variant,
>=20
> I will be pleased if you have any suggestion,
>=20
> Kind Regards,
>=20
> Francine SAUVAGE
> Team Leader=A0- R&D, BDS
> Atos France
> Mobile: +33 6 21 43 11 21
> R&D, BDS
> Avenue Jean Jaur=E8s=A0- France
> atos.net
> =A0=A0=A0 =A0
> TT: [Wednesday or Thurday(2nd week of month) ] - Friday]=20
> OoO=A0: October 31
>=20
>=20
> -----Message d'origine-----
> De=A0: Patrick Williams <patrick@stwcx.xyz>=20
> Envoy=E9=A0: vendredi 21 octobre 2022 22:40
> =C0=A0: Francine Sauvage <francine.sauvage@atos.net>
> Cc=A0: openbmc@lists.ozlabs.org
> Objet=A0: Re: compiler error : get_if<> with a variant enum ?
>=20
> On Thu, Oct 20, 2022 at 04:32:40PM +0000, Francine Sauvage wrote:
> > But, I get a runtime error as all my objects are different:
> >=20
> > what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString: An enum=
eration mapping was attempted for which no valid enumeration value exists.
> >=20
> > Is there a way to add enum types to the variant of a ManagedObjects tha=
t potentially are NOT in the object interfaces/Properties ?
> >=20
> > Or is there a way to filter the objects in ManagedObjects dbus calls ?
>=20
> I'm sorry, I'm having trouble figuring out what you're trying to accompli=
sh or where it is having trouble.
>=20
> I think you could unpack a `variant<YourEnumType, std::string>` from the =
message (or dbus call result) and if it is your enumeration it'll be interp=
reted as so but if not it will fall back to the string.  You can even do `v=
ariant<Enum1, Enum2, Enum3>` and it'll turn into the correct one.
>=20
> The important thing is that you need to pass all possible types into the =
variant when you attempt to unpack it.
>=20
> Patrick Williams

--=20
Patrick Williams

--WNTRapJsffz0YLoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNW8VMACgkQqwNHzC0A
wRkuYxAAih2dTMHMpyhdwTA62w6s2QlGJPyPjLGjiUIxYVfKfvIJa9Qq6j8FkmOf
gvg0JUX3lEIEzHbOo83k57BAINEO+4ODRE4ifjB2eRBbTCUEJio6j0Pw3OGKFNHs
ISaX8MYnIUQoYl5zC2kxmER8mGc9BKJSEjo6TcyHPdlUyroyJObcMsoCKJSzFiPP
dc6l7IgU3/MMN7BBGPuTmY5mOZdis2SlDbYTuklh5YKehqdSmUQQtZq5qOktonb5
JZpuceCNAhBL5gyOXLLT5HzA+lzLsjsWyiEXCvbgW4XsIro4lvh8kc02BRjyc/Fn
I3lNbGE0lxNuHn/luGXp/ziAyJhkC743ghXfqcC9vCBp3euyKHQOcOATs+1Yrjns
ZjEQ53+C+V7Hrpv2ZKr0vf73Tgppy08kmP+uPsg3SDdrmKYu/CokJ6IlZJHDiHqj
+mW53snjJndRpzbCk1qFxY7SPFmKk++8BSARwi2mNj7aL3tJ9t6F+8Il2gUNYVob
PCl7l96oMGXf6XxinVqwPvJc0H0Q3/A4qev74fj1T5IR7fsVJ6ig4Y83tsvQ7kEx
7W/UFPcPK1BrjyWWE1BPvl4zX53AAcaSq/8HcgUzU5FD04ukMNK4mXaGkrSiYAry
nYgK5ST1xaS0noObxGjkO84HK4duKuD+6MwOP5OkY8hwuVf76Wk=
=JLDx
-----END PGP SIGNATURE-----

--WNTRapJsffz0YLoY--
