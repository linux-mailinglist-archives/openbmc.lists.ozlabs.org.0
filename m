Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5C532147
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 04:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6f6p1Cgfz300b
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 12:59:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GUGkvNTp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=GUGkvNTp; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6f6M5GGRz2yL6
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 12:58:48 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id m203so110428oib.6
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 19:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IBvg9n8YwOlpt2/OpYoafS/v6PXgf/ZcAroJow2TN2U=;
 b=GUGkvNTpIufxP5/WtPPrJZHbRbsoB+oWVNmGYAfq8vtZLVuJ4hrbnwnuib4rVT/vjh
 czX+Nox89d6Sd6s07LCyBzABCBYeCtEjQqm4dr+oRoxYYifZs6wzjj2Lnx8i5mOW24iK
 YCeupmpoUSwdeX6j9av+eHr/Fm283isSULKkYEn28hGlybBIcxb4YyPhZiIiUpjPdsgX
 jjDykHYRjI/R8I4WEsZICj+ARytFL7tKSGCM//FTvD3ITk4OQZWpsMG5VhUSTQinFKLz
 KrDcsnBfs+X443g+4tUwRRrpsqtAmrapXaF7P9pJksqAsXZmgGRdRGKYTWqQxs996djk
 +FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IBvg9n8YwOlpt2/OpYoafS/v6PXgf/ZcAroJow2TN2U=;
 b=ZQ6F/aYxwhCoPzyaPLtEZyl3Tgjghg9qnP6Dcz7o6b6bHGNU4wH4seQ8zVsvMo12we
 mACSEtzfJmx3Uccct6dCsrf8V83UAGYQRtN/0BhfZN9TnPNxInu5CGK4/8DaFcsVt0Sd
 mqppDXhYEE6nG8RtcvqB3mGxHZ5QDYAKB2JoS3vI2A2rZqH1xmz3FgdOHJw+q2t5sHk8
 2P5ShoZPw6vnC7Aq9MFXzLGSAeuO5Zgpf1CGopir9mq/V+bLeUbE+nzRqh4UszPI+Zrs
 b1ewel7m1t8cL4NawGIb2rLonGn3JHBzm1O2f3c8Aki2oGO1THU5jMpLARTOFbJbjD8k
 QIKw==
X-Gm-Message-State: AOAM530JRieA+066p97ZTCCkYqh1WwufbctA1SRya14mCWWIhlw+lKTA
 vI8p2ocTgmOFFLi0iyTzMS1GKSd8Kcz6XpTd3iCVu5m2I58tSEZl
X-Google-Smtp-Source: ABdhPJzwfyt6LnQeND7etTX60sQpjec0Ef1sm1CZVGVsiuKSTm67npA+b5LxBzTNkP0gJA8HbwxFr9SoEltIHhMSpSM=
X-Received: by 2002:aca:ac93:0:b0:32a:e3b6:7c52 with SMTP id
 v141-20020acaac93000000b0032ae3b67c52mr1221654oie.294.1653361122621; Mon, 23
 May 2022 19:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
 <CAH2-KxCOC4My0=hgQwjxedmnJ9+qewVkjv1SSCzPdGVfOAwBqA@mail.gmail.com>
