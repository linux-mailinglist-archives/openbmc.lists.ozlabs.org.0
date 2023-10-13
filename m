Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D85467C7BDC
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 05:02:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=E8r1cPfi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6BC11ngPz3cVr
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 14:02:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=E8r1cPfi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6BBR17T4z3bq4
	for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 14:02:21 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e2308198eso1774637a12.1
        for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2023 20:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697166133; x=1697770933; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+5+7v3/Gj+tLSCHFzPEhE7/v8vYPa/JG5S5RFILulI8=;
        b=E8r1cPfiKqM/xun2fTQtupmB71U7f+NHa0RAVh+BAVpRD6LCpfOFgAU9S7p+Yqpdaa
         8yZ3zeFfFV4hd24iIAcF495U6eS1/jUqR8tOQ7F9Tsd5XwBy/aHdc9r/9Y9qej9Ixhw3
         xRAWA4KJI9Zx7mX2Wd+30iMp9S6XEPqtd/+0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697166133; x=1697770933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5+7v3/Gj+tLSCHFzPEhE7/v8vYPa/JG5S5RFILulI8=;
        b=XpkR+7+Cg6mQwEACHpa9qRk3Hfi2SNjg4oNF0EwyyYrH7Y4xqymOqrOML29bs7+FkU
         5GrVsjuywfEEPxqxPxRY2kG3FHbl9IaxwYMjYapV2AYSdGcCwhxM4kqYb/AO0q2OQI4r
         dNG1nvZq22oznsr7B7c/J9hygmevmFcWc41Cy+9idR+0vHoHzhJYfEkcdh6jeKAMyEM9
         yVlxaJr12s6AhgBbxeCDF3Sh7X13ltNCKhkXFXZEWSo/C3nMY+pJw8xPO/mtB9qF2Nhf
         QXckw29cTeqdrn7OtYZ5oT/Kq126GauS7UE7Fq4OXIGpbMF1haY4+xHrzwLgspng9lCL
         jUaQ==
X-Gm-Message-State: AOJu0YxvJLxYB7HL2BpOO4Z42cxW2UNZpT5MnXUrRyJ+OpYltTv6qRsJ
	oyhyfqcffENRy7UQTBgGF5T5jcwjKUSPwViUd0c=
X-Google-Smtp-Source: AGHT+IFFjYXVcfk0zeF1lbmfiDRM1AnWV8R4rxXXXyWIEHes8SEZh/wuqu86mbsuGTuEpo37TfzbyjqzMe5VcF5BufY=
X-Received: by 2002:a17:907:7850:b0:9b9:ae5e:79ae with SMTP id
 lb16-20020a170907785000b009b9ae5e79aemr19200272ejc.60.1697166133321; Thu, 12
 Oct 2023 20:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231005035525.19036-1-chanh@os.amperecomputing.com>
 <CACPK8Xeo+7hTmfYR-eR9H4teUFqs5vOcSRm_VvDoVOqP4D6+NQ@mail.gmail.com> <92b76d7f-8eaa-48a8-bad0-714101c558d8@amperemail.onmicrosoft.com>
In-Reply-To: <92b76d7f-8eaa-48a8-bad0-714101c558d8@amperemail.onmicrosoft.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 13 Oct 2023 13:32:01 +1030
Message-ID: <CACPK8Xewm8js1OW4MdpU9TAvpjbJDtd=9siMcL1huJo5a=ZJmA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Update the device tree for Ampere's BMC platform
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 11 Oct 2023 at 21:58, Chanh Nguyen
<chanh@amperemail.onmicrosoft.com> wrote:
>
>
>
> On 11/10/2023 15:31, Joel Stanley wrote:
> > On Thu, 5 Oct 2023 at 14:26, Chanh Nguyen <chanh@os.amperecomputing.com> wrote:
> >>
> >> Updates the device tree to support some features on Ampere's
> >> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
> >>
> >> Chanh Nguyen (7):
> >>    ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
> >>    ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
> >>    ARM: dts: aspeed: mtjade: Add the gpio-hog
> >>    ARM: dts: aspeed: mtmitchell: Add LEDs
> >>    ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
> >>    ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
> >>    ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port
> >
> > I'll merge all patches except patch 4. Please resend that on its own
> > once you've added names.
>
> Thank Joel very much! Please also help me push them up at
> https://github.com/openbmc/linux !

Sure. That's been done now.
