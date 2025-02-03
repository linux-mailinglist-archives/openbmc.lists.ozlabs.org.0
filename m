Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EC3A2665F
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 23:06:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yn0vH5M0Yz3bSr
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 09:06:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738620377;
	cv=none; b=Gx+dFwxHg1/0nLS64Ar+NRKOXdPiEN9/BoVL8wy4PimPfJmEy6CvgF+jP5Mp3atA16Lk5vDznKHuaQz3ua/SUCcRxizKLv8uOQuPizu9Zup6cygoqxXSkTAUsl+j0JUTml597Up/uhdXrVJ/Xly4gOXXJVyDXhwxvA/ojvaTnR428CgIF4QeAsxL04ciNsrm0Ar6Yt971++im8nl09OiQ3BuFhh3oCgAKDIdWf82LADqg8P36q7gUAl9G5N7HQfXzXnIY7Q7KNeTENZKfqN2FbWJfxF0MnJpCoGX6LIjpPSHjY4G14qoToQu2h5Rl6q9OwFVODxOayzsj5sl0HDAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738620377; c=relaxed/relaxed;
	bh=4TG035qf5hgwodwjUHDhhBSDdIdIQUf7YWtjtAtFWOU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INzrOStUOFIEdOE8XbG6NPvMcEZldiltcBBeQw2B1LK5vcB2VFdyMfnJxthejL2SIkdyxU9MqPDzMfc82kwMIxADDzwplJNoQ9UyedZGqjDQB1OGTOI8QsSYxB/Ejb+ZSWINt9oL1v7o8zBCePLCGB1IFqjztkYA3uBDaaGqR/3kMtZ2rvliz+8Nm08WkFBt2L7s8mP0JDlgyXN3cLFyrnkUnAWafV2Pl91JtXIL/9/Px+GdcL/ZQE3z69NO31MMnRi5FZdRwi7sQj7g3EtetIdTKdBxn9HGZl3oSrOt3OW4RWtT+lc/U8bFQKhoM37b4ItXvHiw0w9uBRIXZ3Yedg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DPdXEuIw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DPdXEuIw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yn0vD0rJMz2xBx
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 09:06:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E82685C5D5D;
	Mon,  3 Feb 2025 22:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF91C4CED2;
	Mon,  3 Feb 2025 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620372;
	bh=yzyPuuX2I9mlAd8wRAXfCiQT5z1CNGqnwskd/rkgtMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DPdXEuIw9QSyalNNyNjvv0XnpXXT0IqYas4P/nhGlrVRWsP4nTb8KYoNaYGYSxUsl
	 TeL7MI6sihNDnf2Az3fWZOkz28xm/43DHoKN/1xukR5ZkJ1QYiOGo9UodinK8o9Q4m
	 mHgWYffCmXMrWCzQyxGA4qBgvsA6XA+r+Zsny+GIfc8HqrgIVjTJn5eifr0L66cOmJ
	 dIG0GjgKiFTV7dwqSU+U93IwBfmT9VmtAfw9b6rfQCGPEw2WyzxXxKS5h4Shq5EKFp
	 1BMIih6q+UVPnT/QekmCcjKzgjVwixFXRmZ9WQurhZKSMuEWd4oJhUa8DVATYeVRBs
	 M0XTJmnfkqffg==
Date: Mon, 3 Feb 2025 14:06:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Message-ID: <20250203140610.4a0bbad4@kernel.org>
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon,  3 Feb 2025 13:41:57 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

The tree is open when we say that it's open, you posted this 9 hours
before the announcement:

https://lore.kernel.org/all/20250203065423.03f4cec4@kernel.org/

Sorry but keeping this in the queue would be unfair to people who
follow the rules.
-- 
pw-bot: defer
