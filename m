Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949181EC37F
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 22:11:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c3896LkTzDqXJ
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 06:11:05 +1000 (AEST)
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
 header.s=fm2 header.b=Jlb5grVt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=oWNDp7Wr; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c3724TsWzDqWp
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 06:10:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id A45DA5C0129;
 Tue,  2 Jun 2020 16:10:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 02 Jun 2020 16:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=njYxnFdyYdYfmF8+AjrCV56i83y
 S4oKyvDZN0UgxgpY=; b=Jlb5grVtn8II8DViMEpMwULQ25tFJOym3g7wYEekNdL
 MytvVhAO6qyfV9hFK/b8LySFjlA3shyzRa1BSO8kjCTjLOHrKZ6kJjBiVGH/P1w2
 oZyVjLH7XP96EikqoO0j0U3ziQNZIJ8az235XvtFG5bCMIT2Oc9t+Vk2aviSyv76
 k5gp2nuvO9ROHNdgDZGacRILXcQ83fFopSkkFv3XeotDo0BQ3qY8QeHwsNsXBEQ3
 0Js+X3ZI/PbHZ8qGDjdUU18CBQmdOoIEx845xx0iBLWo7IwpqlqUP0PDrDAvU6Fb
 3L+X/XgAi3WyvOGtKRUA83lU57cK8W1gQGcHS0kN2SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=njYxnF
 dyYdYfmF8+AjrCV56i83yS4oKyvDZN0UgxgpY=; b=oWNDp7WrVv46W1shCeA56L
 aiG7E8L3UxijACbxgRQlmz/h7e31ujeBytz9VGa1g9713BoOS6j0AkVostM+nQIS
 VV2RPGB82MtyYpXCREhey0I1dAt9rU13FDdVx2yS7raKXqYH2ATVzGlSc1YFKqhH
 tYSk5/3X4KjKd/c6IcLEocbwN/SJc/YjiC+khT3yKsMa/z2oFUBven3JqpM+34So
 THiYcKwCDMBYOWFfvwPa4U7QnglCwwsLcLM0Tepbq6BTb1g6urAEriOkZKPD6++i
 E2UX3zXbpm3nKnGKhsI26GSxqNZ3n3iaY8nzHouBT2vhQlDBC/uAzoAHnmeumMqA
 ==
X-ME-Sender: <xms:GLLWXllDcg-vvZhd9b26DgKkr6Hb8um_1EMkHw98eV97oGZxXRJfBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeettefhffeuveekhfdvgfevhefh
 ueffhfegffejvdekteefffefheelhfevudeuudenucffohhmrghinhepghhnuhdrohhrgh
 enucfkphepudeiiedrudejiedruddvtddrkeeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:GLLWXg2_Ksj4nw1_WtAzpulDHVs9An6NIqOR9KuVrlMx1lfr8xxLig>
 <xmx:GLLWXrpeNf8Y5pMFutFQpIWqyGddA_6FONgVUVKkFbUpTHsWmCdPdA>
 <xmx:GLLWXlndL4E5MQKTE-mnbBzhk_Vm8l37k3Qb8nGrzBXsKKornfhEQw>
 <xmx:GbLWXojm0HnHMvbMLfyT6jfAOe8utXE7GZncz4_jZyYjWWFieJKD7A>
Received: from localhost (mobile-166-176-120-88.mycingular.net
 [166.176.120.88])
 by mail.messagingengine.com (Postfix) with ESMTPA id D89F43060FE7;
 Tue,  2 Jun 2020 16:09:59 -0400 (EDT)
Date: Tue, 2 Jun 2020 15:09:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Khetan, Sharad" <sharad.khetan@intel.com>
Subject: Re: Upstream Yocto Bringing in GCC 10
Message-ID: <20200602200958.GI17541@heinlein>
References: <9871E71B-5B1F-4172-9F41-454F8C1F644D@gmail.com>
 <20200518000811.GI1166713@heinlein>
 <2E02F120-7D24-48BE-AFD8-9A7ADD0F08E5@gmail.com>
 <7f027233-e0c5-552d-82da-cd3a30d74009@linux.intel.com>
 <20200526155756.GC3445@heinlein>
 <78ffc9e9-816a-c420-2d51-8a635342e3c4@linux.intel.com>
 <MWHPR11MB1389439BC7F058A120F60D60F18B0@MWHPR11MB1389.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Content-Disposition: inline
