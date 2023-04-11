Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DFE6DE6AE
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 23:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px00k6VdTz3ccn
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 07:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=A2/uUxby;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jianghao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=A2/uUxby;
	dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px0082z54z3bfw
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 07:51:03 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id j19so3036318qkk.8
        for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681249860; x=1683841860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHfEiB8wTFt0G/6G63wL2MANJiOGAaGnJdbhsgcYB+g=;
        b=A2/uUxbyoklmDiZPQxVkmokp5O18kFAspOW6apIPEaQNOcBGIkcuRza2/klPuzoF5+
         bjIpL4M3dTpd1VjDgNmElJwUyEXnm9fpSPW/UDTmQ7t03C2gwSTzrGcCefmLYwZLA+NN
         IDkkP4jCxPW3dOd1mMkSQL0myyc6LfyaUjRscTm5pRH+KW/wX1mjJry0m0jXlhuClPty
         DGB3NbAI4g6Mququ3TuJd23fLShB7aYUdGFMwqdWEKyE+7kzu22rmMjxTRTZlF13vC8C
         aZYe84ua/ukdwpTF16x9PYYcyMISYc8RjoCs98rSyqKwYxFWubAZ9S39mMHiUhEiVH9P
         BFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681249860; x=1683841860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHfEiB8wTFt0G/6G63wL2MANJiOGAaGnJdbhsgcYB+g=;
        b=glWEIhJ2s0LmNADImfImo6Un40dzDKpfI+DcxMosfU5ekugQyn/6UKRiPv3uyuH26B
         KD/FP+g1KEUqu41M3+1991fhk7UPe+nBTp6tTNseyk6Ulys6F15yB6TpPKZXmK6KrrGJ
         0q8Uka8GGnLALbUpoznlRF9WjXXVNq7Is5WNbEqHmGnyCSEMEQPil8RAYkqh4hY3QLsE
         +jA4ONxtsv+cjd+UMupf7+mu5iUvPC1nUoGP9HxMdqCXVNB+fwD7zSM8CGxytFpI5Pbv
         1KdwpCfo/UIfKp6pEJuh3bJRYT57Vd8uQoxM1TfHcAvqcHeQAgOyz3Oawjs1ZPn/gI0x
         inJA==
X-Gm-Message-State: AAQBX9eEPVzT5YNpG8s0u+1XB4bkHJMtd1akPuZtDVAcjdRwQgLPuRSV
	UGFz9TaMJbQ1SQQhJCBMnDSx4xc6U6df+wExChSqcw==
X-Google-Smtp-Source: AKy350bVOuuqUY+LBFthz7yA4FtIdqU4t+PJcjfEYs25/raKfDIKh6a7jSjgeyyse3Y98hbvqInlnovhjFkrZuWqP1U=
X-Received: by 2002:a05:620a:1791:b0:74a:92e:bcfb with SMTP id
 ay17-20020a05620a179100b0074a092ebcfbmr172943qkb.3.1681249859707; Tue, 11 Apr
 2023 14:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <c9adff03-16f4-40d4-8334-6cdbbdea2407@betaapp.fastmail.com>
 <PR3P195MB0555D8C52C5F2EBE2FA1E299C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <CAB38=p21yk1O8eQvq9Rtq4TuKpoJeU7Zy189KJRmGCcQ0NqyQw@mail.gmail.com>
 <PR3P195MB05553184971B4F0E15989893C3979@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <CAB38=p0anKYhBGTDxjSOQGDm60XNu+nv399-QoVCsKMxeoOznA@mail.gmail.com> <PR3P195MB05551C7B1C589C972BE03873C39A9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P195MB05551C7B1C589C972BE03873C39A9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
From: Hao Jiang <jianghao@google.com>
Date: Tue, 11 Apr 2023 14:50:48 -0700
Message-ID: <CAB38=p2VtC14fADDXGjDqGEy5b79tndPP5T-xN2_aeYfVmfg=Q@mail.gmail.com>
Subject: Re: OpenBMC - Support NVMe drive health monitoring
To: Lior Weintraub <liorw@pliops.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@codeconstruct.com.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, "rashmica@linux.ibm.com" <rashmica@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> If so, can you please guide me how to do that?

The prerequisite for nvme OOB is the mctp layer, including:
1. mctp linux kernel - starting from 5.15
2. libmctp
3. mctpd
+ Jeremy as the author of MCTP.

