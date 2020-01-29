Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4314D1CD
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 21:17:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487FC33GnFzDqTq
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:17:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=RJslye5i; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iADosyz/; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487FBR03lczDqTC
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 07:16:46 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 6E6A8711;
 Wed, 29 Jan 2020 15:16:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jan 2020 15:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=wQyyJc9BNiZrGN4Trsz+VKOBJl6
 x6VtabdXYAP6aD1E=; b=RJslye5iNeOcs6Yx4/8OvIobVLKZRuggr0/oWyv6pkn
 bek3FASGF88zR1omAJGmDp1p4sQYv4/MOeUw71okhtXOG0vSeVOAV36UGne3TLHf
 +SHw6ZHaCmK/k3qpr95wRw52JHah8Xq+06SHMJJu+PSZ9ZDBKJHjJ3kOyQFwq50k
 rrNDpafwSJzAfNPm3D/xc9LBB/A05KKRX+wIqILH0TtU4FjYHWS1Y5fZekDawvSW
 pUvjqbbfhyAeAtwm3HUR569x38DgQJeYbLdDDnBI9ZXX/F1It3ywW+ttFbiMxtXb
 +Yjc3rNRob1TsAdUEydH5BEGAQk/7XgI7SEY4m7tH8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wQyyJc
 9BNiZrGN4Trsz+VKOBJl6x6VtabdXYAP6aD1E=; b=iADosyz/lVBZouC3BzbGQs
 a6N2j7S1up8lLTcL4SAFPA8y60PHCIWCjBVV1J6EhfDIqnr2twiCw7ej4yOtIIUy
 fDNEVEdOu/Lqafipum2CrACt/qTEbBEQQS9m35bixK3lWAvpa7uiWWakIIu18b3l
 CS9olC56BjptNsNWnwCr2SPykvpcKBmVSdGbnKO+M7vxqTtmpmd+SYOwzxsq83GJ
 hSzsZ4cbDQg+/1fGxiplEj2BtvzT1hipCH4rg+vrR5RL4Uw1utwpI5bIArZFEykn
 nv8NTwwN+OMcOhhHAi2In8HtLnMLjuuOrG6rpXAI0W5menzNttyFHrdMsL7z98zA
 ==
X-ME-Sender: <xms:K-gxXscAAdHsE1jeSReY6i1IU7jmMARSa9YhIlnZXuXWq9BmCbAw-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduleelrddvtddurdeigedrudefvdenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:K-gxXkhn_cDGL2ruSZTnX8_z_pfDDHYJqrRRSBXRriT4cXtpRpoXVQ>
 <xmx:K-gxXjgfnG66-lFXhl5vHEVz7xBt7SzDAVYFvjZqkke8QMHxTqt88w>
 <xmx:K-gxXvQ7IhMv3Y2OE0M0OffOyTI-JrWhEIU00bF5m3aTCpj7RKCUBg>
 <xmx:K-gxXlRcCZyWVjexzXjmhFSMVGQCN0QGVkEqNZqxPAieRf1hxzquM5uDqCQVnqmu>
Received: from localhost (unknown [199.201.64.132])
 by mail.messagingengine.com (Postfix) with ESMTPA id 640CF3060B27;
 Wed, 29 Jan 2020 15:16:43 -0500 (EST)
Date: Wed, 29 Jan 2020 12:16:42 -0800
From: Patrick Williams <patrick@stwcx.xyz>
To: Emily Shaffer <emilyshaffer@google.com>
Subject: Re: Test email - ignore
Message-ID: <20200129201642.GA92818@patrickw3-mbp.dhcp.thefacebook.com>
References: <23247186-abaa-4f7d-88fb-38f871c745e8@www.fastmail.com>
 <CAJoAoZkC6qb35i7GUXMdG3ZKvCDkeX6KAQoumFpjRpVZFsahpg@mail.gmail.com>
 <20200129191857.GB89175@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200129191857.GB89175@patrickw3-mbp.dhcp.thefacebook.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2020 at 11:18:59AM -0800, Patrick Williams wrote:
> On Wed, Jan 29, 2020 at 11:01:47AM -0800, Emily Shaffer wrote:
> > I had pretty high latency between sending and my mail showing up on the
> > archive earlier this week. I wonder if some queue is overfull somewhere.
> >=20
>=20
> Thanks for the ack.  I seem to be able to get mail to show up on the
> list when I use my providers web-client but not SMTP.  Not sure why.

I think I figured this out, which might be useful to someone somewhere
someday.  The latest version of msmtp deprecated (and maybe changed the
behavior of) the 'auto_from on'.  My emails were being generated with a
Return-Path of <local-user>@<domain> instead of <email>@<domain>.  Seems
that the mailing list software didn't like that.

I'm going to "spam" the list with a few emails that I intended to send
over the last week but never made it through.  Sorry if you were on a
direct To/Cc and you're getting a duplicate.

--=20
Patrick Williams

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4x6CgACgkQqwNHzC0A
wRmQ7Q/9GQWK7KwyOw9duEEs9hnfL0xL0ITeDMZOnqdFdiV4seJb2GEvXj7FdLzf
op0oNaAnnI/378VhFpz1eijDVvnX/0DHFIbXvZsBDlqOdfhp3d3A444YidCAyL4H
NMSJ+KvN0mq9U11xz0zydqW5cM++EuX6Gvw3qInHLnBANrdAq1wF4wiSTdr3taEf
MzMc+fDFlRKia1FrxGS5GUpy6h59uy3WhY0VlcL35HTn64Ck9S6XCfOSfAhCp0x+
fXV1M7Oojmf7Hkf+MIYpHD0kjBjWMl3WL8tKdUnWGxKGabi6Yl89eHgzIwNvcQGA
hVclz7Hl3fwKFzFCAbw0Rhq+XOoOMV8WQrmMCJ5IXdxVH7695cFGr/tovgCOZitG
EUDMakIPhDZrVDTUQRH1U2tAV8YY/oAMm6h/rrRwG1sbZgVII71NMWQbpWsaIUh0
Ztv0DjhLn1PctFPG2+04HulGENiRzVFNFJ5rzM+2lfpt1vh/chylRmJUrj2wq30A
dUYVr+b4GfsWzyEZXC8DzueuTCB/SnL7f9OU/cAtBm8+BAdFNlwfqrpUgAhGv/9H
C+rtvYu0HkNSA/NFby6twCVzTY7M3dYp2eiEuHYDpf1M7YL/1u+SS9iR+RYppk1D
23IUlTdeYjm1FsFWiU9v78TnmmKfv4fcg/bLgKyg/4Jno9KhX/o=
=FjDf
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
