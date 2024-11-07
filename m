Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD689C0C7B
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2024 18:09:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpTY6pyKz3cLg
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 04:09:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999374;
	cv=none; b=Wdsr1oH/BHHhEF90yHQjrjDP3NcqTKwm0F10YImf5eAQMuuEpWCTaxdYeLGkM6e8bPbVSBnNPVzxPbzw6Ynb0dBFak+O5lImirSYWRfxgDWs6IboAa/1GcfkD56LCo7lKbIkhtC+GAl+FVV/jpRE0v9dPVhcWytJ1fCgOjVz7zsRjhN6qDJ/kvO0sYEPe/Lui9w0t4E10FWvtsp9pnDbgjhu2e5sA+ajzcwKs57l8yBYxs1LzzM8z25R8FoQHzBuQLAuGD6D3/+HMlf65xgOlzY7WcgmF+NPHK6sQ0VyEOVzG7OwCzN8wEQotimlJyB9KLOaDQQ0CQ5JV/mel87RdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999374; c=relaxed/relaxed;
	bh=2UwowlylA6AIUxnupqsBpgpXD1xGTxlGCKAu++1GW+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdU8Oat39QQX1VkHGsMKcq1k33SIU+K7x8yWjArwYObUnSl9euL0aks7u8xly7mEbeb9BCk8CW+J5BQVJJ6Zu9kzSMnRoQtrivH8Ji4vHpoWD16v0tvdb2VWSoLV3/BeVaKVCd9loWsqUHRSolG4XqWguXp+FYHu749Y2rE81MTAzDZPeEZj1HzD+FIpYJ2DLsqsbAj484sM/x9BPo6tsoJJggWZ7MM77hBbDI2zuBvO2bORJfUFU371zVKU1lP8rCNWcNdfjCL33ku+/J3VWgp+xqebhOM/bjfplBjrEgP8AaEo14FX23H8t157IR6G5aTqRyL6k0ZGVxXj19BG7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1ceALmO; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1ceALmO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpTT1y6sz30f5
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 04:09:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2C5A5C062E;
	Thu,  7 Nov 2024 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243F8C4CECC;
	Thu,  7 Nov 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730999369;
	bh=9f54dxIl3eMwRNQ9RNH0nhNpQ6mFCD7DUPK+U+I+s2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1ceALmOpXVDmMxRbzPEfjf44ktMb8IJIw5lCn4O2WlljA5gnCeFuqPvPRcu98S4V
	 6HAILwGAs7kg8T56TOAySl75Sp1LxU3tBT53AkwaWgpikEnuuALLIP2KJZJwpXv6W0
	 9Ghf5BuxO0K+n81/KZhb1PcxyiH6msIl3EWOog8mq1rYdc0o1rizGr+Kn5BdR+CKJh
	 +H11tCH5HBVLIDlDemnlhdooj3Z8xdwOlQJdtkPLI6fgPxN8/TSnVpBXbmdzifW4MQ
	 qAExp1IDuQTjDvnnukK3cn4UfHgedhjHz6g+pX4clyeJlf6w0mAtZu13eHXdULURBr
	 2TkK3rA5gn+Gw==
Date: Thu, 7 Nov 2024 17:09:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton
 MA35 family GMAC
Message-ID: <20241107-slip-graceful-767507d20d1b@spud>
References: <20241106111930.218825-1-a0987203069@gmail.com>
 <20241106111930.218825-2-a0987203069@gmail.com>
 <20241106-bloated-ranch-be94506d360c@spud>
 <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yB3ZUxT4SMqLRowR"
Content-Disposition: inline
In-Reply-To: <7c2f6af3-5686-452a-8d8a-191899b3d225@gmail.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yB3ZUxT4SMqLRowR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 06:15:51PM +0800, Joey Lu wrote:
> Conor Dooley =E6=96=BC 11/6/2024 11:44 PM =E5=AF=AB=E9=81=93:
> > On Wed, Nov 06, 2024 at 07:19:28PM +0800, Joey Lu wrote:
> > > +  nuvoton,sys:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description: phandle to access GCR (Global Control Register) reg=
isters.
> > Why do you need a phandle to this? You appear to have multiple dwmacs on
> > your device if the example is anything to go by, how come you don't need
> > to access different portions of this depending on which dwmac instance
> > you are?
> On our platform, a system register is required to specify the TX/RX clock
> path delay control, switch modes between RMII and RGMII, and configure ot=
her
> related settings.
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  reset-names:
> > > +    items:
> > > +      - const: stmmaceth
> > > +
> > > +  mac-id:
> > > +    maxItems: 1
> > > +    description:
> > > +      The interface of MAC.
> > A vendor prefix is required for custom properties, but I don't think you
> > need this and actually it is a bandaid for some other information you're
> > missing. Probably related to your nuvoton,sys property only being a
> > phandle with no arguments.
> This property will be removed.

I'm almost certain you can't just remove this property, because you need
it to tell which portion of the GCR is applicable to the dwmac instance
in question. Instead, you need to ad an argument to your phandle. The
starfive dwmac binding/driver has an example of what you can do.

--yB3ZUxT4SMqLRowR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyz0QgAKCRB4tDGHoIJi
0lP1AP97tmKwKt+UudFKraxNYO3cXznEar2+8w3QtbqK/bnqlwD9H1utLpv2RnF0
zj3DwLQ3RnwTIwDLuyIHy2v/2FNbawI=
=i7sq
-----END PGP SIGNATURE-----

--yB3ZUxT4SMqLRowR--
