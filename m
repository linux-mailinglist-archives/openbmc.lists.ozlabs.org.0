Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA6190371
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 02:54:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mZ7R1z9dzDqs8
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 12:54:43 +1100 (AEDT)
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
 header.s=fm1 header.b=uQHhef1+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=teAXH78U; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mZ6c1khWzDqlL
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 12:53:58 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C56025C017C;
 Mon, 23 Mar 2020 21:53:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 23 Mar 2020 21:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=B0OOGNsHQNYzKygFkftHPmC8uZw
 eDr9DqVJUXHvljEA=; b=uQHhef1+mwNrHRYvZtj0S+JTMbDzntLj/cai+mvhrtz
 4KZq6va0v2PXL53fqOxcAy9b1FylXuzRYK1ggrUBUWUKmU7otVPsl1+HoHCKZ4V9
 y3tHmYX3o8W10QTbDVdrGuLFi947ZCjj1MnpsrE72HmQBnDIhtjvWUo9n8dch8PH
 Wx/hcrzz8YUcLGCDivBXSDWKCYzeIU+j7iBeYbr/Qh2NN/Ns58kT2mgqDG53LJXZ
 dxMUPi4HOjhiU0wxhYj6902AmRgcAv4TOFlmgwWdRyw1RbzUflbDlJ70YGYEWnWD
 sjaUMc/BMrMZYCC8lRiBdf07vmBnSvOwNgMF1YEw4KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=B0OOGN
 sHQNYzKygFkftHPmC8uZweDr9DqVJUXHvljEA=; b=teAXH78U3f6n6CYe4jG2P9
 qHJenRh7+kziET5c1A4iUQfWOeKKHLcRGz9X9T3ybyWdyCCEl8Wj31KmBT/VpoEy
 F/mNdSAt7e8mINnfIE1vaD/mzP2IrkSGYOeyybxLdbELhnwNgJfSSSsU/a25Fw+0
 13YjbkwRzrqu/5mDpl0MKAI6MIZH6SbInOfcgePxQeHjHW/uVX8Nen/AbdV2A9ot
 UxqbmAwLhUFUPZCLJesHV/wcMAnl7j0zaICJYi97iqDFlCdBhf8UommYU1cl5mlR
 wB5U17hA9WsS6FJq16FGiNBrRTg+J6ovrbTcMAT/IgHvpo0JvCC+WPYEe47uVvBw
 ==
X-ME-Sender: <xms:MGh5XlNra_2O2lDfZlDcMBFKc1iqKzK5koy0r1QhlhrztQs4lAgIWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegledgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:MGh5XjVj7HGluI9hk52-gEF28uAIAcv3Wb2vuaGTM_qIb-sssTCmvQ>
 <xmx:MGh5XtrhVHpLEtAehhjTAeBQGKGSKMTwZ1KYcHw_uO6mv9yEeLAZ4w>
 <xmx:MGh5XpdNcQ0D49xsRx-c2KRVa0QwbU_paRX_2PMuFtUeKg4yrAOurw>
 <xmx:M2h5Xij9zaPrgpBKP4EfYUoe7WQwjgqOLUT13aZBXznPK1g8xjE6oA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 982EF30626D3;
 Mon, 23 Mar 2020 21:53:52 -0400 (EDT)
Date: Mon, 23 Mar 2020 20:53:50 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <thangavel.k@hcl.com>
Subject: Re: libpam issue in latest openbmc
Message-ID: <20200324015350.GA23988@patrickw3-mbp>
References: <SG2PR04MB3029044A332B70F9FD918606FDF40@SG2PR04MB3029.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <SG2PR04MB3029044A332B70F9FD918606FDF40@SG2PR04MB3029.apcprd04.prod.outlook.com>
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


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kumar,

On Thu, Mar 19, 2020 at 11:27:20AM +0000, Kumar Thangavel wrote:
> Hi All,
>=20
>              I have cloned the latest openbmc image and tried to build it=
=2E I am getting the libpam compilation issue while generating the image.
>              Please find the attached log.
>=20
>              Could you provide the suggestions on this ?
>=20

Tiogapass is included in CI builds, so there shouldn't be anything
fundamentally broken like this.

Are you sure you started with a clean build directory?  Can you try to
start over with it and confirm it still fails the same way?

I see this in your log which indicates that it was not in a fresh clean
state:

NOTE: Tainting hash to force rebuild of task /home/openbmc/kumar/tiagopass/=
openbmc/meta/recipes-extended/pam/libpam_1.3.1.bb, do_build
NOTE: Tainting hash to force rebuild of task /home/openbmc/kumar/tiagopass/=
openbmc/meta/recipes-extended/pam/libpam_1.3.1.bb, do_compile
WARNING: /home/openbmc/kumar/tiagopass/openbmc/meta/recipes-extended/pam/li=
bpam_1.3.1.bb:do_compile is tainted from a forced run
WARNING: /home/openbmc/kumar/tiagopass/openbmc/meta/recipes-extended/pam/li=
bpam_1.3.1.bb:do_build is tainted from a forced run
done.
Sstate summary: Wanted 87 Found 0 Missed 87 Current 101 (0% match, 53% comp=
lete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 503 of 823 (/home/openbmc/kumar/tiagopass/openbmc/meta/r=
ecipes-extended/pam/libpam_1.3.1.bb:do_fetch)

--=20
Patrick Williams

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl55aCwACgkQqwNHzC0A
wRlm2A/9HwzrKZgsigUiTyTY5SlSViAAReNXs54JVnXVayOjdDiLdGsX78d22hne
LQxnxBCmNOJV7rSmyzng3NHsPfitsH2q9TIpSDwSnath/lxm7CX6yA2Y6fgIPt4c
0CrW91qfPN0MRtRVvEYuJkWMkJR8Q5v87AE2ea6oLDdrtxjroHlKLwIwxf3sw5Ss
fFIi2DcN6rsptasvpPvatWqTUeMKn7IrwRW1DilFCKjLKpzDnzc1IzfFnGlQAJfY
Oedyu9XDDaQ7JIvYy2CkCAXEhHReft4k9wLXY/UOAVcE0LUafr8sPrwFU0pOzT+8
NHnEUypYL8rbcioecum/PkVRxnVHmjRhaVQQlLPZt4lamGDybhOJx1zlqMlHI1jm
qRvgrZFsIZm2c236laj5ywetUVtpMP5SB1Q8+PweHqsOtkC8hruwhNqI6hblHWlK
4uLoeNZ54vGVki3ASdK7tDSJg8Rw6Vk9dZA1Yf0SvmxIzAAVsslVqJvKVCpDl82c
Kr6BD8XEw/+UMi99kW6PInq/yh//N1xxTJn0gR6LqOZboA7LCGa6vYuD3aFnQqC0
6tApzBaWJvWdCGSQboerLUqluB2LrKJUOwsxQVDeOhnJz7Tda8NL9spujKNnbrFg
zhR79wrP+mX5wKRmKLipZhO7dUSPzlxfn7T+vCVeUeSxhXofLqU=
=lJBy
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
