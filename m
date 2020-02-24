Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FC16B102
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2020 21:37:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RDQ16QCpzDqMM
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 07:37:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Lxso+BdU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=yJDO6IiI; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RDPP4Xh3zDqJg
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 07:36:41 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C73E96E18;
 Mon, 24 Feb 2020 15:36:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 24 Feb 2020 15:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=INqtSr8xOzKMy/Ug/q0cVGKlS83
 zkwY2LwsO4vcUILw=; b=Lxso+BdUyFzpoeTCBzhMUoXGNuPQarDZSYFCTCGO0R6
 A/yHOM8fBmwQ6g+ou/6KK/5ghHBGQ1SWg067N9fSbycMKGIkoF2TKq4zAgZ4bZFg
 145mEKjP8aaTpTAGBe/dpt3uezYZUlXsWrMa/iul3K3Z2MAwn6aJ9su7Zw8k5vCI
 104HF27MXU3sAebVjvIvxtxhyAziSgLgA3TRcL/m6A125qT7KvGGpJpW2lu1K5L4
 VFSFFgHjAJEnhA3tRsJ+s2VoFjDhXARl07tfexiPYvQrVwNfizuggrjZNAf7w7JU
 DbfQqXTa8EAs0+aBKfOKTugRYbPYcwkPnDpeM4JtJwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=INqtSr
 8xOzKMy/Ug/q0cVGKlS83zkwY2LwsO4vcUILw=; b=yJDO6IiIFHxeafp6FCKahN
 XCkNhYJOVZZFfSBKnMBcbsy/VaaK/DA+JLsZjaL3HIDkyCH3v7PCcvq73tWevkQU
 sWWLbC7m633zwQJ0dxrL1DOU3FoyprY+Tu2E4byq2EF0M+B2GC+Z7NNg3ExMv5Ge
 3O9LApze/6JbdaPZb68Lu1uOZ4xCgB/hwZQ8ASSqTADWMSteaxReaya1ZQphTjna
 KE95L98Sdyl0w8mHMQi4yy0//3kEJJrClRqq0fXi7YFOBHMcy6hBH4qiW1918Xmz
 2YGVF5omDXqtPjTcvBMbMSCkNo4xrAdnzfz8vIzwkhDUz8AuJdn/bYWcHtHoM4aA
 ==
X-ME-Sender: <xms:1TNUXkaidL-l18cY5Of46Ib1BoNyLt8KcaJBokUacZRl_AWJPKJE8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtgddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:1TNUXpuiqS1C5Colkovd4y8zSEYCDOfikpkKRGff1p7h0AuuulbtJA>
 <xmx:1TNUXmduyGyyHB6GD6sYa0SfEw6fUNRP0hxkKzo2bRB-H3kEsX2qXQ>
 <xmx:1TNUXtbAK1GNKgnNKFVRGiB0AeWPg328wbHz-E5eR1Nt5v--8f5l5g>
 <xmx:1jNUXjUzgntSx560vaNNZ2UOCLjInoaRPcWYWxxNvTJ8_9iYzMz79Q>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7BBE3328005D;
 Mon, 24 Feb 2020 15:36:37 -0500 (EST)
Date: Mon, 24 Feb 2020 14:36:36 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200224203636.GF67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
 <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
 <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
 <9B609C37-44FE-4636-BFFE-76BB48DAEB10@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline
In-Reply-To: <9B609C37-44FE-4636-BFFE-76BB48DAEB10@linux.vnet.ibm.com>
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


--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 11:38:56AM +0530, Vishwanatha Subbanna wrote:
> Proposal for now is to:  *Remove the support for TimeOwner*. It will be a=
s good as BOTH

"TimeOwner =3D BOTH" today creates two virtual clocks from the physical
RTC by implementing the Host clock as an offset from the BMC clock,
doesn't it?  Is that going to continue to be the functionality with your
proposal or are you reverting back to a single physical clock where both
Host and BMC can update?

--=20
Patrick Williams

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5UM9QACgkQqwNHzC0A
wRlCEQ//ebXraF1/lWRRqAcGlV4VCG2VEMCAv4f2xf7wd737IQrtBKUuLLZlKk66
K9eLNzZDUDvq3L7ml8nS1cWVSzmKAiVRHRxUuMIYJFUuJ5WF+SsnMUPt3cXSvw9R
z9JFcWXh4vtM1LqHcJJnywT7ZQnEfIUMYmbq5dgenpZ0sQWdgfsOacwV1XDdHdmR
QuNTUEsGVUt6+E6IAucWvMzj0/1qaB1cpddddi+1gdIm5CPsRCNZl3SmbHx7aXo5
BgOaJDxpUvdlMoaUQ87yFoJ+V6vpjM/JnAARr33paScaJLFP1h0vUyhbmvoPqp9r
C8ccMCKoX8zIo6y1UXRlGi9+BuyRa9S9LXKwMngZMUA5JydZjEVGMTZDq8Dyc3+q
CMQJSn8X6QB80E00mRx9CDJQO5JmKJvduSCGONuGxGFL57lBly5nftS2Thi4e8n5
HaHaWg8L+S/s2ur7kzog3OHUo/f1QlsmVKiYPSz4v2ypk97QHqJ6uB3DTfsncs2u
BXiBh92br/cpPySKjGqwmtE0TCZOSmpXB+ffKmEU3k38xPWTVR5injOc836ctWJe
2RTGmyGozMmbelbYIimCND/x0SBagbvJR4R3ViLfH3GHf24wlNrFEbev7WxxDvjT
LalcywE7SSb6A44CyKX5r5Oa7q666bX4nam6lJT9qUsWgr4McNI=
=zukR
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
