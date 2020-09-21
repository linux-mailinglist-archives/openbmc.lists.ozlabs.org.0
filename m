Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4827331E
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 21:47:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwFMT6GsmzDqpk
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 05:47:17 +1000 (AEST)
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
 header.s=fm3 header.b=xWZCsdFK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=WvVVbIvK; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwFLN4M4tzDqnZ
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 05:46:19 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EA5E5C01C4;
 Mon, 21 Sep 2020 15:46:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 21 Sep 2020 15:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0jJP+KGqI1OBSG4HpckByNddu6D
 ysX6Ui+pYsyPkUm8=; b=xWZCsdFKaQbTVlgi1KFKVgZSjZoCmR/GDa+SlaHxeuY
 96TO1ufeTdZSAB1AtfF4y2Uoh/+X7vAClJo5YhMSbcQPOHG87owJrKr3sTBmkWPs
 qPf1PipxQ/jFbdLAkRMbUOc9ddK9tIDp3QoYAEQMheBZCEVDs70aHYCeabjLdyZE
 b1Ttwo1s1ekZbrjNIiADsE7b1epirXlzIVLai+W3Hjjpp2Mlp0zoo2IBnj4phCk0
 cubDvQVhFapgSSToE9xtisic8FzpfAbEuA96gNW/tceIEE5YCxrjYNAjrtFI7nb7
 Zw/0CKgxBMmeIsoXOkEkGR4mWpkFmz150cdaB4+jB7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0jJP+K
 GqI1OBSG4HpckByNddu6DysX6Ui+pYsyPkUm8=; b=WvVVbIvKARm12V7UpwJD5O
 fs6ic6N9X/gED6m+fhuASF7ydOhOiZ9WQDf/gk+p4WtodY3CQ5FGMnleKWQrRz/g
 8jnZG++sDd7SRRZNAa4pxdu+I1NRvjBpyE2nlzlUxTZmT9Cz68L3j4uTDNmSBYv0
 IuFJYOLebKGgxuKipmZWB48Ey2MDga5jCNGSp3EwLa0FVg+JP3G6WVaYegk5wDKH
 ZufrR1YjrCPkVxZXDPRmqtfhKgm2gWA5X0brH2m58FhDTam2xTarTki0N0QwlTfs
 0n0HoN6tbwI8W76fCeOYpGcs8iRhG1CCdNaYpjs8kxNhStD+GIARaFOKkVVu1R3A
 ==
X-ME-Sender: <xms:BwNpX-n6Yw8ku3avxx-OMFmyrGwyDGxMimR436kGSTCUU_E7sryptg>
 <xme:BwNpX11HwQXCB2KqABQEK1AXeQM_kGEdd63vGoThXT9N255toKDiR0xMWAlJ-q-HV
 NEzLyRt6bhVVB0Pnns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepuddtjedrledvrdehkedrvddvkeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:BwNpX8pIhYASy4v5E9cr2KrD57Q79JatRiFTQnqPIFzjCmuJIML9_Q>
 <xmx:BwNpXynmQAONcFjZoo3goZmE3OyG4s9N7-0v889GW1_ku4mF8gOkXg>
 <xmx:BwNpX82ZeqmJAAMcSHUO6bZDxPN0gKxYPAQu_gRXiZ4jR5oVtmlfPA>
 <xmx:CANpX2rsWW3LK0ZQ_Gk9If_M2yHPaxe2JgKa_nAfGys0S3MgOHogmQ>
Received: from localhost (mobile-107-92-58-228.mycingular.net [107.92.58.228])
 by mail.messagingengine.com (Postfix) with ESMTPA id 01B70328005D;
 Mon, 21 Sep 2020 15:46:14 -0400 (EDT)
Date: Mon, 21 Sep 2020 14:46:14 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "P. Priyatharshan" <PriyatharshanP@hcl.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Message-ID: <20200921194614.GL6152@heinlein>
References: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5LiOUhUlsRX0HDkW"
Content-Disposition: inline
In-Reply-To: <TY2PR04MB33112E61CA54FE1A17D30B70CA3A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
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
Cc: Sundaramoorthy Thiyagarajan <sundaramoorthyt@hcl.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "ojayanth@in.ibm.com" <ojayanth@in.ibm.com>,
 "gmills@linux.vnet.ibm.com" <gmills@linux.vnet.ibm.com>,
 "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5LiOUhUlsRX0HDkW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 05:49:14PM +0000, P. Priyatharshan wrote:
>=20
> Hi ,
>=20
> Phosphor-software-manager currently supports bios upgrade for a single ho=
st.I would like to propose a design to add multi host bios upgrade support =
in Phosphor-software-manager.
>=20
> Kindly review the below proposal and share your valuable comments.
>=20
> Design:
>=20
> a) : Add Host Number
>=20
> 1) MANIFEST file change:
>=20
> Add  host number in MANIFEST file, purpose field like below.
>=20
> Ex:
> For Host1,  purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose=
=2EHost1
> For Host2,  purpose=3Dxyz.openbmc_project.Software.Version.VersionPurpose=
=2EHost2 and So on.

These 'purpose' values align with the Purpose field in Software.Version
(and the VersionPurpose enumeration).  We really don't want to add Host
positions to this enumeration set.

Why would a MANIFEST file have a different value for a different host
position anyhow?  Isn't the appropriate firmware image for your host
card dependent on which host-card-hardware you have installed and not
which position the card is in?  The type of hardware should be handled
by ExtendedVersion.

I can't imagine that a 16-blade BladeCenter would want to have 16
different files for each slot in the BladeCenter.  That doesn't sound
like a great user experience.

> 2) For bios upgrade, handle the same to incorporate the host number and s=
end host number to the systemd service obmc-flash-host-bios@service like be=
low.
>=20
>   if (host.empty())
>     {
>         auto biosServiceFile =3D "obmc-flash-host-bios@" + versionId + ".=
service";
>     }
>     else
>     {
>         auto biosServiceFile =3D
>             "obmc-flash-host-bios@" + versionId + "_" + host + ".service";
>     }

It doesn't seem like systemd had a clear mechanism to create a
'multi-parameter template' which seems to be what you're asking for.  We
should probably define a convention for openbmc.  I'm somewhat surprised
that versionId is part of the template parameters to begin with.

I think there is a question you've missed (assuming we're not using the
purpose field to identify which host): How do we handle activation for
firmware images which can apply to multiple entities?  Today, as best I
can tell, there is a 1:1 mapping between firmware images and inventory
items they apply on.  At least, this is the case in
phosphor-bmc-code-mgmt, which is where this code you linked to is.

Reading the section "ItemUpdater" at [1], it seems that we can have
multiple Activation interfaces for a single Software version and these
Activation interfaces are expected to be associated to the
Inventory.Item they manage.  This would mean that we should create <N>
activation objects, one for each host, and modifying
`RequestedActivation` will activate only for that host.

(Adriana can maybe weight in here?)

>=20
> b) : Implement a generic IPMI based multi-host bios upgrade.
>=20
> 1) This generic implementation expects a json config file with the detail=
s like IPMI net function , command id, and etc and process the bios upgrade=
 via ipmi commands.

I'm not following how this is related unless this is the code inside
'obmc-flash-host-bios@'?  You're not expecting this IPMI function to
dynamically create your MANIFEST, are you?  MANIFEST files need to be
digitally signed when you're doing secure updates, so you cannot
dynamically manipulate them.


1. https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/open=
bmc_project/Software#itemupdater

--=20
Patrick Williams

--5LiOUhUlsRX0HDkW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9pAwQACgkQqwNHzC0A
wRnjIg//VI0HlHD4PQJoq2pVfG1BE9a1FFr4AGqNf+XwuT2R2t6cZP7a3+us+ny7
3LHDQaStZhfuH4jxqpjecnp+kfSRUJfE1oPNekaI5IJfJS5Rzl4QpyzK1VpOAIq8
G8PLNMZv6MyZXqvTLT0Frz0sm6NRjqlVlK9nqX5CmoaDZJMEtPDBJjfQ5v/rAB4r
NGF+NtFX/8Xb6wJGQXqUqP6nBPnLA5YPoOvvQunfuy8J9gUUsxXpnEULdRSD9P9F
KUbzWi0KfkJMn3s9NeaHM6mTkVGL9Fil0zM9X8gfNSL6Pvoj1h6+F0H6+mBUpBES
iB3FGR2SaiVaQ9Eyon/ZX3Prn6FRFuJDeE4uJbGeIJ2kB4CqG7KNaxjRWVunVsMR
CjEfumfxAzRfgXa97LL7XplE9FMaj1YutPI9ISpaHhMLHxbiNy1BlKoJ5YtEN1ks
a+QIU/j7u24Xn28TFCQ4aebi0LYwAtmSL9eJziALomj5//d/OwQHHZH3ZZ3l2aM2
zJDLaFFz6+45bvTEbHpeQV0aUaToULpt8X5nyiFls8vl6IVDZR2LyhFANsGlKITQ
CqmFzRkDMWhiXvPKJyx9GCVLOvp1ZbuHATTCjxyxV57HU3GdOWR4eR6RgynPmbnz
unaVxDdUGN6PlKFd/RVV1Q6B90GbPTb4l36492wGEI6VKxuBeV8=
=/WzY
-----END PGP SIGNATURE-----

--5LiOUhUlsRX0HDkW--
