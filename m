Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC82499397
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 21:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjMJG0bRsz3bTZ
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 07:38:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=s4YQoa2y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=s4YQoa2y; dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjMHs3FJBz306f
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 07:38:00 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id y84so4704831iof.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jan 2022 12:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hFFORbmBbfTXsvRBFp5kmN/ITnUI2yMhOWkRAOuBgJE=;
 b=s4YQoa2ypb0s+zLTe1CNKhVHKLe4k5R4qil/wJxkUxonWB0T8L+Is+JrL9ub3VPrMk
 e4zKAkew7M2WMM2M5s8ycoKKsK0U556whhLUkIKe4xW5HHqKL4+KpH+B8fYshFuM8bYB
 hexBmTvDlfgjhpMn87jqtbRP88fW0xSnLidVlEcDowb3VTs0nJqAlkeut0AhYhBPL986
 XzRaXqBxRo4o7r6UudRFYRGFh5nxb7f48M3IvLHe+CB74Ojk9PUfn6vOGIT0PZKZYNNp
 swpPJQDx7YRfchwwmshphUtqLOmZFYPwGrGdnWuV130BgnUXa8GaLtoJDK/TA8Gy0lll
 TMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hFFORbmBbfTXsvRBFp5kmN/ITnUI2yMhOWkRAOuBgJE=;
 b=usMycjT+mBRIBsDdQegoxfbAoerQGoRoRDx2N/AnGYWRe49ZzRp4LopzBxxKg+sJhZ
 Q3lcikypio2UQsJNxoY/mfN8npkcuCeiQYx3B1mrTunipf1CmUbnLchxgBpv/XqGmBp0
 AXYxSuO8fNkYWwO4r88SDZwL1eysptxnQdlAKQzEr1HPW3fC3RrX6YPqvKP9MVNXPvf9
 pIxAPdrOFuEcmhPN30KiGYcb6p75FRthtFYqqtN9mlaogI55WQ4QT0F1MUyjSk0xPoht
 EYKgodKmwY4dDI4h1ZTQirzUqvwkUSj2UEKwrRO1Nb44+LcBNOigroDJxBikOq8E8pQh
 ER9Q==
X-Gm-Message-State: AOAM532nv4v5MtsXLMh768NY8gkeN3wPfmkX8gcNNWXG6YLafNiOp2AH
 p8egbl4/bEuNQRC1+xObq23iq51+uEKzN9Saa1CSDw==
X-Google-Smtp-Source: ABdhPJxESuyQnDxFcBBo9ae9HBgj/x4HbV1ukGyIpL4BiWuYHmuG7HiFZbjt1hoscJzyCn3xQnnFbGEa4tGvRO4pud0=
X-Received: by 2002:a02:29cc:: with SMTP id p195mr7685943jap.134.1643056677431; 
 Mon, 24 Jan 2022 12:37:57 -0800 (PST)
MIME-Version: 1.0
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
 <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 24 Jan 2022 12:37:46 -0800
Message-ID: <CACWQX81Er6MEfb+AOGS1XGOw4dULZvSxRAJOGQu+YhBW-jTwfA@mail.gmail.com>
Subject: Re: Implement Ethernet Interface Properties
To: =?UTF-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <spencer.ku@quantatw.com>
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
Cc: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>,
 Ed Tanous <edtanous@google.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 12:44 AM Spencer Ku (=E5=8F=A4=E4=B8=96=E7=91=9C)
<Spencer.Ku@quantatw.com> wrote:
>
> Hi All,
>
> We finally decide to implement six properties to Ethernet interface:
> RxPackets, TxPackets, RxBytes, TxBytes, RxDropped, and TxDropped.
>
> Those information come from Ethernet statistics and we can read the file
> to get the property value directly. (under /sys/class/net/<Ethernet name>=
/statistics)
>
> For the suitable property in EthernetInterface model, we got the feedback
> form Redfish forum and they said OEM properties would be the only other
> option at this time. For more discussion detail:

From their reply
"We may need to open discussions further for how to model these sorts
of metrics purely under EthernetInterface"

I think you've misinterpreted the response.  They asked for further
discussion on how to model it, and that OEM would be the alternative
if you weren't able to discuss.  Given our rules around OEM schemas,
please continue the discussion with the Redfish forum around this
topic to determine the right way to model this in the standard without
OEM.  There is nothing unique about OpenBMC with regards to these
telemetries, so it should be generic.  This might be a good candidate
for the newly formed "DiagnosticData" resource model, which is
initially exposing basically this same telemetry, but for i2c lanes
instead of network lanes.

> https://redfishforum.com/thread/579/additional-information-ethernet-inter=
face
>
> The following output is the result of my currently OEM implement:
> https://${bmc}/redfish/v1/Managers/bmc/EhernetInterfaces/eth0
> {
>   "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces/eth0",
>   ...
>   "Oem": {
>     "Statistics": [
>       {
>         "RxBytes": 48244026,
>         "RxDropped": 222856,
>         "RxPackets": 484315,
>         "TxBytes": 825845,
>         "TxDropped": 0,
>         "TxPackets": 5472
>       }
>     ]
>   },
>   "SpeedMbps": 100,
>   ...
> }
>
> But it cannot pass the Redfish validator, and here is the error messages:
> ERROR - This complex object RxBytes should be a dictionary or None, but i=
t's of type ...
> ERROR - RxBytes: Could not finish check on this property ('int' object is=
 not iterable)
>
> Is there anything I didn't notice? Or has there any spec or example that =
I can follow to implement?
>
> I had already push the implementation to gerrit and mark as WIP. Here is =
the link:
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/50522


You haven't modeled your schema properly in the above.  This is one of
the reasons we try to avoid OEM schemas, as they're difficult to get
right without help from the standards body.  Please continue to engage
with them to get this in a standard interface.

>
> We are willing to see any suggestions and alternatives as well. Thanks!
>
> Sincerely,
> Spencer Ku
