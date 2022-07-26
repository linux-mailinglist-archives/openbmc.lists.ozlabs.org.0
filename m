Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6035816F6
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 18:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LshZc1lftz3bnV
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 02:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=UFuOY2TS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WCdZd1MT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=UFuOY2TS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WCdZd1MT;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LshZ62MbPz3bZY
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 02:04:45 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id A22025C0144;
	Tue, 26 Jul 2022 12:04:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 26 Jul 2022 12:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658851480; x=1658937880; bh=a6f1CrYBK3
	cjjtgqfVGH2IZkfk4izkWqCxCWdm306FM=; b=UFuOY2TSZfah37xjC8T4IpQ7+Z
	8gSsFs8TwmGzqvaB4aY7WDi7ZGeXI1nLQ35ukRhcH4zFDERxLQmYrqAQJJddWglc
	TowMxf4BbjiSw22twSXlHj01yDIt/wiguMRtoJDJijyWUGnlKYRfulnYtwN26Qhh
	4FoZEXXbcSmqVOHQSC1t+W4XaRLNPXBogWGS+tvFyFvcsPF3ACMXHrmy7LVvoglb
	Is+WCvLN4zY5fKmVVmImMWaExLh4SpbWc2/nGthfqzE7Kc+MBWwjoAH1ZZ1wPxft
	cqhceFRswIbjHseSPwJTkzkMM7W5eHEFUlO2uUdW5ZDrd75ifKHBFSR46wag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658851480; x=1658937880; bh=a6f1CrYBK3cjjtgqfVGH2IZkfk4i
	zkWqCxCWdm306FM=; b=WCdZd1MTT8Kk+U94GnteZyW2cfL6zjjWkShB8Wa0jNpx
	4IpZKNQW3BNde4rogqyYyo14TOMutX941FEaZy4PwFby32evm+Zasjc65l2V0c2q
	7cpyzzIRJNu7wOE4PNbfUZEFhTuc0jK0Gi1nePk3XZLNaBUDcwVaAEcCl7Yk31fO
	XljGpW/Fyz/vfLbaxfFJ1HjlGdhBTkGo9qW794sb04Bxy/5OLXxZw3zEvIMlAGUx
	pTvvRAIH2z7ElB+WDGUvIW04iox4m9ED8eVc1d1WIggOnnEqYnCme2n8eMwdZ7Ve
	kUOlJ7YbGTgN8PjATkU1hfr3gjdw240UyRACWH+qxw==
X-ME-Sender: <xms:lhDgYpuiJmBk9PJ9QSWiWegpeACkZNU2DEFtiIZFnbJ1SK8vDAfdiw>
    <xme:lhDgYieaZD_TsC7wbT6zUaPxsd7h7ma_bTGlPQr6S55B4LbxK0idzsMq7_H1tG66j
    enj4sIemLq48AwhQmI>
X-ME-Received: <xmr:lhDgYswEqUW7Pb9yuZga61jlTCtOHkO1RhD-C1crubDc5SBF-cvRMTwuP_3ms33sSQVOPNQAhMTHUfb2JUJ8fp6jzaW2s2xn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:lxDgYgO_ORzrGfx89uXBOqLX9fYWqBgmlYtFVBBybYtjG1pUry7XyA>
    <xmx:lxDgYp_KOtP7x6vCfY72gCIOxwI94vz8oEx2yONZ_g_SbeXH9sw2FQ>
    <xmx:lxDgYgW8je86Gx4X5dDEuhdw4tkvs9E0GJgfy-V8mRtrl5qf0sNDeg>
    <xmx:mBDgYtVD9lWRLecMlTHoxsIv21dK01w73RY8H4KkeVRkqN6sMAixPw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 12:04:38 -0400 (EDT)
Date: Tue, 26 Jul 2022 11:04:37 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Logananth Sundararaj <logananth13.hcl@gmail.com>
Subject: Re: [PATCH v5] ARM: dts: aspeed: Adding Facebook Yosemite V3.5 BMC
Message-ID: <YuAQlU8IfBK4zI9R@heinlein.stwcx.org.github.beta.tailscale.net>
References: <20220726132445.GA22389@logan-ThinkPad-T14-Gen-1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oJH/1hxiws+0ENCW"
Content-Disposition: inline
In-Reply-To: <20220726132445.GA22389@logan-ThinkPad-T14-Gen-1>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, naveen.mosess@hcl.com, thangavel.k@hcl.com, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Olof Johansson <olof@lixom.net>, garnermic@gmail.com, velumanit@hcl.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--oJH/1hxiws+0ENCW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 06:54:45PM +0530, Logananth Sundararaj wrote:
> The Yosemite V3.5 is a facebook multi-node server
> platform that host four OCP server. The BMC
> in the Yosemite V3.5 platform based on AST2600 SoC.
>=20
> This patch adds linux device tree entry related to
> Yosemite V3.5 specific devices connected to BMC SoC.
>=20
> Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--oJH/1hxiws+0ENCW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLgEJUACgkQqwNHzC0A
wRneRA//ZQzNIoyRePI4dlJRvGZUaMFxkV/lNgQ5tvL+Zqo6Eu80BE6LekfIvSQ5
n0NXmbveTLyp6G5ZxN2FCxOuuPV/HFgnabM6GN6J+DUjmaaFEAH1TW2e2FTdC8su
T4JtaRNVIFpQfKE5U1x23wvVtjhqy+KtE2sNdE/TVxlXZF8bMjsz15LPfExtGBId
1Dyh4tkEX1vbrUGuaELTRc7jkl9R5BecViN1CyKUngapW+lE2hNAvfzy4uwvGyi9
8cf/V55a+XqEq7AUoyRJC4grswnKrs3FTItQfiwJLbq4mp/7pJSP2ooboprFdXQL
3QlmiFOsV2Uq3nPlC6U4Tuj8pq7nGxdG4OL/140Rb1c6don1JjlnfCQMRhDyYgnU
GKomtike5wFRxMzKF7YVC1KEauWFXPeh6aQJtXg0cTL+wwN1Aav86EOrZrd6LpTO
YTLBRHr50R0bnKZfos/ZFwuKYsU/4XF24GUp6WwqiqYSSZo+ZUJLT/txKmLZNKbZ
Bqpz89bmvHnN2vkaFXJt/YMo4M1v5QJIXcfqEMLxr/IgH89bUuiP8asTJXYPXQUq
LbbnMAJWafdQhgnBnXPtZDLx4BeBTZ/nzLK4dHtOeDqVZpWIewVjhNWHDUNp4iuS
jwubG8I1zIiHJBe6VC+36Ru2JXv6V5e5CEiUUSTHnZ0YbSqlRV0=
=guU1
-----END PGP SIGNATURE-----

--oJH/1hxiws+0ENCW--
