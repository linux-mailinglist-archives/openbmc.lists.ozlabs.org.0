Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 012FCA35B83
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 11:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvSqk43ZWz3cXK
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 21:25:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::231"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739528735;
	cv=none; b=Ay11sZdnUfRdhBrCr9lXv6baYVBNj+Djx2CDLJ+nYOVpIlI7UX5bOocwqcSCnGdD8nS+NdoxMfSyTs6ATkMdd1CmYscdurjCExgnW0Yjg0v2Q34F3fZoRcT1mncp/EqmzVE6iarj8j6Y5cIwLeLaV8epzZsH2Lay74Sz1gOO+Sx0piETVZsQX/py1jjqRXia24yFU4WPHh0Eg3d5cw5Q8Gtp5MZ/1S5fWuaqomypNv4iA4meU3R+sopgTHtb4Jo8hhdpdOJHewuWCnleCYSFIZh8HjlHJI5lW8sEp5BtrVdmvgO4nn7LjUDkM3pdox9XA+GSJJbAE9Qppv1AwpN2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739528735; c=relaxed/relaxed;
	bh=k0ZA9ZOZTnv0fajLPHLG7bzzy2Bw8GSC45UzvaKQ3pM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jut1RSeA/PJZtVsvl34/A44lcKyyUmVzB3tPbr31m1bxMP99Uo0+OgS2f2W4Nm0QlxZTP1GqRAs1t3WsXrGzYVViwfdLL93/sdMcvFAohg/GCkMm8o2JzxqOODlGnBFGbnMQakly38yKMuI6t6GjZm9n9vaQ4GdTx4p3KFrW3cd030FpSgQ2VlYnRAiGoAzGeiqNoeONU6L/VDyPULA6hnBulewI+RlurpTDvHCsVzi8FujPy4jJT9gnzZkZm79ULuRrtP/EilMTUNtqnNvamZWQr4dcoZqPYMKAaahYDIqH28U5IO7RnNpa0DJjiNJoBG5KYBkx1JTO6AWBbMsILw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BJBrMDAc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BJBrMDAc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvSqf2vcsz2y92
	for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 21:25:33 +1100 (AEDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-30795988ebeso20173761fa.3
        for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 02:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739528729; x=1740133529; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0ZA9ZOZTnv0fajLPHLG7bzzy2Bw8GSC45UzvaKQ3pM=;
        b=BJBrMDAcWeTV7l0986p+9w2F1Jv396FnlbQXlpmL2lfDAn1NdMa9I0b7EubPMk5zrc
         ohBOkGrVsMKbDox4TgwpLRlnUPBfd0O0QxOWLp234KoA8aSvBEXkU3wj549EH8XYxloc
         0kElubLKNgueHBKRa/YrX+ORXOX8gHoWcV1oMeEoSJdnsaoFXM+KNWLZa/v5G8LyLZOm
         UKm7GdaZeSkc2+MnzX/FTOhQG7HGgU5932JwyF6JHskcLKzc8gzE93L33dyaI9ygsXxN
         dQBpiIoOyHpFr4vkm0TZrM4Vwb0FlV+eJtgpS8opyQ5ePuoXLAUuDHmR3/nRwcEQoVep
         G4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528729; x=1740133529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0ZA9ZOZTnv0fajLPHLG7bzzy2Bw8GSC45UzvaKQ3pM=;
        b=g736P1OAeLA5FlnuvsZRavkdaCFc224Ouh6HaEvWE89gLJkyG+weSTfImYLquIxViP
         1lWbE8pGTgsidWEQ1P2iqCRjtbfQaHNTHHN7t5rsJB/VgQXGcCmOdxuZsG4w0/EYuc/9
         bEfIqP5pDYekOq+fMFXFn0I5gBheTDgKapCCRZanLVbbWHq8uEd/h+nD5SW7fsbhFDFf
         g3hB9E43xJpCz6G2GEtE2nToxP2dlidnix1qjLVI5+w/MpRe9g42mkRu8lqtlEonoaHA
         2CS40Xn+EQ6vfEtjwpODNUA/VONg642NXC8AY1y6abPDrW5Jk8njcRB9611jCifklG00
         i7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXhmhMdPHcpO/B5Smad8cAcpphHmKs6CdPjTU9mamWhW2mLV7giB4j/HTbzl+T2IeQFfPVNCtf3@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywfq/Qox+sxpQAh/2f4pVB4SGQ13BPV6S7zLkLGUBPK+y+AWuQl
	voeJ46GM7mXTyFX0d4/ojgeNusJ6FX06X+GFQdEpfr98mJ+y6G5sSQ7c1Iv98DzdvPcprKymedI
	S07DwY6NVktJM+J52vAywOTVUvLctbk6jtc7Ixg==
X-Gm-Gg: ASbGncs0A08LU/UsykKwAtDOXkYz72zLH9LqFV0cQnio8qsvFP28ZCKF1Q4dDXUoCob
	2SXO+pyQHKADY6usurF6US34yiSUtsxMe5J08fAkQpl/VAYlL0Is2kXjTxFmFNGg5aledcoF4
X-Google-Smtp-Source: AGHT+IE9Hh8FY7yC6rWfR8h5HiUv5X+JqNPHfu9DuGImiZxAFDUtqBx67po7/8F/mivoIIRcv6W3Us9lZpgR3fWcZMk=
X-Received: by 2002:a2e:a595:0:b0:308:f580:72a4 with SMTP id
 38308e7fff4ca-3090dcb712cmr21363841fa.1.1739528729288; Fri, 14 Feb 2025
 02:25:29 -0800 (PST)
MIME-Version: 1.0
References: <20250212100532.4317-1-hanchunchao@inspur.com>
In-Reply-To: <20250212100532.4317-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:25:15 +0100
X-Gm-Features: AWEUYZm3QlH_GBZnkUEfNjfulhzgaPXWxFksRd157QzemkZUnJaOAOo2a3cEisA
Message-ID: <CACRpkdbiNg66sToZ2X+G7J_qJSTpkRj1BgWbYX1_YmbGKdCmGQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: npcm8xx: Add NULL check in npcm8xx_gpio_fw
To: Charles Han <hanchunchao@inspur.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: benjaminfair@google.com, linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 12, 2025 at 11:05=E2=80=AFAM Charles Han <hanchunchao@inspur.co=
m> wrote:

> devm_kasprintf() calls can return null pointers on failure.
> But the return values were not checked in npcm8xx_gpio_fw().
> Add NULL check in npcm8xx_gpio_fw(), to handle kernel NULL
> pointer dereference error.
>
> Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driv=
er")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Patch applied.

Yours,
Linus Walleij