> Can this tool be tested on QEMU or RaspberryPi (running OpenBMC image)?
I am not sure if you want to emulate a nvme mctp device in QEMU.
RaspberryPi is doable but you need to rework the raiser for I2C from
PCIe.

> I found on OpenBMC the meta-openembedded/meta-oe/recipes-bsp/nvme-cli/nvm=
e-cli_1.13.bb but it looks like it is pointing to an old version of the rep=
o (commit f0e9569df9289d6ee55ba2c23615cc7c73a9b088 from Oct 21, 2020). Shou=
ld I change that?
I have an internal recipe for nvme-cli 2.1.2, we can upstream it, but
you are welcome to do it yourself.

> How do I obtain this information (net, eid, ctrl-id)?
MCTP layer should tell you

> Is there a tool that runs auto discovery and will give a map of the devic=
es it finds? (kind of like nvme list)?
That is mctpd. https://github.com/CodeConstruct/mctp


On Tue, Apr 11, 2023 at 12:06=E2=80=AFAM Lior Weintraub <liorw@pliops.com> =
wrote:
>
> Thanks Hao,
>
>
>
> This looks very promising.
>
> I would appreciate some more details as I am new to OpenBMC.
>
> If I understand correctly, in order to run this tool as OOB, it needs to =
be compiled for OpenBMC platform and somehow be included in the image.
>
> If so, can you please guide me how to do that?
> Can this tool be tested on QEMU or RaspberryPi (running OpenBMC image)?
> I found on OpenBMC the meta-openembedded/meta-oe/recipes-bsp/nvme-cli/nvm=
e-cli_1.13.bb but it looks like it is pointing to an old version of the rep=
o (commit f0e9569df9289d6ee55ba2c23615cc7c73a9b088 from Oct 21, 2020). Shou=
ld I change that?
> It looks like this cli tool also needs an updated (latest) version of lib=
nvme. How to make sure the OpenBMC image is built with latest version of th=
is library?
>
> When the cli tool is used for OOB, it needs to have mctp:<net>,<eid>[:ctr=
l-id].
>
> How do I obtain this information (net, eid, ctrl-id)?
>
> Is there a tool that runs auto discovery and will give a map of the devic=
es it finds? (kind of like nvme list)?
>
>
>
> Thanks again,
>
> Kind regards,
>
> Lior.
>
>
>
> From: Hao Jiang <jianghao@google.com>
> Sent: Monday, April 10, 2023 7:28 PM
> To: Lior Weintraub <liorw@pliops.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>; Ed Tanous <ed@tanous.net>; openbmc@=
lists.ozlabs.org; rashmica@linux.ibm.com
> Subject: Re: OpenBMC - Support NVMe drive health monitoring
>
>
>
> CAUTION: External Sender
>
> We have upstreamed the support for libnvme-mi in the opensource nvme-cli =
tool. https://github.com/linux-nvme/nvme-cli
>
> The cli tool has only nvme admin command set support, since it is co-used=
 for inband and oob.
