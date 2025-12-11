Return-Path: <openbmc+bounces-1009-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1ACB714A
	for <lists+openbmc@lfdr.de>; Thu, 11 Dec 2025 20:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dS3J30mvGz2xPB;
	Fri, 12 Dec 2025 06:56:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765482995;
	cv=none; b=AJBPbKAabaemnGfKlChbO7Ck9QhAMcIJaUPzvem0IgLy08qB+VTEt6SW2NmFFdrC/HnkpYntbKPJ/vZ8mV9f/Ash6mKL6sTEVxn79g85mUz3Da2DvIhe5zbbwWOGnEn8d21fPCKTuPWxHOMYmnyLXDQmyMbu3NtjLe0YIeDuuQoZnMp05BM67tjkzwJq0fVKbasKCAq0QpcB0adLDsxw8D4f7NBB6PIn+HR0v7qwcvHSkJAYfA9MOUJU9enRwnX6RU38mFNIOp/ggURxel52fmlURDyYmuM83jOmAQdQ2hPFIjiipy6QY7X9gfE9WSDzQhRgy1wGmBS9t0L7O2xPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765482995; c=relaxed/relaxed;
	bh=I2GBEjCuNnECgkkR3aifc9R5IejcKFLfE1uJRr+64gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RphCxWKmOQw6ZNVuqQLYPxT5o9T7JB331z70P8fz99SWUbyfuEu1iOeWbOhe5ytsWU+XHMYkonK1VEuDUgO8u0F5BM+ZB38oSHAVFEO9/P/u8MiCj6UxGvuTnLMvWK6v7i10nDJYBQCS4HKz+HQ9OsOxWB5XueNr077ZvFA/X7Gws0H2rH6U8H/UJsEWTA9HZUn2jS6mwsUOmspWqCb+kpKn+dv7JcHj+dE479b6zkXsQm3UQrH/JgJY7s3yWRX+VEHqY2QoYliRsL/vgCkgABovN1P+recxafY18S+dweBy0bx8HT+xNx02HW3NPXvmEiVaJXuksYemECckyKedcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Doq9lqp+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Doq9lqp+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dS3J2220Cz2x9W;
	Fri, 12 Dec 2025 06:56:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F16214401B;
	Thu, 11 Dec 2025 19:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C135C4CEF7;
	Thu, 11 Dec 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765482991;
	bh=HMv7vikpdiyc0tr0TYhhhGH6GWe2x1iyzq1EumBTr7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Doq9lqp+j2BkKC59X5d5xNwaCtkHdKMBqSJU7xd3VUKEqtGRMStY3+hLyCm4cx0PY
	 GLAbUgXK69XtkVMGraP+oCePaYTvpho4LQX16dgzQU1+DO00Nz7RcTjFKFBOuONG85
	 2hR0JZ7ywSzoUAA/FuiUFFdJ3ShigaABCVM40fAqO/QyaSay5gu4EU85LRfFAaa+hX
	 faR5MhuXj9/QnQr/LosBEaKF3bQds37XndtjoLJknc2/MmhaxM4oGTuWXoag+2mIEd
	 Ph46y5A3pEv34txN9cZWx3UGV9trTMC1k0Uzd3PUSZMn/6Svnsr7Ewt9n0lTSQKP1N
	 Bh8xxGiRogr9g==
Date: Thu, 11 Dec 2025 13:56:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-mmc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 09/16] dt-bindings: bus: aspeed: Require syscon for
 AST2600 AHB controller
Message-ID: <176548298699.1799665.1259025609428986424.robh@kernel.org>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
 <20251211-dev-dt-warnings-all-v1-9-21b18b9ada77@codeconstruct.com.au>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-dev-dt-warnings-all-v1-9-21b18b9ada77@codeconstruct.com.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 11 Dec 2025 17:45:51 +0900, Andrew Jeffery wrote:
> The AST2600's ACRY (eliptic curve and RSA crypto engine) requires access
> to configuration exposed by the AHB controller. The devicetree already
> describes the AHB controller node as a syscon, so require this in the
> binding to satisfy the ACRY relationship.
> 
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/bus/aspeed,ast2600-ahbc.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Applied, thanks!


