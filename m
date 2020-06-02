Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A51EC556
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 00:56:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c6pJ25nrzDqYS
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 08:55:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=g0hGtNII; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Wpg6rkTX; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c6nT03qTzDqXq
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 08:55:07 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 264B75C0097;
 Tue,  2 Jun 2020 18:55:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 02 Jun 2020 18:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=dK3nd3ko8s7vQdJome3rZNk1xqj
 Gsvw6AFmuRFRifcY=; b=g0hGtNIIG2oaQ7U7V5DRPcfJfm60V6fB4mc9mXr3QaQ
 aBEydfKN2Yi4C6c4wFRZeV+rzvJsULTI8/cIEVmm6SWuPRLVeu7LVkjvWaaTd4kr
 3Gtnx5yaEKY9KMQOwvpo3qzSntgtkbJ8KU4IaZPZklNz7Mv7TA5FeI9sSKWsVwJW
 GnWTucGTEmQxzsHNRswP4HkNXrAJLgIPam3ll7P0WkT9SWKWkhItHzTPWpq+BKSA
 pfhUxDRxyVZQevC7y1pp0RDHn/XUTbvnkdqQK62BtIfHZSOBXD7HKy3JNuMVQgqj
 eg5n2F9jeQphW1gMHj8q6cQp8j05WpGblPsizmB8duA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dK3nd3
 ko8s7vQdJome3rZNk1xqjGsvw6AFmuRFRifcY=; b=Wpg6rkTX7S1ertnRNAbVeL
 eHlquaI+EIPo7M+dhKCWGcF/gebTDDwXrQVbFopi7aePcvRAX2e1KCN1ew0JgTsC
 zXEpAuKBgxotugYf+zdoyXshOJFf26Jff+X0t30pd3GrJV7DWQbOyRjK5YWsmSe0
 pEkmf9DEttLp/kOgPoJnZa+cVqMbatu/nc12VCSCcV3JF4Gx0Hf/cDtoKMIwXX8d
 IyX4b2SWxZBOGAXr5hMBuPA1NK2MfAAYm4Bn9W3xuMumh3X7KTznn9kelCiyV0k1
 Bg16CBzQi2qJx8Eg6q/QY73Dz1wV80FEN2RIwpWSiLNUmqpYCjnx20eiGPaplxhw
 ==
X-ME-Sender: <xms:xtjWXl_AKrhxYRc-hTK0cQxmisJJKYeAXOK1Gc5HtzWDsuVXnVTd9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefkedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:x9jWXptek9SY7gpzYgVe69EvzVXzdaLLGaQ25auvjtNSifqML3wrgQ>
 <xmx:x9jWXjDiAoIjFxPJpXJPgGikYvGwyrog1X7nWoEd5zepjvsa3CBcBQ>
 <xmx:x9jWXpfalFv-cGehdnUw6Tjbxn691bcECq5MvM-pkTKx1XdsWNsVjA>
 <xmx:yNjWXkUVGDbNGBEzm7InUNmLL_nLW3b6cE5ORRXf4zIbcn0niENRfg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B1F5D3061CB6;
 Tue,  2 Jun 2020 18:55:02 -0400 (EDT)
Date: Tue, 2 Jun 2020 17:55:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Hanley <rhanley@google.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
Message-ID: <20200602225501.GJ17541@heinlein>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
 <20200526155756.GC3445@heinlein>
 <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
 <MWHPR11MB1389439BC7F058A120F60D60F18B0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <20200602200958.GI17541@heinlein>
 <CAH1kD+aCKNRY4sxPL0bwt0pzL+jW7QBmn7-_PTManZnn08kijg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline
In-Reply-To: <CAH1kD+aCKNRY4sxPL0bwt0pzL+jW7QBmn7-_PTManZnn08kijg@mail.gmail.com>
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adrian =?utf-8?Q?Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 03:12:32PM -0700, Richard Hanley wrote:
> Does anyone have an idea of what a good test project would be? Something =
of
> modest size that we can look for any hidden dragons that still need tamin=
g.

I'm starting work on adding coroutine support to sdbusplus as an
alternative to Boost::ASIO.  I think it would be also interesting to
look at sdeventplus for adding coroutine support and hopefully some
convergance between the two of them to facilitate coroutine reuse
(especially in the top-level scheduling portions).

My main motivations are:
    - Simplifying / flattening the callback lambdas associated with ASIO
      by using coroutines instead.

    - Use sdbusplus-coroutines as the basis for generating client
      bindings.  Since the project is moving towards async applications,
      there isn't much value in investing in sync client bindings.

--=20
Patrick Williams

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7W2MMACgkQqwNHzC0A
wRkbIg//elm4JQEU9SF3/x/ksrpDl+xT5hYaB50/NUFtLBPAcQuiwwC+DhrHwySP
ee3PHoJO4JD/Qbos6DcUI9MaZ72DgwiOoMcOkgiuY4YcF8ZkdkBTMC0/RdeYZBVJ
NkJgekmEPqisumZQb+amTE3D3BOavu7OEpN1C9aR3Jdfk0QuFFFBCgg2roaaPEds
bX9E6scpWyTim8rNdTyvqSnEndvE6sOsO81chWsxOcdK9cHSfIZQ/xoPsjrG6JwN
ntpOtCj/vnbFgoR7nK82dLH8IBQei6YrpmqlZT+7PZ1zkwL/WbkLlI6GzbMJzv+Z
Npi21XYoT/mbH9jUwWIHpZabzG3LLoz/P3kI1CE6op/Dp6YbDlhsVnJo6YeqQRhm
jrHj35uiy954Ul1sr0IrnAVdKUA1wYeqL32TkBH0hw2Y8j73/pyKY0dFwwm3AOrN
eoxDdyjPpT9Is96LrRQFuXQfzhN+ay2Lo1O4fxx1m3SuSKAa60nnNEXoUTjd+zIx
VUFf0KCg6sFQ5Hh8GvlatN6k2bq5rnJ4HJN8HAKN1J6fIkaDLCXpceE956Tu7jcc
Ku1lNZ6K0Rqmn+/QZ0HGHjqiAwEAuiGzhj68iiKSGLtsUbOHEXdo/RkPtIk5RW9j
GVrQHb/uF/Yl28aMYcLwy1q22bRauRXKf0AitOqwUg26TLLZneo=
=mvwu
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--
