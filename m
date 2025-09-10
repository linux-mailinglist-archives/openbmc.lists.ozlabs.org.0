Return-Path: <openbmc+bounces-627-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4996EB51774
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 14:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMLNH3f8Rz3dBq;
	Wed, 10 Sep 2025 22:58:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757509119;
	cv=none; b=jR4FcLHjRorSGfSpHKoAEQFm3PMDePjmmFbRvSJfO1rDlnojkbGzx3JgxbD03C56+zlZU+UWY6Q5lPQQerU9wvQnznftD5xq/a2C/9P2TO9fwmU999cjmuG/KpMCfZVCorRXCajVfXacRBxjdJakKrFroXOsxAD1qPseUtjWvs9GpodMysV4EliMkb1pqBecPKlZb597auFCHI5ohwTqpL1CoOK8M2ZArweJjA/HOVOPLoOFWUpjAd3M4zNY84PNUzsb0kb5SGJhzNH0FW4UnIQwdKoo++eS1mUpzntk5K53PuqxzsL5aeaHvLbABTPczOflz7Hm3b/h5SMD5a5edg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757509119; c=relaxed/relaxed;
	bh=z5aBzRy9SrXCcJ1rkx7TeZFNbpBmp0grZlwbuKu+WTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DctFnt8GnEePxHWnV4h/EHVe+cRqdTqB5IRyif5BFSoUjHCtflT5GXwXBfho0Ujx0mUzzoZmEvaF2A0ViBPDXQZiqHx9bVgQcyUY5trNPukDWXUhEhVlfGe9US/45DYn0w3Jf/4dHUHWMJD4rRvBpOiy+ulQYPBawvSmmM11ZvUmdBBwW+xt4yeed9VMSXuMGQ0czC+qysE+gEhq39AcxFTJKS/ge9WDxYdbdmpoh9Pu5fOT9dYgyAFPi1SNdqfHRF7NGH1vcNCJgz8aVy/W5UiuOjsaZXAZk0X3EjzoUBpP9ro4l16CyQ426NbC/ZkVnk9qwioXEmljyDy6Kg2kvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KlPcWQyM; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KlPcWQyM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
X-Greylist: delayed 118 seconds by postgrey-1.37 at boromir; Wed, 10 Sep 2025 22:58:38 AEST
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMLNG627Fz3dBd;
	Wed, 10 Sep 2025 22:58:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z5aBzRy9SrXCcJ1rkx7TeZFNbpBmp0grZlwbuKu+WTg=; b=KlPcWQyMuHIw2RSFiHPkUTAg+i
	tWFfaCyb/S3jsoP37vt2y8BaMh65/Kb4eS0v1mMmNAn7c5Qh/YtyRQreMwwPk885AQsinLQSg3M/p
	CMXWeLiczT8ZLD7Yu90NNoFp+pbl/1i62enwSlxmX34MzJG6po0OP27saJNxncWOHiA0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwKP6-007wTF-UL; Wed, 10 Sep 2025 14:58:28 +0200
Date: Wed, 10 Sep 2025 14:58:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board
Message-ID: <e51d1a9c-a54e-4fe4-9091-4f5ea29535ec@lunn.ch>
References: <20250910041736.245451-1-donalds@nvidia.com>
 <20250910041736.245451-3-donalds@nvidia.com>
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
In-Reply-To: <20250910041736.245451-3-donalds@nvidia.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> +&mac0 {
> +	pinctrl-names = "default";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	status = "okay";
> +};

Same here. Please describe your PCB.

	Andrew

