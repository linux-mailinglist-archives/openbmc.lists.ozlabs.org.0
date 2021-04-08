Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD11F3589DD
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 18:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGRkR4zPhz30JW
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 02:37:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=P9jmGt5k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=P9jmGt5k; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGRkC1LJxz30Dc
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 02:37:04 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id y2so1300047ybq.13
 for <openbmc@lists.ozlabs.org>; Thu, 08 Apr 2021 09:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cgqzSbUq4PZm8jhNLb8fMAJWwQr2aKOaFOz0ZYT06cs=;
 b=P9jmGt5k7OVKLK95YlPDOAnn8H8vursDTDtS/5kQVJMVTjSPTJfs5z8cjZeM0cBBxM
 MtT++NMAjfEdiIJxQCY+TlbYX8h/0AMz/0EYajJXIQH0N88UJVG4IDvnOFzR22VSdICE
 3rwjf7WDYgyPApFP+BQKwtQEz94xG26PqhNJ/bwF3Vp1h3V2JiiViL2RFvXgPPAKDOEx
 ZM8FHKZOR465MXT8AL5m94VrAM+vqYut+ZSwNC5Eux0iZ8OLIi0XNClqZ2eHMrXZdqS5
 MmlLWeWJyuvE3Ps3qrjtfeuG5p9+cCo/brpqxnwg42UI5lbpWVPuEFJRN9HDzKIKhyjB
 uomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cgqzSbUq4PZm8jhNLb8fMAJWwQr2aKOaFOz0ZYT06cs=;
 b=kRKFE0vn15Fkc6+8RH+OEBCE1r4wCWnyPbLEIcHyriSDv/F/YEUEGS99UstuxVTwut
 p+9BOc06Z7cwLftO3b4+9ubf5thz3ZsGxSbAv2zQbIC6UG1epiUcD7YNiNZ+EgH73q6u
 vmdWPfFqLRPK56qFqnqi4udY9l7SBdK5W3z2k1Obov3TpxGbi9zNSB9SGyqWpa3/69rM
 C46a2JZBOCod6AYyF7FV9JOUEnYYsAM5StbB7kr2F0wIfnEg9vBtFOnOxdMQT1Zs7Gao
 LLoaSbLQJC+xPdNuaCgPegNQkRty2ylzKizhl6AMlMLl7Aak6dfWd6UTaw50qSg1B0Ib
 bSNQ==
X-Gm-Message-State: AOAM5323yj0OubKdA6P5MfRmzOaousbMQZAPE9bX4DC8Cl/XNI6rMsJ6
 94cRh9fFEpKqgwBM5uIlAaM060EsuF7SZQbW+TP0IQ==
X-Google-Smtp-Source: ABdhPJzMjvDcac0wXh/ui39n+LZ6qyGOTVf6XBJI0gfr7eTs63mEY7ij30o0Y3FseF8GwPPKqcI/Y5k4GYqStgIiykQ=
X-Received: by 2002:a25:74c8:: with SMTP id
 p191mr11810711ybc.170.1617899818856; 
 Thu, 08 Apr 2021 09:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <TYZPR04MB4239076E95381F8E9E9E06FA84749@TYZPR04MB4239.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB4239076E95381F8E9E9E06FA84749@TYZPR04MB4239.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 8 Apr 2021 09:36:48 -0700
Message-ID: <CACWQX83hhkDpp3Rsb1dkbgUqHYfRRYouW7wT_7eNXkfocRuHmg@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] get sensor service fail
To: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>
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
 "edtanous@google.com" <edtanous@google.com>,
 "nanzhou@google.com" <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 7:01 AM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) <Alan=
_Kuo@quantatw.com> wrote:
>
> Hi all,
>
>
>
> In the current implementation of bmcweb LogServices, the time of the "Cre=
ated" property is the time when the event is generated, which does not matc=
h the description of the redfish schema. The "Created" property means the d=
ate and time when the log entry was created.

It should be noted, Created has been present since 1.0.0 of LogEntry,
EventTimestamp was added in LogEntry v1.1.0.  Based on the
descriptions, it's not clear to me what the intended difference is,
seeing as how they're both of type Edm.DateTimeOffset.  Based on the
description, the two would be identical on an OpenBMC system, the
LogEntry is "Created" at the same time it occurs.

>
> We think that using =E2=80=9CEventTimestamp=E2=80=9D will be more suitabl=
e than =E2=80=9CCreated=E2=80=9D in LogServices.

Why?  Can you give more details here on what you're trying to accomplish?

>
>
>
> Could you give me some suggestion ? Or am I misunderstanding the definiti=
on of schema?

This is probably a better question for the Redfish forum, unless
there's documentation on what the intended difference between those
two parameters are.

>
>
>
> Here is an example:
>
> {
>
>       "@odata.id": "/redfish/v1/Systems/system/LogServices/PostCodes/Entr=
ies/B5-83",
>
>       "@odata.type": "#LogEntry.v1_4_0.LogEntry",
>
>       "Created": "1970-01-01T00:01:43+00:00",    <=3D  It should be Event=
Timestamp
>
>       "EntryType": "Event",
>
>       "Id": "B5-83",
>
>       "Message": "Boot Count: 1: TS Offset: 65.4769; POST Code: 0x01",
>
>       "MessageArgs": [
>
>         "1",
>
>         "65.4769",
>
>         "0x01"
>
>       ],
>
>       "MessageId": "OpenBMC.0.1.BIOSPOSTCode",
>
>       "Name": "POST Code Log Entry",
>
>       "Severity": "OK"
>
> }
>
>
>
> Thanks,
>
> Alan
>
>
>
> From: openbmc <openbmc-bounces+alan_kuo=3Dquantatw.com@lists.ozlabs.org> =
On Behalf Of Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD)
> Sent: Monday, March 29, 2021 5:14 PM
> To: openbmc@lists.ozlabs.org
> Cc: Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=89) <Duke.Du@quantatw.com>; Fran Hs=
u (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran.Hsu@quantatw.com>; George Hung (=E6=
=B4=AA=E5=BF=A0=E6=95=AC) <George.Hung@quantatw.com>
> Subject: [phosphor-virtual-sensor] get sensor service fail
>
>
>
> Hi All,
>
>
>
>         In current phosphor-virtual-sensor, the function getService will =
return empty string only when catch error name =3D =E2=80=9Cxyz.openbmc_pro=
ject.Common.Error.ResourceNotFound=E2=80=9D (https://github.com/openbmc/pho=
sphor-virtual-sensor/blob/master/dbusUtils.hpp#L37).
>
>         But in my system, when bus call didn=E2=80=99t get sensor service=
, the exception name will be =E2=80=9Corg.freedesktop.DBus.Error.FileNotFou=
nd=E2=80=9D, and then service will be get failed.
>
>         It seems need to modified the origin condition or add another els=
eif condition. Do I misunderstand something?
>
>
>
>
>
> Thanks.
>
>
>
> Harvey Wu
>
> Email: Harvey.Wu@quantatw.com
>
> Ext: 17408
>
>
