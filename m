Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4D95E619
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 02:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsX145H4gz30Tf
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 10:41:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724632885;
	cv=none; b=W2xuFWjiw7X2xgWVofDJzDfjnxX+J6rGQGcwfgUkW/bfkptWA7Cxn5vKcrWbTFbCcuJW8lkvmBNns8X1IRyu9pGsAHrlIRPpU7AjCnzoHm21WXhzH+BFzRXTjcgrniQOVry8qKFI0nBPfxSsJVcUWdz80Q6Zs6QAmk0blAtTw5NhTOsr5yUO8N8iCjIv52zyBhNE13onlE9WXnrEjEOK1KPdbMAJs96ko0HMS/J2U9UOy8hGUkbmmlNWrIzll8pOfCPKULZbwaVEuwBajyYs2YbfBojGy+jZy2ZjNDxI8ywtyJKiah+JYqyCp6E8ouk3rIyvw/Vv+dU0N456XwEziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724632885; c=relaxed/relaxed;
	bh=Kx9Kj1wqLukxjbzdXj58J42N5aIuOP78GRisMHzNuLU=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=NBB5+2S8uH5FI1V0wMi2v7LEmKaDEGsOo4o0aauHMc823uYjXIe7x/UPxy/70SX3rrenGhhWi606GWLxwZQENtMKVT4IRH7imZmfHwYcQn536xvOLr7tSZ6hPzrDnFDkU/7DUcOq9piPg6AwRJ83EDVoQMU2wxTFzWRDZYWFP26lWAoeCli9GVw7dutPkjQtFuqw9QfGKIiyrVTdYJnpk1tOnV1b+0Ei6QWXgPScy9YOPzY+nGFRapudHoRMAfuYKyZARwzLzR6St9lmB4YUlFiWV15+s1IMPTMmWgk+XX7QtltA7IdnZMDmxtNH5b8S6g6dLqZ4u3noeOUQAY0sBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DJsebf+w; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DJsebf+w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsX1164QRz2xy3
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 10:41:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724632885;
	bh=Kx9Kj1wqLukxjbzdXj58J42N5aIuOP78GRisMHzNuLU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DJsebf+wbHc6AlHUvaRwhtxKPtsTREuhON6FG/gF1KSdfjgqKpp7j1YCTE2R8uNRU
	 N45qUFd0c3g0BHSB71E/H4zaff94q2E/PBV55fesw2r4+RBAxKbJ7jFb//PVKvEqxI
	 LXGEfMHHFc8SMpKdKcxHKxA2SzsdnTXwPH1CUphsYjNzEHS43RBQkuSEByCT9evvJ1
	 mllQ+gR3FhTRxxXGqcG92DSEQlODfx2Sf7iT5ShN315+xa9vO+8LRNVvk7C485RzaE
	 2EJMNnZeVvJtWE94255OJBll+rJJt8jyDR1no1BvwXgqYKLIY6ErsU1bSAaVqXE4Eh
	 C1TfKEIBj6alg==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 02A166502F;
	Mon, 26 Aug 2024 08:41:24 +0800 (AWST)
Message-ID: <d9b4e59f249310d37fa49f57fe32f868dd9ecd18.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] dt-bindings: vendor-prefixes: add
 asteralabs
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 26 Aug 2024 10:11:24 +0930
In-Reply-To: <20240823061533.3463647-1-chou.cosmo@gmail.com>
References: <20240823061533.3463647-1-chou.cosmo@gmail.com>
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
Cc: cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Cosmo,

I've applied this series to openbmc/linux dev-6.6. I'm not sure how
you've generated it though as the subject seems to be missing the patch
count. Please try to use the one invocation of `git format-patch` or
`git send-email` for the whole series and don't manually thread it. The
way the series has been generated confused b4[1] when I tried to apply
it. I've ended up cherry-picking the corresponding commits from
upstream.

[1]: https://b4.docs.kernel.org/en/latest/

Also, to avoid bothering upstream reviewers and maintainers with
backports, please make sure to provide `--suppress-cc=3Dbody` in your
`git send-email` invocation (if that's what you're using to send
patches).

Andrew

On Fri, 2024-08-23 at 14:15 +0800, Cosmo Chou wrote:
> Add vendor prefix for Astera Labs, Inc.
> https://www.asteralabs.com
>=20
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/r/20240115100518.2887549-2-chou.cosmo@gmail=
.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 25158559471c..c734ea4de428 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -161,6 +161,8 @@ patternProperties:
>      description: ASPEED Technology Inc.
>    "^asrock,.*":
>      description: ASRock Inc.
> +  "^asteralabs,.*":
> +    description: Astera Labs, Inc.
>    "^asus,.*":
>      description: AsusTek Computer Inc.
>    "^atheros,.*":

