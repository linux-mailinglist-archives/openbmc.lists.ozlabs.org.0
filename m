Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286757F42B
	for <lists+openbmc@lfdr.de>; Sun, 24 Jul 2022 10:45:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrGvm5KyJz3bmT
	for <lists+openbmc@lfdr.de>; Sun, 24 Jul 2022 18:45:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XMKD8Nu+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XMKD8Nu+;
	dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrGvM6qtLz305M
	for <openbmc@lists.ozlabs.org>; Sun, 24 Jul 2022 18:44:47 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id t22so7440972lfg.1
        for <openbmc@lists.ozlabs.org>; Sun, 24 Jul 2022 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lv3zYQALgYY1iSSRJ6c3vQT0Or5W0piyPXsF6s1qXTo=;
        b=XMKD8Nu+jwF+epSxh759innZceuNK2Bbw9dU7ztnxIx45oOakZqPaox2OvzAs013QZ
         Nh6gNZg7PGK3ONX/9CrIxeNtTjC66xDS6dT7ETZjZzOaowbI+d/6Y8+44v937IVGkSd+
         KMPZybjD5f7ACQR7H+9/BPfgLeKXBvOGUrjrfhPB5NxftKUyig+bivm0nk3z8IUqQKu4
         QFELteaFI5z8iPfUqizJi8x/E+Er7goe3ih38q7ECzw/OXJ0DzW3bv5xNsHdlQZ7o+1H
         ckgRUpJAWzOWvFfHjm0IwTVnJHW51Y4aQKrZdAKWK30cLmo+zgKoKtSlnnXqKZ8WeOZh
         Uxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lv3zYQALgYY1iSSRJ6c3vQT0Or5W0piyPXsF6s1qXTo=;
        b=NrkAcAPI/EbPBLKPcnikSo0QyXdWVRZLUFYYdPr6/JZzJt5zRH/gziOgvQ3s13jouT
         gGISuRa2Hq+VPJ3ESjEP5JhZbkJvFHkOFBxz25KmTQ8fL8fieEnGv1ariAzWgt6OLZz5
         GgiPICMGPvSBHn/xqgUFuRWW+Vp47HVf8Apr06bbdVyZFDGUqPj3gEo4xqd1Fl3SLK/Y
         CobScaj7MO5dkRl0c6tkwiLlLB91HCA0H9KkiNtDGr3u/avE+/qebvHsuOfPMpcI9/KU
         YlnwfSCMm5AaKthz31lEKjH0a7KSskUULcmJkOPz7aOBrTkz3EzDwZHTMbfuiJZLYr6X
         GnBA==
X-Gm-Message-State: AJIora/sTLN54Q41PEjFuWmFZkTHwx9JXYM4Hlga1MfCkl+4Osxktt1K
	d+sqlq8wm2w56Oxe+xuQU+MHgWD3WPq/9qjqkbc=
X-Google-Smtp-Source: AGRyM1sMjnyjs4vQ7R5Dp7jQ1b/Q/TvIyjqqZKfRGL4+99ObRiyjPqebsPomLEK3FjhrAd+IKrP3ZH2PFUr+abpBM40=
X-Received: by 2002:a19:6d0d:0:b0:48a:8b3c:e28 with SMTP id
 i13-20020a196d0d000000b0048a8b3c0e28mr304341lfc.265.1658652280751; Sun, 24
 Jul 2022 01:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220722114136.251415-1-tmaimon77@gmail.com> <20220722114136.251415-3-tmaimon77@gmail.com>
 <afae04e0-76a3-1bcb-5b47-9944fa9ab2c0@linaro.org> <YtrvyyMGm64hFG5j@sirena.org.uk>
 <0c8688d5-b0c1-8cc1-ec27-292acbb38dfc@linaro.org> <YtrzF9BFJrXfxiz0@sirena.org.uk>
In-Reply-To: <YtrzF9BFJrXfxiz0@sirena.org.uk>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 24 Jul 2022 11:44:29 +0300
Message-ID: <CAP6Zq1iRowFv4qg=AqdVmBRRx5p4-5AaC1G-aZs=2LnOAOELXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-pspi: Add NPCM845 peripheral SPI support
To: Mark Brown <broonie@kernel.org>
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mark and Krzysztof,

Thanks for your reply,

On Fri, 22 Jul 2022 at 21:57, Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Jul 22, 2022 at 08:47:24PM +0200, Krzysztof Kozlowski wrote:
> > On 22/07/2022 20:43, Mark Brown wrote:
>
> > > ...with a fallback list required by the bindings so the driver actually
> > > binds.  Note that bindings are currently not in YAML format so there'd
> > > be even less enforcement of that than normal, and as they're currently
> > > written the bindings don't require fallback.
>
> > Yes, the bindings document should be rephrased but we were living like
> > that for few years. :)
>
> The binding document as it stands only has one compatible, there's no
> existing problem with it other than the YAML conversion.  If we're
> adding something new that requires a fallback we should be explicit
> about that rather than have something that's actively misleading where
> previously things were clear.  I don't mind if we add the compatible to
> the driver or document the requirement for the fallback but we should do
> one of the two.

is V2 good enough? adding the compatible to the driver and the document?
Or should we use fallback?
If fallback is choosen, can you explain how I should do it?

Best regards,

Tomer
