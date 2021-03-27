Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB334B776
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 15:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F70vK12TFz30Cd
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 01:04:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=bvd/bNgu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KunnCbIg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=bvd/bNgu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=KunnCbIg; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F70v44TwYz2xYm
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 01:04:00 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 48DA05C00A2;
 Sat, 27 Mar 2021 10:03:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 27 Mar 2021 10:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=p+FeFfbO8N1sPyKoiaKfZp0UpbM
 hRcmRrBMSLk8/HO4=; b=bvd/bNguc6FbmTumgw5LsppUgqzaRNWSbqgDGDHtfBM
 dN0uedJFAEfDoF1HilLPn+5fm92kkxB+XgdDJn6O3KcuWD6eNB8DKjcVjtgodTrb
 bnJCZk/aZMVFIIbfqokqWSrIglvGHTe0NAc6H8dZUeB5EwbODIvs/tuCgmwbqauX
 sWKeF8ZeVOLPaNLVfcYvfr6mVh/h72eTGIoovp194uUau3OzibEO2IovF/C4g1VE
 JpZW9sWtXDPxLlhQSN/CKb+uBaAMurSg9B3KTH7kKsJ61DNL+JhQAHikT6DAPhIe
 fJj6vtpuAqSMBiL+A1sP35DPnfPha2v52zRxT+AH9uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=p+FeFf
 bO8N1sPyKoiaKfZp0UpbMhRcmRrBMSLk8/HO4=; b=KunnCbIgBwZfodx+CqDMyd
 Do8Hpy+03z+wLJ+yFrnRJTxMom7UeouAupV1jH28r29wUyLFJKhJzDOD8cj1mkaZ
 +1jmg+tQgY+6T+h6NYXJ4RImKiFk3wX6FnJGJLcjpD0osBO+jXWfLnDpbv52Iv+4
 O4KlC5xS3c7Cjr4DkURZ2H3EOlkUk8Jwy0A2Rhe4SCCuyL7ZLdXlyhAcGCgtdnL6
 1FVoeVBg3HW7/aWrqEC89YbZPZMpsq+Sfz1ZLwo1zytiqbbRt0mA2k/DqdGTdyH4
 MdzNOFV7Pn2ljYBiisImk04frqW5sfkZSQT9uDzhqkFrtIMwSeXfnsnG3fjOidDg
 ==
X-ME-Sender: <xms:TDtfYHigCO6Cp30Sa-81SgWlrwXbh6tvILQr1XzrG70tCV9rz1n5sw>
 <xme:TDtfYEA_bmAqqnk82-HlikWR72wtPZ_JlSDF5nW-3_QGBfGUrd6iepLiPtNje3zCG
 CJNbLZLo9FOkwKjUJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdettddvkeetiefgleegheelkeef
 hfefjeekheetgfdujefggfehtdffteffudeunecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiipdhgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdek
 gedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:TDtfYHHGJOIl6CE-7mzXP7_7Fpp9C1VqyGG_XeCChWhd9mG9t2C_SA>
 <xmx:TDtfYERwAYeKMPKLOnR_20o_CvV5wP9qzNc--T26oCr3J_O2yafCRg>
 <xmx:TDtfYEypbXlnm3hFJWZQHkGx6V9vrjQe1EBfW_leK87TjO_zdmHWIg>
 <xmx:TjtfYDou9WoH8XnKM0A5oDCiS2R1bxIAIQFHwZ8AFGNu05_TISTsyA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9905124005D;
 Sat, 27 Mar 2021 10:03:56 -0400 (EDT)
Date: Sat, 27 Mar 2021 09:03:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Sunitha Harish <sunithaharish04@gmail.com>
Subject: Re: UnitTest using the /tmp file system
Message-ID: <YF87S2Y9texS/ac0@heinlein>
References: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MJhcfh/UCEPtbk1k"
Content-Disposition: inline
In-Reply-To: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, deepak.kodihalli.83@gmail.com,
 edtanous@google.com, bradleyb@fuzziesquirrel.com, gmills@us.ibm.com,
 geissonator@yahoo.com, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--MJhcfh/UCEPtbk1k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 21, 2021 at 09:30:30AM +0530, Sunitha Harish wrote:

