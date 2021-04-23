Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D8369308
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 15:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRZnF65r3z302S
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 23:26:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ysI7iPtH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=HPK+CE2y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ysI7iPtH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=HPK+CE2y; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRZn10gKZz2xZy
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 23:26:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A7ADD1326;
 Fri, 23 Apr 2021 09:26:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 09:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=rpV8ynJ4dNNnrLvXs1/9E18RvfM
 0ij4Df7mW7qiTVIA=; b=ysI7iPtH17mUNVGD27bTY5lEVU40JxlpYC5aziraVhw
 njXKulSRjVR/0ERdJtcSUCRflyA4RtImjm3Zh1on/QQYchfKyLNemOzOy4Mx0R5q
 8I0ZdZAmimZtWGpYdzfYSYAV7o8/xw6vcLzbhjBAEWf7jzvlL+YXEjwANAdsWD19
 rA3nXr7B/CUol+Tw0m9QobiJfojiANREK5l/UYPc/4PSwfoAo82meh7cT03mNC9L
 KaIYCCvRL7K0Nn9GSJ/I1UDbmkepOgNunWl8wvnzqKMr9zKh59Dm2wW6412NUIym
 OHniWiMewB6eBG0PJS67JSFJvHmlibMZ9d6bLMD0+Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rpV8yn
 J4dNNnrLvXs1/9E18RvfM0ij4Df7mW7qiTVIA=; b=HPK+CE2yFEAT2yo4iY1GEx
 SS4qFwJeu1jhyx49QSn7wkFzFrQWnyJpHV2RL/QrfduBOHZ6QFCVoECKGQpnVVRp
 w6dQm2RYX4doeDJaF5vnu51BMbtK4REbBgoDiU/5m+BBYrxzwnvBJGQoYu/ESeq3
 GYGuNtUY2c5ffNjKj9xOHpEE6Z5QTgLmMbl+wDKloYNs0v6CPpB59JnSTPL9FpKA
 PaL6XfBIqdPiGqaoUT98SZ2cpnlCoCWibQfAS7uWIOiIl1YxteGQc0M2eDRBryRI
 jsSGDPsFbT1X/gJ1NhhDfkUmj2IovdVf0/ls1TL/vk4BwERp4Nv13bE2+RU2fXJg
 ==
X-ME-Sender: <xms:8cqCYGqHNvbuGOhmhzVZ4FmavSU_FV5AU3N1JwwMH4FBurCxvZ5tuQ>
 <xme:8cqCYEoAj9zu3gWNjJyZw6vshcqjTgfGLBk9KOp14ICB72CntPR7blRfyd7TUfhWW
 YNw5_kS6aOmN8CPFH8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:8cqCYLPzvcq4fyuRvRN0DsQe5w3KM8FQDBA0zf_9Xl7O1YcJPxe7hg>
 <xmx:8cqCYF4BuyPCtclYlB3bk0A_xDKq5w9OzKH5_U5Nb9kw3Cv_Nrk8xw>
 <xmx:8cqCYF7NxTxHwUl-Ua9aPjt-MiVQsqds6vm1oz7lXdDljemz-SMDyg>
 <xmx:8sqCYDQUD54H_WjjOf3920_CfP3-t0yumrrn_RZAlkRBF_tz22v5VA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 263C1108005C;
 Fri, 23 Apr 2021 09:26:09 -0400 (EDT)
Date: Fri, 23 Apr 2021 08:26:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: bmcweb: Install encrypted certificate to BMC
Message-ID: <YILK8BCaKDbVnad+@heinlein>
References: <CAMXw96PmAoSb5LJj-CzYA-47D-nCy81gBa=T94N_u2fqWL54EQ@mail.gmail.com>
 <10871.1618685448@localhost>
 <CACWQX8166T=3-ZKo+EtC-e67KzTgfgh0JxKA3G3ap1LVucbQYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="24vz+kPks2ZBFzYx"
