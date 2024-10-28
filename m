Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24109B312E
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2024 13:59:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcYPZ22mQz3bxL
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2024 23:59:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730120366;
	cv=none; b=Iw8saQhpjycIWWpHJ2ciXPDYRK+mRSo1PCVL0szqrVNAVq2huQCxNLN5h1j0UpM/TUaGgr28FoBlmsYdj6tDz2omL+Ht+YRtlXi86tdZDuYFo5hJLE2Q8zyRw1duNDNwhCQ62lQVv8ZOFjyA2O2/Jg1gxM5KCVeIIuieX8kjljVHZyIzPGhhyySdqTEyIplhAZf2bbuQ7AXKzRNhUPsTVqiekoNwGR3K2RVKz8N2gqxHzVlehSUKibTj7h6+afjsGqpemE7C8dPbdfc2xcBV4WunhKR2pPnkzeFN24SzFsWwjVXIta6Zpk9sEA1qvu40z3jXU5QetJaECvjSJcrgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730120366; c=relaxed/relaxed;
	bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JqFR1SCKOR8Q1ilkYzS/V3LvEeqUoPtjUL5BbADBz9G+C82ChhAncJkbWyAFSJQBmTPtI5o4B+I0UaoUJT7/SA5uKvWVVDI+3JEzT+kRlGfQt8NoBpUolAAuXrMmVgMPBKop7Xhg/UVdaJQaqfqtZt5Mk8QPz+hAeOvYg/ARy6/OXeScAicUT0ZUpweSMzlJxH5I0NFlaEMJHB0VF4M1a+bA/6Y3IFPvelz0YesQWL6t7tgKppwDqlDa9Gp6y6wgx/eZSRgI/YsxCEdTWeukSIvEu0vwAlnwsR0gGWsonXtupdhXuCydxJSY86DYjuzPKvPm9eidQtK3Qho9COkA9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PrxdT6uZ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PrxdT6uZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcYPT23JXz2xy0
	for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2024 23:59:23 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539e3f35268so5070888e87.3
        for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2024 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730120357; x=1730725157; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
        b=PrxdT6uZhTeCaDKBvbaogUyaO0+mKLCCWTNtZkfZbpToif/WRsSb/0vIaJzJz9Z4p0
         yB9OIu6sJB/TKsDab1kiTrVn18KTaRA+gp6PDW9xJq/P/EeW8IR4SSicVUCPiuawT3YO
         bq16OtFQIQYlIT3mYYwxdsLDNrURUSuNfsm4Irmm7SKoXDBAyEiJCEI0XNrksfIN7hfX
         0zgzrdNRkdM29XMHZTODdaiqqPiydXJQM6C4vDQFQR2/xHOMbyWNM5kk8ypJ2fSaaBy+
         RHFgzLnHDnkR9MhSpvposFFk9hLwYhfvi+ROhmQE5TE/Xvdf8Snx+TE2rlRCGWKxR3IK
         v01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730120357; x=1730725157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FPOv073XmotRWP+rOXc9l76Bgjr4K2jU62eaHorWlA=;
        b=qq7IeRrTi9fqyk1uiEnw1CBEk3bN/xeyNifigdzUY4fciJdxJQ8luK4qa56Y4Zd64x
         TzouE+O/tVa29ame0t+s7gFwPuqwKqyfep87Iw62vIAn9EAEmulju9jOXGUMYBGxvYQ+
         QA3dRyN2TnanAj7/LcVJBVzZfgDsguGuASadRCue7e9Pbys99mAUUDBjkdGC/WXVXZP0
         /ASLWTBgKdmI4jb1CFSkEDTPQT38PWLiV19HVVRHzng7AfGX6FBeDtbyd0z4mb5vn9cn
         UfICBuiUZ1VmvZbZPsbqQROtMHfrXzHbqtqGTMdbx8Jje0FanTNsEjvgRz/8nQdfvNz+
         8Cdg==
X-Forwarded-Encrypted: i=1; AJvYcCWL2/c9wl0otEZfr4sn+CDk6JLe13tbF6ktlKnEHkHkNbUORrUzRTrSQgdyKiZKoApgdnzsZZjL@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRsEikLb1d48iQT9i6ueAPmNlSUVbCgY263+r0TD41Lo16klJ0
	RliEa8yekVlyyngxrDxIRfHIycZpmpqKg7xXTWWp0p2uQnBrR7pVR1dy4sebETsuzbMzs6k9P0a
	0wFSvHCQitvpRppr1qKLbHlfaOcitdroUCktmpQ==
X-Google-Smtp-Source: AGHT+IGx7tfNH0mZRuKTFpu/Lt1lVaJ5wzth2GIk/zrU6MEJ3/k+kc+DMdfavO6Q5ppLTlt1sP5ACchOTuFdcWBszp8=
X-Received: by 2002:a05:6512:3e11:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53b34a1b681mr3290500e87.48.1730120356663; Mon, 28 Oct 2024
 05:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20241023104406.4083460-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 13:59:05 +0100
Message-ID: <CACRpkdYEbczXUFD-CFpE6SYiqhwTdxS+w5+dDtLF=2BmeiJeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Support drive-strength for GPIOF/G
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2024 at 12:44=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Add drive strength configuration support for GPIO F and G groups.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patch applied.

Yours,
Linus Walleij
