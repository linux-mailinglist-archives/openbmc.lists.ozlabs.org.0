Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E197C35A197
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 16:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH1VS5nWJz3bsk
	for <lists+openbmc@lfdr.de>; Sat, 10 Apr 2021 00:58:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=isAJh+YV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=isAJh+YV; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH1VF2QRZz303Q
 for <openbmc@lists.ozlabs.org>; Sat, 10 Apr 2021 00:58:43 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 82so6884155yby.7
 for <openbmc@lists.ozlabs.org>; Fri, 09 Apr 2021 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NHxsE3EMHk+EhD3JyNNdbV5MEtrwo2dmkS7Jmpb0FTQ=;
 b=isAJh+YV639LQYFSyN7D6wPdx0E85y+Da/JTsMrOiQ61nvJ9vb5rSE0eogJhKFqDRG
 3qNc4ZeB3rHPDCvMCJDn/dhszlJm3wC/9mLtVndnwtr0sVGXV1YrnpID/hKRpZ2WWXG2
 MwloR9AVbMrKeNVVBt2xz+rstQ/WhgLferaxEh8xxzOzV+Bciv6/Do37F9MhHHjUMMgJ
 QksCC8L9UlhRwG3ecaiNsaIBzIPGU0Ukqed27bq8BDKvGWgJQnPxRFxXstkw8Z1/zhJv
 iEdbkxVduO3j1z98HDuVoDdGTf2C5DdvGUHqnTHjnP2ZdP6+xFclS8/kXDGRmVizOT5q
 9LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NHxsE3EMHk+EhD3JyNNdbV5MEtrwo2dmkS7Jmpb0FTQ=;
 b=Zkw9XmpevqxbJncD1aS26ALbhcGN6yXFJGl5eUL6c+mzpZ2c64X90bVtt/n+Qi3XGp
 3yXuqKipRGVN7Xg55wk0UrkWvWgqv3oEr5tU9MBIPhgFK8islPqsWnSDMjC5lft7yd9S
 c+r7r5avEfIpH49ETlbQED0Ri12epSSaYEmtZY+1NXa+QeLmEU6fZM+DgJYafgrjyDnJ
 VIla6uis1A2o13c0U9ZZHxBf4ul5CaG06JpcCsYXjOjx/Y8SDy7t3Y6QpSaIfhC/fWhc
 uLXF1QKa0Ot2X7cx0RTH5HwOaYF04yBFPsqQ1Yxs2FAVMl2yRJ93Z5xH6d0ojLR04ASi
 qusg==
X-Gm-Message-State: AOAM532ylS0fy1DwNLYx1yduXxVHdS/t+WiETpVeinZTj5pIuzqgRPRd
 yZrFzFO4HJSlRRsnuC5/6hh1Rkd3UVjZUL7mQv1ADQ==
X-Google-Smtp-Source: ABdhPJxKlSS8h2vfYWM1x73nlyRgo1W/TVGxFgaPOGHvMNRsVVz0OdZ/XGLChhd04PRHZhAIDTw9kCYnLFa/JObQQcU=
X-Received: by 2002:a25:c750:: with SMTP id w77mr18029190ybe.340.1617980319071; 
 Fri, 09 Apr 2021 07:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81k7NO-+8OyPhAbk9BNfB58xuK13RvHhG4m-G+nDHPniA@mail.gmail.com>
 <d9176b8e-1944-e654-baea-81064f195d35@gmail.com>
In-Reply-To: <d9176b8e-1944-e654-baea-81064f195d35@gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 9 Apr 2021 07:58:28 -0700
Message-ID: <CACWQX82sqaoP8aeWxrZZFS_G62wVebBHidpuzfA21Kd4t4BxUQ@mail.gmail.com>
Subject: Re: ClientOriginIPAddress is 0.0.0.0 or ""
To: Sunitha Harish <sunithaharish04@gmail.com>
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
Cc: =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 8, 2021 at 10:51 PM Sunitha Harish
<sunithaharish04@gmail.com> wrote:
>
>
> On 06-04-2021 22:21, Ed Tanous wrote:
> > On Tue, Mar 23, 2021 at 3:28 PM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=
=96)
> > <Jun-Lin.Chen@quantatw.com> wrote:
> >> Hi,
> >>
> >> If continously send POST sessions Redfish request via Postman. I obser=
ve bmcweb debug logs, it will established connection at first request then =
not fetch user ip after the second request.
> >>
> >>
> >>
> >> That's why ClientOriginIPAddress in session after the second created i=
s always 0.0.0.0 (not be assigned).
> >>
> >>
> >>
> >> In HTTP 1.1 It uses keep-alive Header default. so BMC does not fetch u=
ser IP when its connection is established.
> >>
> >>
> >>
> >> Is this behavior we expect?
> >>
> >>
> >>
> >> Best regards,
> >>
> >> Jun-Lin Chen
> >
> > Sunitha,
> > Considering this is code you wrote, would you mind replying to Jun-Lin
> > about his experience and what the expected behavior is?  For what it's
> > worth, I've seen it report 0.0.0.0 before on my system, I just haven't
> > had a chance to chase it down and debug it.
> >
> > -Ed
>
> Hi Jun-Lin,
>
> The ClientOriginIPAddress is expected to get populated when the session
> is established to the BMC ( the first request). This is a one time
> fetch, and it will be persisted for that session.

Can you think of a reason it would report all zeros?  Can you verify
this functionality works properly on your system?
Part of me wonders if this has something to do with http keepalive.

>
> Regards,
> Sunitha
> >>
> >>
> >> From: Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=96)
> >> Sent: Friday, March 5, 2021 4:05 PM
> >> To: sunharis@in.ibm.com
> >> Cc: openbmc@lists.ozlabs.org
> >> Subject: ClientOriginIPAddress is 0.0.0.0 or ""
> >>
> >>
> >>
> >> Hi Sunitha,
> >>
> >>
> >>
> >> I found some problem when I create session.
> >>
> >> The property =E2=80=9CClientOriginIPAddress=E2=80=9D is =E2=80=9C=E2=
=80=9D after POST https://${bmc}/login -d '{"username": <>,"password": <>}
> >>
> >> And it is 0.0.0.0 after POST https://${bmc}/redfish/v1/SessionService/=
Sessions -d '{"username": <>,"password": <>}'
> >>
> >> Both of them looked like something wrong. And I also look for source c=
ode in bmcweb repository.
> >>
> >> There only defined the default value: =E2=80=9C=E2=80=9D in generateUs=
erSession() and not found fetch user ip in elsewhere.
> >>
> >> I think it is why ClientOriginIPAddress is strange.
> >>
> >>
> >>
> >> May I ask what step or something I lack in creation session so this pr=
operty is abnormal?
> >>
> >>
> >>
> >>
> >>
> >> Best regards,
> >>
> >> Jun-Lin Chen
> >>
> >>
