Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4A95BB40
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2024 18:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqScq2nZNz30WS
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 02:01:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724342503;
	cv=none; b=BJ7OeEAtpkAUwx/OMxhRuoyElvw0gJ7O3vFk0NMfGxtDIM1/xVTSvgq8+W9J01mAjk/Uz7YT1+6UQKdJRLeLWJp687Two1OavFKWicBaPmvJ1EZgyiMb1fVcgdXG5BtHghdj+kgh7MhCfgOIzWwTs2AArY/g8GC7t8BkjknlAm23jmBArso0jZOJuceOpSg0XHUDjwyUDlxq3kYbltLX9ZeGceBZ+TzDlX0CIb6AU7OrK1pvJmqTQUUtelXOwQcbHxqxx1eTCDaPHO2JFprRsqwPPODzXv/KDK2j3iK5O4PTu8l9HxUaH/qRNINlioV906TMICOBq5UE3/IeNRFuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724342503; c=relaxed/relaxed;
	bh=BY7tVZu/eJWX4jiAze7wa466KGT/clrPEDHC4odn/wI=;
	h=X-Greylist:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Tz3/N2aNFzjAGR1T54+jhfRTqq4Pf0n++p6j9svF6MRkjNGmdiYg/zXZLm6L7M+U8sv6aIomoZrqmoTMjWSDvdtEjlY8xzIvSzO6Ozycr70VPHPsmeolb1demjbI5GGweF7KCzsVdwDREMoEUqSRpyOfmbWSjEGSD/hMfDKT3Hbb0wZ5sD53oFgOnhyNjFlc8qX0V9pRjGMHtAKhhOr4tNR/nTDd6uJlsX+neYA0u5eeCPk1uj8Rlhv/1rD5AvdrojbY/5o7DLyrt9MBssl1EgqOuO8TLIq25HU86O8jyujeAeO+3Ddqrmrg8GAV1h3CC2nvaXLKPUzBJJNJfUuc2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qoBqUWbS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qoBqUWbS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 489 seconds by postgrey-1.37 at boromir; Fri, 23 Aug 2024 02:01:43 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqScl4fVRz2xxx;
	Fri, 23 Aug 2024 02:01:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5688A40B0E;
	Thu, 22 Aug 2024 15:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97399C4AF0C;
	Thu, 22 Aug 2024 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724342010;
	bh=y8Ghfe/tRkWEXDuR4Lt66t9U6fIcWdkJxTjW9OqUWss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoBqUWbSPmX9Pg8nA8QQm3Iu2itlnQcAwlPS/64dWFUekUSXYIn4EAlVNBJAMjvQQ
	 wwgFtfoPcrSWsY5VN2Z2qSQh897FGGCpBr853lZfm1deo8Y11o+IMAFUr8NXfTAklp
	 PAILip0H3otcs+udH26gHm1TI7yyKOOIQTdivZ91y7gtzwGciLSg1UTUf3h5gM5q3l
	 OF44LGIWu7JozQ0oyAQO5p0HigHcumInjHcX3o9Se2G8jl6C53YYUN4eCGvmRf8oUS
	 ps/C1psbZXVF/lZsmnv2F4ec26d73JbD91kpGSPL/Vo4itFaM9fMVz0AUu99CYrLPO
	 rtHIcexDSYxMQ==
Date: Thu, 22 Aug 2024 16:53:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: drop redundant multi-master
Message-ID: <20240822-sibling-divinely-be19cb9cc0b0@spud>
References: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vAAMaBzo7gFTFXce"
Content-Disposition: inline
In-Reply-To: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, Rayn Chen <rayn_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--vAAMaBzo7gFTFXce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 03:27:08PM +0200, Krzysztof Kozlowski wrote:
> 'multi-master' property is defined by core i2c-controller schema in
> dtschema package, so binding which references it and has
> unevaluatedProperties:false, does not need to mention it.  It is
> completely redundant here.
>=20
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vAAMaBzo7gFTFXce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsde9QAKCRB4tDGHoIJi
0ushAP9C1yIfxWTQ99m6oo/wi/XM+H4jeZV+tKwrhhhzcmD0WAEAzNs+M49QgnKF
hxJp9x49f0FYIRnNsWDMLxqEEimrWwE=
=CiH4
-----END PGP SIGNATURE-----

--vAAMaBzo7gFTFXce--
