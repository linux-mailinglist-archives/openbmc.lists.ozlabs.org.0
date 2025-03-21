Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D06FAA6B280
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 02:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJkn04FGwz3cBx
	for <lists+openbmc@lfdr.de>; Fri, 21 Mar 2025 12:07:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742519216;
	cv=none; b=abeYEbTrSLaQJ0BND5KHiUkIegPwQm00vZv3f8zRtpZLWeIUQ8wSDF55ZhL5fe5VclF8cTgYO5yLQvVyqqrBZrHSGsq/nxVo94D4xoQTx39QZyHGwhXVlQNsUfFA/j9uYIvMyCeDIBN0VYBBXAQVXaVVrflb9rSO47IIoaBYUzt7KDAkLEpkYrZk+F/gVFyVfacVY6vVfpEajsee+cH6/zjNSKml5xjtPIWxUvtCSKFlqnwkDc0P7OvXq6NxDO1bQ+mPhjv1k5K64CixIh27FZTh9hd9U9qPG5GDce1LKWhcd1JQnWpV+y2s6ehgLOvKJRG0XoEZyRj77SaVkyiLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742519216; c=relaxed/relaxed;
	bh=pIdTixZuNmStjtltpSgBZZbYtUoRIdqSvZd1TvixVG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WwUmy16wqe27aNqCNVOHGYm1QTi/I7pGUrdVtWNQjQUKTYavGE0ng3c4/JQ5yapYt6p/rcBcZV3PzE0X0ylRNIafSHYoRNA+se93CX1Lukz3bHaJCoQVqhb8Ha25ubwdS2gIabod5oEBa1B8vBigl7eyVhFDSL6oRLbipVZGnhJsfHjzrIFrYXwe0VnU4NdICvVEqN1LtRk9ui9X7D/DcU+MteVc97GBPAG0bhuwZW6nVzg3ssmZ+58tGIS5n6nSie9QyN5N6BhepGJPo1jqQdyuPSr4czQvz4p2ll6XEl9v5DfXmtUAWwNIiD41YPmKRc70o2W6bk4kAi2ho6JwyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=STmLaeeb; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=STmLaeeb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJkmv6HGvz2yhW;
	Fri, 21 Mar 2025 12:06:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742519215;
	bh=pIdTixZuNmStjtltpSgBZZbYtUoRIdqSvZd1TvixVG4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=STmLaeeb8JgIPPtTQkTrSNDqYPUrllXY1O8adMuBZaHXPzg3r7xposNnDqGupfi5X
	 99Zta++gSDDl1g6lvrC8XT0hnuAKg1r3RC4z8Zo/QyDKqSgnfrSyFA2MJrdT4WBFl1
	 RUmt/OZ6TxN7GeAG3cVCmiMKGwUSnxBv5Lv4WOi5kgsXZNcVhEykb5ll2kTsc+9Pa6
	 BaiCS7bfJfQEDURlCP4T+9JpGc1mpUmY46UGjImGTinlAXe91pWEhhzlW3nyExDQS9
	 gfDVgpD1XzfZxWWDXw/j4WUCiQMImKu63heMsVU2ep4csPM121OpZcNW44Zwo3oG/U
	 7WLh87jddaPNg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DB127AF35;
	Fri, 21 Mar 2025 09:06:54 +0800 (AWST)
Message-ID: <585c2b050a44f4009b3a61cab69f800c88a0cf5e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: aspeed: add Nvidia's GB200NVL
 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Willie Thai <wthai@nvidia.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, kees@kernel.org, tony.luck@intel.com, 
	gpiccoli@igalia.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Fri, 21 Mar 2025 11:36:53 +1030
In-Reply-To: <20250320164633.101331-3-wthai@nvidia.com>
References: <20250320164633.101331-1-wthai@nvidia.com>
	 <20250320164633.101331-3-wthai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: tingkaic@nvidia.com, dkodihalli@nvidia.com, leohu@nvidia.com, Mars Yang <maryang@nvidia.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Willie,

On Thu, 2025-03-20 at 16:46 +0000, Willie Thai wrote:
> This patch adds a binding for GB200NVL BMC.
>=20
> The GB200NVL BMC is an Aspeed Ast2600 based BMC for Nvidia Blackwell
> GB200NVL platform.
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
>=20
> Co-developed-by: Mars Yang <maryang@nvidia.com>
> Signed-off-by: Mars Yang <maryang@nvidia.com>
> Link: https://www.aspeedtech.com/server_ast2600/=C2=A0[1]
> Link:
> https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703=C2=A0[2]
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> =C2=A0Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 01333ac111fb..a3736f134130 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -98,6 +98,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - inventec,starscream-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - inventec,transformer-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - jabil,rbp-bmc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - nvidia,gb200nvl-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - qcom,dc-scm-v1-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - quanta,s6q-bmc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - ufispace,ncplite-bmc

Please order this patch first in your series, before the devicetree.

Andrew
