Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A785916635B
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 17:44:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NgR56wHGzDqWn
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 03:44:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=pWJGKhIb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3ZEOIJf1; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NgQZ4SkLzDqQq
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 03:43:49 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A9A14C52;
 Thu, 20 Feb 2020 11:43:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Feb 2020 11:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=x1L59WY0N071KIF/+/oFwYyVjTn
 QYVentq/GckQiS8c=; b=pWJGKhIb06omVHOWNBr2C1GmYU94AyRZYGn4nnwthCk
 Ed07am9fe1jR/CJ/j8LYwgcUpxL1SuoFy4jzaKRSXKnBo6aAnRnzwXCWGIMBcvib
 v1Hgeu+At7UpwLW61Epohb93rqEW9K7RzoevwoMGG2BEkJz4OEw03ZHEUmDYQSIL
 0LyfwZUY80dle3iDGEYFsMpdXEZ/4n3HMJ7QSaC0QOiW6HrvesqMx0VjnDsd0Fi2
 bbv+qtysj4OH/8idj0Bk+un9YDK+HcGircQ1FZ8/TTOWr1MhGo1Z0LKUbxlbjv0F
 rSZxMcJfYkuBMH4c3qR0la71tMyka/1/GfR5Q4sjvDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x1L59W
 Y0N071KIF/+/oFwYyVjTnQYVentq/GckQiS8c=; b=3ZEOIJf1BBLNJIw41TIqOf
 pSLqGJGajh6lmxl94/BzZSZzu5xJmPmX9o0LPcVOkz6LQW0aVvAo6bcdwBNmRliQ
 qFKlq2rtohWlC+q8W455hJPH3zGPu2rjT+P+Ddn7My92QHDUWaMUuXQH7wHW27eW
 Mvws5GQOcDMzSZmKgE1BQPOYjoygm63MPnytcoTtwG4IgOtHBtpqtasNsmXLbDTm
 ZjgKGprprk9WKRW31W+ZnErWCLzkeIZmUjI9T5p7dEB+CjYEUXvtpu26qp5552nx
 uMGIijtOa4ZDi+5YlkzAMZvRgn2gojErTbG4ISq88AesX3kA3D5q+bqyaId7c88A
 ==
X-ME-Sender: <xms:ObdOXr5oS4mHj5pDxWFc3Zw01vA4fva359rb0PONLEkNGzZGQWDxAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduieef
 rdduudegrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ObdOXpFd0Ep8HLO6GH-HWGe7-Vu17OntEbvVXtIKodFuouThZLgnKA>
 <xmx:ObdOXuDe7pd5355aT15tNbI8KuywLk_9JkoH7Clols7uNffXUEqk_Q>
 <xmx:ObdOXmyr6mXPJmEiX5qkHDfNui-KU8dchq095HzoSq-yYEu4DyfpDg>
 <xmx:ObdOXi5BrSZuxVf8tJLa6r0q1sWG5E9wFfdBFh-q0mLkiiJ2NrMxvQ>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1CFE53060BE4;
 Thu, 20 Feb 2020 11:43:37 -0500 (EST)
Date: Thu, 20 Feb 2020 10:43:35 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Subject: Re: Thoughts on representing the LED groups in Redfish ?
Message-ID: <20200220164335.GE41328@patrickw3-mbp.dhcp.thefacebook.com>
References: <BAEE3AD5-8D90-44FD-9111-49AD736EBB0D@linux.vnet.ibm.com>
 <A5C7580C-9577-4023-89E0-F7F715538EFF@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
In-Reply-To: <A5C7580C-9577-4023-89E0-F7F715538EFF@linux.vnet.ibm.com>
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


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 02:28:59PM +0530, Vishwanatha Subbanna wrote:
> Hello,
>=20
> Wonder if the community has any thoughts ?
>=20
> Thanks,
> !! Vishwa !!
>=20
>=20
>     On 14-Feb-2020, at 4:51 PM, Vishwanatha Subbanna
>     <vishwa@linux.vnet.ibm.com> wrote:
>=20
>     Hello,
>=20
>     Writing this to get your thoughts on representing LED logical groups =
in
>     Redfish.
>=20
>     OpenBmc LED subsystem has 2 layers
>=20
>     1/. Logical LED group manager
>     2/. Physical LED controller that sets ONE particular LED to On/Off/Bl=
ink
>=20
>     Logical LED group manager:
>=20
>     This is where we define a group with set of physical LEDs and their
>     respective actions for one use case.
>=20
>     For example: https://github.com/openbmc/phosphor-led-manager/blob/mas=
ter/
>     led.yaml
>=20
>     When the user wants to turn on the Identify indicators, they don=E2=
=80=99t target
>     the physical LEDs individually. Instead, they just set the =E2=80=9CA=
sserted=E2=80=9D
>     property :  =E2=80=9Cxyz/openbmc_project/led/groups/enclosure_identif=
y/attr/
>     Asserted"
>=20
>     LED manager will then request physical led controllers of those LEDs =
to
>     take the right action
>=20
>     Current bmcweb actually uses the groups than targeting the physical L=
EDs.
>     So it=E2=80=99s good. https://github.com/openbmc/bmcweb/blob/
>     1c8fba97b1feb4164e9b54cd66aad530bbfc1826/redfish-core/lib/led.hpp#L33
>=20
>     However, I am not sure if there are ways to express the LED logical g=
roups
>     in the redfish schema.
>=20
>     Any ideas ?
>=20
>     Thank you,
>     !! Vishwa !!

It seems like if BMCWeb is using the logical groups already, this is
good because this is likely what the administrator is most interested in
anyhow.  From what you've written here, I'm not sure what the new
feature is you'd be proposing.  How might logical vs physical LEDs be
presented in a management interface like Redfish and what advantage does
it provide to a user (over what we're doing today)?

--=20
Patrick Williams

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5OtzcACgkQqwNHzC0A
wRl47hAAi/bHOaR8Kq9R29WyTY474oozOXblhbl8UWGhJ7hwqIoSaU8BLRRL+r/c
YoGzy83jBet4VUPWQVaTt6/d2Ge0OEy6yoUJ3x8qUWsEvNFAuUfjckW9Sxf0lQ+I
Erd3WocN852vLsllt/LLufPi4LDzVDyc3JbmD+vcOs2Saksqdt3yslzXb7ZgVetF
4E0YjSeCYhPcBi7UUERqBV6R9Vk3K40DhbVik06JnXzuQbXDLZ72ddQJjd1qK33l
2a1+ZHre5360e/z7ViZw/zTBKWGkJ/SZYMkg3MBMtBiPoHpBxdVMETqvwEJBZhPq
LPEgRDnwP50TVKdcydBZipzC7WjIZajAM1QQ7TXiHqUZwnhiXPQ/YBtpaSVB3kbA
9CLjyvJwch31fJPo9dyckRQBkguS0gtLPGWf1MYwPT9hG4aIu5uq15pjL6bYfHhm
kFqJhypSe2z+c/oFqLmi3QRcawgmMg0KssN+MM9F5uYSZy1u2ckBjd2XfueU7hZ0
ONPuLIe5ASKtyZNCCEYXXzrOm6MQCACOqYVen2u2t7M5x/tI463A3WLJBYraKKFz
WqGjE1fTFZrFBeIJNn0Mm0fyz4V7m/FVSrSTW3AyIG99WfwPIsWi0Ac2HN3nRn8M
vfFmgnIdB2HUKf87Ovin4zem2YPv193YUdejX1By2b+PjKCakX8=
=rjc5
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
