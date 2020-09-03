Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BD25C62D
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 18:07:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj5Ld6xyHzDr45
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 02:07:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=groeck@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Q8Vhq/P1; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj4YD0RxNzDqw8
 for <openbmc@lists.ozlabs.org>; Fri,  4 Sep 2020 01:31:58 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id i1so2967885edv.2
 for <openbmc@lists.ozlabs.org>; Thu, 03 Sep 2020 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1mr7BT3kurjj8ufiwIs5gZrlS/7eegMYrCuutLzd4yc=;
 b=Q8Vhq/P1FMsSYY3OzxrEoMnMqm/FaEpjIsLbwfsUTJJHj7dNJafL+ASakFKyvG8iU5
 Kxg2+gRWdiUqIgAPX4onNjTluoNQYttHdWnrr4+RVeMBliEtRBTWON34Tqtzm64gkopc
 +uRSnqmSif86a+ESS7pcs0087WT5ixrQ6HQD9ZNEBW2T9KyTseaeJpYDE7rPg+ZGMxMO
 kqqkAFAWOHqool+xQxVb4p8XVa0reVTLbZDJNLyaL4FKpZS1wXiq+o/umPGGRh04Gh/D
 OYe+catBRMQALe8hhp1esIMwX6nhg0UDHzBkNNqqroMocR/X+rbihXnG8mz2sOBz17LH
 ViKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mr7BT3kurjj8ufiwIs5gZrlS/7eegMYrCuutLzd4yc=;
 b=uHXnIM4MkSZcP6EX4+Uw5H2bh+uyMng9Mjgx1aCpFC/7hJMWrWDy/XZQ892heQlpz1
 JUQ2qezaRiZGE3hWI0qyzNukEceYw7e4zWD+dob5b/wvw++lqZPX8zjWmrdjNrFkLXlx
 +n705vyKdV3M40CPR4o0zvHS9SMViCm5XGkW6V4yTQqNt74Ib0yErXcBhy3GwPnEybXt
 lQfmzL0mS0XqaZrFWIWgVstwG7Z5F0K2IMXzht60qA63eKwnfIGUR31Kq+r/NPOMn4fN
 nNcWR6jZ38qmumgr1TrMHGZYuqtYy+squjtZ9WxfH3tWl/DV/qDGn/ayDpHPt9MDiMNB
 yNpQ==
X-Gm-Message-State: AOAM531tA3Lz1JcMN1wSebmtWhDRThWbNWDqVe8lrxCIa9hYygj3+rQ2
 3wcDqx0rlGboraU6Y9XYWLTHtwMzRE/gGh5IsFKdNQ==
X-Google-Smtp-Source: ABdhPJyW/vn3DTpwuzKZxzr9xiRAo19fW8sEyuZ4wqxsgkOcHqySk8ycPJBeuj/wRZlsdn7h/eZtRLPb6xRNy7AFpXU=
X-Received: by 2002:a50:ed16:: with SMTP id j22mr3791118eds.104.1599147110821; 
 Thu, 03 Sep 2020 08:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <e9f84dab-54c2-d254-6767-14cfc2197318@linux.intel.com>
 <CAA_a9xJ6nAP+nkPoGL1pPEM5zwxYWYQA6TiYgx9qZMw+gBjn_g@mail.gmail.com>
 <CAA_a9xL8TYcW-c3U=C2uT5NQ=WG-A0DPgrC1E=mr11h6fPBemA@mail.gmail.com>
In-Reply-To: <CAA_a9xL8TYcW-c3U=C2uT5NQ=WG-A0DPgrC1E=mr11h6fPBemA@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 3 Sep 2020 08:31:39 -0700
Message-ID: <CABXOdTe3V68T-yveu1XW4Px_C=SUKP_ra7ALsFzZVO70SJu4BA@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Alex Qiu <xqiu@google.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Josh Lehan <krellan@google.com>, James Feist <james.feist@linux.intel.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 3:07 PM Alex Qiu <xqiu@google.com> wrote:
>
> Hi James,
>
> I just tried, now I have no reading at all... I saw you marked your pull request to work in progress. I'll wait for further updates...
>
I may be missing something, but isn't that the idea ?

Thanks,
Guenter

> - Alex Qiu
>
>
> On Wed, Sep 2, 2020 at 1:31 PM Alex Qiu <xqiu@google.com> wrote:
>>
>> Hi James,
>>
>> I think Ed has mentioned the same thing in an internal discussion. I'll give it a try.
>>
>> Anyhow, as discussed with Guenter, EAGAIN still may not be a good use of our case here, as it's not something that a busy loop should wait for. I've also changed the driver to return ENODATA.
>>
>> Thanks!
>>
>> - Alex Qiu
>>
>>
>> On Wed, Sep 2, 2020 at 10:59 AM James Feist <james.feist@linux.intel.com> wrote:
>>>
>>> On 8/31/2020 3:08 PM, Alex Qiu wrote:
>>> > Hi James,
>>> >
>>> > I just came through this doc
>>> > (https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html).
>>> > Looks like that it's a terrible idea for hwmon driver to return EAGAIN
>>> > for dbus-sensors. With that, I think the proper fix is also to use other
>>> > errno instead in our driver, and this caveat should be probably
>>> > documented somewhere.
>>> >
>>>
>>> Hi Alex,
>>>
>>> I hit something similar with peci where timeouts was causing the scan
>>> loop to hang. I remembered that back when we were developing ipmbbridge
>>> we hit something similar with i2c, and the work around was to use the
>>> tcp socket instead
>>> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/reference/ip__tcp/socket.html
>>> as it could correctly handle the errors. This worked for me for the
>>> CpuSensor and is a easy to implement change that might be worth trying
>>> for other sensors
>>> https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/36181.
>>>
>>> Thanks
>>>
>>> James
