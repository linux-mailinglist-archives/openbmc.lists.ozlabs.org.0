Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93033155BCE
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 17:31:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DgmZ5Jf7zDqgS
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 03:31:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=JI9YC+kX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bQSuxy75; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Dglg4wsSzDqdR
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 03:30:54 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 062F1501;
 Fri,  7 Feb 2020 11:30:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 07 Feb 2020 11:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Owg+UkSsQCPmiABga+pRK6S9a4/
 I6dUWenOfIB728ow=; b=JI9YC+kXMI+5e/IAlVj2I/3uCOqyLq3Xg76HB3QSItV
 pd0mqCxGS44xOTMqxxEbwvSNzWuvyUwl5F21stIq+zC8nzRgdXuBgp1H7pNIIJSD
 cfYumou3U/R8rimJ9foVICxCUJoQO2HON+h0/c7qIj6OYttTM22VwDS0EhnicqJm
 skdKNmVxXIG4oVnAmLcozrmalbi3opBhnDew497NGcxvzCuiTsiez7qzmwYgeQMI
 swU01P3fw17oYN+28yknLvba+wEseUncQbZhO8X3X9Y5B0LkScogte4hfv4Danxc
 ZIuWLYJ3Pmx/pWp7wgU7NZPzGWWY3fZAZi2TqE3KavQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Owg+Uk
 SsQCPmiABga+pRK6S9a4/I6dUWenOfIB728ow=; b=bQSuxy75gAw0adDquyJuyY
 uzW3+g4DFr14thVkhS7L9D0DZ/sIPMhlgEY9xqoi0i6JZDW1RGGhlbHwwFeeLfEr
 R8ZA9WOCquDB00SQFuVu81d+X1r1+NLdr/fQtqQ8X0sICzJV0AnJ6BnF3vKVLa0s
 eKRaVC+QRGPVRrPLVt91pSBpM/TpWzNwSg7dgqsePVTEejDKP1L535UsjeQV6OOm
 59OpXjBq0Xsm4bFpKeD8JS9yb150ddOkb8QEi9HyBrdmO06kqkLkmBOP6qbd284P
 qnbKcAIf1reM75syndgQ2gazR0luvtegXIaWgOj2X7887BdoCb1SAhnZV8bTbR1w
 ==
X-ME-Sender: <xms:upA9Xvjoc_AAthsbHyt8KiHlrh5If0osp3nyqQIyPY_0TsUu_4AARg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrheehgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeifedruddugedrudeftddruddvkeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:upA9XuohEfWPAd0YzrRFLwuhi7Lf1YFCDSvCCfQvN_ODHy0vr3hyhw>
 <xmx:upA9XkBy0CXkp_Em8VdWrdp4I9jxlxk8VJ4QovAVXX-Mq2_BZRXY1g>
 <xmx:upA9XvNy1aVCBaS3bHDg5tXalnWK4EJFeZ5loTHHvfzYVXUziirQOw>
 <xmx:upA9XmD_74Z9ndhc6ptNq80OPlniqWcEfd5Qt9jsG361UJ_SzcMr_bgCxSE>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 05FF13280062;
 Fri,  7 Feb 2020 11:30:49 -0500 (EST)
Date: Fri, 7 Feb 2020 10:30:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Kurt Taylor <kurt.r.taylor@gmail.com>
Subject: Re: Community support - where do want to be in a year?
Message-ID: <20200207163045.GA38734@patrickw3-mbp.dhcp.thefacebook.com>
References: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <CAG5OiwhNq55Om4=NU8F7SSebDqMQpKhHuhAC-aFz=QKBLM6Wig@mail.gmail.com>
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


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 06:02:01PM -0600, Kurt Taylor wrote:

One interesting thing the #yocto channel has on IRC is a bot that=20
posts links whenever someone opens a Stack Overflow with a 'yocto'
tag.  I think we need a better mechanism to help with "drive by"
questions.

This was pointedly said in the IRC and I certainly agree with it:

    ------: I realize ------ is asking a lot of basic questions that most
    of us would normally answer by reading the code and experimenting.
    They are highlighting major gaps in documentation though

We often have introductory questions on IRC and mailing list that go
unanswered.  So, having a Stack Override bot wouldn't do anything if
people don't take turns answering.

--=20
Patrick Williams

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl49kLMACgkQqwNHzC0A
wRmQ2hAApETZTfnK515lqFMgRL5vxpf6/BxVckzhyFxoZVigeZfZVFJxmphF/EfS
dd3ZkAak0fQYcgZYmn+Zqq+tbAhj4rzy97hME2pCALTHuxc9a8qmvOyLhz0ZDPxk
IegX1LlbSmwyIOgxsn2M7ulTNfO0xjXz4oLzoMsEtE2t6jTzaIHhy0h9elpQKGXB
SrRB5F2CBG+zrADaIRpFlJzVysApAa5ZFgyuwCtpCSi+gimzWiSYR11GReFNTPJU
a4xqHud4VOuh/QMfeml2Q6HyCzLxdLFoxvX+4RqpMDNY4E9bWhvslBHe5zuRm5tm
vyVZQywgY1dxDKmKqkZPh6ul/yJlA6S7cv4SPLdLNrWaLm0RboNXsvFZoFDgXgku
yDG1Qh0sw5WGIG92cxGjtRj7jYVav+KOqmQLsy9AwqTjaK71Y+nhAZJexyXhgndc
HxOSXC+vWd4LXSggULU0UXDqmqJ6LCN+UxzzqfP2LDqlJtPbbsJAOM0n6JRpwtRY
aJHJRJKsOsPBv7aEfEky0D8BZhmel8ZI6F2uYD0bJ3EDphUJvSzmSx5b35aoRA1g
JONGa881rKdoG83W2L/D6CvtuWz/hqZQFbeekHnvbmzgDWUGPwPH3QmsVwEfNpn9
qVq3/1AS2WtlKKV7yaR9efLDO58n46E1SBHZxNsRCjiExfX7Kxc=
=Ge9K
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
