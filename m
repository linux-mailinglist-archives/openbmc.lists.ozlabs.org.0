Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE808BDAD
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 17:50:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467HGs3jprzDqfs
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 01:50:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HAdrbada"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467HG54xVTzDqfF
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 01:49:33 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id t14so49413753plr.11
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 08:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/u0iiCi18Z0WrLuJoZtu8bc35q+Tekzfw6Yy7JcqRoo=;
 b=HAdrbadaKTZB6D/PG782DE7o/kQ1sRckq7ChQfAKDuc3kI7O48IwCF97SuAsS5/h48
 oiWMG66qVmHcam5SyxKWfG2l3nhK96toZAhHI5nfMNRepmIngdqsCw8DO/p7m2aVzXXM
 FtAbGDq8JFSCYZ3OMWNzvc90eP3oB8dBTiHyz9CH14ejKiHMUUZ4K9hDck5/7csEyTEw
 fUffN0+2k5P1B9UWE5qtSPazXlDP7k6Q0C47etdhTtRNpcLO8+m7N4w17zjdo7ZH8u2l
 78fMxx7HzvbRJRtTRq2LMmeMM23/D0Qz8I+sv83C3XBUCkYw5u7CBsS4Qp4cwK8xaEw6
 vfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/u0iiCi18Z0WrLuJoZtu8bc35q+Tekzfw6Yy7JcqRoo=;
 b=Q97PVIwlK07E3JVgeEeGG3VR2nSECCzHAT2E4g4nrfA2KkV/TeNgtlLRZwpcB+hgWl
 +AjKs1o69tN7sWtqB1Et9oFgvhUqASO4yDE18JgW+oOkwQl5fGPWsDyK9xvuHtLTJr4U
 fCqvjJdtb35lr+4hO+kky9YX1ryM/AeAsV0zW+L+KR0MthdCsacHG17z59GojJTeA6TZ
 ZGxo/9VvbiHAsdcsFFj0W2OPRcGG4n4mmydPbTHl2FNPvHVMlYgj4EqrzOBYHjOhba0R
 SH+DWH7/bhHdb3+1Hozs4sq6yqi1CE2kLTnU3fzJwEgiKp1DuR5oA1TZklgmRJDDFB5t
 4k7A==
X-Gm-Message-State: APjAAAVnhjlqh4Y3/fBXtjM20MRChSlgYRsbsjAE68o2g6qeUFd/oLf4
 GbgQePWNW91d4wcgwW+iEnAsw8z6CtgGquVT7y91rA==
X-Google-Smtp-Source: APXvYqzurjSOj84WxOA1dud8Z58qzAkwDQlA1v7sN1tfxiUZRnk9lVNreU1w62D4SXg7B3Olw8p6oWUF4iLzoj7HKmk=
X-Received: by 2002:a17:902:e311:: with SMTP id
 cg17mr10911909plb.183.1565711369656; 
 Tue, 13 Aug 2019 08:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
 <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
 <6c7100c2019942dc9d5efad6475038ab@lenovo.com>
In-Reply-To: <6c7100c2019942dc9d5efad6475038ab@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 08:49:17 -0700
Message-ID: <CAO=notwDt+KHOih1JFxOeuU1N6aDTK6qqhOzMJ0nFzRvF9EYdQ@mail.gmail.com>
Subject: Re: [External] Re: Clarify some questions about host tool
 (burn_my_bmc)
To: Andrew MS1 Peng <pengms1@lenovo.com>
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

On Tue, Aug 13, 2019 at 8:15 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
>
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Patrick Venture <venture@google.com>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2019=E5=B9=B48=E6=9C=8813=E6=97=A5 =
22:34
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Andrew MS1 Peng <pengms1@lenovo.com>
> =E6=8A=84=E9=80=81: openbmc@lists.ozlabs.org
> =E4=B8=BB=E9=A2=98: [External] Re: Clarify some questions about host tool=
 (burn_my_bmc)
>
> On Mon, Aug 12, 2019 at 2:43 AM Andrew MS1 Peng <pengms1@lenovo.com> wrot=
e:
> >
> > Hi Patrick,
> >
> >
> >
> > 1.      It took about 4 minutes and 30 seconds for BIOS update with 64M=
B rom image. Could we extension the pollstatus time from 100 sec to 300 sec=
 to get the final status?
>
> I'm curious why it's harmful to check more frequently?
>
>                 I showed some source code of helper.cpp as below, the che=
cking status total time was 100 sec (5*20) but it was not enough for bios u=
pdate and therefore I would like to extension the time from 100 sec to 300 =
sec.
>
>                                         static constexpr auto verificatio=
nSleep =3D 5s;
>                                 ipmi_flash::ActionStatus result =3D ipmi_=
flash::ActionStatus::unknown;
>
>                                         try
>                                 {
>                                         static constexpr int commandAttem=
pts =3D 20;
>                                          int attempts =3D 0;
>                                                 .........................=
...................

So you're not asking to check it less frequently, you're asking it to
allow for a longer period before timing out.

>
> >
> > 2.      If user can choose to preserve BMC configuration (rw area) or B=
IOS configuration when upgrade firmware, do you have any suggestions with r=
egards to preserve configuration implementation or could the host tool supp=
ort to send a parameter to support it?
>
> Since one of the design goals was to keep the interface from the host sim=
ple, and mostly agonistic to what was taking place, consideration wasn't gi=
ven for a mechanism for adding extra parameters.  We're in a similar boat w=
here we want a mechanism for changing the level of upgrade, so I'll go over=
 the design today at some point and see whether we can do it agnostically.
>
> >
> >
> >
> > Regards,
> >
> > Andrew
> >
> >
