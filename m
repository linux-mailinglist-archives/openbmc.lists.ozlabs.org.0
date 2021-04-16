Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97938362330
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 16:57:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMK824Y5Cz3brL
	for <lists+openbmc@lfdr.de>; Sat, 17 Apr 2021 00:57:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=T3QUQgSb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=T3QUQgSb; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMK7q17qDz2yRX
 for <openbmc@lists.ozlabs.org>; Sat, 17 Apr 2021 00:57:40 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 65so30430678ybc.4
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 07:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m0pa2n0Fd5PT8RXfIVZlM1eDgOWhtsF7KQsmR8klmB4=;
 b=T3QUQgSbbxzCxfgejU3z8WRUS+RbeuR3KsuPJy4TnFzj2gOTpvFdAdqp9q6ScPajJm
 pL9WXOtu10A7o7BHrLwp5myiMhvreJgGpZrUIFWQM47ZnbmH5vxZsariTsXzNwmevGig
 9kdGpndFwk/e1RZTAutJocZkHIqayVvG+ltmgFeSsCGeEZOgAdDrV34fl4v9aZ0CqrF0
 4kh3qKoArlVg5G+SNdFJq7Fn8caWU8FmCae1VsExIgskOKL+/9O3dCpFuGokHfjsLYow
 8j5b8xtm05zr9BlNr3tdx13rhgyq35OqI5JRRMM/UszTpNYhyp4/a68qnPAVOk2MwlzD
 SxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m0pa2n0Fd5PT8RXfIVZlM1eDgOWhtsF7KQsmR8klmB4=;
 b=Mrw8FWJwno6MVJ2uTwxNafJDOhsZ2QrfEj38BPqdAEmXmHxJ2YMXA0QP1sbqY8IDnX
 wcuM0sFDKV4McfXSjMX5c1+kVkqS6KQnhuwnVpukgl4XgAG696ZAcTlxyEtvjWdzuvlb
 m1qft5et2zv/pPMex2ZLn2EPaCyqEfFkdMYOUq1sdBl/CWMFOIvZbDvM9y4A+GbtkkFD
 AFhmaJcLnTUZ9bEgw9HlpG7osm06N5oe6XV5+QofEY0OheSG3SsNogLnR4IZVnAQ0OCG
 Yry7R27kpggGhHculb/Fax7oA7joWlRKwNwPv16yHbKlEkhN87NWH6YhKLep4b8GP49o
 Yg/w==
X-Gm-Message-State: AOAM5302MLcjBac/5Ze/WiLda/HJa4QICEfdkffOz2B2LU6UFhfEpHHf
 j9AEjxdFX0o3JJboWURBkixYux7QCj7r+lqEcUxWng==
X-Google-Smtp-Source: ABdhPJy/eThNjqctPvbrj7xhqr5Tg/V869uWAOqNRHl39ExWRKQlugmjyA45r+r6I12ZLdcuRv4WxHlcoCyVC9J9TnY=
X-Received: by 2002:a25:37cd:: with SMTP id e196mr6813279yba.148.1618585058778; 
 Fri, 16 Apr 2021 07:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81k7NO-+8OyPhAbk9BNfB58xuK13RvHhG4m-G+nDHPniA@mail.gmail.com>
 <d9176b8e-1944-e654-baea-81064f195d35@gmail.com>
 <CACWQX82sqaoP8aeWxrZZFS_G62wVebBHidpuzfA21Kd4t4BxUQ@mail.gmail.com>
 <23266ce6bbff6023ee2d04b2df572dd366ef2bdc.camel@yadro.com>
In-Reply-To: <23266ce6bbff6023ee2d04b2df572dd366ef2bdc.camel@yadro.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 16 Apr 2021 07:57:27 -0700
Message-ID: <CACWQX82SR5SvOrDORj2PXspd+G13b_h=kDi7aGTUax=LqD6vbw@mail.gmail.com>
Subject: Re: ClientOriginIPAddress is 0.0.0.0 or ""
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
 Sunitha Harish <sunithaharish04@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 6:34 AM Ivan Mikhaylov <i.mikhaylov@yadro.com> wrot=
