Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB7A675EF
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 15:08:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHDGJ4bd7z30Pn
	for <lists+openbmc@lfdr.de>; Wed, 19 Mar 2025 01:08:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742306917;
	cv=none; b=QKTBk6h87eugtif2Y5Lc6etlgzG2yirYv3OfQwAX6jhn7p6jx6rRlxN/jrfPnxtA/JwxM/V9OFfhVa6W0yZan3A63BnpsaKuqGjJl7yd8ddn/Qty32kUhiH/Unc/mZtyepkNXw92aMmZY8MCzOesaDKSWFHJFpHCkMbUa+II3mrpC2IasWksepR46kYVwgCLbibgGrrQEL1zBhum3e4I8hLAqFwOKI9jQdL0hsQ6rUOjOA+xcPGXE2O9+bsFbFxd+BYOxBeOz+r8Km+ReEOya6ZQvz/lKtk4Qm+EUnVF4WRAdcDnDGfsXvtph8Y0nMu1PLzgKgJSMvuwbMYgHe2V9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742306917; c=relaxed/relaxed;
	bh=6WvnC7tPRCiTGfBn03Ur3Jt4abVexUVYYSSyZJJAuRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSA5W/tmb3BEYX1bacYYOz/hArGXWpvjtb+Kk9oCXr3L1ghlzDQhaFHkDA3DiGP8AqCOHiQ08VWB7tpakacPPeUP+B4mSDFx9jSCLl8CS2Q0pdwlivssMbYZnDt65V4za7aMfRRRL9uXYlxJ/eduwWiXPYn4XepuIx3fVjWckh4ssO4E+TRbEULwfIyKcRSPl51XRkUqnnB0UIZVX3C6BCR4RbZzH4fFS91LS+0aqfGQXGHrno5yE7VyB1W7fFEwtOuBA3SZqPbRxYJfcKzSohhpzpBx1IXInHypVRioBo0T6ayeoXeiLs9S/NhBJZQ3BDwhgtH7ayEGiJs9omYQYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=f3xxU78P; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=f3xxU78P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHDGD39s0z2xjQ;
	Wed, 19 Mar 2025 01:08:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6WvnC7tPRCiTGfBn03Ur3Jt4abVexUVYYSSyZJJAuRc=; b=f3xxU78PYsEzV8e2vE0hjY8cZv
	QKGKQ4yxcn4g3xNicVzFoSWgnFFV1ZoBWr+f9vM5TNqt4pQD2Po6rMn/LPNl7SVnV2FE2uuvFlOpN
	cyDov92u2+PhX35F580TxmzowUuc1mQq4S10h/4A14p6+6NOKebs6wvL+/R0eW9a6K+I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuXcG-006GhC-8b; Tue, 18 Mar 2025 15:08:24 +0100
Date: Tue, 18 Mar 2025 15:08:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Subject: Re: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Message-ID: <fdd969cb-aa2d-4d55-949e-e2631757221e@lunn.ch>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, Supreeth Venkatesh <supreeth.venkatesh@amd.com>, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to insert the 2ns RGMII
delay? Or are you another victim of aspeeds broken MAC/SCU driver?

       Andrew
