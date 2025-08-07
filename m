Return-Path: <openbmc+bounces-420-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC145B1CF96
	for <lists+openbmc@lfdr.de>; Thu,  7 Aug 2025 02:01:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by6lX4QG5z3bpG;
	Thu,  7 Aug 2025 10:01:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754524904;
	cv=none; b=ZOpMAIRxVToNcYRe/gfWjfVlULQGEi49GPY2PkSlxo/1sOeJWMqqOYpm352yPsGhL+MrGXq95vF3a2kkdVM0ToO99eOPsQ1SuDY/G0WJH3d8kmkR9+qHqvRjGkRRSql0Cbs4+YOBhRFRMi0Fs8Ck+A59lDWDyIujXo/thTzYslQ5ppvoQn+mWd+7XzFE07iuLpy1H+gsR3acDteSFFUiK0r3k69Re17Tf4j9dPF8tcsOcHo9lAEJNIcOHqUwI2azFp9fCST0HZt9DzrAK3x4Lz0eJOfEwnI70C1TWkebsny4B/0uYKsUwGGfCS6SxpIROOe5elXJ2X976A42KtVsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754524904; c=relaxed/relaxed;
	bh=4I9u0wtzO6DJ3irQgYXORVSKqJSi0ibbHu4P68IbO54=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZlleiymgVmvrqV2KOeOBgULzkQRT5XTlFcG4hO8D/Kz0+zHCXCpaQIKMmGYjMfbZKrYnUfSXG8QzbsP41p3bPCmiKhnPHqFknTndu62ub7J5SMivNaIeBSy6mubuzNVMaDkH00BAwsfuyvF2/MGYFlQlnryhstzG3pbecUQvqu82qv0t337014bRuWspZfKY31wwDVqvJbagDtLRYjHx3RHXWGp9XR/SR8Xg/w6iD/dmBAw1BMCRj44GxZltt6J9GF7Q50r4N+FlgQiSFrPJPZVtZo3Z8hNA55YugrB+uePrlijFMNixP/41uRXsucPSzThqYN7XWO655pp6VmycGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JbQaFOg9; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JbQaFOg9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4by6lW53kxz3bcj
	for <openbmc@lists.ozlabs.org>; Thu,  7 Aug 2025 10:01:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754524902;
	bh=4I9u0wtzO6DJ3irQgYXORVSKqJSi0ibbHu4P68IbO54=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JbQaFOg9Yi+JGsQGtudE+C6Nz2F3wth6btbo5yBQmK11Dvkmn2hdS4pfHopshrEZx
	 Reh2W82EdomvJez6RESAiR9AJmqb3PeLd7L4hsS57tbaDMBv/diJtJY+l9/qDeYCaT
	 Mj45Pei8GSBoGz3yDAmvVuN20ERO6jGCwK4/5HLp5ClG+Th8iBAPgOOBLcI3LjA9SK
	 W/sIaUt/9F92rWNAJAmxV94FNUTgffPJAhar6utWQysEggnwDlDSGBq+QU9bcWqfIl
	 b+PsXeeBf0hbKJXyaJF6/A7eC/UfREvPlTeD56DhDq8MiBXOCfH46GnS8EqDwzeCl6
	 B1evkRMIvvBxw==
Received: from [IPv6:2405:6e00:2427:3ed5:824f:8cc:fbc2:3fde] (unknown [120.20.71.227])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4ED4667B49;
	Thu,  7 Aug 2025 08:01:42 +0800 (AWST)
Message-ID: <0dd7de8da1a33b6b0ba3b613cacadc399a15e156.camel@codeconstruct.com.au>
Subject: Re: Proposed deprecation of device-tree-gpio-naming.md
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andrew Geissler <geissonator@gmail.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Date: Thu, 07 Aug 2025 09:31:40 +0930
In-Reply-To: <CALLMt=rt8Ngv2sRKOeQ-Gm=cccaw-d3j0WahqBXyQydhqC15nQ@mail.gmail.com>
References: 
	<eff663ee55f2614dde750f5f0669ec876f107c0d.camel@codeconstruct.com.au>
	 <CALLMt=rt8Ngv2sRKOeQ-Gm=cccaw-d3j0WahqBXyQydhqC15nQ@mail.gmail.com>
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

On Wed, 2025-08-06 at 14:21 -0500, Andrew Geissler wrote:
> On Tue, Aug 5, 2025 at 6:54=E2=80=AFPM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > Hello,
> >=20
> > In the comment thread at [1] I've proposed deprecating the directions
> > in device-tree-gpio-naming.md[2] for the purpose of describing GPIOs in
> > devicetrees. Devicetrees represent the hardware, and from experience
> > over time I think it's best that they reflect the information from the
> > schematics without influence from software implementation choices.
>=20
> Yeah agree, it seemed like a good idea at the time but there has been a
> lot of friction with this design over time. I know some reviews have simp=
ly
> been abandoned due to the frustrations of coming up with an agreed to
> gpio name. And other reviews have taken an excessive amount of time
> to get through.
>=20
> > However, perhaps it's still a reasonable set of suggestions for
> > consumption of pins with the translation from net names done by the
> > applications themselves?
>=20
> If we all agree, I could do one final update to the doc stating it's
> been deprecated
>=20

Thanks!

>  but feel free to use the existing recommendations
> when creating a new system if it makes sense. And another note
> indicating some OpenBMC repos may require some work to support
> a new GPIO name.

Sounds good to me.

Andrew

