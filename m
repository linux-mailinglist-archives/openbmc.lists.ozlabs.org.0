Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A808AB1363
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 19:20:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TlsW1XX9zF4l3
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 03:20:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="qIgPspET"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tlrl43hbzF43X
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 03:20:04 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id f12so56540956iog.12
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 10:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=joqilh0aBA9WWkmNdjKuyp9uZp3SPRj1WDuxjxGOlUs=;
 b=qIgPspETFRLHtbDKBvYuvyAS1TPWCnqjPMNHjfX3o/f1fGzhJkoQaHT3BzGjb/QomE
 qm//NWMEoEIsHsoXEHSAZg0aQkD3b9URYxxitipZqJ/05eNe+9zi9b8hAUmp2vhCq/+V
 tHfjsIbgxb0ScM3m/fZQ52Eq4c6/RYW0QNka1cPX95WtFuGkrcDjWq/LJuh5ltQbMO8H
 ewse+HOHw6oAAz53T+EkRaoUjdFJQ5yRr4hoqvLIaSTEa2hBOJKJheLGJm+q1Fwpjtua
 mpzT1O0ybSWBkvenXLk5ny68bn7qPmuwFeQfRxYFr7BR856qF2ItSMNDSE4kt/qxa5aq
 n/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=joqilh0aBA9WWkmNdjKuyp9uZp3SPRj1WDuxjxGOlUs=;
 b=i4/ovgY4RSamm9fv+7QS2GZe4l8rib3BHd4PqrGnbpsBCVZ9GY0Ev0MquCBy3Jng7o
 5EadZkUFhDPr+i3iJFhW9TNeXMjGVBaXmrS5ePPxOwHageFgNGuL5JtIS2Kae7gbbfPG
 +Ef/NSeQ7gbDJUG6ANZ3TNYKW4PMgqxGm5ikKGzWpE9ztql3jiYXQP99opjtz71jMbYG
 OkPy6UBjAvj3JDuna0uFu8C8S2ITsT73j7nmwSzbwPyt+OT179KFkEHLUNDHKEI/KJmN
 +SgwZh5V+DJut2yBy9n1+CY/N7bmB8V/HTi2CcvK3c1M8e2CsBij3Yq9ZUXovTbjXSQv
 r1ug==
X-Gm-Message-State: APjAAAXEZflVeIKaZFxcRbRx+4XLHGe2fJzOIIVHjH3YcinCM74VcKBf
 RvzotR3wxtXm8bww3c92Gqo316aLUj+I43fgkg2gzg==
X-Google-Smtp-Source: APXvYqyxWOI/gLfrV8oOdz2r9WFIbTogporvMwYsT9z4PLjpoqFy8CBjcrr7C1Rt/1yvLaxFtMhu/5/FNaBTphWKrz0=
X-Received: by 2002:a6b:7408:: with SMTP id s8mr5875298iog.287.1568308801102; 
 Thu, 12 Sep 2019 10:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
 <HK0PR03MB466066F3FD37BB68F833E638CFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <F87104B2-56AC-479E-BEF0-8B764355D6AF@fb.com>
 <HK0PR03MB46604880F50B30AF3789BE8CCFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB46604880F50B30AF3789BE8CCFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
From: Kun Yi <kunyi@google.com>
Date: Thu, 12 Sep 2019 10:19:35 -0700
Message-ID: <CAGMNF6VdQzBZCRZcAV=j8W3vg-sgUjS1QjSUiAJLEmKHqowX7A@mail.gmail.com>
Subject: Re: Port 80H Snoop
To: CS20 CHLi30 <CHLI30@nuvoton.com>, kuiying.wang@intel.com, 
 jason.m.bills@linux.intel.com
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wilfred/Tim,

On Wed, Sep 11, 2019 at 8:47 PM CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
>
> Hi Wilfred,
>
> Yes, I also modified example code to track the history of the port 80h sn=
oop values.
> The history will be saved to file with timestamp name for Host ON, OFF, a=
nd enter BIOS conditions.
> T
> his patch is just an experiment hard coded some specific Port80H codes fo=
r monitoring BIOS we used.
> These code should be configurable in a mature implementation, such as GUI=
/REST API entries for downloading/viewing these logs, but not done due to p=
riority change.
>
> The link of patch for you refer it. Thanks.
> https://github.com/Nuvoton-Israel/openbmc/blob/master/meta-evb/meta-evb-n=
uvoton/meta-evb-npcm750/recipes-phosphor/host/phosphor-host-postd/0001-supp=
ort-npcm7xx-lpc-bpc0-and-snooper.patch

That's nice, I did't know it existed.

>
> Best regards,
> Tim
>
> -----Original Message-----
> From: Wilfred Smith [mailto:wilfredsmith@fb.com]
> Sent: Thursday, September 12, 2019 9:56 AM
> To: CS20 CHLi30 <CHLI30@nuvoton.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Port 80H Snoop
>
> Tim, Many thanks. Are you also providing the ability to track the history=
 of the port 80h snoop values? If not, are you aware of someone else having=
 done so?

The ability to store POST codes has been on my backlog for quite a
while. I'd be happy to review patches/proposals to integrate the
functionality into OpenBMC.

I think Kuiying had some patches to enable this:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-post-code-manager/+/1=
8503,
but it's not merged yet. +Kuiying and Jason might have more
information.

>
> Wilfred
>
> > On Sep 11, 2019, at 6:52 PM, CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
> >
> > Hello Wilfred Smith,
> >
> > You can refer the module phosphor-host-postd and add file recipes-phosp=
hor/host/phosphor-host-postd_%.bbappend for changing your snoop device.
> > (ex: SNOOP_DEVICE =3D "npcm7xx-lpc-bpc0")
> >
> > Then, you can execute "snooper" program in shell prompt and you will se=
e the POST code be printed on console.
> > You can refer the attach file about screenshot for the result of snoope=
r. Thanks.
> >
> > Best regards,
> > Tim
>
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.



--=20
Regards,
Kun
