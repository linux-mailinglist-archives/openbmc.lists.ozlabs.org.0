Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A177B656D
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 11:24:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TXHll3L0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0C852z4Zz3cb8
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 20:24:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TXHll3L0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0C7S2YmVz3bq4
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 20:24:02 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so8191461fa.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696325038; x=1696929838; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o02q/FIkDaGrgLqoN/Aj/vG1/YJOsTbj5fKhJBGnD2E=;
        b=TXHll3L0lYHeHrYG5Hd/J4zsKDU5P/xhL2XRgKFVOVZm1y1FeczsijFfuS0qLwQ0Z4
         gxFiD1tyk5lioKOIst/rWc8QbMI51nGDToLXhWrG2qPjGtEKltyzg96FO1hELB6oEfQI
         LEhZVEoBLqh6otkWVg7gCSlBuj/+EFIiLDaJg7hbdsUip+SyYT1tAt4SZ0DWM1XJ3inA
         1CpUKSkK+DvLxlt7ci3r+8oU+8qDzi2zYaHAt0FoGRfGYhQv31lyY55AGiphtHNhYhMx
         46700D1kkU7YXGQdy2uXzfEkt4ewklcDDstR5WIJCqeqYxW/JIf2ba1V8FKy15ZkJzvA
         44rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696325038; x=1696929838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o02q/FIkDaGrgLqoN/Aj/vG1/YJOsTbj5fKhJBGnD2E=;
        b=G54sbDlUmgdzRHCa2p7JsshU0elp56zW91nm/bIj8e3WR8iHom6qWjcu8Nj//AGuEa
         An/HvY3Gx5Yh4Vm08xL+0f/CP+MmEPg/hdHjZU/AxjeCkZ/XhAaXTBBi8wKP4UWBy7ia
         QCwET8VY/O0tlu1L2TOV1H5oHecUItnYtuJ0AVIKnn5Gd2eOI5db82smBMh01DjUmTSW
         k1cT3PuRXzOJJ83T8HEghGpAeBItpk4QO1CuxNCSOlfb08vQk99WSo9hEx1acRw9g3Ob
         FGg+eP8hmd/NDv0oiJu8hAqBQEkWumTSqOeoWAirMxJdbQNDy01tsEeaRBTpniEJ4E5G
         VoSg==
X-Gm-Message-State: AOJu0Yw73XbWHIWHM4Pe+1BOJN7sbetTYiWPQojAZtBO7mq8u0Jhk4Mc
	ctdigeIgqr+0Pv15SCs8AW9/vRnBc6qOsz3icZ4=
X-Google-Smtp-Source: AGHT+IG3BDQNI/pILbidS9xryMvAbSkn6Y/6bkHT63bOwqPMoRRoTSL7+zz03ry1Fl2f/uI9CfxqrOri93gbzoU0eQc=
X-Received: by 2002:a2e:9b04:0:b0:2bd:e3e:1a23 with SMTP id
 u4-20020a2e9b04000000b002bd0e3e1a23mr10574736lji.45.1696325038173; Tue, 03
 Oct 2023 02:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231002161350.64229-1-tmaimon77@gmail.com> <2023100323-reunite-upfront-8922@gregkh>
 <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com> <0298e4a7-0f40-41d6-82f3-327d2fe493cc@linaro.org>
In-Reply-To: <0298e4a7-0f40-41d6-82f3-327d2fe493cc@linaro.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 3 Oct 2023 12:23:46 +0300
Message-ID: <CAP6Zq1ghiUhecvtC7gpKtbP11QTU8Js0wCk_sTFqjUf=d6KK1A@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, Greg KH <gregkh@linuxfoundation.org>, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

Appreciate your clarifications

Thanks,

Tomer

On Tue, 3 Oct 2023 at 11:32, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 03/10/2023 08:56, Tomer Maimon wrote:
> > Hi Greg,
> >
> > Forgot to add in Acked-by: Peter Chen <peter.chen@kernel.org> in V3,
> > Resend the patch set with the Ack.
> >
> > Should I do it differently?
>
> If it is RESEND after some time (min. 2 weeks), then it is fine. If you
> added tags or changed something, make a new version. If you resend for
> any other reason (assuming resend is valid), please mention shortly why
> do you resend (e.g. "My company email servers maybe blocked it, so
> resending without changes").
>
> Best regards,
> Krzysztof
>
