Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A09799D7
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 03:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6SR025XCz3cBN
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2024 11:45:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726451113;
	cv=none; b=IzOShvLRRt24Tj7/9z1m+6X12Qby/V4haXPgZk+V1hbsyvqh5C3CJDEE4fIOSjK6D6HmYcb83UJpTsp7FKNd/6JvpY9zaCXIqQ/n9kl512rX/qoA0GDibJvuXOgAS9G7Gw3fbi27zgvvjEJC1PEC/hpjkl8Aem4nEDMnqOleP9LlyLYLlOXpH4GWk6DTl0TWn1tBxb87QsOic1w55/9A5bjpGkLk2Uutqer9R0RIX2ry1LzwFroTxMhQtdL/vgJfpRU8pI5tYpgu8yiXHpfbozrEtlTJTFiDCNVwEJ2B3F6vao+c4g3ArAwzVgdiDmRfZ8QabeiOG6z/v4Sksirltg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726451113; c=relaxed/relaxed;
	bh=DLFByVSGhi5JpxF5PSv4cW7rm3P6K8uvXwbirS5wglg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlQ+OVX2CCfim0obGqf8jmYIiJeBBdYWmLIo6NOuMtHGnYK8wtekuCy5m6aoPCJN7yry1eBSJOpG0WYw2U6Mk3NhQiHkj14YgysIxU4BjzlkGyovfL3TNiqrDMeX9V3bHx8cupBw4im6/u8wJjXF/kChT6RocUTNh1R9YvrrkvAv7VJ5V0k2gR7cZgnKHrrO++swiDxWncYuaHxNEpxkDQprZ7i3mklAi2+xJY1SUA7krCb4I71JtQSGH+K1Jn0vkMlG8myw+izftoAVfNURMYOdrs8M5FqTWiAal9Le93OH4gHUHGdKEGfdIDK7jCjWb5mZuyBc8KRRmvBHtd+UnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iBR1ZoxQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iBR1ZoxQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6SQw6r2xz2xdX
	for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2024 11:45:11 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a8d4093722bso556265266b.0
        for <openbmc@lists.ozlabs.org>; Sun, 15 Sep 2024 18:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726451108; x=1727055908; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLFByVSGhi5JpxF5PSv4cW7rm3P6K8uvXwbirS5wglg=;
        b=iBR1ZoxQZqAs/puhkAs5Sgi6CUYeKQxgqikC2dwLgFsWK9T4xJjsErViz5p5kk3wAd
         8onE7uHJgTocacxofFak18F1iMKpNjcGOvSwkZ9eghq+UpZQVw8tw4+HEdPOT+ZSxQJ2
         Nj0RGqFWkmdrgth5cNKeVr9VunHJ4yFGd5bkJz5Uff/LyzsVxVDvMKs3DiTxLyfJ6kVb
         MbcKupcwGh1a4XItoAto8zNUA0YZMvRSkAK36+dmX938NPs8VlvPyglgFKIatRUl9cNu
         DPngNTp6uJy+qhDIiLgAWERPb5QjAnjsNAK4ScRJXnSG39AUeTwE0zUE88iAAkg6exaF
         4+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726451108; x=1727055908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLFByVSGhi5JpxF5PSv4cW7rm3P6K8uvXwbirS5wglg=;
        b=JymFNgRCF/g6xLeN/+3xtsapxqNSi0F0DIX72Zf4nZ9D2ixEUYQfeZkz1O+CBixXm0
         QQb9WEVFsxi6mdDnZerNkdkvGpVH1DYF+4MShvkHfGCCp4mwSxMT22ONxnSod2EHjmau
         of9Mqu+o5qhOEnXEGpjZ/zxynivlEvgTVjenxZLqC9mIX8CNSM/2/2FCF2g+TupUwqYy
         UQo27OmNLBg2NeVDS2E3/trv3x8mvES7MSMr3GgT6s9emgxeVd94phRtXaGJ2Bo8XoIN
         E7bo4FqyfPhx0GG6pOOguaFxmfLleJ35OiJNEEDf8Dfj1A4pxPOF7HY2ghLIH41sP4HP
         6l5g==
X-Forwarded-Encrypted: i=1; AJvYcCVngXQ3hvi3dGFO5tGbfsM+k7rmVGDZHGCKK3iI/UezIeXdtY053jKOTd4cczfE195MnTNvFPyJ@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzfCjANbcKFSMHPQdXnFS4574lKIsnDh8WZJmc8xWJmrke/VInH
	m2FPEhzguaqmOJ9UYCtaSdDTvrxUFRMFBGpw/8syCvp1aEYv2Qe9zby3gDoJ2uikdcm6iWVThmx
	oaXUE7uoR6tFm1dYcnDZ5YHyqIA==
X-Google-Smtp-Source: AGHT+IE3qNg2omwd3AkZnRWnAj0ifHnzbx2Ocr/ShLMIongfZtKXv9BV0AkBgTcdKgk8wy2erUN/u7BMFQ5vYPOt7lY=
X-Received: by 2002:a17:907:f75a:b0:a7a:a0c2:8be9 with SMTP id
 a640c23a62f3a-a9029432e30mr1434118166b.18.1726451107608; Sun, 15 Sep 2024
 18:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240913101532.16571-1-kfting@nuvoton.com> <ZuQT8YfVetrkMotQ@smile.fi.intel.com>
In-Reply-To: <ZuQT8YfVetrkMotQ@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 16 Sep 2024 09:44:56 +0800
Message-ID: <CACD3sJZDDaAiS4Vpy1keVp2pUS5g_1A-tx_tu1wcb+PxUsOCJQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] i2c: npcm: Enable slave in eob interrupt
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, linux-kernel@vger.kernel.org, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, tali.perry1@gmail.com, wsa@kernel.org, andi.shyti@kernel.org, Charles Boyer <Charles.Boyer@fii-usa.com>, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, Vivekanand Veeracholan <vveerach@google.com>, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
9=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:29=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Sep 13, 2024 at 06:15:32PM +0800, Tyrone Ting wrote:
> > From: Charles Boyer <Charles.Boyer@fii-usa.com>
> >
> > Nuvoton slave enable was in user space API call master_xfer, so it is
> > subject to delays from the OS scheduler. If the BMC is not enabled for
> > slave mode in time for master to send response, then it will NAK the
> > address match. Then the PLDM request timeout occurs.
> >
> > If the slave enable is moved to the EOB interrupt service routine, then
> > the BMC can be ready in slave mode by the time it needs to receive a
> > response.
>
> Fixes tag?
>
The patch is to reduce the time for the i2c module to behave as a target.
IOW, the i2c module target function will be ready earlier than it was.
So I remove the Fixes tag.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
