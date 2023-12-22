Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008568224F6
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:49:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=hrXmcMER;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Sj34HPRz3cVF
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:49:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hrXmcMER;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8ml4J0Hz30GC
	for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2023 12:27:33 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7b3708b3eacso55341239f.2
        for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 17:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703208448; x=1703813248; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy8g0lzs7eaKHdXsmVjSrLQ8rBtR4re0URoEliy+E2c=;
        b=hrXmcMERen7KRdKZDINWyQFwpSuYpzndluz7RdlXw7GJjHrTv7+z51pSK6mNhnU9+p
         BW5TO18n6Jo4GcFL2tmDADvyX/EH8p2EGV1PyAKWYmm3ndeLjMzwevQsKrfWhenO809v
         JrrqoDNnHr0TAJd6X8OkPou7SoK/uQRsLO3HDUO/7sXVHaHWanvoDmi+3aGjBSwVPIy0
         ASDaMX7cSZs5pvZ2AfGvmKF4HzbRRe4eDvRL4GxBDbPe+Xfw+YkDhQmgEZvg4YwUFP5d
         d6wnOrdV9c8uddTO8DOYLb581YMXEoBbiOAsLEV4XO4k67Qi8/ax2TLdV83cc5Q9tcI3
         Kz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208448; x=1703813248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy8g0lzs7eaKHdXsmVjSrLQ8rBtR4re0URoEliy+E2c=;
        b=uCqREFijEhzTr5sCkoAeZMwTyHMd9I+Z1P0ht5nSj9YaEjAQYssqXBKnz3vhwanR50
         1nelLKTouBMKpX2wqrYkkBA1/S5TRCiDrzRZ2Nzz7ujLBGabNk/0+pqoJjMV09xBNjJ7
         mMF0WxoWvTnAW4EnVNuwjQSq/F8RFRdju0ZwCIJTl7brR+hMF3KGZu9XhAr0aI3Smsen
         Rajg6MefbKH9D3mXyWbD13nMrfAiuoJDeYNokW2OiJORYefixAG4lsmuPg7lc+b/ghDS
         17KfzSkItQkMZPdHopXuJa/eWAdW6awj+Q5TNk6O7h9dqBdjsKUNqi86bsd7CfLqWbly
         1L2w==
X-Gm-Message-State: AOJu0YxjF8ulB3ZTBDEbLrBVFuFeg02+p7xyMNrePOFANZFIqoWJhBf+
	iQ30UoYuX2TQPXJHqs1EDBlzC1jGrSbQ8v9gjxE=
X-Google-Smtp-Source: AGHT+IENIdhp+wVXGkDYH0RYIkfdROfEfqzYbfyIxwYeq1Y0iQANbD+H6pXUx/iczB5ACQ1EdYKX3pHgiXMN2c3RPe0=
X-Received: by 2002:a5e:da4d:0:b0:7b7:f9fb:8766 with SMTP id
 o13-20020a5eda4d000000b007b7f9fb8766mr607985iop.14.1703208448542; Thu, 21 Dec
 2023 17:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20231219080021.2048889-1-kcfeng0@nuvoton.com> <20231219080021.2048889-2-kcfeng0@nuvoton.com>
 <170297774900.1297817.5593278746406765111.robh@kernel.org>
 <CALz278aJ08fOU2XZMZJJ2Ocp+XwovJ0+nHK-=0dWqbXf+522OA@mail.gmail.com> <9035aff7-49e6-49cf-a8f8-619d3b53c4a5@linaro.org>
In-Reply-To: <9035aff7-49e6-49cf-a8f8-619d3b53c4a5@linaro.org>
From: Ban Feng <baneric926@gmail.com>
Date: Fri, 22 Dec 2023 09:27:17 +0800
Message-ID: <CALz278Z-KF+NurdXhOQjoP-RMhQfrshEyU=KkumN8Peus7Wdew@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:46:15 +1100
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, conor+dt@kernel.org, jdelvare@suse.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com, krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Thu, Dec 21, 2023 at 4:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/12/2023 01:44, Ban Feng wrote:
> > Hi Rob,
> >
> > On Tue, Dec 19, 2023 at 5:22=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> >>
> >>
> >> On Tue, 19 Dec 2023 16:00:20 +0800, baneric926@gmail.com wrote:
> >>> From: Ban Feng <kcfeng0@nuvoton.com>
> >>>
> >>> Adding bindings for the Nuvoton NCT7363Y Fan Controller
> >>>
> >>> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> >>> ---
> >>>  .../bindings/hwmon/nuvoton,nct7363.yaml       | 62 +++++++++++++++++=
++
> >>>  MAINTAINERS                                   |  6 ++
> >>>  2 files changed, 68 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,n=
ct7363.yaml
> >>>
> >>
> >> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_che=
ck'
> >> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > Our design is based on [1], and adds fan-common.yaml to
>
> Nothing in the patch or cover letter described the dependency.
>

ok, in v3, I'll attach a relevant patch and describe it in the cover letter=
.

Thanks,
Ban
