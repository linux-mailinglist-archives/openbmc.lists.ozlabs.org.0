Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7280DF58
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 00:17:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QympPFC1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpyM24VWLz3bmy
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 10:17:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QympPFC1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmbcL3T1xz3cSM
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 14:05:36 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-35d9d0f4478so5477895ab.1
        for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 19:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702004731; x=1702609531; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZaXVtqBhppjXjmoqpUNuqDGGoegj5M4hSRf/Ke94IU=;
        b=QympPFC1pONWl6yrdA+ihPqQiVAeilsfjf+X6GXqv4Y0+0HJiXY5mYM1t3IFagHt6+
         A2LKNei21eknGWeBj2XyQ6QAQGgFKsbMDCTViujvH1TaiR1pUhRToxNQjYJFlp1JWMJt
         1PcvYAHRH+qneUYyo20AmVyLOINtw9SVx6Oa3gSXTyy6IezWnjaWXu15gzhTvOaELz7J
         A5NQPoC/HjtpgC1xPVmzidLRktDgsl5raGcRiacxp6tYZYT83Q0g1xY5vg+s9jeWZsrv
         hSBhRCus0/mQZxT0CeZhtQomjgPCwSgnv+5e8EYIrdxvpEU4rU+//cXi81JjUx7H8Y1J
         GxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702004731; x=1702609531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZaXVtqBhppjXjmoqpUNuqDGGoegj5M4hSRf/Ke94IU=;
        b=SoaVFu026QlA5h7MwQCKIlPq/nbqvJ2ihQVGcrs0lXsVHudtiqFkTioylgksYh/0Q0
         5Pw2tQ1wGpBULBxUd8k9G9Jc0qyZkVP8xuJ4ngVhk2j3bH/D/nSn2ULG4z+wthuzM1wN
         f0vw9jm0sZLoC/t3x0HuRy8cKWuBlcn+3uPjBijYm2D+mdjqalAsC67jVKaty2V31RsR
         8oGxobQVZM70p00EK9WPNoi7NRuaZYHitMKFGGZ5hxHWYz5wg7zt1xieD5TwmDR286eX
         02qukB+bf1nguReoGrMdur0ZPlQ5cSMMBTvxALVIT4xZW1R4JOrOIBiRXZriuOGt3gB8
         bhOg==
X-Gm-Message-State: AOJu0Yy8kJ1xTQO69BhhUPQbgAZkSwWYhsPzxyJt/KzQCYq6aEjHZlAc
	zfR83auSyRjI22f0ppcLWmGz3yfVgArb/wW8Q04=
X-Google-Smtp-Source: AGHT+IHF2JAlxWeFTtregJQGo3fmEDecpJk0nQOZc5AqeUlVlnkR7CF7wXQ3t5CKlmvWcvePrVpWNlde8WGkU4sXJ8w=
X-Received: by 2002:a92:4b11:0:b0:35d:59a2:a321 with SMTP id
 m17-20020a924b11000000b0035d59a2a321mr3826015ilg.35.1702004731225; Thu, 07
 Dec 2023 19:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20231204055650.788388-1-kcfeng0@nuvoton.com> <20231204055650.788388-2-kcfeng0@nuvoton.com>
 <94607c47-9824-4e2c-8f22-99ca2e088b27@linaro.org> <CALz278ZbjcbjUmFKv4B20DPDW33KPW-nZn4if3qTLjYKZZmWWw@mail.gmail.com>
 <4770f744-2309-4de0-8aaf-a221f69c08b7@linaro.org>
In-Reply-To: <4770f744-2309-4de0-8aaf-a221f69c08b7@linaro.org>
From: Ban Feng <baneric926@gmail.com>
Date: Fri, 8 Dec 2023 11:05:20 +0800
Message-ID: <CALz278bVoO=bKzgTbV7zBQHLwuKBB2PSxHMyxRYn3HWMA6z8xw@mail.gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: hwmon: Add nct736x bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 12 Dec 2023 10:16:50 +1100
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "jdelvare@suse.com" <jdelvare@suse.com>, "corbet@lwn.net" <corbet@lwn.net>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, "kcfeng0@nuvoton.com" <kcfeng0@nuvoton.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "kwliu@nuvoton.com" <kwliu@nuvoton.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Tuesday, December 5, 2023, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/12/2023 10:31, Ban Feng wrote:
> > Hi Krzysztof,
> >
> > On Mon, Dec 4, 2023 at 4:04=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 04/12/2023 06:56, baneric926@gmail.com wrote:
> >>> From: Ban Feng <kcfeng0@nuvoton.com>
> >>>
> >>> This change documents the device tree bindings for the Nuvoton
> >>> NCT7362Y, NCT7363Y driver.
> >>>
> >>> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> >>> ---
> >>>  .../bindings/hwmon/nuvoton,nct736x.yaml       | 80 +++++++++++++++++=
++
> >>>  MAINTAINERS                                   |  6 ++
> >>>  2 files changed, 86 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,n=
ct736x.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.=
yaml b/Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml
> >>> new file mode 100644
> >>> index 000000000000..f98fd260a20f
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml
> >>> @@ -0,0 +1,80 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +
> >>> +$id: http://devicetree.org/schemas/hwmon/nuvoton,nct736x.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: Nuvoton NCT736X Hardware Monitoring IC
> >>> +
> >>> +maintainers:
> >>> +  - Ban Feng <kcfeng0@nuvoton.com>
> >>> +
> >>> +description: |
> >>> +  The NCT736X is a Fan controller which provides up to 16 independen=
t
> >>> +  FAN input monitors, and up to 16 independent PWM output with SMBus=
 interface.
