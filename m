Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CFA00C74
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2025 17:56:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPqTX3J0fz3cBW
	for <lists+openbmc@lfdr.de>; Sat,  4 Jan 2025 03:56:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735923358;
	cv=none; b=kbq4m6wqs34lEk8on9DXwCQd7xA+e2mWIYpL/XeUwImWabWS1s6i+hqItU3WoPT6E9e+jVDTk/sEw4GaH3SAvH6XymBHdqCZiU5p207glkHwI7AW9Uk6WeQglbO5nLujVy6Q2gKvpx5Q1qG4D+A8uo6Q4bIUi8sMayx5UWt7R5Qk8/A5AN7XwtkzKKMXycdrbXDLqcOSRosp8AIqBSp0UH7hZ8TcS5oLnz9U3eQZdEeO2m0J1V9Eo+3B+kI9GhXwXmM83Yv8dM5cqgBuCozhyLm00ONvlVP92OtE9hwybUNpdVWghMbRloVQaburdqXkaA9ZngatP4hvx+rPVpZolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735923358; c=relaxed/relaxed;
	bh=vAIsOpyJqFScR1GaN+xQvUeegAu3JvhgIGeQSy35CLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3hU93LeJfds/ApZP569cOIWGhAtZP5GOj58O6sSvRF7MqDrW4ZUyUUAVNl4bnbBGs4AL8LmyHbpi0nfbz5N1LaC5VUFPD6dA8HawZ1ECoZPzXOiY0Zj+EXxv2wCLLaJ4YoVWIX1pEtFftRrP0wi1fe0f8KRnSz0XY8ru1msEFkcwU3xh4FLG2usNBZ4ttJDbnlmBy+b0PQakD3+w9mrid6jbGE81PLcgiSK4NVWbsFVEU7gktdixhIRYwFj9zUVpappa0VLjCMoRWB30mmIsdKRdRhmigAGyVUfTVd4hyli55VN2j/C8yNBefBG8n+eAiRqO5Dr82GcSzJ99Om2Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rPEHieJG; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rPEHieJG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPqTT0zK3z30VP
	for <openbmc@lists.ozlabs.org>; Sat,  4 Jan 2025 03:55:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 481DAA40FB5;
	Fri,  3 Jan 2025 16:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21A3C4CED6;
	Fri,  3 Jan 2025 16:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735923352;
	bh=UATO23qcVHHPiRn6kDJDY1d+aEUGAULwRtnzqvBFyqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPEHieJGdOEaNX3/Kp2mxHAlEEktfnj+x+ZdjGzUex7p4YLkQ8xbNklRG8FapebDT
	 m9Fo3FfoXXE7hcWKwedvwVLxRh3jrHSO2jdPalbLsXnrJKBWDVwQAACQF1YIMWJGmw
	 k7UcOatr9Nj9OAxJLm9+EK1QPYQ0X8PDPj3QvGxVi5yO5ZZTqscr9xmUwVaescqHqc
	 6LEIwV/Nzo9DjyAHtNad/w4Flvtp2FOzdJFzVwLbf7gE+KnFGVEsAk2tA6qiyratCc
	 ax4Di4ycV3nrsNgNnpS/7RBAX9NS9jWvooEBTO9aWve7B9a/Wver/FjhbzSR9zueuW
	 8bhIOkDVA3G9g==
Date: Fri, 3 Jan 2025 10:55:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH net-next v6 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <173592330334.2414402.4730979254460270593.robh@kernel.org>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103063241.2306312-2-a0987203069@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: richardcochran@gmail.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com, yclu4@nuvoton.com, davem@davemloft.net, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, kuba@kernel.org, schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Fri, 03 Jan 2025 14:32:39 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



