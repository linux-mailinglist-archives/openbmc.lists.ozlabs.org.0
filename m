Return-Path: <openbmc+bounces-68-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA443AC5E69
	for <lists+openbmc@lfdr.de>; Wed, 28 May 2025 02:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6W3B644nz2xGv;
	Wed, 28 May 2025 10:44:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748393046;
	cv=none; b=Yd8xrQNmjdrJQOrHGgcabrcI08cJDSQXZ3nG/qNbBfbXqt1jy+v7gcDFitY18YrFxz0cIES2sbbVjY+36NXSpQ6Vavl2AfTVm0pBy9oEBfWxe85+T03O1cZ+xqi6pNb/O2GN7YuT3HsuGXCgdCD5o8G2rmYdm3tdK7A3S2tiNtr7+s7Ye3Nw3aI9DretPxv0vGC93YlLAu0M1HiM8qkhr/tHlO6azlURvpy06HgoQIedka5hqO+2BR6kyRY+oKFtGzRSymn+z3hxQGAD3v3/3tKjTjEbeFUvPr45loJamu4mg60Tl8sIdtsQZ7xBhR1PzUOn4SIUZ/5Tusb856/WKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748393046; c=relaxed/relaxed;
	bh=bW4crBIy9PqA9JTflIEcujZLjdIxJW8V1rpT69gqPkM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jkzOKNkIjYhhjEXOAWMl2xYgoPP9v4YmxqXYOFy4mWuQpBeFORFpSf9aUVXriHJIRLqMTS6Lf8aQkYyQxodosgHvh5nI6R0RlMkoLz8DUEjNem76+fqMxZA5kR61EqpagFSya1Ht2hG9U4g7AZ+84vipBDSyhReKqpUnZn3BsN6g/uaDnNQCjbJz5Hl/fthyEkOB6kJvtKlqZ4IAevNvRuhKTkF4evDQeA3degAJpyu4YbxUBvDTYic49EyAumEEIdnGVGOQ19R1SGJdvgLIbSvyiQPLB+nDmiSiy+69Hm/wwPDUVjqplQ+QwK6buAeC66A842VjfMhpo6MDme/A5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aDrfu7Ua; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aDrfu7Ua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6W391RPQz2xGF;
	Wed, 28 May 2025 10:44:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1748393043;
	bh=bW4crBIy9PqA9JTflIEcujZLjdIxJW8V1rpT69gqPkM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aDrfu7UaYHEsGM5716KG0K+1v8ehAR+fHjDkTlTL9OlVwzHZqwZoUuqC8qfIs766z
	 MBeP9oD7moryEudsoNWE4xMLYoa2TUmleQY0TtBxqcjlkS4tykuSS83O7fFUWZLxmj
	 qLitCvUfZCcEvqpahC14pyyJs0TkKvdEw4vKDc8djXf+lRm7xb/w4zDLqDDYzCxIdO
	 V9t0qvSktbdHf5lK67zwCYoL0Jar/hESdviRfPQZ/1X2HbkKJnnR6kLhLn9UyoEdXP
	 I3ZjXhu/cDF2CeIfwTjbTOFWPlTI3aLJ/gb+eh2N4dNSqbvPtLjKg+nKI8lMcO+T3c
	 geXWB+/rlA9MA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9BE6C832CD;
	Wed, 28 May 2025 08:44:00 +0800 (AWST)
Message-ID: <753cd65ebf659972c8a33e5f8e579b9fa8738682.camel@codeconstruct.com.au>
Subject: Re: [PATCH 18/34] mmc: sdhci-of-aspeed: Drop the use of
 sdhci_pltfm_free()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>,  Huacai Chen <chenhuacai@loongson.cn>, Ulf
 Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, linux-mmc@vger.kernel.org, Joel
 Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Date: Wed, 28 May 2025 10:13:59 +0930
In-Reply-To: <dfc7e01a6134e421ae3aa8da3221f67d59706d0d.1747792905.git.zhoubinbin@loongson.cn>
References: <cover.1747792905.git.zhoubinbin@loongson.cn>
	 <dfc7e01a6134e421ae3aa8da3221f67d59706d0d.1747792905.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mon, 2025-05-26 at 14:06 +0800, Binbin Zhou wrote:
> Since the devm_mmc_alloc_host() helper is already in
> use,=C2=A0

This doesn't appear to be true? aspeed_sdhci_probe() calls
sdhci_pltfm_init(), and following that through eventually we call
mmc_alloc_host() (the non-devm_ variant).

That said, there are some error paths in aspeed_sdhci_probe() where we
leak the object. Improving the code would be helpful, but my
understanding is this patch isn't right.

Andrew

