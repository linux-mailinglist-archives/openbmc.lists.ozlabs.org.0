Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D038DA3D125
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 07:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz2sl2dn9z3cTv
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2025 17:09:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740031784;
	cv=none; b=ZwVi5cW+qsC/aZbAPzP6vza0LzbkZYrh9/ZAweq/nYZtc9C7cVlM5siYu1EOgvCWlEp7sNXZjEY872f9x8tVG6jXd+7nq3yTTrs/moaMrDC9DlHwFEsrDVYkT5+mXd3mjvn3GSGGsFOElcLp0z1T9sQZfT1DfXGz9nFDBbPQedkO8TemE8j4GS45gUBDYI9yofyMRoATiT+90dwI6YASdRERcjHcOgsQvnw2TpZX3/MR0J/To8YMP3Jc9Tc0Eg6RYm3yelS9CtPoeTOWuOPYg4gTZSy9gJQ6WG07G6fClm5D2WpY9pbsdlaSddeUaH1MNIfvMNLKqssQLEqoyXyjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740031784; c=relaxed/relaxed;
	bh=YB+a5+t2K2SUKgQ/pKHmjYGw9OX5zZSaPIGBlRUmprQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chfMsoFvTxJjLyLNjSYOk0j/Clp+AXVZ6giub9b3cYePaK3E91+abTPjjN3baoiS+DeFIWZ4Dh3sMIj0o3DCv74P3Wnv5QbxNsV/H1rqLvqQTWC60wdQdkkOoORqQXPyB3k048RDDnew+u/m1Kg4iUJBmpXq0fjt3mBepSHjwDdu1XE+vvOj8EJqXmaNy7Mfe/keE3MlWN2I51minAQ6Fdb7sK/ruv9ydOiyYAk8rGCeD86APOYCOAB7fQHTyLwv320+/uMoJP/BeUJKjbiOUXocbJ4R9KMiCneyaj3iS4Hd7NpfiENhi5bOyZ3RqH8AmUmKJPHtu/hg/+7FJV+8Tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nZ9FGFKi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nZ9FGFKi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz2sf22t0z2xm5
	for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2025 17:09:41 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6fb95249855so4720837b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2025 22:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740031777; x=1740636577; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB+a5+t2K2SUKgQ/pKHmjYGw9OX5zZSaPIGBlRUmprQ=;
        b=nZ9FGFKilsdSazAbtnUkOJUtdjnPSqupcgO73YvWhtjWEXykAjOiNyFmxTRpfbIqG2
         ARIxTK+ZJ3mNhoAD7gIX6LiPEuk81Nh8IWEXAVBjefzaKLFW/7KsNg191AeO0GDbRE6K
         teZlxDZDylCyAOlKbSTBEvgsuYQKXppyE0p6LDg80wb/XA66i9J57qD7nMMsI9+qBcAa
         blFfZPwElUiNNjekbMQPLKEXoyYu00/PJqv58Umf4r/Dwz6BwufMVRKwljljV6vXw2Kf
         Uvi35MSxHrxS7yKlbU+g78PwZyhEjR7YLcOFt0pWlwaXaguSGLzjq8rTzXXURuki/UMb
         v8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740031777; x=1740636577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB+a5+t2K2SUKgQ/pKHmjYGw9OX5zZSaPIGBlRUmprQ=;
        b=oBlOCrAhm0Kx21WIAaVLIkaQ0RBwr29f2d72EWYRry+cWHpFgQ9+ZVlm0nhTu8RmVx
         I1+ElSjbpd49lF6kNS0gCdkFp6FdvvG3hGdmukkQx9ccKOiKf32JndKpek/mjxGpoReX
         8uPuSYDtsbLDEBdrt4Mirx8Fl3yKB53ZBJDxS2jKY6vVCGqhvCyva1baUP3A5ZnzWgsL
         t4/U0JEZGnAFcxY/+RdL8bLN51w72EEWnpKTFmlyYbUHvJ+Rz9uvPFGbqAH2etCqX5td
         Vytgzl8URGcPykYw6l95kThhrGg+xNCvdIIboZUT5I8N8qGo24YI7L7eSLPA90nYBlz8
         D+sg==
X-Forwarded-Encrypted: i=1; AJvYcCXbyAbPdaVwRYLpwqr1BgNAXZZgEK4n2ii0ByV10SeuyS2UkRt+DGbCayKKbB1UN3YsepDDV+uI@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywXuYXUrclBEtdiwp9ujhOa5H2ggvsPOUpoYGgjxm9t5nyv0Xv
	3QS3KcMSmjzRb9a0CuNEVWsMob4NnZwJ5UP99dPr73dkTOxEEZQpFz81W+UGiw1lVfn/DGKZmOO
	2Q7IKFS0dOv814x4vlL99wLzrzgY=
X-Gm-Gg: ASbGnctj7RWimDEmqMatbVNPnjBWu0BoYDt77D20d1qfPOMFeHJ+bNnp4rr9MlmMyqV
	dJKa7VWCSE8LC0G2+lGbm5gttMgJ2gLavQIC5LgIf7idoWIgPFce8HnGGxNFOChthmZVEU69hkg
	==
X-Google-Smtp-Source: AGHT+IGAElPuWbcNKI929Lc7rJthMUbISUeHmF4ulGnrR57bxWEQfnU1NRee+Js+2fQ0Mu97EdPqEhBqZsXJ3FHbtn4=
X-Received: by 2002:a05:690c:d94:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-6fb582b87a1mr196021137b3.17.1740031777627; Wed, 19 Feb 2025
 22:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20250220040029.27596-1-kfting@nuvoton.com>
In-Reply-To: <20250220040029.27596-1-kfting@nuvoton.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Thu, 20 Feb 2025 08:09:26 +0200
X-Gm-Features: AWEUYZnYGHaHjbR_KZEvGNt2rnhpAOwHjPZjRosnVh2OXcXgXdeqwQTPA_jCG9Y
Message-ID: <CAHb3i=t0sqAi3ufXf7KAhz0B_u9JpsXmKy8p19aV7qQ5z7G4LA@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] i2c: npcm: Bug fixes remaining interrupts
To: Tyrone Ting <warp5tw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: KWLIU@nuvoton.com, andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, tmaimon77@gmail.com, linux-kernel@vger.kernel.org, JJLIU0@nuvoton.com, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks for the patch!

Reviewed-by: Tali Perry <tali.perry1@gmail.com>


On Thu, Feb 20, 2025 at 6:00=E2=80=AFAM Tyrone Ting <warp5tw@gmail.com> wro=
te:
>
> This patchset includes the following fix:
>
> - Disable the interrupt enable bit to handle the asynchronous smbus/i2c
>   interrupt status after the machine reboots as the interrupts were not
>   handled in the smbus/i2c transfer session due to the reboot.
>
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
>
> Tyrone Ting (1):
>   i2c: npcm: disable interrupt enable bit before devm_request_irq
>
>  drivers/i2c/busses/i2c-npcm7xx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
>
> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
> --
> 2.34.1
>
