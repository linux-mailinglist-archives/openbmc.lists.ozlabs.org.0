Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E75A15897B5
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 08:21:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyzBL52WFz3bXg
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 16:20:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PO9ZbFpP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PO9ZbFpP;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lyz9z606Kz2xHq
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 16:20:38 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id p8-20020a05600c05c800b003a50311d75cso1496872wmd.4
        for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 23:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T7tSv0xfFySR9BOXqYydrDSzUvS8yZUY9ip/73tWYkw=;
        b=PO9ZbFpP0y7dg1pZB3T1e+8zYOlMW7OQHkH2z09bGncO2IkqZ+5bFp60t+7B8rylgA
         QZbpu3Gbk5eg8dIXFF6UHeY48KGn670U2g/XXNcimZ2Zeedu9LbWri+ezYTQeyRXEoIl
         2vdCdJbbQAVJ4jCj42J/ofMOWAwhQr831v6E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T7tSv0xfFySR9BOXqYydrDSzUvS8yZUY9ip/73tWYkw=;
        b=nYeh99zYjPOL/ja8QKxlod2Xd2c28TxK/rMyqdC4WjdearLSy+7FyR2LlZdycZsOTX
         HWwU+zTKFoa/2OgqkpB/5AtNBLTdyQAaqZhO4ezRwQIT2jy0kUbvDUAFrlnpVLtRG96A
         DiXf2HEF5FwkfT94KTGQc6bHaNOASNoJi/BveB1Rm5zd3IpUjobHaZ2UnAXF2qFj675a
         fAOgZL7yzfzm0NAa5gZbN1roQpkzRCJjlAFkfZIRQVSlXklxtZwPy1/BhSS3mMp/wsFb
         AttDH1Z0QMmh7cziReasEFE5d/HHlNZRjP7qw33FQ8MK7iMK5LyjkL5RqBIkNBa2OjeF
         qXsQ==
X-Gm-Message-State: ACgBeo3WCxMHnINe74gYCwk1xSIkiDPQXR8g3CeVs5Fs0eizQph2Kgxi
	H7/8l7Fw38YKLIjH/WmyPA8EmjfRhGPF+5cRDSklnT9oNaw=
X-Google-Smtp-Source: AA6agR4UZsrVVvZN/VqGYJ6tQZZ0oXHCM7WV/Dvz17BajIO2UJAAD93vhOh/FVEHVyxCvqW0u4znjCmv/u5QrJ1Jj6k=
X-Received: by 2002:a05:600c:1993:b0:3a3:3eb0:9102 with SMTP id
 t19-20020a05600c199300b003a33eb09102mr5167652wmq.72.1659594035739; Wed, 03
 Aug 2022 23:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220804035504.92900-1-joel@jms.id.au> <b1e6cec2-32f0-a316-ad4e-0dff839260ea@kaod.org>
In-Reply-To: <b1e6cec2-32f0-a316-ad4e-0dff839260ea@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Aug 2022 06:20:23 +0000
Message-ID: <CACPK8Xe5Ds_wmh_vJQ+Nv2VwoPngNep0+13qrYTp+xqCOQrU3A@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: Add a
 Romulus board (AST2500)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 4 Aug 2022 at 06:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/4/22 05:55, Joel Stanley wrote:
> > Romulus was the OpenPOWER reference platform for the IBM Power9,
> > containing an ASPEED AST2500.
> >
> > It was designed by IBM and built by SuperMicro. This reference platform
> > was sold as the Raptor Computing Systems Tallos II.
> >
> > The machine used one 32MB SPI NOR for the BMC, a second SPI NOR flash
> > for the host firmware, and the Broadcom BCM5719 attached via NC-SI.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> I have been using a similar patch for a while (QEMU purpose only)
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks!

>
> Which defconfig are you using ?

the evb-ast2500_defconfig in the openbmc tree worked for me. I tested
an openbmc build using this patch:

https://gerrit.openbmc.org/c/openbmc/openbmc/+/56133

I haven't double checked the environment yet. It appeared to work at
runtime, but I'm not sure if it's at the correct location

OpenBMC doesn't seem to correctly program an environment into the
flash image for the 2500 like we do for the p10bmc eMMC image.
