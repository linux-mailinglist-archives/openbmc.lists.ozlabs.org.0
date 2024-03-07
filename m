Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30926875B11
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 00:23:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IEc09Mi7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrQMd6qn3z3vZn
	for <lists+openbmc@lfdr.de>; Fri,  8 Mar 2024 10:23:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IEc09Mi7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr1Tn4S83z3dTl
	for <openbmc@lists.ozlabs.org>; Thu,  7 Mar 2024 18:42:04 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7c843eb31f7so24633839f.1
        for <openbmc@lists.ozlabs.org>; Wed, 06 Mar 2024 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709797322; x=1710402122; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5+2SLHKHSCrTFwVgpGe2p6pLgJMincwPJKbEHmHkEw=;
        b=IEc09Mi7vU1oTBKIZXAkbn3NnvWQWDgkI2iFHmHFXs/HtUXxXl2/LsCL1xvtB1Za4G
         i5lS/1vDRlryf1b+5INTFuyhro+ci3ddElZ+ykxNbsti1U1YG98XuCo6JxLNg3xub3EL
         VbRKxLPdEcR4h1+7QFRV0a63dU9Vm9SKiAxcA4RQ54vUtLotoAVfbc+p5sFao1XkQmRI
         Tp7tTnmIBVbz+rmhdG/WMpEeecg2qFJGzdMNCgO763AQ2FHNvWya7Swpn75Opw5nCcrY
         ksLc87i3ZrjH6WFolflb0EurZkTSTTi0UCakKAzWcUZYdim1YY83/JGoiM1B0pz2N+2O
         nHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709797322; x=1710402122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5+2SLHKHSCrTFwVgpGe2p6pLgJMincwPJKbEHmHkEw=;
        b=uq+265Cv5KDXq8PwrlKa+spLjFonDTsiicBhcOVdsRzd7tdjS8XzYiXB8c5zMgRmnn
         3eSdDD2OKHtUTYBD+Aocj5/I0W7cnj4OIlXBD8Tfgyn+RxXBnkw7ylInbVFWIGdziLXh
         PPJxfA0hCt0tJbFZzS7IeynP8BDxYmBxB5A+Z1mG0hgcYuKrTDbMWJrh+1x3BlPoHYDq
         HKbXU3BhkwETgm2dsIlY4kCO9FLSMfsLpklD8GQSpX7nPvSAeWQPRUo0G+pguv14Olr6
         O7vqTPz/F/l4x7Vp894jlDo6wImBNFB/BQsxwqwudPSL5gPaOIX6Mx5nPnRFUreV2Tpj
         vkvg==
X-Forwarded-Encrypted: i=1; AJvYcCXJK28BZttHa1+prbaiBVP46LUsamDsPEvvqBcFng7BAykYlDGwe00fgHzATJI5IsjdCzsJ3J7pD0b/7k4FLS0Yj1TmV4RQsIE=
X-Gm-Message-State: AOJu0Yxx4fGFd7LYyFfLcyGxzTgr6BOAJn694ruAAAk8c/PvXIhpPm47
	EU+GOM0PX3iEj348mnaN2BkfCR+H5iyw5WxDE7iRP4s5m4Zf0zUIpvlUlRN6nUH13jLZJUxoBLb
	1HJwv4Q3RoJMNjeeeJnOZdM3TmV8=
X-Google-Smtp-Source: AGHT+IEeBR2EPDEPGv0wdG0jF+0ybHRLIfCHqc8xs55MboJMGn1dQvKiGrjW/JtCbl+vnDXrSMS9zxUAZJEr7pMVv/c=
X-Received: by 2002:a6b:dc0d:0:b0:7c8:63dc:e9cd with SMTP id
 s13-20020a6bdc0d000000b007c863dce9cdmr9211980ioc.19.1709797322307; Wed, 06
 Mar 2024 23:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com> <20240227005606.1107203-2-kcfeng0@nuvoton.com>
 <1cf69d3e-a8b4-49f6-ac4d-550b525e45e2@hatter.bewilderbeest.net>
In-Reply-To: <1cf69d3e-a8b4-49f6-ac4d-550b525e45e2@hatter.bewilderbeest.net>
From: Ban Feng <baneric926@gmail.com>
Date: Thu, 7 Mar 2024 15:41:51 +0800
Message-ID: <CALz278b_bbFB77TsVZLMKaK7kwqjjS1PzBbsB==r08R1Zkju8A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: fan: Add fan binding to schema
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com, Rob Herring <robh@kernel.org>, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

