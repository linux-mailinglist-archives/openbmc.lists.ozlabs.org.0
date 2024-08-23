Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 354C995CC38
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 14:15:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqzYZ0hq0z30Wh
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 22:15:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724415343;
	cv=none; b=DCiT1FvhT3Ac1h9lFcddkkO8WvJiEUFypgSMmU7zes5A/uKE/NXObKhWPH/fL/gUu/kdkiz/FPp30b1/PgSGxgfi54zYU28zrWv5sdWhrHsCIslOQPaW849XO5W00J1zwkzmudPkL4LmxL/nfpTMzkGz/0Fn6nSB9P70HQ66jPUg2He10ht/tzoib5G6keFEttZCtDGOJPEdK1EMNPvBh6oFN7H4zC/g2VKK41lWftG6msjL8/zYnPxZ70TixyhOhRRez5ZlIpETYohtGrWIDyWSyA8BP24sbJMoJMeSF1oLLZ2jKEO8ghsu/eOi685nxK+aeCaioF4CCpeF981+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724415343; c=relaxed/relaxed;
	bh=h0BQB0MX4qUA3/Dn+xSqWXZtaezatHOedl+Kg5HoD1c=;
	h=DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport; b=THoiDmboVTVleIxTX+9u6Lq9DUrJce1Knuh9l2DmEVC7fAyZXKN/cMgeva3DaKF1wPYqli47RPNJQF9JiaxSviwp3O5UNwztCBtx++21brN+3lDras5Jqerv1haW70mLlm7wnsnCexhIphpXr6LhtpcyxZfytorQ6o56Xh6QJoyoWiQAvdKFszyUB7LhJz3KX9NFt6YXRGbnL7CGhg8lKi96vot1NFeRUvWo2lBUORTGkhSmTGCtZyAQVgdFDvxYdkxeFAIHB+dCeI1sPpeNGGjW4ZEG4cXrCcgcgzHFLdjw4U7HcEVAAxSu5LFpXzGeKD7Vkjpx9iGJFFn4oKtpHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=UyR6++HB; dkim-atps=neutral; spf=pass (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=UyR6++HB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqzYS2LGvz2ysb
	for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2024 22:15:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724415316; x=1725020116; i=j.neuschaefer@gmx.net;
	bh=h0BQB0MX4qUA3/Dn+xSqWXZtaezatHOedl+Kg5HoD1c=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UyR6++HBhq6qq43EyD0NdghBR9fobTpWMSvyT34NWlTQBtODLblFUm9CuMFKv3JS
	 XvygoTUbydjTgTX4t98hXwetY/rtkQzfKswfbUQWG4XUKbc6nhaiJytqrUicOsZHl
	 5eJLJ+wrcaWSRvnd3aK9BPKuSLciQOjCmK6jPSSMcCHya9RxFbTJm2gq1D640334d
	 CDeEiq8GjM5EcJ2+Z3odyvYndGFwLPopKXN8RRoj7aNZo7t4B4sKhiceWb4MvezDn
	 T6DO6S9WN4G48lB1Fv8SM830sk/8XYpadz5rS7RrZ929n1rOIsOg6jfnZLe7EH7ac
	 zl6b5YqoX1MSxlpU4Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([84.44.134.213]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QF5-1siq6j37zx-008Cax; Fri, 23
 Aug 2024 14:15:16 +0200
Date: Fri, 23 Aug 2024 14:15:12 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] spi: wpcm-fiu: Use
 devm_platform_ioremap_resource_byname()
Message-ID: <Zsh9UA4iXvMzm2HW@probook>
References: <20240820123518.1788294-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240820123518.1788294-1-ruanjinjie@huawei.com>
X-Provags-ID: V03:K1:K7cBbWoIShlD66049cmP2FqksWnx3SN+H5lXc21nFVbBvdqE/B9
 U2bnn5C7QchLuXPugvq4JJViBCFCyxJVwHaoue/jLmBmuHzBDQbssFZnv4pHZM8RoBmDBH7
 zYba+W1Q8G4bz9sj80cnVv94dxzFMArr6ng489n+Yf4GvsaFn7tehUrcGCpgtbCGe3bbFnS
 SSHutCmO/PK8eo7gE2wmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Lh+VwlgWObU=;GJNmrYaMKTYmGGyPde2c8PtyC89
 d0XquKzpM3w9sQ3Ttun4EdmGS+2Yxr5xXHDiANRgVImt4CbvTqGf3qQsZIX7mJXXg5IOifawD
 4OasJRwKY7Qn1t01Lb5/BFZT4ZO21IKpCgwVMAXll7DMMn7njL41+g7ZkBnF7gDZjJ4z9emsn
 QLWXhoY4nh1hoBrdejLylxJptP6U1SekHXLHeFOSHt00rxWdq2fBgqhPAkXKdV2yax1U3l273
 YUSRzIfpK4mcuRjIBDLKPgaLirpchLDi35azvucT2uG85qO1ukyTLwU3oNwTH2jMT9mryxfsC
 /tm4VR0xaQ9PUDttUlqpzGHZotLvYvcF8z0zEPeJL9CKh51gZNeuF0jaRqEXD3K4ufHrI3CZ4
 9TkgrOE4BkMjxOEnC0z6zXsWGGCSA3sksmwUwpHihqBjswjTjGHrmf4GH0bB3d7N7U3/erXyY
 rr1tyNqtwiHwx10f85cM1aiXTc6948AdjWOZdq6N7MUWbsO14aG2ArpaG9MxQa4Ip1cNREU1d
 SGhSa+W/HsTWiyJV1MfHQ9vIqia/Xlb275mCwSoCj2Rci9FYAEKHGWiODzLT7Rgu05VYhs1Ei
 tGjKqpapt8ygNCIpDNuxNn2glVgY65WjCUbk16Qov4IwWPIqgQLaQe4fp3stI/4jz1xW7RczA
 PQg8MDYf353lSeUOtweKLYEJZ7GS6kB2fA3f5o/9eP647J2bZ6l//CnmDyHvHUzzvKtA8ddGI
 nDIVs7ZTsmCXdiv21wGj9YFhGYT8CJNxoly9+KHSa/iirJ9p6Pz46TvpfVe9yjtES7zNSWgZP
 grZSzqK6ygRvC5IW3lTkx2vg==
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, broonie@kernel.org, j.neuschaefer@gmx.net, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2024 at 08:35:18PM +0800, Jinjie Ruan wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Looks good to me, thanks!

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

> ---
>  drivers/spi/spi-wpcm-fiu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/spi/spi-wpcm-fiu.c b/drivers/spi/spi-wpcm-fiu.c
> index 886d6d7771d4..47e485fd8f84 100644
> --- a/drivers/spi/spi-wpcm-fiu.c
> +++ b/drivers/spi/spi-wpcm-fiu.c
> @@ -448,8 +448,7 @@ static int wpcm_fiu_probe(struct platform_device *pd=
ev)
>  	fiu =3D spi_controller_get_devdata(ctrl);
>  	fiu->dev =3D dev;
>
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "control");
> -	fiu->regs =3D devm_ioremap_resource(dev, res);
> +	fiu->regs =3D devm_platform_ioremap_resource_byname(pdev, "control");
>  	if (IS_ERR(fiu->regs)) {
>  		dev_err(dev, "Failed to map registers\n");
>  		return PTR_ERR(fiu->regs);
> @@ -459,8 +458,7 @@ static int wpcm_fiu_probe(struct platform_device *pd=
ev)
>  	if (IS_ERR(fiu->clk))
>  		return PTR_ERR(fiu->clk);
>
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory");
> -	fiu->memory =3D devm_ioremap_resource(dev, res);
> +	fiu->memory =3D devm_platform_ioremap_resource_byname(pdev, "memory");
>  	fiu->memory_size =3D min_t(size_t, resource_size(res), MAX_MEMORY_SIZE=
_TOTAL);
>  	if (IS_ERR(fiu->memory)) {
>  		dev_err(dev, "Failed to map flash memory window\n");
> --
> 2.34.1
>
