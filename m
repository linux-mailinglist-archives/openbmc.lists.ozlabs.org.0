Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF33369317
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:29:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZrG4xXZz2yyb
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:29:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=tr0UlEcb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ocMC7ipt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=tr0UlEcb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ocMC7ipt; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZr20Jpcz2xZy
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:28:49 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 948D31323;
 Fri, 23 Apr 2021 09:28:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 23 Apr 2021 09:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6bTUyn3fL6eYOgi1/kRsKSFiMbB
 yR1ZBJhqJ6JkI/lM=; b=tr0UlEcbwi9MosuDQccTHeJi+SptEvtUi6ZtFkY8848
 we4/ABDwlhgKfSqnFXwDdy0gf3gMMLEPGXZeNFtfFtvOPodsAFqccsMYYrQWSCxq
 tl2aPQsZVPGVLIqGiPah5dRyXeaBmdj5WCx77FANm1nUk6izUNW/0FeP9h/CipUv
 dtcqlmb/kifs4KbINfQCUtz9JRsQX24JjaK3CsdabZiVEYH75zFkZVHuCVGbz+xr
 alme7n35eX3vKbfOLZErELyIbIvXAX3AIbrpqbKQlS72FwdpfPbGkhzTSRxRtbXS
 2YgXJ9s7sgW9IdPD/VMRessgox30Pa3/5sNdx5VWSnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6bTUyn
 3fL6eYOgi1/kRsKSFiMbByR1ZBJhqJ6JkI/lM=; b=ocMC7ipt5sZJ7Q9v5YU3VB
 G8LTOtvAVAbpl8wjaVY++z4uRM2sULbAXY7JylaWUR2VyNDSbWU1ZrU+XMDhF4aZ
 yMTSUHM5ZJ4BqG/Km24pA2WnhFusrCCFOmktsbXFL+/yVq3aVHjX+rG7+82JF+En
 0SQKMq138MrRu8O3VB6uCq8lcW+aH/M74gfJsE0pL8HXUbZOdmi17BIm57itfz0a
 MUbozVA3uNgtyJAXuhtenlDH04J5m8CGOTQcLoik9HZTKIbI1EtwTKY0wu0WRtXd
 zUg44y4rv46kO6lHA8t4Wi0/+3lpXY+1EXmaqKLD2kuhEM0HPO0IOfEbjZnSeJpw
 ==
X-ME-Sender: <xms:jsuCYHjFd6BXtzAW14D47pCLbstlTfafcVYNEpLdtdpsauiJFMCnUg>
 <xme:jsuCYKw0zIsCbq8PbYqvt_7sCS8-NVjng2expIS948LX8sZ0n_UdvccEgQTydZ-S8
 t6AYOmaClisOOQK0Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:jsuCYI3ViOaVPAJNm2tsJIApIqtjDL7rQDcQsbcTxDL_TcibmlQ4LQ>
 <xmx:jsuCYP9vOcNa73t3XGMNydfYYknpU_HuEAXmHWwI-rnb2f2_Ohox1Q>
 <xmx:jsuCYAp_tCggcOOOCFjoV-dhmKESayxRI1DCBaijO7l6iGaan-esFA>
 <xmx:j8uCYLi_PSV_Y8BgTn3beoVLyslbZLB7QQGJQRf0qSbNeWcadplixA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67C88108005B;
 Fri, 23 Apr 2021 09:28:46 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:28:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike <proclivis@gmail.com>
Subject: Re: PMC
Message-ID: <YILLjQfgD4Q2vH5L@heinlein>
References: <716C1159-9317-4362-BCA2-59E052D5C944@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pq9dUg//LcaYdAhX"
Content-Disposition: inline
In-Reply-To: <716C1159-9317-4362-BCA2-59E052D5C944@gmail.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pq9dUg//LcaYdAhX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 01:40:40PM -0600, Mike wrote:
> Is OBMC ever used as firmware for a PMC (Power Management Controller)?

Hi Mike,

We were working on a power management controller as a potential design
option for OCP Rack v3 and we presented an early look of that work at
the 2020 OCP Tech Week.  We haven't made much progress on implementation
at this point though as we've been focused on other aspects of the ORv3
design.  As code is available we plan to deliver it on Gerrit.

Is there anything there you'd like to collaborate with from a design /
requirements perspective?

--=20
Patrick Williams

--pq9dUg//LcaYdAhX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCCy40ACgkQqwNHzC0A
wRnO4w/+IFJQURt0Egyn4sbfJ1Q/hGlAFy1jhKGqoJhrnl+Ml7x7ZvVJ36UhK1ic
84lDirkZKXaMa8Izd9KS/mJkT2d8oGBPRLDgJGMgOyOSCHbdKjqKez+Sde8aohjq
W6k1K8qQHN6LMQX/pfUvYzTFQwfreAsICpuPQeM8vmICdTfulQxv2PpoR78S5XDH
6LYPvvirzNVRyOK4XehZHApXWuNQ7C1gw3AtuBI4QyVb6PspS4qHWots6DggLtg0
+6tTaGTPwNken3Ym0Wheru08nsbu/qn0hnn7sNp2kLeC3QjjS+VVvU5srskAsGbz
MtloqC2ob6JLCJDXfsUYeC+nWHr08HhwIUeNZ+fYDo4IP7R44tild2AisKt8Tf/N
fMPrczyncXa33rnGiyJWx2cWAk8lRM0zc8yKiYuR3U6OPU69gNzVSI0pKVdpxGNg
Su+5ApQWH7J5XCSUrxEuKiZS5I8YhOlV9gU8/MbngKMHSn/3dvcH8kZc8snOerSQ
k4fsU/KF3O19VDVDh5fFgy8pmTQ9eMUhs4u2bkL8md1yK4zgdXBCVvWL1yhL46mT
i3OwsNUwx5tznQS94a+YBtQ5KPd0PfLpgSgbt0M7GoMZ7PqMVEQ2YXL4m8CQGYrc
IjFUtPKdqCM0JqklHMZ9AscZdDRxq7FcpMP5aKcLW5keGLI3JEU=
=CM0M
-----END PGP SIGNATURE-----

--pq9dUg//LcaYdAhX--
