Return-Path: <openbmc+bounces-1045-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77ECC6BF9
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 10:14:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWSmM58C3z2yl2;
	Wed, 17 Dec 2025 20:14:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765962867;
	cv=none; b=CLGam6Sp8rwqPYmTnmivOeMN00bwvs5RQPwTYzYrPaiuayK3nhL4/avkS0R3O3HSbOHFUp+tBd1V6Q5ZWuOBmloU0TTUk7bLHRRo+TCFlH7cOrw0KPQTMtT5OIDXqDnT8lfTINk1R7n4bTPn0j8uaZwiSa1oqLWnUrl34qL/GmvhBnHmgpWLZC5mqPSNE0Dus/iC4e7icYOC/uhulNYyP5NaPOSz/oUiSw9Bo3nXR4zXuYB6cG/lRYEyFL1S2Z9EAiCmvfmAYa6LORITR4adpDsZbFv4tbl6XPG5m2UqvjsZ6GFAr+gMrdzCgB+ghFPZRlpWyUuBbUWV8sF5Z7mWqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765962867; c=relaxed/relaxed;
	bh=JOStqQSR6rsRRzQtfmLPqSuxCSF9KU6dK9kO1yon4Hk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YCMcVSLqQ41kfJEjVUcuWrXYYGsy+4cXxc1k/4aQ58ytnazqQPpfGrRa8y+qZCTAJkJkhEtH6QMndjjsnwwv6+E+elljbwVRWyOljuH5gf5FRRXsgbVRw6rCOWOOepPQOM/9e/4+3MiDWu2ksSewB+2G7bxw6LQLckGxGFFgrPx54PSsEbv21XCTPZ6VzU7moBqcfjxZBRZw8+TzKQmkKNATFXr3Dq7RN5TogmUEAGQuAHvEBwu9gm+JI11OHHD+coYafhrDE6ANbO8LspE78p+kvNwY0OttO+YTWSGUmLQqvh94TBcm0Nqqm5XsHoBbi/HdsCGOSKrh1vg568DkvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FS9e6c+I; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FS9e6c+I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWSmL56GDz2yks
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 20:14:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D00736018C;
	Wed, 17 Dec 2025 09:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02206C4CEFB;
	Wed, 17 Dec 2025 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765962863;
	bh=hKrdHuycJPbvEsDj2tZgRwVTxKqNY8M69+vbBKagi80=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FS9e6c+IrZAbun6vDm661URbXTtIgG+IGNakhx2vqs5o7zLiAN09LokHkY+ggbp8G
	 Pp/zPUj4I97R+E9BGgpuQpONRnoEPYPs9WOAFUTAjMGFI/0nDFEcKcTpZ3rQviFRkv
	 /gQaXwOU+pRY32ThXaWPpOwrZNGjqRBhR81f4JdSoHKw6Yuviog5Q15lx8/KRHqS0e
	 6fEtGbJ3bwxrK5tRn4FniK0qhSzQ2G3PR7k4AAH9ao+Cx6OBywPqc48WgkcvOGiZ/S
	 73jRhMx0wqlbyAg0NzZBLy3n66SlKE8dgt/AP/j7IcQ0wlFvNGoYvjR5avHYsqYm19
	 c/wb/4D78Jg6Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20250819131725.86770-4-krzysztof.kozlowski@linaro.org>
References: <20250819131725.86770-3-krzysztof.kozlowski@linaro.org>
 <20250819131725.86770-4-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/2] arm64: dts: nuvoton: npcm845: Minor
 whitespace cleanup
Message-Id: <176596286072.23017.6853937326050297009.b4-ty@kernel.org>
Date: Wed, 17 Dec 2025 10:14:20 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 19 Aug 2025 15:17:27 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[2/2] arm64: dts: nuvoton: npcm845: Minor whitespace cleanup
      https://git.kernel.org/krzk/linux-dt/c/1b06942cda6e83c055e4530fec8227f6e2aba13e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


