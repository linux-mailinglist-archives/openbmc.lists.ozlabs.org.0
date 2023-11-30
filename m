Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636577FF948
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 19:25:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MKCn0wke;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh4Pr6DL2z3cWF
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 05:25:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MKCn0wke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh4PG6mj2z3cLv
	for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2023 05:25:21 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cfa3a1fb58so13456847b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701368717; x=1701973517; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A6XaBmabZtFG50aNMROWpohKVYoF4xocW5H2FTxC+9Y=;
        b=MKCn0wkerkU3czGeP81kf/OG/SfIoBqilOJv8KEhcXeossgTSP1H8oAF+cZ6TmjVC5
         hvN95Gn4jd7FlFGxcmGr0KhSIhHWH6XHUU1eU8h2F5U1//J1QI28APPCnz6YJ3TXTIMN
         OjcBVu/ErgkrQj8H8IXDt/I+LzMc6p+ZTz5wrqA9xukgifI8YTtrNyC1GYyuTg8AO2C8
         qaeuzWq2VdC+dSVqAqttXo4a7XnlKYFgOTM2ACNDXe3IwUlV0dWccECTlT7SlFDBD29G
         KX0EDyhd8JVQB2pNsFkL+z4r9dQtxcq4BVYK1Mqm5BemwBBTml9oOBKgsskOGazz9LEf
         gQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701368717; x=1701973517;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6XaBmabZtFG50aNMROWpohKVYoF4xocW5H2FTxC+9Y=;
        b=dXJ2RW1vjVjaTMRS0wSq9G+pYARHwkfc7N2+Tn1hJzGX4t9Jzh85UrdmdFOL9U9l/v
         yvUZzbOJBPI09jMjVohO3LAJJORLvzuiSB+1yYRy6brWMP2YWse2z8kDyV/ct9mKeK2v
         Ce0RNz4U+GUJsdHQGJHob5e6BXCiakyCRw9nhuBMFlPfg8slYpwzhUmPrlf0NyaplCnl
         OQza9mIM3Z3V5SxrCvrj8NvTJJM9/gKWXdJNkJwROBof7LCvXIOjPJ7jSsAUqvT361yE
         q+alH8p52WPqZwB5/ySDAzeME85f0U9rD9JH+0ByvYqL+hiPm/o5hh6FvyMIZZgSu9hW
         jBlw==
X-Gm-Message-State: AOJu0YwEhXJU1RNKMkscVduRcI718K299aPJuG3OlNXV75O0NxmMXLe6
	NGaUSE6BzIM0YbZxNgaSdk24WjRuwbK9aEu0tCY=
X-Google-Smtp-Source: AGHT+IECxm8oMNxT8KIHQVCeAUTR2MGh4E9JHpb63/3Y4Q2Le8BmFXxYDbE4XWEDdDdN3V+Hw01yp8c1QDzp4GKgVyg=
X-Received: by 2002:a81:9a02:0:b0:5d3:b0c5:3001 with SMTP id
 r2-20020a819a02000000b005d3b0c53001mr1430153ywg.23.1701368717599; Thu, 30 Nov
 2023 10:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20231121151733.2015384-1-tmaimon77@gmail.com> <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch> <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch> <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch> <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
 <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
In-Reply-To: <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 30 Nov 2023 20:25:06 +0200
Message-ID: <CAP6Zq1gS_cX9t3bkvvEUAHh=GpBCW6N0vB7zfvhHMVkuxrCh7A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] net: stmmac: Add NPCM support
To: Andrew Lunn <andrew@lunn.ch>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, robh+dt@kernel.org, tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com, joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thanks for your input.

On Thu, 30 Nov 2023 at 19:26, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I will check with the xpcs maintainer how can we add indirect access
> > to the xpcs module.
>
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449
>
> It creates a regmap for the memory range. On top of that it creates an
> MDIO bus. You can then access the PCS in the normal way.
>
>         Andrew

Best Regards,

Tomer
