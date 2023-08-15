Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8B77C5E4
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 04:33:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h6mXIiKE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPwLF4xYsz3c5b
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 12:33:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h6mXIiKE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPwKb57jRz2yVR
	for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 12:32:49 +1000 (AEST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a741f46fadso4237015b6e.0
        for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2023 19:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692066763; x=1692671563;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hlrmRxGLs/F9DipX5bUXix2iv7UjJrjeQCKjVDbSg4=;
        b=h6mXIiKE0O3Y08U5/64fqjrUPBQre19/pWOepTuSEqs4CwW4mmRDAtyIHFC7Izr0mK
         BUR2vOM2Gnd7EarkFvJ7dT+IVTrzxC5jcnViF3aXUeh2KGLeHTrWgTzk4gwAr4p8+BSO
         Sbld71OqoQ5vIfZdwo/B+DIXc2iQITJ+QWBC4nMOYwmsu/umuUewZ8PUUL9kAcVbqEw2
         mKQQQqnUvtCuKnWHiWjuEz1qYf21Kve0rH1T8HIrJk95PJlBnkt9Ld2WadyApYajXsrs
         wAwOGpgu9K1jPUaMVA7tspadXg8cUh7OlmhybkLuRtyvGpotFcYmcIpkgzeUnE+nCx6x
         yeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692066763; x=1692671563;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hlrmRxGLs/F9DipX5bUXix2iv7UjJrjeQCKjVDbSg4=;
        b=bnTanFS9J8mknqvAxBgcAAQAo3/2kV4rbEiHyBYLuMpQWdvwJ4zRVG5Fghfm0xInQD
         Q28Sz2e4pIsrvPz32vfVcScMKHd4YxyHIapu+y6BjKQPTF8yZ76w6D40XTNaOQkrephW
         +rGuggA2loMWG7xa2itxl6gyZr3CGEhhUSsGHdjUWwW+LZT/FMLY3pog7eBpUrh/q/kl
         LgkGu1sCLtuNtFyXMxHzQgDYrCu9h6cmv38l9J1qEMclGHWA0fb/L7gj3Xjv4Zukt0FQ
         Md1bcKx9AyWOMvTfNRr1HHuDY3JFCvi7gRZr1zLTbaKBkuFMNS0fpQmyqi2YsTRR39Fj
         DudA==
X-Gm-Message-State: AOJu0YxubOf0Qq70ldtvCKhHJ0/y5cxi3xCAdLE+J8jHVYViMA+WI4xr
	DghrL4iN8nLQ6p/kCaUCHjs=
X-Google-Smtp-Source: AGHT+IEHLVcZrXYkf4lPLUJYIE6Kr7VuFAGnc8GiUv44goBA/vP6bdh6hOU12wVcfQ0Q/YURKf+4oA==
X-Received: by 2002:a05:6358:418b:b0:134:ece4:1e74 with SMTP id w11-20020a056358418b00b00134ece41e74mr7753239rwc.21.1692066762816;
        Mon, 14 Aug 2023 19:32:42 -0700 (PDT)
Received: from smtpclient.apple ([2401:e180:88a1:80ef:f4f9:717b:5cd:3109])
        by smtp.gmail.com with ESMTPSA id s24-20020aa78298000000b00640dbbd7830sm8857152pfm.18.2023.08.14.19.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 19:32:42 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mining Lin <mimi05633@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: nuvoton: Add DT compatible
Date: Tue, 15 Aug 2023 10:32:30 +0800
Message-Id: <8BF54CCD-FCCB-430A-A78E-53DC55F3C286@gmail.com>
References: <d23de35f-8d55-4f80-a6ce-281f83fd4243@molgen.mpg.de>
In-Reply-To: <d23de35f-8d55-4f80-a6ce-281f83fd4243@molgen.mpg.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
X-Mailer: iPhone Mail (20G75)
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, conor+dt@kernel.org, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, mylin1@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, KFLIN@nuvoton.com, linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thank you for your comments.
I  originally wanted to judge whether to match chip data by DT compatible, b=
ut it does not make sense.
Therefore, I will remove it in the v4 version.

Thanks.
Best regard,
Mia

> On Aug 10, 2023, at 3:55 PM, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>=20
> =EF=BB=BFDear Mia,
>=20
>=20
> Thank you for your patch. It=E2=80=99d be great if you mentioned nct3015y i=
n the commit message summary/title. Maybe:
>=20
> dt-bindings: rtc: Add compatible nct3015y to nuvoton,nct3018y
>=20
>> Am 09.08.23 um 11:51 schrieb Mia Lin:
>> Add DT compatible "nuvoton,nct3015y" to select
>=20
> What do you mean by =E2=80=9Cto select=E2=80=9D?
>=20
> Also, maybe add how you tested this.
>=20
>> Signed-off-by: Mia Lin <mimi05633@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>> diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b=
/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>> index 4f9b5604acd9..67fc60fd395c 100644
>> --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
>> @@ -15,7 +15,9 @@ maintainers:
>>    properties:
>>    compatible:
>> -    const: nuvoton,nct3018y
>> +    enum:
>> +      - nuvoton,nct3018y
>> +      - nuvoton,nct3015y
>=20
> Would sorting the list be useful?
>=20
>>    reg:
>>      maxItems: 1
>=20
>=20
> Kind regards,
>=20
> Paul
