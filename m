Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9815222E
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 23:00:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BzCL0N49zDqM4
	for <lists+openbmc@lfdr.de>; Wed,  5 Feb 2020 09:00:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=f08laTvH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fHGaHrpI; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BzBg6F6jzDqBX
 for <openbmc@lists.ozlabs.org>; Wed,  5 Feb 2020 08:59:55 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3691D8233;
 Tue,  4 Feb 2020 16:59:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 04 Feb 2020 16:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=wHpCoqhklgg7ayRuTGP25sy6byE
 9XujHoBM15xNG7+g=; b=f08laTvHGa9VpWznxGtcbzp1BNzbWH/HJsEbXT5YEoR
 iG0r+IcQwIMlzypdCIDTzsERSJcDCQFnCAsz4GR2i14RzxBhdRaTM2TwpMI3BDdo
 O5biEmE33j2dzPC8chmqjl3EulMIabfgBewHyhfVvbdxHGdQFz/u6FZsEJv+J9Vd
 ++11qru+XhTlHWqLuAg/7/Q+LXOoWM2LY7p0Ir7zSN2I/tLCcR3zp9Dda+zosDtk
 xoNsBxtcUTTPwFwQbZZOkPshmacQ38Su1txsF8DNHT4EpEPR6xj456hLz4McGOkk
 Wn/3oCfhdLLsNU5P5vV71y1u7mw+dJxzDRoY5qpkzvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wHpCoq
 hklgg7ayRuTGP25sy6byE9XujHoBM15xNG7+g=; b=fHGaHrpIf5zOhqzhqv5SFG
 /hfkaI3e0uZsVOsOJQMeEsGn4kbqeCxup/QzgbpSUnvyuWDLm3Qm77Mx/jHQP0Ui
 NMHd2G+AtQZwwNZy1p8tlCLdOiSs14wKq3KKQlBmPhZzo60/L9BFHmhdYu0GbZyi
 iuQp651ctYjNl2GK/iFTTPtcBeQqr6cI/HO1tPE3Xc+YS7pJRggiVRxwBu/HchQI
 3DB1dEApHtKgCbRfk2sgpG3ZrTWw98s4xIAH8876sPGb4wSrmGwj017kpPZM70rG
 k6tAEfkHlCo5YNnf4ToWNc05e87ZTAOA20LWgsWiiVqAlYZfF0N+gy3bSUI2YHjA
 ==
X-ME-Sender: <xms:WOk5Xj1hUIo7Mp6qojlmMWvl3zL5Wkc2JPgwJiikzZZvA-bqUtpdpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeelgdduheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:WOk5XspCvBOjOIBa6lIj9d3N6YXiAo6jwKIH6NUfz85aDLkcwJiQ6g>
 <xmx:WOk5Xgf6gSI95rzmLRBulShpWiwpIcTLBeqhAYXc18pRz0ksXhhdcA>
 <xmx:WOk5Xrr0rrW0pK0XpiezGpMYoGjZPsrlzAni61pCghUHp2j6YA8WUA>
 <xmx:Wek5Xk6UFAW2z6_bWuayFApyIbQ-UawEoQplum_PYFBq_gtvIncCVgs9CAY>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id C26C43280060;
 Tue,  4 Feb 2020 16:59:51 -0500 (EST)
Date: Tue, 4 Feb 2020 15:59:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: [PATCH linux dev-5.4] ARM: dts: aspeed: witherspoon: Add gpio
 line names
Message-ID: <20200204215950.GB20653@patrickw3-mbp.dhcp.thefacebook.com>
References: <20200204213037.42100-1-geissonator@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
In-Reply-To: <20200204213037.42100-1-geissonator@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <geissonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 03:30:37PM -0600, Andrew Geissler wrote:
> From: Andrew Geissler <geissonator@yahoo.com>
>=20
> Name the gpios so libgiod will work with them
>=20
> Signed-off-by: Andrew Geissler <geissonator@yahoo.com>

Great!  I love that you used logical names here rather than=20
schematic names too, so that the userspace functionality is
more likely to be common across machines.  It'd be great if=20
we could start to document a list of "commonly used logical=20
GPIO names" (ex. power-button) to facilitate this sharing.

> ---
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>=20

--=20
Patrick Williams

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl456VYACgkQqwNHzC0A
wRkMeg/6A2DdnAA8FpJ+QBJCgtKnwyUuWOtD7wfnh+n0qfBrj0+qH1bn/BjNkdjO
ChFIknSLsW1DP/WyhejHu3bkysNutQIBpk1mCmD6QC/dgYIDr3HDezXM24XagjfX
PI9J+9QkVnYliiny5f9YrGCP56KvIlBak9jiCd2Ie8+wBzboTiGz5YfmYQdcaCPk
LNB+EQ/GYE+bJ/A+m4JXYF3Bmon6H6nCBTqrO90LIa8HgZLriulWydbsK8dQ1dm6
XT02rof5RhkyIYCGv1Vs+jLAoTWkO7c98WqpCLTui46ZiDOTMl3X3tPGWORIDJxR
YIIQH7qKOpJ6O/vRHfn7Od4TtQDeXpI/gJE4pRQxh7XHaWUGrRzs94DHc2T3ufle
7iOl9KPFQkERbQM5N2cu3Tfd5cr37WX5kmPU0FqxjXt1Ljs78YdhhcoJFKi6Esxw
WSiHeba12wRLa/GE/aX/EPidnR3sIIV88ghe96vQHpv0tYWJpAkKZyR1ghI8E3QI
nrlWjI8UqopoOc6bfL020j7tdi4qj3Sgvf9FWcuQpwhi0br6Gl6bMkSH5pN8zi+n
Tuv6keiHl+s27A2dD6MDV7jUckQ3hr3tPlH8LnKuYAmcXzORnRyZf5rOtEUL08GO
dYlJHSAj3y0Z/vTLldaqX9F6hdrUnBISi77Sv1xcsxJs5nhVXDA=
=xzjb
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
