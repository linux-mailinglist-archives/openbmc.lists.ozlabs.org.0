Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD26C98404E
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2024 10:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCXqJ55m5z2yZ1
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2024 18:20:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727166024;
	cv=none; b=TDdCLEtgY9JvuvPcpkc3MIDY1sL7/UlihIabQlYx7L55Ahb53rc9mzoQzzwCBkEyrpMABCwMwekyeu3I2W2XtCZttNvexdKyWBzLvrlDUAjWN9bQze6aVmMgLH7p2Lz4ZzZul0eoxV8nkcZE99+AR3EkZJ38H+joKHLl/PLvjj2YpmHD9OD1OBU0ts8CHxQ7GA923PDJTPz20wLvqA3YlDs4s7mPxU/Uz7R1pkCtiYKf56kQ1dOgn3o4z+gXVhMNyj9OT9QnB0QLrgf8ZEJj0+Iq1uRm62sJuLC024vtwtZlAdbzGWAIPhHCFkDbvSgX8LY7Xhe//FUTpf/HF/qulA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727166024; c=relaxed/relaxed;
	bh=/o4tq8GeAOgaegwo22vFwkM2pGqReKxFBgBPuAuwIho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WByMBtuWGuie1MAgQsFfSr6L/gyC4c/RAPpyFHHjJsQMogHhDBtKuol5DTzmBvrwf1Sgjnbgciehj4997thz+/Uy6K/M4lT22SXxeHFAEp9oqEDqi7ut6QvdTupjl6wqVrmd+jrnTC0rI1M0qpBDITCn25emM6tUBWUfV70U39H4YXRkw43wpYgeN+qJvipjT2oPcreDBBdnL4AOKWV7/Rnk3BjDQsabh2Y5thX7XpF7Xo0gDWmk2NT8aaEf8zMEz9ulBXD22eKnzyhs5keUsgUC1Mkx6UdcfP5RKcyy2aKEkCAlTlydWY7qFQ0y1HIzWnIf3TfOhMeiKGqe0fsQGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DpjNFQn+; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DpjNFQn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCXqD2Mqcz2yZ1
	for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2024 18:20:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F6F2A435D2;
	Tue, 24 Sep 2024 08:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5357BC4CEC4;
	Tue, 24 Sep 2024 08:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727166020;
	bh=/o4tq8GeAOgaegwo22vFwkM2pGqReKxFBgBPuAuwIho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpjNFQn+uUzAjAh4nIFRsrG+uZe4M8K2GVNT4q56yCaGhQPbSeN2chrsAfRLJijD5
	 TB+NxUN6cQ4j3rgQUaqO/bewcgu5S7aNhSgGYAYBSoeuR9h4ImQTVtzJAONPabzvmP
	 a+qLw15wrQUdw0X+aAB7nqLiWaHLtnObUdfvn8CRkN6NUu7dOjomhdeRcMlRs7tr0m
	 Lm4Q6KHhxI1oqDcPWSpoOwtgKG6xZi81mL5LaLARuS16ZeAn9jP4mhlhNMRK6drqLO
	 RzAGiI9TuFAr/OL6QqEmIBHWAuBpcuScurI4+ph/oVEkEQ04qeNXsWy63hfqQAJBFL
	 Jowgqc2KuFZJg==
Date: Tue, 24 Sep 2024 09:20:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] dt-bindings: trivial-devices: add onnn,adt7462
Message-ID: <20240924-cringe-puma-67798ccadc66@spud>
References: <20240923093800.892949-1-chanh@os.amperecomputing.com>
 <20240923-private-grower-af6a7c1fca09@spud>
 <c536f43a-56f8-4cbf-99a0-fe3b54a42886@amperemail.onmicrosoft.com>
 <56b7aec6-bf8c-4547-bec2-e0df25489f77@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kbruAPx8FvGXJzyx"
Content-Disposition: inline
In-Reply-To: <56b7aec6-bf8c-4547-bec2-e0df25489f77@roeck-us.net>
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
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Peter Yin <peteryin.openbmc@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chanh Nguyen <chanh@amperemail.onmicrosoft.com>, linux-kernel@vger.kernel.org, Thang Nguyen <thang@os.amperecomputing.com>, Noah Wang <noahwang.wang@outlook.com>, devicetree@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kbruAPx8FvGXJzyx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 10:39:20PM -0700, Guenter Roeck wrote:
> On 9/23/24 21:17, Chanh Nguyen wrote:
> > On 24/09/2024 04:23, Conor Dooley wrote:
> > > On Mon, Sep 23, 2024 at 09:38:00AM +0000, Chanh Nguyen wrote:
> > > > The adt7462 supports monitoring and controlling up to
> > > > four PWM Fan drive outputs and eight TACH inputs measures.
> > > > The adt7462 supports reading a single on chip temperature
> > > > sensor and three remote temperature sensors. There are up
> > > > to 13 voltage monitoring inputs.
> > > >=20
> > > > Add device tree bindings for the adt7462 device.
> > > >=20
> > > > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > > > ---
> > > > Change in v2:
> > > > =A0=A0=A0 - Add onnn,adt7462 to the list of trivial devices=A0=A0=
=A0=A0=A0=A0 [Guenter]
> > >=20
> > > Is this really a trivial device? If it monitors and controls fans, how
> > > come those do not need to be represented in the devicetree? How is it
> > > possible to tell the difference between monitoring 1 and 4 fans witho=
ut
> > > the extra detail?
> > >=20
> >=20
> > Hi Conor, Thank you for your comments!
> >=20
> > The chip is old. The driver was added back in 2008.
> >=20
> > Really, this is such an old chip that it would make more sense to just =
leave its driver alone unless there is a problem with it; this is viewpoint=
 from Guenter.
> >=20
> > I'm using the driver and the device tree with only the "compatible" and=
 "reg" properties; now it's being good for me without any extra detail.
> >=20
> > Guenter, Rob, Krzysztof, and I discussed making the decision to add thi=
s device to the list of trivial devices. You can get more information at th=
read https://lore.kernel.org/lkml/20240918220553.GA2216504-robh@kernel.org/=
T/ (Because the commit title changed between v1 and v2, it's so hard for ev=
eryone to find it. Sorry! I missed mentioning the link to pacth v1).
> >=20
> > Guenter, who supported the driver development before, he suggested me a=
dd this device to the list of trivial devices.
> >=20
>=20
> Historically it was ok to add an entry into trivial devices and extending
> it later if/when needed. That was still widely done at least until very
> recently. Maybe that changed recently. If so, sorry for bringing up the i=
dea.
> I did not envision that this might be a problem.
>=20
> Can you live with no devicetree entry at all for the chip ? That is of
> course less than perfect, but it seems better than trying to design a
> devicetree description for the chip only to never implement it.

Since it sounds like Krzysztof assented to it, I'll just leave it for
him to ack.

--kbruAPx8FvGXJzyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvJ2PwAKCRB4tDGHoIJi
0qlDAP9+P62X1kDzM9QPlANL1YF/JSXwpvKvPEsHZwVg9ZeJzwEAsWev7egfyb/C
zr3uxdKQgJZ/Okt35MKmzZM+eHBk2QY=
=4L8j
-----END PGP SIGNATURE-----

--kbruAPx8FvGXJzyx--
