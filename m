Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFCA67BF8
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 19:33:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHL7s0C8sz3c9b
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 05:33:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742322805;
	cv=none; b=ggIMf8jFIL4/L0dTxNHtcB1jqVi9QK89+N/PP400IAU0iTg8U0Us/P7/yKw3rVjmSWAxIKaLaJ7t9MUhO5yMA+3/92fQwgHX5a/LEtntCI5LIkW9mTV9cml4qKCKNFHvT4Mq+1MMWeWRGdXDkmafgAmkdzo04wrJ2hZLdJPY6bK5OcP8kFGAn/MB7+GfR+lO72daqTiNaTgUcXVF6O7w+LTEIsRCSnmPHjlGziWElbaCGOyXjHL1mLiyG5hGO/aAAhCgpoT972EjAcQ8UjWnu0nKs40Y2iXhl5zKevJZZb0iYqt3c6/irb47iPvr82ommnfGg8uZJt5ko5ikei8FQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742322805; c=relaxed/relaxed;
	bh=iguVmCV3+e0iktCJiQX2Pt4HvULaD7BI01tc98Ba7EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhE+GxSZEUkUpX7ePoJAExs6j9y7fs1gQCpUfzzFMR9fQoosXQGopRSwtN9w2JYMMpMS70F+HoCCX/AU2uT8vDeet6x55Oy3H6KoGW2knFeJryNFAFKPKnpAWkT7Uhf7kLoWU7ou6N9HgHtaOcS45p/mvH2rQO/7EBe2pPZhl1t4qoh+6AviD4uisAVl/YqDqTMxtgWAewwDpX7oUFxK3dZyGH4B1lafsECKbrlGNkHLT6YADr4PfkoufJvowPPkT+46P5g5bsBo6eKOWbCAZxeyjFUJ6ENS6fF1gpUPcM25mgHEF+69YgbKis1R6flJ4yl8byvuIg15SE20LH2uPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RMxWdN2A; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=RMxWdN2A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHL7m6YMFz2yft;
	Wed, 19 Mar 2025 05:33:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iguVmCV3+e0iktCJiQX2Pt4HvULaD7BI01tc98Ba7EQ=; b=RMxWdN2A+yps4F+Jz/2Bu2jjSe
	RnJciZfoyRh9njrYyXR+wAngSHAUdkwjGUYjMb8VDdkOK1sTv1ICcsje0dJ4iLwyUuSsARc7HdRZz
	vLDyrvv6iYeLoo+VI1G/ZCA8OinwMWRoLt3Db7UhfZtUmmPco8jDdOjHYvOXB5oTT7PQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tubkT-006IOL-Rn; Tue, 18 Mar 2025 19:33:09 +0100
Date: Tue, 18 Mar 2025 19:33:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add Initial device tree for AMD
 Onyx Platform
Message-ID: <472a4f78-24f4-4bfd-bf99-8b1194bfe8f0@lunn.ch>
References: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318174730.1921983-2-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318174730.1921983-2-Rajaganesh.Rathinasabapathi@amd.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, jothayot@amd.com, robh+dt@kernel.org, joel@jms.id.au, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";

Still broken. And it appears you are just ignoring my comments.

Sorry, but:

NACK

There is a discussion here:

https://lore.kernel.org/lkml/20250317025922.1526937-1-jacky_chou@aspeedtech.com/

There is also IBM in a similar situation to you:

https://lore.kernel.org/linux-arm-kernel/20250108163640.1374680-6-ninad@linux.ibm.com/

and NVIDIA

https://lore.kernel.org/lkml/20250312045802.4115029-1-wthai@nvidia.com/

Could i suggest you, IBM and NVIDIA work together to get Aspeed to fix
this.

	Andrew
