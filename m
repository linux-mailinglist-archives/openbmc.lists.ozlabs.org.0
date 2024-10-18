Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936C9A33E3
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 06:34:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVBgt3pCMz3cRc
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2024 15:34:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729226086;
	cv=none; b=CC03RJgsbhpQ+NIZf2b99uYx7Z4jKAcLL/4JXaOWtrf/oXHsoxLnU+NnlPkDImwbUaWvuYVC/lxDS70CBUoNf2ShwzwBzIHFmAsK/aBdprfx9FrDxmLFR0Uwx5zqJZ11/YiQaAk4iUwWCAh1fVncISKx3SBouRJ/6496lbDV48KbDiikmFbhmJKSL1zDdaOMGJGGiLA+iFOEWUf80oP171dsMh8hN+PjyqHPujsJk/x6v2djT30ojcxPNXAZ9X6OC2Rla3DU2TWo6VNF+zhnGzmBhb92StVb0LPfpIJl/cE9rSuWVElJoLyTdHsHbP+4t+kV5J3jwwa8q3fsDut3Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729226086; c=relaxed/relaxed;
	bh=aMcQO5d9C/nTsULBi3LiUoDLWN+3h+b/LE+WPCf0930=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jYtUqm+fD3IJcaXts35W8qXZxnnSyu2MHICSSVP+hBpSgGCPTLEWLWu/9/lzW7HM4njlEHyBnZqMC+suwClctCWRrb5FkDsug5d77lJcGEVNWVpdAdM7zSkKjBpSGC0I7rlvSujl1taLcNb4X1qWHQbRIfGaAEqz533HL+H8emTaG96hdXJXuvcSzxWu+0QPtgtlJgnYE4k9yuF72A/gnOrhEwrUCYVNW3p59mDhRe2/S3jAcO1QIPBwZH1AHsXkbWLp7VKMl1u8fWukIvmYQJw9whwu03dxAr/GIanjjaAxfMIYqedzs4m8xIq0gF5Isx1p2yEOUxE2RvW/U2Ugkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XBWSeuFA; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XBWSeuFA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVBgn2xv9z2yL0;
	Fri, 18 Oct 2024 15:34:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729226083;
	bh=aMcQO5d9C/nTsULBi3LiUoDLWN+3h+b/LE+WPCf0930=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XBWSeuFA/JuoPWflWqKnmR92HIpUD8bW4xds9zkIzwt+MmWm6hYm8Gpn1js1Uq3K7
	 KL2PuiNo5vO5bQTAiRgORiYTq1jZ8O8k/tR7Mnk+P+FMMTTCnhEAoDIsCivm71nxqS
	 hFUMJq9jHk6lXgptAsZP0EwYaGYffv2UufEPt5SXNbZbhg4pA0rLbnR+S+URuwlKIm
	 L4MKumijPdJMXYB1iCRW/ErzIEltZAU6UZhZHw6H2ySYFiddH+t+m2wKgJKeJAau3d
	 byCM2M2/KawLwp3D3VhqnS2/PLhGv4B5BjIsWicdmClrzZMyVTf+KZG93UZA2MjkfX
	 VPQZoDzGCZWtg==
Received: from [192.168.68.112] (203-173-0-39.dyn.iinet.net.au [203.173.0.39])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C6D24681B9;
	Fri, 18 Oct 2024 12:34:41 +0800 (AWST)
Message-ID: <d514fd066353c529052e59c564d1d15f91b6a8b5.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Jefferson BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Date: Fri, 18 Oct 2024 15:04:40 +1030
In-Reply-To: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
References: <20241014105031.1963079-1-chanh@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chanh,

On Mon, 2024-10-14 at 10:50 +0000, Chanh Nguyen wrote:
>=20
> +&mac3 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii4_default>;
> +	clock-names =3D "MACCLK", "RCLK";

Should this be overriding `clocks` also? There's only one clock
specified in the dtsi.

Andrew

> +	use-ncsi;
> +};
