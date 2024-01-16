Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57482F4FA
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 20:04:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m4KuEF2e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDz2w1bdtz3cW2
	for <lists+openbmc@lfdr.de>; Wed, 17 Jan 2024 06:04:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m4KuEF2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDz2N1SBSz30g7
	for <openbmc@lists.ozlabs.org>; Wed, 17 Jan 2024 06:04:12 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5ed10316e22so93245467b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 11:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705431848; x=1706036648; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p0O8J1tKk/vVn8InKgNLS/4PstZ3a8iy9tIk4iRsjlc=;
        b=m4KuEF2eC/K7/AjZ5mzXY3N9JVBKivdCBlLBg29g9t+JuvTrzL28MUUSeyNcUOT9kZ
         y0DKGcZ4LgLXBGPjpfqOtX2jOr78YFT39b3DKSqgJ90nopgcEzPrabhrrig3J1Lalhz/
         lAKCaDtciA0OLv/26+XqNBnDpngYJnGHiUo37SZQHZn2qg3au1XQXxcbR7Q5ThL+OisW
         0jK3MKqI+1iZ1YF8xauk0qHvsNxYCdfM/MGFORGt/c6NTXYJXnfQm5GTSlI3b3lZWDW0
         /TeFkz2dxot3dvkAbarNFPM/Iju7WA39kyWY8Md89MImkrXKZT5DOwYuDX10IildvfdV
         cSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431848; x=1706036648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p0O8J1tKk/vVn8InKgNLS/4PstZ3a8iy9tIk4iRsjlc=;
        b=odzK1CTYngQprqMibWLAa0dlvVPi3Ug8ylU4nPJ3XgvhflyRu3qlq+wJB6OXK4zcjj
         d36bZpXYZNpA7KTBcAGPTgWXVRsmpmsR8wlsu1oCTmdhitQN1h70dwfrdOuKKbYK1fUD
         3+0u65WIDoo3LkclRNrCnTulA6xWnbUsrfZ8kxPQHjxUxOvVQ1+LMjXR27oa9cagfOGa
         aePlm7wm+pNlrbfF0E/YvtsMq0ErRYnE1uzeHyYuvWIIHIkaSe9dsIE2XuV31KRk8IDc
         5h6cvgi8BTvRtFXM77TzIljwvjJqOKaM+1Uiw5g0z0m07g8jtgN/4twQkTPWYhwx4aAC
         hd5A==
X-Gm-Message-State: AOJu0YyxUz5ea113I1SO/qh4htE0pb7SH+UAm42KKKfBAqsDlsX4hm2r
	cfVIF6t8xfKUeLZ7kLXhflx/glXBu09Lw3dT8s0=
X-Google-Smtp-Source: AGHT+IEXRnUGPJD1ri/U8Wt1UsnIWkVnxKEeRpoqtaXWVOvyxun/wO91g+xEArSw8LKoeOWz3vF8MWxtTZ4kYuvg0w4=
X-Received: by 2002:a0d:df8d:0:b0:5ff:5f3a:4405 with SMTP id
 i135-20020a0ddf8d000000b005ff5f3a4405mr651310ywe.30.1705431848648; Tue, 16
 Jan 2024 11:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20240108135421.684263-1-tmaimon77@gmail.com> <20240108135421.684263-6-tmaimon77@gmail.com>
 <4e9cc473-dbab-4e7c-ac7f-871a4025ef5b@linaro.org>
In-Reply-To: <4e9cc473-dbab-4e7c-ac7f-871a4025ef5b@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jan 2024 21:03:57 +0200
Message-ID: <CAP6Zq1ii49BFPAg_erhiu6qMj7zC7iLg=C-N1c3UKy7iEe9CXQ@mail.gmail.com>
Subject: Re: [PATCH v22 5/8] arm64: dts: nuvoton: npcm8xx: add clock reset
 syscon node
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your comments.

On Wed, 10 Jan 2024 at 23:01, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/01/2024 14:54, Tomer Maimon wrote:
> > Add clock reset syscon node to handle reset and clock registers
> > controllers.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 9c4df91031e7..7d5956e2c9f3 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -22,6 +22,11 @@ gcr: system-controller@f0800000 {
> >                       reg = <0x0 0xf0800000 0x0 0x1000>;
> >               };
> >
> > +             clk_rst: syscon@f0801000 {
> > +                     compatible = "nuvoton,npcm845-clk-rst", "syscon", "simple-mfd";
>
> This is not a simple-mfd. No children,
>
> > +                     reg = <0x0 0xf0801000 0x0 0xC4>;
>
> Use lowercase hex. Please store this feedback in your checklist and do
> not repeat the same mistakes in further submissions.
>
> Best regards,
> Krzysztof
>
will be fixed in the next version.

Best regards,

Tomer
