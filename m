Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70143176BCD
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 03:52:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WhPw6JkFzDqfF
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 13:52:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jQxAqA3b; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WhNh6GjzzDqM3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 13:51:32 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id j80so1491419oih.7
 for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2020 18:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9AVZMOkXPZEhp0bspHirjVcFtVG9E6ZQO0tOBmhNK0w=;
 b=jQxAqA3bSgneTE+FUlmCEW/jzvW4fbldqoHhZsxgOu2/mu4ds7S/Ln8Gkkw6KGSl13
 AFz4DcnLlDDEGygKKkwqZ9tnFtpgw3kgxHYHRmOobC27m78gJhD0wr6FB1jLGhSqSMBU
 00Jhe1O1v/g8flKq086gA0V/zOEuLF7usJoUZpVBnE6cerfNmoaJgNZnJXdLusuOPV8w
 lUzrpG6cgFaPtxdoJ9NDiTAsp3VViUoGImNscaEDRkoqjULY6wOpANst9NJSzo63d1fP
 4+mtmcgxCtS6O5T5b5xiLNCypZYGKYrcSvJTFBz882ZWgkI33XKhgezeDCWPAxVTAoQA
 3utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=9AVZMOkXPZEhp0bspHirjVcFtVG9E6ZQO0tOBmhNK0w=;
 b=Ny2kYCqDgPQ4XVfkqmEwWZmtt27hD+m8vydLvYBpT42/yJDiLHgKvwKkF3cMz7z9Bs
 lPkHduyyxfo9ZFcP0J4iFO1s75vDQ1p8d5FexN+bHx2E5Z6JEvzikMs4L3MP1f6Evq0t
 cLFtj4XVbcwqYCef/Bw7rpJHH0bHDYfwISRaTOQ03ntSzhN9ixGaeojf5F1dLEl+IioS
 OPmPtMJ2P+gQsyfEW36thc6hDOmZA+cnRUHnTcRs22xyiMJBq5R/e7JcOtByXm8FB6Qm
 IEgineo0ce7gZk2idGaja5WFaKo0/+5dXCWcgY6lLhbhXhPXlfnTwvjVn2/q9gQOAVjI
 mmAA==
X-Gm-Message-State: ANhLgQ1s6bpoP0XA39PurKfrqCcC9jjtGBm46IHFyYcFL2HPurFksqB0
 aPzKZkE1apw8Pgc114/EaFM=
X-Google-Smtp-Source: ADFU+vtF/VV9WA5lXb/HJ42UOSjTcfnB+fuMtzOf+ttbjCLLmOt3Mq0P+8P6Cm6bR47FPkn6TQyrXg==
X-Received: by 2002:a05:6808:b22:: with SMTP id
 t2mr1054245oij.40.1583203888930; 
 Mon, 02 Mar 2020 18:51:28 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:7092:f573:b2b5:4037])
 by smtp.gmail.com with ESMTPSA id m18sm7259785otf.6.2020.03.02.18.51.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 18:51:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: BMC Compiling and running
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <31609.1583172370@localhost>
Date: Mon, 2 Mar 2020 20:51:27 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B1DBB16-3568-482E-91DC-5E35399D1888@gmail.com>
References: <CA+k9xxb=5KMq+yruOAja9L9asquJ=FNPMoajyOsdHda2Ae3jTw@mail.gmail.com>
 <31609.1583172370@localhost>
To: Michael Richardson <mcr@sandelman.ca>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: openbmc@lists.ozlabs.org, Samuel Herts <sdherts@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Mar 2, 2020, at 12:06 PM, Michael Richardson <mcr@sandelman.ca> =
wrote:
>=20
> Samuel Herts <sdherts@gmail.com> wrote:
>> Apologies for all the constant questions. I am trying to add code to =
the
>> Hello World tutorial, specifically a system call to run a shell =
script on
>> the QEMU BMC. The problem I run into is in the image below. My bmc =
state
>> manager main looks like the following as well.
>=20
> It looks like your hello world program was not properly linked.
> Usually, that results in no executable being created.
> Maybe, you linked against a different version of a share library than =
is in
> the target image.

Yes, most likely your SDK that you are using to build the bmc =
application
does not match the level of code your are running in QEMU.

If you=E2=80=99re using images from jenkins, try and match the git =
commit
id=E2=80=99s up in these 2 jobs (for your image and SDK)

=
https://openpower.xyz/job/openbmc-build-sdk/distro=3Dubuntu,target=3Dromul=
us/=20
=
https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=3Dbuilder,ta=
rget=3Dromulus/=20

>=20
> --
> ]               Never tell me the odds!                 | ipv6 mesh =
networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT =
architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on =
rails    [
>=20
>=20
>=20

