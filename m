Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362C170B28
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 23:06:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SVHt4s7rzDqnT
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 09:06:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=scClNCkS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=xAnGRWuB; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SVH02WTpzDqkL
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 09:05:31 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id ED94B7348;
 Wed, 26 Feb 2020 17:05:27 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Feb 2020 17:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ji4t0Isw1C3wsM7HoYjaDytqWIy
 x+NOf/vQS1YIo+Ms=; b=scClNCkSfY2Q2FOpgGUifKfbWHaDQ7kPFxQWyFz4/ym
 a+o8Bjri9lfwOJkfXa9kqiE9vRzHdY11rtcy+9P6mthWEMlP1lIpVwEC/ko2qzY4
 6RfCwbIe4NjFRr1C3yZ8Z1QDS6SuBVAWd22R8fOMKif9aHaqBLgoX+dpTINB4APP
 52AHbG+9W8KLXz2WAJe62NRc+zhdbj1uS3zjESJBup4sS6F0dXvJgdmW3W5LzDRM
 qVg9d+C749oSlQC7/iYMKhoZBGzkyAY0e7551But0bcRr08J8+FETMXx+kDkXQ2R
 UmwPYPEqUc36utOp/ZjslbGdNoK40zvlqL5LlRiuEcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ji4t0I
 sw1C3wsM7HoYjaDytqWIyx+NOf/vQS1YIo+Ms=; b=xAnGRWuBg+G7ZrdF2lNeMQ
 XrXD25oGHLGt7rOcuJtvZcE4GSMpofAfikeIS8GjwCrUL6x7fjRQ7U2LzFdvok96
 zUza1IVG3bwRXWGTA4gQ+3rA3fuHgEYk9SvBI17DZ855xgb4JSVIvjwcT8VjYliB
 BqjL4Hg5iXbnNgdW02le9XdLzPYQNS4Owmj7ToVvs+ytWL/osuX00g0xxX+Mtm/A
 cr/cth7Ci2bRzI1htLfLVnD6J7ivtjaMFV0Mai7kTa0+oAuwvATnS2MCfnRB2Jwq
 dCMojejFI3nc/agjBwhDuoGPb9pORqGjF0jn7ELti05WordyBJd9lwstn5z1rpDw
 ==
X-ME-Sender: <xms:p-tWXs_9c9M6L4Y7m7l5XKDwvm42eEVIennpQPe7vbDy6Iu7qUpgEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeggdduheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuffhomhgrihhnpehoph
 gvnhgsmhgtqdhprhhojhgvtghtrdighiiipdihohgtthhophhrohhjvggtthdrohhrghen
 ucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:p-tWXrsMI1k8wxVawu0r6zJNCEW3ovsvS9pI92ucpa8enMKtDjI3CA>
 <xmx:p-tWXtiOI0lJNm9UU1J6Ext7nrXQuFbIhuORKlQdYs7QrdPrEts84Q>
 <xmx:p-tWXmT_XYe-mBZgsYyBOYRq5tNv6R6QyOv09qHIvc4lITml3vg2gw>
 <xmx:p-tWXh4XxL5Da3QOqnaSPXfdQDZ6_RoSlsd4W6Nj9rQKLPPjp_9OLw>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 25556328005A;
 Wed, 26 Feb 2020 17:05:27 -0500 (EST)
Date: Wed, 26 Feb 2020 16:05:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: python 2 deprecation - assistance required
Message-ID: <20200226220525.GP67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <cedd60034505b933ee70a43e4d361720bca9b803.camel@fuzziesquirrel.com>
 <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QKpLca3blcvhMJ0W"
Content-Disposition: inline
In-Reply-To: <20200204140753.GD92818@patrickw3-mbp.dhcp.thefacebook.com>
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


--QKpLca3blcvhMJ0W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Brad (and everyone else),

Wanted to give an update on the sdbusplus conversion to python3.  There
are lots of issues I've solved already that I want to give visibility to
as others are doing similar conversions.  Also, there 7 recipes with bad
dependencies that break when sdbusplus moves to python3 because they
previous got their dependencies indirectly from sdbusplus; these need to
be fixed before we can complete the move.


* All of the code is done in sdbusplus and ready for merge, but I am
  holding off on merging it until we are good to go on openbmc/openbmc.

  https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29055
  https://gerrit.openbmc-project.xyz/c/openbmc/sdbusplus/+/29545


