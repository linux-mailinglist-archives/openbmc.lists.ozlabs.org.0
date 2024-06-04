Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D338FBC84
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 21:28:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYJ8h9+r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv0xn5n2Jz3cfn
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 05:28:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYJ8h9+r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv0xD1p6pz3cYl;
	Wed,  5 Jun 2024 05:28:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0913614CC;
	Tue,  4 Jun 2024 19:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569CC4AF08;
	Tue,  4 Jun 2024 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717529277;
	bh=d9Fe7tsdBxmabskw4jQSMgO/96nul7G9e2ipoJZ2Z14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYJ8h9+r7dRuZzMFMmZpu4AU+p1FyntdgM90/jCxP0PokkSTI9DkTdIokvmc+7S0U
	 YteB3uCDBc3JbeZfi0SZVZeoapQlFXKk5TXoWKgiTu3pQBpRbMZndp+bw/HITpow3n
	 ePfhCYnfOeu//6dy38b/K12uGRuACssydB6DhHxzkYUV6v32SZL4gzBAtaYGyzZ7qQ
	 nbBs7InR1Y8WTz/PG9I6kthenMC5gDgX847nkNdtsg4ZsvXxvmQaFdt//04aLYcItI
	 OxJS0cFdV+GYcdxgQnyjTtAUUbdBJeWj5ytmFSLZdToaBOFaBgCu4YuvoheCsv11Kz
	 nmbMjkuR7/1Dg==
Date: Tue, 4 Jun 2024 14:27:55 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: aspeed: Use block syntax for
 function and groups
Message-ID: <20240604192755.GA1065421-robh@kernel.org>
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 12:32:47PM +0930, Andrew Jeffery wrote:
> The expansion makes the documents a lot longer, but it's easier to
> review changes to functions and groups when we're not having to deal
> with line wrapping.

Do you really expect to be updating this frequently? I would leave it 
as-is, but whatever you decide.

> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---

Acked-by: Rob Herring (Arm) <robh@kernel.org>
