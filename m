Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBA258518
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 03:22:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgTp83YlnzDqLf
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 11:22:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=groeck@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JiSGWiMx; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgRrq6966zDqV3
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:54:44 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id z22so6122ejl.7
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5QIJ6afejmPXX2WFtdGz0KfG/oLSsHB4OUGX5elA45k=;
 b=JiSGWiMx94wkYMcywby23oTWdGMif7VjQIQCa/rSzAs+1Opr98hqiaJYZEIHQVTZW2
 xVGH777jQm5VOvn3XzXVvcsEOM3+76wpKO+55Go4gRCfqkrvUSEVvBlW5CNC3pJ9+o8X
 NTZVwd2jK2aOIzAVPLT9Q1rcVMvEr+2mY6i/1V+FAZLUtHMcjxJKH7jqBHEPQO2tBzLj
 8iHXvT1h+95Z49wjawdIoyMgxpfpCmBE7CmoboHOFJe/h4m4jbYoFjbxzfEKP2NUBR3e
 dkgSHKkktJDZJ9MaMjZc0+tRFmSRdMHvSc7MRj6nMRs/xsNJrZw52A0Xoz2HCOkOLZf/
 EJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5QIJ6afejmPXX2WFtdGz0KfG/oLSsHB4OUGX5elA45k=;
 b=XA7jTrrMBPdr7MDTYNIs+ee1L8AuCTc0sjdRC5nrTTA9JL8KDpr6v3qOuPsSlAilcH
 GNdLd+guWpL2IPvWlXmtILWIgY6NPVU4KE6o95B8R/h7ZdZdXIVhwhHY/jiLWBJ+QYTi
 iC3XuFqQJu8tpSy0qxmSvabCHQSVLihuVIoSlnL/PUNZ+yTPl2a8Ft7ZTQSXYaOuSPnG
 TpJgP/PUbqm+nJkxcbvSWv7NXsIfHLmWwxiuF4y60cOqE0l2yDN8zFXxRvZ7bV6crcLj
 46TLiZwoSqH08fXqr0Q4f9XvlVgaehKmIXgXnP4kITqo1x4q577mfkU1Ng5cRUxmwLLg
 XHPg==
X-Gm-Message-State: AOAM530W4R6Esi4wLOM+nqyOCGUET3cNUJf1FlzA8pSH9tkAyjG5FCt/
 giLTN1vF1I8nU+JVN9Nwkdl4Z+Hopptx1FtCm6t0EQ==
X-Google-Smtp-Source: ABdhPJy0cYxJSDF1uC+S7TuEKKvBXWV0fgykgqOYR8TGosAwYwN7uKDH346Bdq1ZHgaqMbO/UxiAXwNgcaX/WP6sZF8=
X-Received: by 2002:a17:906:4151:: with SMTP id
 l17mr3403813ejk.116.1598918078496; 
 Mon, 31 Aug 2020 16:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
In-Reply-To: <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
From: Guenter Roeck <groeck@google.com>
Date: Mon, 31 Aug 2020 16:54:27 -0700
Message-ID: <CABXOdTdZiUT23eU6fgFZ7DMh7LFEaWhKzXZF2hrFahj0m2vN=A@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Alex Qiu <xqiu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 01 Sep 2020 11:22:05 +1000
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

On Mon, Aug 31, 2020 at 3:09 PM Alex Qiu <xqiu@google.com> wrote:
>
> Hi James,
>
> I just came through this doc (https://www.boost.org/doc/libs/1_74_0/doc/h=
tml/boost_asio/overview/posix/stream_descriptor.html). Looks like that it's=
 a terrible idea for hwmon driver to return EAGAIN for dbus-sensors. With t=
hat, I think the proper fix is also to use other errno instead in our drive=
r, and this caveat should be probably documented somewhere.
>
> Hi Guenter,
>
> Is it reasonable for hwmon drivers to return EAGAIN? Is it something that=
 has special meaning and should be avoided in hwmon drivers?
>

Not sure how to relate the link above with -EAGAIN, but ... -EAGAIN
might trigger userspace to try again immediately, which would
potentially be quite bad. We had seen that effect at a previous
company, where it ended up overwhelming userspace. So I am not
entirely in favor of it. How about -ENODATA ? that might make more
sense unless the problem is known to be a short term glitch.

