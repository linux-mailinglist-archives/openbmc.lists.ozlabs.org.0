Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8284A66A83
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 07:34:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH29l49K9z3c8x
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 17:34:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742279640;
	cv=none; b=RzLG29cBsOlnGRH+jcAYIqbSuK0v854l76qzfKNA/1nWEB9fJkMbzhTDq/0Glp1ZaRpK+FfO80vpvF4VG5RlKo7LRFnvj/pbEefUJ4ahOCT+vpnX4ptD2XoVczi0kNT7pfXSW3nNyqS5Bmk9hYXrW4VIbz+YH+T0gKXpPSi74P/3be1paRZmeFBDaWGja4y2dNZz/XUNDmqBQwumPWo4EnXz0GyFVjnwWQZCwMEB0bLPjseamOsi8vjlVzJkuKIHUH7/0F3tLDXarxx9lYGIotN6hH1UmI2J9zzQO1MLScWewD5h4ANAYg0CiZKsxGbstbLnaAokmwRe06wwjHCT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742279640; c=relaxed/relaxed;
	bh=Jh/c4R4dsLwT0KHsmAXe2nYKu7hkZRhQrjMuRdUu63o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiNUzNc0AH4Sgxzxz8Ldypi8R6/OonoYvYms6PvKzJL9UfcTMDTBcV+z23pazhaRlRa2E88O4vUVH2kBrmov9SZZQJSB2/4H85Qhyo4ZAXe9Be+Vjz+3a+MhyCnOwPn4zYL/zMAJq+4NXyWMQRBVnL6GpFzq3K37FXJ4Gf/cWtLH6HiKAXHuDcYwfGEpOCxtD3PWSVz/iuvD1i0JIkU53JDG4dh1Tl+mwIIf1PKBXTC9JjDoxj4Whs3APwr19ldQC5Mz4gHQzSX/U6EsBmCSHzt6n4MmkknP8TpfdXO51DRHKbWRFRVrhfL/pBAUCL++jZ8itEkdl77zyQht454E9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZYFGLqmK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZYFGLqmK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH29f6wTkz2yfS
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 17:33:57 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e637669ef11so4133447276.1
        for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 23:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742279634; x=1742884434; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh/c4R4dsLwT0KHsmAXe2nYKu7hkZRhQrjMuRdUu63o=;
        b=ZYFGLqmKNQnW3TMJa4hxn/eXSJtSpFRY00zYSpuchhsiRJtQOX02OJBmkyM01awq8T
         0DyQIPcveGrxTwQc3xyYGmMvGUvESIu3j/spc+RAIJFqSYrTlcwSNsFJDPFf8qaaRmd8
         l9Ilq0hfRDrwZ+UggT2PtVYimEWNxQsbONMCOII+siXXJzCz3cWbfk4qpB44+HmPc9LB
         CjTC9jVehf/WDX3Plgf77bkvayCydN5hJ+2P35JryL0C3qX6hWFvE6A0mkWZWiDpkg/c
         nO4EN0MyfAejQlQb5dmvGvq4zMVZrPTbauQHZ4sRH4O1DY15XzkzvlJIDXmxfzjAyMT5
         qCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279634; x=1742884434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jh/c4R4dsLwT0KHsmAXe2nYKu7hkZRhQrjMuRdUu63o=;
        b=pN0ztM9zkHUeIcMuyuCTQwMguGURyeUAxpbMPiZWemq3feY9g8zFNO0Nlgp/vypyG0
         EnVrg/pZMHBd4hX/GSioRSBvsAoYIgwHMbTPCeTJ+BcVchrlmvVAnCaN+OKgrCSj5zuN
         8IKsCNhqnI+cPp1im4O/rXKkyfdWBRtmmWDl1bpX5nvFJtMuiG1+NHnhaGdqyU14jV6v
         tsQCVSmcL+pbLdS6u86mDjCUH31p28Gl+Ou3EnpiWp9zi2HmkHp6E1SqgX5zyi+q8Cri
         T8v5TnLvk0IuxkDy8Vng8XIBD8eV+2uOx1Rrv/1QtwQVG6WYpUHluNuya1nksVDLcYTL
         hIJw==
X-Forwarded-Encrypted: i=1; AJvYcCWCM6HHO02sFlhFAPjMS2uvS3zFcBgrqTnVOwObKSNF2WVJUB4wmrquHTj72pMHppTP/UXSz0Ho@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDduThkKvQLQaW8ikiMuniRmU4aYYQrLGZKkDVr6KicRysCdyx
	xcxsZwV3VYtM3Een9JdWbEyboGKDHa6t4cF0Q2lT01jU+Pq10SFQ0VgMphHSkX3gfi7b2vMc0kw
	oM5TxaMgwouAvE4iQVr3uvPfPT18=
