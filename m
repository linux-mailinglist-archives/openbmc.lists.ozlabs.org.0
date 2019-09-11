Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADEAFF1C
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 16:48:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4X05RMVzF3C1
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 00:48:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="J623g2ha"; 
 dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4TL3BbczF27h
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 00:45:57 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id k1so10241707pls.11
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 07:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7wunQrDSJiVI7WWMZTIGSTz1wGvZJGGamPIh19gcoE8=;
 b=J623g2haC6SKYYD7ZukSmX7PrDHsjlf/uDtTE8Akzoh0lzFTZ2mACeB1pGm75hjHtn
 wbVtQedIQhjCIBGrhHXDkGSYUssAf+mkWruak0vfOjVwJWLzFEX+XyyolXgoyiBZXO+r
 d+XAHqCZqJkNies8vgdWb/fEn4SF6U4yHJe/eNFBqHY224IS7gk/SAufBEroKdzmDvmO
 S8RBsS0/l/wBLSeMrn9QqCLJzjIyooO2qTvN8Z8rKrHZUlGe8vYkIZGGYcA1ubFzfkCk
 uhm9fKZRzf0WyDS+kMvhOJwCXxuvQq5tnKUVYGFr7uhfGRWwHOkcKpYcOEBV5+6jpYjU
 pRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7wunQrDSJiVI7WWMZTIGSTz1wGvZJGGamPIh19gcoE8=;
 b=ap0aVvAOCmwrylb2mFj06miuXl2VyM7o7K5nNzUstaA9Suv5L+1RVufm9pThXI5RlA
 I25tOpfvNReg/KP4uEPyb2BmC15D0PQudI1jjJBcuSWsv53q9fovFP8vTJeXNZqaziOq
 ccwY4iiCa78a/p+d2oSem5akMsdOEbDMJNP2xUYQpXIdMFau8bVrduBfZP5iunOkbNU6
 FOAeYly4ah39QXALgSIGQ6/JeUEgdccNucqlwGv9a8B3B0OtH3hCKNJqVv/C5gQzl8bn
 Is5znueZVjztQ0GqKMsjD8fBN0WKWExmRbBf9h08YvAoaSLqhj6UXyg6X+h2mGq2v6pO
 BnIQ==
X-Gm-Message-State: APjAAAXoP+9WgRxm/JiBijxou4b0+OpqI8Qi7oJQY1TlobMPSAg7MD4O
 rdQ/HzAviTaGQ0BGiIOjuFdZiHOx+aJqJMmUk6joZw==
X-Google-Smtp-Source: APXvYqyhEkU3vK4KSRiNtamih48NfROE47HImTbjI+VHwLav1JsBUeaYS2BoPcnwa0se51aBwK3Aha+Dxsr1XZKR0YY=
X-Received: by 2002:a17:902:848c:: with SMTP id
 c12mr37491696plo.47.1568213153590; 
 Wed, 11 Sep 2019 07:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <2634903dafda431988ffabd873710768@lenovo.com>
In-Reply-To: <2634903dafda431988ffabd873710768@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 11 Sep 2019 07:45:42 -0700
Message-ID: <CAO=notwLxLPEhxVj+A8Q0TcnSU2HVG_CFr5BvbwaSUU2bwgfjQ@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Update over eSPI interface
To: Harry Sung1 <hsung1@lenovo.com>
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
Cc: Andrew MS1 Peng <pengms1@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Oskar Senft <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 1:59 AM Harry Sung1 <hsung1@lenovo.com> wrote:
>
>
> > On Mon, Sep 9, 2019 at 7:01 AM Oskar Senft <osk@google.com> wrote:
> > >
> > > Hi Harry
> > >
> > > What's the behavior on eSPI? I assume you still have the aspeed-lpc-c=
trl
> > enabled, right?
> > >
> > > Thanks
> > > Oskar.
>
> Hi Oskar,
> Yes, I still enabled the aspeed-lpc-ctrl in my build. Because phosphor-ip=
mi-flash has some mandatory actions on /dev/aspeed-lpc-ctrl before flash (s=
ettings for HICR5, HICR7 and HICR8) even though these settings are meaningl=
ess for eSPI.
>
> Currently, I set ESPI084 (source address) and ESPI088 (target address) re=
gisters manually because linux seems not have a driver can help us to set E=
SPI084 and ESPI088.
>
> Due to the limitation of AST2500, we can only write 256 bytes in one writ=
e operation (write shared memory).
> Based on the test result, it takes about 30 mins to transfer a 32MB image=
 over eSPI.

:( wow, that's unfortunately rather slow.

>
> Thanks,
> Harry
> > >
> > > On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 <hsung1@lenovo.com> wrote:
> > >>
> > >> Hi Patrick,
> > >>
> > >>
> > >>
> > >> I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not support flash=
 over eSPI yet.
> > >>
> > >> May I ask if you have any plans to support flash over eSPI?
> > >>
> > >>
> > >>
> > >> I have done a simple test about shared memory between host and BMC :
> > >>
> > >> The shared memory is work after I set ESPI084 (source address) and E=
SPI088
> > (target address) registers.
> > >>
> > >> But it has an limitation that only 256 bytes are available on each p=
age (4KB).
> > >>
> > >>
> > >> For example, if host address starts to write from 0xFE0B0000 (BMC
> > >> reserved enough memory already)
> > >>
> > >> Writable area are:
> > >>
> > >> 0xFE0B0000 ~ 0xFE0B00FF
> > >>
> > >> 0xFE0B1000 ~ 0xFE0B10FF
> > >>
> > >> 0xFE0B2000 ~ 0xFE0B20FF
> > >>
> > >> 0xFE0B3000 ~ 0xFE0B30FF
> > >>
> > >> =E2=80=A6
> > >>
> > >> =E2=80=A6
> > >>
> > >> =E2=80=A6
> > >>
> > >>
> > >>
> > >>
> > >>
> > >> Thanks,
> > >> Harry
> >
> > Harry, currently there's no plan to implement it as I have no method of=
 testing
> > it,  However, it should prove fairly straightforward to add another opt=
ion to
> > the transport mechanism list.  Please let me know if you run into any
> > blockers.
>
> Hi Patrick,
> Got it. The better way to set eSPI register is setting them by the driver=
, right?
> For quick validation, I am going to use the " ipmilpc" interface and set =
necessary eSPI registers manually.

I don't know as much about the eSPI variation of this.  ipmilpc uses
whatever LPC memory shared option is available (in coordination with
the host+bmc).  If eSPI doesn't use the aspeed-lpc-ctrl driver for
what it needs, then perhaps a new option should be added ipmiespi?

>
> Thanks,
> Harry