>
>
>
> For the MI cmd set, we have a really simple demo tool, but it doesn't hav=
e all MI CMD (it is a demo only :) )
> https://github.com/linux-nvme/libnvme/blob/master/examples/mi-mctp.c
>
>
>
> On Sat, Apr 8, 2023 at 2:42=E2=80=AFAM Lior Weintraub <liorw@pliops.com> =
wrote:
>
> Thanks Hao,
>
>
>
> Do you know if there is a tool (e.g. ipmitool) that can be used to genera=
te a basic NVMe MI command?
>
> For example, the NVMe MI Revision 1.1 spec defines a "Management Interfac=
e Command Set" that can be used to:
>
> Opcode                Command
>
> 00h                        Read NVMe-MI Data Structure
>
> 01h                        NVM Subsystem Health Status Poll
>
> 02h                        Controller Health Status Poll
>
> 03h                        Configuration Set
>
> 04h                        Configuration Get
>
> 05h                        VPD Read
>
> 06h                        VPD Write
>
> 07h                        Reset
>
> 08h                        SES Receive
>
> 09h                        SES Send
>
> 0Ah                        Management Endpoint Buffer Read
>
> 0Bh                        Management Endpoint Buffer Write
>
> 0Ch to BFh          Reserved
>
> C0h to FFh           Vendor specific
>
>
>
> If we had a tool that can send such a command it would help with the deve=
lopment of this feature.
>
> The idea is to start with some manually triggered commands.
>
>
>
> Thanks,
>
> Lior.
>
>
>
>
>
> From: Hao Jiang <jianghao@google.com>
> Sent: Friday, April 7, 2023 8:40 PM
> To: Lior Weintraub <liorw@pliops.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>; Ed Tanous <ed@tanous.net>; openbmc@=
lists.ozlabs.org; rashmica@linux.ibm.com
> Subject: Re: OpenBMC - Support NVMe drive health monitoring
>
>
>
> CAUTION: External Sender
>
> Hi Lior and Andrew,
>
> The goal of enhancing nvmesensor with nvme-mi is to fulfill the full stac=
k management of NVMe devices, including health monitoring but beyond. An ex=
ample could be SSD firmware update and security protocol transportation.
>
> The MCTP support has improved compared to two years ago. The MCTP I2C bin=
ding has been upstreamed to linux kernel and there is an mctp daemon for op=
enbmc for the MCTP management.
>
>
>
> On Fri, Apr 7, 2023 at 5:35=E2=80=AFAM Lior Weintraub <liorw@pliops.com> =
wrote:
>
> Thanks Andrew,
>
>
>
> I wish I had the experience to help with the review process =F0=9F=98=8A
>
> I have more than 2 decades experience with bare metal embedded systems bu=
t no experience with Embedded Linux\Yocto nor OpenBMC (nor Gerrit).
>
> It's all new to me and came to realize that many guides \ documentations =
I find on the web are old and doesn't work anymore on OpenBMC (e.g. using t=
he oe-init-build-env vs setup script).
>
>
>
> I am happy to assist and contribute but I need some guidance.
>
> I have only 2 weeks experience with OpenBMC.
>
> I have succeeded to build few platforms and run them (e.g. qemuarm and Ra=
spberryPi4).
>
> I watched many youtube videos on OpenBMC which gave me a good overall und=
erstanding but when it comes to start coding or adding new stuff I am lost.
>
>
>
> If we start our development with NVMe-MI basic management command as a st=
arting point, what steps would you recommend we need to take?
>
> Can we use the PaspberryPi4 for this initial implementation?
>
> We have a basic OpenBMC image on this RaspPi and we have it's I2C connect=
ed to our PCIe card (which is using a Desktop as the host PC).
>
> (BTW, the i2c-dev module is not loaded automatically and we still haven't=
 figured out why. As a workaround, we load the module manually with modprob=
e i2c-dev on the OpenBMC UART terminal)
>
>
>
> Thanks,
>
> Lior.
>
>
>
> -----Original Message-----
> From: Andrew Jeffery <andrew@aj.id.au>
> Sent: Friday, April 7, 2023 2:46 PM
> To: Lior Weintraub <liorw@pliops.com>
> Cc: Ed Tanous <ed@tanous.net>; openbmc@lists.ozlabs.org; rashmica@linux.i=
bm.com; jianghao@google.com
> Subject: Re: OpenBMC - Support NVMe drive health monitoring
>
>
>
> CAUTION: External Sender
>
>
>
> On Fri, 7 Apr 2023, at 19:50, Lior Weintraub wrote:
>
> > Hi Jet,
>
> >
>
> > My name is Lior Weintraub and I face exactly the same task that you
>
> > handled 2 years ago =F0=9F=98=8A
>
> > I found this mailing list thread on OpenBmc:
>
> > https://lists.ozlabs.org/pipermail/openbmc/2020-November/024012.html
>
> >
>
> > Can you please advice about the current status of this issue?
>
> > I need to add OOB support to our NVMe device (supporting NVMe MI ->
>
> > MCTP with SMBus binding).
>
> > For this task we plan to buy the AST2600 development
>
> > kit<https://portwell.com/solutions/openBMC.php> and use the OpenBMC
>
> > for our development and testing.
>
>
>
> Currently OpenBMC only supports NVMe-MI via the basic management command.=
 See phosphor-nvme or nvmesensor from dbus-sensors. We're working on migrat=
ing the OpenBMC MCTP stack to the AF_MCTP sockets that are now provided by =
Linux.
>
>
>
> Please help review and test Rashmica's work in Gerrit to speed that proce=
ss along:
>
>
>
> https://gerrit.openbmc.org/q/topic:AF_MCTP
>
>
>
> Along with Hao Jiang's work to exploit libnvme-mi in nvmesensor:
>
>
>
> https://gerrit.openbmc.org/q/topic:nvme-mi
>
>
>
> Andrew
>
>
>
>
> --
>
> Hao
>
>
>
>
> --
>
> Hao



--=20
Hao
