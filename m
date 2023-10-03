Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF27B6252
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 09:13:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GaB8dORm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S08Dj01QWz3cB1
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 18:13:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GaB8dORm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S08D76j4jz3bw9
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 18:12:54 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9338e4695so6243891fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 00:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696317170; x=1696921970; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VpvT/D80OxJ4afszuNnSX5OlIZElw6h6KH28boI+JUo=;
        b=GaB8dORmvqbWYKTzV/Mq+XV9RfwIlWaWh/R/76d69yEvw/YJ4ua+Q0O1zZJ1+MP55Y
         nyFiluYMw5C18qpKI3yyv5ICu/56EpbTohWwK8V+7V//7PbmLmr0+zzN+SPu+xoHeRZb
         ByXZntdyLPHKFOLB2L6RLFk703wsLH+aXg6CQw497P9owJjpNW44yaVWPYD3QTBmHTAA
         /QbeYLy8VT0b51wOFhQIC4z2BdrtxflPyLghUr67FkLqHs1Nc0XtMituy5EXhoRaQix0
         kruBpGL8bD36VPFdkL0RMlCdTVMAQAKWIVmBqO/Lv4XpjlXH75Fu/w7qAfrHkHu41opF
         nN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696317170; x=1696921970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpvT/D80OxJ4afszuNnSX5OlIZElw6h6KH28boI+JUo=;
        b=fZ6POfXiXbk2n2h6C8uCFFs6KtEtxzC5n27Jf9DCyhIk5jx3XEygh3bx96+2muEs+s
         Qg7Cm6qujJWmnrsg90GgmQ7QzX+rbi3TBdxjfo8iI/PLKeeI54VGPnmqCnOgihT643Ub
         egUv2ItKGZKvsA6ZMEcuU10qxyIYgzhB4LKSBOJgM9nEfI/siMjy39qC1OVbc8BlZl2P
         XcTgj11wS8uCKeHfWCe8LWG3C1msAxHTDllewn0SE+XrHk8BDz7uxFoFM80wErCA+MLD
         DACJxaUs64Ej1celrffyCG/z/7lqevnE3RZKwSEZJ8bEoqHeeqj4GSHKzYBZtk6jMzFt
         ndVQ==
X-Gm-Message-State: AOJu0YwXOeXXEI2Sw5+eDlWvyG4hPjxCyDfpIbiDuhkIq1U1PmvRz82y
	tKcD6BJ6Cmifl8M1n3ckBTEuA2AUlj225u56MMQ=
X-Google-Smtp-Source: AGHT+IF/2qtL9lsTpoepg5ulXqwKd8bMtdNP5zrBn2lfZWD9LWZVW6RTD0ONNE313l5Zh4wEN8dsF04KIvlNA2yiadc=
X-Received: by 2002:a2e:a3c5:0:b0:2c0:a2:77d7 with SMTP id w5-20020a2ea3c5000000b002c000a277d7mr10724615lje.24.1696317170212;
 Tue, 03 Oct 2023 00:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <20231002161350.64229-1-tmaimon77@gmail.com> <2023100323-reunite-upfront-8922@gregkh>
 <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com> <2023100342-unnerving-diaphragm-cf36@gregkh>
In-Reply-To: <2023100342-unnerving-diaphragm-cf36@gregkh>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 3 Oct 2023 10:12:39 +0300
Message-ID: <CAP6Zq1j-uqwCCXF6aJA9Y2GynHRrPXiLjZM90ORqmNDT9vFKRw@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

O.K.

Thanks a lot

Tomer


On Tue, 3 Oct 2023 at 10:05, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 03, 2023 at 09:56:47AM +0300, Tomer Maimon wrote:
> > Hi Greg,
> >
> > Forgot to add in Acked-by: Peter Chen <peter.chen@kernel.org> in V3,
> > Resend the patch set with the Ack.
> >
> > Should I do it differently?
>
> You need to tell me what the difference is, otherwise I would have no
> clue what to do, what would you do if you had to review all of these and
> try to figure out which ones to accept?
>
> Please send this as a v4.
>
> thanks,
>
> greg k-h
