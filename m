Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BE42B9D6A
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 23:11:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcYmg5WKRzDqsN
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 09:11:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=U7kiIo51; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=gCMVlZrK; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcYlh6BgQzDqpR
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 09:10:38 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6BEF0E08;
 Thu, 19 Nov 2020 17:10:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 Nov 2020 17:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=3luqfarilxTmYJ0Tv72H12vy0JQ
 EOEZRQJAldBkmGw8=; b=U7kiIo51kyvuyDAjmIts3nln/LdFThi4lkaRfILiqCg
 Q5N6dHNZpbJ4+AEzlg5KkTTCeLldB+q8nK6d+Lhhh+F/SHaHT4djg52L0Hf7D6DS
 frDxUxpWN177ZkOQu+clUHEtR9kk4s0WqgyAmv5Q6RN5SnbezwRgd206IxSEe+eA
 dhx5U4YwxwPWQOOo0mmgrRvNc4l0iWRy3qIZyD6BeyILGgNUlG19dZR1W3cqL9cL
 fuusTfIFjiE5zrX6ASM5R6SroE36qn1u5cb1Y/BOjRflRBfGPVT7NGCW+suAyS8p
 MP5pi1Ur9tWYSJt4SHHE1+osal2IOjbH2Sc9qmxyOTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3luqfa
 rilxTmYJ0Tv72H12vy0JQEOEZRQJAldBkmGw8=; b=gCMVlZrK61QYsdOQswnpiz
 05PdrQ3bwhh6RG1+u39TdVN5IMwcU4PrrpebKfGPiqLYzsARfOlDI+fc4AxQJVFT
 4oi1BiVgO3yr2S0BlCiPZj63R/jo0qHH9aiN6+xFkJIp+/sz96ZtLWSbGY3UEd7T
 y9H59o345yJNw4R7Qo+6h9JqhEH/XEXriHX3I6A3ZF1KXLQk/HqhtndVzfQeJ6ZX
 CRt0ApWiP4+orZNMjQjvMoDBD507qyPgaCa17MXSV5sBpsRE75uCfv+NP87t4+Mr
 LxrubXyjLeY01RiuJAl+olssvn3MAw6jyXllsSP4EtdpJP5WoGD51j0G+9NPJN2g
 ==
X-ME-Sender: <xms:We22X4DdYzpkdVISj5rFYGJSpwP8R6So8oev-vCscqSQefDzdPVXVg>
 <xme:We22X6hrfA9e62TjkEpeclR7hQ9QkN1gpRkljV4V3KH3dg0Wkd4NefOY1kBvdr3XE
 Eny7ybs4knwzvC6JTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefjedgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:We22X7ke80ZFvR1itKetpBdl66xBkQQeWkSx5t2BYSaRLieT6wVv0w>
 <xmx:We22X-y2jaiuE40V25IqvGCvx84_7N4sKRJgSxEef0EeJ1bTaI1L4Q>
 <xmx:We22X9SugpwvYJbxRZU8Pjm2XHaSQTKLGdr1q0GBWHZVsR8G6WEUYQ>
 <xmx:Wu22X4Nr85wOhF8XpILKUvePBf5ueO0p8DUVaQSURyJGRZNITK0ptQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 721533280066;
 Thu, 19 Nov 2020 17:10:33 -0500 (EST)
Date: Thu, 19 Nov 2020 16:10:32 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Subject: Re: [Announce] OpenBMC Discord Community
Message-ID: <20201119221032.GB1261035@heinlein>
References: <20201112145740.GB4495@heinlein>
 <5cf1d3c7-d871-103f-f518-9a88a5d0edd4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline
In-Reply-To: <5cf1d3c7-d871-103f-f518-9a88a5d0edd4@linux.intel.com>
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


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2020 at 12:51:05PM -0800, Bills, Jason M wrote:
> On 11/12/2020 6:57 AM, Patrick Williams wrote:
> However, I hit a situation today that was unexpected.  At its prompting,=
=20
> I installed the desktop app and got connected there instead of through=20
> the browser.  From there, I noticed that the app allows voice chatting=20
> that appears to be always enabled, but my microphone was muted, so I=20
> didn't think anything of it.
>=20
> I booted my system today and Discord started up and connected on its own=
=20
> which I expected.  However, I was halfway through an internal meeting=20
> when I realized that the microphone had defaulted to unmuted.  I don't=20
> know if it was broadcasting.
>=20
> Looking through the settings, I don't see a way to disable audio by=20
> default or an easy way to switch it on and off.  While looking for the=20
> audio settings, I also found settings for screen capturing but no clear=
=20
> way to disable it.
>=20
> Does anyone have recommendations on how to configure Discord to allow=20
> the communication features we want but disable any background sharing or=
=20
> broadcasting?  Maybe using only the browser would disable some of the=20
> sharing features I see in the app?

Hi Jason,

I don't recall seeing you in any of the voice channels so I don't think
anything was broadcast.  A few suggestions:

   - Make sure you are not joined to one of the Voice Channels, unless
     you are explicitly wanting to.  The Voice Channels are the only
     place where voice/video are shared.

   - Configure Voice Input Mode to 'Push to Talk' instead of 'Voice
     Activity'.
        - Settings -> Voice and Video -> Input Mode (Push to Talk).
        - This will ensure you are not able to broadcast unless pressing
          your push-to-talk key binding.  I have mine set to Right-Alt.

--=20
Patrick Williams

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+27VYACgkQqwNHzC0A
wRndNw/9H705pU1NtvFsnY86meobQmGSUehKVdsl7+VxEUsFiNp4VjJ1IWlGSMYh
qcfPm12NrjdP4s0YDi0uV9RQMajX/T/S9+FPE/VzfdKAp9nWVmdWv/w2yjOnd+lO
Oalt/d9Fm9VoCLLzITmwgSUBZ+9BEZaLjYsf1n7xTZyL/pAOTglYMhx0Ed204Dyo
2R0k3gcVxdpFWBsvh5+Agv2w5UwjA+4319f3X/ig6qsKLG8UcY282XE6dbTQ9173
Raukx4fJsonJdS/5fIc6JtcLKXCAd8CNQaihnmlsPYotVEhytUK24Fk1wfiGOtMd
J1eePubyozmLMq6zse/E9HuCe6V1tHLcaYYPhhl6yWqGzdVzuLUGv2JM74ExbFCL
nu1bTnIOjz1ti/AgXDbxFoxLVKBAa1NwwXZ9wLWsoy2oPPQQ6q2L5HBFNOIE/Ewk
BOv4JoGqU+M5IW2ePrtesc2MCjpzWppc76rmnY8X9yhyhrvLCQO7zwcJH7Hi+zu9
T+xXwxraoc9lTMrecMiWXO19z7hloM4MUSEwp/bBx3HTw5Lw0gvK61VZx9nDihQ5
GFu63ZpJHACcKzOn6dObXsTQCa2BDZ0cgRlMSZLlr2D0iM79pEp9t7JGJY7g/bAO
DOd/JdXXXdXC4/IqxKId3iIZX7VASe5otoTf3aGFRt4YXn7o2Ms=
=MkkA
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