X-Gm-Gg: ASbGnct0A3tEg96mkMFDEEQSj3/NwMDbnVOXfpgLL/wN+lfUokpvZBhQy89r0I22a2/
	UYt/kONJsaZ2+9fRB7kn3npWzgiqdPrHaY6djdZj3ZKsUIt30EJMSCslMNl/6bqtFfp9HNQ/kJM
	jGNZOw6FoZ4zk+0Xx3AFmXAfCKzT4=
X-Google-Smtp-Source: AGHT+IELSIn5/BuHvlZqcoULDSggaDltMS8PE14gaoXkQgvkbGeEGMS2YRahcu5an6hVdQQfVhHyYYKUOx5w2IzK28E=
X-Received: by 2002:a05:6902:118f:b0:e5e:14d4:e63d with SMTP id
 3f1490d57ef6-e64af0eb437mr3891751276.9.1742279634060; Mon, 17 Mar 2025
 23:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240912191038.981105-1-tmaimon77@gmail.com> <20240912191038.981105-3-tmaimon77@gmail.com>
 <536f5393-478c-4a50-b25f-180e221ef7a3@roeck-us.net> <CAP6Zq1ioebnqgJB1B8AqD9UtMZRy5CDT8+_dXF_aBZEjjj_B-A@mail.gmail.com>
 <9a9de8bd-d864-4e29-89b2-91db8aea8ce5@roeck-us.net>
In-Reply-To: <9a9de8bd-d864-4e29-89b2-91db8aea8ce5@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 18 Mar 2025 08:33:43 +0200
X-Gm-Features: AQ5f1JoL-dTyRxBEx8xKcjtrgVDVRemqDFE0mk_w3MNt2XunFXr57UTJfuPgstA
Message-ID: <CAP6Zq1h2bsODnSR6kiVmtueqbjOtEShu_=EYHtw65SPGaX+bgA@mail.gmail.com>
Subject: Re: [PATCH v28 2/3] reset: npcm: register npcm8xx clock auxiliary bus device
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

Thanks a lot for your recommendations and sorry for the inconvenience.

We will fix the device tree and send the patch soon.

Best regards,

Tomer

On Mon, 17 Mar 2025 at 16:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Tomer,
>
> On 3/17/25 03:39, Tomer Maimon wrote:
> > Hi Guenter,
> >
> > Yes, of course, it works in real hardware.
> > The modification was made since the reset and clock share the same
> > register memory region.
> >
> > To enable the clock change needs to be done in the device tree as
> > follows (we are planning to send these change patches soon):
> >
> > diff -Naur a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > 2025-02-26 16:20:39.000000000 +0200
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > 2025-03-17 12:29:17.876551537 +0200
> > @@ -47,19 +47,16 @@
> >                  interrupt-parent = <&gic>;
> >                  ranges;
> >
> > -               rstc: reset-controller@f0801000 {
> > +               clk: rstc: reset-controller@f0801000 {
> >                          compatible = "nuvoton,npcm845-reset";
> > -                       reg = <0x0 0xf0801000 0x0 0x78>;
> > -                       #reset-cells = <2>;
> > +                       reg = <0x0 0xf0801000 0x0 0xC4>;
> >                          nuvoton,sysgcr = <&gcr>;
> > -               };
> > -
> > -               clk: clock-controller@f0801000 {
> > -                       compatible = "nuvoton,npcm845-clk";
> > +                       #reset-cells = <2>;
> > +                       clocks = <&refclk>;
> >                          #clock-cells = <1>;
> > -                       reg = <0x0 0xf0801000 0x0 0x1000>;
> >                  };
> >
> > +
> >                  apb {
> >                          #address-cells = <1>;
> >                          #size-cells = <1>;
> > diff -Naur a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > 2025-02-26 16:20:39.000000000 +0200
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> > 2025-03-17 12:24:52.293171764 +0200
> > @@ -19,6 +19,13 @@
> >          memory@0 {
> >                  reg = <0x0 0x0 0x0 0x40000000>;
> >          };
> > +
> > +       refclk: refclk-25mhz {
> > +               compatible = "fixed-clock";
> > +               clock-output-names = "ref";
> > +               clock-frequency = <25000000>;
> > +               #clock-cells = <0>;
> > +       };
> >   };
> >
> >   &serial0 {
> >
> > Is it better to modify the reset driver with your suggestion or change
> > the device tree?
> >
>
> My assumption was that the devicetree file is correct, and that it would match
> the devicetree file in the actual devices. I since noticed that the file is
> widely incomplete when comparing it with the various downstream versions,
> so that was obviously wrong. Also, my change seemed odd, but then I did
> not know how such situations are supposed to be handled.
>
> Also, it looks like the devicetree file needs to be changed anyway unless something
> else is wrong, because booting Linux still stalls later. Presumably that is because
> the reference clock is missing in the upstream devicetree file (the serial port clock
> frequency is reported as 0). Given this, fixing the devicetree files seems to be the
> way to go.
>
> Thanks,
> Guenter
>
