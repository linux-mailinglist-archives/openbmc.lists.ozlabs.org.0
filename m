Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B752042A6
	for <lists+openbmc@lfdr.de>; Mon, 22 Jun 2020 23:27:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rMvZ1hjXzDqXN
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 07:27:54 +1000 (AEST)
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
 header.s=fm2 header.b=X/ujY9di; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=BPFgkPmI; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rMtm5bFnzDqWc
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 07:27:12 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 07CAE5C0C70;
 Mon, 22 Jun 2020 17:27:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 22 Jun 2020 17:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0aMZLsz2Ltx7ZMQ1BMTB3PU2XSn
 LJdrTz3onWD9uA9I=; b=X/ujY9ditk+zFK5DpHnGqh9pHaTuO5Cb7itG2xBl/7V
 RVhqiGf0dw/yaunEUF59X6rYZsyBMtkxf32bcPf9Yh7RAVbATO60kVVp6eRH37aB
 9bJObiSeV024nUelqUvT9P7k9xz4vpfYQnxA30bMlUPMotZV3RF8NL14iQ7zu/ys
 3F4QZc28sgmRQ5vtezGJDTwlr7/pTDh+7FbIGPU40G2Tiq/Jyd6+bmnjsXZo8NST
 6nXzk1eJyZ4skpN24EtBfU6jpZPkbLTrCYrbyH8Tv0b6/GNJNABbt07VpAf9a40n
 34xJ1HdsmbmWI9b2r+JhQc9b+Fs+6y9bwzqK6Tn5yXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0aMZLs
 z2Ltx7ZMQ1BMTB3PU2XSnLJdrTz3onWD9uA9I=; b=BPFgkPmIdtVCI63LLYoEFW
 X3PeKbZxexLR73kLjfbm7mCg8RWTavX7wULYns1xunr76o/XR72O03eer84WZzaK
 y/rBSLTNR6lKIIfqcntuZ/AA7FSC22Q0oaa5Cc4qAWpaAku/D1c2L0sAS6MUrET2
 Kd3VfLG2k7MBfEu/iPUdWSANIAaFfwf9NmZeu1Efto4cM26fXkWvGjucnMRBLyqa
 JIJIAYLom1NJasMX8tcs0PJkq7zvr8VGUeCDxKIkVEihTjV8FsLc8P05rFZbaJzC
 YvGDyUPbBSCGH2DOSZFcRMzRPJzLov7Jc1DlRS4QABrhBvzFU32S+8Y7sFdvSwDA
 ==
X-ME-Sender: <xms:LCLxXl_a6JU5qOZTdya3Dv7skM4KQOQgkKYXZqK8d4LfVo762EQ_VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekvddgudeivdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepudeifedruddugedrudefvd
 drfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:LCLxXptw4AHvAH7bB_8XAZluiwf7pYV5btAvcfE10GCY1ueYtTOa_Q>
 <xmx:LCLxXjCM_6EF_fRJ4WVmqL0gn1JGj1Yojmjmnj3yqgXnsE_16zO53A>
 <xmx:LCLxXpc85bKgrXY-gZ39t5UOhcgUjFNYOAT2_xA4wxICIyn2pucxeA>
 <xmx:LSLxXgaSsA8JH0ayEDS30S3tUk97m7eKkiQhHb2b-hg1_OYaJsjWXg>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7483E306740F;
 Mon, 22 Jun 2020 17:27:07 -0400 (EDT)
Date: Mon, 22 Jun 2020 16:27:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Derick Montague <Derick.Montague@ibm.com>
Subject: Re: Default branch naming in GitHub repositories
Message-ID: <20200622212702.GA45973@patrickw3-mbp.dhcp.thefacebook.com>
References: <OFBE678676.EE578E7F-ON0025858F.006AB938-0025858F.006BAC65@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <OFBE678676.EE578E7F-ON0025858F.006AB938-0025858F.006BAC65@notes.na.collabserv.com>
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


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 07:36:04PM +0000, Derick Montague wrote:
> There is also an initiative to change the default branch naming in
> Github. Github is in the process of making changes for new repositories,
> and I would like to suggest that we start discussions about our default
> branch naming. One suggestion that has some traction is replacing master
> with main.=20

The default name within Github doesn't really matter.  This is only the
place that it draws the default landing page and statistics from and is
already trivial to change.

> I'd like to discuss an overall strategy and the impact it would have on
> our build scripts before I ask to make this change in the webui-vue repos=
itory.

My personal opinion is we should follow whatever upstream git does.  The
default branch name has fairly broad reaching impacts to git usability
and Yocto recipes.  If git decides to change the default branch name,
that project is going to plow through many of the implications of that
decision before it gets to us and Yocto will likely similarly start the
transition ahead of us.  If we decide to proactively change the name to
something else, we have to deal with all of that impact ourselves.

--=20
Patrick Williams

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7xIiMACgkQqwNHzC0A
wRng3Q//ctg1XbVtfY38LHt38cFCOy5GeRn8YLwBa6JSwH5mju5B79jkBHWQLdG8
Bc/4+qUbl3seNsKnuu8zWuFcZv4e9UT3AxVX+1Cq20gB8L5SKSPU1IqGgr7HmSAn
TCIWQtYcEW93GiW06iK6mga+XE+cADoZIpPLQNBHwPPqbA7dbgG/fL3YDgOC9Qws
t0ZEadhUUJ76V7mXyI1jZhZD6VNMkvLqos0tBETq2pJQaCOBmbXjqEXimk3D+AO3
jxYbmhtyBlWK0uAnYPl1AIGwagoV3FnuaZoRq0FfSv8vD8z6mjho+9PlfV3vbefY
/Ru02xopi0g4PTDhkIB+FIXEAQJu2Y95TgIt28hTvyqQmGW0l+0YdFoRVgfWUKb5
KMsFfXHkoRu77D+tib9g78dvI1QYjybL36QP0nZ81wjpbojEr+9F+r7BPTGMyL/U
yR6SJ6900Qlj81eQk7Z25tFfZL1rroXZ/OqqLcqDYsoXtOzDB5SwFEszpU1+GEY/
2i2blCgPQvi2+Ply/j72mpz1RCCN4yexNsSIoWOTF/Z8PII2cRMhJR2i52VoKXjU
9RAUVor/wHje1Zhs8hUWvoN/+O5CgbLLLnFargwop8dcBvIoqsp0raUpTw8iqpCV
J/tAH90d39pnzQsMb7eDtRr4PL/zzQqftBAJ5WLiQInyu3pJvro=
=wAc2
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
