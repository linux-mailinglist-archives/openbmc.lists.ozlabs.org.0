Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 658FA290CB6
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 22:26:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCd3635h2zDqwM
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 07:26:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=kUVGwLSJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Bu9x57Wg; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCd2M5bCyzDqvn
 for <openbmc@lists.ozlabs.org>; Sat, 17 Oct 2020 07:25:46 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A4E7AF90;
 Fri, 16 Oct 2020 16:25:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 16 Oct 2020 16:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0UxuU52w8fak+fZ5ncPfzzhdoQL
 ybY/IY1hC6HNoo8I=; b=kUVGwLSJfYx9BoPGWWMTpYP+tAa3eN23ybQgZzf2D8/
 saLFDEg6CYGzd23MEBiEp4dlwmu3X2qATpPQA0E/SX3/gFGFQFA05yGxbsONNkL0
 UV5LN8DU0ZWSwr7K0puk3B9gGYIPksKRwWXK/TbCjS4r1Nedj/nfaqCY0KiISEhw
 FHm4KsEMxcEvaXpujjwyy8aAxoJDfbWYnLWS2/I18uDMMcWmpljihq9IAA2P5DlH
 N5V8AWZ+8lDFqcwPcFjPwA/LK5Dhrs2EjWqKC/feE9+dci+lG2R1N/fVGiHx1bJp
 /H5yUh3V19+CtJCbL6GT3I1tfcQ02USy1dIhs0EDEPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0UxuU5
 2w8fak+fZ5ncPfzzhdoQLybY/IY1hC6HNoo8I=; b=Bu9x57WgAvaCPJnF6WM9wb
 tlOAJUYJSPQbssG5LIft1fUy23X/f81AwZzi/TFZJcGrvMfN4MmmE5SPJjolcBTC
 8IK+1P1xJIf8bqKF9XzLLnSiVTN+6n6ekleVj4jpZwdcEFatnwX8MNTyOpbB5rxW
 Zhb3wlToDrDyiXGH6tBueTta+HvdWjQz/EKbRsaR1oMPc2msyn/BJzwLvoR1z7ax
 RZE7fT0E/eenn3a8WJMcRoKgYx3iOgzXe6jquuGmfN3GgAaj6HalRHfI2F0rqLDb
 wayzQ2ImKazHdIgCLRMOZhArpp86M6ei4iqYhYhQJqIpsdlKGBY+VdDsUyksmZaw
 ==
X-ME-Sender: <xms:xwGKXzSXRKWaSB0pvTnaocJpxhU3p05aR63rWHAYN9ilFsHdWDKm-A>
 <xme:xwGKX0w188FGlDsfmLTdsnOC6TWDvSTLKpKv0MSdSIKpx-XYPsuCVeA8sxKN1qhFu
 qVwRjw4u_KfiURTidk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieehgddugeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:xwGKX41R4BcOqkQC54Jq_MhbKeQUYuSaShpBo_MpB1vXRRnlsUSNUA>
 <xmx:xwGKXzDTpmyVm5s8NMfhWo8cNcxrbmj5ueRfEG-oqW7cXs2WZEgjEg>
 <xmx:xwGKX8jPSLHJhOpzrds0Hb2G2pIkaORrAcoV6e6CPShjpwbNeDMGCA>
 <xmx:yAGKX6dFNGaSJKrGQXJ-2DBgar-kFIaHS3SMl9bOTrrk74dWGFXlvw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 808F1328005D;
 Fri, 16 Oct 2020 16:25:43 -0400 (EDT)
