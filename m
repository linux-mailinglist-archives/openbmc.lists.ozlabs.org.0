Return-Path: <openbmc+bounces-6-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCCA9D40F
	for <lists+openbmc@lfdr.de>; Fri, 25 Apr 2025 23:19:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkm1S5vqMz2xpp;
	Sat, 26 Apr 2025 07:19:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745615947;
	cv=none; b=gPmffYzlQnAXhmGvPbBupssnourcNIy5ayKdTUSJdUrI/Sw4C7ijduOkq38qGBYiIhiJ0tGMcNlykKymOSNC6CiMhPj/8mdmT6De2loNX9gD6MAyE1jy6l8mOvv52FkqGWg2Qs82QSNs5zhbnvaFDDx7022QLG3APM+g5xcZWksfj4MBbhTmUfJXBPeHqmuVRrB4geVW+5jcCuQwo7S4o3HPOV8BOiKjCXc5zcpaRwlq3/fpCM9iX685ejPgYXZa9tPUXtXFbU56Q5mVROiAiVE3QeJ7gD0qAIFn5HqHBY5YoXf8T5JAKH7FzL5BiQB/ItVjGv4JJFCy+bCtJXp80A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745615947; c=relaxed/relaxed;
	bh=lATh3MzWZf790DjubzFS9bFKySh0fZR6epsOaU8Hl1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2G6Vf8JXaoEmibnK+tfmOVluQee8MbohPJQsOsc8kOAHINfFoJRLMSwqRyZ4UFWlrfNZUZp7/90i1EGaaCRdR0UdtECo/6+oRd5SLXP0HIJYXHK8LQEg2htkbljz6tZAJWs/F9w2VxZ+4dxPy5A4KtZnviBjoKBCxCZW8WzdBZn7uCxeRz6Euq8m2IfUOXLe6Tyt1IAAA1cz8HmQDrRfACUPsHgq625RGnVfLCAZliugr2aObhnua10OGKVtLAIps2ycdsDzVy/jpTe8BDQ2Up3UM2G8ix/pQENwpDUkS3d11cHn2XYN+09xAvEsh2Ipefsq4mxPqOiNAOoz1DYiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ytEwtF95; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ytEwtF95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zkm1P0tq0z2xmZ
	for <openbmc@lists.ozlabs.org>; Sat, 26 Apr 2025 07:19:02 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736b350a22cso2464751b3a.1
        for <openbmc@lists.ozlabs.org>; Fri, 25 Apr 2025 14:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745615939; x=1746220739; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lATh3MzWZf790DjubzFS9bFKySh0fZR6epsOaU8Hl1s=;
        b=ytEwtF95sTSitBhMq9ZmNkhALH9qcxupf+mv7vRoSkWNSQ6lySjYivv9TG1KUlJBBz
         WSkSmyWnl9BhAYoe0Bs0HTi5MH3CZzF52Uagw9h6D3dETkzKIxE0H41PgSqGE8SKkZQF
         VGzGdyYyZSJnKvqwPbzVmMcRw6/B/ZKJ6ebS5WUAIdLeBbfadhs7KYpbqnWvVs44LGTa
         1/vzKK1h3GxJo7pouD2mUKtFCI62OGO9FsKlJDX7iOYf+mwLv3BudTpYNM8vysxUSRPZ
         MBelc02k+9UdpFvZUrdFbrr0MafKAV2K0jxJEL/7haTTy1uyoHSTFoBX+X6ALf4IMBVA
         Yc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615939; x=1746220739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lATh3MzWZf790DjubzFS9bFKySh0fZR6epsOaU8Hl1s=;
        b=EBzPon0hQX2qIddZtsuuyiw1v7uGtAGCqlWnyveTfxs7ei3SsEshhXcDWt5m/S0ANC
         xDHHRzJHqnwYrXhbiughjbMGH3z/cs9HVWffP9b50QshC0wvmXjwoley7TGwMqF8HpQO
         nM2+ion9VXIC2mPVmmovqGkDu2BW1nMVddraXJq57SqzWWW/e0x9TlBtgECfsGAwqXk5
         CklcXoFf/3B+J9WtTAEhzYCTYux9gyA9aRpdYShD+VPWiMCJECKd1cjh+7jB1P25iH5f
         5CW+8C1nyUE+99gNsoERbmYd0m5tDL8KN5VxPn7iJYVguwEivyaSp+PHaDx71OgAjoGQ
         Zq5A==
X-Forwarded-Encrypted: i=1; AJvYcCWgV0oHQx2jmNBTYAM0YIPA2zspIdii/nxn8DTRGZPa+JTXABgTGhzm7fextRkISt+TcUPIa93y@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypcvZXx+bMMNjs7T+x+WwVI59RUXAudKlz4ppuVMKMlWZWCkE6
	fq4f6eMSsjbKwQM4PzjpjuxYbKsTiAOHSNydmDU7siwyhr03K9GbodkuPlnp+dXlM26udQ8fwRM
	qgGsa2UqBUc4BxXnhcjdxJwnq1H0Lgi82XyStUQ==
X-Gm-Gg: ASbGncuF8i3ovlm8/YV8AV425MuuH8K8M3arH8dXF+aBuEolRuKFk5HE0860ubFwU25
	kPoibOjXHL2ftu1xVie//ZR8tYVg3Ctg4E773fVN3UEgimTMg8kYOKsVLRqpV+U7BOVvouDBauC
	ZmmGZ0isbuqrma2TopRCMMmeO8mmqNa+mPkPt5CnUK5E9tQVOX1LDibj6n
X-Google-Smtp-Source: AGHT+IGw80kl4ZXc9yR6ePSrRktKcGbiCTZafn6ezncHtVQMleospHvav/bCV/gWizv9s55n/3wlzQ+F9qTLlIn8Vpw=
X-Received: by 2002:a05:6a00:1305:b0:737:9b:582a with SMTP id
 d2e1a72fcca58-73fd9051555mr5917894b3a.24.1745615939152; Fri, 25 Apr 2025
 14:18:59 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250416001818.2067486-1-william@wkennington.com> <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
In-Reply-To: <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 14:18:47 -0700
X-Gm-Features: ATxdqUHn5xbT-hR3gBoWGv61BKKLQ9iPSFwEWRthVuTJRHfVClR_7BcDCNCHOtA
Message-ID: <CAD_4BXgO3F0JVKQTAZxLXjPXHv4Rgf2Cz+Cm0PMzLDTx5C56tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add USB Hosts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 15, 2025 at 11:52=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
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

When I send a patchset should I add the reply-to tags for all of these
previous reviews? Or just resend as a new review?

>
> >  1 file changed, 28 insertions(+)
>
>
>
> Best regards,
> Krzysztof

