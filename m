Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF81915AC
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 17:08:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mx430lmxzDqpM
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 03:08:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=JwW62AZ7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=j1p0QtOd; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mx2z03hPzDq61
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 03:07:05 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 602C4623;
 Tue, 24 Mar 2020 12:07:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 24 Mar 2020 12:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=mTw88dtwGQESQ407kcMNpZKxRqH
 k6kw03J7nGD69fIg=; b=JwW62AZ7HWOqVmox83Li3NoMLnx85KZRBKNXp0G1s7W
 8SvUGAxx6yvHlV067kbDiCiZsP9rk+5rzZEIIHqKXECqIdzFsUVQ2uAOv47aW6fc
 bzYFZ8gmR8qEOCuOZhq+lZRipxqvTo2Yf4gbNCeTKrKQwGJjhjfUliDz5ZoVfNsZ
 vY2KKcfa9bcMU3YRUL1RkTG9sD/iaxdDRS5HbDtejeInD1heVIjSLRFmqEh8kPrp
 Fi7qM2d2iZmz4TrRv+u+WNEC7+HXKaMNbLQ/3ZAZ5D6hBN4UJTHKKcVRs5poAj2D
 KV1NFXYKq4xEQVFIVaOuUA7UIASatldD9zxT+UJIVBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mTw88d
 twGQESQ407kcMNpZKxRqHk6kw03J7nGD69fIg=; b=j1p0QtOdmSz4KYCpx9+xxU
 Rg9vpkkwy7Mx16+DrIuEVsreMP7GGXBBJ8ps5VjkZyCV39i6EhMnmzVFrgnDAmak
 Uo/n/2d64Eqdfx+LRbYH5Cu6EhRR7JnJmGe0yafx5G1YxnjDkJ4KJuL4bgJrVwZQ
 yoxY+A+Nr7xry15DRvmJL+GVObxQZVHTqQzNwWNqzSQxQE+sa0Edg8VHqErgFKIA
 gO9v5HPWHb4k3B8a0R5N0MRnmDEo3T54ctneraMIbae+bTdV13E8jm0Gyghkax+3
 BVWwtw8Ge2yuj4/msZV4vdklPCqgEV99IMNQJYRNBuj5XBYHQvis7nERItVK8CIA
 ==
X-ME-Sender: <xms:JDB6XjQUaroAYysvcFwUiWizkZxBI1v1EG7wyOjE2NI4i3MmCHQO1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehuddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:JDB6XmftnfibVnU7zN1E8XPqOSC730pB54LScm__qzuODvNExwJOHg>
 <xmx:JDB6XsRPe-jw5kWZu5lJVCSsbQJN36BPXweqAPCvTm2wywU-In6xrw>
 <xmx:JDB6Xi0ESqCkPWD6LLyEx9f7tQa6P40kGJTk3CvSa1Lone5dAw8eEw>
 <xmx:JTB6XjRl5KuYs3LZENZnlQgB5e9IGQtGqPHZlj07Nc4SuRwNUp6h2g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 70AF930650D9;
 Tue, 24 Mar 2020 12:07:00 -0400 (EDT)
Date: Tue, 24 Mar 2020 11:06:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: corosync?
Message-ID: <20200324160659.GB23988@patrickw3-mbp>
References: <AA561FEC-E514-41F1-800F-B1085C05D6C2@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <AA561FEC-E514-41F1-800F-B1085C05D6C2@fuzziesquirrel.com>
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


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 11:33:23AM -0400, Brad Bishop wrote:
> Is anyone using corosync/pacemaker on a BMC?  Is that a crazy idea? :-)
>=20
> thx - brad

Can you elaborate on what you'd be trying to accomplish?

--=20
Patrick Williams

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl56MCEACgkQqwNHzC0A
wRnZqQ/+Mfoks1WCSpI/Wu971tmKxPOVsKxSwFnf91aARgXFlPFz3feeVZf9BNAm
vY7BQQbA+6SxZGnauirA/bJYmQbZXoZr2M7AcxqMd+F3W9PXwF3WP5BPND0HJh0b
Aa2gbcyVddPbQLiyVevR9Omn7CdEKmx6UTg/LSltXVQTq970THiMgc4NmWgneiC1
3oIGopjF1RhIIHWrrlF1i2a2FLwNUgu96K7Tsxa4TXeRITjJchW3Ou3F+Bi/H/Oy
/IuHQ2VAC2jbWZoJpDllSf5jL+h1qahVjwjEpArlmCkn6alVvwKXRNQCghVxJp2S
DxCVQXkCCxNp/6z0eZOUMr/2e/3pA7ATL2bwbUO3RpEMCFajRRKEF4kZ07AMjF33
ZoSrG5nCv+nHqkH/sXUe8fXBnupODY5Z//DThCOGOCIUeWccuD0S5O9y2lcHXUKl
GO6p1xEgBLJEyYPB7+k0R97S39/zCyj/MjyiTZYE3yCMzhteSwNEPCOKynRKOXqD
dVc/roEhGqRt1Ju0ZG/DW9f9vfc1gb+6Bi3loDlTb04yWFtXOAc7kWtiF+Rl7pTx
hAYyn3dzE3a32z7mKOuEnq8Ere4tYZt87JU/cx1v5hQgqJejf5pQIfrND2aXZzoI
AB2kmwEswyvMRO0OMD8nB2DyuhWPEcHZjrAU6ivmIpRL301QeWE=
=aE6T
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