Date: Fri, 16 Oct 2020 15:25:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Anton Kachalov <rnouse@google.com>
Subject: Re: /etc/migration.d
Message-ID: <20201016202542.GB3614@heinlein>
References: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline
In-Reply-To: <CADVsX8_eYXAtGMgoe9LEKRtaf0ufdn0BJA+Fn8J9xpAKnTDStQ@mail.gmail.com>
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


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 08:47:57PM +0200, Anton Kachalov wrote:
> With moving from root-only environment to unprivileged users' space, we
> need to ensure a smooth transition. To achieve that we need a mechanism f=
or
> one-shot per-package scripts that would take care of migration. That's not
> only about groups & owners, but a general approach. It's similar to
> firstboot, but has a different purpose.
>=20
> I'm going to prototype a robust / naive solution to start a service before
> everything else in the system with a condition (non-empty /etc/migration.=
d)
> and iterate through all files. Each script has to run at list with "set -=
e"
> to bail out on failures. If the script succeeded -- it will be removed.
>=20
> The tricky part is: what if the script fails? Keep it, ignore the failure
> and proceed with others and then boot the system? Or proceed other scripts
> as well and then enter some "failure state"?

Hi Anton,

I have some high-level questions / ideas about this.

* Would these migrations be restricted to just useradd/groupadd operations?=
  Or
  are you trying to create a general framework for "upgrade scripts"?

* Have you looked at any existing support by Yocto or systemd to provide
  what you need?  Yocto has USERADD_PACKAGES, postinst_intercept.
  Systemd has firstboot.  There might be other mechanisms I'm not
  remembering as well.  (I guess you mentioned firstboot).  There is
  hacky override to install a "@reboot" directive in the crontab.

* How long would a "migration" be kept around for?  Are we expecting
  that packages provide them forever?

* How do we handle downgrades?  Some systems are set up with a "golden
  image" which is locked at manufacturing.  Maybe simple
  useradd/groupadd calls are innately backwards compatible but I worry
  about a general framework falling apart.

* Is there some mechanism we should do to run the migrations as part of
  the upgrade process instead of waiting to the next boot?  The
  migrations could be included in the image tarball and thus be signed.
  That would save time on reboots for checking if the migrations are
  done.

* Rather than have a single migration script that runs before everything
  else (and is thus serial), you might create a template service
  (phosphor-migration-@.service) that can be depended on by the services
  needing the migration results.  (ie. service foo depends on
  migration-foo).

* In a follow up email you mentioned something about hashing.  I was
  going to ask how you know when a particular migration has been
  executed.  Maybe there are some tricks of recording hash values in
  the RWFS could prevent multiple executions.

--=20
Patrick Williams

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+KAcQACgkQqwNHzC0A
wRmhkw//bidVn8L+g0GHcmp4JEcAvVWtjqZwxf8+9eFpepqEA0WJTCHvYSK3i0wh
KrftIWR+Ffq4z+6d+bs3g7buKxip5StmJOpPlYvF1XxBe1SD0C+jLDjGNftA5uF3
8qRFNaJjIEmwBTUqpM3hyj6anG1RJpeM0SGoNCGD1kcOLU0PAA+vAfPqQHSqMygj
9HS7Wr84HQcU4Xz1tvWDqOHzW1lXTrqandiD/XwLnIPxpB9hk36SUJTGp0am9GfX
2ML1jKhNrLAgap1l17f+ye1QfU5lwaa+I9ATZ7eBI8NnBKr0vogG2Rc6sqL9JjRx
MlhGrj970fvL1K/MjyIiSw/DAqZmQzkETqwGthdJkgakfgpYUTc4qxLeO1/onNJR
e0vScrl/jDGPkNgepL55WeqL+rkL5HtDTZX9+c1anEEpVCfc/do/IhqROvc6COQR
EcMH1T+1PzifVEx+k95EKECotUfJO1+B5IUryE0ds3lzuRquSNxhUXC+b7hYbuC5
wgJfM3U2vpp2LhsquXe/6fkrTsuH8aKOfMcc9H7fwV7YJeofFWxNFwnWDAevNj4O
6oIL4a8VJLgZiZU9wya9FxpbODtwQ/IMb0fcvvVpqXDQRRI73CHmo4fOAt6ppxWN
zeuukoCgx79dFMz6O8W79Xc0QYjZAoFOrMwQhygm2thp73ypm3U=
=bknf
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
