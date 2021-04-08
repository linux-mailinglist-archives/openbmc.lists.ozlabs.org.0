Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E592358D7A
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 21:29:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGWXf3Rdxz3bqm
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 05:29:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=n8EtNMPJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=n8EtNMPJ; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGWXQ4gQKz30Lg
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 05:28:51 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id c195so3948675ybf.9
 for <openbmc@lists.ozlabs.org>; Thu, 08 Apr 2021 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3xPLpHdcGDSE97YEdGhG/NfwUdpgkpJGbXV3qhIP/FM=;
 b=n8EtNMPJlfkxwe/DZKjRB3PhENvUe0VyL5G4aBFB/wUs88xgROXPKHENSJMtoEZraY
 Yiipic+eG9eOOoOVY/jHS7coo/niNSL8scQJ4frlFr71ENMxKFj9xGAKqriGVyZTUwDy
 eXKhcFzg1vZ48GU0OAqQ7JJhgQSHSuC33TquPpv731BJqspeqqWGmNEkxg4K9AKeWA37
 1mS5eOvRYHaxfH/12x20bMAJRAeJaTlJLt5Czftz9W/NXxDzKUhqKPKrCb7C/rRuOUH5
 bEx3rKa44wFODQB032euD3CaMtL/B7vMwkbE5FvLwglMK9+kV+D6vHtJ4sQd+fM0g2ZX
 3FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3xPLpHdcGDSE97YEdGhG/NfwUdpgkpJGbXV3qhIP/FM=;
 b=Pc1SlJhrvjEFEDNFLiHYzciJ1xUlyYda8T0mzlYXRYl7U5L3l0jn8yV79pSMckUfhC
 UIX6HTEMlBU+2AxCcy8KCzZ96Ngd6/ZgtFk72KTtwc4ZwXINZm2KYLLASqMz5M+L3YOB
 Gda+UgBivd4ygkkXfDC/63PyYB7EJWU8NSjCumt00NjqVTpxYtG2Hp1aXHHafZBdV0Nq
 iRWzWoseIwgimNVE5xRxl9bZJIXcpIhWWrBRdI/WEB5htsXiokzbQjsAaF+Nvg4kkOl+
 aIqEBwxGlHzV4wuSVjo28n/UoHu8h1wwtDeeAalQmI+cPNn1n/8oCqHtPD0gg6+KyTSS
 uk1w==
X-Gm-Message-State: AOAM531Y2E31R4ZOwkAlqSyKNwkk+Qg25xmFAq5XsgNwOj/AWzaybr4u
 8/hfp8wk3j2vFfjz8ZJDKeBHX+ZNXmbwkN1jGyAqDA==
X-Google-Smtp-Source: ABdhPJxL8PQ7tC4fELnk1ROK9Iuep1h80txfORDibMRQvTK3VD20XH8w6MO5nn+fDbRh46KvzLMj0OaeYgaCKM10UWI=
X-Received: by 2002:a05:6902:1003:: with SMTP id
 w3mr10834109ybt.148.1617910128038; 
 Thu, 08 Apr 2021 12:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR04MB39339884DCB08EC59BC95894957E9@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <TYZPR04MB4239076E95381F8E9E9E06FA84749@TYZPR04MB4239.apcprd04.prod.outlook.com>
 <CACWQX83hhkDpp3Rsb1dkbgUqHYfRRYouW7wT_7eNXkfocRuHmg@mail.gmail.com>
 <CAOLfGj5XjRgY53eT7MNp5sA2u-umGGm-YZ=uB13cCBeuvQ=u0Q@mail.gmail.com>
In-Reply-To: <CAOLfGj5XjRgY53eT7MNp5sA2u-umGGm-YZ=uB13cCBeuvQ=u0Q@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Thu, 8 Apr 2021 12:28:36 -0700
Message-ID: <CACWQX8081RRc1ALJv50ROvP=zOduQP1QnwCrJC-foVL1wH5y4Q@mail.gmail.com>
Subject: Re: [phosphor-virtual-sensor] get sensor service fail
To: Nan Zhou <nanzhou@google.com>
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "edtanous@google.com" <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 10:11 AM Nan Zhou <nanzhou@google.com> wrote:
>
> Hi Ed,
>
> Thanks for your reply.
>
> Alan and I were talking about what attribute we should use for "the time =
that an event occurred", "Created" or "EventTimestamp". Both attributes in =
the Redfish schema are optional, my understanding after reading the descrip=
tion was that "Created" is when the LogEntry gets created in the LogEntryCo=
llection in the web server (BmcWeb);

This is one interpretation, but considering the history that "Created"
came first in the schema history, I question that a little.
Regardless, in that interpretation, on OpenBMC, "Created" and
"EventTimestamp" are identical, as we create the log entry when the
event happens.

> IIUC, in BmcWeb, new Log Entries are not created until they get queried; =
"EventTimestamp" on the other hand is when an event originally occurred.
>
> The context is that we are implementing both the PULL model and PUSH mode=
l of Redfish POST codes and Host Serial Logs, and we care about when events=
 occurred in both models.  In the PUSH model, the web server will send an a=
rray of "Event", in which there is an "EventTimestamp" attribute that we ca=
n use for each event. In the PULL model, we will query the LogEntryCollecti=
on in LogService, and currently, there is only "Created" but not "EventTime=
stamp" in BmcWeb. So we are sending this email to ask for comments.

This might make sense to have Created and Timestamp be different by
some amount of skid (ie, the time it takes to persist the data), but
does it actually matter in practice?  Let's say for a second that
those two timestamps were 5 minutes apart;  As a client reading the
data what would that convey and what would we do with that
information?

