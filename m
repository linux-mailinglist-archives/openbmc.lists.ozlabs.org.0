Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DF3559A9
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 18:51:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFD825g1Jz3bsg
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 02:51:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=t/HTJgzl;
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
 header.s=20150623 header.b=t/HTJgzl; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFD7q6ClDz2xgQ
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 02:51:35 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 82so6367305yby.7
 for <openbmc@lists.ozlabs.org>; Tue, 06 Apr 2021 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zi2KNWbIMjf91d8FWqJjdXLXhvKmIqFEa0TfOijIBoE=;
 b=t/HTJgzl1zZAZXjMU9+JL7mM4EaQLC84FUgUEnO64+lFLBUCRAcdOixBkQCJvucsqb
 gjYA+fHVjgpKSOoiZ67QI4vt5xNmgErhyxDr0Wvm0KFQy8TSS71DJQgbtbzfNqQ0nVaF
 CSjyotHTE2ve33FF7TINhU0Md2YjJvMU517MypUnnIjSM6uqCz46lYTBRYcuV/QVVy4x
 piyuKyhy8QpZDyZHHvk+tkz4XMQhgGc54VXL0PyQKtK++oF6AG+IOCCbpX7Ac5nUKxr7
 I1wZ1NI2dIaTVcRRZ/JpGP1sl3Gy+pd3Vp4+yxcWW+ARg61wlf7BzK4QfyjJWuLGRLCm
 c8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zi2KNWbIMjf91d8FWqJjdXLXhvKmIqFEa0TfOijIBoE=;
 b=X1AOtwoVL3lDZ/2lPJwFevRH/+gUGRRkkzny+ll38RdGKwFHogVl3/YZIjG0P05xRA
 MlxabozGCKAoOsRYCJUaW5Oe8AH61zUoT2vSd/Pq3IiFW2zScu2K6t0wjj7BQlWsfBhT
 mt0KTkHv3eteXWj993pEd28GviVAHL8Vi6i0GPxlvhhGsd8MRb+V2PJ6UYlc3vV197ro
 CVAcwwMNgEUICKZWzYFwGydGUvIO68SvQZqbwU/PcDS7HRHVv40MqNlBFviU6fwix8iE
 HNxGaeg7IZrbCpk0LIR+lJr20P7pu678CjbBQhQz0c+UVjjv7BmDaeGE2QLeizN1+yVU
 6y8Q==
X-Gm-Message-State: AOAM530zPhqoMTwFWgizZRnijC9F5beG9R1VOmAvrZeQsv/jtmSwcsTA
 VvXR6wnD4GCMEgIf72FwDKL3yf+WKvmtSkg+IWnNjQ==
X-Google-Smtp-Source: ABdhPJyimAom+F6SDL/NDhjGhhmFbtwgqhzLDcwil2Vb0CDsLuAwMj0EKUGXLrySx+yI64MqhFUAu8XdBVwTXdyQCFY=
X-Received: by 2002:a5b:881:: with SMTP id e1mr23291377ybq.480.1617727893108; 
 Tue, 06 Apr 2021 09:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 6 Apr 2021 09:51:22 -0700
Message-ID: <CACWQX81k7NO-+8OyPhAbk9BNfB58xuK13RvHhG4m-G+nDHPniA@mail.gmail.com>
Subject: Re: ClientOriginIPAddress is 0.0.0.0 or ""
To: =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>, 
 sunithaharish04@gmail.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 3:28 PM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=96)
<Jun-Lin.Chen@quantatw.com> wrote:
>
> Hi,
>
> If continously send POST sessions Redfish request via Postman. I observe =
bmcweb debug logs, it will established connection at first request then not=
 fetch user ip after the second request.
>
>
>
> That's why ClientOriginIPAddress in session after the second created is a=
lways 0.0.0.0 (not be assigned).
>
>
>
> In HTTP 1.1 It uses keep-alive Header default. so BMC does not fetch user=
 IP when its connection is established.
>
>
>
> Is this behavior we expect?
>
>
>
> Best regards,
>
> Jun-Lin Chen


Sunitha,
Considering this is code you wrote, would you mind replying to Jun-Lin
about his experience and what the expected behavior is?  For what it's
worth, I've seen it report 0.0.0.0 before on my system, I just haven't
had a chance to chase it down and debug it.

-Ed

>
>
>
> From: Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=96)
> Sent: Friday, March 5, 2021 4:05 PM
> To: sunharis@in.ibm.com
> Cc: openbmc@lists.ozlabs.org
> Subject: ClientOriginIPAddress is 0.0.0.0 or ""
>
>
>
> Hi Sunitha,
>
>
>
> I found some problem when I create session.
>
> The property =E2=80=9CClientOriginIPAddress=E2=80=9D is =E2=80=9C=E2=80=
=9D after POST https://${bmc}/login -d '{"username": <>,"password": <>}
>
> And it is 0.0.0.0 after POST https://${bmc}/redfish/v1/SessionService/Ses=
sions -d '{"username": <>,"password": <>}'
>
> Both of them looked like something wrong. And I also look for source code=
 in bmcweb repository.
>
> There only defined the default value: =E2=80=9C=E2=80=9D in generateUserS=
ession() and not found fetch user ip in elsewhere.
>
> I think it is why ClientOriginIPAddress is strange.
>
>
>
> May I ask what step or something I lack in creation session so this prope=
rty is abnormal?
>
>
>
>
>
> Best regards,
>
> Jun-Lin Chen
>
>
