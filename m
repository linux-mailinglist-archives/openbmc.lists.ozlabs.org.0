Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E53A00C10
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2025 17:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPps76gx8z3c9y
	for <lists+openbmc@lfdr.de>; Sat,  4 Jan 2025 03:27:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735921672;
	cv=none; b=d0pRBCRQoTFmNQDBX2fQ8sw/sK5lj09xAuxglUyZvasorNF2kpohSY2V9CszcwwU9OCTVJhc9C2hwpaOUUeH2F1p75fmDBaip6ARCuGXAbdziC8hGL5lwgsIFnPx3mGxEFRdqIPntBojfI1J+OcLyipM50Izhl4ahhQIRQ3P/im1db21c8KSaduiGOfr80dKirmJxSoupfQwiCgCghCIRspqPfT4VXpeP/hS42NA8VAKnHBBCy1ld3XiEcBQrE388HOc9oSFT0xgrmfh1ZXZzXsz8qD1hotBJlOSuqMtJZ1tOvZ+izsgqYla198FsHZ4yQQKvLtJ1o4N+t9aVIS/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735921672; c=relaxed/relaxed;
	bh=bhv0V3Xq90p2Zx9s6tdiOx4Xuhn7HTGGCsvmN7JlFWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUTxgWROsGuzxv1PaeCpNwn1rxPLlAvQo3G2uXZ7Nvw+tXou/3QOVImJp1QQeslIvA2Ffn0JkgcXf+dqp7tBSE3uNBa3SZu/UVtkEEiBPqnRw2VbUmtfOGx1B4qgo6LiEnZL8RwbP9dWFJo54Mg5dhbHcq+k+KUI0Bg7g7j7PGJ5XpsFktkexVYJwJz0cF8HVXHuPnRZSFoo5o2I5dfMmHujnSYUyL4Wqb66UP2ZKEC0ckPmaad19LT23xulG/KQoBB+sjAibPhJ8tBQwjoIJnGVJfM1E6N8h9TN2DvLK2Osh12Ve3EH+weeH9YM6e8IoikRJei3Qkqad7/SFFdRfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bmdwkbJ+; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=bmdwkbJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPps40HLbz30TQ
	for <openbmc@lists.ozlabs.org>; Sat,  4 Jan 2025 03:27:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bhv0V3Xq90p2Zx9s6tdiOx4Xuhn7HTGGCsvmN7JlFWU=; b=bmdwkbJ+2QGX1R+x5t1PluRNym
	uGqLLBBuClRCbtveL23IFNyT307MRDjD40jvDm5eVegSIGVV5yRBtFj6tGnxZ+oPVBlxdUEJabV+5
	ws/8M+DN7ceC6kF88GSteaFNW8V4BJMibPIJK202W4FNlKSxN/mnqdVdfTHqdjmkeM6w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkWN-0015Oq-11; Fri, 03 Jan 2025 17:27:35 +0100
Date: Fri, 3 Jan 2025 17:27:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <4a6cd601-1926-47c9-ad04-9b77c5b8a501@lunn.ch>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103063241.2306312-4-a0987203069@gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 03, 2025 at 02:32:41PM +0800, Joey Lu wrote:
> Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac driver.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
