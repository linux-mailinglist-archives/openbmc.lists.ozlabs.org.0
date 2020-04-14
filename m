Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C43A1A8611
	for <lists+openbmc@lfdr.de>; Tue, 14 Apr 2020 18:57:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491s8v22nCzDqyj
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 02:57:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=mN1Mz4wg; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nbCODP3h; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491qld2xX3zDqgn
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 01:53:33 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1BF165C02A9;
 Tue, 14 Apr 2020 11:48:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 14 Apr 2020 11:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=XpdkY3Oyv9VCWB1I6uK56hDmQWo
 l1GOGf7ayIdNG8xg=; b=mN1Mz4wg47P/o96HLAAMzypc6r3RXY7AUODWR3qHzxB
 5RzRIDh8or0EUwATPwaPwW0Axq2EGlA3EXuDbMkHh3P/Xi965yiRfbGKKKi6BTbw
 KKfdQiKU7/a22v+vd3qmZWm4PSrf5BrlC8RU3gknYu5ou/KXeEvtGNwGmPEy+BxJ
 piaUJwvpDBxvB7i1pjSppK1Lpt2ZMpJSxwn3ehxhJvySsaNIidsPl0fVU4zJLpDN
 FXv2JTtJvOJQr7kSUwLnQjnF9bIaVs+oU0EwiHR97SSjGsP2yn0/JN/7oNj0M5lT
 HdpRoe9/mF9KK6YWdNJLXhkAGv/qM35Z0qfdq43/Ugg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XpdkY3
 Oyv9VCWB1I6uK56hDmQWol1GOGf7ayIdNG8xg=; b=nbCODP3hxftKxAx4UqbA/5
 j24yrZwTLA2b5E0cDz34Qc/Z0+FSHkSQ2qeeJ2Z7K6f6HdtkfESsVpeEtD4Q8J2F
 WZWUIOLTn2KtcHvCYmO7IgN5Eu3eY2Ai7f5RRLXoxjNhedgWIdAYkLZuCNIutSgr
 cwOw2+UO1/0i6dwtJG9pAKXA0TOInq9M072oKowIJxxlO46i2BiVOiQ0tAEdgz47
 R4DS17RSNcQzdaZfaMeFjZ610StRz95M2bZ7WKaef0JH9TQlHF84rtOlJbtIqO2U
 SY4dxKQa5bqaRU9S25Bq5SKAU4+F3pGj3YoEXorQTNWcBL17vev5Lb7MamS1cKAw
 ==
X-ME-Sender: <xms:MtuVXqaeW0JqkdSDZBnJG0Q_xVjNBSlLuBwJL5Co4X4MOPPwXeipTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfedugdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:MtuVXik_0u6kc4UkPMDT5LN0bjAlL1510eQMRNx40IyvkehvoXtO0w>
 <xmx:MtuVXl24xzwPzFWFecCDvnc6PnuurORyixX-WHo94fcr3lCJW_BpaQ>
 <xmx:MtuVXi1eLG-6cqjs7MqELuf7gprY-zDNnGsUmAI75MqfVMMegzYPuA>
 <xmx:NNuVXvGYv8GVW7WktD-c0WrGK9rG_nwkwFnjjOUzVNRH34LN158U2w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64271306005B;
 Tue, 14 Apr 2020 11:48:02 -0400 (EDT)
Date: Tue, 14 Apr 2020 10:48:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: James Feist <james.feist@linux.intel.com>
Subject: Re: Call for Gardening Tasks
Message-ID: <20200414154801.GA443018@heinlein.lan.stwcx.xyz>
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
 <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
 <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
 <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
 <d3eac624-f1a2-fd2d-6639-3290c8085abd@gmail.com>
 <bea70fb0-780c-39a7-a677-dfc41e864337@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <bea70fb0-780c-39a7-a677-dfc41e864337@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 11:00:48AM -0700, James Feist wrote:
> On 4/10/2020 7:30 AM, krtaylor wrote:
> > On 4/10/20 9:23 AM, Joseph Reynolds wrote:
> >> On 4/9/20 5:19 PM, Vijay Khemka wrote:
>=20
> I'd really like to see clang-tidy or other checks for style added into=20
> the build CI. The number of style violations waste lots of time in=20
> code-review for both the submitter and reviewers.

Do we have .clang-tidy files in the repositories?  Meson has built-in
support for generating a 'ninja clang-tidy' so it is pretty trivial to
enable.

--=20
Patrick Williams

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6V2y8ACgkQqwNHzC0A
wRmqXhAAiA8EfrSdRnSJ4bHZjcsxNazHB/bzM1326AsYqw34lvzNW6qeKxHEE3sA
b/395vgIixu+k/+XbHOWciFBik1IBlFkDq+mV8mMcu+T5uH1CN1hJTkK//bGvJwQ
FheOt5NVMmS7yDyJME/8QfdEhrd6swiJsKmlLl0CE5rc1lYRi/2QODZ5xen7lOAq
Nu8GsvmYMwHOZY+5swC3Cx7/8qa3U9FR/htmCcCCtYZTMPhxZ189QgqAQ5BRBfUL
5zzGO7yAFrk5T4MTbl8b7SueAv+CmAO6cJJr+wClVTZJ52Miyy5H+LW20yiBp2cT
HHTJim1wCqPSInOauQrp0f7awwe9rukL7KQ/1vu5aCB27ZIWjGWM6mvZluzybW5o
TAbZwgdgjVlHMJuMno0zujrFjDJtjQq06YAbhfYTAgtPpVpbGSs3F1+RXdEtsy3l
WWdPqsj2DKULP6DtCKMd51Agyl0YX7mSTUNOAbvTOorP/d1sersqtf6qN36wYc7W
vxOlhUJTiBCqssKnnwrnthHzJVREVfKKX7bOy+CWG1/Bi3h13MDRrPf/vN1zawm9
5pXPnsZ8N3n4IuSGkl63WPIiaw5JzI0V3w3gfNm+780Cm/QbVeMf/HGfOEL/pv3M
XL0XUef/H3Ynnrpq1xzUvv1EmNmLNu/CnL+LoaencrPJehvGquw=
=yWLq
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
