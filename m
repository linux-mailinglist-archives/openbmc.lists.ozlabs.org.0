Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E306202D5
	for <lists+openbmc@lfdr.de>; Mon,  7 Nov 2022 23:59:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5ms85klSz3bm9
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 09:59:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X3ce1B0+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X3ce1B0+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5Qgm6fJCz307C
	for <openbmc@lists.ozlabs.org>; Mon,  7 Nov 2022 20:20:36 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 046C7B80E94;
	Mon,  7 Nov 2022 09:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE90C433D6;
	Mon,  7 Nov 2022 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667812831;
	bh=IohQRHyGWeft5/zFcaoSpTCgQ1fp32d/mBaMOehI0iQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3ce1B0+BJ5nN98fzPunOzYTXdhR+jiBqHcXII6WIR/xcqhD+X1MF8Kpsh9f8xuxF
	 JRZc3DNGQY7stIqdNJqut73aXN/1vNFbS8LbdHyahl27S4CDHobC/r3YrMTQPd/0yr
	 WnoV8NTlcnoY/lSpkBvhPwiHA3/vKBG47w1N6KVuVr6u1oZXXfRmJcyfTO7M6qTkuo
	 Cf6OLCPqMuoCT/TZn/iT3N2+kxxodIkvBUo4XOvAeY9Q0pyT0C4rdQA0wb/AGqOxWV
	 H7FrvsjHkYDBrXF74mbTIs40HiyREhCnq/WNgaiJ2Tb9nPw/MG/FWvgfU64Un4T6J+
	 hKDfu+ukG64fA==
Date: Mon, 7 Nov 2022 09:20:26 +0000
From: Lee Jones <lee@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 4/8] dt-bindings: mfd: syscon: Add nuvoton,wpcm450-shm
Message-ID: <Y2jN2s9hfVBNc6Y5@google.com>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
 <20221105185911.1547847-5-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105185911.1547847-5-j.neuschaefer@gmx.net>
X-Mailman-Approved-At: Tue, 08 Nov 2022 09:59:28 +1100
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 05 Nov 2022, Jonathan Neuschäfer wrote:

> The Shared Memory interface (SHM) is a piece of hardware in Nuvoton BMCs
> that allows a host processor (connected via LPC) to access flash and RAM
> that belong to the BMC. The SHM includes a register block accessible from
> the BMC side.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
