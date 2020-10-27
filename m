Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581129CA20
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 21:27:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLNY53YMhzDqDM
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 07:27:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=hK9vmKAz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HRmmG6OU; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLNXK3lJ2zDqLF
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 07:26:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 885AF5C0064;
 Tue, 27 Oct 2020 16:26:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 27 Oct 2020 16:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6YDcSXyvmx933X/qSn0poCjdtk/
 0YJTjFLU7kV3sxns=; b=hK9vmKAzaWqNPnz8LfxznM085u3QZj+uZZXVpyMCjBA
 crL0u+ZwVqJZvCmf4iqJgoynHix2BGDb6g8eEusx96qMHx4HjsLEVqf9YLDz7ycr
 NPF/dZriHm9sM1cemUwev9+GcKBC+AsmmLB0NCWK1uwqeSiIWRj9jyBVF+RWSf5Z
 lXHRwkyktdt5pBqyz94RNw0h7p9FuP0L1lwhRkirutcRt/aLFWfl6uKI85S7PGOP
 MbGtl0hvtP6IXd/NS/vbNFrwDxvZ9HqgGyeHpn+BhFXrnZaWe0fwvTnoCyKOEI0Q
 BoiCIJg/JYSHg7KjS5KDYeKkLCY2wsBOPGCswTQoPug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6YDcSX
 yvmx933X/qSn0poCjdtk/0YJTjFLU7kV3sxns=; b=HRmmG6OU0/TBax0zHAsX10
 8sg/mvghZ7zpFhvb0rF0yVi9/p+ozA5MPynzTSXteNZ9jMLgG0I2PbOB2MZMvHFM
 nnSeuInOk+tGHUMLt16VLm+YRHcTmqodqjpT8EzbOv2c469zmIBHsnrzik5et4Av
 TdcGqzMo9EoMDmWI0VEZD71Xd24as0AbjwirSGnyvemedWWA2BaEY0mXKvHn6woQ
 pYlN/2QG76xOOMN6qbFB7mKwI6QVJemX1I2oNh0KYOAHBI/F3NNYvjrwfx6jqVNa
 yGal1+dpOH5RhB1iG5ZFXf8Klny+TmQeSIElMlGmRELO/gku7OXfaoBc+GlDVviQ
 ==
X-ME-Sender: <xms:fIKYX4rs3Hbo4zOFsPZD43lQxa1p3_IC2LLmEneP0qfbdFAOEDJmZg>
 <xme:fIKYX-rOwhvWQyQnh78AbP_WEp7y_Gxwop_D1HQWo4qiOFusSEJ79wDOC8Pf9MPqv
 uOv7LuN-kNhafDw13A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdffgefgfeetiefgtefhieevuedu
 gedvgffgjeefheduteejfeffteektdelhefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:fIKYX9Ot8HqmOKuBvyeIdcQwuuhKgnszKxtjt-2igMFTUbJP6ha7Hg>
 <xmx:fIKYX_4ADRKwN6PXv12vULe4C13Rq7jsAVSGOxaUuzukconjnn689A>
 <xmx:fIKYX35k2ciQqAglncLjSWaQrHIsrsr-fhxAGkwsnkCfdH7pDtJw_g>
 <xmx:fIKYXwU1NkAlhTj0kU6u_yjLVQWcshn_mbidY9D86DRWgzTnK0NLcw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id F127C306467E;
 Tue, 27 Oct 2020 16:26:35 -0400 (EDT)
Date: Tue, 27 Oct 2020 15:26:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: VR control from the BMC
Message-ID: <20201027202634.GF3614@heinlein>
References: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline
In-Reply-To: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
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


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 04:02:22PM -0700, Ed Tanous wrote:
> In the near future, I'm going to have some needs for OpenBMC to be
> able to control VRs.  These VRs might be on the baseboard itself, or
> on detected PCIe add-in-cards, and controlled over PMBus.
> Additionally, I will need a "hardware safe" way for the host to be
> able to modify the behavior of these VRs (usually different voltage
> settings), and to have that interface be constrained in such a way
> that the host can never set a value that's outside of a predefined
> range that's known to be safe for the hardware, which the BMC will own
> the definition of for security purposes.
>=20
> Does anyone else have similar needs?  I've been pointed to
> phosphor-regulators which has some similar parallels;  As-is, that
> solution won't work for me, because it's relying on fixed, platform
> specific json scripting to accomplish its goals.  My hope would be for
> a more generalized linux devicetree based solution, as well as a
> representation on dbus that could be modified at runtime by
> Redfish/IPMI in band.
>=20
> Is there any other work I should look into that's similar?  Does
> anyone have any strong opinions on how this should be organized or how
> it could be built?
>=20
> Thanks,
>=20
> -Ed

Are these PMBus VRs?  I was able to program limits on a non-BMC project
I was working on using the PMBus interfaces to the VRs we used on that
project.

I did need to write this patch which I'm still suppose to clean up with
some additional clamp_val tweaks to avoid negative numbers.

https://lore.kernel.org/lkml/20191001160407.6265-1-alpawi@amazon.com/

--=20
Patrick Williams

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+YgngACgkQqwNHzC0A
wRmAyRAAqkZG3D54bZykO2Jq3OIJYyb4YOwdZ/Cs+GH9BbNSx46m9xECNcpjqUKj
A1FpipPmFflZDXuI1uerCFiZLTA6vEcpImG4Z2M5FA/nx8uDT9XCcVkrugWL/kUG
A7RLlDbEXqH4WJQ9Ft+2h32MenED51QXwcYqiyN/0c884qT/mfOmIB5gwReVeWww
65nxjoi+DLSNWAxiMQaupA73A48QCotfdMu2eB1EASY7rO5hsBDdGQK0eZRjvZUb
IG1IcMS1N3To4VOa/WEXt/DslA+Hgl3fbHZj6Gt8n5ZshDru9BSJaswDMCGqk5Yj
muDvRSmmsLM9O69rebHFp2datAvpI7M7BUWE32hlOGSIjLCTh3icgoh0X3udH7iV
uCgQmCYYHcyBakDolToDDBA1IWW21L81hCdiAMJQvDw66Om23ZS15kHlpA1fCmyF
8DEtBCclOqZK7wjY5NMxRhwMSOerGWlSTXSR96MaAnkhCnvwP7Y9Hj2EuMRvhRUL
UGmIHA3o8VGtrC/8BesuYHWv/IF2lh+D2vmjPCUN1SYUE7U5N6tCA5+6YssmtS8z
q/RsxPnel0hjW7ArfKAzcMQfXEtkdeZY06p2ccMBAghIuy+jPbvt2OhqBD8TPdBP
rJp1rAHpREII8d0SsyMy3F/y7Ue7fU8I8AbqzsFCNRmqj2U2otg=
=KkhM
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
