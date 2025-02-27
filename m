Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04CEA48CCF
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2025 00:31:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3nfJ302Jz3cbl
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2025 10:31:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740699077;
	cv=none; b=XtaRKp7t0khKByMI9fKL7hWx2/3P/qZMneeIFg36NeGsHH8opsR4okvzOV6o+NSlaz/5xXBhNTzILia04WIRUWo7k90CPjKmeOlBLJP6dZO5IQcSrG5yoDibijxd9Ky8/ysa/NSVCi0fpoZWjc0vF8HcrHkbJx1MMLL3Kdw+j7Etjw/zAM1nc8YjDyt1vZcvBGcp0wxrdR3QLZ/71/vGJ7TuqbOuhBfsPaGiCsHvgfxjYuqpGNUHq2eT84Yo0o7ZfVx5VEKQy8LdHkl+qeIfz0vl+VJU19eE23JqaWu3zS9vLdn3r11SqtaV/dBUyIptbJSg0lpqDbD8c+4b2IVjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740699077; c=relaxed/relaxed;
	bh=IaHRDLSMhNHQ5jw1EyNdC2cl6TQcuWJ21bMzGALrB1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grqTI4ULtSO2JIK1BKEtWAgHv17ZWIF36+Pq3c65Dhe+P+MuoIEb4Qm2TJZdZfo00y/bJZwD9svLU57xpo55Q84ECmN9hVofZ4Q+2wXFpf+D9yOJRscWdJmmeF1U5+/x7aOql/Tvj9azm1tCGwJyrNFDxxSsItAMgVfneL5d05Hq9kjwdbMbAWyT8Ks8FImgmGbMJF0eM0OVY2pCJev2xil6vSSgmHQcluqJ4NsBb5LwH12JAGO3axG8/qM0UGhDvPjRlPbh33RNjTDITipxjlBSVYm1AZIPruffhz6GCsLfX8txqT776EGEtilirj/QfVeKgzHTdXtS4y00kkYDkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nc6noRtc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nc6noRtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3nfD01D0z2yXs
	for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2025 10:31:14 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5485646441cso1574248e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2025 15:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740699069; x=1741303869; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaHRDLSMhNHQ5jw1EyNdC2cl6TQcuWJ21bMzGALrB1A=;
        b=nc6noRtcAwMKiCHjyOyvkINd7HBm0r94N3UqRZP/NC7GqIVESHnHWAC7w1AnEiLrCz
         0V9BRoQpPVAgpxrqtBTFfDU5IGPvhaG/4RhqBwxAUN22wa1pp2krW05+hfsR2FTynk63
         i5m12B8bM9r6IaswQigZLOtkg1QwGvYsrliFHcFG2nadtiYnR5wR+bLjYJzj0vH89K3g
         7clhhn7BNm3gFAY5jE6OxXQJdC50kIkDVd4YOZDt6baGjei+kFkw+T/fCFkBcGzL8jUB
         G8a9hMmqGjnREUCqLUnoPr9DSlby3PMjtwWeanb8PzMsXDFBjIjosYMTO0iyfgoKDyj3
         humQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740699069; x=1741303869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaHRDLSMhNHQ5jw1EyNdC2cl6TQcuWJ21bMzGALrB1A=;
        b=nqZdV4EcQxK8D7uySPirbOQ9qreIjzhoKuzgnmr1Ai6BHJs8o3puKIqcoqfcCahPPM
         XsD+frmeEwgH2BjVBi9X+EclrArWuXNKXKQ4voFVf9GtwMhJ+q1IN2IVIx3wftamI6q2
         JneUA2PQpPFG5966K5/iKzPVYFxxkh5es1NTF2rLDGt/SOpDDlnJUpu8j01fj054ilVX
         GsAf6zWIyXtGCb+VkkX1y9sQOjOwhf43Wdr7tMIK9JgxUUiPCGM9lr5ctNZA/rULZZV+
         AEzdADPLwa3bC2dybmrkMTuM/qY5jltLDjyngZ96gCGPBJuJOhiXTJvY4pS+iy6TsqbQ
         VD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGRyUHeSrhowniWt1R0rmLAtFtsrBVQpPobGMmAS1Kr4HKF1V1D6mCd1NicvFpfncKRbFQ4Zv1@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzrimt1A/JfmtiFuFlcL1CofMRekCgNoUHCQt1Na6n3gV8do07n
	CCEIPzg8xv5gFrDqixBHVhjM1YgyZ2GMALTOIameArPXBZs9OqQte5k+NwDhCo9kWCR7ffa4CVI
	JNGyckjSYqvWRL/fIaDhdf8NMVtt90MNZASn79g==
X-Gm-Gg: ASbGncvnePG4wGh0VUtvQT7K3VqmWuwKrXDVV0SDJeVJgTn9mSbCjHjPLEvnXR2oRQP
	3cRHjEqhYn7XEyOOs+so73jwuesUofcMPYN9FJB1wv/PNYSF1/jvF4RK3LUW3ocwf/zbyB1ZXyR
	GCh6Yz1pY=
X-Google-Smtp-Source: AGHT+IGGbs1UVyEgAcakRDFXIeGYBdUxdhWfag9rAL0rT+OgOPNIr+4bssP7UEerjkTRNMc7dyVEUpBQezVs8eLvUok=
X-Received: by 2002:a05:6512:398e:b0:548:91f6:4328 with SMTP id
 2adb3069b0e04-5494c11b516mr580710e87.15.1740699069023; Thu, 27 Feb 2025
 15:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250220155036.2734838-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:30:58 +0100
X-Gm-Features: AQ5f1JpjkmaOs8rnxPzvRgfLNG60MoCpF2hC66NOqkW8z94ycu4HgaelFf-UG3c
Message-ID: <CACRpkdY1tgHQyU+s8HxfW=rK8bFfFsbz=Pa4EukOrNvC++4=0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: wpcm450: Switch to use
 for_each_gpiochip_node() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 20, 2025 at 4:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Switch the code to use for_each_gpiochip_node() helper.
>
> While at it, correct header inclusion as device property APIs
> are provided in property.h.
>
> Reviewed-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
