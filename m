Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0595C2A3
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 02:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqhVB1HsPz30V7
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 10:56:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724374604;
	cv=none; b=eqspTlreGbFY7zq50FrMiRVLOZdS1yt2bNzFa3EB9+Ui6iIJCOqQHIkTRqlQHHypzmuf26XrdBMjRME7VO7Hemk47hYGFoZM8SpRTz53WoAkR9kH42RUhlh21O1bIw5urcF7pJNSriUUg3yDVivfovFb/XdN7v8fV8Oc4wvsbCKsSwspefdLmXWhlINdpKWCLu3VY3PMiRlHuYNoYdeqdbLpjlVdmU8YXmQ8Gx2sKG9yTIIw00YI5w3Bpj48+PCyj+oxFROocVkAi5Fq4zsaYZjE+bmiDBFMN6Yub6bddIYoWJCmyXlaRB9zVH5yIBD4+uiMXjgFCuzkQ7zo3YsGew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724374604; c=relaxed/relaxed;
	bh=3VbryCEQHRmCtITw5BkuSNR20+bzJ5aTKdALesfLqas=;
	h=X-Greylist:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XS6rbiH2GdRyG7KqcbzWZFTYSiHtMtfb6a6ZdOtNQqEMNlbK+H8QnKdjoAV8yjeIbaSd0rAPsJASiboh+VmLXoMInBmmBc3lJ5Bc4+lKKskzoXPHO2lsoaheBWVGszCd/QOacqvaXAZps9g1wsgcIEcVsL/vDrqgPQJb5DlWS7sELbR5K/WC/28vihtISSEXqLkLexFvE64IgC6JxybrnlJGdUEqFTrldx5LkUdS6fCUFd2h76Y7dj39vG/vzxS2JInYxtxX12TivN3UEnpniKSho+7YXn6ZqwNnjNwrnOdOCiYszW1oWNWv+KDuZP5e9otR4VWVlKJNwZEFZFQH3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mCmBcH1v; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mCmBcH1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 525 seconds by postgrey-1.37 at boromir; Fri, 23 Aug 2024 10:56:44 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqhV40pSvz2xdV;
	Fri, 23 Aug 2024 10:56:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 914ABA40279;
	Fri, 23 Aug 2024 00:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB73C32782;
	Fri, 23 Aug 2024 00:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724374075;
	bh=VZ0yrCMU8UoapiytS23+yPHDyWkbRQqGwZT5OWmEkBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCmBcH1v9SaBPuwfRmqYfhcJwCTkIiU2rpi4k1FdUUshqMzdri0EiNWcA28//YTsa
	 YGnsv4ZuqUF8FPxyF83urVHX+wygjFQlMy9TZlxOqUWSx3YFDdw5X5/mP8QKSwL/OS
	 l5sadtMQXnziLyxaH3WSY1sq8GAQsr3oMn8KVFIVznjzlzLshWysY47C1t+eGeGnhk
	 C6VjJGHjMdOl3lBSa2P+rSjKbh28WH5+3HhjKyWtvpW9TVrOSR1geXfdUlq03/v6tO
	 PEHSaVjgkYnUMwShVT5k9lW3Wz+R/ktf/+YLa0HgCzVTB/d1QbVjmH+zFuc/w4qBHx
	 7gXiNqdFBN6GA==
Date: Fri, 23 Aug 2024 02:47:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: drop redundant multi-master
Message-ID: <htpetam5ykc622qcc5xrnl45d2qqniuucqf62ogoqq4esqnkvx@36lblj4ptzib>
References: <20240822132708.51884-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, Rayn Chen <rayn_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Thu, Aug 22, 2024 at 03:27:08PM GMT, Krzysztof Kozlowski wrote:
> 'multi-master' property is defined by core i2c-controller schema in
> dtschema package, so binding which references it and has
> unevaluatedProperties:false, does not need to mention it.  It is
> completely redundant here.
> 
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for taking care of this! Merged to i2c/i2c-host.

Andi
