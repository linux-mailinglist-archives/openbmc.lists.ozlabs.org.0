Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D21A95B3CA0
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 18:06:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLTH5tvXz3brh
	for <lists+openbmc@lfdr.de>; Sat, 10 Sep 2022 02:06:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ffpewoyP;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gUaDfA2v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ffpewoyP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gUaDfA2v;
	dkim-atps=neutral
X-Greylist: delayed 431 seconds by postgrey-1.36 at boromir; Sat, 10 Sep 2022 02:05:58 AEST
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLSk6b5lz309f
	for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2022 02:05:58 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id F17C3320093A
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 11:58:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 09 Sep 2022 11:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1662739121; x=1662825521; bh=cuGORHt/vNBGECMMS+2DXYq3V5LWU8SiNxD
	5cq9U8Dc=; b=ffpewoyPuJa6TUFVug1kq8l3djZplQ+R2UELqRYMBN3+iFsn6bC
	iTKWxd3UzBrNLNy52ETZ3k/yNuSJPWNt/qApYjpiTPeybwtCNcmlPcSNQwEuL929
	Ci8my8UWxnpe54jNYLZpjfupt17QVDAwahZHAD8SbRHBXqFaz96tiDFkUhimf4QM
	4yi65h7EPV72+J9ncwCUQV1QWbwW0I/d2B1GdOTgrsgIUfpOn71H34SxhVSVloj7
	XOvx1kN6o3Z+u9NMQCDYOBAu2KUbGqZMmB8izHacKytijzyE8WJkWSFhBcis2ZTr
	WNJfmVXxUPnv72gv4GmBo/kZfYyPbSIZYsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662739121; x=
	1662825521; bh=cuGORHt/vNBGECMMS+2DXYq3V5LWU8SiNxD5cq9U8Dc=; b=g
	UaDfA2vSoxs+zgqagcAH4du53BgmEqgfAJQ0QkIP9xMzWVpDol6E/sYa0DLympH6
	lslSFvu6dOUiHlVgwtPSa/G+Vc4QJ/z+kQwjRov8SQDZOUO8or1kcDa/L10HnfLv
	2z+FQ1HCIuCg1XeFaUQJrZATqIIMB45bFg86jKcq/U6QIR5aGLwAaAT3Irg80DIs
	qavn0vZ1kcEEbcT8HE60UZyJBfNKWLGaiDva+X4OHjGYsc48idu7Ht80QYLDTYxq
	LLeczlmZ1RLWe8MVQzD21kGf4Tx71Hey2eMsEavhANnMVHQX8yrmjhqhdyg+OWmC
	DmcXkCxrjjOrQmVKsJD3Q==
X-ME-Sender: <xms:sWIbY24A9QhbtB_jgj61WgksOAZjnvnSnxy10qES1y0cwcP6U6-02A>
    <xme:sWIbY_4eEgBD8C_eQle7qv5aiRJXsAvQBHDQxJ8SVms2LvzUB1W-14KvO0yKf2IVY
    yygreBMenEjRKXUe4A>
X-ME-Received: <xmr:sWIbY1e-Fx3CrZRF4KIKHhc8JTPjucASDPtxSIM1CmpWmUYRQuZg3qIbXr_FCa0cMcxI7XmwoTVHW3GB9HR8TJdqLrUJd2IZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepffehgfdtudektdetuddvkeetgeehlefh
    vddtieffueejffeiteekvefhjefhueeknecuffhomhgrihhnpehophgvnhgsmhgtrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
    thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:sWIbYzKhNedigHpOUFf9gPWIqQbw86ULD58GuifM96zU-0bmRgnoWw>
    <xmx:sWIbY6JSBNMlC6Z92rjnPElmAsI3Dc7xROZuBxGB7u3v5td2qDHdpA>
    <xmx:sWIbY0xXU-WBK0RRoUFuDUzxjYRnq6P2DTQEkyejCu06aFWXrzPt4w>
    <xmx:sWIbY5nzD_BLPqEmbsftn2bKEO5RBaAOsWvcHnS9-gtQosi-DNs2ig>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 9 Sep 2022 11:58:41 -0400 (EDT)
Date: Fri, 9 Sep 2022 10:58:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Yocto changes to TEMPLATECONF location.
Message-ID: <Yxtir+PEKipZyPXU@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pbA7V8oDJQz7+NkG"
Content-Disposition: inline
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pbA7V8oDJQz7+NkG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

An upstream Yocto changes is causing us to move the location of the
template config files in our machine layers.  These are the
`bblayers.conf.sample` and `local.conf.sample` locations.

I have made all the necessary changes (basically just file moves) in
our tree[1] and some minor changes to the `setup` script.  If you happen
to use `openbmc-env` to set up your environment, you will need to
adjust the TEMPLATECONF environment variable accordingly (look at
`setup` for an example).

I have also updated any references in docs[2] to avoid usage of
`openbmc-env` and `TEMPLATECONF` and switch instead to recommend `setup`
workflows.

If you have any machines in a downstream fork you may also need to make
similar file location changes once we pull in the next subtree update.
These might be helpful for you:

```
   $ git ls-files "**/*.sample" | \
     grep -v -e poky -e meta-security -e meta-openembedded | \
     xargs -n1 dirname | sed 's#$#/templates/default#' | \
     sort | uniq | xargs mkdir -p
   $ git ls-files "**/*.sample" | \
     grep -v -e poky -e meta-security -e meta-openembedded | \
     sed 's#\(.*\)/conf/\(.*\)#\1/conf/\2 \1/conf/templates/default/\2#' | \
     xargs -n2 git mv -f
```

1. https://gerrit.openbmc.org/c/openbmc/openbmc/+/57049
2. https://gerrit.openbmc.org/c/openbmc/docs/+/57050

--=20
Patrick Williams

--pbA7V8oDJQz7+NkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMbYq4ACgkQqwNHzC0A
wRkHjBAAoRfyPIkaBLyTDNUfrDlD+kPa65EFoPTe/0U0XgZgOQCzBrpU+ZcOhmYm
of81wOv4lJrYxrL9/voKUbsF6xMD6jK1Z/1RNGvNmaVJ+xYw8l2/UOEPDnMN4hBr
yLLnRo2chD40cxVUts+kGSa9qzqkxN6V4E8V/h/HympWG4PLIj5PcCXZX+LTFlma
HiTQPcT4yKS8kpk6NVCxVK2z1JxYA9AqDLMUVnm8ilbv74qioAJ8d4wG05UQzW1E
C7sVJ9SEquOSVRoKmcm6BZlmxp0aJNo8F0nYvGbezzLfPJeEEm1+TAT1yYTucAQb
HL+iVdhrIRq+LOhd/joXQZ+ZRbt+/+lzVzaKuSr9HZkhDlMy1f68/H/bzNbPh80m
1dH+g7opC+TNF9amLkLYDoKE6eGgYMLURC35hsZpCPKRNm/Y2LFXlBYhdaFqH7LD
Judy4YJVITIIiq2x9V8pJbN1jusCy+PClPCFbhszq3NRVwXtgm7d0h6o3Tgh6qz/
2IM/hjQhf/TYf/yN85TkY3EGYn9g8J2JIRcfHSJw5hrH0pM3Z4uSo8wjMkVcJgI4
kSdtmZ16ZEsQ/W4FUnK6hTOHOwGy5XryniymufdnsNZy7ooyEBwFqUKIda1XDM3Z
Bu9UW31prcO54dcG1KIYryR+6k8YkKeYL5o8LHUQky5jSaFSYjs=
=vLY3
-----END PGP SIGNATURE-----

--pbA7V8oDJQz7+NkG--
