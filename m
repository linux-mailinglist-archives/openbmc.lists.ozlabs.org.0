Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698B8191CF
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 21:56:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NRTNu4af;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svps85wdnz3cQH
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 07:56:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NRTNu4af;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvprR6hVtz2ykw;
	Wed, 20 Dec 2023 07:56:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E83AFB81AA4;
	Tue, 19 Dec 2023 20:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3859C433C7;
	Tue, 19 Dec 2023 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703019362;
	bh=bI7eRgyy5+ORKYRMoLdIMmfFqNe12oOLtPUfljOSAyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRTNu4afzfmyVVxHDtB7hzC5xvReRXGZC3oX6gzfNCDxJV9dmI0Qx+K0XKecETC6y
	 9maVdCXBahsp2UOvHWiQgrzHt+9fpBmshww7mD0gGSvxXCWp0Xv5XgCVzUsiX4unQb
	 2jBBsQt7f1jfU+bT93hf+je1VMnkQW0WB9vvhxYHmdvkEQi7T91f4xG3JHbB7j3nMb
	 fJlzoDmOzMJaFsMA7u9vMZC04S37LRZKw9bf+rGzR/YkAYlPbVIuQ67tCmFSCE3yFp
	 xuaoo0xRMCxtVl/p/82ntXh2VNF1URJ6GVGAvtqZiWPC/UOx1qq1dM+8LSEq5dGQbO
	 HP0GDTKTyR+Qg==
Date: Tue, 19 Dec 2023 21:55:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Message-ID: <ZYIDXru48jqk6MH0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andi Shyti <andi.shyti@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
 <20231211102217.2436294-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EnB+dRLs7i+8f3ip"
Content-Disposition: inline
In-Reply-To: <20231211102217.2436294-2-quan@os.amperecomputing.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Brendan Higgins <brendan.higgins@linux.dev>, Joel Stanley <joel@jms.id.au>, Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--EnB+dRLs7i+8f3ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:22:16PM +0700, Quan Nguyen wrote:
> Some masters may drive the transfers with low enough latency between
> the nak/stop phase of the current command and the start/address phase
> of the following command that the interrupts are coalesced by the
> time we process them.
> Handle the stop conditions before processing SLAVE_MATCH to fix the
> complaints that sometimes occur below.
>=20
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled !=3D irq. Expected
> 0x00000086, but was 0x00000084"
>=20
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C dri=
ver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-current, thanks!

I'll wait with patch 2. It seems there are issues to be solved before.


--EnB+dRLs7i+8f3ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWCA14ACgkQFA3kzBSg
KbZyCA//ccM+CCktAPNx6R6VzRFUXc9PKW3sgI5UZ6kuiBU+ntqHpNArrKZRxWFj
owkYvvBdo2tg1YZQWQOAEwdzOz3mEQ2py3faQRIEL08bihsZhgSR43jR/D2d9fpI
tssJghX3Hu3VMt1m0O2PUqX+20IJhYxjuQIVB5VEm7gSvlRoDcl+nqps/xEyICv5
A+Uftt2ZWHRGVgQ+RZB98BSsfFbPIgw64BfG0iKUF2bVqjPBCAMfPs2bZUSoGdxl
I9cSyIzWqKmQ3R2R84S+tJw6xCy1aENHHXAaXHDFLtiXieoZrcBSvs3U2YaBcFeA
VvZNMxPnGETYPsn8Hze1En1wJFimMzxEcpRRu380W+GphZa38oJyfadRh38oh8yf
pYgu9hsL4vAUefT28PvBTC75T9AabggQifj3KqdxAEWfolcsB219lDgsC8qPnOKI
IhU4bbtgGNM2z8pUN8zvFxWx9oJGONR8yibrkWhpSAsM1Wi1JREvxfdhOhlJ+84Y
8j5AhARou0HEOb0mtaIBAT37UWyBX9/HlZatXFeSi4p9AktTpKS9A014Zw5rp3OS
rZci0/iUupGoc7tg9KkbTQ0Oc4zMA9FhGKnWb+gXFw6lZPVs6w9O+EidfBCKG7iq
mgpWX0bhPwIsr7IKgR29OeKEbWiD2Uye033m5dfBTQ8cnaL0yuc=
=mbba
-----END PGP SIGNATURE-----

--EnB+dRLs7i+8f3ip--
