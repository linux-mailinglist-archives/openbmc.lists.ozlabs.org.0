Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E3A8224F2
	for <lists+openbmc@lfdr.de>; Tue,  2 Jan 2024 23:48:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20230601 header.b=bxoNH+9k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4Sgz5DKhz3bXw
	for <lists+openbmc@lfdr.de>; Wed,  3 Jan 2024 09:48:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bxoNH+9k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwWsY4tnqz30Jy
	for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2023 11:44:32 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7b7fd9e17d8so10305839f.3
        for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 16:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703119469; x=1703724269; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fixDV/PBfstTPYlfQh0KnMaKDB6N+aKH9jm856xZlM=;
        b=bxoNH+9kBp1oHqskiiHTL01saEPl6VA1XY72Y/4pFxS/ZjO4J6C62AJYZMME/aVWWi
         S295wwfeDKl/NB3Eaxkjod8X82rKGS/MZ+Y1C7qMlRh3uYZS9JbCcCUvBj0dE8dbUsjy
         CIynJsV0cvzV2PiHDTvEDWTHVy26/juET1oH5OmfqqzP5PFoD4i239zlAMKvnI3FMJWg
         lg10SO3jRfKp5/DWmMXuk2BmrjI+uzBxeBsGdECHE7M/ijg7aro3yMpylllWjXrdorFF
         yRBNEzpXnU0WvvNMqrDXjKP6S4hIh9++gPl7Cx07zdCzT1r8oe1t95fRElc1589Gpefd
         ymcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703119469; x=1703724269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fixDV/PBfstTPYlfQh0KnMaKDB6N+aKH9jm856xZlM=;
        b=TJQHvymgXd99XCLGa7hFC435c2TWCKl0TPmEY9wLdXOZLEExNN6WHujV+Bc1I9joeE
         Wp7kBCeXe1v2f1WsKoejPrA0r06QfkTMpdMvJXbGGLfQ7GO7Tj8E6lWhqJZ0ONyAj+3x
         jA+wIlkZElnwKk0PvbhXn3okl2+q9MSndk7Wd29e0PJvc17FfiB5O7Hda50tt+yhC6ZP
         zaENiuTh6ZZy9Fa2/3nFKPVI6KQIei3ik5vfJMPW1hyGZmI5y9kWggL+kBpnJdZGbe3W
         RCgz1+qU7sewn/RjNRrs/0EVzP4vX5lNiG/C02ZwapndXrObm2gQLbAfwr4qANUw3EiU
         hayw==
X-Gm-Message-State: AOJu0Yx5sJotZVn6/R1+8T+Cs57KHav4oXhrsw33BBTyWxhVvLogYj4f
	Z+RbRQ54b93Abm5bKBjzAwncp/gp+XA2C7h/VJU=
X-Google-Smtp-Source: AGHT+IE1v3zE8p80V7WUEaDPtzDfdDBx/oDJ6zVRlbWEjN9Z6MF44fr5JO0hoMXWlR6InA7H23fqFItogjg1PHsUiTI=
X-Received: by 2002:a5e:da48:0:b0:7ba:7baf:6db2 with SMTP id
 o8-20020a5eda48000000b007ba7baf6db2mr1469143iop.34.1703119469285; Wed, 20 Dec
 2023 16:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20231219080021.2048889-1-kcfeng0@nuvoton.com> <20231219080021.2048889-2-kcfeng0@nuvoton.com>
 <170297774900.1297817.5593278746406765111.robh@kernel.org>
In-Reply-To: <170297774900.1297817.5593278746406765111.robh@kernel.org>
From: Ban Feng <baneric926@gmail.com>
Date: Thu, 21 Dec 2023 08:44:18 +0800
Message-ID: <CALz278aJ08fOU2XZMZJJ2Ocp+XwovJ0+nHK-=0dWqbXf+522OA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
To: Rob Herring <robh@kernel.org>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Tue, Dec 19, 2023 at 5:22=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
>
> On Tue, 19 Dec 2023 16:00:20 +0800, baneric926@gmail.com wrote:
> > From: Ban Feng <kcfeng0@nuvoton.com>
> >
> > Adding bindings for the Nuvoton NCT7363Y Fan Controller
> >
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> > ---
> >  .../bindings/hwmon/nuvoton,nct7363.yaml       | 62 +++++++++++++++++++
> >  MAINTAINERS                                   |  6 ++
> >  2 files changed, 68 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct=
7363.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):

Our design is based on [1], and adds fan-common.yaml to
Documentation/devicetree/bindings/hwmon/,
I didn't see any errors when executing dt_binding_check.
This design is suggested by reviewer, and  [1] is still reviewing:
[1]: https://patchwork.kernel.org/project/linux-hwmon/patch/20231107105025.=
1480561-2-billy_tsai@aspeedtech.com/

How to modify our patch to achieve referencing patch not merged yet?

>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/nuvoton,nct7363.yaml:
> Error in referenced schema matching $id: http://devicetree.org/schemas/hw=
mon/fan-common.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: False schema does not al=
low {'pwms': [[1, 0, 50000]], 'tach-ch': ['']}
>         from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7=
363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: False schema does not al=
low {'pwms': [[1, 1, 50000]], 'tach-ch': b'\x01'}
>         from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7=
363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/nuvoton,nct7363.example.dtb: fan-1: tach-ch: b'\x01' is not of type 'o=
bject', 'array', 'boolean', 'null'
>         from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>
> doc reference errors (make refcheckdocs):
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/=
devicetree/bindings/hwmon/nuvoton,nct736x.yaml
> MAINTAINERS: Documentation/devicetree/bindings/hwmon/nuvoton,nct736x.yaml

I will modify this typo in v3.

Thanks,
Ban

>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202312=
19080021.2048889-2-kcfeng0@nuvoton.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
