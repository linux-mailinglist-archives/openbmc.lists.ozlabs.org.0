Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8D316685
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 13:24:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbJpQ349JzDskQ
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 23:23:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=DoLGJI88; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=qsrhMV/V; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbJjt0xNLzDq63
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 23:20:01 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9087A5C01B9;
 Wed, 10 Feb 2021 07:19:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 07:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fPG/FEq+YLqlhCEgkEFFoGWGqCp
 tcddLf7EPZU9yDIg=; b=DoLGJI88KkVWtcxDjK/BnZIbDh7xOYpSB3XvS0vBsvt
 KzQFDEPzO67Bub7NDeK9///tn9o5PeRChm34AZaOO/Wc1Lz3L1qfaycBSHKHjKk1
 HD78NCYfzXNUDWd4iDvw2QJz3/AN4o9Y2gmkGpHr7tB9QcffALGE5fTsW2tUYJJQ
 TK4UIx641G1vWRLG6e1765hIbvnGtntQAblT1BgZ5sQBrycTLw7yZ77I0CMq3si/
 eTbwC4AAkbNq2aODLSJIuwM8h/Kj8KXmkLL+nQmBShekDLT6CX3u3acjxnGz0vnR
 oGZaok6hZGNKuhr3JvJA03xk3L+sbrFA3yOPrL51KIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fPG/FE
 q+YLqlhCEgkEFFoGWGqCptcddLf7EPZU9yDIg=; b=qsrhMV/VZTmHt79jZc/skO
 1knl2eiNeuS04jhjEUCfHQPskiJSMvjN0jVkTqnFlCslcq46qtAwJVBiGX40mcNo
 iFSVd+Rvo/D23LbPFGKgD26zsE59jI6YB/MFQ6Q9timZW8VHY607sweCjZcV/B+0
 Nz3cJ6S2Jn1/hFxMnHHnbux67YVlm2xWR5UGUTIzOje6QefMA5sVmnb4fDwCgPF3
 oIZi+UqoNGM5zxZMo/MuQIXn7hOOdvOXuPBfUBL9sxBQ6hnlG3iUASu4ISOwaTHY
 hLOafM1KDxILqOjbSn6+x5w7usVuQhTS0zlWVylKowzYXc/qYEzgp6LQLp+yvccA
 ==
X-ME-Sender: <xms:bc8jYFeRAJX1pqwqsXpoQMURGGrB1gDLwyAZEV0XlP2-DTTRx5SI1w>
 <xme:bc8jYDMo_Klui52SJt8bPw-89qLZKt4F7g5t3RSFWfOOhJseiSJzStaOHEjy8GyLJ
 erAjjZdxz1GftdNtFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdefkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefjeegvefgheduheevhedugeeivddv
 tddtleffteejfeeigffhleegueehiedugfenucffohhmrghinhepohhpvghnsghmtgdroh
 hrghdpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucfkphepjeeirddvhedtrdek
 gedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:bc8jYOhH3ywulb2Ab1tSZOJGt7oZ724SolUEeBx37QLJfxR5gkX9ig>
 <xmx:bc8jYO95b3Qds_0_F2tL-aW9zpomF24M0ulPaUdEkYQ8pqaH8aiXjQ>
 <xmx:bc8jYBtpm6GQxPVnuY3i2E07rTovQLwG4fZ9WqMXtqp3TPvZQ36orQ>
 <xmx:bs8jYG4OnHL4ADkcXk3bbo6qjTl01IR8ZAX7_sW1YvGlht0mtM9VKQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A35E7108005B;
 Wed, 10 Feb 2021 07:19:57 -0500 (EST)
Date: Wed, 10 Feb 2021 06:19:56 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrei Kartashev <a.kartashev@yadro.com>
Subject: Re: peci-pcie CI issues
Message-ID: <YCPPbAlAUHtn+Vv1@heinlein>
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
 <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
 <27dbc305c6c53c338b5eefec68fbcda38ff44672.camel@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ez5vuV8vPr9Gmgd9"
Content-Disposition: inline
In-Reply-To: <27dbc305c6c53c338b5eefec68fbcda38ff44672.camel@yadro.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ez5vuV8vPr9Gmgd9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 01:04:41PM +0300, Andrei Kartashev wrote:
> As far as I can see, boost was updated to 1.75.0, but looks like it
> didn't help, CI still failed to build peci-pcie:
> https://jenkins.openbmc.org/job/ci-repository/12229/console
>

Hi Andrei,

Repository-level CI isn't done with bitbake but under a docker build we
have set up.  Jason put up a patch yesterday to update that to use Boost
1.75[1].  Once that is merged then the `ci-repository` job will use the
desired Boost version.

1. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/404=
26

--=20
Patrick Williams

--ez5vuV8vPr9Gmgd9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAjz2oACgkQqwNHzC0A
wRkoFw//cTYzHUriL4Ra8kTTE/HRqMm3wGFjSLWbAURPsMo0LM/NOEI6NgLR9t0t
C4eJUy08CGnfytQ3cvk0wT8D5fAwbG82tUEZdWTBGLGOWxQbazHg0nzTipfkW0+g
zb0OVned5ELRJtVQudX6bjla3yj1GXINu62Z3mPmA1669EsUOjNltoqgwQ9EB9M/
ZHTUZbwPPfP1yBjur3xNAY7Fk2xk88KSPZfo6oJnQJH1BAe+BXsqAo15Aq/tc4oG
5gY2Dy+KIRmREQaejw57p5UXJTphCtbpptRVI00zYPp0wimjf9fnngjwvV0N374Z
1JTtoYkYuaehlHSJsL3Crb0UJCUEUhzzfSzFajHaqZWmjCtzEQhON549N/1dgdN4
7m6ecBsDdAlhnQqBCd2uq25z9fQdfaCbomAK5NIdVK5TtYr8NtfAUPOe70if6ahR
tTtYuXmqBC3vaVMGfOImJala60XoNmB9qGcr3V20GVbeSPipDYv3gWVmhXThO3qR
lpN0grzqokQyW1gOHu0rJzFb3a43VWVE67uL354KvynxlEDHByf5VXOFUhhPD+rS
Xez3NKnXgYJpLtT2PLH3fKTTjIKlpeXhonc5GYElPbokhQ+cSyeyj4/WPYwcVyIf
AK5z3fMb2FcNrSZQyeFFMzXFgQq9opw7VIpHx1M4fdOHImSHs0w=
=reDB
-----END PGP SIGNATURE-----

--ez5vuV8vPr9Gmgd9--
