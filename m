Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB4DA454
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 05:25:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tvgc2hBRzDrB2
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 14:25:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EBD9kB5U"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tvfm4WLJzDr45
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 14:24:48 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id q24so399431plr.13
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 20:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AjCJ4DerlmnVkiv2BjAXJNvMFrlTtmx9YGo+42h3rSs=;
 b=EBD9kB5UCNoxyBbsW8V0XGHZeTU0qNQQYDTCXEkZlNrWbwC09gtl3vYv0ttzma+Ipr
 kRSyWzpziWQlgk9Wy4S3HzjYi70ZWO6DY69Q4lY4s1ywGyzecceBzmDSWckWB6+QU6az
 93dQqrcmHi7ILixfnLZ0WffOGFcfa+siO9J8rtTRNK6X9tEPPBrNk+nIO12xVMaZj14l
 TjKvc+rXb+4HyLWG0srU6DdrFeymixdi5vnkKVSZjeJ+4x0v/Ktt5dfOgTUehCr+8ic4
 fIUfPoeNm4lk9UT5OvEfkgXM5ucVnEAnAcfynwYnZ852s9S8x3f5OCVydHuvstQy2H78
 G+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AjCJ4DerlmnVkiv2BjAXJNvMFrlTtmx9YGo+42h3rSs=;
 b=ERQxk5k9M6khliqs52HosKhe7hHNBqHhIlnua2Ln058ESwm95iS+otdH5x8my6lXRF
 YcXMyjIZ/nuLtgOh627oax1mtBz+RmfipNWFOmIku6yg8jq9hSsv+HbLrakRhiaumBxI
 /U4hwmCWwEBQ2wONw7ba5p0KbQC44igz1ghSag6X5Oj77PeVgW9Bt1DG6GF8kBqN9M9O
 dW8QvKLck9Diws2cZngGSExSVKEumeQY8Dnq+A4n9Dw5vmxvT8v2HnczUucRQg8eVlCF
 nckX+uyhhZ+cBfGJREU/90nJdmO8nbW/mWvnX6k7Jfke6x0VomgHzHCUBBnjMC8XURkn
 rtEw==
X-Gm-Message-State: APjAAAVK7/ye4MmMsb53QdkNSqpcD5I/LOSIPa+D6dIsiDFwIgQg8DX5
 di/Iyhij7EPOoLsG027Pz60R6OzCISqmBfvbyRoV8Y91Sek=
X-Google-Smtp-Source: APXvYqwoTZM4Poz5oFP0EqhjpBQyq6xNjiQxP0QAUgZ/mWlJ2H1Jf39HApeY5hGQ/2ZM2E0S8R8FNGp+vYnBJoV56vE=
X-Received: by 2002:a17:902:690c:: with SMTP id
 j12mr1583040plk.183.1571282685306; 
 Wed, 16 Oct 2019 20:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR02MB33485BCC0DF6AEFCC484A9C69F900@HK0PR02MB3348.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB33485BCC0DF6AEFCC484A9C69F900@HK0PR02MB3348.apcprd02.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 16 Oct 2019 20:24:34 -0700
Message-ID: <CAO=notwvRV-9thNgSN2eSeFh_krObDk5airkO95G34778_xm0A@mail.gmail.com>
Subject: Re: How to build phosphor-ipmi-flash for Windows
To: "Bright Cheng/WYHQ/Wiwynn" <Bright_Cheng@wiwynn.com>
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

On Mon, Oct 14, 2019 at 1:11 AM Bright Cheng/WYHQ/Wiwynn
<Bright_Cheng@wiwynn.com> wrote:
>
> Hi,
>
>
>
> I want to build phosphor-ipmi-flash host-tool (burn_my_bmc) for Windows, =
does this host-tool can run in Windows?
>
> If yes, I=E2=80=99d like to know how to build phosphor-ipmi-flash host-to=
ol for Windows?
>
>
>
> I tried to build it under Centos and used i686-w64-mingw32 4.9.0 and add =
option =E2=80=9C--host=3D i686-w64-mingw32=E2=80=9D behind ./configure.
>
> But i686-w64-mingw32 4.9.0 doesn=E2=80=99t support C++17.
>
> And I tried to build it under Windows, but I cannot successfully build pc=
iutil and ipmi-blob-tool.

I've never tried to build any of it for Windows and I honestly
wouldn't know where to begin.  But I will definitely review any
patches to enable multiple platform building.

Thanks

>
>
>
>
>
> Thanks in advanced for any insight!
>
>
>
>
>
> Sincerely
>
> Bright
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
>
> This email contains confidential or legally privileged information and is=
 for the sole use of its intended recipient.
>
> Any unauthorized review, use, copying or distribution of this email or th=
e content of this email is strictly prohibited.
>
> If you are not the intended recipient, you may reply to the sender and sh=
ould delete this e-mail immediately.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
