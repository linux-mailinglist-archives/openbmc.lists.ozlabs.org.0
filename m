Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A41F6875B09
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 00:22:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CZGCP81L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrQLf3H5Kz3vYK
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 10:22:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CZGCP81L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr1MM6qjmz3vb1
	for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2024 18:36:31 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7c8395e24fbso32243439f.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2024 23:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709796989; x=1710401789; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fx8njYwzC6hGWbKta7FmPx/KT/8cp/eNI08VENesbJg=;
        b=CZGCP81L2UxcU3WE3yMghxPOBLTeAzkwfywX3pd+3ZpoG2/I8OtDmKAsgiYRcpnDAF
         6xjd1Avdvor3bhsyzW0otCkJsot/nOSdPH5TSljbObvSQ/pDfnFIAGXsfCKi7UUS8Oub
         19DtDmzMOIvrqp340CT44xQyetm5opcf1VeEmY0Z2nkDqMtePtcyA0GwFXaWN1u0nLB5
         v4J4XzrYlxRsnjHpHH1KGBgKfXaxSXLBqPRe9bml6Vk9hOt0cy8eoZdvXnHVsUn+Q0uy
         Qgg/O25paqie3NnUnwGdgOK7Xnz/jCW9pGLa1PiEMNsFMb+DfGOjzTwKJwrtDyO6GCkE
         rMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709796989; x=1710401789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx8njYwzC6hGWbKta7FmPx/KT/8cp/eNI08VENesbJg=;
        b=xNuKseyON7gjoJMeo/vPB9IgLq2REydca8TlqFIX9ZdZpr4ULSegN/lKb4AzDz5p+V
         NOR8Z5K6lHr7hrbBqfVgOKnLsOPDTMCHuiWh5RcrD/bGqq1C7n1VFCjxgZoGczp4H8X4
         CzFVgAf8kdfmhbRJEkbWKNrbNlT2qRZI4YosgQRqVB39TNQ45q4gsVUVTbu7uE9XKJCs
         w+wjB7UDy6vEIpDtj9EbrrsYCPDIa/iTXMCjyafb3SnvHPbue0yJTMRSkVk52gUzx3ZK
         WEbAAWms/CnklFiGxvpbaWNoHzXuDe4Tpjz+gmZgZ1SAHcOyr2d7urSaCbzshk/p34Yg
         Medg==
X-Forwarded-Encrypted: i=1; AJvYcCVjWJwykUTc8mynMqSp/gYfG0vLcxJIAs1W3sog9ycE8pPY7lFzkE3pr1DXKPLaf/RC0p+ZeTCjn/Tu7LPsdfq+UWdvIa38/eE=
X-Gm-Message-State: AOJu0YzzxSVCCmitJhSEZVW7nNXpqHzFp0TGw3l6zg96inLuDmgfCq5q
	G9kdbC9C7d/yJD9/4HBVyVlkC5NGCom1MwvQKvScuXbNvD61Pxx/p+i3AnzRAoLOlgwrFPqvd+r
	3k8dZiUuu6RhamfB84k52xLMIjfo=
X-Google-Smtp-Source: AGHT+IEWCigYTV+saptQ4gGC4reoPMGeVcdmhGVWHJ86cLwUCk4dX5rt3k+tEVetuW7boDKccRowap5dbDW36xA7qMQ=
X-Received: by 2002:a05:6602:8cc:b0:7c8:60c5:cb14 with SMTP id
 h12-20020a05660208cc00b007c860c5cb14mr9300580ioz.13.1709796989544; Wed, 06
 Mar 2024 23:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net> <cffada5e-0f7a-415f-9c4b-7c46fac5cd3a@hatter.bewilderbeest.net>
In-Reply-To: <cffada5e-0f7a-415f-9c4b-7c46fac5cd3a@hatter.bewilderbeest.net>
From: Ban Feng <baneric926@gmail.com>
Date: Thu, 7 Mar 2024 15:36:16 +0800
Message-ID: <CALz278ad+c6=BCrmHW9GfC3WkkOyhyvoR0xYxmi=_awUmjhdqw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Mar 2024 10:18:22 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

On Tue, Mar 5, 2024 at 8:28=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> wr=
ote:
>
> On Sat, Mar 02, 2024 at 12:19:07AM PST, Zev Weiss wrote:
> >On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:
>
> <snip>
>
> >
> >>+
> >>+     fanin_cnt =3D of_property_count_u8_elems(child, "tach-ch");
> >>+     if (fanin_cnt < 1)
> >
> >fanin_cnt < 1 || fanin_cnt >=3D NCT7363_PWM_COUNT
> >
>
> Er, off by one -- just '>' rather than '>=3D' there I realize now.

ok, fix in v5

Thanks,
Ban

>
>
> Zev
>
