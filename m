Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57358A6B7C0
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 10:41:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJyBF4XGKz3cBx
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 20:41:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742550066;
	cv=none; b=D9FpMefM16wLmWvuG0G9z5J0M398Sl53M83+zZNIUTXcF6en+kib7TPEq9SMyRqAGnTu6Jwqgi9JKaTSEEycFpVlAfAmlE2qo/bCeYEN2fUUx3fimx5w8U9IV+ZjytAIyjd/BSc6YdBChVXeeDWkhpRwnmsINX4P3s3Qcs+8QXXgFy3A05HuYVI/Kbzsg7LpXW8/KRv0Ddv3pKGZ/SSTS4wGF5uAzorWRLm/AxQ3kceT684KObwUMkraOYX3eFJJKUjq2995wXti0pxd3135rcLDtk5iX3+V8H85PLr3u3Kgt6WpwM0zxMereEUvpCtF0jCtIFnofqBzff3dofrVxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742550066; c=relaxed/relaxed;
	bh=85OFlzg3PfxyGmsu7FM6wtJz//OB1PuqzKjev30hWek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqET+Py6NCY186zCiQ/Zg6dzCn/ljx6/SDUtW/E2D1pmmv9bXAOI3q+i1xQbLOD+z+BgJZJV7B5tTezYjxTvKg3t2EUlDCkca5/A8s2zdcWS50gHSE8WTw8dO94DPs6KNh+BFw7MiVAPOUQkjiBfSIa4bL1iPUMc7hVU3Lkb7Y+VEFn+2SpxoXh+RnDLoXGQFjrZaM+34J0sXi8qiVgiLg0vpHr2in0HU3Amh8DLf+VaJRsRIWXmmfStgAQKvUEYHLHdPJEckfw/AFdf5kIfOOEuKbjQ5dptnaZJiacIJ9BvBoBnBQqAo3yDU7UR4i0/bLOnoVUNxX5cMo8idRhWyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KWekec6k; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KWekec6k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJyB61sblz2yft;
	Fri, 21 Mar 2025 20:41:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14431A457AB;
	Fri, 21 Mar 2025 09:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77739C4CEE3;
	Fri, 21 Mar 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742550059;
	bh=ZUR3lzcRBOLhjpUcQQNzMmdrN44+Szn9WQ+beag+iII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWekec6kxiYnlS7QZErXiNsPc/l2TByldwfMbfk5qxHUAVgfeyqbcy/No4TD6IzpW
	 RPKF5LBKYJsHslyHY0Bzz4grHOOD50zPUyM/uSddpo615o0g4GUAgkenCW6q3wpPDk
	 UAzZvSOJkj/s+iN8D8GT1SDzw4pZ6kzp855K5UF8OheTgbsMsmAZu0CHcBmV7JC15m
	 Kq7RadEydjN8AudHG/NHMC1n72vg/6XWa3vTpVB7e713qzCx7q5nsqiGHRwRbQ3AA2
	 6XYde8EJUS3Frl5/iEzVLcDKK8L94ffbnoigiT7PkTqMhfyQH4HD5JjNaWQaA0r23L
	 qbDlQ3Jfx7O9g==
Date: Fri, 21 Mar 2025 10:40:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Willie Thai <wthai@nvidia.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL
 BMC
Message-ID: <20250321-romantic-gentle-octopus-4aacd4@krzk-bin>
References: <20250320164633.101331-1-wthai@nvidia.com>
 <20250320164633.101331-3-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250320164633.101331-3-wthai@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, tony.luck@intel.com, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, kees@kernel.org, openbmc@lists.ozlabs.org, leohu@nvidia.com, linux-kernel@vger.kernel.org, dkodihalli@nvidia.com, gpiccoli@igalia.com, Mars Yang <maryang@nvidia.com>, joel@jms.id.au, tingkaic@nvidia.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 20, 2025 at 04:46:33PM +0000, Willie Thai wrote:
> This patch adds a binding for GB200NVL BMC.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> The GB200NVL BMC is an Aspeed Ast2600 based BMC for Nvidia Blackwell GB200NVL platform.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Usually this is just one line. Commit msgs should be concise. "Add
binding for foo bar, an baz based board for making frubies".

Best regards,
Krzysztof

