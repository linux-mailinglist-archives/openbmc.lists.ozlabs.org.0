Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B97492C91
	for <lists+openbmc@lfdr.de>; Tue, 18 Jan 2022 18:41:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdbfM60xqz30MG
	for <lists+openbmc@lfdr.de>; Wed, 19 Jan 2022 04:40:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=c7UcCATI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=cVFuRJg8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=c7UcCATI; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=cVFuRJg8; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jdbds2xn2z305L
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jan 2022 04:40:32 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8EFC15C01E1;
 Tue, 18 Jan 2022 12:40:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 18 Jan 2022 12:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8YzRWuoLlMOAGKM+XqAa4M6OleB
 ODKztKF01f5NTHB8=; b=c7UcCATI9uTq0KL4GApubntGiCMfFf+u/5KclX9jL2k
 GIfMhpD4IWccPkgYZ1gXnI/f4yDgZLy8JNIpaETrkNeTIsbbn47W4JJzHzwSAGhQ
 t1VqhBtnlvJlCIV+5FQjDM3WqumiK+vmi+nQPVnCEvyUYR+Lh0y7zhJkGCyb9Yun
 zzC3i/ZearimEXyC2FAXlrj0VmFvxEuDz5u/ChqBezFms7YCrZx/SHan7F9CSUVB
 Fgv9ez5RpNqVAUjoiUKHXS+FO3l1B9p9YcuRVMUKh+AWRRO03hYxREdimtptz0CK
 7ZKohiMqOaxjIrODc21Ty3n3kg/PXp088fI4L/WFEsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8YzRWu
 oLlMOAGKM+XqAa4M6OleBODKztKF01f5NTHB8=; b=cVFuRJg8FWUBaK3Ih2soyW
 Uav229pyu/WBW5yfzgfVYwNUmh1kW+uy7NhItgkeAUfFtpf/U4BTMURD+1jPVdY9
 VwiPIYCjO5bHS7VC5QCOhTbcplvdCgXuANwvcETOe22ChlFPV/HiChyI7xHenR/p
 5eeFlWzszEIjX+f1jYoZWDU02adbL3U/5YtsdMwO23fGcnjQn9zaaS3pCVzTa5WK
 +G/dR2XBDUAGVGS3Evl9DIdkbpIusKewBoKxgtWecWsU9ceX9zoUvu/xyBoMCmaB
 e/GFYTLG5kBkpu9+JzULVrGMjCgeHUq67pVW0qDPnoJgAbc+lTVEV4bwlsQmnDFA
 ==
X-ME-Sender: <xms:i_vmYT_LAToydAwic-Akqmm1TXm6iz67JQq4a_ZP6QucLhfFPObdaA>
 <xme:i_vmYfs_aJc0huiFHlsFzql28uwMU4kNvixeV6qh2Rj6u3jxZplJk-WEgFkoAFJjJ
 0iag-otgous-OBfLfQ>
X-ME-Received: <xmr:i_vmYRAYo73OSeYOQIrnDV50ZdqwZ87daghTE_0ZEjb7jyoRojebwPBML8zSZDeq9ioj3cvb68MHn2gi_GG4ID0ZlXmUYZfD5tFw5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgddutdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:i_vmYfcKs5lT8IpEktv127u4QYJwUhR1yWf31FKhYXX5uRDTT5XUVA>
 <xmx:i_vmYYNZDdfiXl-5UwV-zMa5BUUiPiVPvOIuLPwWS0PZ5mIjgmkoKQ>
 <xmx:i_vmYRlrxS7u-pXKukLAqd8UZ1vaxwSzyuVyfLqWF6zZT9zK_s3EIA>
 <xmx:jPvmYRb0Cg2JOEapP16fRtunBMpVBGQaJGYyoZPbgpS_SHSx1iQ2wA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jan 2022 12:40:27 -0500 (EST)
Date: Tue, 18 Jan 2022 11:40:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Procedure for the send review on u-boot patch
Message-ID: <Yeb7iXvJSFvWa/NP@heinlein>
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein>
 <CACPK8XebyrX1jpiJxsvH7+kJxKYMWgbWG7GZYi9BU9qYJWHi6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gZ2rmDakEgEL598n"
Content-Disposition: inline
In-Reply-To: <CACPK8XebyrX1jpiJxsvH7+kJxKYMWgbWG7GZYi9BU9qYJWHi6w@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com,
 logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--gZ2rmDakEgEL598n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 06:54:48AM +0000, Joel Stanley wrote:
> On Fri, 14 Jan 2022 at 18:45, Patrick Williams <patrick@stwcx.xyz> wrote:
> > On Thu, Jan 13, 2022 at 10:40:40PM +0000, Joel Stanley wrote:
> > > I strongly recommend using the newer v2019.04 based branch for any new
> > > system you're bringing up.

I was under the mistaken assumption that the aspeed-sdk was not hosted and
maintained by us.  In u-boot-common-aspeed-sdk_2019.04.inc I see:

HOMEPAGE =3D "https://github.com/AspeedTech-BMC/u-boot"

=2E.. but ...

SRC_URI =3D "git://git@github.com/openbmc/u-boot.git;nobranch=3D1;protocol=
=3Dhttps"

Should we align these to avoid any confusion?  I assume we should adjust the
HOMEPAGE to point at our repository?

--=20
Patrick Williams

--gZ2rmDakEgEL598n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHm+4cACgkQqwNHzC0A
wRkhHg//TZ90J8ATeIp/GNzFcE2qqZj6mHmHJutAr/FDFODW5PHdScNleZD0SqL0
Iz63stNp5UnYgRvmOWW3YeIHxm8niEX1Z2RNJipPP4yBZAbk8/jxdVQ7L1Ry56nf
L/9+iNb2h/BcBMb/pgXzk4n1RE5HA3LXvT5BIlAwmPILgy+tUhU4m87aqWO5exMN
oQMu1g3rTRMPU0lpyuMP3YiGlnSKuaWYyfM4uNxGPKaeGtzCZUN2krjRGyKNMJOY
a95dvhYDp8YSVwyoE2ipCXSouPee2FHfh11hQdN7OrL7rYofIxdCTDXiN4ITRLIJ
UZKmoeMkn0FFx6uFS7qdbUTe/fuGBo4bZwyipItfubj/wNOxJ7bYddPARrtm06c1
uovI/68j/c15iH9unM8XTPbQOUT4aKBHr/DZfS402hF0ImWhFflxFGzlGQjgVHa+
Xa0G/mqxTWxlthBCG8HXVMNGwVmi+RKlN4qEbkW6oca/s0tpY+HPjvO/8xTupnQa
/Be7IMSFTcOTbb1oHsDR7lEumEu714ykwBKb+aovduCLvYCm8a1kdfQoqX5sLQmD
zb3ZSqdRSYcHL1B//Hg7a7QRBgsAygpkUmC6GqdEum42tI1ybwj7Z/TBNycRv+PT
kZMze+9XgTfNJP96LMrZQe/9Lh/b6PCCswKB5sBtutrap4XxN34=
=pb69
-----END PGP SIGNATURE-----

--gZ2rmDakEgEL598n--