> This is regarding the unit tests in various repos under openbmc like:=20
> phosphor-bmc-code-management, phosphor-logging, phosphor-networkd, pldm=
=20
> etc . I have seen the testcases using the /tmp filesystem to create the=
=20
> directories/files when the UT is run.
>=20
> I followed the similar way of writing the UT in one of my commits=20
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37352 .=A0 As per=
=20
> the review comments in this commit, using the /tmp file system for UT is=
=20
> anti-pattern, and this needs to be changed by mocking the same. I agree=
=20
> that this is a valid thing to do.

With respect to this being an "anti-pattern", I'm not sure where this
statement is coming from.  Generally we have very few statements on how
unit-testing should be done across the project and this is certainly not
an "anti-pattern" documented in our usual place[1].

In terms of "what is appropriate to do in a unit test", I see two
possible perspectives:
    1. Anything is permissible and appropriate to do in a unit test (and
       thus nothing is *required* to be mocked).
    2. No system calls may be called from the unit test (and thus all
       system calls are required to be mocked).

Anything other than these two possibilities seems, to me, relatively
arbitrary without specific evidence that the un-mocked code is
problematic.  Nobody actually follows #2 because if you did you'd need
to mock even the 'sbrk' call which is used to create your heap.  So, the
question is why is one set of system calls reasonable to use in a
unit-test and another not?

We have many unit tests across the project that interact with either
the file system or dbus.  Whoever wrote them probably decided that was
the most pragmatic way to test their code and gain the coverage they
were looking for and whoever maintained the repository accepted that as
a solution.  In this case, I would encourage you to dig deeper into the
maintainer's opinion as to why this is an inappropriate approach for
this particular repository or unit-test.

There is one specific problem area we have encountered with fs-using UTs
and it is aggravated by the fact that we run tests in parallel and
sometimes Jenkins jobs land on the same machine: any files you create in
the file system, or dbus services you create, should use some sort of
randomness to avoid collisions between separate UTs.  I see in your
original commit, before the UTs were removed, that you used 'mkdtemp'
with an XXXXXX pattern which should resolve this potential issue.

1. https://github.com/openbmc/docs/blob/0f6c884822ca2d101e2a0bf3256ecf4f6f2=
431a3/anti-patterns.md

--=20
Patrick Williams

--MJhcfh/UCEPtbk1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBfO0kACgkQqwNHzC0A
wRmD/w/+MYTuwiktQwGPg/3NSX7NOlmeYqVLPSI1f1fS96OgMYYDvrRNNdNOKYHP
zDfgsNm2AnuaKzOrg1DHI/IMIm5daR7l/mVnVKQ0T5wl3P7O7jbSwxwdnr+yeYsM
G+JJ2R5sXNopBeQ0ghcHdSzYRJTyAgX15NpMEpCFtFR2brBCZbdLMTl23A5aqGMh
KaRTavBYUSLzKfN35y8NVHnoWFc9xJSa3KBUsbK8j9Bkw2qzwV0dgJkrx6E50Kak
5yIarHVtEI39bXce4sqzUnb+kgR9VmAdrjD+KIGZvluUrDCHgHUQCHfKtRlTDsj2
W72q4lvsNKHLg7QJp6ns0UlJjZx9WUkfXh8ku5IsCeAdlw3+iMfexGzTX5OgvtBW
lwLJrjMaBW//sAM6ar7jg9DxaaK60GWPkM+RTU5NdImuWGltOvsdk+uJchvYc2Wj
JYVb0/loxCcxNNxIKrtUNZr4XKrwT9aocU46G+Xeq/2mMnWDcSBvDrfPoPfYovGI
DK7d4PqsTDNP6DRbssSAsR+a3D70dXgvuqaQACF6gunyAGcMvQ9MaRtSRYoS2e1G
Ia51ax8rhHnS2g9RouLQkzWhDIERK1qofx0S2UzAfbFuEhBskMIternrNmFnI02j
BGteq/9cHTkqK46gkxHhy0PtwdtDlBVIVBr5uspV9t22EyxH3A4=
=wsjC
-----END PGP SIGNATURE-----

--MJhcfh/UCEPtbk1k--
