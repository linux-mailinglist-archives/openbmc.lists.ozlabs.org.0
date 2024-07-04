Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45498926F5C
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2024 08:17:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T1LDBbLz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WF5yc6M4mz3fS4
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2024 16:16:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T1LDBbLz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WF5y51QGzz2yk7
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2024 16:16:27 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-64b9f11b92aso2242177b3.1
        for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2024 23:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720073784; x=1720678584; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/QwVQD7DZqGPpuIGOACQYpRUbGNlV+gV6SgOCB9m6Tg=;
        b=T1LDBbLzZzzx+dKcpP/RthmIA1ppJ/NW+TiClymhljoc5OBRaFR77J3ksdyP99oN9D
         NQbuTHZwCTIVtVmlwXhac5/I3W7fb79c1KWpc8GLv7s+7wEoRZ5zDhnfdqUqcTuvErC/
         ew9qV8sCSwRICY6TujEd0Eb1RTGCIHanaHKX+dzmEHSyd3DcPZhofocxcZsRVf4yQypc
         ueSBm+U1yra2IragpAtyP+902di6lMvGsGuc5Z3sVlk2DdimVuyFHzxnygYz51ZvShKC
         jOfA3mG/Z+0b02HIP5Ckm4VCb5tNkUvKFtzg+S/PYyVCAF2O5vF/sAKP9O30mnZwmmOF
         Vemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720073784; x=1720678584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QwVQD7DZqGPpuIGOACQYpRUbGNlV+gV6SgOCB9m6Tg=;
        b=mCXAngvyyBWCbvjKj4AgPYg6YE227m1AeodhRWTgLq0h8SS81wilIQm5BNcZwZM563
         5fc9Xig0XsRxYTlTimQKyipcJCUnJAA1mcP2Z6R8lc0GqyZeSuxKDlal9BZXHpSJ2+uj
         zCxedMF/TsHsF8cWGs725MyfNP/Y4pveJJr0WBfcokBXL3ATpEQnZS6l1l2YIFKqUBYd
         /6/Kcufxexs11nOtGm2Vt/LJzNVeZPoO3YlAwOpGRnRBeFHgNJhI+T9ZyyNsErufB3Ak
         05F0a2CFud3aAQCa3B30cXJgLj2FayLYd+z1NRIOQvl7LfJ02sTeb1QxgeZ4zelB6mV9
         P0TA==
X-Gm-Message-State: AOJu0YyAs2hnvnVdp8fbS9QpElang8MVNIoBEkUyKYK72BO/FowUMGSs
	zaIIM1DEr3d5lt2C29fuj7V2EfpLplNwJayJ7EmM0IQ1PoPlNvFOyV7mJdlbcHPZfv0CUUVBIi3
	wJdm26h+USKk9csSqbbV8jpMRwZ3vvw==
X-Google-Smtp-Source: AGHT+IH2YeEzr1CslBht2INFZNPicv1E3yTqTatvwXDIto6U6kUUVkcQ0sfnp/m33AshFOwDwSoo86lEr3UqLQLqrQw=
X-Received: by 2002:a81:7c85:0:b0:627:972f:baba with SMTP id
 00721157ae682-652d61e73a9mr6981897b3.31.1720073784004; Wed, 03 Jul 2024
 23:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240701071048.751863-1-tmaimon77@gmail.com> <20240701071048.751863-5-tmaimon77@gmail.com>
 <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au>
 <13f82a26a526a33ce4a182a4da9e7a302a79d124.camel@codeconstruct.com.au>
 <CAP6Zq1gOHB=qmr9T4UjFvDsbKdYEHAeBhsXomM34C2=fONjf8g@mail.gmail.com>
 <CAP6Zq1hu1yBq+EzAQo=ghpAF1dnWDR-uxS4Lkq_KuDMNtPwJ_w@mail.gmail.com> <ab750cc7c5d6ad10a1f425b47b7a4113a9243709.camel@codeconstruct.com.au>
In-Reply-To: <ab750cc7c5d6ad10a1f425b47b7a4113a9243709.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 4 Jul 2024 09:16:13 +0300
Message-ID: <CAP6Zq1hO+6vVaQiir4xone4M2WTxLJw1gRkvSRX2v20AU0EaWg@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 4/6] arm64: dts: modify clock property in
 modules node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Thu, 4 Jul 2024 at 04:26, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2024-07-03 at 12:09 +0300, Tomer Maimon wrote:
> > Hi Andrew,
> >
> > One more question, for this change the clock node should be removed.
> >
> > I am afraid that removing the clock node could cause an ABI break, not?
>
> Possibly it could break other devicetrees, depending on how they're
> constructed.
>
> I'm hesitant to merge these patches to the OpenBMC tree without them
> being accepted upstream because of the potential for further breaks
> down the track. The situation is already too murky for my taste, and
> I'd prefer we keep things to a single break with whatever's accepted
> upstream.
Yes, I understand you, I believe this saga will end soon we are
doing our best for a happy ending :-)
>
> I recognise that's probably frustrating for you, but I think it focuses
> the effort in the right area (getting the changes merged upstream).
>
> I'm not sure how you best get Stephen's attention though.
>
> Andrew

Best regards,

Tomer