> >>> +  Besides, NCT7363Y has a built-in watchdog timer which is used for
> >>> +  conditionally generating a system reset output (INT#).
> >>> +
> >>> +additionalProperties: false
> >>
> >> Please place it just like other bindings are placing it. Not in some
> >> random order. See example-schema.
> >
> > ok, I'll move additionalProperties to the correct place.
> >
> >>
> >> You should use common fan properties. If it was not merged yet, you mu=
st
> >> rebase on patchset on LKML and mention the dependency in the change lo=
g
> >> (---).
> >
> > please kindly see below
> >
> >>
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - nuvoton,nct7362
> >>> +      - nuvoton,nct7363
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  nuvoton,pwm-mask:
> >>> +    description: |
> >>> +      each bit means PWMx enable/disable setting, where x =3D 0~15.
> >>> +      0: disabled, 1: enabled
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    minimum: 0x0
> >>> +    maximum: 0xFFFF
> >>> +    default: 0x0
> >>
> >> Use pwms, not own property for this.
> >
> > NCT736X has 16 funtion pins, they can be
> > GPIO/PWM/FANIN/Reserved_or_ALERT#, and default is GPIO.
> > We would like to add such a property that can configure the function
> > pin for pin0~7 and pin10~17.
>
> It looks you are writing custom pinctrl instead of using standard
> bindings and frameworks.


Please kindly see below

>
>
> >
> > My original design is only for PWM/FANIN, however,
> > I noticed that we can change the design to "nuvoton,pin[0-7]$" and
> > "nuvoton,pin[10-17]$", like example in adt7475.yaml.
> > I'm not sure if this can be accepted or not, please kindly review this.
>
> It looks like the same problem as with other fan/Nuvoton bindings we
> discussed some time ago on the lists.
>
> Please do not duplicate threads, work and reviews:
> https://lore.kernel.org/all/20230607101827.8544-5-zev@bewilderbeest.net/
>
> I already gave same comments there.


Thanks for your kindly sharing. I noticed that [1] defines some useful
properties, pwms and tach-ch, like you mentioned.

Therefore, I'll modify our design to follow the common fan properties in v2=
.

[1] https://lists.openwall.net/linux-kernel/2023/11/07/406

>
>
> >>> +  nuvoton,wdt-timeout:
> >>> +    description: |
> >>> +      Watchdog Timer time configuration for NCT7363Y, as below
> >>> +      0: 15 sec (default)
> >>> +      1: 7.5 sec
> >>> +      2: 3.75 sec
> >>> +      3: 30 sec
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    enum: [0, 1, 2, 3]
> >>> +    default: 0
> >>
> >> Nope, reference watchdog.yaml and use its properties. See other watchd=
og
> >> bindings for examples.
> >
> > NCT7363 has a built-in watchdog timer which is used for conditionally
> > generating a system reset
> > output (INT#) if the microcontroller or microprocessor stops to
> > periodically send a pulse signal or
> > interface communication access signal like SCL signal from SMBus interf=
ace.
> >
> > We only consider "Watchdog Timer Configuration Register" enable bit
> > and timeout setting.
> > Should we still need to add struct watchdog_device to struct nct736x_da=
ta?
>
> I do not see correlation between watchdog.yaml and some struct. I did
> not write anything about driver, so I don't understand your comments.
>
> Anyway, I don't like that we are duplicating entire effort and our
> review. Please join existing discussions, threads and build on top of it.
>

Thanks, I'll remove unused function in hwmon subsystem,
and consider a watchdog subsystem design if necessary.

>
> Best regards,
> Krzysztof
>
