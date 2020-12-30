Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCB62E7C86
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 22:04:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5kKw1kmwzDqLJ
	for <lists+openbmc@lfdr.de>; Thu, 31 Dec 2020 08:04:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YfoTzJ6T; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5kK44JdJzDqHg
 for <openbmc@lists.ozlabs.org>; Thu, 31 Dec 2020 08:03:17 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id y128so15827447ybf.10
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 13:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5VIdIKkhmDF2VV7T+Yz528oW4K8+lZA5m/DHFXlaDxM=;
 b=YfoTzJ6T45QZg6iHMpb66P4dUKGZDrpjmBgzd246KCk5AgT0Lf6HzK24FnHOjdKHzg
 gE2fDrKGwN6edfA/gdJw+q77lBZ2hlKPlGB3vpQckyk/k1+GHrsR3MXOaVQPsaZ4CZFq
 OTADcNe2ji3VZu+4t32PQCbSh2MgdM/hQ/BB84ubqj9FuhHEp/QBSRnQee9+KRtlm6Oa
 4iTuWb7H5UeEczbjoof7vGVC+N/rgkWlcfnbhQtMDfalNqtqBzRi4o61m+8TKqxkhT7v
 Fbsvei5hYeRLeGtRndKbpBm1VWRqEM0IIrguCURX8Tkim02DFB/qRSh83t/SG1Di96yg
 whnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5VIdIKkhmDF2VV7T+Yz528oW4K8+lZA5m/DHFXlaDxM=;
 b=XxjXO+nuwRQMy83QV6jH2jF1/I7Qs5cCeTX1nbrk5hvGPYA+ucIuYru9H6Z/3BMuhf
 0Id1sMZh4QGoFTqe/rz8Kgn3WiHIfLVTTnhV3f53PWmy1vFLgAlZbIGT/hn/dQt84TVn
 US/mdob5/MDTIJAUhpoaq4KDrVsFiG6lb83AtnQEE0QnUSqFWjRD9NeArygylLl7I++j
 8t2evxo74vdUJzUcMNG1GXlWpEF9VQdl/y1B2aJ1+Xx+zqBaZWyEQh8y6u0HxADCXk1J
 FpuKD+JbqAzvnjCnsIczLJzu6z+tfuxvLj1KC6G6I27EeYmlFOXXzKnqjrqVOLQMbkkv
 G4vA==
X-Gm-Message-State: AOAM533WfFp1j+oCx3QkU3sdLvLhiTIZLvLNfzbFdUvjxGM1gNi0lgrT
 HBpx8qGrLntBNQgZYW0KAEHNDRXSxhvS2aQOZE7R/A==
X-Google-Smtp-Source: ABdhPJwimbeJOgzmwQYNFkNWmGjRgG8nnd7erZw5XhFQdtJQofpdR4kYr3dFtgPJ53jGqiRDJtPSZOTpATLJ4hb87bc=
X-Received: by 2002:a25:77d3:: with SMTP id
 s202mr71603403ybc.148.1609362194146; 
 Wed, 30 Dec 2020 13:03:14 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
 <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAJTGxZHhbRs7pedZ+Ag8v7WACzXYyg43ZKYNWB75VywzoaSbpA@mail.gmail.com>
 <TY2PR04MB3933D20377D54FB7D1A3067695D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB3933D20377D54FB7D1A3067695D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 30 Dec 2020 13:03:02 -0800
Message-ID: <CACWQX80ot15FALuTSfFUeykACQQxwAZ+4pMAV_mPDySRfe-4kA@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
To: =?UTF-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Lei Yu <yulei.sh@bytedance.com>, Vijay Khemka <vijaykhemkalinux@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 29, 2020 at 10:14 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <H=
arvey.Wu@quantatw.com> wrote:
>
> Hi Vijay,
>
>         Because I want to calculate the different value between CriticalH=
igh and current sensor value in CPU sensor, and then there are weighting an=
d some const value to multiply or plus the different value.
> But the CPU sensor critical high threshold temp is set as TjMax, and the =
TjMax value will be different according the different CPU process type, not=
 a Const. That's why I want to add this feature.
