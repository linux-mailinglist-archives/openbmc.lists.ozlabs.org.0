Return-Path: <openbmc+bounces-100-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66FAC752A
	for <lists+openbmc@lfdr.de>; Thu, 29 May 2025 02:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b77311s0Zz2yTQ;
	Thu, 29 May 2025 10:46:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748479565;
	cv=none; b=ZMXdlhrP4blzdn2BhPkxq8id+5NSbj0PYbWKmKGZ87vXp4rW7slkKLqtTkkDK/FW6GQwTNFuWEWGWQ0EP1ecuxLCJ+5qsQ4okZxELGs59/wCDxF3smZ8a8zgGzJoEWlRhgo/es0meyAluYgJxt/YizIlDxpl8697exTX9HDZojgtKbJ0gIAolS5d7WbwETHMa7VeKlFBRy5VTdK0lK0MdEyQWbv/FuitzUlkVB7QoYpl9syNrCFjWrhpduO42t8NLNJ7zkFXiTOkVf7rj65lGWYOxvqyyonpsBtK/vBUIiSHUaRXqq3gVXguJi6WjtDFuR39bSNYbRg31+YcowLF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748479565; c=relaxed/relaxed;
	bh=ChtR6vldW7n0kPdmm4PxNhSE5dAjqDgKMbH0IiDBJWY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YmHi2h/dsTO5HNx4zRCUlnTAIxTm0WEYyjkHR9cb0Gazgxkm1xYGbBhmBmmrjhm5tsdD7SedaI62m4pJw6COhBsogbzUtn5b7BK20mvIVbhIBrNwMk+U3paRzuzqcXnY43TcJmV3vhsLuXjqNeSgVJlVEvaAq+XUU0jLKbQnUK/B7c1MSAtKU2lloujauHM5Rtv97ozLIiCSsof7mXVBqFBIDGlAuMcNROLiR1vt7Yx3nphGohiJGl/hjS/j+OvmbUmKoUcKH1AVK9LQ+2AaryE5XN+LenV56M+eTksTQxANzgiYP+giajSUde4oU0y0bcQmooS8p7/pC2PC09iOZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZDPoG7DM; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ZDPoG7DM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b77304v5Wz2yRD;
	Thu, 29 May 2025 10:46:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1748479564;
	bh=ChtR6vldW7n0kPdmm4PxNhSE5dAjqDgKMbH0IiDBJWY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZDPoG7DM6ortjve7wa02tcCHWgv97Kz3jOBMVdB5dCRbPKksvmzwPLHLIE7uY16Eu
	 4i5aKSOt3r32b8o8PHr8vYdMe7ChSrgmUZoD9WrFNQJahCmq4Le+zg5Mu2AWbpxaB6
	 VzEsm+W2DqrlIA0Jkhc4GVSgh0QziMn6rMmZCnJKHT8kDDETBSlpeVq6eSxi38qtl4
	 KfE5e4cl2LDcPDcudiAwRLtPIgcDSRmvq9uQifm9HLTVX0DvX2srJo4zcgX3u/p0jD
	 hvgM20xBVUGLjcunlCmuOU2f7rEigiO7PeterXeLQs7t9up2dZXMvY2qnEoz/1Yozg
	 sZp0Pnvv4Cw0A==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8D75833B4;
	Thu, 29 May 2025 08:46:02 +0800 (AWST)
Message-ID: <5ae04cc843d85f862e906319803b80ffa58b6947.camel@codeconstruct.com.au>
Subject: Re: [PATCH 18/34] mmc: sdhci-of-aspeed: Drop the use of
 sdhci_pltfm_free()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen
 <chenhuacai@loongson.cn>,  Ulf Hansson <ulf.hansson@linaro.org>, Adrian
 Hunter <adrian.hunter@intel.com>, Huacai Chen <chenhuacai@kernel.org>,
 linux-mmc@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Date: Thu, 29 May 2025 10:16:02 +0930
In-Reply-To: <CAMpQs4LchvbX5-1Gr_epq42DSdfj0uegdqaG2Vh=X2DULSbaWA@mail.gmail.com>
References: <cover.1747792905.git.zhoubinbin@loongson.cn>
	 <dfc7e01a6134e421ae3aa8da3221f67d59706d0d.1747792905.git.zhoubinbin@loongson.cn>
	 <753cd65ebf659972c8a33e5f8e579b9fa8738682.camel@codeconstruct.com.au>
	 <CAMpQs4LchvbX5-1Gr_epq42DSdfj0uegdqaG2Vh=X2DULSbaWA@mail.gmail.com>
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

On Wed, 2025-05-28 at 12:42 +0800, Binbin Zhou wrote:
> Hi Andrew:
>=20
> Thanks for your reply.
>=20
> On Wed, May 28, 2025 at 8:44=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Mon, 2025-05-26 at 14:06 +0800, Binbin Zhou wrote:
> > > Since the devm_mmc_alloc_host() helper is already in
> > > use,
> >=20
> > This doesn't appear to be true? aspeed_sdhci_probe() calls
> > sdhci_pltfm_init(), and following that through eventually we call
> > mmc_alloc_host() (the non-devm_ variant).
> >=20
> > That said, there are some error paths in aspeed_sdhci_probe() where we
> > leak the object. Improving the code would be helpful, but my
> > understanding is this patch isn't right.
>=20
> Sorry, I have a different thought.
> In the original code, there does seem to be a leakage of objects, for exa=
mple:
>=20
> pltfm_host->clk =3D devm_clk_get(&pdev->dev, NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(pltfm_host->clk))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return PTR_ERR(pltfm_host->clk);
>=20
> With this error path, we should goto err_pltfm_free;
>=20
> Now, I have replaced mmc_alloc_host() with devm_mmc_alloc_host() in
> Patch-1[1], so I don't think there will be any error path leakage of
> objects.
>=20
> [1]: https://lore.kernel.org/all/6fd5afb003982bb5edbf95f76b605686223730e0=
.1747792905.git.zhoubinbin@loongson.cn/

Okay, I didn't track down the rest of the series on lore. I don't
personally mind if you send me the whole series, that would certainly
have helped with the context in this case.

Andrew

