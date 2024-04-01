Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C901E894766
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 00:43:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZsgIydbR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7mHy3Xrkz3dRl
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 09:43:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZsgIydbR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com; envelope-from=baneric926@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7LVr0mkFz3bwR
	for <openbmc@lists.ozlabs.org>; Mon,  1 Apr 2024 17:21:06 +1100 (AEDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7d0d0057c8aso9547839f.0
        for <openbmc@lists.ozlabs.org>; Sun, 31 Mar 2024 23:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711952461; x=1712557261; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMMohnAWMK6m3tG9gNhC20ZEygwyJguxL99B9xnGWG8=;
        b=ZsgIydbRbpG59OjtHjAOffNMJtIf+OCKxP+vnYKMpWeuIvyRv64/8hBadVepI2n9st
         dGMuF1B8Xo8mP6Z3qP8QRSHUOgCiSKTkQCBgqDRxmFUykmcj9rYpb66+BDlJzGCAHAgl
         zUp1RFIRzpImyxxn3uD80AigQMgTch/kUpSi93H+Y0zuHkCbY/ske8GuWYU35iisIivi
         /E7oIcFYUxjQKj6X0fDuGiWhzZNchAS9UPFUzEk8aSnKeNgXTfvi/WTItloJpfledTJF
         XpZSpp4DwBQ3jAkL8WRPlhk202H3F9cTSLEkOLQ0BvwUAdxEjGfgceEFcgX/ftVM/Bqp
         9cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711952461; x=1712557261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMMohnAWMK6m3tG9gNhC20ZEygwyJguxL99B9xnGWG8=;
        b=X2gBoMWVnhIJKE2rK8JPhIwqevTGWP+PbMh3ybe3Dh4Jt3WC7WbHlhQC2W4e1cSbiE
         xhh42MEKgYMtJHtHvP9EVHfl+WFst8/3sNbiCAarARdgP66zAXuLQLslxpLA6c4MFGRH
         cgjfQcSbjtfeBk9/rWrM1caU5RcBjeIMsv/quwRl+6iHUciJn7ThZWs6SFHhOBXc8dBX
         NwDdgHivy7COcGKHiYUfYxyRtPdDwJp3Cddqrv774hPSuDJPgB2bVOkLdOunCx7FDIzm
         y+HdfEm38rySl1QnNjoVJCoZ2nvJbaK2n/U4t3xMy6u78eKvmNcHqWgD5wWzCzkLJomf
         FyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzHtF4q4UTXXRoIgymJmJbhQPQWsKmsAxHuezARmKHPfDNjnN1HKSn5hGVeY9W+iesVjhWI8mflm/KM2ea4nQmTFZIQ5zk2uI=
X-Gm-Message-State: AOJu0Yw2J+0pgDW6SDn8KdBGxF9lRxbk8c39ogN/Reb1KkRHIe5NPEz9
	BpXTONQyYGtuHj3J8Upu5DYRhcZnY0TwjGFZYElbwYC9gpfhQOnl5Irho3wYN9zJMqINMoCcFJM
	3mRf4GaVSEDV0zoIJNiQOfQ2ZlKw=
X-Google-Smtp-Source: AGHT+IGqrP3UbKuIe1tD2jwC4HaMuI/kdKXkvDhRJ+AWyQfCT0kCIFRqJPOXLpW67XqZ5jBlSE9DEP3cTjA6OoqADbE=
X-Received: by 2002:a5d:8986:0:b0:7cf:1c5c:681e with SMTP id
 m6-20020a5d8986000000b007cf1c5c681emr10205960iol.17.1711952461453; Sun, 31
 Mar 2024 23:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com> <20240322081158.4106326-2-kcfeng0@nuvoton.com>
 <171109961635.307786.7810067768607811171.robh@kernel.org> <22fcad13-dd9b-4e9a-90aa-d20fb78e6a0d@roeck-us.net>
 <e1102a00-0c94-4d35-8de2-1173ee417bdc@linaro.org>
In-Reply-To: <e1102a00-0c94-4d35-8de2-1173ee417bdc@linaro.org>
From: Ban Feng <baneric926@gmail.com>
Date: Mon, 1 Apr 2024 14:20:50 +0800
Message-ID: <CALz278ZdvJhtDhBaKMg_nP+sS0HQVvAjidKAGkeqG8Cu4ftb+Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Apr 2024 09:42:42 +1100
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, kcfeng0@nuvoton.com, devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Menzel <pmenzel@molgen.mpg.de>, kwliu@nuvoton.com, openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Thanks for your support.

Best regards,
Ban

On Tue, Mar 26, 2024 at 2:29=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/03/2024 18:09, Guenter Roeck wrote:
> > On 3/22/24 02:26, Rob Herring wrote:
> >>
> >> On Fri, 22 Mar 2024 16:11:57 +0800, baneric926@gmail.com wrote:
> >>> From: Ban Feng <kcfeng0@nuvoton.com>
> >>>
> >>> Add bindings for the Nuvoton NCT7363Y Fan Controller
> >>>
> >>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> >>> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
> >>> ---
> >>>   .../bindings/hwmon/nuvoton,nct7363.yaml       | 66 ++++++++++++++++=
+++
> >>>   MAINTAINERS                                   |  6 ++
> >>>   2 files changed, 72 insertions(+)
> >>>   create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,=
nct7363.yaml
> >>>
> >>
> >> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_che=
ck'
> >> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >>
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/hwmon/nuvoton,nct7363.yaml:
> >> Error in referenced schema matching $id: http://devicetree.org/schemas=
/hwmon/fan-common.yaml
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: False schema does not=
 allow {'pwms': [[1, 0, 50000]], 'tach-ch': ['']}
> >>      from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7=
363.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: Unevaluated propertie=
s are not allowed ('pwms', 'tach-ch' were unexpected)
> >>      from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7=
363.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: False schema does not=
 allow {'pwms': [[1, 1, 50000]], 'tach-ch': b'\x01'}
> >>      from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7=
363.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: Unevaluated propertie=
s are not allowed ('pwms', 'tach-ch' were unexpected)
> >>      from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7=
363.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/binding=
s/hwmon/nuvoton,nct7363.example.dtb: fan-1: tach-ch: b'\x01' is not of type=
 'object', 'array', 'boolean', 'null'
> >>      from schema $id: http://devicetree.org/schemas/dt-core.yaml#
> >>
> >> doc reference errors (make refcheckdocs):
> >>
> >> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202=
40322081158.4106326-2-kcfeng0@nuvoton.com
> >>
> >> The base for the series is generally the latest rc1. A different depen=
dency
> >> should be noted in *this* patch.
> >>
> >> If you already ran 'make dt_binding_check' and didn't see the above
> >> error(s), then make sure 'yamllint' is installed and dt-schema is up t=
o
> >> date:
> >>
> >> pip3 install dtschema --upgrade
> >>
> >> Please check and re-submit after running the above command yourself. N=
ote
> >> that DT_SCHEMA_FILES can be set to your schema file to speed up checki=
ng
> >> your schema. However, it must be unset to test all examples with your =
schema.
> >>
> >
> > I am a bit puzzled by this one. The patch has a Reviewed-by: tag from R=
ob,
> > but then Rob's bot complains about errors. hat am I missing ?
>
> The warning is a result of missing fan-common.yaml in the tree used as a
> base.
>
> I checked now and I don't see warnings on next or v6.9-rc1, so it is
> safe for you to apply it.
>
> For the record:
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>
