Return-Path: <openbmc+bounces-335-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B197B02918
	for <lists+openbmc@lfdr.de>; Sat, 12 Jul 2025 05:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfDHv66V7z30WS;
	Sat, 12 Jul 2025 13:16:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:201:9162::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751881254;
	cv=none; b=nOSY3v+cg5LLQnbrdqWrBVewRYajsm+kAxnppTnDL/CB2/ycNvPEJwdei8qbhH9Bfe9qN0t6bbCEHI0L5Lafhlu4LYQ/8RB0Bm4+cm31GRGCO661eaouZYwwwGXd2OEvSpdkQvebMuBKwEDHSYWfCfwBWYDDUmhhZOqlcMRgWP9cDARJRfYwrWNilpZTGsfGKt6j25ovhpCyCt/6YVkNCpQt0TkKJVPUIUDs6WbzccAyxtByWKbWc0NOIF1Zi2L4FgEg1P8tbKjbBD0CQd+syZpNpzrZgEiy8X2jZglOPElJ9/DMdIwTz32oLMq5xe9ll6x0o+c2sY1I1lme+d43Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751881254; c=relaxed/relaxed;
	bh=KQgS0RsQ9ZRIJDpK4tOR2AJTYt2czjyPlYq1I7GxHCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGdemna+Xr70eIjnRBQ8dKaUMI3GVYnLFWK6ZQBFlp06Vu5kqyv3GEHll9/xgO/9RD25g1x0jlDQieedJZfLtnLCYMuGIEHtAomc9K/eGYINg8AgZU35rCt0TrHZQiHgiqcMgJeFfIHG41TtHsuLTzH4GzZ0MFu/CkdkMRott440iEuM2GLogFMN1fnIoG2sQ81eGC2o++02Pg4czlthFC6Vt2DpFcITfoSX2zn9d2BcSMUMDaCFMttOA/cDkTI21pNurLuZXwNsT77tZPrGTOWZxYATSwa3IIu2vMSZ4saGZAUyYPmIlZ6PUwWcMzqHWliWBl4CQS4D8wAup2BB2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Oldu+a0V; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:201:9162::2; helo=bali.collaboradmins.com; envelope-from=angelogioacchino.delregno@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Oldu+a0V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a01:4f8:201:9162::2; helo=bali.collaboradmins.com; envelope-from=angelogioacchino.delregno@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 326 seconds by postgrey-1.37 at boromir; Mon, 07 Jul 2025 19:40:53 AEST
Received: from bali.collaboradmins.com (bali.collaboradmins.com [IPv6:2a01:4f8:201:9162::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbK453Cv5z30Vs
	for <openbmc@lists.ozlabs.org>; Mon,  7 Jul 2025 19:40:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751880922;
	bh=2KBGhRNRyu3KxKn6GIG4TbV6xPdWbM2wn5dZMB9SwMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oldu+a0VgFeTz4ZmDWKL4P8Va82avt4ARmhJlS2yFgTJjOSAayotvoVgOBdyLKQrX
	 I1dtTSwd42mT7lZsbD3fUGE9ZzXFPtJOzhZn1zvpto+sPhUwZLXxhSqrBhv2rhCek5
	 /2++qG08N8VwEHBH5vEJKp4pFpNZeOasVjsgBGiPR6hZIV7hraT1lwaXLWs1w2dkoQ
	 Q+0qQlXcTqD6GjGJqVSoNf3wL2xXb9KF+7t7hpq9yLmcIRMBD/7wOqrpTTKyMEsowE
	 FkeAIcxgQYx5wE9J9a5a9p8ikU+pXvBbtk/V0kK7+84js2Hax5tP1YMfH/GjvrtdDz
	 blzzKR5GBKwEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F59717E1083;
	Mon,  7 Jul 2025 11:35:20 +0200 (CEST)
Message-ID: <ae202795-5194-40a6-8d3d-3a17c85c878d@collabora.com>
Date: Mon, 7 Jul 2025 11:35:18 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/80] hwrng: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Hadar Gat <hadar.gat@arm.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Daniel Golle
 <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Marek Vasut <marex@denx.de>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250704075359.3217036-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Il 04/07/25 09:53, Sakari Ailus ha scritto:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