This patch was suggested by reviewer and I cherry-pick from below link:
https://patchwork.kernel.org/project/linux-hwmon/patch/20240221104025.13062=
27-2-billy_tsai@aspeedtech.com/

Because I don't know the rule about the patch with cherry-pick, maybe
we should discuss it there?

Thanks,
Ban

On Tue, Mar 5, 2024 at 8:22=E2=80=AFAM Zev Weiss <zev@bewilderbeest.net> wr=
ote:
>
> On Mon, Feb 26, 2024 at 04:56:04PM PST, baneric926@gmail.com wrote:
> >From: Naresh Solanki <naresh.solanki@9elements.com>
> >
> >Add common fan properties bindings to a schema.
> >
> >Bindings for fan controllers can reference the common schema for the
> >fan
> >
> >child nodes:
> >
> >  patternProperties:
> >    "^fan@[0-2]":
> >      type: object
> >      $ref: fan-common.yaml#
> >      unevaluatedProperties: false
> >
> >Reviewed-by: Rob Herring <robh@kernel.org>
> >Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> >Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> >Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> >---
> > .../devicetree/bindings/hwmon/fan-common.yaml | 78 +++++++++++++++++++
> > 1 file changed, 78 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/hwmon/fan-common.y=
aml
> >
> >diff --git a/Documentation/devicetree/bindings/hwmon/fan-common.yaml b/D=
ocumentation/devicetree/bindings/hwmon/fan-common.yaml
> >new file mode 100644
> >index 000000000000..15c591c74545
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/hwmon/fan-common.yaml
> >@@ -0,0 +1,78 @@
> >+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >+%YAML 1.2
> >+---
> >+$id: http://devicetree.org/schemas/hwmon/fan-common.yaml#
> >+$schema: http://devicetree.org/meta-schemas/core.yaml#
> >+
> >+title: Common Fan Properties
> >+
> >+maintainers:
> >+  - Naresh Solanki <naresh.solanki@9elements.com>
> >+  - Billy Tsai <billy_tsai@aspeedtech.com>
> >+
> >+properties:
> >+  max-rpm:
> >+    description:
> >+      Max RPM supported by fan.
> >+    $ref: /schemas/types.yaml#/definitions/uint32
> >+    maximum: 100000
> >+
> >+  min-rpm:
> >+    description:
> >+      Min RPM supported by fan.
> >+    $ref: /schemas/types.yaml#/definitions/uint32
> >+    maximum: 1000
>
> I can't say with certainty that it's not, but are we sure 1000 is low
> enough?  Looking at just what I've got on hand, an 80mm fan I have will
> run steadily at about 1500RPM, and I'd assume larger ones (e.g. 120mm)
> could potentially go significantly lower...
>
> >+
> >+  pulses-per-revolution:
> >+    description:
> >+      The number of pulse from fan sensor per revolution.
> >+    $ref: /schemas/types.yaml#/definitions/uint32
> >+    maximum: 4
>
> Might we want 'default: 2' here?
>
> >+
> >+  tach-div:
> >+    description:
> >+      Divisor for the tach sampling clock, which determines the sensiti=
vity of the tach pin.
> >+    $ref: /schemas/types.yaml#/definitions/uint32
> >+
> >+  target-rpm:
> >+    description:
> >+      The default desired fan speed in RPM.
> >+    $ref: /schemas/types.yaml#/definitions/uint32
> >+
> >+  fan-driving-mode:
> >+    description:
> >+      Select the driving mode of the fan.(DC, PWM and so on)
>
> Nit: could use a space before the parenthetical.
>
> >+    $ref: /schemas/types.yaml#/definitions/string
> >+    enum: [ dc, pwm ]
> >+
> >+  pwms:
> >+    description:
> >+      PWM provider.
> >+    maxItems: 1
> >+
> >+  "#cooling-cells":
> >+    const: 2
> >+
> >+  cooling-levels:
> >+    description:
> >+      The control value which correspond to thermal cooling states.
> >+    $ref: /schemas/types.yaml#/definitions/uint32-array
> >+
> >+  tach-ch:
> >+    description:
> >+      The tach channel used for the fan.
> >+    $ref: /schemas/types.yaml#/definitions/uint8-array
>
> Nit: s/channel/channels/ given that it's an array?
>
> >+
> >+  label:
> >+    description:
> >+      Optional fan label
> >+
> >+  fan-supply:
> >+    description:
> >+      Power supply for fan.
> >+
> >+  reg:
> >+    maxItems: 1
> >+
> >+additionalProperties: true
> >+
> >--
> >2.34.1
> >
> >
