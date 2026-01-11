Return-Path: <openbmc+bounces-1146-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FFD0E9A7
	for <lists+openbmc@lfdr.de>; Sun, 11 Jan 2026 11:38:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dpsRT2wyJz2xrC;
	Sun, 11 Jan 2026 21:38:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768127893;
	cv=none; b=Snkp17KLVvgZXfg1njt1pJA2qlW6HvL/+9/DgnpjPE4hYq56S1el5SgoJ4V5R7O8w7Qgwu34MflSmslWGo0Zvr3LBNN8qCZ6jAqAS0mC7Izd9fIvHU54Chbvf7tLIhb3lqetK3o6Q2AA1poXWV6oEU8+RW8JvI/WIlagGRD95EkqzTlE5iDfISxrlJIN5gU4U6pq4Pn7yZhwyDkfjSNUrl9yu2chsYc0FYNjAhgvTlbbWCqvta7ezytBm/O+luZjWmtdRz/3Nml49bSRkK6sq7JOeHDGU4C4Fq6UrYVZhZFG2kLcW2yYeeo7jYxfTRd6v76qstsz1EbT0y7bs6bWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768127893; c=relaxed/relaxed;
	bh=SVzUZKOnYfE9oyVG0Mch+C01xy4EbMA3CVd3naZWzg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdL4kONQx8EBMVIf+gsdz5jgLBjcPfLfAV7GiOPCPbGNSomLvQzxMy6c/YF6j0qnbeYTLNZsxJADI5PaBbYW1XMD8VUBNZnaZZZKCygtU0vCvVBarz6O25fxWmlAJ8wYljg9MD8UVu3u3zlyghbLWyqI9iXs+qZ9EP/r2UkT+kt1fIa7+x9Hnd4YkUKN00yimSHJOfI86VuBmFEDwyiCPrxkuanB26WICQOyDUbRqA1DMSbIch4c/uQrRuP2uyCMBmoJYAWRGz6YO+/B2qkXrl7ejQCbs/NFS01De3ucdNlAFly1E9qp61ovcGu2g/lpIuyPNUZ8hw4oejK10e/QSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xzq9hh3M; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xzq9hh3M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dpsRS4ltMz2xdY
	for <openbmc@lists.ozlabs.org>; Sun, 11 Jan 2026 21:38:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E185460122;
	Sun, 11 Jan 2026 10:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1642FC19423;
	Sun, 11 Jan 2026 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768127859;
	bh=9UpBDNHe5jcoYRtrv4gn8uXXwDp4yiBsR/f8enh8Hyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xzq9hh3MT9GZEifu4fhQWEdPRgrFYoGfUw/Mq8y6aLgmNrR2+0GaLHljvBgfM8oJR
	 9jhngsGNLPJRNF4O6ih3LAGfUT8aU2xTusklouJdDYjWG7BtghzqGA49HJ0Ry3m+e5
	 pkP2iGldANmKazxyiE2e7rCOeXUFx9JAFKiEPJbwwi8LISnBFe1IzGHb/pT3cx66AB
	 cfj+Bst1f7ujbj0Li/YO7hgNbiNpGNfF0g4cjHd5L8UtX2EYvzRDyN0WN9qF2jbVN5
	 B3eHxP1EL81ClisWyH7VbgzGaIgc3d0rxBT8p6LZhzqSDdtQeUFm3gheMUSuUDKuna
	 9P0ihrFiF3kqg==
Date: Sun, 11 Jan 2026 11:37:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY
Message-ID: <20260111-camouflaged-shiny-wrasse-796dbd@quoll>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
 <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 09, 2026 at 05:43:29PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC host controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---

You did not bother to test your code...

Best regards,
Krzysztof


