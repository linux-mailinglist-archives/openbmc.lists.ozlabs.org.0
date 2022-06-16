Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6CC54E0CE
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 14:30:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP1jQ2HR8z3bnn
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 22:30:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KMYhbB4M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KMYhbB4M;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP1hy2c6qz2ywl;
	Thu, 16 Jun 2022 22:30:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3153B6167F;
	Thu, 16 Jun 2022 12:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC804C34114;
	Thu, 16 Jun 2022 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655382604;
	bh=7Znl3b92aroi5ubP2QPuFHtUeB1lmREHe3yTZnLMKio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMYhbB4MGHuQC7Z7rXOsc2FXhm6jOgJDQRBz44Z8dcYeoscvlfWLHXSfXfOu68EQu
	 BoSKD2hDsNQOQK6jicDyREOSlXJrg6n8CXz79Vc7dXdOtFAU2eRbyR5GbKzsyHxzNi
	 t/Zlz3LGMch7uZaMNxdmHjingGmKLyS9M2YxTemFZBuK4E1zwzbxxiYUWHjcf4liR6
	 3A2ifUFhYkleDyAuQaW685HxWajaIcJ1Vaie+QK/2f68+TECqshItMI7aXiwRlgZTd
	 gl8Sm2UnRnBdg2Q3S5rUd0xAEC37GnKbcZdZRiFXXiRPepFplJ/duGh0Argx9ybpb5
	 L3VcbWVU3R6rQ==
Date: Thu, 16 Jun 2022 14:29:57 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <YqsiRW78NAL9rX9S@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-4-quan@os.amperecomputing.com>
 <Yn+9QBoPdH8fMm/m@shikoro>
 <fc422a06-c035-f6e5-231b-74ea6afe8467@os.amperecomputing.com>
 <YqpB8A2uBi+4epHM@shikoro>
 <bf001ece-e981-3a06-53fe-6a8b637d69fe@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XXmZpPF7iOB6E+2/"
Content-Disposition: inline
In-Reply-To: <bf001ece-e981-3a06-53fe-6a8b637d69fe@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--XXmZpPF7iOB6E+2/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Quan,

> On the first occurrence of I2C_SLAVE_WRITE_REQUESTED, the address is alre=
ady
> received with ACK. So if slave return -EBUSY, the NAK will occur on the n=
ext
> Rx byte (on I2C_SLAVE_WRITE_RECEIVED event).

This is exactly why I2C_SLAVE_WRITE_RECEIVED allows for an error code.
=46rom the docs:

=3D=3D=3D

* I2C_SLAVE_WRITE_RECEIVED (mandatory)

  'val': bus driver delivers received byte

  'ret': 0 if the byte should be acked, some errno if the byte should be na=
cked

Another I2C master has sent a byte to us which needs to be set in 'val'. If=
 'ret'
is zero, the bus driver should ack this byte. If 'ret' is an errno, then th=
e byte
should be nacked.

=3D=3D=3D

'ret' is used to ACK/NACK the current byte in 'val'. That's exactly what
you need, or? Does the aspeed driver not support acking the current
byte?


--XXmZpPF7iOB6E+2/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKrIkEACgkQFA3kzBSg
KbasSRAAnlwPKEfQRtRslfq95yxrYXbK6A2BATY1x3Thu50cFfbarxu+e7KMBRtt
GXFMJrp6wZaXio1xyqtc34OmNOFnZXpPUN6jClpYG04GMaJ4kZCC9F2gNmiTEE0y
RrL7ujffpI6IP4TGFP8SRuxHCJiNRN8KdGdGepah5J6r+y3AnMoaOFwmD9ha/ItQ
nhVcPtEPTF/JKbP0st9jr4EIvjLGEi3f+HWuzUwio/MaC/OFRjmzgw9Zwbu0qY1X
YoqHBh9SmbNwPcI/Enp54kjyWScxnWhtY3SEOY7bsdguBLGL4MWlsYGQOIeDxlen
Io/4k5V4Iw5S7oBAcN7YLin2knRiTgyY/IHGlA4G+UbDhH7VbCRVgJ+EE9HsaEHy
iBN/o3YtN6QmmM1DLYrZY3S4JlLFARhNNdCb6Im4+HGMWAP+3t0vBOJEYBH+/0or
v1Xv3/bzlHkniG0EtOKfVWLCmSLpFA97p2T98KPBFx5K3NTV42+G9hao529crYtD
JtLUDJYXKYxs5CdmX4tvpQzBET+GB/NbyzMiFOUJzkydVuOBOpMMRN80GTdbJTOc
9legjiqnXk797FKiB5zhApNH6UQ8HSmsja5Mr+Jhyi5lr52zZCj0bUJD+rP5Nz2c
SlNDdUkpNr6Pxkklt/bLg8R0L/Y75gQ2PWPWjOJSaK6JM3tdArg=
=B2+q
-----END PGP SIGNATURE-----

--XXmZpPF7iOB6E+2/--
