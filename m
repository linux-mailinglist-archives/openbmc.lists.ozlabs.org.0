Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6AA8B2FD
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 10:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zcty20S3yz3cQ4
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 18:10:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744791046;
	cv=none; b=R8N8XlW+2cLY/Toik5aPWkUb+LJwdbr64q2uwVZz5DUl/hzB18jcqox880YEKxhfkedodLY9RWVf0wQo6P6m390ileGfJbFTx2T+es1Fqd3lTuO2u2hdydyXCSWD+bpc/e37Urb9MPm1NpkIgmqIuOroz25tBx9LUibts4p91SVGUYbFgwh7UZOnDLrS6Mju8F7q32gVWDcv7H4GYmn2JmBQhQdoDwFCVbYTC9CUqnZdiXpRSBCgwNRPmSl+CmqVDNJlW+UMeoHLQ6AbeX8RJtvlYnV191W8D+/NtZRw7vvTGN0cP3btqQl3tlg3mZ/4hhyWj09BelTEEC/APH3zzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744791046; c=relaxed/relaxed;
	bh=DZyqpE9X4wd/22zjOlPfUmaMFF9uMRXc0xTpLR2rnoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZMqCU8RzSkhLNIh3rWG6udnMjTKVwbH8r6xKhgJB3Pffv2pQq1R2ndMIx9wOBNrz/9FaDDUGA1fZOJCjuoxywUUKVKoinBn8CMIe9zijqZYTyX7mDvH5jNxVGXeH/Cbs+hCB2UOjmoUTQ5hxHFwhOWtvBOLVyOpgG2q4GBNOeEoCtwLv8AgCelYt7MVxmHLJKFxSsiBTgwGVQ+yUSr7TEWjnjjWVTQgUpqsgvqByu2avhLOO7v+Dkb60fh0rp2rqANtezvk+r/P0FvLdscQNHbZrD4vqZ9MI9Hukej12I2XqstzZ2rgeT30RGdv9Ooeqg/Y0g0Runx8QfzVXBp2ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DbpdxHHo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DbpdxHHo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zctxx4r2Qz2xqG
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 18:10:45 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso5141092276.1
        for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791043; x=1745395843; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DZyqpE9X4wd/22zjOlPfUmaMFF9uMRXc0xTpLR2rnoY=;
        b=DbpdxHHoq2kR+S0SwG9IVo5uIqBTONDA0cp4cBjfY6FIOvV94K1HRNG6pdi1xVgwGm
         1YEGbVqZ9Obe0XVvKJKYbuliR7kjSGmBfkEJceUok5QhRwUMAxWUyNvqPNi1uipx9atU
         L4slaxyFFmaT470RlWaTTmL/km9NkrzyHFUax34AS24ntVZ3P7fWOuUmY+5GFvFgbVdC
         zwItHIEcrTU2g/FLlEJpqL8j2ZDwGJdkR7WBotfsd0LZC8YovAoLFX2IqL6BgtaXCYqo
         /BfTJtL8UM1rEug/mNg51ACt6poSgchxYkonbbTTQEeuykswZhettwD4bB6QLcbWIhGg
         mMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791043; x=1745395843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZyqpE9X4wd/22zjOlPfUmaMFF9uMRXc0xTpLR2rnoY=;
        b=cSpM80PowboiOqX3awYjQnm2PTBp0BN0y1hvukll5eM3K+UzUvEJEsQuFinx4J45Gb
         G4PZzX6G+Td/5GW2aQqPgXx5yxHFMxPM8d0kqH1NFRI02QpxFsGSX4RwhtZcHGWn4IPZ
         cQ3Y8kCIaevKtFtLu5Lb9vuBv8KgXUruHryAMO1jfisQQnfzdltm9AuU1i5SjTFIgcDc
         O05+4yjCDIANh4AwbzTWf11E1xNUHkECIJ/0zBn3HhmCEMG3nJxsfroSPS+DZFL94pvt
         Lk3QhI+vw0Qy+kHv31ATJ14sfVEKC6qHqwU7e39bhZ5KAUoiZesvAkeSEzwuexUFXwcI
         qJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCVrzUIeYWv2mzjbfcb69lNcQLbudVpvK1YtEEkYMej8pcrk/WQaxswJoYEVeY/wuXX+OE+TX+TW@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyjwduvWxj7NOim4mdltzV+ejoZsQ4VD3L3nYPqZWm9EXXwT7aH
	AwaE5UrM4LmJ7aNHlYFBaPsZfJp3qUCL7lKKYB1rycFHK/iGByS+0Oi4WI37tyNK1yXl/8f+IZ0
	xdINajx16IipGkJ/qVfH3b8y0+8o=
X-Gm-Gg: ASbGncvZxxwkllLq8u5TE9zowVd7bUVA7Fzns27zN5QUmrs+IrHbj1I5QALXuuoEKtA
	u/kQ2omoLQARDQRaLA060n8KjEXwl0H3GHhen5zOaEfIg/+2A0xX46s57i7v37o0w5tl1wxfERM
	+tMJbupzDrRCFmNmQnNqOBIfU=
X-Google-Smtp-Source: AGHT+IERtVAn7G4y4UbpvpqL8S24+SOdCyTdCfzaf2Z6DYy23J0VPJjeu/lO0dtLZZUkOahWYWdUR/bt4CV1jcqAR3E=
X-Received: by 2002:a05:6902:2510:b0:e6d:e9b1:3f0 with SMTP id
 3f1490d57ef6-e7275f057admr1041947276.31.1744791042046; Wed, 16 Apr 2025
 01:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250416001818.2067486-1-william@wkennington.com> <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
In-Reply-To: <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 11:10:31 +0300
X-Gm-Features: ATxdqUFzBhTkR5fO7-JutV7OU1OIYCLydgKtsG_teNYEMHlsAIQ9RZ1odpqCxNw
Message-ID: <CAP6Zq1hg+cjZnz68YvtDLjWOHRfUBWc_e98g3LtBMqNpA+sG2w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add USB Hosts
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, "William A. Kennington III" <william@wkennington.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks a lot for your review.

Can we send one patch that includes all nodes that are existing
NPCM8xx drivers in the kernel, or do you prefer a patchset that
contains patches for each NPCM8xx driver?

Thanks,

Tomer

On Wed, 16 Apr 2025 at 09:52, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 16/04/2025 02:18, William A. Kennington III wrote:
> > The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
> > already existing in the kernel.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 28 +++++++++++++++++++
>
> Please do not send 10 separate patches, but one patchset for given
> subsystem.
>
> >  1 file changed, 28 insertions(+)
>
>
>
> Best regards,
> Krzysztof