* The recipes for meta-phosphor are available to convert sdbusplus to
  python3 there.

  https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29692

  I will update this commit once we are ready to merge 29055 with the
  SRCREV update instead of a patch file.


* The recipe changes at 29692 fails to build the complete
  openbmc/openbmc due to problems in other recipes.  Many recipes
  assumed they were getting their "python requirements" indirectly from
  sdbusplus (which is bad).  When I change sdbusplus to use python3, but
  those recipes still expect python2 (and modules) they fail to build.

  I ran with 'bitbake obmc-phosphor-image -k' and find the following
  failures:

    meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-host_git.bb:do_compile
    meta-phosphor/recipes-phosphor/power/phosphor-power_git.bb:do_compile
    meta-phosphor/recipes-phosphor/inventory/phosphor-inventory-manager_git=
=2Ebb:do_compile
    meta-phosphor/recipes-phosphor/dump/phosphor-debug-collector_git.bb:do_=
compile
    meta-phosphor/recipes-phosphor/dbus/phosphor-dbus-monitor_git.bb:do_com=
pile
    meta-openpower/recipes-phosphor/occ/openpower-occ-control_git.bb:do_com=
pile
    meta-phosphor/recipes-phosphor/leds/phosphor-led-manager_git.bb:do_comp=
ile

  I'm not going to have time to fix all of these myself, so it would be
  nice if the maintainers of each of these repositories would fix up
  their dependencies in the Yocto recipe.

  Often this means something like DEPENDS +=3D "python-native python-yaml"


* I'm seeing a regular failure with python3 and build systems like
  meson, which OE has also observed.  For some reason even if we DEPEND
  on "python-native" or "python3-native" meson cannot find the
  setuptools module correctly.  We have to also DEPEND on "python" (the
  non-native variant).  Since we don't actually install python anymore,
  it doesn't make sense that we have to DEPEND on it either because that
  means we are building a big target package for no reason.

  Maybe someone could tackle this with upstream rather than us having to
  piecemeal every recipe.

  https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dac467533f0b8=
39237c5d31ce84102d28283f99dd


* python3-setuptools does some funny mangling of our shebang's when we
  use setuptools to install a python script.  OE's distutils3.bbclass
  takes care of this, but often we have some hybrid autotools/setuptools
  repository so we cannot use this bbclass.  I've added a workaround
  here:

  https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29789/1/clas=
ses/obmc-phosphor-python3-autotools.bbclass#31

  If you are using another build system (or not using this bbclass) you
  might also run into this with other recipes.  I suspect, since we
  aren't using python-on-target anymore, this only affects -native
  packages, which might only ever be sdbus++?


--=20
Patrick Williams

--QKpLca3blcvhMJ0W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5W66MACgkQqwNHzC0A
wRkk4Q//TsugccWeb0yAluBWzbGTjqv2+R+iXb3PqYswyjaUfww5TxVzyuxxRh1S
IOCirR1GHirkxmlmPtWxiFZSSacjFG9LareMCDSrg/zBTWwt2gj5LNWiOvSTtMMh
jQkGtL0zRP87jluKLWWyWoa1HkyYH0QRRtDYhct7LsH5CQkTsXiUDE8cdmCkxZQm
alD9yRRYAlPJi9ZghiFWa6WFdWfvKmi5ViQsZDczYXFR4wtAGF97b8CExbyoOXU5
6LVJwBqxIdgc5n8oGUJj7mu1d9vFJt+7cD26kTCtAXMUbWapatmG5M0ZOCYzZKm4
I3IN7ywABMyo5geKf2ieKuyHZ6GkQ8HEtAtNIIuxeNRVbQqsG3LiYwOAij46xvRk
HPCaJzXSPfIU6yNhveDW2MYDjHtJ0QAP27hNqgsHxqtQs44CGNulP3MEwVNc1aDx
rTsyIps2HWmuU2pzaRhbQOu32uSInx8T5jg/8tE4UF1XplxyQGoNnbJIYsdaO7Qi
19RXayjBHCm28NDULF+x1C2lWa5CSfNtGuq8/lIw6sDISbhTtM8Hl+344uJjFoil
oDAmR4R41CNDtzWUr8E5qaapVgmnInTVvOUved39m4lXITmvwmQpG4lx63El2maQ
pT/LGufrwVG8LS2+c5k7Wt7HRGP9kfQUkWkloLUueJEUqUlTsz4=
=CoX0
-----END PGP SIGNATURE-----

--QKpLca3blcvhMJ0W--
