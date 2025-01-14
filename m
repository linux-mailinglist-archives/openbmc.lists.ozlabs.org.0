Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D61A11579
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 00:33:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXlnB2bt9z3d9W
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2025 10:33:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736897612;
	cv=none; b=krOeHUKlxGLczWaT14clErJMiJ4elXmL9JQyehoxJQnP3YYJgnoHVTgVa+UHgNOBWHQhDIBFgRhvpvWo6akcGzGoUtcb/JGQglOXnvAmfVrNRGpV3TUBmkhDVE5GuuxJzRD7isCW2FEHJURxpup3jpJpvCPwrPuXJ5Eb26gfkTyxwgt2sDDB6Zn5xDqruyGEwMYp1tvjlF2vydJ9/S1TioYi4TeSlnX1oTMIuDZ13Lc+i7TzpilpWpylDQxbGXBle43cTWao++CXlsv7vhOgsxCnYzg8hczvi/JUI++7S2uFFH+29iz8c1fP29CzEFuxsspq8atRz77RRhnO6fUFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736897612; c=relaxed/relaxed;
	bh=D3quRYlij/JVlyRY3Vp9qj5jsmUNpMGfSpcvzf9xiRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HA5CqFykR8UtmgDes8LS/CRWuHFoe5NW4eQoKaY9f4iwlbOu6wqtWRAxxyJIoZFGbWHGpfuah/cUIBkIUj4ESlWERxUZbsdFzmS8V6JvRpHJMEtw/mcCBA48pbJCrUjCDDPez8JeS5Mm9Q0dXbIyqvQlJJgXU0gSwSFQkoiEO4zaZ0ytLsh+1WQ/Xos5bSPNjOQDHWF84dkNhOUVUgDOVG9Zq8yOiYC54+zVxCcyaGiOz77Si7PsS4j6BQYfqgoZQoJFp5vQ+Xsc0mTl2GueuKgMoQOfO/KLLJDZ/jSRziua6F9jBSgNFuWtR+mfMC9vNBguaJhIwd08NPdV+ftuBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XIX+Pyfh; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XIX+Pyfh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXln73Hfbz30PF
	for <openbmc@lists.ozlabs.org>; Wed, 15 Jan 2025 10:33:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 867AAA419D0;
	Tue, 14 Jan 2025 23:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F86C4CEDD;
	Tue, 14 Jan 2025 23:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736897605;
	bh=X5Ab8rl/ZfcDU+B6erAbyO44V+L5S9IEQcTx/ySbb7Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XIX+PyfhSFtenIE7nWye1MzLtmVbzVNdXg471YrFy60Hm0OUi73bqq5vfORfr2I+j
	 uUxm6GLPc4/zpChx0/5vqhjH5ZqCfVCr6dIQ8effQ43V0wEg4YSb1/0o6mLobInSzF
	 Ul/Qi8Y/lr4Q9DCAicCwZaQPgE9EXcByk6CUw5Wb2WlY3nUQoxNUaCWaSMILeJknXE
	 LgPeRHdq4zBhSqQ1TAL004oClxzOiOPczjEHhjA4jjggK2yDnele2dQ3Sx0ik0eiGF
	 ysQ3QwUTfsS+nTmpjn6I6hqnHfiiv8bcr3pYr15pLSYqTgdBkGvgTcCoqdk4hUCQDw
	 9WqcsEam7uBgg==
Date: Tue, 14 Jan 2025 15:33:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <20250114153323.527d4f63@kernel.org>
In-Reply-To: <20250113055434.3377508-4-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
	<20250113055434.3377508-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jan 2025 13:54:34 +0800 Joey Lu wrote:
> +	regmap_write(bsp_priv->regmap,
> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);

This is a pretty long line and you do it twice, so save the address 
to a temp variable, pls

> +MODULE_LICENSE("GPL v2");

checkpatch insists:

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity") 
-- 
pw-bot: cr