>
> For example, according the Document below, if the processor is i7-3770K, =
the TjMax is 105, and if the processor is U7500, the TjMax is 100.
> https://www.kernel.org/doc/Documentation/hwmon/coretemp.rst

The intent is that these values will be read out of the chip by cpu
sensor, and the cpu sensor critical threshold will be set to 105, and
100 respectively.  phosphor-virtual-sensor does not need to be aware
of these thresholds at all, or would only forward on the value closest
to the threshold.

>
> If the Expression is "(TjMax - currentTemp) * scalar - Const", then it wi=
ll calculate different results between these two CPU processor.

If we need this, please add this as a feature within CPUSensor.  With
that said, I'm still not quite following the use case.  Can you
provide more details on what expression you're hoping to write in
phosphor-virtual-sensor, and what the intended behavior is?  If your
goal is to implement fan boosting, I believe this is already covered
in phosphor-pid-control.


Could you make more clear what you're trying to accomplish?  That will
probably help us give more concrete suggestions.

>
>
> Harvey Wu
>
> From: Vijay Khemka <vijaykhemkalinux@gmail.com>
> Sent: Wednesday, December 30, 2020 1:02 PM
> To: Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <Harvey.Wu@quantatw.com>
> Cc: Lei Yu <yulei.sh@bytedance.com>; openbmc@lists.ozlabs.org
> Subject: Re: [phosphor-virtual-sensor] Add new feature to get Warning or =
Critical property
>
> I am not understanding why you want to use threshold values to calculate =
new sensor values. We can certainly add this feature but it can not be base=
d on name rather we have to think differently to get. It would really help =
to decide on design once we know it's actual usage. I can't think of any si=
tuation here.
>
> Regards
> -Vijay
>
> On Tue, Dec 29, 2020 at 6:49 PM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <=
mailto:Harvey.Wu@quantatw.com> wrote:
> > On Wed, Dec 30, 2020 at 10:19 AM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD=
)
> > <mailto:Harvey.Wu@quantatw.com> wrote:
> > >
> > > Hi All,
> > >
> > >
> > >
> > >         The current phosphor-virtual-sensor DbusParam value is from
> > DBus =E2=80=9CValue=E2=80=9D property which interface is
> > =E2=80=9Cxyz.openbmc_project.Sensor.Value=E2=80=9D.
> > >
> > > Because I want to get the property =E2=80=9CCriticalHigh=E2=80=9D val=
ue on DBus, could I
> > add a new feature =E2=80=9CInterface=E2=80=9D property in json file? Th=
e property can be
> > =E2=80=9CCriticalHigh=E2=80=9D , =E2=80=9CCriticalLow=E2=80=9D , =E2=80=
=9CWarningHigh=E2=80=9D or =E2=80=9CWarningLow=E2=80=9D.
> >
> >
> > According to
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.
> > com%2Fopenbmc%2Fphosphor-virtual-sensor%2Fblob%2Fmaster%2Fvirtual_
> > sensor_config.json%23L8-L14&amp;data=3D04%7C01%7CHarvey.Wu%40quantat
> > https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fw.co=
m%2F&data=3D04%7C01%7CHarvey.Wu%40quantatw.com%7Cf75707a7431e4dca712e08d8ac=
80182b%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C637449013448979318%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&sdata=3DkxT3i6moVPggqbY1zJiag18Cp9wGmyk1ctqrO8XlTUc%3D&r=
eserved=3D0%7C1479ebd5aedd4b8a7c3308d8ac6a4393%7C179b032707fc4973ac73
> > 8de7313561b2%7C1%7C0%7C637448919693850853%7CUnknown%7CTWFpb
> > GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > Mn0%3D%7C1000&amp;sdata=3D0KyrnRkZKr9M59DEg%2BnyUruiege%2B3EDXb
> > mxzR%2B6xeng%3D&amp;reserved=3D0,
> > the threshold properties are already supported.
>
> The "Threshold" in json seems only can set the sensor critical or warning=
 value, but I want to use the critical or warning value in "Expression".
> After check the newest commit, this function seems doesn't implement in c=
urrent source code.
>
> >
> > --
> > BRs,
> > Lei YU
>
>
> Harvey Wu
