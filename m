Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09955A6A2EC
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 10:46:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJLLb2dMnz3c8Y
	for <lists+openbmc@lfdr.de>; Thu, 20 Mar 2025 20:46:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742463972;
	cv=none; b=FiE/FDwpPl81Z8M5y+DWt9awNiLtokgF5UF39CaCM0jgR7LTYREYXkm3dByzPpsYtYS2YM0RxtnnzYyS04QCNT0ybHISfkvB7qq2st9dDptEi/GumBIKVZRuElnkzMXVvsHKDSE9yqFdzCxGv4oDBBRchVP2hUFTHaqPZjHo2H5FHewnttRoU/jYnA0miqvTWBQND3coW2vmX5XjRhNq5DXIoLt58cVPtuYGyRKoLVN24Amzmj387x7eo5mS7NaZKJ/KzI6SfdpxIAg1dBrcAK6FBbAo3jZvL4cp4oXKIS/NFtaIvt7nnp7H8DOxHLruB0BrBM1/PPXDfBGqV0yWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742463972; c=relaxed/relaxed;
	bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4ex7ijref/UpOqnrSmaBHwdVLRJ6n9UkFKo5CvxhRSl43GN08eDMneUgDCNXgy8jUcv1DQMNb5qJ2yzyrG+U8OPbffN8sOXcNOBsfgBWEdSDo1mONZweGv5BWYw3tiCPRHv0C+HJ4pbJ4/UtdUgZVrhL01j/pN3b1Da6eRcN0XbNeBb9jsCIpfr8nxkemuPjKRihrKC7P/MPgl4F1Zc2k6Dr90G1VtkL5vwGyNxKev98uC0xaxS9jFalqAiJfMSdzS2BpBWg48aHI6er7/Io7GcjAvWbv/cY9G08RCgh1spszfgwZVTFL6uWwnotYZZCHCbyc8ipK5sXLxE3ZZJyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N+nH/huA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=N+nH/huA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJLLV07CDz301B
	for <openbmc@lists.ozlabs.org>; Thu, 20 Mar 2025 20:46:08 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-abf3d64849dso102179966b.3
        for <openbmc@lists.ozlabs.org>; Thu, 20 Mar 2025 02:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742463964; x=1743068764; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
        b=N+nH/huACQ+xbtz1vMAXa+rlakyzpEdnGuN1kS3YpFrp5HkzV0zftMQHXcDnVc/5G/
         Mu1QlmN/ILrk3xehHG3ND09sAoM5HT+gBMzBqQqHC80gJvFXJ5SOGFGJOapi4bk2182A
         7KCqyXPUfPHdJxK/sb+YomCinwWcv/C8+cI8O/Ci15aXVXTwtj30RMlPThM1OWK3YkKT
         oz7c6ZfhEXlg+fRH+jCjQak0vmabELe8GflHF1Kahr1mcaqW3b+BHoNdYX3RjbrN+0Na
         KR9/bZH5cMmVZ9XNzF0wlNjW2Ny5bArL7bsqS+1Iv7D0c4GY8fhwEBBhEm3zprry11X2
         Pc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742463964; x=1743068764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KEnR66BBq0/OEh9u1+50TsTpEWKW5YWZxaSBSaTBiA=;
        b=ObAC6fApmnglMz2xDHA61Ax+1Q7O30YcHIkAwbgWstyV4HGsEXL3h2bfUzPfxhMxVH
         4qMaTsnGp1gxEIHNTj9RmzpA1Z+mHUxjTR+RK3dYatXzk9J26PBNxS2lzFepH5vub1w1
         neNHjbDRqhVevAX98pgBpXMcwmvtlZPNYGeMfqubIxt3c8uP3JgJqinM+CCn7FUwa+t/
         p6TfRgxOqZRiL9bsvgQlOidcVK1P5ZFR6ME0egxlpB00Igi5cztbIcV8qr1epP+aUqn8
         pBO33bf9EQdKDb5ut0JHgS5YTtFHuXG/XAdLJE7yNZ7xUs4QR/EcJ1zDX1kUM0iq8EKk
         W3uA==
X-Forwarded-Encrypted: i=1; AJvYcCWb3WRagy7ppoRD88sPyZXk1wZLDMp2aaoG9Z/ttPN7QXmYFV1I+L1Q6uEPDa1cFFyDGXILw1aB@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSSH914j0EFsPcLbux37li4pSxp3cFHTaP6TCzZrdXmxjnlpf/
	zPKIg157+amT2x1AtDLfjn+17Rj8uREovmvMXRAvGh44ju6oxgaCFS7KEzZq8xJ4JlEZbNp6+No
	w6swzqX6BdGPyyTSAR4/SWG4pZjE=
X-Gm-Gg: ASbGncuMYbONDSrGFl3AG5BUnvcS0Z6l2J9xrNEzVy/r9EkeNRmbbaAvzjpTKPZAHeK
	om3mpG9e8TH9dSzUSsmuACizYeNvUAhNxH1PWp/YyuLDAf1JnDtJqvj9LHw74saEI4xfffa/1Zl
	nqVJrapuxd/KrZZejGqlbE8MV1r7snFbu1d3S9
X-Google-Smtp-Source: AGHT+IH0WgeCzcPbZMZ7RcmmYI5xx52o7t7ZMdyfRJZKbVhCltB5dB5p47huOWOMje9qXnxDbQEClo4vl/rS3uHSu3A=
X-Received: by 2002:a17:907:980f:b0:ac3:cad2:9e53 with SMTP id
 a640c23a62f3a-ac3cad29f08mr325129066b.55.1742463964281; Thu, 20 Mar 2025
 02:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com> <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
In-Reply-To: <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Mar 2025 11:45:28 +0200
X-Gm-Features: AQ5f1JoOVMLoM1UFlrLmLsYwzq3tsN7OH81VeBc-t7MFZOdMOMyvVlUp33ImP1g
Message-ID: <CAHp75Ve_cF=zdZuZxSO6H1FXrCbAc1EXyHhCWw8K3Tc_Q2p8tA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
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
Cc: Jacky Huang <ychuang3@nuvoton.com>, Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-gpio@vger.kernel.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Shan-Chun Hung <schung@nuvoton.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 20, 2025 at 10:15=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Mar 18, 2025 at 11:59=E2=80=AFAM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

> > Convert Nuvoton drivers to use pin control provided data types
> > and more of device property APIs.
> >
> > While doing that, fix one non-critical issue that sparse complains abou=
t.
> >
> > Compile tested only.
>
> Patches LGTM and we are close to the merge window so I have
> just applied them.
>
> If there are any issues we can surely fix it up in -next.
>
> Thanks Andy!

Thank you!


--=20
With Best Regards,
Andy Shevchenko
