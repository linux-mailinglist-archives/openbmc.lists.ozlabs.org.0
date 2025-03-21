Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BC3A6B260
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 01:39:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJk9d4xGQz3c98
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 11:39:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742517582;
	cv=none; b=T3Nh8DqhUFqT08/bM7xALFc7E1njyvkZTXUetdN0X6PDFls2Iw+MzrPzgVP+Typ+GJikT6RlaCkhTQtNNEGX0Dd1aboUG6oT6H88EUzTBnp3Uma2M3WurxfNxvhK2XFdmE4P7+WCCgISevk2NOsICdXZVm6o2DtSY1qIElVn2fC7STMADIp33OwFYZZYieWSh6DPZ1W7J36MgO7cVIskXIAaedQ1l5oToZuyX91eDmCdlfIk25d9MI8doElcS4oW/CguOKbB/h7kAPDKSf8vVk4dNHlajoaj1YowT81so1KfDD0g7NWjKrT2uIdJLss1xN4I4wR+/wYpAysLsrmfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742517582; c=relaxed/relaxed;
	bh=81e5U12yQNl/T/++JQb1aWg02Oq1JzXIwoKQeuPOf/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V//SZ9mUng+is5IYO4GAOVJTXqpgGjv/g7MMUQPq4Y2GH0Nf2pC0PD8cEHfvLpPivatZgLNySS7QdWqzNs1iy7O07W1X7mlyEwWctqwjxpAwq4R8c8q6yH6IjJ2q73wdA/M7pyeg8kj8Ktwhc+mL/1Rm17XzNUnsC8+wtWa087F+eLwVSHj+lH3EjkBTJ4rPyqsTpsaCmzSgDk1jTME/wnS9aqkTM6rzrotG3svGfpm4TI+pf1cYGkWJvnQPEYZTbFwPDFWPHVnBM+HITaQGt14G+qxZnDxPV1C4J3oGQn/W0huUllNUMxsQB609Qimuc6gV0eNj0KsnBfpocuxPnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hNvtqjzo; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hNvtqjzo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJk9P0G7Tz2xd2;
	Fri, 21 Mar 2025 11:39:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742517572;
	bh=81e5U12yQNl/T/++JQb1aWg02Oq1JzXIwoKQeuPOf/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hNvtqjzoDLk8nMsNRAwLiBQBq+A/jaZLOBJz+AKXu7nVybKAhi3bpWyAN3UwvUAb8
	 X7W18/K0L0z19l88HAz/Q+IzcU8f5p+yOmbFKNjjC/Vr6SM/ECKFUy1ENppiVPOAp/
	 ls5fZFHmu4slQdo12PDCxxBwT5rPrsOrlZ17+Ww48dGtZIE59RQ/1bEcHzhclY2HU8
	 524k15wq+Y3mMZNo+dFMqrzObb2BHGo0BTtsJ1wRv4OL3ScntyzPkIbI6NMg+wO5DT
	 PuIlnqy0QducLALaoV3cHepsDSaDVxG96w28MCkSn5/NUiqE6ORZLXIuI0PM9Lhd3U
	 Y+ASm+H464Yfg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B61B17A4E7;
	Fri, 21 Mar 2025 08:39:30 +0800 (AWST)
Message-ID: <158f6e8e6c41250d6b88c5f2b5dc6df5d728222b.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC
 compatible
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Date: Fri, 21 Mar 2025 11:09:29 +1030
In-Reply-To: <174233663954.4094319.18412685456723022993.robh@kernel.org>
References: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
	 <174233663954.4094319.18412685456723022993.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, jothayot@amd.com, robh+dt@kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2025-03-18 at 17:26 -0500, Rob Herring (Arm) wrote:
>=20
> On Tue, 18 Mar 2025 12:47:29 -0500, Rajaganesh Rathinasabapathi wrote:
> > Document new AMD Onyx BMC board compatibles
> >=20
> > Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi=
@amd.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
> =C2=A0 pip3 install dtschema --upgrade
>=20
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm/boot/dts/aspeed/' =
for 20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com:
>=20
...
>=20
> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dtb: mbeeprom@50: $nodename:=
0: 'mbeeprom@50' does not match '^eeprom@[0-9a-f]{1,2}$'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/eeprom/at24.yaml#
> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-onyx.dtb: mbeeprom@50: Unevaluate=
d properties are not allowed ('$nodename' was unexpected)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0from schema $id: http://d=
evicetree.org/schemas/eeprom/at24.yaml#

Rajaganesh: Please fix these warnings before you send v5.

Andrew
