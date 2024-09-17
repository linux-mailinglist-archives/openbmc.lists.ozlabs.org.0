Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D3897AA0A
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 02:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X736J5RcXz3cBZ
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 10:47:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726534069;
	cv=none; b=gNcX4UjAAO/H10DhyqHTxWuhlQw/h2jHkK//Zrlp48T52YBFFJ/pJXwwzOCkGknH9jQHSdPWBUTH1UzxDlpbQaYcgZHvgFHy788f/YlkF1XAEulD9VaMnq09+LioZKSSJGod5MqpLcJf8XJELCoAF8ZrZUc+F78s2RBboTBf3CMdYgVSPbJD62VGy7JCHWqGrfclfMOF+pISJBw2Otxuw9bxR+4KD6Kh/z9FMvZMubo5vXI3M2pR+6K+oIRcECA4w/1Z6nRp7hjkEx+X6CDMxi51WsEWbfnKDkHxqnUTPsT6aMWXFg0IDhAZIWRYNHEQGekrpvdufaaXkVYHFnmS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726534069; c=relaxed/relaxed;
	bh=obVn8ZDiop36gykWwsSV7P4NJnquzWJcjoGj3HHVzAk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ikiPY1RUJz0gJdO6PTe8N4hRS5rc6P1hc0cSMkn0KaIfQCiJ2rcH+ohX8OPTBV5UVQ0tNRXa0thmxsTH+rTqrcJH6EM3dFYhpM4U/7FBGJYioqRg/HXlVPIQjgIkJ7g4UF2VP2LXLgGlXnJ5c07IJ6p8/0te+Pix21YQ1QMObRg0+qkTq8Jq+GMmvHkE52om4ZjHVVLISfwOltreSMJ2ml8SYLiZ/1l1Y0EoZu7H8BQyNGGJ8no0vbugbi0bAt02S6oR3tKwUCSdUuSzwUZQeSKR4stX/StPZX90bks6c3EtfTYCLkKB7h4Jkp8nL/et0olwio0XgKgCulXsLjwrvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=A6AXdYV6; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=A6AXdYV6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X736F0qXTz2xYr
	for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2024 10:47:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726534066;
	bh=obVn8ZDiop36gykWwsSV7P4NJnquzWJcjoGj3HHVzAk=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=A6AXdYV6Am2jzbKUaNOJkPoF7w/sToU+olt4/0ShOu1BREyqXmota49HEs8BL9mVx
	 /eCf5unoKlRQj1Z1T+ijXa5taQD0z4eUg2ZvSQ4peS3yqqA3oK6sGUslEu/ZxfeZj5
	 AlBZ8+ds8R0VJtpShzR0PMEOwaGexp4x8P9Km88M+4GSCn1Yj8iUP/7LRZvEcrl+5a
	 7U+1edaQqVhHP1j/AGGIkIH5ONYDyYtxbxatvlfVj8n4uhh4ZRY1GgIkhLNgYy75Ls
	 mEJpa5FiHSmxszM2B3UcDzQPbdL2H+EHqmWgc51GBtlyU5MlSAOx4x5GTkE5PRbmpV
	 aWAf2IqV/IAwQ==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E465A64BDC;
	Tue, 17 Sep 2024 08:47:45 +0800 (AWST)
Message-ID: <0964cae1468abcafc0e09cdbcda895dc9dc7a1a6.camel@codeconstruct.com.au>
Subject: Re: libmctp / libpldm / pldmtool
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Ananth, Rajesh" <rajesh.ananth@smartm.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Tue, 17 Sep 2024 10:17:43 +0930
In-Reply-To: <BN8PR04MB59061FDDDFB2CA9E6276A7CA94602@BN8PR04MB5906.namprd04.prod.outlook.com>
References: 	<BN8PR04MB5906A2433F59E7470A2E939794642@BN8PR04MB5906.namprd04.prod.outlook.com>
	 <5605d69863356355297b370efacdff44cc8ed7dd.camel@codeconstruct.com.au>
	 <BN8PR04MB59061FDDDFB2CA9E6276A7CA94602@BN8PR04MB5906.namprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rajesh,

On Mon, 2024-09-16 at 15:13 +0000, Ananth, Rajesh wrote:
> Andrew,
>=20
> Thank you so much. For people like us who are totally new to this develop=
ment environment, the "siloed" aspect of information availability has been =
very difficult to navigate through.
>=20
> The objective of ours is to use the PLDM and SPDM software tools with the=
 MCTP support in the OpenBMC environment. We are totally new to this develo=
pment, and hence based on our own research we went with Portwell's PCOMC660=
 board (for a charge) that came up with their own BB layer added to the Ope=
nBMC source. This source is not in the OpenBMC github but in their own priv=
ate tree that is forked downstream by them. Our thought was to have somebod=
y who could help us directly, instead of going to a big forum like yours.
>=20

Working with open source projects almost always goes best if you engage
with them socially as well as technically :) If the "big forum" part of
OpenBMC felt intimidating then it's important we know about that too,
so we can work to make it more inclusive.

The discord instance[1] is hopefully a more casual way to get in touch
with the community.

[1]: https://discord.gg/69Km47zH98

> We had so many new things to navigate through.

For the OpenBMC-specific bits, it might be good to get your thoughts on
this post from yesterday:

https://lore.kernel.org/all/0a691364b0d01644c9ca6dfee4b76e69106650d2.camel@=
codeconstruct.com.au/

>=20
> We make CXL controller cards, and for them PLDM Type-5 based Firmware upd=
ate is very critical for our customers. Also, our customers need SPDM suppo=
rt for device authenticity. We want to have a development environment to va=
lidate what we build. Without a ready to run stack of MCTP, PLDM (libpldm, =
pldmtool, pldmresponder), and SPDM, for people like ours to put them all to=
gether  is becoming a huge project on its own.
>=20
> In the downstream Portwell source we have:
> 1. xys.openbmc_project.mcptd.service is there, but is not discovering any=
 endpoints. We tried over smbus as well as Pcie, as their board as well as =
our CXL firmware supports MCTP over both the interfaces.
> 2. Utilities such as  mctp-ast,  mctp-astpcie-test etc., are present.  No=
 PLDM tools are present.

These all sound like pieces of a puzzle that doesn't reflect upstream
OpenBMC. I suspect you've got Intel's mctpd, and ASPEED's mctp tools.

Upstream OpenBMC uses Linux's AF_MCTP sockets and the mctp tools from
the same people that did the upstream kernel work:

https://github.com/CodeConstruct/mctp

I'm not sure how easy they will be to integrate in your context, but
I'd certainly recommend trying given that it's the community supported
approach.

>=20
> We have been asking the Portwell team to provide them. But we thought, we=
 could do on our own with the delay that was really frustrating.
> The documentation for OpenBMC support for PLDM, MCTP and SPDM, all refer =
to the full stack that is based on Linux  (the one you explained in your ea=
rlier email) and we went with integrating them in our source. That was a di=
saster as we just couldn't bake the recipe files properly (running in circl=
e reference).
>=20

Best to talk to the community before things become disasters :) Usually
you can find the person that did the work and talk with them directly
about what you're trying to do. That said if you're using a mix of
tools and support from Aspeed and Intel's OpenBMC fork, then it might
be a little more difficult.

>  The AF_MCTP reference that you mentioned was something we didn't know th=
at existed at all.

Please do ask questions if you think the AF_MCTP approach will help
your efforts!

Andrew

