Return-Path: <openbmc+bounces-99-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA6DAC7521
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:39:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b76vB6CKxz2yVv;
	Thu, 29 May 2025 10:39:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748479158;
	cv=none; b=KdV0u0s3TKy/XJ+7qFgoidSi1gdNpj/VpHX4YAOSPh0qArvPBBU+Vx0eIdLqeECLS8mFvaD0v6qjfsWRiV4y+xcKFUue/NH6YQFXc03OXV8eoLXGfAQhFbui3nF/WYzDVK4FcLypJOEFvsBzXfGvTl0gdz/uVFfed32EMA+IQIBTWQ6zwIgVPY0jrOBZCtH8R/VExKgLqbuxJhUQRWflKZCIKsgQyofCabzbgXJQ3/Sj51aR8K28xH0/vPY9MEnvzoIuGNURb/Vr4Cj0PQz0FGuomr9qrIVADvcNPvjxqmrdx2zc9J3LLCbeCRa0BraxFO82fD5OBfzx5uCxMSr2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748479158; c=relaxed/relaxed;
	bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XD39bESgKU8bcB019NDpZn70sK60fUZI1EpGd98yU6NZZm7qPUmpudfC7Gu/gqtucTSHrmc1rZVMTDftstCmN5nPaAvExZ8CLhT07ddBoo6zYqbkcUl3E7C5puVTV8aNfcx/NEEy4LOakhtKIIi/8oNCPIA6nder5jP9tnMkCx5r/s/gE1jVOrrG76n14R0FdsEmChFNV4X03xg8CBWsKm9TK2XJ0PO5h4iLlvhfNoep1baNFgYsprWFOrBz9W7k1kyyoExWDEq/5cf9CYNcB8UtIzZTbqVC2okjg3r6bOov+tKLBZVOEI/3yFrf+mj9BOA+wPmTgI9G6lLljx2q8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lhVxSlw1; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=lhVxSlw1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b76v94Fh3z2ySm;
	Thu, 29 May 2025 10:39:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1748479155;
	bh=ny8UrZV+yDW12ChrpSJinfCzQgq9Rotc7NxMtarbZ9w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lhVxSlw1XDyalKK+FYY9gimu5uKVHJnqaeDIt0HjfhB9x7uQWy4SQI/TGIY1Wadbb
	 OBr8B5u5921nStK7WPkz8zc4MGzv2ocjjcgGlJ5cdSLqKRB3yuwNNZFghEaoqXOuCU
	 XGaz4hQH9WJDhXlF8jAqHQVlbLn9J2xItnpaLWAaOSf8uRWGcOYpJzwJ/z8Yza+HV2
	 WSRl6+BECuvxv7ZqlPnd0zrRetMjz80rmuwva0+xhB1ZJ6+J3uQ3VeB2RJYY7yrZD8
	 LjDNdWRt2mnVqiGXOpycjhV17I3sk9KD2OTyKXx3l5mPgsYmNZWnz+Ux5vXkgut4Mj
	 cMaTpUDMxrqLQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DE6426449F;
	Thu, 29 May 2025 08:39:07 +0800 (AWST)
Message-ID: <af3edc0a454eecbe52608e0bc16d82b99be6bad7.camel@codeconstruct.com.au>
Subject: Re: [PATCH 05/17] pinctrl: aspeed: Constify static 'pinctrl_desc'
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>,  Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,  Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal
 <dlemoal@kernel.org>,  Vladimir Zapolskiy <vz@mleia.com>, Michal Simek
 <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, Jianlong
 Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 29 May 2025 10:09:06 +0930
In-Reply-To: <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
	 <20250528-pinctrl-const-desc-v1-5-76fe97899945@linaro.org>
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

On Wed, 2025-05-28 at 12:41 +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