>
>> >
>> > We think that using =E2=80=9CEventTimestamp=E2=80=9D will be more suit=
able than =E2=80=9CCreated=E2=80=9D in LogServices.
>> Why?  Can you give more details here on what you're trying to accomplish=
?
>
> We are talking about the following three options,
>
> 1. change all the current "Created" attributes in BmcWeb LogService to "E=
ventTimestamp"

This breaks backward compatibility with services that expect Created
to be there, so this option is right out.

> 2. keep "Created" as is; add a new attribute "EventTimestamp"

If we went down this road, I'd really like to get some sort of Redfish
forum discussion that clarifies what the difference between these two
are, hopefully in the schema description itself.  I don't feel like we
have enough background from just reading the spec.

> 3. keep everything as is; use "Created" to represent "the time that an ev=
ent occurred"

I think for your use case, this is probably fine too, but I'd still
like to get clarification.

>
> We are fine with either of the three options. The email is to ask the ups=
tream and look for opinions from people.

Just FYI, you've already included upstream, this is a good thing, no
need to email me privately before going straight to the OpenBMC
mailing list.  Having context on discussions like this helps other
people a lot, and gives faster turnarounds on things that affect
everyone.

>
> Thanks,
> Nan
>
> On Thu, Apr 8, 2021 at 9:36 AM Ed Tanous <ed@tanous.net> wrote:
>>
>> On Thu, Apr 8, 2021 at 7:01 AM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) <A=
lan_Kuo@quantatw.com> wrote:
>> >
>> > Hi all,
>> >
>> >
>> >
>> > In the current implementation of bmcweb LogServices, the time of the "=
Created" property is the time when the event is generated, which does not m=
atch the description of the redfish schema. The "Created" property means th=
e date and time when the log entry was created.
>>
>> It should be noted, Created has been present since 1.0.0 of LogEntry,
>> EventTimestamp was added in LogEntry v1.1.0.  Based on the
>> descriptions, it's not clear to me what the intended difference is,
>> seeing as how they're both of type Edm.DateTimeOffset.  Based on the
>> description, the two would be identical on an OpenBMC system, the
>> LogEntry is "Created" at the same time it occurs.
>>
>> >
>> > We think that using =E2=80=9CEventTimestamp=E2=80=9D will be more suit=
able than =E2=80=9CCreated=E2=80=9D in LogServices.
>>
>> Why?  Can you give more details here on what you're trying to accomplish=
?
>>
>> >
>> >
>> >
>> > Could you give me some suggestion ? Or am I misunderstanding the defin=
ition of schema?
>>
>> This is probably a better question for the Redfish forum, unless
>> there's documentation on what the intended difference between those
>> two parameters are.
>>
>> >
>> >
>> >
>> > Here is an example:
>> >
>> > {
>> >
>> >       "@odata.id": "/redfish/v1/Systems/system/LogServices/PostCodes/E=
ntries/B5-83",
>> >
>> >       "@odata.type": "#LogEntry.v1_4_0.LogEntry",
>> >
>> >       "Created": "1970-01-01T00:01:43+00:00",    <=3D  It should be Ev=
entTimestamp
>> >
>> >       "EntryType": "Event",
>> >
>> >       "Id": "B5-83",
>> >
>> >       "Message": "Boot Count: 1: TS Offset: 65.4769; POST Code: 0x01",
>> >
>> >       "MessageArgs": [
>> >
>> >         "1",
>> >
>> >         "65.4769",
>> >
>> >         "0x01"
>> >
>> >       ],
>> >
>> >       "MessageId": "OpenBMC.0.1.BIOSPOSTCode",
>> >
>> >       "Name": "POST Code Log Entry",
>> >
>> >       "Severity": "OK"
>> >
>> > }
>> >
>> >
>> >
>> > Thanks,
>> >
>> > Alan
>> >
>> >
>> >
>> > From: openbmc <openbmc-bounces+alan_kuo=3Dquantatw.com@lists.ozlabs.or=
g> On Behalf Of Harvey Wu (=E5=90=B3=E5=B4=87=E7=B6=AD)
>> > Sent: Monday, March 29, 2021 5:14 PM
>> > To: openbmc@lists.ozlabs.org
>> > Cc: Duke Du (=E6=9D=9C=E7=A5=A5=E5=98=89) <Duke.Du@quantatw.com>; Fran=
 Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran.Hsu@quantatw.com>; George Hung (=
=E6=B4=AA=E5=BF=A0=E6=95=AC) <George.Hung@quantatw.com>
>> > Subject: [phosphor-virtual-sensor] get sensor service fail
>> >
>> >
>> >
>> > Hi All,
>> >
>> >
>> >
>> >         In current phosphor-virtual-sensor, the function getService wi=
ll return empty string only when catch error name =3D =E2=80=9Cxyz.openbmc_=
project.Common.Error.ResourceNotFound=E2=80=9D (https://github.com/openbmc/=
phosphor-virtual-sensor/blob/master/dbusUtils.hpp#L37).
>> >
>> >         But in my system, when bus call didn=E2=80=99t get sensor serv=
ice, the exception name will be =E2=80=9Corg.freedesktop.DBus.Error.FileNot=
Found=E2=80=9D, and then service will be get failed.
>> >
>> >         It seems need to modified the origin condition or add another =
elseif condition. Do I misunderstand something?
>> >
>> >
>> >
>> >
>> >
>> > Thanks.
>> >
>> >
>> >
>> > Harvey Wu
>> >
>> > Email: Harvey.Wu@quantatw.com
>> >
>> > Ext: 17408
>> >
>> >
