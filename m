Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AA4BEF80
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:24:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jfl3rslz3bY0
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:24:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FrtcLlrS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e34;
 helo=mail-vs1-xe34.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FrtcLlrS; dkim-atps=neutral
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2GC163fBz3cXv
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:47:24 +1100 (AEDT)
Received: by mail-vs1-xe34.google.com with SMTP id u10so16730554vsu.13
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7bU+t7iJxXJ0OaoM2yVGvL7go0S1hioO91rPjZv/0z0=;
 b=FrtcLlrS/mN+1ArTCSqQJP7OwWJSKnAIJoEa5iarc+OoEiID9eblolED3MW+RpC4iI
 Uj30iVniCj9z114z9iXB5YPM3o8zMMxdE/XyclQUnkTJmjc7xdNvdEXqtX9zBX7B5P9x
 8NOmjkfVirVkz4mkkYwkCObwJee276QceLrN8lO1ulssWB7HaA27T4BlB8YKaB9Hee+1
 3g8lLGE+rXQ3gmr7VTsZS9PcV6ZDbMeTWrnyk0fQditLy3NT4JaZ+8/DHH8cgYeg96jp
 H7kmCh40l0g5eZp7iDk2YhKhCTCI3douvetEz6cRvpjYB4vUamQT9Hk8fKmX9GUj79nr
 XTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7bU+t7iJxXJ0OaoM2yVGvL7go0S1hioO91rPjZv/0z0=;
 b=QOpgUr5JU8dQnbaZP3KktqbrPln9clyaTU28R9yPZOfpOdNjN8Zn1KuR1FjSzNUCiz
 rmMxjT3yQkA03DCvHOENxh+NHBYdsnipqbp1Qrh0ExE4B4ptmNf8WHs01C60CSxqoaB/
 p/8izvAaL7ZFTBy/ItIJ8AwmFnN8SU4qo/lrYXSreXwaxQ/uyAOKiQN2NDdrm3OvZc1Z
 Gg0DcurW5h+POYZt+M1AdOZ2Xqa9eqsd/P91TKuVIGozgSbf1g4x3aYh9VHwINjDTKx/
 xG23y8XGDzOeXy5zRtip9S4AuiNHu1kxN427biyHwhlC/sS7jMimCw1r/tuFeJxOs8RT
 WDcw==
X-Gm-Message-State: AOAM532lc6vuO8DgY3GtVA/hF626TckDC27EMbQbmA4wF4JfCIUOFKEe
 eiAoj9wpC4KH/jj5fy1phdXolm/xQYi0o16vJA==
X-Google-Smtp-Source: ABdhPJz87q7UEAPD90zMY5JUvmglimvP7o+lLeN7nmUzh3gNThbLp0iMMhFUe/WQABY4n4qBW73VqlU3+BeJKoEH4IM=
X-Received: by 2002:a05:6102:370f:b0:31b:60dc:4f76 with SMTP id
 s15-20020a056102370f00b0031b60dc4f76mr7914160vst.2.1645433240460; Mon, 21 Feb
 2022 00:47:20 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
 <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
In-Reply-To: <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 21 Feb 2022 16:47:08 +0800
Message-ID: <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof:

Got it and thank you for your comments.

I'll keep old code as fallback, if getting nuvoton,sys-mgr fails as
you point out.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8821=E6=97=A5
=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 21/02/2022 09:16, Tyrone Ting wrote:
> > Hi Krzysztof:
> >
> > Thank you for your comments and please find my reply next to your comme=
nts.
> >
> > Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=
=E5=B9=B42=E6=9C=8820=E6=97=A5
> > =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:30=E5=AF=AB=E9=81=93=EF=BC=9A
> >>
> >> On 20/02/2022 04:53, Tyrone Ting wrote:
> >>> From: Tyrone Ting <kfting@nuvoton.com>
> >>>
> >>> This patchset includes the following fixes:
> >>>
> >>> - Add dt-bindings description for NPCM845.
> >>> - Bug fix for timeout calculation.
> >>> - Better handling of spurious interrupts.
> >>> - Fix for event type in slave mode.
> >>> - Removal of own slave addresses [2:10].
> >>> - Support for next gen BMC (NPCM845).
> >>>
> >>> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation board=
s.
> >>>
> >>> Addressed comments from:
> >>>  - Jonathan Neusch=C3=A4fer : https://lkml.org/lkml/2022/2/7/670
> >>>  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
> >>
> >> How did you address the ABI change comment? I still see you break the
> >> ABI with the introduction of a new, required property.
> >>
> >
> > I add the new, required property "nuvoton,sys-mgr" in the file
> > nuvoton-common-npcm7xx.dtsi.
> > The file nuvoton-common-npcm7xx.dtsi is required by the existing
> > upstream NPCM devicetree files.
> > It is also updated and committed in this patch set [PATCH v2 01/11]
> > arm: dts: add new property for NPCM i2c module.
> > Please let me know if I misunderstand the meaning of "breaking the ABI"=
.
> > Thank you again.
>
> Breaking the ABI means that old DTS stop working with new kernel. Your
> change breaks old (and out-of-tree) DTS.
>
> What is more, your change is not bisectable because DTS goes via
> separate branch or tree than driver change.
>
> You need to keep old code as fallback, if getting nuvoton,sys-mgr fails.
>
> Best regards,
> Krzysztof

Best regards,
Tyrone
