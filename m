Return-Path: <openbmc+bounces-1015-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C433CB7FB4
	for <lists+openbmc@lfdr.de>; Fri, 12 Dec 2025 06:57:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSJd14Y0Vz2yDY;
	Fri, 12 Dec 2025 16:57:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765519029;
	cv=none; b=JdqO8zS3DbTyrsVNgu6W+jctEB8XUy18dBcS5hj2enZqIjNTxwa11lBW3nwSJTTb++iEzEgwhiIGlZ83mVrjsLbH2TQzA8GoP+uYgpFD4DYDxe39xoCk+JAVDCC5CcimL4wAhWoQ+9lc+CENOfLjjbCKwcNdVkDLtMYlgvRwGAaGAkf3AS2bJAMOi+hcu2nvtqPQ0QC8tf0wsOBCnma6Eh1GaiDr7T4c7v4OnLmxETsxTQmMTojTxmxvjBKOYBXQqgWbYJ0swW2ZtTwrNKHgBRrsK8Xl5H4KH+ODDNeNMcOHMRx2qTMtqS24/Z7C4ACUpflel1v9cA/nAFwCZdqkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765519029; c=relaxed/relaxed;
	bh=k3pW4njVf1DUpv0AFx57ijZPSUyXI5jespOKEgn3hvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b7kd4BMCcVuPAXKoBQPljv3RMef3qB+p7Qw3odmi1DZn2//dDOq1Vuc4LX7Zg8JG7TLa6xoWWk80lWg3bHIKSF/WU5kXiPak+nZC55KC6xDNVJBKxfkrL6zrwDfjjE3xra6wY3AzbzKwcNSbDsAj2ILFhWAPof9eo5/75jQAhg1X+2LF4WXYVTikPqc1H/lq2KrjUiBcUn81nlOtDGWh+opTI2AQo9T91hL16CfExZ5RRfBGoYTd+90GypZvDiXQ7LL26i6IcwRO8p6Yb4tftL4bz7OEhJMAaG1rrvj3f6tEWJK7tNOu4o6WLqjWb4RoEBHxhJ5jkXuvFk3DTHTeHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J3PD6WTS; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J3PD6WTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSJd03pHJz2xNk;
	Fri, 12 Dec 2025 16:57:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765519027;
	bh=k3pW4njVf1DUpv0AFx57ijZPSUyXI5jespOKEgn3hvY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=J3PD6WTSf8ekEK5MjBN+upm8g4s4rxm4k5z12zKFqA3ek+bxXzUyS4c8MaMHvGQs0
	 G7DZqoCiA/YiML1XqCti6IxKmPt6L9akwKyHcdyzAGc1Ckfx4So0mSxZA8A9YSXF1r
	 aaCwi6OEDqZaMMEqZ/gaJ33dlBWwqctViCtVIvZnhGXJprkwX6HBbt+rIjxDHfSqYf
	 vxzaBexN5e+/qOhGZpeCU5BBosCif4uiy9AtK8ol5IToyDQb9LqIpjzriOnGpUeomn
	 9VorrpZqA3guKZtNmyXxFRFVnidHO+H91NjRfVkHTcHJlxM+h73KXkc00k8mmTdqQT
	 5zkLVYbcg/ZEw==
Received: from [10.200.3.67] (fs96f9c361.tkyc007.ap.nuro.jp [150.249.195.97])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2935264DF1;
	Fri, 12 Dec 2025 13:57:02 +0800 (AWST)
Message-ID: <b31b9876a981f782ea9481402a4c9041cfef748a.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 16/16] dt-bindings: mfd: Document smp-memram node
 for AST2600 SCU
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: openbmc@lists.ozlabs.org, linux-crypto@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-mmc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, 	devicetree@vger.kernel.org, Linus Walleij
 <linusw@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>
Date: Fri, 12 Dec 2025 14:57:01 +0900
In-Reply-To: <176546866713.1487167.4918701456595372928.robh@kernel.org>
References: 
	<20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-16-21b18b9ada77@codeconstruct.com.au>
	 <176546866713.1487167.4918701456595372928.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-12-11 at 09:57 -0600, Rob Herring (Arm) wrote:
>=20
> On Thu, 11 Dec 2025 17:45:58 +0900, Andrew Jeffery wrote:
> > The platform initialisation code for the AST2600 implements the custom
> > SMP bringup protocol, and searches for the relevant compatible. As a
> > consequence, define the requisite node and the compatible string, which
> > in-turn tidies up the dtb check results.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> > ---
> > =C2=A0.../devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml=C2=A0=C2=A0=
=C2=A0 | 18 ++++++++++++++++++
> > =C2=A01 file changed, 18 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml:140:16: [=
error] string value is redundantly quoted with any quotes (quoted-strings)

Bah, didn't update dt-validate prior to testing the series. Done so now
and have fixed the issue.

Andrew

