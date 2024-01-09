Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE0282B82A
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 00:43:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i4tzNVxC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TB1Sg2Smvz3cRk
	for <lists+openbmc@lfdr.de>; Fri, 12 Jan 2024 10:43:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i4tzNVxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8Pz31s7cz2xLR
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2024 20:00:30 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3608bd50cbeso7958765ab.3
        for <openbmc@lists.ozlabs.org>; Tue, 09 Jan 2024 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704790828; x=1705395628; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgMEw0q4WwV2JumGUYsCtc6USbd39YZOyTk5WPojixQ=;
        b=i4tzNVxCp0ePTKNWnvojisfAMQNVMgjDa/ClB5sUsYkvxbbig4Cr+ymr9vBGIbLFXK
         qGpzU7F4xOXAmb3pRMm+vkO8iUQNqBMkwV4rBrDeMYiKALAItOlsKkVga9ULfjiku24O
         sOEl3Y5ZNFk4Ins6cXv1zTNsEibKF0lgnjt8XqH5jbafb2fRA6s/WH5GMQm7beoeABTA
         G1TINsK1fa6rhuNdsNZ6Iz7B1G9Os8dPS/ClQHhs2N8Bcn2bvqvcGwWXFxaRICErFEhq
         aP0vyYEmzrZjCOYZuDBzqkiQybQZM9ZQYKwx9p8Bw4Idf4vHdYKrlfyRRMSMwN6sfxH+
         7yFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704790828; x=1705395628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgMEw0q4WwV2JumGUYsCtc6USbd39YZOyTk5WPojixQ=;
        b=WCec5XnMRkYMLfkg9nSnsO+jZwL6IxXgNB2neUAcljzoao8guKDOt/fKkW4G3amrMo
         q1lo4DBfX2+cCMY7sYuKDkJy814cw+5tcxMWR8CWJA0RzchmOeYzHtyKI2AptlJf3qIc
         kues1+Yk5nWpYxmJ7sVpXefhaNkYoIwbx/LcHG5WCMfySbYPPACmpMv0s079Wc3vGb/s
         MqxYB6b3WOSMoZDeFkURxox6IxBVRy7rxeaIJP3QtHvInUaGV0uf3RfR7yA+idS+wauM
         6CCpPbKL/tLPGFssoy6NWBqL/CWaAbQc1cHXQRTftRSF2kMO7osCosUSmlbKUD0c7Nos
         Dsqg==
X-Gm-Message-State: AOJu0YyO9KEs0n/9RTD2Kk0E6WQmHk72yjci03fnNhzjPyz/6LFQiLtl
	oKkArWvvsIBnSgV+5A/LvklKVdOLlX2bjcRr9ck=
X-Google-Smtp-Source: AGHT+IG9rmegvlzOUYbFciwQULzLSP/qGqK+RLbjVXhQgCS8VFINLPoQ1fOr7bSQCaGxxHgwQbLcmpm6+YCoDXmC/5w=
X-Received: by 2002:a05:6e02:2387:b0:360:7403:3cca with SMTP id
 bq7-20020a056e02238700b0036074033ccamr6766345ilb.51.1704790827874; Tue, 09
 Jan 2024 01:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com> <20231222013352.3873689-2-kcfeng0@nuvoton.com>
 <20240104001552.GA2096243-robh@kernel.org>
In-Reply-To: <20240104001552.GA2096243-robh@kernel.org>
From: Ban Feng <baneric926@gmail.com>
Date: Tue, 9 Jan 2024 17:00:17 +0800
Message-ID: <CALz278bzoQEUS+NMP=Xt9+4n4NovBR6bCucbvQp_FhHuMP0bnA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 12 Jan 2024 10:42:46 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 4, 2024 at 8:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Dec 22, 2023 at 09:33:50AM +0800, baneric926@gmail.com wrote:
> > From: Naresh Solanki <naresh.solanki@9elements.com>
> >
> > Add common fan properties bindings to a schema.
> >
> > Bindings for fan controllers can reference the common schema for the
> > fan
> >
> > child nodes:
> >
> >   patternProperties:
> >     "^fan@[0-2]":
> >       type: object
> >       $ref: fan-common.yaml#
> >       unevaluatedProperties: false
> >
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> > ---
> >  .../devicetree/bindings/hwmon/fan-common.yaml | 76 +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.=
yaml
>
> Please implement my comments on v10.
>

Hi Rob,

I saw Aspeed Billy has already added enum to below patch:
https://patchwork.kernel.org/project/linux-hwmon/patch/20240108074348.73501=
4-2-billy_tsai@aspeedtech.com/

Thanks,
Ban
