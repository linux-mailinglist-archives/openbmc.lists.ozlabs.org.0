Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF869862C79
	for <lists+openbmc@lfdr.de>; Sun, 25 Feb 2024 19:07:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ETaWJHoh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjWtT5CWvz3bsT
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 05:07:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ETaWJHoh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjWsy0vmVz3bsT
	for <openbmc@lists.ozlabs.org>; Mon, 26 Feb 2024 05:07:00 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so2351994276.2
        for <openbmc@lists.ozlabs.org>; Sun, 25 Feb 2024 10:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708884418; x=1709489218; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyB5v20Xvkeo8vLOJ5G7Ayw3XFpy9UxBMT1oM+PlACI=;
        b=ETaWJHoh+uOixuVQm8MiOlHISAFHth1uqaRvZvgZnfiypurM5xIAsA+ZsNajrUL1Dt
         0o8lwlpNRCst4KmVuHQDl8/GZymzD9jSsBuZ22Ks+buYmmcf9ELCnawSZz3NorbHZy7k
         bqlZtZQPtBABrMCgGBwBPoy7WCWFgy4XXij9gxzSueR0k945412OZo08ej76MBkFzOQK
         +EQipRk3lT9tjUW2gGddXRXVN4v3KkOyO9gRC4X5khWAErAL/kET3tUx+wt/nVzc95+e
         DVsSDxjJHGAdLrG26y/U3ukuhh0LCmIM1IJCETIHaXZe1wBNSoy39qUADHLfb9YNZk95
         CVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708884418; x=1709489218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyB5v20Xvkeo8vLOJ5G7Ayw3XFpy9UxBMT1oM+PlACI=;
        b=DbWEU9/VIqFH8az+8psIEzT+mFt1Z1Nn0NjeU0TE4i8I5XpDvli6YtQ6OqCOoVOziU
         bcvxb0LIYrZOB0lT3CZEHYrv7X6igUPvAJE5Aj8lWM4sozzjwnUq9SaePenhLamj1xV6
         G3LFpawjz55Frsd9DYt/9RWFHxSpSuspyl19grXglAm7q5vvTj76QJaoQZpDDB6tDznD
         heSHpX5+Jf69xdfkTl9MgI/MS2FEHyrCCBlTnTDncdMEf2o3a2d884lH972qOueTBidk
         XdgGgRA80+VqyQolnPdlw41bhZ8yLm3CzLd+PRq5LKFCxUxpzVaPRIj9XICL5vgO/gZ5
         8KXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgfgMer6SXf1gkTWxwrZxgi72/D1tj+WUFc494wAOsKhtRscY3wV+GJHYa09wPA1SMoX/nexSop5v4BtKwJXJH3G60OPle+X8=
X-Gm-Message-State: AOJu0YwjoNloMoq7oouM5X6o3M6lzywhhrIxmiy9LAWwg2VL1ta4Samt
	hon+ogE7gkAFWczKQE1mfIeVuMRKAk0ljKB5010J/fNuo/quRVh/boeNd2uAFQfj8eKiuio+ayd
	rcYzpozQg/xDXedCtFLYH733Qnnk=
X-Google-Smtp-Source: AGHT+IG+svL+R0QQtjbfole4iAKAk0sCbIV/24aVRBshgzy9tOplCpuFeVEJTnIBol1v6+b0OREk9APWtD3AvDe4zXI=
X-Received: by 2002:a25:9012:0:b0:dcf:464d:8ec3 with SMTP id
 s18-20020a259012000000b00dcf464d8ec3mr2767391ybl.3.1708884418030; Sun, 25 Feb
 2024 10:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20240131182653.2673554-1-tmaimon77@gmail.com> <20240131182653.2673554-2-tmaimon77@gmail.com>
 <bea8b72f61caaeac0ce112b57c28297b.sboyd@kernel.org>
In-Reply-To: <bea8b72f61caaeac0ce112b57c28297b.sboyd@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 25 Feb 2024 20:06:47 +0200
Message-ID: <CAP6Zq1jtYAg11EDrhJtzEOM+trKSpLuSbHPOx5ON93UDtr9JVg@mail.gmail.com>
Subject: Re: [PATCH v23 1/3] dt-bindings: clock: npcm845: Add reference 25m
 clock property
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Stephen,

The plan is for both the clock and reset will be under only the memory
region handle like
                sysctrl: system-controller@f0801000 {
                        compatible = "syscon", "simple-mfd";
                        reg = <0x0 0xf0801000 0x0 0x1000>;

                        rstc: reset-controller {
                                compatible = "nuvoton,npcm845-reset";
                                reg = <0x0 0xf0801000 0x0 0xC4>;
                                #reset-cells = <2>;
                                nuvoton,sysgcr = <&gcr>;
                        };

                        clk: clock-controller {
                                compatible = "nuvoton,npcm845-clk";
                                #clock-cells = <1>;
                                clocks = <&refclk>;
                                clock-names = "refclk";
                        };
                };

is it problematic?

But this commit is not related to it.

Thanks,

Tomer

On Thu, 22 Feb 2024 at 07:58, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tomer Maimon (2024-01-31 10:26:51)
> > diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > index b901ca13cd25..7060891d0c32 100644
> > --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
> > @@ -44,6 +54,8 @@ examples:
> >              compatible = "nuvoton,npcm845-clk";
> >              reg = <0x0 0xf0801000 0x0 0x1000>;
> >              #clock-cells = <1>;
> > +            clocks = <&refclk>;
> > +            clock-names = "refclk";
>
> The driver seems to want this to be a child of the mfd syscon. Is that
> right?
