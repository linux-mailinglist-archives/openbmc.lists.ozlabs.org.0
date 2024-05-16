Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD88C7409
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 11:45:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HcDk/PZD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg4vl0616z3dW1
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 19:45:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HcDk/PZD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg4v96z2Sz3ccX
	for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 19:44:52 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-61bb219737dso89706367b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715852688; x=1716457488; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv4lNrglqS4nAOAX/673bvBVveCRgVuJ/fLlNsqmFkY=;
        b=HcDk/PZDLIPpEwV2glWRwd8/sfgUi0lZ1NiLWbYBK+MbkkSMlEVVghSqTBNnvxY+1m
         YkVNjouniBg+C0zocDMSa+i7ZiO2DhX86POE4N1TRtbk2mUSjqFYtC/Dw178xL/l72DJ
         37Nittn5s2x3tw2fxClrflOrr9n5PThs0arxBh0nG52IG4py8vvBWQ/kzSQZvAjosAVJ
         TgNRPxNYSJYK6mbngFrQ1jSBW0zRhz5HF8N0vvv+FiNMKvVRNYkhXzWxKTpHfU+YDLw7
         KmeJyZMJo32tL9+m7+pSaqM7+YSGG46vluH0YyHD20AKRAzv5TeoPWYPDvRCcqglFors
         idUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715852688; x=1716457488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mv4lNrglqS4nAOAX/673bvBVveCRgVuJ/fLlNsqmFkY=;
        b=YKMBMuUChSptTmkPFcG/hcVZqh4j89Xfpq2MwR2JUd8HNcL3H0GkTiqPyN8XL9wxHZ
         aqbFUnMiSveSngZ4k+4vHMuq6iJ7wLFxd1uPeTIfmfv240YL/J0PQoBg3vKfwYEbmy1l
         tm2wdXeg7Hzo3LAeGI633ubnmi2B2suEMPpRWId2UtBM+/C+niDBsAvMF/yK87fdmkjf
         aBYiY9UL1c9ic1R2gYvExusJGFPbXd8wa+BItgM5ZYlWzJHp9EPAKlER/7fWJ+Ezjvih
         Y0rU9vgdqnMPRneN/4QoVF6ryVOHC1XekIXWI1qKrqSGCuKW3CloQp04O5i5YUEanvxS
         QM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKIZHVSVXrNOk+ioHIzVv8+UMUdiAXB3ZQdHVnhq1wQOdv5GFZMhb5Y3Myg/D0qtDWLqBcodMULWwGHW31xOx6++TN1EOiFtU=
X-Gm-Message-State: AOJu0YwiwFlnMPqIOF/HkLtpKPnCD1keBh+HVCQSO16fXwfkyk9Orbvw
	yValvMFLXf/eCyPUsE1LauXYEG5P3ZJBzh8qsQF73zLiDf1pL+WCX8B2FnA9K/3bNJK8KllzLGT
	m8rHzz6xXvts7/m2gwrJuVTnFNzY=
X-Google-Smtp-Source: AGHT+IGt4GOJGeaaemGwA4Ckt+18xxZfU1hLBTK3dGN/PrXCsjugWmUU80kcg1X7vu7MfI7i+fk+lUadWbYn6YM/PMQ=
X-Received: by 2002:a25:c70d:0:b0:de6:4ff:3155 with SMTP id
 3f1490d57ef6-dee4f2dae9fmr19813993276.16.1715852688597; Thu, 16 May 2024
 02:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192411.2432066-1-tmaimon77@gmail.com> <20240509192411.2432066-5-tmaimon77@gmail.com>
 <20240513155330.GA2676859-robh@kernel.org>
In-Reply-To: <20240513155330.GA2676859-robh@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 16 May 2024 12:44:36 +0300
Message-ID: <CAP6Zq1hRw6xfNKKfBFGuKbZk0su3ys6+hnMzqRWrZeKzDoKLEw@mail.gmail.com>
Subject: Re: [PATCH v24 4/4] dt-binding: clock: remove nuvoton npcm845-clk bindings
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

Thanks for your comment.

On Mon, 13 May 2024 at 18:53, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 09, 2024 at 10:24:11PM +0300, Tomer Maimon wrote:
> > Remove nuvoton,npcm845-clk binding since the NPCM8xx clock driver
> > using the auxiliary device framework and not the device tree framework.
>
> Again, this is an ABI break. Changing driver architecture for 1 OS is
> not a reason to change DT.
Is it an ABI break even if the NPCM8xx clock driver hasn't upstream
the kernel vanilla yet?

I thought that since the NPCM8xx clock driver hasn't upstream the
kernel vanilla yet and and in the latest NPCM8xx clock driver patch
the NPCM8xx clock driver.
using auxiliary device framework instead of DT we should remove the
nuvoton,npcm845-clk.yaml file.
https://patchwork.kernel.org/project/linux-clk/patch/20240509192411.2432066-4-tmaimon77@gmail.com/

>
> Rob

Thanks,

Tomer
