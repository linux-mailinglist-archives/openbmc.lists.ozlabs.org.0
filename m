Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49065121F7
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 21:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpSky5bH2z3bbs
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 05:00:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=pZHO5TRC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TtttghYq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=pZHO5TRC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=TtttghYq; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpSkT0q2sz2xBF
 for <openbmc@lists.ozlabs.org>; Thu, 28 Apr 2022 05:00:32 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 62D945C022A;
 Wed, 27 Apr 2022 15:00:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 27 Apr 2022 15:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1651086028; x=1651172428; bh=FD2TwkjslY
 eqOMmgAzGTYloYNTWbnW9R0cyvjmqihoA=; b=pZHO5TRC2sKdbZSkNmXV4/lYzs
 1muJaWA6MBCiwC+x5opOUyP8HlmuG2P2lw2W1Zfe/XhUbQ2OcbhjIDA5m4209mmo
 OQGaSQNlzqh3FHAan0+nnYCa5BUJNc6I8f8Et1oiymk3zw/m0OmSMMm5Jcc9SkvE
 VM7yHhodWX1CKbN2Me/vL5zdX8Z8QhNU+0jdCsYBuFuHJoESIIdNrOkSH2HI+yUQ
 VcSeLXujuT3XIrxlVa9STYCmuPpMd05TyRLuSpVDM0yYL3ajiUnmmOlgTprfVeX0
 enND2yJbcqQ1Ysft0IBraP7sx/bbv7WAWPqfbCKgzwVvxBWkxymPM8TzK3qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651086028; x=
 1651172428; bh=FD2TwkjslYeqOMmgAzGTYloYNTWbnW9R0cyvjmqihoA=; b=T
 tttghYqhCu6ybcg/HEHOhyhfe3EYx45+eMhxXn257+wlqdeYva7qm6Uf33aWqqfK
 N3Jv1/VxeXbzIat4v2aOeqpiseJhJFZm1gDqDcTfLFWBIW5Mu0U7j/VGMD78p/4q
 WmAsRQUYGqnp/4dljFrooCYa+XCLkSgjjEStduzBMHJX5X3PABwCkUejM/T0tF0v
 wIh5O5YIWUeLx6FY5zmv+aUOs5/0zsIIu1UueiYQLBUeI6TYiGlD/bYJuASugbli
 pgcvmyGcZ2CfLvBY8in1XfxfMNxpfRSyAOSSs/eAULoti6iJzIHD49rNarEs2Fn/
 CP5sBZNiAdQ/dd5w1NOsA==
X-ME-Sender: <xms:zJJpYp9Kc51LjQP46okCnvOE6KpVdW2ofWN5qOLt0FZTnnkhCLY1cw>
 <xme:zJJpYtu7q5O3TCOA9bCFzMjvq2R5TqWPFFwSNpUFlYfqfl_HMzz7fDPlSPh_ziU8J
 DzdoXdtIqOPgARcukY>
X-ME-Received: <xmr:zJJpYnAWKjo_B8Oj9ogWMMzIRCMPSNopayn9NBBUyxZYG6x7K8ScAeN0-JS3VVDcc2a7vb2Wm0hi_MInbGEEtolul-AZB8rtYfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekvdfgtefgheekudejgfehvddv
 udfgvdefffetieefffffvefhtedtgeejhfetveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:zJJpYteZN6jA5McKj7gMaQ6qp2DULHsXWLsv3-un5jmOIEZKofpNIA>
 <xmx:zJJpYuNuWxSbkArc6p0bvqfA88zhybveBbQguHlZeOueOmNgy5hWyQ>
 <xmx:zJJpYvnEuGT_x62GHFe1f6MneaAcIARccKEqW6IWbXFwIbKTr9YQEQ>
 <xmx:zJJpYrpwzcK_FyP2ra9AyV0WoQ_ULhr7NT9TmA_6hvy3BX1IqReECw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 15:00:27 -0400 (EDT)
Date: Wed, 27 Apr 2022 14:00:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brandon Kim <brandonkim@google.com>
Subject: Re: Request to create 2 new repositories for
 "bios-bmc-smm-error-logger"
Message-ID: <YmmSyjbeOtEOQuaK@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CALGRKGMgs4m=h6udakL_hcUugrPFyvTt+RefBjyVinE9ReGXyQ@mail.gmail.com>
 <CALGRKGMPDZXh8kZSifJ+XLKbi96LRHcYyJ=Jt9KGHPMmPWk+OQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YQL4Kgl7t5S3uhFi"
Content-Disposition: inline
In-Reply-To: <CALGRKGMPDZXh8kZSifJ+XLKbi96LRHcYyJ=Jt9KGHPMmPWk+OQ@mail.gmail.com>
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 Ed Tanous <edtanous@google.com>, Kasun Athukorala <kasunath@google.com>,
 Willy Tu <wltu@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--YQL4Kgl7t5S3uhFi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 11:03:29AM -0700, Brandon Kim wrote:
> Let me know if the community would prefer I create a
> GitHub Issue in the TOF repo
> (https://github.com/openbmc/technical-oversight-forum/issues) instead.

Yes, please do this.  One of the primary responsibilities of the TOF is
to approve new repositories now.  Creating an issue will get it onto the
agenda.

--=20
Patrick Williams

--YQL4Kgl7t5S3uhFi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJpksgACgkQqwNHzC0A
wRnHCA/8DJTFNP2hZIb1xn8i7k3inW7bZJsrhbKS31dug/fNsd1/JF9XbHZR9fGV
6tP3SJINbGLQk1bbrfSLM7KpyqldhqaPS3LDAoluhfMmEVc0MqLQWxeuPK5KuYrJ
u7+e7f+5BrpzWgqifcz+18VLLFugjfCWys07FDLc/IVdPJjTbll9YRaKLQ7/p7AZ
H9QpbzJfC2Z0r2JWoNU/2hTSVYIRYITNn2n1/sNkDcT8Sgzzuo98Cpu7wygs9D6I
RfIgMHFs/qLNHHFyTqYqoZHBhxDAI43jzTOzcB31au/7NPUzfJQpNcffvwTsi+PU
eQXKvSmOfmr4ATIO29l7x3zf21zyptsJwkFoiNMuMPC+aU3mH/mwR81Jk9BmpbEf
VlJ/zohuyHeqCItFeDsl9k2jYs06rR9U/C07p/Z5gJ95r+AWwjfWWHmXCAz76+68
9ttjPY7YVP2eWhYse6dgayQvfFVbETZVnO2mP3H8WWIItuJ6Pg7G+1Jt8OsFHx7W
DhefQT4+ENrcCtm98l7R3b5ZuTEwFpe+tjMQFqnsXfrNFeuOA4zpST+Xz14Td/sv
Dw9oXHQirajpCewTXx75DbAy7u2wZmXegPcWI0x5eWodS3/iRkQjBmlRT9iKZQAp
xnzikm6hUmMBzCbCosUOtPcpNxxDZHG7Wu+WCIAB/mwB/wZedJ8=
=7KRT
-----END PGP SIGNATURE-----

--YQL4Kgl7t5S3uhFi--
