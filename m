Return-Path: <openbmc+bounces-1206-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402ADD220CC
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 02:41:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds5LY1V2gz2xrC;
	Thu, 15 Jan 2026 12:41:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768441301;
	cv=none; b=F5GSDD02bGw67WiSPl91gVnHWe3uyfGQ02eRQiAiDDKo0VdLphWpi04gezyA5m/fuho0whcv19dqguetECDQ9w6c8OVE/+foOM7fgHIdVE6unQfWXlvG/M+3dmNdmwEiNch4m2GTJd9oXqO9sYzWcvNmWdYRNRTqOD2/KyzgzxP4+bCZ93PpE26vqLf/OVVQTxj7l2bJ3RLKZg6GxN2tw/RmzOON8H58x0beh+fa8fcS7uYGhpLpRZiPCq7WCRhtxXCHGarq691ZPZsx74VUo7qYaO5e946BtYAkGnftQJZkEubXAAnNMJSgGKEcmu7SYmVPb/6bQyQ20Ua+X+kpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768441301; c=relaxed/relaxed;
	bh=YvL196Y8Jf6UpyplUKqHRSkjNlU+qv/HoPgPsGaW3/U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BKfh0NDgu84tf4Ep37S5/oF2vopkUFFd54PA0iNc+lIad8POOTcXIj5IS7f6R0t28eGo9AJf1QVhI1BXSC6YDbfjDgtlJQWX/r+COFOnDvEOY0h3ZjV/fQjeQ1A9Klvdbek9IJMkrqtFUSwgbSANBQWany40/SJeAkxcOYmUOigwj9iSB2mSCjCXQ2HtDDsWA4BCCy00yPZfVIjln8caiTYGRThNk2LFi3xsJRBGbB5+dqVafQnjlQj/YBZrRBTl9rHUqKR+Yw1w0rVzBpCfQkdYIycout4j5+FM2EvVpJYVm6VVjE8hw2OXnnvZLSHWPwQ7VAeT6Y4u7U+B3bPAig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=i9X1/Q4u; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=i9X1/Q4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds5LX2lv5z2xHW;
	Thu, 15 Jan 2026 12:41:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768441299;
	bh=YvL196Y8Jf6UpyplUKqHRSkjNlU+qv/HoPgPsGaW3/U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=i9X1/Q4uIVX6nV7K73FQ4EyscmGIdjxu1kCH754NihRYkeb7dOwpfGrIDJ1OGo8Nu
	 olTR17Xtj1um35SV+M3fPOmZpV7qMGjPYxzNQmxIjMelob3kXWx6fdop7BCdE4FdJT
	 YTllNZy8ElszhgX+fwMlcXV9ihLywCpSZy5NDQEKiwwzS+sl+H1A9Bh/muszYezeUp
	 3/qBPsAHAj1i1rVq9QOZ3AbKsBYHzBnqEuuobRpD3SaxLUZx/oIlU5MDa5I5FUU5X7
	 YaLzNnvSnX9MfCcVaeGL7AieKlSkWPSvoKav3xITpDeHyO4lU1UBw2qcBGbJdUrSKw
	 s1oG7FNxfJo9Q==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D96D16472A;
	Thu, 15 Jan 2026 09:41:35 +0800 (AWST)
Message-ID: <88ad862c8d68853eddfd17c7588cad65b3e104f9.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/11] pinctrl: aspeed: Cleanup header includes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus
 Walleij	 <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, Emil Renner
 Berthing	 <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Chen
 Wang	 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
 <Shyam-sundar.S-k@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Thierry Reding
	 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Heiko
 Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Thu, 15 Jan 2026 12:11:35 +1030
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
References: 
	<20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
	 <20260114-pinctrl-cleanup-guard-v1-1-a14572685cd3@oss.qualcomm.com>
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

On Wed, 2026-01-14 at 16:30 +0100, Krzysztof Kozlowski wrote:
> Remove unused includes (no mutexes, string functions, no OF functions)
> and bring directly used mod_devicetable.h (previously pulled via of.h).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c | 4 +---
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c | 3 +--
> =C2=A0drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 5 +----
> =C2=A03 files changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