Content-Disposition: inline
In-Reply-To: <CACWQX8166T=3-ZKo+EtC-e67KzTgfgh0JxKA3G3ap1LVucbQYg@mail.gmail.com>
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
Cc: Justin Chen <juschen@google.com>, Michael Richardson <mcr@sandelman.ca>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <edtanous@google.com>,
 Richard Hanley <rhanley@google.com>, gmills@us.ibm.com,
 Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--24vz+kPks2ZBFzYx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 12:18:15AM -0700, Ed Tanous wrote:
> On Sat, Apr 17, 2021 at 11:56 AM Michael Richardson <mcr@sandelman.ca> wr=
ote:
> > Zhenfei Tai <ztai@google.com> wrote:
> > If you have a daemon present that can decrypt things, then you already =
have a
> > private key (or symmetric key) present, and that key is subject to atta=
ck.
> > (Unless you add yet another layer of indirection via TPM chip....)
>=20
> This wasn't clear in the initial email, but yes, this would be a case
> of exactly what you described in the "unless" part.  The TPM-like chip
> has a specific format that we're hoping to upload to it through the
> OOB interfaces that would give it a form of identity.
>=20
> >
> > I strongly recommend that you do not invent new technology here.
> > EST (RFC7030) is considered the best technology here, with SCEP (RFC889=
4)
> > being a legacy choice.
>=20
> I read through that spec a bit.  The issue there is that it has no
> compatibility with Redfish, so implementing that would be yet another
> subsystem to build and maintain, and wouldn't work in tandem with
> Redfish aggregators once the key was decoded.  While I wouldn't be
> against anyone implementing that on OpenBMC, that wouldn't meet the
> needs of what we're trying to accomplish;  Also, it isn't clear that
> RFC8894 has provisions for custom certificate formats, of which this
> would definitely be one.

There really isn't much in Redfish (or our dbus interfaces) about TPMs.
I think that provisioning and attestation are two big functional areas
that are coming to the forefront.  It would be nice if someone with
bandwidth and access could pave the way on the Redfish side of things
for TPM management.  I am certainly interested in the attestation end.

--=20
Patrick Williams

--24vz+kPks2ZBFzYx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCCyu8ACgkQqwNHzC0A
wRmFtQ/+PN7hslc+n0rfJYOfIKE4lY+yHNPB4ezDWncs+UrRpqoVm/loui0wfmre
x3LgL+MhxAfhhMHsoUc9wAcXeDwlK4BnXc8XMRm/rQavVYHk/ONIuPdgsrr2AryW
mMlyqaApC/ka3gWLTpoIOAAbJSRwBjRRYpe33Bly/mBtGl9Xut+TRAn3fKU1w9Gp
5eLRNtZp5EHsuDWe9OJ1I+PwHopKpTsloITAgyirJ5jGQEmNigYV4oVYH7kGi1Tj
9j/7uzgosQrhQEwtOg3y8wogUyJm0eswrVOX63K1bYvRB0XMWoxwibgJv3fxf6w1
5JffuZ6TvILbFg8O2qBSk0v6QS15Sjz8R+tw30G2kuoRb4W8tkuRaCmltXUMOxGX
8eJeM+Dv3hR1RR85FCaHJZOe7oNMv6KVmHDirbjs1dYs+I8Mu39jtnHj5DRbK5VE
6QnAlrkkCDffuMmCfTxf6pTUaPZLmeMR8+KqWR+J2A4UtZYrxp4kf2Cr23DAOeiP
c1y/9zrg/NVaHY97ZHJwply8ECqPlseskOnJPiwpg1A3R4GAoufWEf8Tnz9XKcQT
YuroWSr7Och6lPJ27exjw1G45JliZ0Us3WcYyTMXAT2M+Z8nUM6dqCT4xMfcRkzX
CRQssG/OPjRIXut5pPIt8elUWXjfeicQfa5xLkOmLaghTvOHs4c=
=jE5l
-----END PGP SIGNATURE-----

--24vz+kPks2ZBFzYx--
