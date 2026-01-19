Return-Path: <openbmc+bounces-1239-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03747D3AFC2
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 16:57:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvw7y3r92z3bZm;
	Tue, 20 Jan 2026 02:57:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768838238;
	cv=none; b=bpFLG81Px/X2UOTH40YEngubn8FLv0RkQM8IVsQP6txDW0xo+cvi3aUda24nZK367/5EUD/UHDrLokbo9IOm0xmyEXEXi3POV7z9GQN1/bGGNxwOFD/XagmXALnBTW+1hH4V9/Mb7e4KWLat8/TRmd083YQvbcFtlRJvqWI8dBVA4OeBwmOSqU4baQqPK4ocK8V4kLWliQgDtXeDsKX/p6COjWM1vNQfjS3G7NWbfpTMdye5PQMU+rtt9/34hCHerx474zJ0eU+Z0Q/LGKhGGRGYzHKxufY2crs1hWFdurnMwsh3mW3V25MWU2K8CUHPzj+TCvuj8MB6FnBe/gqSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768838238; c=relaxed/relaxed;
	bh=t2bBOzwMAYRPjjO4lNowgGiSlgdU4XZZkvdsScnElFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWERIpk77Zi5znR/vAbRKNorMCK1H8wTDKRBKZR7nRtyUsitDgiAxxRWbstHtokShBGSPdRexjp82JEhtrBnsipECO0+/T9PdT95ziVK0vHcG+jdiVmy8No3GzdKG3JuyU3Mn7ZV7VES0JNySJDL6h+okPH5e4sE5MbFgyAicy13MtZpu948iK1d7B1c58JexESE8jMH2dxUCZoR0yuPtfRrLMb9uNLk1kE4oVdeHy6iUzjqJqcwv8jnMm04i0nXvC+bSK+m3gYTbpw7+ifX5FwZia2jnNB5GTrmBUny7MAJWC4NLlA62XZA5UNDZ2FeMPUwNKaNqp4YQI4zrMSg/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=O8wDb4mr; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=O8wDb4mr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 2073 seconds by postgrey-1.37 at boromir; Tue, 20 Jan 2026 02:57:17 AEDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvw7x3gq8z2yql
	for <openbmc@lists.ozlabs.org>; Tue, 20 Jan 2026 02:57:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t2bBOzwMAYRPjjO4lNowgGiSlgdU4XZZkvdsScnElFg=; b=O8wDb4mrkaMfRoOkguXYrBTU0J
	OesoB9GT+1MQrogutipTMxmJeZBU0K57dc43hHA9LAiPkGpuH13kbBK1T5gKort1JsDxQaJOTclsX
	wL5Ri+OMBYkuFiJJ9o14NQgVIAh7+o2Qk5yuVn1cdTzKZujgjP9nyJMWUycOZxill7VY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhr5C-003WIK-Nn; Mon, 19 Jan 2026 16:22:22 +0100
Date: Mon, 19 Jan 2026 16:22:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
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
In-Reply-To: <20260119073342.3132502-3-a0987203069@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 03:33:40PM +0800, Joey Lu wrote:
> Add GMAC nodes for our MA35D1 development boards:
> two RGMII interfaces for SOM board, and one RGMII
> and one RMII interface for IoT board.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++

I'm somewhat confused with your naming here.

A SoM generally needs a carrier board. So the SoM is described as a
.dtsi file, which the carrier board .dts file can then include.

Where are the PHYs? Sometimes the PHYs are on the SoM, sometimes they
are on the carrier board. If they are not actually on the SoM, the
PHYs should not be listed as part of the SoM.

     Andrew

