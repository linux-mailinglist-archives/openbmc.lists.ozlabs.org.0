Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E65259871
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:27:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgssr2wylzDqF7
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:27:12 +1000 (AEST)
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
 header.s=fm2 header.b=HwQ35Laq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Q8DGMBp5; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgsnk3SlmzDqTx
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:23:38 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 12AD95C0151;
 Tue,  1 Sep 2020 12:23:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 12:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=E+cpxCVBpkQEcOsrtIG3mkDi363
 Di5GKoMeYHLapyj8=; b=HwQ35LaqlVBT+lXkD534jHSKfjYwrtcApl+OCJBfgRT
 AgP2IRE9ei49euudhA7FapY3aDclEOsuB2DLvO3xnLkOww6twOX8jRhG3WrxnHdx
 2VYNDiCQhsKMM9WMig8VDW/eGmQFl2OAryUlTgVYP59yCtkfx6icEZbbJynhoDJ2
 dGLA8cyTMvlS0uDsfZTjr3VSa6k5Xet1350TvkZVakEe5b3dkoXBCKZouebMveqY
 K+AMALODDuGhaUWjL3br+WT3WKLHw3iGT4/NaPZirveKmR6DxCKmWHZOa8F3MW8F
 Z7qOqhTgDNoQn8+uS4DuYC3pVv3MQFllPlFwCBG5ShQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E+cpxC
 VBpkQEcOsrtIG3mkDi363Di5GKoMeYHLapyj8=; b=Q8DGMBp5erGL9wvgO53QtJ
 ypo2jKuyHTCHtwS8ouoLKhIbgfNr8Q7QhhwNOxWFXYDICWTz2oG93TGvVbuu6fRm
 dfTrjplu17ay/cjHw+gJYicR58kXIWO8MmvOSeu33WV0JeUHDOFT9P9Wk6PbGUwC
 AjfbwEFlf0JPb9U63ob0dltlyqY029wr+wgusRtsRRsqG3KPDujLijw6zb3W+Yux
 luTUylXHxadIRLmSTNey6PXgBnQXHG2uy15zIa1qw4zeX8OpQ59VABxfEzNNtXyY
 M4/lXZJf1V+yqlyQ5mS9+kB/gdPQbOiC4JvUydNxBJmg/E7GG3i87X5ADzuvs1LQ
 ==
X-ME-Sender: <xms:h3VOX8p81OIEfax5znZ9xOJcXYyoF793PcYIMdDGnlTRtzqNEJDxug>
 <xme:h3VOXyq6xPpM8AyUDLzSO9RiqFlTS0ona0vZHDtN6rILhEuzYO3i18o0Bn3HHXK5Q
 m7ZT3dfPtpmYvWz4Hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeu
 jeehhfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiienucfkphepuddtjedrledvrdehjedrfeehnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:h3VOXxNYHYcdYq1jssm29f85lTQpQlqKkksbfpGpXBy6jq-4O17gqQ>
 <xmx:h3VOXz7-BtViFH5TduyHTaE6aEjtYVX_LAUDtx0z-C8cMgadj95n0Q>
 <xmx:h3VOX7640V14BNmh3kEd3xYCQoj-5JEMCwbgrORv6Fuvn7xr9GCqNA>
 <xmx:iHVOX4hEiFS3fUYANros7xgZLqP8yIXQdRCNIw6B6OkJSKpxh0-5lw>
Received: from localhost (mobile-107-92-57-35.mycingular.net [107.92.57.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4DDF0328005E;
 Tue,  1 Sep 2020 12:23:35 -0400 (EDT)
Date: Tue, 1 Sep 2020 11:23:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Subject: Re: Need update CI build config for new repo smbios-mdr.
Message-ID: <20200901162333.GT3532@heinlein>
References: <SN6PR11MB35203BE16B23BAD1193FCB9F90550@SN6PR11MB3520.namprd11.prod.outlook.com>
 <5a9a43046be525f9ed5d23bc40eac14d4ed8d53c.camel@fuzziesquirrel.com>
 <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VjP/dwTbBl6I9PQk"
Content-Disposition: inline
In-Reply-To: <SN6PR11MB35205154DB67E625EF74388A90510@SN6PR11MB3520.namprd11.prod.outlook.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--VjP/dwTbBl6I9PQk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 01:45:17AM +0000, Wang, Kuiying wrote:
>  Hi Brad,
>  I am starting to enable the new repo smbios-mdr, but there is build=20
>  failure.
>  CI build config need add below depends:
>  DEPENDS +=3D " \
>      autoconf-archive-native \
>      boost \
>      systemd \
>      sdbusplus \
>      sdbusplus-native \
>      phosphor-dbus-interfaces \
>      phosphor-dbus-interfaces-native \
>      phosphor-logging \
>      libpeci \
>      i2c-tools \
>      "
> =20
>  https://gerrit.openbmc-project.xyz/#/c/openbmc/smbios-mdr/+/36011/
> =20
> =20
>  Thanks,
>  Kwin.
>=20

Hello Kwin.

Individual repository CI builds to not happen within the context of
Yocto.  If you think there are some dependencies missing, you'll want to
enhance the 'openbmc/openbmc-build-scripts' repository to include your
additional dependencies.  In the repo-level CI path, we build Docker
images that contain all the dependencies and build the repo-under-test
within that.

Your Jenkins console log seems to have expired, so I can't tell exactly
what is missing in your case.

--=20
Patrick Williams

--VjP/dwTbBl6I9PQk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9OdYUACgkQqwNHzC0A
wRkBwQ//d4QKCMpjjPy81bNYNZBHl7inoam0Y26PS4DdY/t4SiGzQ5AucwCTQrlG
SqLgF7Ow9ZNuhpHSeHMyoHGKknQjK5A+Bprggv3Kbt5s7trSp2fHzawJyT7Odu4K
eOcQKOP/iG/1elM89tSZ8Ok1v1KWlRqHFwgf5FOMPUNbKbGXOoxXp3sTCEsp3+yM
G5K7YUm2mVkpKKBuxI3i7YazfiO28aSj+qLgpTg8xX1r9xtnSyR5bk5nsRIPCcZf
TZkFNm56pedqkOh/dHRfErdGZFqOSJZy/gXz9MmI/tS0q2tHPdQTOcXl5hPNuCr3
9b3EP9JCZV0It8s+lvCpgXZVDMjJWG4YryQzw5DQR506wjOsUG75Qd69sm62+NJ3
BuxJBVPnHgty/q0ADjRaLbsV2aHsVPubPcHhIyKhAgy7RldPS08bzE2P1HCPFoGk
jE28Mw5+SZK/FmyueQyHaWSBB5MwdVwvvKAK+rUTgCf91vFQuIbKjtJ5y6s1gwsD
KGuPArAwfp1wUfiS3ddDwKj/jNXbxuwage4Py896rDkgF8hgkYa268B1bhtMiYwa
enMTIMo8mIywgfMabGtl5ARA6E6zXu5HjH6TByU76jFqHNrFqsPwdxcF/dKXI23R
ZncUKqgzMejNGXPLwDr16FKfR0jCPMM5oD1xycoS3TQ0d6uSOD4=
=52Tg
-----END PGP SIGNATURE-----

--VjP/dwTbBl6I9PQk--
