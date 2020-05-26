Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B21E262B
	for <lists+openbmc@lfdr.de>; Tue, 26 May 2020 17:59:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Wdtd42pXzDqM4
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 01:59:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=RxqZU2as; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=a8AOHdLT; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wdsd3zZzzDqDy
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 01:58:11 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D2D3FA4F;
 Tue, 26 May 2020 11:58:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 26 May 2020 11:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=o+ucPe7awW6Xfj7tMKm5WAleCRl
 s1pjAzwy9NvQfxnA=; b=RxqZU2as7fmyNPZxwF53u1IdW8MQ8YsF3XJcBpZVLuD
 +Kk64UjK2C+XYZoRaSiDAf1DLVPGrMbnyJs0SO1bd4P8C/f4I8HUhbGFOfRtY5Dp
 RVo5mS8qNOD8wyTw1+n9G2nprYTk4Ml/k9Cmj/Jcv2xjMN+wVi/dU5StUgrUa1f2
 QXicL+QFpo7wmkwODuZFb+MC8KgHpyhj/zKcYceVUzU8lWb7hcO15LjlKxMuoDav
 jIpuTLN3CyCKppyODy5nvUDigAF6LL6kPFXBiqf9lOQ50w+Xlhl1+PvJKr4sXGga
 1csrNWz6V6aFkjhC+OYGzGyvx9O/0gtVyDyT6Pae0vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o+ucPe
 7awW6Xfj7tMKm5WAleCRls1pjAzwy9NvQfxnA=; b=a8AOHdLT4vbIFbU0fdsR3d
 xQzPKdJ3B27lkABLE3E3MFvxstvNNO2gC4ai+OfyYGX9Gr95W90pYG4xXPatJOvj
 cP3dzzuVzB5HiNUHEXBBiPqWKJJk1udIoWqp/68wvB1Pa44Wp5KpYubuu6nNt75F
 /TbfIK//jesFY0MC+Pppc/nHYxcwgJ3ypRlYnS2VdPQIS1kX+BUx/AzNVKfKoJbH
 RvhL9kfEy/dZjgkYAB1um3hmBEOnoWDDqx/eh7jefgk8Bz/Lg8TGjAvmz+TZoFzh
 9BbOV6wtIug6535KeQpYMRNwFnHJBbmff3wMyNlMESfNHBno0mvTLRcRdUgYZopQ
 ==
X-ME-Sender: <xms:jDzNXm3N-B7VnukmclTGKR_zpTcWqBwy3l8jLJD7d7HkHnWRLay4gA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvvddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:jDzNXpGB8eazVrIoirRxlP3oX0XOgjt2jFRNggqo8JIzYw8RdPgfJg>
 <xmx:jDzNXu7ISHYrjN69VHe4mXLY82SP20XLyo7eWEyZnJ5jMAya2URXUw>
 <xmx:jDzNXn3NzqWRm8xtAQIdoq9gy93TVKUIU_EvrLRJTny0YDU93e82sw>
 <xmx:jTzNXoz1U_3WHnzk1pObgD5TVTC3ungbHSxIYhpdHAOkYdpuZXFziw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 77737328005E;
 Tue, 26 May 2020 11:58:02 -0400 (EDT)
Date: Tue, 26 May 2020 10:57:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Adrian =?utf-8?Q?Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
Message-ID: <20200526155756.GC3445@heinlein>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
In-Reply-To: <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
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


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 02:35:32PM +0200, Adrian Ambro=C5=BCewicz wrote:
>> On May 17, 2020, at 7:08 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>> Alright!  The great thing about GCC 10.x is that it brings in support
>> for most of C++20, including co-routines.  Looking forward to playing
>> around with it.
> Is it allowed in OpenBMC to base the functionality on experimental=20
> implementations?

No disagreement with how Brad responded to this.  In the past we've been
pretty prompt at moving up to the new C++ standards.

I am curious what you meant by "experimental implementations" here
though.  Usually the C++ standards committee has put things in the
'std::experimental' namespace when they are so and the normal 'std' is
non-experimental.  This means code using 'std' APIs should continue to
work going forward, but code using 'std::experimental' might not.

The specific example I mentioned here of coroutines is out of
std::experimental as of C++20.  The compiler writers have been slow to
get it implemented because it is a complicated feature.  So, I guess
you could consider the fresh implementation at the compiler level as
"experimental" but the language / library features themselves are not?

--=20
Patrick Williams

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7NPIIACgkQqwNHzC0A
wRnzHRAAiWD0o5NDCo8Qu3nZ8wIilBsJHcsWe4q81rtoylHQ2omL+ArL3OZGWO1+
X4HFt9k+FOjYNu4eStEpC01AL0Z9LvAS2p/QL9dKaWrfgKNP0uHGzDuKlWhvphdl
c/RUJoPxt/37zXuqzZc/l86LpwNWxFygvfjDql8m5QsDQdL4kks/JeIHDxrD40Ne
dnGylYKyDqJhqUlW3ntgq0GMCQox13Z1QD4D0mKF2eWuylcHCey/uujkjh7SKk0c
c7hzgD+hSatWU9WYQhpYG1NmQ1iFT8CCnoY57/rDJwjR0ntk7k7CHjaO5WnG3lJn
cowWfXozYa1SRyEN+OrBa57If+LqpkPUS2Gm8aoybjT5Jpzl/Udul8OCunlOkpON
vAioJR9iOAyt8fCoxWHZc2eebEAKL7m6LZsE7BFbzFgbgRWW2h+7/kmDRpvmGtfo
I0fdfz/HH793RsFdVIUiYyibc8VGzX3hlSxvzmPK/4gsCVro9DRZfImmxwHnUnQF
S1oNH1j4jfGB2SSt+H2m3GHR7Z9uP7lCqzvpL2OtVtF2BcN3jv4XJYRyAQ2pQcfY
2HiSB+L9/vIu5c7b5iURNHBg0Mq3ZPFzfBBelwq4D/ZeZVDndPWFEKBiMel5lRxz
uWG6d/Bsg2Lmg1VsTy5AZJRN0kOmEsNA98XP6Ty9rrpmHQQSeWs=
=bbua
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
