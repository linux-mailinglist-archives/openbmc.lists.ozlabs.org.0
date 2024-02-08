Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96D84EAD2
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 22:49:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZfWN5SAa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TW9cV0djlz3bmQ
	for <lists+openbmc@lfdr.de>; Fri,  9 Feb 2024 08:49:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZfWN5SAa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TW9bv4WFmz30hF;
	Fri,  9 Feb 2024 08:48:59 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-175.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.175])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DA2DA200DB;
	Fri,  9 Feb 2024 05:48:55 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1707428937;
	bh=78OlWKA8etugimLgU7LOFg8JohEzP01qVuc5Gal/3PE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ZfWN5SAaLQLAwMnWoCYSgD6iqURUOgdTNIkdCkqNrx5U5B80lHFXAJIzRb+qn1jc7
	 K3rm2BEm1lTXvVe5zgsXUp3APyUZzLVm4dNJThFG2vOuksDysx5EhSIWcfZ0Ex3nTn
	 m+nm06OKO4Oa7LEInZDnLb0LT/DsdjWDQ+BzMUOsGLS7fKDk4Ps+37g2aQpNBQgD7d
	 RSiGYlsmA257KG7mh9H5TacHKhg3moWEwC/MT7Xwg7ynnMiQOrPxICLzFgXFZCC70s
	 v7kRnz+bQ1yx0A45B0n72yT2dPXPCsK5IsHdmDDciTD1+aSZDxUYLgEXUpkytrgTGK
	 btQfOFzoRcgLw==
Message-ID: <d5d488f2777b34d744d07fbd94f525ae381dca44.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/1] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Supreeth Venkatesh <supvenka@amd.com>, Supreeth Venkatesh
	 <supreeth.venkatesh@amd.com>, joel@jms.id.au, andrew@aj.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, robh+dt@kernel.org
Date: Fri, 09 Feb 2024 08:18:54 +1030
In-Reply-To: <d4fe8b55-a1ea-4ce7-89ac-ce17e8ff4e45@amd.com>
References: <20240110033543.799919-1-supreeth.venkatesh@amd.com>
	 <d4fe8b55-a1ea-4ce7-89ac-ce17e8ff4e45@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-02-08 at 08:57 -0600, Supreeth Venkatesh wrote:
> This patch is pending for a month now.
>=20
> Can DT maintainers please help review this and provide feedback?

Joel's on leave and I'm having to manage some personal concerns as well
as other professional priorities.

I'm trying to find time to address the BMC patch backlog but it really
is a best-effort thing at the moment.

Andrew
