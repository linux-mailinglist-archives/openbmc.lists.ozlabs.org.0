Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E15581D4D89
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 14:14:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NnQv59DTzDqqW
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 22:14:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=str44s/1; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RRxCbFKo; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NnPq2g0szDqqW
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 22:13:50 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id BFE615F3;
 Fri, 15 May 2020 08:13:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 15 May 2020 08:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=pvsOKXRoYqtZpJoj2BRU7KP3Az3
 N9lB1el+RdQzvv0E=; b=str44s/1EnuIGoXPdlitQypCqZUtgEnsWtiML4LoqAI
 ayxRnDqHvV8OuZu4qeKAffjpDNgCcKR/I8pZYop7aJyxZGr85VrKPSmo2C7TU/3E
 HEzaBhAVH8fDplgq9NA7a/kjqsxz0thvUFLFno/47XrrrWbSFRyiGnEJ2fxc0MPT
 TBNydIOj5fEm58b8CNuwK/IwtyQyjNaBDkrq70BpWl4231vb+P+DrQZckYyIp+cK
 u05rrjAfytszQf0eK8LW0YTqIiWQvyDBdg+H8vzbDEnQIBW9VBf+u22JGLt4/Yuy
 SLOfQpjoepCRqdnIDgaiWVk7n0bkTuyFrB707JX0JMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pvsOKX
 RoYqtZpJoj2BRU7KP3Az3N9lB1el+RdQzvv0E=; b=RRxCbFKo7OZuKCYcx7QfTg
 ZLrLzfPVqvJ1Wev2FcnrxIt2A3DQE+sr30jYgpiuW6bmmumVFdQhFXQCobiE1RaD
 iwIoja1Q7fvetZmRSgJzrPx1EarLFH/D5BUuIdI3z8Qhl4rg9kAkDmaEU4HrQyzn
 1pD+32TaE/kfDVXVgrLzLLNRLp883yV+9K7fm9XteugbV4qwwNYz2bsXbdqu6Rm0
 fBHy2MDl6Dq5OC9VSqjp7MDoW/PIKBfOpYugkuZ03v8/o3UWFf/mpjUACAmPv6U2
 1Lntrlsu/PgdrvYMsxt/ujdyZpUVB82PQ5XhsZA2jg8geso2M6PwHWf25HseuMgQ
 ==
X-ME-Sender: <xms:eIe-XkFrzGJMh1xB8-S8zrRiJphL15Jvmm7zTJltVQHPw5VdjFI1wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleekgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 egheehfeffgeekveehtdfhgfduhfegfefgtdehhfektdelffevkefgueffhedtieenucfk
 phepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:eIe-XtUsSD94JXEWD_8yWlghxAHb0InByrhXgRFNXJ1RRVc5mn1_ng>
 <xmx:eIe-XuLMvsscynwp4KhqbadxcCASqgWZ5AcwiND79R7kf8z2nlg3bw>
 <xmx:eIe-XmG0i03aA6A1dhTimn57UBWX9vPL7aId2XzrougWrbPd3uCyEA>
 <xmx:eYe-Xng0Re7sd3nziMkgB7AJkBuSgg9LD3jzCbOgPD4CjZ8HTxLb7w>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 565423280059;
 Fri, 15 May 2020 08:13:44 -0400 (EDT)
Date: Fri, 15 May 2020 07:13:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Zbyszek <zbigniewku@gmail.com>
Subject: Re: OpenBMC userguide questions
Message-ID: <20200515121343.GG1166713@heinlein>
References: <CAB_SOc61Z0F=pkRfvjYUATAkQvYpu3+Qo7hSoGmmvT7+hzQhqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline
In-Reply-To: <CAB_SOc61Z0F=pkRfvjYUATAkQvYpu3+Qo7hSoGmmvT7+hzQhqA@mail.gmail.com>
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com,
 anoo@us.ibm.com, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Zbyszek,

In general, I would say you should follow the format of existing
documents.  I think that answers the majoriy of your questions at a
high-level.

On Fri, May 15, 2020 at 08:49:49AM +0200, Zbyszek wrote:
> * Should we use the reply markup to indicate side comments though-out?

I would say no.  In Markdown ">" are for quotes.  You're not quoting
anything.  Skimming through it seems like with a little effort you could
just integrate these "side comments" into the document flow.

> * Do we want to add user level doc to userguide? or put this doc under
> security? Currently userguide only has a .tex including other markup.

It looks like the userguide directory is for a .tex wrapper that was put
in to generate a single document from a few Markdown sub-files.  The
majority of the "content" of this file comes from the root directory, so
it would seem that the pattern is to treat most things in root as
"user-guides".

The whole docs repository could use some reorganization, but we should
treat that separate from this commit.

> * Do we allow the `---` line separating doc header and text
> introducing to document?

No, let's follow the format of the existing documents.  Maybe a=20
"## Introduction" would be just as appropriate in this case.

--=20
Patrick Williams

--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6+h3UACgkQqwNHzC0A
wRmcsw//RJmYZrHnNpJEgS94KxT8imP9PzMG2GbGAH5JZu5WDG0m2hwqkSnCdTLY
mz8AbsAJC8KP1TcPhycEwXSO6eRPuJQas3kOSVdchVHA7bd5ujVFQDggkPOqXcpn
403knL4J72sjzjUqxQXBX813l2H0mMU9rLzzkgywPa03wdsvM+oIWLtjLiBcdJoK
2LGp5p68TJga73RHl3XIy6KIDShUWPzLHOQUGxxl0eulj7YAB35OyKL53qeQKoW/
ktF4amKliEji06QW0Axm2HUe+34LW3kTbY55zJ1ZYzWZOQjUTPOhhN4K6xncak73
AIuOvvgYc1vesuK6bEreoAl05lCiSCPU77WJkPgamlD0e6CyzZ+nyB4RCmn7CBU2
c4g18qa/DFJVtKH2nw1dmlQJyk9Ksvaoq5j3MoctQOxLZg5+fCiPtGUliCeqSvv6
Cn6vl9AX+r8ywDQgCJsLFiLjlyx5FbqhWJzLgY2O7qID89B3J/NFrPG9vwur4oNi
tt70NZsKoDZZiRvo2BO0tg5NMh4LIh1q9UCJpu1PLu3mNGdjWkGZHcP3bC1uWd6R
J+oK4P7rZAh72tWVLO3QrguUtyWbWtLy3Vo7z6CvA1Xsmj232+FRXppyQGil4IFb
mZDDtixJB08bYfIulgtMF9HjJVwcxaaY6ODXhbJJ8oL3g7zXTQ4=
=JEyN
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--
