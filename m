Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A023140DD
	for <lists+openbmc@lfdr.de>; Mon,  8 Feb 2021 21:49:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZJ63529nzDvXM
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 07:48:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=GxRr2fxK; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Qcw2rAtj; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZJ4t2KjtzDvW4
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 07:47:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 071F6452;
 Mon,  8 Feb 2021 15:47:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 15:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=AJJR2MW8hoVGpZ0AGXNYTlu5Z2x
 DP21/oIH9gQWW5ts=; b=GxRr2fxK5GuhGSZojZFr4g8j4/LlCt0Mjd82ETMhuVj
 hUsEJldjj9crgE8g0mCuUPZQ8RD/n/thDwUaC56DB8W8cxMZbGbbNW2WCtXmZDnV
 6/0v9AXWj7UPdP/sx3ng/KzqAKyUsEf3OzyE8f4xGxKQrljaVKsSTePmAO0zkcff
 tUuancaG+NM98eB0duMxMFC2lMxOeUjZ1FqAr+Sk00GQsHHSf/oiRXJ+B0aYc5XO
 IkQhaPgVH2t3PRPbEKTM31GyOUeljR8lmPKKgvC5wi2Rt2I4R4h/z2LS/X+CyXPT
 KGEp288uo6EqMP3o9yIMsh4J/Zpy3Zc4H/r/wIkq6NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AJJR2M
 W8hoVGpZ0AGXNYTlu5Z2xDP21/oIH9gQWW5ts=; b=Qcw2rAtjQ4H5jlpV2GPfc2
 ljzS63tPYRUJdKNPBNWKmqmcCTzDmKxxRtULVk7ieD/pk54SiSlM+pBuQWXi10SS
 eYS/5928pONUwD2qkfnfuGQ8JIZRhjzAW6wFJbXYP0cAXyYPC9BbP4AfYuo6wpOw
 yWp7J1RYXRWRu3vjFbNIL1VEq38jaAGrfN69VXEBUp6W8CqOqsiwrZpF9dO3c69U
 E0RdUPFvymEY8UZT7BsPQ9YZ6UWDPJZJ8MnRBl1GuWbRbLCHHzr29c9GrSG3ZL+q
 ohAe1rL6vhfqinVa2JH0fCojY90I+OmjRpGTrhXtP6z8W9O7PGCoWtfV93qCGDxQ
 ==
X-ME-Sender: <xms:dqMhYJtx60Y4YpP2V_wWXM3CG2p76Wv3EeYH37ElTUVi8Mt8c_tEFA>
 <xme:dqMhYCe9Kie1gCTE-Q8xnoyC0bPArxyRXo6fF1dgExrB7aFA0sqJoFRvCcA71SWqd
 lONKyttvEgToH5vorE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epieduvdffhfeuieetteffhffgkeekheejhffffeevledtudeileffudfggfetffegnecu
 ffhomhgrihhnpehophgvnhgsmhgtrdhorhhgnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:dqMhYMzrdzyDpHmaBNEDmcb1hveXBhwM0pT2f-a4X-P8xSeY4soH4g>
 <xmx:dqMhYAMa3AmZZ1xqavzsGkugz-CkygtCQmc6AjPHvwB9IjyJlE0pHQ>
 <xmx:dqMhYJ-JHcMAstkVr0Jh8_-7KAEPa3Y2WFYJk1X6S5FnDHffhYJohQ>
 <xmx:d6MhYGE2sjcbX8qtwswnX5M0tcdRDEyZc2MP0HMpsbEW3yz0ze0joQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 91300240065;
 Mon,  8 Feb 2021 15:47:50 -0500 (EST)
