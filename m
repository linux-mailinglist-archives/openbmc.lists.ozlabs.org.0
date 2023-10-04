Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD9D7B81D4
	for <lists+openbmc@lfdr.de>; Wed,  4 Oct 2023 16:09:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=mail header.b=WUNVF+2/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0xQ45jrVz3cb4
	for <lists+openbmc@lfdr.de>; Thu,  5 Oct 2023 01:09:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sandelman.ca header.i=@sandelman.ca header.a=rsa-sha256 header.s=mail header.b=WUNVF+2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sandelman.ca (client-ip=209.87.249.19; helo=tuna.sandelman.ca; envelope-from=mcr@sandelman.ca; receiver=lists.ozlabs.org)
X-Greylist: delayed 374 seconds by postgrey-1.37 at boromir; Thu, 05 Oct 2023 01:08:42 AEDT
Received: from tuna.sandelman.ca (tuna.sandelman.ca [209.87.249.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0xPQ6Nfvz2yVL
	for <openbmc@lists.ozlabs.org>; Thu,  5 Oct 2023 01:08:41 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by tuna.sandelman.ca (Postfix) with ESMTP id F35FF1800D;
	Wed,  4 Oct 2023 10:02:22 -0400 (EDT)
Received: from tuna.sandelman.ca ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RyJpxAZ9b01W; Wed,  4 Oct 2023 10:02:21 -0400 (EDT)
Received: from sandelman.ca (obiwan.sandelman.ca [IPv6:2607:f0b0:f:2::247])
	by tuna.sandelman.ca (Postfix) with ESMTP id EC52D1800C;
	Wed,  4 Oct 2023 10:02:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sandelman.ca;
	s=mail; t=1696428140;
	bh=mGooiwI3zfDcD3AmcVxcF7nIZsYXnXeyJWEUZWeMM6k=;
	h=From:To:cc:Subject:In-Reply-To:References:Date:From;
	b=WUNVF+2/q/XP91mB4aeXJBYbz1G5YaWNGDQvH+BByddKX4MAZwr+QJtgfC9TiLx3j
	 A7hhGWGxSzDosfPv6VAVxR34QvwV2p1JBJl/h2D2UxYmmFsnzcq+0xKBs9sooBEdp7
	 a4CqN5iTyfrhGApwLqjBkIlzgvz/W8ks/7Kg42GltAFzaf+jWOr6LYTkmBVem42fKl
	 LrJgPuGyla0VKzZn8nF4WqDSPxUgrzTGXfETw5l+ncbBhJzmjuscq+pC7lNodX2Bak
	 sEvi/1fea2v8KMIDKiH+woJ238W+4U0W7FAOtMCR0QwmDxLAp0D8PzQcaUM8GlZkde
	 KrPMVclF0XlXA==
Received: from localhost (localhost [IPv6:::1])
	by sandelman.ca (Postfix) with ESMTP id DE27B1B6;
	Wed,  4 Oct 2023 10:02:20 -0400 (EDT)
From: Michael Richardson <mcr@sandelman.ca>
To: Zev Weiss <zweiss@equinix.com>
Subject: Re: Aspeed SuperIO runtime management
In-Reply-To: <20231004003427.GI19997@packtop>
References: <20231004003427.GI19997@packtop>
X-Mailer: MH-E 8.6+git; nmh 1.7+dev; GNU Emacs 27.1
X-Face: $\n1pF)h^`}$H>Hk{L"x@)JS7<%Az}5RyS@k9X%29-lHB$Ti.V>2bi.~ehC0;<'$9xN5Ub#
 z!G,p`nR&p7Fz@^UXIn156S8.~^@MJ*mMsD7=QFeq%AL4m<nPbLgmtKK-5dC@#:k
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 04 Oct 2023 10:02:20 -0400
Message-ID: <3490.1696428140@localhost>
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

--=-=-=
Content-Type: text/plain


Zev Weiss <zweiss@equinix.com> wrote:
    > For reasons I don't fully understand but that I think are orthogonal to
    > this particular issue, the platform in question can't use the Aspeed
    > VUART, and so instead uses two SUARTs configured back-to-back via the
    > UART mux to provide the host's serial console.  The host's firmware thus
    > enables its UART early in the host boot sequence, which requires that
    > the AST2500's built-in SuperIO device be enabled (SCU70[20]=0).

I don't really understand much about these SUARTs and the SuperIO.

I guess the SuperIO is supposed to now be provisioned only by the BMC,
except for this exception.
I use the word provisioned here, because I think that the host would get to
configure the UARTs speed, stop bits, etc. via it's normal process.

My question is: what if the BMC just did all the provisioning necessary and
the host either just didn't, or perhaps if it really wants to do this, that
it be faked into writing to some other thing that isn't really those
registers.

    > 1. Does anyone know of any better ways of handling this problem?



--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCgAvFiEEbsyLEzg/qUTA43uogItw+93Q3WUFAmUdcGwRHG1jckBzYW5k
ZWxtYW4uY2EACgkQgItw+93Q3WXbXAf/W86KrrPMlidU43h/eJYyvwpymgwpUVF4
Hs0MITtVIUzaXHO78JpfaZZ3PPiBcWkMlztNN2b26ptWK6wxAZq1yzorMGcov9UB
V1335tZubZeXE5LZa9EFChp0N83w7W8U/glV2iM2Oy1GWNPKpRda92ZQ510AfPT5
CJNO8I92PRHuYFNwDgB1zmbFPaz5iub1PVhplRvy5OTLtOzMGlmnBpxNR6GP3O7W
5VRJH6pnNomiJ6zxbQt047XQc1E8UjLBGH4vmql2UIekgQ/pTMgLlbiwig2JVrJ2
Rfa4couyRqStYHJSHfsbQdsc3SpRoa0CZDINO0ihYfv5zLMf0tctGw==
=00YL
-----END PGP SIGNATURE-----
--=-=-=--