Thanks,
Guenter

> Thank you!
>
> - Alex Qiu
>
>
> On Mon, Aug 31, 2020 at 2:32 PM Alex Qiu <xqiu@google.com> wrote:
>>
>> Hi James,
>>
>> I think BiosPist power state might not suffice, because the host needs t=
o load firmware onto the device in order to enable the sensors at a certain=
 stage in the OS boot, which is very close to boot completion.
>>
>> However, we can tolerate the fan being noisy before boot completion, and=
 I believe the root cause the issue is the HwmonTempSensor freezes once the=
 control flow hitting boost::asio::async_read_until (https://github.com/ope=
nbmc/dbus-sensors/blob/master/src/HwmonTempSensor.cpp#L92). Do you know if =
this function has something special to do with a file that can have errno E=
AGAIN? Based on that, replacing the errno in the driver with sth other than=
 EAGAIN also seems to be a viable fix.
>>
>> Thanks!
>>
>> - Alex Qiu
>>
>>
>>
>> - Alex Qiu
>>
>>
>> On Fri, Aug 28, 2020 at 10:54 AM James Feist <james.feist@linux.intel.co=
m> wrote:
>>>
>>> On 8/28/2020 9:43 AM, Alex Qiu wrote:
>>> > Hi James,
>>> >
>>> > Thx for the reply! So right now, one thing is that the sensor is not
>>> > dependent on the power state of the host solely, but also dependent o=
n
>>> > the boot progress of the host.
>>>
>>> Would the BiosPost power state not suffice?
>>>
>>> > And the more serious issue is that
>>> > returning EAGAIN from the driver freezes the sensor, which is what I'=
m
>>> > debugging right now. Do we have special treatment on errno returned b=
y
>>> > the driver? Thx.
>>>
>>> I ran into a similar issue with the CPUSensor and this was my fix:
>>> https://github.com/openbmc/dbus-sensors/commit/c22b842bfa8cfe798d83f99f=
a7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0
>>>
>>> I haven't hit this issue with hwmon sensor though.
>>>
>>> >
>>> > - Alex Qiu
>>> >
>>> >
>>> > On Fri, Aug 28, 2020 at 9:38 AM James Feist <james.feist@linux.intel.=
com
>>> > <mailto:james.feist@linux.intel.com>> wrote:
>>> >
>>> >     On 8/27/2020 2:49 PM, Alex Qiu wrote:
>>> >      > Hi James,
>>> >      >
>>> >      > After some debugging, I realized that the code I pointed out e=
arlier
>>> >      > wasn't the root cause. Update is that, the HwmonTempSensor sto=
ps
>>> >      > updating after the hwmon driver returns EAGAIN as errno. I'll =
keep
>>> >      > debugging...
>>> >      >
>>> >      > - Alex Qiu
>>> >      >
>>> >      >
>>> >      > On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com
>>> >     <mailto:xqiu@google.com>
>>> >      > <mailto:xqiu@google.com <mailto:xqiu@google.com>>> wrote:
>>> >      >
>>> >      >     Hi James and OpenBMC community,
>>> >      >
>>> >      >     We have a sensor for HwmonTempSensor which doesn't have a =
valid
>>> >      >     reading until the host is fully booted. Before it's becomi=
ng
>>> >     alive
>>> >      >     and useful, it's getting disabled in code
>>> >      >
>>> >       (https://github.com/openbmc/dbus-sensors/blob/master/include/se=
nsor.hpp#L266)
>>> >      >     because of errors thrown up by the hwmon driver. Ideally, =
the
>>> >      >     thermal control loop should kick the fan to fail safe mode
>>> >     until no
>>> >      >     more errors are observed.
>>> >      >
>>> >      >     Any suggestions on how we should handle this kind of senso=
r
>>> >     properly?
>>> >
>>> >     For what its worth we use the PowerState property that has option=
s of
>>> >     power on or BiosPost to disable scanning when the state is invali=
d:
>>> >     https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac=
655f3eda785f6845f214/src/HwmonTempMain.cpp#L208
>>> >
>>> >
>>> >      >
>>> >      >     Thank you!
>>> >      >
>>> >      >     - Alex Qiu
>>> >      >
>>> >
