Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B54267E58F
	for <lists+openbmc@lfdr.de>; Fri, 27 Jan 2023 13:40:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3HGT70y5z3bT4
	for <lists+openbmc@lfdr.de>; Fri, 27 Jan 2023 23:40:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B16eeh7H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B16eeh7H;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3HFS2FKjz3fHw
	for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2023 23:39:07 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id d8so3856184ybe.9
        for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2023 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XwZuZwMC+f2f/AgCvMkCdUDxtZ31St7fTmiATBXQIEc=;
        b=B16eeh7HmWczjoVldqvEQlcUFdGq6GVI3qJ7ca0R+DKSBxhLu6/n+/kzHARW/+Kukr
         VOftiWNFcTb0fmDwtrtn1ZNw/o5EodIqxmBKlvc6lW+/12mhjdxMgvi8/MoK8Uo1Cy6N
         OVEKOWtO8tv2IMSKEzid+N3iYKnBtnDlz1KFcXzC2XcpYIR8Bvc/sa+Q96HAz5rpHBKt
         tnBrIBNj9XaIytwfS5fECPql+UohU59hAj5mK04bpXEI1tELvUm/dDSZcKXC/SeEewWG
         zNvFcgYnaGFu+XeTJc970niU8hj0J07AfSjaeUJX1A2z7D30EoSMqiCxopMMRQXSA8oo
         XAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwZuZwMC+f2f/AgCvMkCdUDxtZ31St7fTmiATBXQIEc=;
        b=gWZYWpB3sjn51jgrQmZMvVR0OqhtkwdFonJEzbebsMwTyD7zJhhJ6CqV6B/XYx16zs
         MtVseKEHtWd6k4u6NLxGiePdMx/i2IunUb7DVGl6GFNfXMBrj1X3lTG6LYbqC2XkzenA
         5u/eGr+tNZbLZ77vvVuDudWxho1GRZCbz3EqhmHFagzlGE/x84908YewFBZsVfI4sokQ
         a3zmieG6gFXgvExKf8qE2XsPPlBF9R4n/cFPLL+aijSsEKa7mNFdqMW2QH9c5j92zKU5
         zr2B7Y+IVLoy5NCI2FcAr99FH40xEE0ZP4KrEhMfDi2GmArAkPARPaVh0k3U4owR5hQx
         BSKA==
X-Gm-Message-State: AO0yUKVgR1gHmuSNxLlS47nQcjjxrM/Upx9Ou0YVYilshRewDNsEXNm6
	qdIWdTfHPBpXzxVNpQTuCPN2RYii0cNrxxVCUcSi0w==
X-Google-Smtp-Source: AK7set8P6BjVJvQtoZCgfykSubTY4hwEKuJfKzYmgIV1cELHLdH5Ujvw88+vwYhILkEtpv+XPIPlvnXeK5VtoxtBuKM=
X-Received: by 2002:a25:d884:0:b0:80b:66c5:9fc5 with SMTP id
 p126-20020a25d884000000b0080b66c59fc5mr1739203ybg.210.1674823144253; Fri, 27
 Jan 2023 04:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
 <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
 <e501d2fb-aaa0-470d-a8d5-5f8e97898df7@beta.fastmail.com> <CACPK8XfQ=uarsOgJ7LaXqLyGG2vSF-47RkAEV=T2gruapx-yfg@mail.gmail.com>
In-Reply-To: <CACPK8XfQ=uarsOgJ7LaXqLyGG2vSF-47RkAEV=T2gruapx-yfg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Jan 2023 13:38:53 +0100
Message-ID: <CACRpkdZPxZgWJ3jjiesOFGXmwzZFqeByZyx1VCy5pDWyVQHy+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To: Joel Stanley <joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Billy Tsai <billy_tsai@aspeedtech.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 2:54 AM Joel Stanley <joel@jms.id.au> wrote:

> As foreseen by Andrew, this caused a regression. On the Romulus
> machine the device tree contains a gpio hog for GPIO S7. With the
> patch applied:

OK shall I just revert the patch?

Yours,
Linus Walleij