Date: Mon, 8 Feb 2021 14:47:49 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: Change in ...meta-alibaba[master]: thor: initial machine creation
Message-ID: <YCGjdU3N6bHS/A1a@heinlein>
References: <94c8af34-dcae-e33d-a0f0-a5540ef518fd@linux.alibaba.com>
 <YAneI7zHQx217lmu@heinlein>
 <5841da60f00cade13d87d5b8795f8a25021c2e44.camel@fuzziesquirrel.com>
 <f8678061-4662-4445-a4d0-016040f00979@linux.alibaba.com>
 <0008fa42-2a5c-b092-8da6-7eaa91e775f7@linux.alibaba.com>
 <0FC93EA6-AE09-46A6-9BF2-36471B85755B@fuzziesquirrel.com>
 <fe3fef11-56c7-85a4-b3fc-35ab29e99f60@linux.alibaba.com>
 <20210202135122.kbvdfnq6ed2onuhi@thinkpad.fuzziesquirrel.com>
 <e7991363-133b-0ae5-9bb1-fd48719738d9@linux.alibaba.com>
 <20210208144446.l454phquipyvi7ur@thinkpad.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VAtTcn3C+Zec/fPO"
Content-Disposition: inline
In-Reply-To: <20210208144446.l454phquipyvi7ur@thinkpad.fuzziesquirrel.com>
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
Cc: snowyang <SnowYang@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--VAtTcn3C+Zec/fPO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 09:44:46AM -0500, Brad Bishop wrote:
>=20
> This is an intermittant bug in the os-release recipe that we haven't=20
> been able to track down.  You can ignore this failure.  I'll remove the=
=20
> verified -1.

I thought I had fixed all the known os-release recipe issues not too
long ago.  This one seems new to me:

    ERROR: Task (/home/jenkins-slave/workspace/ci-openbmc/distro/ubuntu/lab=
el/docker-builder/target/romulus/openbmc/meta/recipes-core/os-release/os-re=
lease.bb:do_package_qa) failed with exit code '134'

https://jenkins.openbmc.org/job/ci-openbmc/1758/distro=3Dubuntu,label=3Ddoc=
ker-builder,target=3Dromulus/console

Andrew, have you seen this issue very often?  Next time we see it, is
there any way to get to the full build tree from bitbake?  There should
be a log buried somewhere under /tmp that will give us the details of
what really happened here.

--=20
Patrick Williams

--VAtTcn3C+Zec/fPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAho3MACgkQqwNHzC0A
wRmfihAAjIEMQaHhEDUwveAJAjVQ0JTcG92R6G/zxzsT0dtVRVUwgHwDR+DFbj+q
1gHQAhXIY5yB7O6jtzBxhlqHZD/iElPfK9qsvDwGB1nMYScH0TWw6l+Mf0cTuazt
sFhd4UU4qFmbBM/eZ65jNxg9O/Bodo7hWEpNvle4bTDqY6VHATJMoeOD2paESStD
YH7ny7eSd07mz4WfC5TcWbkF5Z8iT3RgBSWA2QYPay++xXMsmh7NhHFBhpECsWTZ
6ZXMUS2a1OokUfsixx5+zEq2qmzo+NnDsHEZpup8fEXIrzix5BjdWvkwmr7XEB7U
87Es8WD2WVfH5+upqvjm1NhaBX/OGOr/btBhH9RV32S56o+z8fXjlySQjG5L1ISC
49YziokVMjO3dZDvnFjPHI02Fh2uYajlufzactEcdiSkbEBr3KWjvv4vtkBMIXVI
kr5MPaXSsgYCuJhfLD+FPDlHZRi7eZ7sHw1G8fVxN5CBYpFSjhMn/cVEuZmTgiMC
vRMvxTT9adlHgFqdDdNfpr7dRBQ09nKR2jZFSPlBITiGrxKoUh6f0nCxe47lBHbg
UpV3sWsUg5P1teERj6i52+J7IqNhEzS3OT1QfH6gLlKHq4B9mgXg2Evg3EVZ+WjS
pUcKeJ9dPZaKLO+euVIdqoxwWkrzMAUYovKjHwgPcx3a6EkwXQQ=
=b2ux
-----END PGP SIGNATURE-----

--VAtTcn3C+Zec/fPO--
