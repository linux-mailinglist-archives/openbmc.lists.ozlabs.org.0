Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF925C60F
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:04:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5Gy15SYzDr6Z
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:04:42 +1000 (AEST)
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
 header.s=fm2 header.b=ktXyyjz5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=jdCO/zIU; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4Ss4CVzzDqsR
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:28:04 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D30655C02CE;
 Thu,  3 Sep 2020 11:27:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 03 Sep 2020 11:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xhMeEcugnA14OtiBGHqbs6C+ZZK
 NGqHQtJRK17I6nAQ=; b=ktXyyjz5/wUClKwpero2DTRtBWvXemVqFsze3D1Ex74
 w7Ypa/1ZQSQqeqTMIirBx6W7M6w94YwaxdF4TFwB2NwBCTeSIFRX5xO2hCunS3ZG
 wG1OgrdMZFvnjWnOjAbHClrwSyB+qMdgsuWw+AdJFl9XkbC9ICF5QVPsQnVTVDOJ
 npZkODIOeFLSWctjoxSCPFxPd0+XfFFW+LeISQzGU8i6aZyAJQ0jyzee6Mq3u8I+
 n6T3rPkcZXAwQ0sTOJjjdc2kXpFpQIdEDdqkvtEhRfZywmdVlHSvzbBs+5PEyCeA
 nH2fyhB7ObICVuWPhtD+XiuirEVHliFqWcTlcGC/RtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xhMeEc
 ugnA14OtiBGHqbs6C+ZZKNGqHQtJRK17I6nAQ=; b=jdCO/zIUr1oljsXN/wopN7
 t/MbhAXKsaL4HuZ/pP9A38gMe45kd3wC/mFpnVF4ScnQYzMWCU8Jx6iFjy0lE9Ph
 uUTLutzsfLjdLPt4e4bFG7vfcayGchoPBjaXuGKenlphHvW79B7onDeR17GehLhl
 iWMnJJrVKBrepk4jDkuConTOOpVOIY6fjT7jL4nwtvF31C9+jhiOfryHakP95gYi
 fPNj+fRgHdXpfE9YPjZVupQHpwVImg6oV/FQYihkPQB2qckGcvaGRiGoU3hTDjuh
 /OxjWujCHgojQWYCPNV9ZSpgTGGgsTK4WgcRe931J/KXMk8C1HpvxLKDFCNFtloQ
 ==
X-ME-Sender: <xms:fgtRXz9slnL68JAuQfnCKAVKnat7qinCwtTkdcpk_jekJIpFOvPtLg>
 <xme:fgtRX_vMVqPZZ2O2Aaot62eK8d1Owzn7noU415dSTUUbMlDOttIQWhr_SwCcNT1-5
 q9SG3uAz0mtXqi2Aos>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:fgtRXxAh4yBgTeZffg5t1IcdYdxXK03nf8n6lclVrQ8fHnLNdN71CQ>
 <xmx:fgtRX_ffDLCwWghyF2ixcns3_3N9-ShxaIPHW9gpbAd6hMisM5ki4w>
 <xmx:fgtRX4MKq2w73zTDi99-v6Yo7z1b4klD3Pxcy3wvEhKvAe-eX4eqOA>
 <xmx:fwtRXyVQbS4j9nnPVCCWdyYArCAtSWoBiIcDhT5Yj6gs51wv61TaXg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B93E63060061;
 Thu,  3 Sep 2020 11:27:57 -0400 (EDT)
Date: Thu, 3 Sep 2020 10:27:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Mihm, James" <james.mihm@intel.com>
Subject: Re: PECI patchset status
Message-ID: <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
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


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 05:57:48AM +0000, Mihm, James wrote:
> Thank you Joel for carrying this patchset, and Intel does have an interes=
t in getting our patchsets upstreamed.
>=20
> Since Intel has a large set of patches that need to be upstreamed our pla=
n is to fork the kernel in github/intel-bmc and apply the intel patchsets. =
Upstream recipes can then pull the kernel from the intel fork with the inte=
l patches. Intel will ensure that this fork tracks the openbmc kernel versi=
on and maintain the intel patchsets while in the process of getting them up=
streamed.

Rather than create a separate fork of the kernel, is there something
that could be done here to have someone from Intel work with Joel on
preparing the patches?  When a new kernel comes out, Joel can ensure it
works on the base AST2xxx system design and before we move all the
systems to it, someone from Intel can rebase the non-upstreamed patches
they are carrying?  This hopefully reduces some of the burden on Joel
and stops us from further fragmenting the community.

--=20
Patrick Williams

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9RC3YACgkQqwNHzC0A
wRkKiw//V4rnshtw54eoMB0xgudmUirnzcFqFvPGHdjO01N7vSpJ42Et/ndli3xo
pc9JMYgXYYhhvPLbpryEOsM8pQLuk38+CaKsHpKekqKNNoaBl3780IVc8RhKUFQY
c+xnKCu+duXQwSd1C5rEZXrNcJQZA++uDDOArFL17mvugGFcJblUMeS7fa9hPJkb
gW6FTHtVeu4nHf3q/kl/67mU3iwNf7X5m5sJv+NFHF6XrhYdSaYXDSDNLA/NN3MO
NXb93g5qrdF04+YbIKwqaY6EqT3GNqBT+pWvZ+/JHMIn7Ans21BgmqhP6lib7xLQ
bYlKYwgHoJr696qYcnqeCEmu6/6vgucF9xKJO437VDMxd4CdPoobPXm+MUKFl/bZ
GUzsSbHXjUtpyBNoGRHvfzmRoZ4w7W/aUl3Ygdd73s16g8HVLvvesIGX0CyKNUpE
W4tElTWX43iPzs1Qzlqrdz25hhIH6cMVqESCWmkriZtJIWW07i3IMeZkbhPg1kYP
lPiyOERJLy/DVOkUTTrLe5M/v5pQxZZKwnLK718iOagDxU3FL7voZxprVCTNJwwH
rxvk0pTWEAq57pjyEmQ9JiHFrTMpy1QGcPSP+SHiHkyVGvG414uyXmS5Aea+yzui
kJz/gefiX1JNdqlS2utTfNNGNkA4D6/aaICETqr2c7MwXPWKti8=
=d07U
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
