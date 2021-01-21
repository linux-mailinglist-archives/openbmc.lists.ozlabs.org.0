Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 508662FF1C5
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 18:25:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DM8RR4fQZzDrQq
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 04:25:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ww2QaezX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ERuaNjAn; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DM8QM61fTzDr3l
 for <openbmc@lists.ozlabs.org>; Fri, 22 Jan 2021 04:24:26 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D89D95C0092;
 Thu, 21 Jan 2021 12:24:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 21 Jan 2021 12:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=SQ7O3xguTSf2CZ7gGq4/f1kO1cc
 nnRSM96HG4XvexRc=; b=ww2QaezXqhQQJco38vjpXzUupXqQGNEwPRlrMg7yWjn
 0MRkP6tvv3BUS/CIZqeYvKI2rjnep03cs4F+tGP8JJWNRFv6y6UMRa5hmJVu8FHm
 PqzNzE0uw4pIrHUF2j3QD7z1Za6L7jyIHpeYswqcryAKsE8IXUuN+m+7JTabkg2y
 LtRN3AC2nwEzGc6x3IzDBrezdljut6QHzQGwzO+Uh3ynkubdgXaCGT7SHkvcx2kp
 WcvzNynn9G9158yLQH5f6s/TNXotuaCTr2pggdAx11MJa9W24laqD2I4RtjgrE2m
 NeWlftZUb2rkhiK9Jt2dhC2iMoXanpgbaIwJpO3a1sQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SQ7O3x
 guTSf2CZ7gGq4/f1kO1ccnnRSM96HG4XvexRc=; b=ERuaNjAnA7Ttgiz+DghD8B
 nvkG/+BugO895jx4duGjQYqqZqTZ5OWHLByXduOhNw/f9e0e15p7WQKlPfz5J6Kn
 DWrFEmZagZHmZ4+aaqpz5RXRQ+PHxsKNmZYL7vtaGP6JPZyrUrumj3DACs5npTer
 fm5VM5fK1N5O1fQ6E3INjUqJyh6GYQyhSbn0gDXkQaNQxYGr1qq17vc1YDJoaZXe
 XZf/ALNQz8J8TTJG2+AHhg2lXRDkeDqQ3j48cOgoKlar86zuSuXZB9CFcQ98KWs5
 jzYk2ZiBCeeMJytrX3r3e71YqlxHFREKjeBA8soOAAed531I1sRwneGOhg8LHjZA
 ==
X-ME-Sender: <xms:xrgJYJsYooVxLAZwyR7YGuZNLz5_2VIRV-_hBQSNcUXHRhnrK05kCQ>
 <xme:xrgJYCfY-ehAxSn0UYCfGNQR0003hd0XaSomVjEhLv8vNgpjcRVGvB8G1DFtCX2MS
 P52bpoeFdCr7vEiljg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:xrgJYMxq6LfAXgl9gHmiPACwN6vlwDA1G_JVFqD0G70ZQsyNfevf9Q>
 <xmx:xrgJYAMt3L7BlEyMR1a0r-cdV3RUwG3SE2Bb8Zpdire6l2cQ7ic6UA>
 <xmx:xrgJYJ-gN2mNe_DEA6G9x_7fFXwhWU8HbmosojpHBOMMDjMgfnOVaw>
 <xmx:xrgJYOJI3BuwZsmomRaw0DODu3YteYnmWz2hqQDUsWs69ekU9eoJTQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DFDB1080057;
 Thu, 21 Jan 2021 12:24:20 -0500 (EST)
Date: Thu, 21 Jan 2021 11:24:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: YAML Parser
Message-ID: <YAm4v0TA/ihdp7y5@heinlein>
References: <65A10B34-BBA9-407B-9A9B-C3B7AB282F52@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CCSK7hv0dx1uEwtn"
Content-Disposition: inline
In-Reply-To: <65A10B34-BBA9-407B-9A9B-C3B7AB282F52@gmail.com>
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


--CCSK7hv0dx1uEwtn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 10:15:46AM -0700, Mike Jones wrote:
> Which yaml parser library is used by obmc executables?
> Which recipe includes the library?

In general, I don't think we do use YAML for any runtime configuration.
We do use YAML for build-time configuration and use py-yaml.  For
runtime configuration, I believe everyone is using JSON (nlohmann/json).

--=20
Patrick Williams

--CCSK7hv0dx1uEwtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAJuL0ACgkQqwNHzC0A
wRkowQ/+Nku2CNptEXXnmFL8ISkMlAt9KHOLzarqU4OzcPBPmZoKSDzfPYuojC0J
sHGvnh/fMhbf6yA8dnuYIPgigadsI+g7LJRM26ZrTl//qQDY/giy0ycpTzmJYSbL
YD7ZW1vP+1P4lU8QpNZdS0GlK/YE4xyvRr4CMXN2kSlqjmpH2s1sXXLHipOsmo8L
M/MbL+tswH8URPHUj+cZ3Fr6wkg3lyqFCz789cJdwjxCfZoVGo+CK5YiRWecEkqF
tze1keq/v0GZpHSxqX2NDVPO2Cjrsx3hkpNeFIAZvMHOghfFGq9coKAaFhFu3MRO
Frcb83z6/hR9R6sOGK1CgmU7LsGaqnAPU1eGRI/8CJzTO1p6DHyMXPUepmInDP2K
SAPuMrRqNtFLIBrd8qEfOae9NbRRMGcUk0QqkS/JhnBONUXXyU+tGEF+KAF5vTN8
S2P2NJ7Ik3FHKzHGnelH+0SVrVV/kagbXD3GSuFFB6xIS3Mfu0+5EQmP44iiDaO5
GiYvFj5laouFRDqJZs43Arsd0bVfrjuz/epbcshLOv7DXlb21w9HsehgNBoYepYf
OVnT8XOZU86rnpje7E55zeRLFbWKBxvLqqvpnWQHWVSWKTWWBzG/Ue2HQICy3eTV
t5R7jvtsjs+wAPRpTz32ASaXHZVM9+eB4uISLLT2DHPZWWrneQI=
=Hhw7
-----END PGP SIGNATURE-----

--CCSK7hv0dx1uEwtn--
