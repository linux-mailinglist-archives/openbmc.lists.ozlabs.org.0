Return-Path: <openbmc+bounces-657-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29CB86C34
	for <lists+openbmc@lfdr.de>; Thu, 18 Sep 2025 21:49:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSR746RXXz3bwk;
	Fri, 19 Sep 2025 05:49:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758224992;
	cv=none; b=NV3KFIOqmNjrQ/kiUSDXGFQyJtXPA9NEUtKrbq+9ShtcX6Z/ExBly+EOqo20c/udfvWDZAmIyXVe9oDwhcLJ2cwzmAJSLWCg7xplsXYUf6PT5OGaugP5QpbyenzqMemLJ5Iv/VnBD4vHqEOJjRncvnmCIV97MjFXDvvg1QgOSCp3PQ3nFIysIXn94CP9sEAipfDL3O3nKWkeEP1ub1cJ0EsIW3t5tNyE4EG/hc7kK3Ri7CysIWXxmVNs38xGceu/JHe4L8oodu8io1+BrpWm/exKuoocMfT6IFVeMiu7JG54vp5uZxixDPb9vpte58XqFZ8KbKDI9TOl7MShlqaoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758224992; c=relaxed/relaxed;
	bh=6Yw2LtoonKeaRpAz7eRscCA/M7nqsCKtpLVj9urFJDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRN6fmnaBsv4AXGRxUhvHcq1Q+/5SxFAlfLC6MLjwmtdv1xeTJ1fgrY3AQ0MYNcfcvZzs7ICUFy8mq3dJVhejNTSQFxcsukrhMBlrRpXXBHkoaSjnnjA3BP17QGmjBixrsi0RBBVY0k+nqXE+iWe7rcD62g5F/NywOFv8+p8ExwXJV6K4YqysGc8WfveKQ4iPbOZjx9RFnBKilD7cvTb1XQGU5khGCuFRcvgn8y/v6N87NjDERtY4xxxkCbCUuB0G+7tmcGu52V1RsHvedwyDEz3Nw68AnikNkkfxgAfkjzADFx41BZsd5+M+lX1oWc0Dl3sOovbxhLS9wtyLvvkOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P94PLKB4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P94PLKB4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSR735nJ3z3bvd
	for <openbmc@lists.ozlabs.org>; Fri, 19 Sep 2025 05:49:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A2F0601D5;
	Thu, 18 Sep 2025 19:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F92C4CEE7;
	Thu, 18 Sep 2025 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224988;
	bh=pTzhg4AMOBXhp28Fap5kFnlFiKyPmVT4i1ixXerCjic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P94PLKB4GAgJBrPitzz7l7wZSYFmx7BNeewVu9FvXXi+jEJugm7yvXvEvFah52jui
	 ZBsfRdQV7l5kMc5GkFjdc+gCUrLptZJCL+KqveYUTnavUAMGB4uFZ7sfZ/XC51jakA
	 +6dLkwN8WR2feaemsK5poa5d+KSqbfCDj2nCqPkRUN8Em1zNAd4pE4rm643EsbQjgU
	 XA11+v6tENyVOk0Vh67kPa2uLeUQt0taZW9sxYK/xPOMX7Xer7dJpn+JzklKTpjYbG
	 db+vKiD1uBN5wmRHM1XSzSsTZfVoeVHjxf5LRsjCC0kpTv24PmkHZQlhdN8o7ODK5N
	 BDTLIW1/Dm4Qg==
Date: Thu, 18 Sep 2025 14:49:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>,
	linux-watchdog@vger.kernel.org,
	Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nancy Yuen <yuenn@google.com>, Conor Dooley <conor+dt@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Benjamin Fair <benjaminfair@google.com>
Subject: Re: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT
 schema
Message-ID: <175822498593.2514920.10353699650446603831.robh@kernel.org>
References: <20250909142201.3209482-1-robh@kernel.org>
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
In-Reply-To: <20250909142201.3209482-1-robh@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 09 Sep 2025 09:21:59 -0500, Rob Herring (Arm) wrote:
> Convert the Nuvoton watchdog binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/watchdog/nuvoton,npcm-wdt.txt    | 30 ----------
>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 60 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> 

Applied, thanks!


