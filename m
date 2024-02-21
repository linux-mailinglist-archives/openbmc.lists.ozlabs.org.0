Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F448608E4
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 03:37:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TWoVEPT3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgvLs1WBnz3dVq
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 13:37:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TWoVEPT3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfg5z2NlDz2ygY
	for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2024 13:22:30 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7c7229e85b5so4249839f.0
        for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2024 18:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708482148; x=1709086948; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mhk0q27X8GinCZy7XzzdW389DBQpazGkJTGn+SAUaKg=;
        b=TWoVEPT3uaApDoFyXGCSAorj7+an09tGOLdXn60KaWIEWOiwQSszrjR8GDwgpc0TPi
         ye6kr67gefA6F8szube5w0t0eIA6JESEdZtJyqFUcyeUNqlS7ihoRbrhkRxQoRY384Yo
         bfK+fqJsr7BtHBKvQdtXKSI/vI9HCU/vNo8U+c71aLOMbTtSEpe+/ltBUxbBqsUpta2t
         HFVQHr+2v9/KtiUXy2sHI4hy9Nw4IUxUzjRbinaEYhnLHuxXUGJorTIucCGatLsJl82s
         KR/S69KeP0a1U0RHd2gOQCQZCmRRis0tOA2m0m9WThFR2xi7gUI7LVhPtsfCc6tDhTUG
         wktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708482148; x=1709086948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mhk0q27X8GinCZy7XzzdW389DBQpazGkJTGn+SAUaKg=;
        b=OPa15c6SOex39CH4r1Atz2KdCf41SEpRut4dRF8JV4J+sJd3JHISk5VEt63B6iGB8f
         +OoqLVNy4Pcz2uApOA6XLChOxWB9rvfwgum8ZJg9nAr+XL/FW61IxiajjvjU75r0iJw1
         fy1G6StUm1t/4i0YCmxHo6MzbHDSANARgalmbO3HJuvtzmvu1mERHjHMu0yCMMWp5i1e
         jowIth3c7rMqTAhAIdwAu5owSDKwo+UvzFQho7HmfEvHYa3Z1Z5QS/u5NWB+a18T/hm/
         4UVQs8eAtZwFmFchFcE2Ml7L0/ynp/aX7xXNbokBp3/5d84Kt/m2jU9UMBaf3rEJDRdJ
         3K7w==
X-Forwarded-Encrypted: i=1; AJvYcCWUGC1LWBkZjHX4m4AMXYQVSkyUD843tj6+0Vh/V+vts5zW4gFiEzOq2SopgivcRH40/OQHujhMKs1foFY6SgTazvMqleqNmb8=
X-Gm-Message-State: AOJu0YxCWSf9hu48zqZ9kS5y9TjR2fLWgsxfWWXRtz6fHqnsGqYooQSG
	LjHDdvXeCQ6OnmompEiWTVVQxhkhklqUI+6F3wJWyb+EYfKxAOoNfRYdlF4F8Sc6tXfYOqZawVU
	Uo6AYzI5mWy07G6Cr0gbB8/6rbiw=
X-Google-Smtp-Source: AGHT+IF2VfDZBoX5pQjaflh73V91CMTptpS/eM0zxZ1Rx/DhA1L5dll99owOM9lN68Xa6i3gE5uApl5W+PVF+WaNdlc=
X-Received: by 2002:a05:6602:3f92:b0:7c7:2e6a:9bbe with SMTP id
 fb18-20020a0566023f9200b007c72e6a9bbemr16676784iob.10.1708482147782; Tue, 20
 Feb 2024 18:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20231222013352.3873689-1-kcfeng0@nuvoton.com> <20231222013352.3873689-2-kcfeng0@nuvoton.com>
 <5dd9d5f8-c909-4245-b37f-cfb0a8096a50@roeck-us.net>
In-Reply-To: <5dd9d5f8-c909-4245-b37f-cfb0a8096a50@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Wed, 21 Feb 2024 10:22:16 +0800
Message-ID: <CALz278Z_YgY6J3SqfnMad1tcw-SQquhSsOJjdA6Okpb5vz78Qw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 23 Feb 2024 13:36:41 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

On Sat, Feb 3, 2024 at 11:09=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
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
>
> Unfortunately the dt maintainer's Reviewed-by: tag on the latest version
> of the fan schema patch got lost. I am not sure if I can add that back
> in on my own without violating some rules. That will need to get resolved
> before we can move forward with these patches.
>
> Guenter

Owner will add 'Reviewed-by: tag from Rob' in the next version.

Thanks,
Ban
