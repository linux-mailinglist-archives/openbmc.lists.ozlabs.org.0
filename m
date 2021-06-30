Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66313B8A59
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 00:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFbDP4kv8z30BD
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 08:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=GhHldYWw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JqfkPPx2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=GhHldYWw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JqfkPPx2; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFbD14hrnz2xVt
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 08:11:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DC2F5C00B0;
 Wed, 30 Jun 2021 18:11:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 30 Jun 2021 18:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=bD62NLSKCAddlGgAj8fA+v2a2Rt
 R0Wnkz1hZEp2wum0=; b=GhHldYWw7vc6IJyBeHoY+QiHj+hm4lDyIIlDYIDEVRL
 dsojiPtcxSZqx1tokObuBsDAQPD6hfNJSH1iT39qWoJsIqQB/kIchdoHDsv4emmP
 m1ueoXSPaHFiuiyNgQjHeVp1aLHA19NID/pOOspOqkbe9sgMytfJl3eentmUWeGy
 9n31lCzQl1K+o1DAPQmGh4nxDoB9M73mksyG/7mSY8phz6bwHKgCsR0/yIjsqc3v
 eQZ5KmT5HTZqZbnWoAVfme7iLhtPnilvCC3bfoxLJyIH3klptbQlkr4hMdT6yxJB
 tJJkaOoH1/+vLdwLyxo5bdCGmJ3V7bezrl1VRs1Ny/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=bD62NL
 SKCAddlGgAj8fA+v2a2RtR0Wnkz1hZEp2wum0=; b=JqfkPPx2WEQGjQ4qbtq8d3
 +0F9AQQD0PI9o9y9ZIBD3ML2+ULIG9L7Z0H2wYQe3JSGyxRCACiNB9dVmCwL0kC6
 bITmFL3QhQkCgeFNyHP3bDewRgOZ/vFk2tMRO0DOW3wEWD0A/dO8f04H6A5fApNY
 GlMpUNfs6D4RC/oCvTbZxKDvubGWO8NFNwLrc+ZDxA6KmduK3bVTpKoKL22P92mk
 pl+1yjPn9b7QtbomGeZo0YOM4stl0I0wu/Sttd54YSjF01tTJ5MKiNfo9WlvSeIq
 gt8jQ7kyM1eS90/jIWgwzm9hxgtd73Tk7MAkwjR10pGlltpT+q1SPTk0hXpmmJ9Q
 ==
X-ME-Sender: <xms:G-zcYBBM-cdWOmzjB-bnDKJmL6rtbz5kRdGQu_RMdntjOSUD-fXWug>
 <xme:G-zcYPjeMWZ2CnWpa71aLIWhESygLdrRLBLabXvl37RpIvJVpgLSktQDhqbaNG_9q
 MOlcghubj-RVSmWJVg>
X-ME-Received: <xmr:G-zcYMkXj-W5wMJee2jYnhK1Bm4fkcMR6LUkXpqvxVI0n1L8y2GkTurdZ__YGakJ4B9BD_PR0VlDVSdmcE9juR_CspnL75VPyf7io3Fx3xW9LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeihedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdefjeetuedtfeelfeeiieevveek
 geeuvedtveefiedvhfeiueeugffhkeelvdfhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:G-zcYLwie80JFeieL8hQliTxePxl1FzzdVaXC_CWNQAeFG75hC1W3g>
 <xmx:G-zcYGR2NmjUf8ujwo8nDJxjT6FHNWL264GuxDDvxcAD72pnEGHADw>
 <xmx:G-zcYObcpKp3Z0vMN7uCIW5TTqhP_U2PPt5zf2qedJcz2rfLFTdWFQ>
 <xmx:HOzcYJJJ9dsO502_irU7yfqDaAmGqVpGsyYn15dsHkglmRAO8Pvhdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Jun 2021 18:11:38 -0400 (EDT)
Date: Wed, 30 Jun 2021 17:11:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: [SecurityworkGroup] Security response team - bug database needed
Message-ID: <YNzsE1ipYQR7yfDq@heinlein>
References: <5961cc98-ef84-f38b-e606-35f94c94c511@linux.ibm.com>
 <982fc651-53ca-f5b8-825b-881579433569@gmail.com>
 <74d45786-1de7-92c5-72e9-058c688240da@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9+V3cjA3VgrbmM8D"
Content-Disposition: inline
In-Reply-To: <74d45786-1de7-92c5-72e9-058c688240da@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, krtaylor <kurt.r.taylor@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9+V3cjA3VgrbmM8D
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 02:02:56PM -0500, Joseph Reynolds wrote:
=20
> Yes, I believe other security response teams use Bugzilla.=A0 I believe=
=20
> that would work for OpenBMC.=A0 A Bugzilla hosted by one of the TSC membe=
r=20
> companies works for me.

Hi Joseph,

I think the point is that nobody is going to be interested in
maintaining the infrastructure to run a new Bugzilla instance.  We don't
really have a great infrastructure story as it is.

We can create a private GitHub repository for this.  Just need Brad to
do the right magic and maintain a GitHub group for all the members of
the security mailing list.

--=20
Patrick Williams

--9+V3cjA3VgrbmM8D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmDc7BEACgkQqwNHzC0A
wRnCXQ/+IUiTt01bn6GIWLvD36xGBXUhUXxPqst9fWYFOHlgkiaoCeN7O01a/SNY
IIAboi1mGBBt9pIMp0HRY/SfNVn2VRbIyC2ArmuGDn/nWO5aJJzzZGGbQGqx4Qh1
DbqosIPjofppvtYF/NOePtoWgBD6GuuETIr0KlVUKUHVPjqxt5oYkxvPQG+Ap1Ks
gOrtbtbK8zUDt/BkK1+jcYlz5D48uGOuETLE+jSvU/ORo9yQQSdVPEJtv3awU8zl
/qSp3A6fxj3FVr1fPJ7kzJE2GKvDYv/DQ0szWzPIOuuhxX+AS00rS3FfgctvPN4w
faqfNxwqIP8hDlLGHpfCcDV0TFqD6Q65L42DW9J6pwQtMW41DXgjm+Vo01rqbV8z
QGBo35IpSa0lxvIvJz7QEhi2yLbe1mMhlKIuow2fG+QpofKZJz0hdKRFShY9Dd+Y
aFHcv0B6FZf7+NmkjikeFkOBED1oKlVY8/Iv5XbxlxqEG4F+7PTSu9QBE9CCzTDI
aM2k52fsh9k+h/OjWcuR2z7TXAmo3bzhhQCR75MzUm83XrAC0YnC3enJsTuI8X3I
7+pK5L9t4CSm3Tb4pxDOVfwHpgGLyJVUyyEbdbEqJBozIosCspZOPVh4ZlSMSGqN
K+Dn4UZljQiRc80XEJgFf6VLqQuKbfou+nNQem0dp90GUpaTJz4=
=W3qg
-----END PGP SIGNATURE-----

--9+V3cjA3VgrbmM8D--