In-Reply-To: <MWHPR11MB1389439BC7F058A120F60D60F18B0@MWHPR11MB1389.namprd11.prod.outlook.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adrian =?utf-8?Q?Ambro=C5=BCewicz?= <adrian.ambrozewicz@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 06:32:34PM +0000, Khetan, Sharad wrote:
> From: openbmc <openbmc-bounces+sharad.khetan=3Dintel.com@lists.ozlabs.org=
> On Behalf Of Adrian Ambrozewicz
> Sent: Tuesday, June 02, 2020 1:19 AM
> W dniu 5/26/2020 o=A017:57, Patrick Williams pisze:

> >I can imagine some companies or communities might choose to be careful i=
n that matter. I was just wondering if there is some 'BKM' which states 'ex=
perimental (unstable?) implementations are prohibited from use until marked=
 by software vendor as stable'. Maybe that's my problem - I could be confus=
ing 'experimental' with 'unstable' after all:)
>=20
> If experimental means potentially unstable, I would say we avoid such imp=
lementation in the OpenBMC. We need to keep OpenBMC stable and such new lan=
guage / compiler features may be pretty gnarly to debug by the users.

Just a few thoughts:

1. We've not historically had this distinction / restriction.  We've
   tended to use the latest C++ standard soon after it is available in our
   Yocto compiler toolchain and even used std::experimental pieces.
    * Yocto supported GCC7 (C++17 support) in April 2018 and we enabled
      it in October 2018.
    * We used mapbox::variant with C++14, which was a C++14
    * implementation of the proposed C++17 API, and then used std::variant
      when it was available.
    * We still have code referring to std::experimental::filesystem
      which has almost identical API as std::filesystem.

2. "Vendors" don't really give us an indication of stability, so we'd
   need to define one.  Today, GCC's C++20 status is a simple "no
   support" (red), "partial support" (yellow), "done" (green).  Most of
   the C++20 support is in GCC-10 which we are now using.
    * https://gcc.gnu.org/projects/cxx-status.html

3. I suspect most of our locally written code is "less stable" than
   anything coming out of GCC simply by nature of how many users and tests
   they have.  Most of the C++ features accepted by the standard
   committees have an implementation in at least 1 of the big 3
   compilers (MS-VS, GCC, Clang) and so there is code around to use for
   test suites.

--=20
Patrick Williams

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7WshQACgkQqwNHzC0A
wRlBSBAAngjWiOBAomGkHAumkoV4Ip45fmUmsYcgQSiEPfN9OH51sznae4suqm5i
dM7bKRqmgCUpnelfe5LsSI6os6TUVd7lwhkgnuNrNaX2s1gwoqLRj+SnpdDHApIB
0fNdCT6i7vWagWdMhGWX5/JcdO3pBG/fdWeczmXRr6Lq1GLRWoT04BbbfaJVnmda
UqAewp3kp9spTevtBsYkTbyNX5FYHuJQoa25Kz6J+/INdVQKOMFe2Jmi6iBfkGLr
C7QZ+WECA4iXoBoz6QW/U/8y9okjAWczazfzSJU3/VJUoUHsITSxydSrqrcjxAyT
A9KZlDlpESdkkUOZzsgsZiFvj9XnugLtqDnUBZRc74LWU6iPaH2jpgE04ZG77+A9
2NBpz6kZgQ4FWhBLuqC6lv16RFASpvzRWNCa2m3rNYjw1LJwb/+VKAwC32CQV3gg
LDJKmt/up3yjhFPwh7rCNe5AH+mn3o1+jq8pHCxIN8Q4ybj11TDagYsq9lvnpe2Q
0d6Ad5V8OT8+RpAvR+YFPTKvDatAW3ag0GOtXoalldh5asXzQ+YBJUphVJ90ouYO
6+i3PLASZ1+wKJIVytPpSpv0ePy7N++YW/Hcfsd/sZKHMPs8RIUuxauJ+ekrUJzK
eNXOEC2+/TZEg1FEndIKHGCq4r+6b4jhK1s6s/AiO8Qec6JUmEY=
=lghy
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--
