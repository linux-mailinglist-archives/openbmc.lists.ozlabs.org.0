Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49903477ABD
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 18:36:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFK6Q0fLyz30R8
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 04:36:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=HyVzx40B;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RwssU/wf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=HyVzx40B; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=RwssU/wf; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFK613WjHz2y0B
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 04:36:09 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 844DA3200A6A;
 Thu, 16 Dec 2021 12:36:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 16 Dec 2021 12:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm3; bh=addcqSOeOtbCdB0dUOLd8Q1+EUWF1BiriTA/hummKPY=; b=HyVzx40B
 QQx9urAhT75acDXCq/gQDxEjeUOTu3R/PXgZm6izX9yFinxihesyIRRHW++9UOGM
 crEurD/zF7XjXdXwmYuzZr2VKtO2Ytocswmexi1FiXXdSBJ1KfpJFyRl0ZTW2M0s
 +/9wDO++2gtuFJTS/5Ek5dMgqOwyRXog8v53QEaQiduKM9KOnp7BSgYgw3Ryn2Uj
 AmKjuG6NIUsFhPfCQYtA1bArC5ONorrGiMTIHbIu+/ZBrM291o9YwLV9kdhFm6T4
 3vL9W9v4XsBgT3ZRE+0Kr2Ub50CHO4L/tI8AfG48F2X24M9hz5MxXaaM9zgO019H
 2sKmvZiwkniMFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=addcqSOeOtbCdB0dUOLd8Q1+EUWF1
 BiriTA/hummKPY=; b=RwssU/wf4SnhmQ6aZuloXgJza23AjrIVFysHfwgklTHDc
 ejgZuXwzGo2tLHRpBQJEYoW/EdVTnCrrSNruJPbh56iePGS4yx9Le6awrlEqiaiN
 gQSoi3/Ob6td2HWC+iueafx2nmGdxqRRRGMDqRtW8vaBgUC92n6NUv0+/qoVsu5M
 SRv56dqNYfroDrcOJNefQFCOZhTDQ8EuCqGGq9RKknYJiCvbgVRnmz++fH1wmrBx
 DFUJCGdzAUVRBPKQWz7eVhsR4FXDJG+CFW4ZyddiPvSk/KwwVd5m/xJkusfEdHos
 UZ0r6wFn6fYrNk8JHqN2hysl/7sQqmshLOnG002SA==
X-ME-Sender: <xms:Bnm7YZGOpexLIvU3iNinFJL2L7XJcSHL6t-1SwdokMP0l5l6-ubDZw>
 <xme:Bnm7YeUVNvTsp0d5CsAmkyGdVr3hqr3GkS1gwWGg0T0HDUoXk8DND4UaKMe9BHzN0
 YKxFJyHVzfX6y5o-D4>
X-ME-Received: <xmr:Bnm7YbJoL09XOfnw0S7xy4DKi82urQpXfr_Gjvr0yJTuCS6TJ7MHfcD1sV7y3QOoOmIpiPblF02mIWDblmZqjQa2kvrT8gcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeffueelheelvdefveejueffjeejveeu
 veehtdduffdtgeelkedvtdevveetgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Bnm7YfHrOnS6Mf5o_u-w5duczyWQRlrDvYZjNOri0Q0TD_zFYonE2A>
 <xmx:Bnm7YfW_gCk7zWpXypRz_YXHeA59Rcxycb9Z4Iyzv4E1TkcrCYkI0Q>
 <xmx:Bnm7YaN1CkVY7fEY3enLKtWf5-N7MOaHLjjFf56QvD95Hm99fVOv4Q>
 <xmx:B3m7YQcqKn_4Q7_UkhfWA6uEr7sPOxVvx_4fcjoxCpuHqbrdeaRTIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 12:36:06 -0500 (EST)
Date: Thu, 16 Dec 2021 11:36:05 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Enable Bletchley in Jenkins.
Message-ID: <Ybt5BZg/vjRWfp3W@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ECDcQF7QXVs91cRX"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ECDcQF7QXVs91cRX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Andrew,

Can we get the machine 'bletchley' enabled in CI?  Facebook is doing some f=
airly
active development on it and I'd like to keep tabs on build regressions.  We
currently contribute 4 cloud instances to the Jenkins pool and have 3 machi=
ne
types.  Let me know if we need to enable any additional compute resources.

--=20
Patrick Williams

--ECDcQF7QXVs91cRX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG7eQMACgkQqwNHzC0A
wRl2aRAAkVd9jnZ7UhPEwZyumO0hCp7dwQiip2vJ0j9DatzfQB6obn79OLY92bhr
jQm60X/FiDOTO1b77VO2CPJF+QOSXnODYpfkaEwVk3gBJ5PP8ZA+0kl9gRilO74z
c6re6Z9sctLXZT1FBP2AAgyU/SercmXiLS8CyFOVNc5yq4gzxW9JomBj8EoQYcJC
HkytCSgeawexqgGbdMFPcB/suwmVaaIt2dPtIXoF3pdKBrSneaGvsS1CLDqk/9oZ
a07LSCWpiHJuPH4ZyYb3pDH7DKbYJVDTE/rHXPzuDp/Uif5e2f204oFBptOgWKMx
mAvkj1AdiA3CRbWET6Q7V2OYtO4VInNVkAtqK7fnmrgCt7W4U9Dz6T8/GAPShvRn
2VVY3q7UJl8C9brEezGsHuPrcRYJ3p+N5gcRcj6tvHo4mx92gb9AML10u1CKPskP
afDkiQloWSs3uvi5EjeC2L0vaqcIvJJZDbhpVC9/8Md9qzZswjjdQzeD/AmDVuUi
cD+Zr3Ttb31tWSE7BQtv5hf+XxMrK1Vjs5/ZLDutyKhd6Q+XAXCqCIVKd6dzFVmu
GA9I8eOWX+jVLjmX3Fq99/0xBWklmvZCKim8hUH2aCnm6Y8MTpy9fKxYaQ18VmTI
Wa7JeVas0eHcfb6VERX7l3aLQrAJIQFYKA1Vtj4TFSyt6C+buAU=
=3NLS
-----END PGP SIGNATURE-----

--ECDcQF7QXVs91cRX--
