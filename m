Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F23C81AE567
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 21:05:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493lsC6xZHzDsNk
	for <lists+openbmc@lfdr.de>; Sat, 18 Apr 2020 05:05:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12c;
 helo=mail-il1-x12c.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=wB5CC4JN; dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493ljT5sDLzDrbK
 for <openbmc@lists.ozlabs.org>; Sat, 18 Apr 2020 04:58:21 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id x2so1821357ilp.13
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rh3hq0XHg7COTDeAlHxq8PAQQnIUdj4adgsLGlnarE0=;
 b=wB5CC4JNKKlMEI0J18NWkU80jdCdbX0GzeSB6eo4T1INjehUW9z6wJ1Ly5GPvrdM86
 P32H0J9Dn+lNV46+JUvv1r61wWQ3aOu9PEYdnXDdv3qipC3oPbB7amrUbiwnqgHHgAvm
 qtoOTQQp8eLJGuPXwuhVdXxpbDZZ/sm8/kLIIHg/AWyGCPDzO2+xH9TjxkUh+sEaEVIW
 6IWQcCJXxmW+vEdolOnWHWEAySeJujaYISwVTlw44qBRBuSrPngZKwAYWU9iZt7vISg7
 T9a4joP9Z67rtP/vOdWpbN35EGQuQyUWmUsKnAdiHYWRSKwUoF7WueiN2JpSOVQD50KA
 lp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rh3hq0XHg7COTDeAlHxq8PAQQnIUdj4adgsLGlnarE0=;
 b=cMjG6SP474Zl5+Hx4V7LyIZ3pxyCEBirTkq6+/U94KbBdgjpeTGKvPWxEM7KWnPxhs
 sOLCDDvsTWngY5d81ugkxFG146NI0XJGaX6syoboEGyMBHWhex/DA+JqGrWvzhQCqcZ4
 x6K4ibZ0oRLjBy3vF2EBS8phDOKiGjTtmJIj5E2VNmJHy4lAFD08syybLnUMMegMCqWJ
 JrfzPcgXU94NpQmAvUpl/He5cvNY2nDV/8egVoRzr5EjrRTAcThcXj2v54nZoq//gjlZ
 agVKblKAy0WQ81I0iz1lQfGk1a8WPf0yd/7eWK7aUBYIrVyKcxpyncUi1bxfzeF6EaOb
 Xx4A==
X-Gm-Message-State: AGi0PuZp0UzQV6cMwOKv3RmpFMlbiLnA/5yTM5+i9+lb2n6FS1bDy3FD
 xkJbfc9t9MbSDDkC8Q910Y7PydOK0QZX+qfWxLRkRA==
X-Google-Smtp-Source: APiQypIinNJTvfsztsMASmVydYSKZThmBbikaJwHP6mP1W9nG2gy3oyoa36zBfrHX/XqsHxZzA4ehz+e5W4OjxDhopI=
X-Received: by 2002:a92:5dca:: with SMTP id e71mr4348487ilg.34.1587149896163; 
 Fri, 17 Apr 2020 11:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
 <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
 <B555CC60-3770-454E-813B-5F00783E97C7@fb.com>
 <CADKL2t6zJU_rQ+di7FNjjSHq=xo5ig=-u_GBrR51C6DaLQJ0-w@mail.gmail.com>
 <24C73C51-BD4F-489B-A8CE-9DF805F9AAF0@fb.com>
In-Reply-To: <24C73C51-BD4F-489B-A8CE-9DF805F9AAF0@fb.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 17 Apr 2020 11:57:39 -0700
Message-ID: <CADKL2t5Sd6qo2LVpK_=C+w4WzXwimhsGKJoMD78w9DACRw+H1Q@mail.gmail.com>
Subject: Re: nvme sensors
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 Apr 2020 at 11:42, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 4/17/20, 11:11 AM, "Benjamin Fair" <benjaminfair@google.com> =
wrote:
>
>     On Fri, 17 Apr 2020 at 11:05, Vijay Khemka <vijaykhemka@fb.com> wrote=
:
>     >
>     >
>     >
>     > On 4/16/20, 4:35 PM, "Benjamin Fair" <benjaminfair@google.com> wrot=
e:
>     >
>     >     On Thu, 16 Apr 2020 at 16:15, Vijay Khemka <vijaykhemka@fb.com>=
 wrote:
>     >     >
>     >     > Currently, dbus-sensors support reading NVME sensors via mctp=
 only. It uses
>     >     > libmctp and some of smbus patch from Intel. It also uses slav=
e mqueue mctp
>     >     > kernel driver which is not upstream.
>     >     >
>     >     > So currently it is not matured and fully upstreamed.
>     >     >
>     >     > James, how can we use this without mctp. I don't see any non =
mctp support like
>     >     > Sending direct smbus command, please advise if I missed it.
>     >
>     >     If you want to use NVME-MI without MCTP, this use case is suppo=
rted by
>     >     phosphor-nvme. It makes direct SMBus calls.
>     >
>     > Ben, thanks I see that but it needs certain GPIOs like PwrGd, prese=
nce and I am trying to find if
>     > Our platform support any such GPIOs.
>
>     If your platform doesn't have these GPIOs, we should be able to make
>     phosphor-nvme more flexible and not require them. It was designed for
>     one system at first with the expectation that it could become more
>     general over time.
>
> Cool, That will be great. I also don't see recipe file for this.

The recipe file is at
meta-phosphor/recipes-phosphor/sensors/phosphor-nvme_git.bb

> And how easy/hard to integrate this
> with entity manager as we use entity manager to list all sensors.

I'm not familiar enough with entity-manager to say for sure.

>
>     >
>     >     >
>     >     > Regards
>     >     > -Vijay
>     >     >
>     >     >
>     >
>     >
>
>
