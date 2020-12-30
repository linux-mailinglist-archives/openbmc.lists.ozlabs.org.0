Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD42E75A9
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 03:26:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5FXp5SsgzDqGv
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 13:26:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=es8QJSQW; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5FX102yGzDqGb
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 13:26:06 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id s75so17327878oih.1
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 18:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qWf+oPi6KpwCkj8qc8ZEgHezP5Om4u0LzwbEMyi3BuE=;
 b=es8QJSQWBtYdq6lvbqZWwsdcw6cuyADOcKYCBijZPl3bFBQeqJHYSYfRA6AmPNtEN9
 Gf+kkcf/IT2PeYt24t7/Ik55g2x9iZdGfFrmNoFfjhK/qXGCtIcgIIbSdVXTlww9nEcG
 1MNGDPZ6MgW9iOzndPCoyGXo/4Fs57Oo6nfAuv1NaB0mEc5bM+GU9kkc6HYvhw9vEE/q
 +lBLt/2GUH3yZ+wqMBMVKabMozaDAZX65AorraVJDKMRRWGAm2A7dv4oVrdSBZy1SohV
 1DDIzro2SeOdGra89WNxUpApZvxLeK2cj3BEJf1Iv+XY78/oXNlY+Yis0kVr6Cg9lLvj
 ZQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qWf+oPi6KpwCkj8qc8ZEgHezP5Om4u0LzwbEMyi3BuE=;
 b=oYoj4JGdibaSTRHeGroCpy2bF6IDr6TB9x5KGvKMr+ZMjaD4JG+n3EJSd+8A5ezykE
 0a9cN5oNAytpBjRb7K3gwedM+GQ8zEWhUIUR5Gv7ntHG2InOdPEQsN+Kf5o7zRq02GbB
 5EH9HrZKWyPs/GGhB/3uTGg+BotS1A8RKYq0NI/07ZIOvXa1paw9shYIRtZ3OXaUIAJK
 6/nb27na96ZkXJUKRWM7VF0+mKACAsbyKhB8wXgEC/q6EtGURRkWyxYKh1ShzUg3bGqn
 U8NqQnfYUtPVeePWah0fqZ0El8GpdflmUPqeFDzx6RhxBzyyJL46NM0VtRqK5ypCiUrk
 bfJg==
X-Gm-Message-State: AOAM533TYm2Of9l4zXQ1d+QBoRrjHvfxHLpzjKw7dNM5mvlcBrTvBeDY
 I5in38CU7hetX8ZfNeMWzIrl2yoYmCRPtss+nZ983g==
X-Google-Smtp-Source: ABdhPJwfCbj+KkdhFcPMUxhzJkfUmgNVpdoBUMcIMEolTLeeBp6KNimVubIynZ/gKI/CSYe0r5y1klmZ6kgQyv0ukuk=
X-Received: by 2002:aca:5e03:: with SMTP id s3mr4057354oib.125.1609295163137; 
 Tue, 29 Dec 2020 18:26:03 -0800 (PST)
MIME-Version: 1.0
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
In-Reply-To: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 30 Dec 2020 10:25:52 +0800
Message-ID: <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 30, 2020 at 10:19 AM Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD) <H=
arvey.Wu@quantatw.com> wrote:
>
> Hi All,
>
>
>
>         The current phosphor-virtual-sensor DbusParam value is from DBus =
=E2=80=9CValue=E2=80=9D property which interface is =E2=80=9Cxyz.openbmc_pr=
oject.Sensor.Value=E2=80=9D.
>
> Because I want to get the property =E2=80=9CCriticalHigh=E2=80=9D value o=
n DBus, could I add a new feature =E2=80=9CInterface=E2=80=9D property in j=
son file? The property can be =E2=80=9CCriticalHigh=E2=80=9D , =E2=80=9CCri=
ticalLow=E2=80=9D , =E2=80=9CWarningHigh=E2=80=9D or =E2=80=9CWarningLow=E2=
=80=9D.


According to https://github.com/openbmc/phosphor-virtual-sensor/blob/master=
/virtual_sensor_config.json#L8-L14,
the threshold properties are already supported.

--=20
BRs,
Lei YU
