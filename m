Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEDD47B2DD
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 19:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHp6q3Yg6z2ywv
	for <lists+openbmc@lfdr.de>; Tue, 21 Dec 2021 05:30:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WmdDr5jV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::436;
 helo=mail-wr1-x436.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=WmdDr5jV; dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHp6L6K80z2yMV
 for <openbmc@lists.ozlabs.org>; Tue, 21 Dec 2021 05:30:00 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id s1so21954858wrg.1
 for <openbmc@lists.ozlabs.org>; Mon, 20 Dec 2021 10:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NK3gowILqnrXTCk3B+Di9asARCiOKmPry8DLwQlexMw=;
 b=WmdDr5jV3YQvOGBzJtJBYeA1I+BdIF3c6uo/qSvcfq5PkCcskG+HBqAJCAgf9VuPzn
 Be5/CR8/A6St89Lfky55CHBw+zZIQgdSSmpwL/UQqm1YY89HAj39HsL3Sy2z8lNVXmdA
 Qpz7Hz1ynu4TkBjFiDqO4fcn/duI3lLdrR2MlziFJInS3cmmLHiZZuPaE+YwHf1/O5jG
 /72LYZhkxSvp0JD1TocstA8HSFMGGPSMy44W0h++f0SuyGg7hnrItyzULrRkAsuG2Zp4
 UpVbi7JAs0EETZciAt6LtbnmqIFCWk3wThHZwgRG7I3G8DTLULW7gIkQ2ShtQd3Nrken
 Hq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NK3gowILqnrXTCk3B+Di9asARCiOKmPry8DLwQlexMw=;
 b=l1OVQusPZHqWHAzjuuCE8jD2CcQAUKJhmeACWZzUPkSqpJf44b0MOHuTGMbyGwA3ST
 itiO7XLIPERN6N8boKK4EyOx0CIyIgfB74px2QIJ+vgC5asL+NM1c8GKVtTU1VizW2qz
 lrH94MYbODltRgDdRECRXyN6FOLTycZOaVtzNGHpPpBsw055Syoyl3Lz6AJ5ktjLxdKQ
 fHDyxvQZpQmZH64qMFwrFacwmAxt+3PgbGbo71cretg0Ht98B10pA4+mpzg5Y2kM+m5/
 I9p6pwYCiIZxexo3m1M8WyO1xFOTrd7aNmnhqweb7UF+U5WrQtXu515Aa3h3PMafh1tx
 Un5g==
X-Gm-Message-State: AOAM531EU03XDoRiu4N29i0IhY8HYDo8ARCCWOooPkn/PkNODhuO69Es
 eGhJ9r7VAh2DUluIYgcAYKfA1kICa2h61xW15PWFHg==
X-Google-Smtp-Source: ABdhPJz+1uOOypx3h0WFLStNdk6o7Th1Y3vsijkyEisknWuMC4cnB7VRxzxhRv9Aefq92uCTyLcDFIwv9VPOpNjibhw=
X-Received: by 2002:adf:aa08:: with SMTP id p8mr14361980wrd.572.1640024992755; 
 Mon, 20 Dec 2021 10:29:52 -0800 (PST)
MIME-Version: 1.0
References: <CAA7TbcvUE+iQxNepB6UcwD760JaKgK-8d3LW1HLk4DcuhbqmYw@mail.gmail.com>
 <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
In-Reply-To: <CAA7Tbct7QyLjEa3WZug=U+jVzhGqLdCeX1H+GU=KNtMnqcAXZg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 20 Dec 2021 10:29:41 -0800
Message-ID: <CAH2-KxDeAixLTj0MH2H+PH0P8NJv2Jf03VCdyxta17jLNuEnHw@mail.gmail.com>
Subject: Re: hwmontempsensor issue in dbus-sensor
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
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
Cc: bruce.mitchell@linux.vnet.ibm.com, Jayashree D <jayashree-d@hcl.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Dec 19, 2021 at 9:11 PM Kumar Thangavel
<kumarthangavel.hcl@gmail.com> wrote:
>
> Hi All,
>
> Gentle Reminder on this.
>
> Thanks,
> Kumar.
>
> On Thu, Dec 16, 2021 at 1:56 PM Kumar Thangavel <kumarthangavel.hcl@gmail.com> wrote:
>>
>> Hi All,
>>
>>
>> In dbus-sensors repo, I saw the patch for changes in Hwmon Temp Sensor.
>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7ab

Bruce, this is your patch.  Could you take a look at the below and
provide your input?

>>
>>
>> While testing those changes in my platform, I found that each sensor in hwmon temp has been creating twice.
>> After analyzed the patch, for below 2 paths SP_OUTLET_TEMP sensor is created twice.
>>
>>
>> /sys/class/hwmon/hwmon2/temp2_input
>> /sys/class/hwmon/hwmon2/temp1_input
>>
>>
>> Before your change, hwmon temp sensor will check whether the path is already exists or not.
>> If it exists, it will skip and proceed with next path.
>> https://github.com/openbmc/dbus-sensors/commit/544e7dc58cecef898fe7d684c3ba0fbce178cf2d#diff-bfc8d7ed4ade4b3519ad3b7fe091f9c79a60faf8a26f410c1568e5341b22b7abL96
>>
>>
>> Could you please explain why it is creating twice in hwmon temp ?
>>
>>
>> Journalctl log before your changes applied :
>>
>>
>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hwmon/hwmon2/temp2_input"
>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Type : xyz.openbmc_project.Configuration.TMP421
>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Name : SP_OUTLET_TEMP
>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Dbus path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>> Dec 31 16:01:32 yosemitev2 hwmontempsensor[286]: Path : "/sys/class/hwmon/hwmon2/temp1_input"
>>
>>
>>
>> Journalctl log after your changes applied :
>>
>>
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hwmon/hwmon2/temp2_input"
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>
>>
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : "/sys/class/hwmon/hwmon2/temp1_input"
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Sensor type : xyz.openbmc_project.Configuration.TMP421
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Name : SP_OUTLET_TEMP
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_TEMP
>> Dec 31 16:01:54 yosemitev2 hwmontempsensor[327]: Path : /xyz/openbmc_project/sensors/temperature/SP_OUTLET_REMOTE_TEMP
>>
>>
>>
>> Thanks,
>>
>> Kumar.
