Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 392FE293EBB
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 16:30:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFwyT3KpDzDqjZ
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 01:30:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=oXaAobKM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=J4F5t6px; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFwwg3gc2zDqcX
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 01:28:51 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C57545C0166;
 Tue, 20 Oct 2020 10:28:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 20 Oct 2020 10:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ZTy6m1DxHjvu6qUaW+Qg6FPUQFq
 hh0LqUyyogqxas4Q=; b=oXaAobKMY3/2lzUfgeDhy4QgFd6uswsMBdQ2xJUtTsn
 e3sbAcsyfvAGe9PyL74cPrfLHibAC43UcVq3erDPMUMDeBODKKXuId1JVyW+/ysC
 ShamZCUjQ2FABkuk8RNZQ08+qs6/YiOKlXRNzaVU4F2TXs4nSYzhkjH87651ECo3
 utkyHqzgFPC45RskPvJ/Y1sj7xzWNuyRAblnsSbtCC3TK8GuvyeE2RquILnXiDEv
 7OMtChMwiH9isXBDAJYCywpGQhzhnUw3SnzfH4gK3EipG74ECIldkNas+5p9oKr3
 jXrtBpCM4ZPaEUQS1NTD2ybMdEJLIFOwmFwyyGHtw3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZTy6m1
 DxHjvu6qUaW+Qg6FPUQFqhh0LqUyyogqxas4Q=; b=J4F5t6pxDdCGPKpeeD3k6J
 0Rc8mEeDcB9JJDLNapV4JSO+hQKIMUwZZU0EG04PkL3xOxLkVu8uXdMgEom9ipwe
 U1IxQHElOXeVXAXradwFEJ9G5jCNI/koUQL+uqp0oN022OBwkVpEsnspZH/0C6Cu
 e+H7f0Gg8cZxIUTEEQTd9vFIRlSNMtBPhVWIvZb3PYQj2UPf+pJcEX087buACe7U
 94aLLcS4i5JJVXq/4wlnzw0dgbEBSlw9K9YaV4wAeI40I6G+63i6FAOdRrbIgiyF
 Cz5Y2K4ZZYAf5xRt8OKjH0Yd75QJHU/ZWyFnfD6z0L4wTSd9KpK4MDJvnwVmKd1g
 ==
X-ME-Sender: <xms:IPSOX_j28V8QyDdmSnXUB6Nx8sJAgkYDAQEDnBWbdmXy39CHtkdvEA>
 <xme:IPSOX8ATf0K-0P4rR5l0zhL9J_xJ1aM4RPa6gM_SW5xgzi11ofUYTfx7fZehIaqWC
 11XGPRQCzHIdzMxzys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeefgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepudeifedruddugedrudefvddrfe
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:IPSOX_FAOiitWQSRqFOlLpkcW6D1HIgQFcKEk2Zcs1FfF9a37xrUJA>
 <xmx:IPSOX8SYNZgaqoRKL0BaUJCsS4r0JN42x9CeKruswO-xZkoM_paBxw>
 <xmx:IPSOX8znBf_o63i1JEtp8pu6FMPZonKB5XCdE7fTTj3YPncjtMUucg>
 <xmx:IPSOX5v-KQom6_XOtsiOb0-HU8YoiZh2ZB2EjnjyhU6oburs9KPsKA>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id DF5DB3064680;
 Tue, 20 Oct 2020 10:28:47 -0400 (EDT)
Date: Tue, 20 Oct 2020 09:28:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: Critical BMC process failure recovery
Message-ID: <20201020142846.GB5030@patrickw3-mbp.lan.stwcx.xyz>
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
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


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I like the proposal to reuse what systemd already provides.  It does
look like Lei pointed to some existing bbclass that could be enhanced
for this purpose so that any recipe can simply 'inherit ...' and maybe
set a variable to indicate that it is providing "critical services".

On Mon, Oct 19, 2020 at 02:53:11PM -0500, Andrew Geissler wrote:
> Greetings,
>=20
> I've started initial investigation into two IBM requirements:
>=20
> - Reboot the BMC if a "critical" process fails and can not recover
> - Limit the amount of times the BMC reboots for recovery
>   - Limit should be configurable, i.e. 3 resets within 5 minutes

I like that it has a time bound on it here.  If the reset didn't have a
time bound that would be a problem to me because it means that a slow
memory leak could eventually get the BMCs into this state.

Do you need to do anything in relationship with the WDT and failover
settings there?  I'm thinking you'll need to do something to ensure that
you don't swap flash banks between these resets.  Do you need to do N
resets on one flash bank and then M on the other?

It seems that the most likely cause of N resets in a short time is some
sort of flash corruption, BMC chip error, or a bug aggravated some RWFS
setting.  None of these are particularly recovered by the reset but at
least you know your in a bad situation at that point.

>   - If limit reached, display error to panel (if one available) and halt
>     the BMC.

And then what?  What is the remediation for this condition?  Are there
any services, such as SSH, that will continue to run in this state?  I
hope the only answer for remediation is physical access / power cycle.

--=20
Patrick Williams

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+O9BsACgkQqwNHzC0A
wRkPhxAAg30ATcHvDLOTAG6dDjgoWPkr5wBFOFmf5vL9rivSh/F1pXXmRwWddbuO
ULnaGwHRrV9OLreFL6vsU27AJUkf1dxrXgs1kB0pWBpqoU06XIn2iVzGQN/ACSV1
WpaJWHhrjuWoSAREVAhAarK7WxPjjvi8IntOuq1PMuvGfsP96TYvIvxKaB7bdxg9
lxMYQMmrBzCoRnjtyZbsjk5cqYdRJ1Eezw7aJQ5O7Tlgt7T03k4sok7ZJBT2ovVw
eGGQv42/8bNkOfuquJ/4j+JLYtzK0cMAuZF2meLjxd1lVKvwacM/nmrpZmAPsbjL
x6OSCIBTBl98AkqYdHUlHy0OQ43asa8yQfFcijBXY6VTtWgkPLzXEPq89GmKFZIG
5RsJ9a862dxPLxuEKuAX+IwHoWlw0W76t8Mcg5VPVP+QQaan5DBr9PzaV3jSBwDb
xzx8sqofePgUl9GZPy3EKqJgF5U4PkLjzVw72XhR+EQcMqZAbjbNNgfsMhaagyLf
8b7PglZ+UIpEhohQOMbW72RenDtfOy3n1mgMqFQkRfskvQUEFxNgiQ7/n4RZA/Lx
DOKNquIXJmCFuF0HoY96N5veRO4wEzWCalvt2+CcobDaIXPKdABRLFKAklXptOZ/
DPQGI+L99XIRqWldNZhjGWrNyWL7WdcRu00JO3GSUat4DEbH8Ho=
=EygD
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