e:
>
> On Fri, 2021-04-09 at 07:58 -0700, Ed Tanous wrote:
> > On Thu, Apr 8, 2021 at 10:51 PM Sunitha Harish
> > <sunithaharish04@gmail.com> wrote:
> > >
> > > On 06-04-2021 22:21, Ed Tanous wrote:
> > > > On Tue, Mar 23, 2021 at 3:28 PM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=
=9C=96)
> > > > <Jun-Lin.Chen@quantatw.com> wrote:
> > > > > Hi,
> > > > >
> > > > > If continously send POST sessions Redfish request via Postman. I =
observe
> > > > > bmcweb debug logs, it will established connection at first reques=
t then
> > > > > not fetch user ip after the second request.
> > > > >
> > > > >
> > > > >
> > > > > That's why ClientOriginIPAddress in session after the second crea=
ted is
> > > > > always 0.0.0.0 (not be assigned).
> > > > >
> > > > >
> > > > >
> > > > > In HTTP 1.1 It uses keep-alive Header default. so BMC does not fe=
tch
> > > > > user IP when its connection is established.
> > > > >
> > > > >
> > > > >
> > > > > Is this behavior we expect?
> > > > >
> > > > >
> > > > >
> > > > > Best regards,
> > > > >
> > > > > Jun-Lin Chen
> > > >
> > > > Sunitha,
> > > > Considering this is code you wrote, would you mind replying to Jun-=
Lin
> > > > about his experience and what the expected behavior is?  For what i=
t's
> > > > worth, I've seen it report 0.0.0.0 before on my system, I just have=
n't
> > > > had a chance to chase it down and debug it.
> > > >
> > > > -Ed
> > >
> > > Hi Jun-Lin,
> > >
> > > The ClientOriginIPAddress is expected to get populated when the sessi=
on
> > > is established to the BMC ( the first request). This is a one time
> > > fetch, and it will be persisted for that session.
> >
> > Can you think of a reason it would report all zeros?  Can you verify
> > this functionality works properly on your system?
> > Part of me wonders if this has something to do with http keepalive.
> >
> > > Regards,
> > > Sunitha
> > > > >
> > > > > From: Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=96)
> > > > > Sent: Friday, March 5, 2021 4:05 PM
> > > > > To: sunharis@in.ibm.com
> > > > > Cc: openbmc@lists.ozlabs.org
> > > > > Subject: ClientOriginIPAddress is 0.0.0.0 or ""
> > > > >
> > > > >
> > > > >
> > > > > Hi Sunitha,
> > > > >
> > > > >
> > > > >
> > > > > I found some problem when I create session.
> > > > >
> > > > > The property =E2=80=9CClientOriginIPAddress=E2=80=9D is =E2=80=9C=
=E2=80=9D after POST
> > > > > https://${bmc}/login -d '{"username": <>,"password": <>}
> > > > >
> > > > > And it is 0.0.0.0 after POST
> > > > > https://${bmc}/redfish/v1/SessionService/Sessions -d '{"username"=
:
> > > > > <>,"password": <>}'
> > > > >
> > > > > Both of them looked like something wrong. And I also look for sou=
rce
> > > > > code in bmcweb repository.
> > > > >
> > > > > There only defined the default value: =E2=80=9C=E2=80=9D in gener=
ateUserSession() and
> > > > > not found fetch user ip in elsewhere.
> > > > >
> > > > > I think it is why ClientOriginIPAddress is strange.
> > > > >
> > > > >
> > > > >
> > > > > May I ask what step or something I lack in creation session so th=
is
> > > > > property is abnormal?
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > Best regards,
> > > > >
> > > > > Jun-Lin Chen
> > > > >
> > > > >
>
> Hello Ed, I made some research at this point, ipAddress always sets to 0.=
0.0.0
> after first Request, it is done by req.emplace(parser->get()) in doWrite
> function in http/http_connection.h. fetchClientIp sets ipAddress only on
> connection start. It is possible to fix it with additional fetchClientIp =
inside
> handle function which seems overhead or
>
> ipAddress =3D req->ipAddress;
> req.emplace(parser->get());
> req->ipAddress =3D ipAddress;

Yep, this makes sense.  I would expect parsing the ip address to be
almost zero overhead (it should just be a memcpy), so it should be ok
to do on every request.  This is what I think we should do.

Sunitha,
Can you put together a patchset to fix the above and test it works as
expected on your system?

>
> I don't like both variants but possible that ipAddress shouldn't be a par=
t of
> Request struct.

It's part of the request struct so we can separate any handler from
having to know anything about the connection semantics.  This makes it
so we at least have a hope of unit testing things in the future.

>
> Any ideas?
>
