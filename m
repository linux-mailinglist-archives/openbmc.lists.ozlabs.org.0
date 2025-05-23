Return-Path: <openbmc+bounces-61-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB13AC1D34
	for <lists+openbmc@lfdr.de>; Fri, 23 May 2025 08:41:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3bCb48ZZz2yrp;
	Fri, 23 May 2025 16:41:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747982475;
	cv=none; b=mj26ejY7r7g2pcDMjo4EvBL8AHKS3Kfx0SWv+LqPNJf6BZypfZk1o4AjBq9PeKogWn/3ANZRmDbV3fSmLnV+P+Zv/ABKM/Z5rWJTu5fEBaUrXUCE00+MQEb0sNE5P/pjxMlue9qHNACVFjH2rIphOuXMPKxfFWE3yAyr3kYrL/P60jSvkKOQ4g+yzVaXJvSE/J4J+GaaDGpgfxSxYG8j67JXqgii3TqAYBn0xqw5dUEX232jIeBXuRmUebLer2OVVAGhQS4AXnJJVtM68lijqiGcIwWnFZ2SRur+lbD9UelT7FHVXvuIsQEBSXEPttvIvbDB1LaejE+UFuJlm7a8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747982475; c=relaxed/relaxed;
	bh=fFejb+eabMRvSBUN3L4E6ucDFSDjGG1Ynzw9bYV00Bo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PSVrXnSs8aAqWpqyq2TDxapLXYyGBjTULh1utlgfmgxyi9rN/6JUf9XTigqM7BhZlGNheGuD+4fXmUd45RuzX3mP8kRVmfFEIRmWxYJZqnBouRw/aEhTHCSEeZv/qG7y2wsaSbJioeBXxXqr+Nu3maorMK84fLyylOzR7nqpeuJ6BZAq24q71wvaDsHBqIBYW3BmOIKss2OhaxTzSfIq/oLosH3WCLPoxe1/OKljaWQTIZY9PY7bz8Gbn8h+aQYHLRt2cKFojXtncf0Ed1mfoKvBOGXUxuzkJggAl2PdLiFbdXJF9pjLvvauyaVGMIJn/hLceO2FRQEgy+M6CfhVHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D394HPWq; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D394HPWq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3bCY3RFvz2yrW
	for <openbmc@lists.ozlabs.org>; Fri, 23 May 2025 16:41:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747982470;
	bh=fFejb+eabMRvSBUN3L4E6ucDFSDjGG1Ynzw9bYV00Bo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D394HPWqpVR/+EIZ4/1yV/TL4W4LCumO+7hpp/nLuKBXNzRjisAzKwViWClEDFcWf
	 gss1MMWUJvO1UfWYzo0cCwOng6yTqezwLHJsrTHFZEiqc6tufI+SwNOjVKuM+ca4KI
	 Qvwrl4HoXpsFNjsUpFTk7fKi1s/7epKj+OM8RrRmXVnl5OtEu6qDjPabmoqe4UtOBK
	 Z6IMunB6hokWfMF7VLlnUUCq5XyXzP4yt7C3Rp3qLyUBjZTBXMYkhBlkSdSFwpp4C3
	 iB90nwQl/4uy1zHYxYs9rZOtj7K0q5Gqygu0dB66wudoWZudA6fz3NUANcsYiuSlz6
	 sbOseHlsBjKvg==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 591536449F;
	Fri, 23 May 2025 14:41:09 +0800 (AWST)
Message-ID: <ad7e423b6a93096e4fc524590d77f970a6111ece.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2 0/3] ARM: dts: aspeed: nvidia: Update the DTS
 file for GB200nvl BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Willie Thai <wthai@nvidia.com>, joel@jms.id.au, openbmc@lists.ozlabs.org
Cc: leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com, Ed Tanous
	 <etanous@nvidia.com>
Date: Fri, 23 May 2025 16:11:08 +0930
In-Reply-To: <20250516184703.726599-1-wthai@nvidia.com>
References: <20250516184703.726599-1-wthai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-05-16 at 18:47 +0000, Willie Thai wrote:
> Adjust some property nodes and removing unnecessary devices.
>=20
> Signed-off-by: Deepak Kodihalli <dkodihalli@nvidia.com>
> Signed-off-by: Ed Tanous <etanous@nvidia.com>
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> Changes v1 -> v2:
> =C2=A0=C2=A0 - Separate the change to multiple patches [Andrew Jeffery]
> ---
>=20
> Willie Thai (3):
> =C2=A0 ARM: dts: aspeed: nvidia: Remove ECC
> =C2=A0 ARM: dts: aspeed: nvidia: Remove mdio and mac0
> =C2=A0 ARM: dts: aspeed: nvidia: Enable HACE and ACRY engine
>=20
> =C2=A0arch/arm/dts/ast2600-gb200nvl-bmc-nvidia.dts | 32 ++++++-----------=
-
> --
> =C2=A01 file changed, 10 insertions(+), 22 deletions(-)
>=20

Series applied.

Thanks,

Andrew


