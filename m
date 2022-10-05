Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D95F5A5A
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 21:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjPFG0wv4z3blw
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 06:06:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qg03rLPp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Qg03rLPp;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjPDh2s6dz2xHN;
	Thu,  6 Oct 2022 06:06:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E804CB81DE9;
	Wed,  5 Oct 2022 19:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E786DC433D6;
	Wed,  5 Oct 2022 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664996766;
	bh=qZOYdCT1aCe/JZjmiQhjcaPpLA57KvbcqFM3TGd0KYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qg03rLPpbYIdisynjImLpdYkJO/sEMunrsh0dpMnd0msNKM4q0kwSn9oYsEkYyuoX
	 RsSS3sZyqYQJRRR1IrpPXdANdbfCfehXhdmGhrYuQO3LIkr5VNd8jT0d+EjGP+P2Ed
	 GFpOL3ADwr16c/4Ad0PTCYiNsIu6SuZa5PNluanuFkHkI2ZZAhaLL07kMIDcjNhx33
	 VTm/sxf0RICxP5JnMhRPjFNiYtbYWgVVykluIoecv2Dh7WEsFrF37e121miiJId13X
	 QqPVEx5p/xT0sRv3o+iMP4DlRHIUgYvEatArxXRRPQ1TqCcTXJxfHqWsD3NHrxTj20
	 b5B48nBs9QVvQ==
Date: Wed, 5 Oct 2022 21:06:01 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v10 3/3] i2c: aspeed: Assert NAK when slave is busy
Message-ID: <Yz3VmWCqdolKg5sm@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	thang@os.amperecomputing.com
References: <20221004093106.1653317-1-quan@os.amperecomputing.com>
 <20221004093106.1653317-4-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SJMSzPuygRaHqOAa"
Content-Disposition: inline
In-Reply-To: <20221004093106.1653317-4-quan@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, thang@os.amperecomputing.com, linux-aspeed@lists.ozlabs.org, Corey Minyard <minyard@acm.org>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Brendan Higgins <brendan.higgins@linux.dev>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openipmi-developer@lists.sourceforge.net, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--SJMSzPuygRaHqOAa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2022 at 04:31:06PM +0700, Quan Nguyen wrote:
> On I2C_SLAVE_WRITE_REQUESTED event, Slave already ACK'ed on the address
> phase. But as the backend driver is busy and unable to process any
> request from Master, issue RxCmdLast for Slave to auto send NACK on
> next incoming byte.
>=20
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

Applied to for-current, thanks!


--SJMSzPuygRaHqOAa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM91ZkACgkQFA3kzBSg
KbYyDQ/9HuJtmUfec7mVOzYN9yOLKYOWOR5hIQd4A3+vP+K+7P1jObIubesRu2Xn
4OTZ9aEZMgumnmIWX7dGG9seW67U8FDCXjmRTVXZK1SLasgoL+0FRJbzfvLIqLUY
/dThu2R6w4xXOScan+snd98o5xj2gJIiRRUdNH0nNP7CioU5aWdxUykvqjoKYdzK
EVP2nDsPTfLp36vBt2+edcZpJFV2wXtPGhzV7hcypWURm7F7+Phao9vsWphXdPt2
aLZTFMNrjhkzE/M4PK4HVR11630Xan6D318KoJ3QcSWv0EAax+uxChijf03OYctM
sz2oXSExvYUGpdgCiErUX3a/3to4HgJZSq6Gqjy4IuScNnpWV55teyW/rWs4gTK9
yJF3O4Tn2Jq6hBN4WeDs4R79mR3rrAyVSddLzh+9DRQyISYBvVkqyJ5JQ6au+Ps9
HJsIKXC8G/yq7dd9vop+fBSR6743sLE0Sge67fhxrv4h8tr4xZnXvgr5eRgwMJZW
Jc/RDTPQGNZVrmiJYvKnUclNRLEbgnKrtryINWGt5nrRLMLu3gVjJGZxhESQqt8b
C5uVsf1wyyw+K02minkivCVbD0un6hafek5bpILCzjZzLjh1HYoOGY0x6Xcog0uX
tG4tTm/fOBqpHkJy4WbMBjuT5belbMyNwVrZNkNYjMK1WVRjZwc=
=U+bJ
-----END PGP SIGNATURE-----

--SJMSzPuygRaHqOAa--