In-Reply-To: <CAH2-KxCOC4My0=hgQwjxedmnJ9+qewVkjv1SSCzPdGVfOAwBqA@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Tue, 24 May 2022 10:58:32 +0800
Message-ID: <CAGm54UGwb3-ENOPTCdrWPF_7BX6E9cx4YUavOoHKJ5OLLp47tA@mail.gmail.com>
Subject: Re: [External] Re: The incomplete result of mapper GetSubTree/Paths
To: Ed Tanous <edtanous@google.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 12:19 AM Ed Tanous <edtanous@google.com> wrote:
>
>
>
> On Thu, May 19, 2022 at 8:14 PM Lei Yu <yulei.sh@bytedance.com> wrote:
>>
>> This email is to describe an issue in mapper that the
>> GetSubTree/GetSubTreePaths could return incomplete results when it's
>> doing introspect.
>>
>> Steps to reproduce the issue:
>> 1. Configure phosphor-logging to get max 1000 entries. (with
>> -Derror_info_cap=3D1000 meson option)
>> 2. Create 1000 logging entries.
>> 3. Call GetSubTreePaths and make sure it gets the correct 1000 entries:
>>     # busctl call "xyz.openbmc_project.ObjectMapper"
>> "/xyz/openbmc_project/object_mapper"
>> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
>> /xyz/openbmc_project/logging/entry 0 1
>> xyz.openbmc_project.Logging.Entry | awk '{print $2;}'
>>     1000
>> 4. Restart logging service
>>     # systemctl restart xyz.openbmc_project.Logging.service
>> 5. After the service is restarted, call GetSubTreePaths for multiple
>> times in the short time (e.g. within 10 seconds)
>>     # busctl call "xyz.openbmc_project.ObjectMapper"
>> "/xyz/openbmc_project/object_mapper"
>> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
>> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
>> '{print $2;}'
>>     47
>>     # busctl call "xyz.openbmc_project.ObjectMapper"
>> "/xyz/openbmc_project/object_mapper"
>> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
>> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
>> '{print $2;}'
>>     375
>>     # busctl call "xyz.openbmc_project.ObjectMapper"
>> "/xyz/openbmc_project/object_mapper"
>> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
>> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
>> '{print $2;}'
>>     851
>>     # busctl call "xyz.openbmc_project.ObjectMapper"
>> "/xyz/openbmc_project/object_mapper"
>> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
>> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
>> '{print $2;}'
>>     1000
>>
>> We can see that the result of GetSubTreePaths is increasing until it get=
s 1000.
>> This actually happens when mapper is doing introspect of the logging
>> service, and getting more and more objects.
>>
>> The above "incomplete" behavior will impact the logic that depends on
>> the result of GetSubTreePaths.
>> E.g. in ipmid, the "cached SEL" feature depends on the reliable result
>> of GetSubTreePath, to get the number of current logging entries.
>
>
> I'm not really following why this is a problem, and sounds like a bug in =
the cached SEL feature.  Dbus objects can get added or removed at any time,=
 including logging objects, if the cached sel feature isn't handling all th=
e added/removed signals as it should, that really should be fixed.  Can you=
 go into more detail about what this actually causes?  Is it that logging o=
bjects are getting added out of order?
>

As Patrick also mentioned, the issue is that
1. When a service creates 1000 objects _before_ advertising the
service to the DBus.
2. When it advertises itself, the other services are expected to see
there are 1000 objects, _without_ `interfacesAdded` signal.
3. The reality is that mapper gives a random number between 0~1000
during the introspection.
4. The side effect is that if a service is interested and ask mapper
for the object, it gets incomplete result, and there are no
`interfacesAdded` signal at all, and thus it has the incomplete data
of the DBus objets.

>>
>> If
>> it's not correct, ipmid will not know the "missed" entries.
>
>
> What is a "missed" entry in this context?

See the above example, where the `GetSubTreePaths` API gives result of
47, 375, 851, while the expectation is 1000.

>>
>>
>> The question is, should we make sure mapper returns the "stable"
>> result in the above case?
>
>
> I don't think so, at least, when it was built, it wasn't designed to retu=
rn atomically created results, but given that ANY object on dbus can be add=
ed or removed at any time, it's not clear why this is a problem in the mapp=
er itself.

When an object is added or removed, either it emits
interfacesAdded/Removed signal, or it emits nameOwnerChanged signal.
Both will mapper to do the introspect and get the latest objects. And
when it is doing introspection, it is expected *NOT* to return
"incomplete" result. Otherwise services relying on mapper will have
chance to get incomplete view of the DBus objects.

>
>>
>> When it's doing introspect of a service (e.g. nameOwnerChanged), it
>> could throw if the service is not fully introspected, and only return
>> the "correct" result after the service is fully introspected.
>>
>>
>> If mapper could not guarantee the stable result, the service calling
>> mapper will have to add more complex logic to make sure it gets the
>> "full and correct" result.
>
>
> I left comments on your code review as well, but please don't do this.  T=
his is going to force retry code into EVERY service that relies on the mapp=
er, at EVERY mapper call site.  If the current behavior is truly a problem,=
 I would much rather the mapper support multi-versioned atomically create c=
opies of the dbus-map, and have the mapper expose the "reliable" interface,=
 rather than spreading that throughout the system.  For context, bmcweb alo=
ne has dozens of call sites to the mapper that would need to be fixed if it=
 were made to be possible for it to fail in this way.

The patch is POC to show the problem and a possible fix. Throwing
`ResourceNotFound` may not be a good fix.
But it shall tell the caller about the status of the result, possibly:
* Throwing an "InIntrospect" exception to indicate it's doing
introspecting on the object path. This is similar to what my patch
does, it's just using a more meaningful exception.
* Add a flag in the result to indicate that the result is not
complete. Then the caller who cares could check the flag, and retry
until it gets a complete result.
