Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358CA471FF
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 03:13:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3FHJ1BJRz3cZn
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 13:13:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740622377;
	cv=none; b=ciJ5/T5Fn+ooGvgdBNQZS3T3HCnQMkE0IjIAXHreQb25FmIgPKAjfOp/PFNDVYFy3CZ/M0AinuiW2YF02LHB4K36WKnbANRmxKxscX7kLoBSBbyqHMIWwIkuH5NxDBPYzVYFNDRsf07/K2dWVuOK8hwjKWpDtUdpxDCJd8/leuJhj6jDzetNjtxIivqy1KETQCFM3voFMFLoBgOeLvo4o55jtoUOt6S3kRA6XkwNO2XAp3v/Ef6fCgGjYcjpP4Fakf9+DUukZLNv2i26zuPixKOYvq/ymWGWDOkBicm+kWNtIfuY39WoC8G93vr6RYP8mE8B8n2zuyzU8ESKPvDrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740622377; c=relaxed/relaxed;
	bh=Ji43QirnLWxUXnqatW9H8FRgicNepO9UGBb5s7EDnY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Th8L+GPcdrSGoWfzF3/0hxqoIv4aFuDQtS79Vv4sjmoNZlfc4ekMG09QlFS7DktcbHw4z37Q/Y/8hBWeuNdKhvvRoii2889hR5ylGoZrjg/cYMU6J2hE2nZJBPmYb5kuWG69F06K3j5+/3bnEK8MNOOCVaxChQ6t0rVvefDBK1o9pwOnl2mqrX5MtyPpuY+ph8VbWAO55qaYGuUlKQTm0iGbxs6+IKcqdJu1E68oIKu24+M15BIP0/0m0o/AShOvFxduD0gpBvzMcx83kzAKBhcVLw537gqiPowFxuICOCzltxdYtjSuOwZfVxqZEPq00Ld8SJYMnI6tquQq0n5NAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KHG1i7gV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KHG1i7gV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3FHD4CRcz2yvs
	for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2025 13:12:55 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abb81285d33so82822866b.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2025 18:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740622371; x=1741227171; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ji43QirnLWxUXnqatW9H8FRgicNepO9UGBb5s7EDnY0=;
        b=KHG1i7gV/t6DYlPJ4+/Vwzw22i1KVJEGACZ4GNq8oLk8SJTFeNsZemMaaQ6FahGcfV
         P6iD56Fu6zIH8SzOWmXRS4Oa//dq1UXiXLZvU20W2AMpjc97EDQhFETxPJRKusTJwEqw
         wm3n/cPWcypuGA1cLCEGbJfln2huWi6UlVamOWiMX9n5MPLJinTWX6W4a9m7eXgwRY06
         Rzwd0th6l5iUdJEnBMDkb5ljgVZ/k6tgqkAS/HlfyRPXLbP0Q18p4suhqhcFdATnv5C2
         cOtFQqeJiYIUWtLmaUavShWKCq8dgzlNmJIbK/hg8dilGALM7En3lDZGkIehlfQQZdHg
         wv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622371; x=1741227171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ji43QirnLWxUXnqatW9H8FRgicNepO9UGBb5s7EDnY0=;
        b=mt2gGEkS2YTGrEAl2YzUXi/F2IXg+Ke2yO4Oosi94aAnYem+KWcgBFhs4iMb8s94DU
         JynhtLQLbYa6GZOleX/mDYS2G6/RESHCWL2j+z/opQo9zeUVoDDyb8UUxLzNkfdhimEk
         5J1lOcwM3tdqNi2myUfdmNSAbpRXXB4LIFhKOxU/WecSLFg7TItoJxukJPLOI3fa4gLj
         FiIhWQD8wF6fyW0oSL7rEYx4U0806r9mp/XYSK5tLxeRrjVstp/H6AXYu1AmBh8PC8JK
         nwCp7xBXIisYhdEUrpXmQY8b1Ha+JHsKxQfzlwc0O1J3v8RLc7FBboW9snLzH9/JpfDO
         03zw==
X-Forwarded-Encrypted: i=1; AJvYcCXByF4vJgVX20RQKZ040wdlKKPwoUWxOct6ZK8z6cqF2Y8/3s2QWadatIXwqtXO8grhWGGJy/72@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyquC7IbTKIFeYtXrLbxXkzzLYRgMdI+RT4x6HoIac17rsBjtrS
	q6ieTKtQxBNKOeGk9CXOrZAh8nkTJaZBVvJ7UtbMPWCaS0eINjxC7eG045ocESetyIUp9Wwb46N
	wF47Pm8G+/ZtbIND52/aqzI0CAQ==
X-Gm-Gg: ASbGnctT36BxPNp02VbNCTyfC0/5Yt45kSjVBx/Hw/5X6mwE8auxxjWJeZnBCAY24PK
	V0DxpEhPr35e01rVzckC3sjAIiLlcApbPRlc4zRZwn6pEK/PUWGmjnFO7YFBwgkwwHHMXvgjbm3
	6+7Q+fTDK+Nm42FlG/BwARX2D+dEkBX8EyQA2eDfl6
X-Google-Smtp-Source: AGHT+IHT13vTR0kWj4ZrwhphGcwIOVy7CyAkUnvryXOEjJ/H2PVdPSrbH2xZfZk15WtnvnDCvp0Mkb5Lrcyb3LaVMd8=
X-Received: by 2002:a17:907:728a:b0:aba:608d:4a22 with SMTP id
 a640c23a62f3a-abc09a09707mr2626636966b.21.1740622371069; Wed, 26 Feb 2025
 18:12:51 -0800 (PST)
MIME-Version: 1.0
References: <20250220040029.27596-1-kfting@nuvoton.com> <20250220040029.27596-2-kfting@nuvoton.com>
 <nantj66w7l7bmk2sz6i2akyaw7cievmeuuvpl3622wj5xmdmtm@g4rcuwxghxdp>
In-Reply-To: <nantj66w7l7bmk2sz6i2akyaw7cievmeuuvpl3622wj5xmdmtm@g4rcuwxghxdp>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 27 Feb 2025 10:12:39 +0800
X-Gm-Features: AQ5f1JrZiTk_IXo8TxlPqW73GZxuhoBbuhyIROT0bdFgIPbl2r9cCmk--GAg3es
Message-ID: <CACD3sJYWC+=Q726rS+bVdyu2+1Oh7vXQfPn=8RWwJdT4G7VA3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: npcm: disable interrupt enable bit before devm_request_irq
To: Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
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
Cc: KWLIU@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andi:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=8827=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Thu, Feb 20, 2025 at 12:00:29PM +0800, Tyrone Ting wrote:
> > The customer reports that there is a soft lockup issue related to
> > the i2c driver. After checking, the i2c module was doing a tx transfer
> > and the bmc machine reboots in the middle of the i2c transaction, the i=
2c
> > module keeps the status without being reset.
>
> ...
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> I guess we also need:
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Cc: <stable@vger.kernel.org> # v5.8+
>
> I'm now applying the patch to the i2c/i2c-host-fixes with these
> tags
>
> Please, let me know if you think that's not the case.
>

Thank you for your help on including these tags into the patch.

> Thanks,
> Andi

Regards,
Tyrone
