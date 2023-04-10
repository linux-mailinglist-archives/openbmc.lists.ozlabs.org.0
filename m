Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D266DC94B
	for <lists+openbmc@lfdr.de>; Mon, 10 Apr 2023 18:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwDtN50W9z3chX
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 02:28:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TDXnUgBH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=jianghao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TDXnUgBH;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwDsq16kQz3cBF
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 02:27:58 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id bl15so4575467qtb.10
        for <openbmc@lists.ozlabs.org>; Mon, 10 Apr 2023 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1681144073; x=1683736073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=09lv93vf/2zwwPiH9TQXCTzpoMz76LTTKaUwZEPaQZk=;
        b=TDXnUgBHdrJCpMrJAKirBKyWpcZjnU87M9OV4QVOvuU1k+VpZtAddfRfYk2P8aWJRt
         LxyZbIHJAbVkmoIypzvtdiVJ6zTiWLB8y8c5RWUOJvtxnm4iiKBGJvdRvrpvoI2WieqC
         N0wgvtL/GgvYH/zKpFW73k4fONIda6ZTqCj6z4S5fDmN2VLKGgRAoO7lQGJjFQWE/x5d
         ZNVsAxg7Yo3fcQWplGS5TbkLCuRE7bYo0uyYJ8jQjFGFLVIuviN5z8xB5C2XW1T+VeAN
         NcyiwhIaViaMgBXQMaqdmY7jFfXIVINP5gK8efqwwKcQyf0WmBvyURYVEenYBGIMwai6
         fV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681144073; x=1683736073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09lv93vf/2zwwPiH9TQXCTzpoMz76LTTKaUwZEPaQZk=;
        b=P3+K6rxfSXyCvsvXjDaqsFBUAjxLsVJjmICUAQWsBz/uKY1kOHdhy0uHYNGW9rHW5/
         oJhH2mOY5SEGaW8a2dH6n9rcNSCCniJYt4gpJVPAma2pANcTYFeV5BpPgyD/H4BqY+2D
         haQ/B8wmnn5iirpMun6QXL11C1hC+SUB/cMxxe9EA+ZvXF7dm05pRcuqGoEhobq2AyXF
         PlklF88iSJex4ApBVeRfx6Cj114WQXpQceX7rgoBaQS8uEG64XALW8uBRiFp+5lMqDaw
         xOknG51f3Hv2pRk5QtGj3+V3Hu+YO7I5KSEKk6LVJjS9Bsen72g1vEnrj1CshhcerhiB
         Ad2w==
X-Gm-Message-State: AAQBX9eQAWuriDd4rdzUJICLILlToCcRrR/82zC7qWZZ6sxn4atXimdW
	hNzqo43luds8SjhvCL1QUtFmFYJv3eShSi5O1OvOcQ==
X-Google-Smtp-Source: AKy350ZjQBIehG7ZcUYJBIbTCpk24qfsXPdJ+2/EbPkvuR3q0qs9chrfBzIyH3t9AZviwFLYLNqtxufixgpnWZMtVtY=
X-Received: by 2002:a05:622a:144c:b0:3de:bafb:82c0 with SMTP id
 v12-20020a05622a144c00b003debafb82c0mr4073031qtx.9.1681144072784; Mon, 10 Apr
 2023 09:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <c9adff03-16f4-40d4-8334-6cdbbdea2407@betaapp.fastmail.com>
 <PR3P195MB0555D8C52C5F2EBE2FA1E299C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
 <CAB38=p21yk1O8eQvq9Rtq4TuKpoJeU7Zy189KJRmGCcQ0NqyQw@mail.gmail.com> <PR3P195MB05553184971B4F0E15989893C3979@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P195MB05553184971B4F0E15989893C3979@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
From: Hao Jiang <jianghao@google.com>
Date: Mon, 10 Apr 2023 09:27:41 -0700
Message-ID: <CAB38=p0anKYhBGTDxjSOQGDm60XNu+nv399-QoVCsKMxeoOznA@mail.gmail.com>
Subject: Re: OpenBMC - Support NVMe drive health monitoring
To: Lior Weintraub <liorw@pliops.com>
Content-Type: multipart/alternative; boundary="00000000000046a21805f8fddb6f"
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, "rashmica@linux.ibm.com" <rashmica@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000046a21805f8fddb6f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We have upstreamed the support for libnvme-mi in the opensource nvme-cli
tool. https://github.com/linux-nvme/nvme-cli

The cli tool has only nvme admin command set support, since it is co-used
for inband and oob.

For the MI cmd set, we have a really simple demo tool, but it doesn't have
all MI CMD (it is a demo only :) )
https://github.com/linux-nvme/libnvme/blob/master/examples/mi-mctp.c

On Sat, Apr 8, 2023 at 2:42=E2=80=AFAM Lior Weintraub <liorw@pliops.com> wr=
ote:

> Thanks Hao,
>
>
>
> Do you know if there is a tool (e.g. ipmitool) that can be used to
> generate a basic NVMe MI command?
>
> For example, the NVMe MI Revision 1.1 spec defines a "Management Interfac=
e
> Command Set" that can be used to:
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
> If we had a tool that can send such a command it would help with the
> development of this feature.
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
> *From:* Hao Jiang <jianghao@google.com>
> *Sent:* Friday, April 7, 2023 8:40 PM
> *To:* Lior Weintraub <liorw@pliops.com>
> *Cc:* Andrew Jeffery <andrew@aj.id.au>; Ed Tanous <ed@tanous.net>;
> openbmc@lists.ozlabs.org; rashmica@linux.ibm.com
> *Subject:* Re: OpenBMC - Support NVMe drive health monitoring
>
>
>
> CAUTION: External Sender
>
> Hi Lior and Andrew,
>
> The goal of enhancing nvmesensor with nvme-mi is to fulfill the full stac=
k
> management of NVMe devices, including health monitoring but beyond. An
> example could be SSD firmware update and security protocol transportation=
.
>
> The MCTP support has improved compared to two years ago. The MCTP I2C
> binding has been upstreamed to linux kernel and there is an mctp daemon f=
or
> openbmc for the MCTP management.
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
t
> no experience with Embedded Linux\Yocto nor OpenBMC (nor Gerrit).
>
> It's all new to me and came to realize that many guides \ documentations =
I
> find on the web are old and doesn't work anymore on OpenBMC (e.g. using t=
he
> oe-init-build-env vs setup script).
>
>
>
> I am happy to assist and contribute but I need some guidance.
>
> I have only 2 weeks experience with OpenBMC.
>
> I have succeeded to build few platforms and run them (e.g. qemuarm and
> RaspberryPi4).
>
> I watched many youtube videos on OpenBMC which gave me a good overall
> understanding but when it comes to start coding or adding new stuff I am
> lost.
>
>
>
> If we start our development with NVMe-MI basic management command as a
> starting point, what steps would you recommend we need to take?
>
> Can we use the PaspberryPi4 for this initial implementation?
>
> We have a basic OpenBMC image on this RaspPi and we have it's I2C
> connected to our PCIe card (which is using a Desktop as the host PC).
>
> (BTW, the i2c-dev module is not loaded automatically and we still haven't
> figured out why. As a workaround, we load the module manually with modpro=
be
> i2c-dev on the OpenBMC UART terminal)
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
> Cc: Ed Tanous <ed@tanous.net>; openbmc@lists.ozlabs.org;
> rashmica@linux.ibm.com; jianghao@google.com
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
> Currently OpenBMC only supports NVMe-MI via the basic management command.
> See phosphor-nvme or nvmesensor from dbus-sensors. We're working on
> migrating the OpenBMC MCTP stack to the AF_MCTP sockets that are now
> provided by Linux.
>
>
>
> Please help review and test Rashmica's work in Gerrit to speed that
> process along:
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


--=20
Hao

--00000000000046a21805f8fddb6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">We have upstreamed the s=
upport for libnvme-mi=C2=A0in the opensource=C2=A0nvme-cli tool.=C2=A0<a hr=
ef=3D"https://github.com/linux-nvme/nvme-cli">https://github.com/linux-nvme=
/nvme-cli</a><br><br>The cli tool has only nvme admin command set support, =
since it is co-used for inband and oob.=C2=A0</div><div dir=3D"ltr"><br></d=
iv><div>For the MI cmd set, we have a really simple demo tool, but it doesn=
&#39;t have all MI CMD (it is a demo only :) )<br><a href=3D"https://github=
.com/linux-nvme/libnvme/blob/master/examples/mi-mctp.c">https://github.com/=
linux-nvme/libnvme/blob/master/examples/mi-mctp.c</a><br></div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat=
, Apr 8, 2023 at 2:42=E2=80=AFAM Lior Weintraub &lt;<a href=3D"mailto:liorw=
@pliops.com">liorw@pliops.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div class=3D"msg-3247337819342318172">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-3247337819342318172WordSection1">
<p class=3D"MsoNormal">Thanks Hao,<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">Do you know if there is a t=
ool (e.g. ipmitool) that can be used to generate a basic NVMe MI command?<u=
></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">For example, the NVMe MI Re=
vision 1.1 spec defines a &quot;Management Interface Command Set&quot; that=
 can be used to:<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">Opcode =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Command<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">00h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Read NVMe-MI Data Structure<u></u><u><=
/u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">01h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVM Subsystem Health Status Poll<u></u=
><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">02h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Controller Health Status Poll<u></u><u=
></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">03h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Configuration Set<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">04h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Configuration Get<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">05h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VPD Read<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">06h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VPD Write<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">07h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reset<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">08h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SES Receive<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">09h =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SES Send<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">0Ah =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Management Endpoint Buffer Read<u></u>=
<u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">0Bh =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Management Endpoint Buffer Write<u></u=
><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">0Ch to BFh =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reserved<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">C0h to FFh =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Vendor specific<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">If we had a tool that can s=
end such a command it would help with the development of this feature.<u></=
u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">The idea is to start with s=
ome manually triggered commands.<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText"><u></u>=C2=A0<u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">Thanks,<u></u><u></u></p>
<p class=3D"m_-3247337819342318172MsoPlainText">Lior.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Hao Jiang &lt;<a href=3D"mailto:jiangha=
o@google.com" target=3D"_blank">jianghao@google.com</a>&gt; <br>
<b>Sent:</b> Friday, April 7, 2023 8:40 PM<br>
<b>To:</b> Lior Weintraub &lt;<a href=3D"mailto:liorw@pliops.com" target=3D=
"_blank">liorw@pliops.com</a>&gt;<br>
<b>Cc:</b> Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"=
_blank">andrew@aj.id.au</a>&gt;; Ed Tanous &lt;<a href=3D"mailto:ed@tanous.=
net" target=3D"_blank">ed@tanous.net</a>&gt;; <a href=3D"mailto:openbmc@lis=
ts.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>; <a href=3D"m=
ailto:rashmica@linux.ibm.com" target=3D"_blank">rashmica@linux.ibm.com</a><=
br>
<b>Subject:</b> Re: OpenBMC - Support NVMe drive health monitoring<u></u><u=
></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border:1pt solid rgb(156,101,0);padding:2pt">
<div>
<p class=3D"MsoNormal" style=3D"background:rgb(255,235,156)"><span style=3D=
"font-size:10pt;color:rgb(156,101,0)">CAUTION:</span><span style=3D"font-si=
ze:10pt;color:red"> External Sender</span><u></u><u></u></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Hi Lior and Andrew,=C2=
=A0<br>
<br>
The goal of enhancing nvmesensor=C2=A0with nvme-mi is to fulfill the full s=
tack management of NVMe devices, including health monitoring but beyond. An=
 example could be SSD firmware update and security=C2=A0protocol transporta=
tion.=C2=A0<br>
<br>
The MCTP support has improved compared to two years ago. The MCTP I2C bindi=
ng has been upstreamed to linux kernel and there is an mctp daemon for open=
bmc for the MCTP management.=C2=A0<br>
<br>
<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Fri, Apr 7, 2023 at 5:35=E2=80=AFAM Lior Weintrau=
b &lt;<a href=3D"mailto:liorw@pliops.com" target=3D"_blank">liorw@pliops.co=
m</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<div>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Thanks =
Andrew,<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">=C2=A0<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">I wish =
I had the experience to help with the review process
<span style=3D"font-family:&quot;Segoe UI Emoji&quot;,sans-serif">=F0=9F=98=
=8A</span><u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">I have =
more than 2 decades experience with bare metal embedded systems but no expe=
rience with Embedded Linux\Yocto nor OpenBMC (nor Gerrit).<u></u><u></u></p=
>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">It&#39;=
s all new to me and came to realize that many guides \ documentations I fin=
d on the web are old and doesn&#39;t work anymore on OpenBMC (e.g. using th=
e oe-init-build-env vs setup script).<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">=C2=A0<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">I am ha=
ppy to assist and contribute but I need some guidance.<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">I have =
only 2 weeks experience with OpenBMC.<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">I have =
succeeded to build few platforms and run them (e.g. qemuarm and RaspberryPi=
4).<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">I watch=
ed many youtube videos on OpenBMC which gave me a good overall understandin=
g but when it comes to start coding or adding new stuff I am lost.<u></u><u=
></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">=C2=A0<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">If we s=
tart our development with NVMe-MI basic management command as a starting po=
int, what steps would you recommend we need to take?<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Can we =
use the PaspberryPi4 for this initial implementation?<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">We have=
 a basic OpenBMC image on this RaspPi and we have it&#39;s I2C connected to=
 our PCIe card (which is using a Desktop as the host PC).<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">(BTW, t=
he i2c-dev module is not loaded automatically and we still haven&#39;t figu=
red out why. As a workaround, we load the module manually with modprobe i2c=
-dev on the OpenBMC UART terminal)<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">=C2=A0<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Thanks,=
<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Lior.<u=
></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">=C2=A0<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">-----Or=
iginal Message-----<br>
From: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"_blan=
k">andrew@aj.id.au</a>&gt;
<br>
Sent: Friday, April 7, 2023 2:46 PM<br>
To: Lior Weintraub &lt;<a href=3D"mailto:liorw@pliops.com" target=3D"_blank=
">liorw@pliops.com</a>&gt;<br>
Cc: Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tan=
ous.net</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a>;
<a href=3D"mailto:rashmica@linux.ibm.com" target=3D"_blank">rashmica@linux.=
ibm.com</a>;
<a href=3D"mailto:jianghao@google.com" target=3D"_blank">jianghao@google.co=
m</a><br>
Subject: Re: OpenBMC - Support NVMe drive health monitoring<u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">=C2=A0<=
u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">CAUTION=
: External Sender<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">On Fri,=
 7 Apr 2023, at 19:50, Lior Weintraub wrote:<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; Hi=
 Jet,<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>&gt;=C2=A0</span><u></u><u></=
u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; My=
 name is Lior Weintraub and I face exactly the same task that you
<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; ha=
ndled 2 years ago <span style=3D"font-family:&quot;Segoe UI Emoji&quot;,san=
s-serif">
=F0=9F=98=8A</span><u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; I =
found this mailing list thread on OpenBmc:<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; <a=
 href=3D"https://lists.ozlabs.org/pipermail/openbmc/2020-November/024012.ht=
ml" target=3D"_blank">
<span style=3D"color:windowtext;text-decoration:none">https://lists.ozlabs.=
org/pipermail/openbmc/2020-November/024012.html</span></a><u></u><u></u></p=
>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>&gt;=C2=A0</span><u></u><u></=
u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; Ca=
n you please advice about the current status of this issue?<u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; I =
need to add OOB support to our NVMe device (supporting NVMe MI -&gt;
<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; MC=
TP with SMBus binding).<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; Fo=
r this task we plan to buy the AST2600 development
<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; ki=
t&lt;<a href=3D"https://portwell.com/solutions/openBMC.php" target=3D"_blan=
k"><span style=3D"color:windowtext;text-decoration:none">https://portwell.c=
om/solutions/openBMC.php</span></a>&gt; and use the OpenBMC
<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">&gt; fo=
r our development and testing.<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Current=
ly OpenBMC only supports NVMe-MI via the basic management command. See phos=
phor-nvme or nvmesensor from dbus-sensors. We&#39;re working on migrating t=
he OpenBMC MCTP stack to the AF_MCTP sockets that are now provided
 by Linux.<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Please =
help review and test Rashmica&#39;s work in Gerrit to speed that process al=
ong:<u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><a href=
=3D"https://gerrit.openbmc.org/q/topic:AF_MCTP" target=3D"_blank"><span sty=
le=3D"color:windowtext;text-decoration:none">https://gerrit.openbmc.org/q/t=
opic:AF_MCTP</span></a><u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Along w=
ith Hao Jiang&#39;s work to exploit libnvme-mi in nvmesensor:<u></u><u></u>=
</p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><a href=
=3D"https://gerrit.openbmc.org/q/topic:nvme-mi" target=3D"_blank"><span sty=
le=3D"color:windowtext;text-decoration:none">https://gerrit.openbmc.org/q/t=
opic:nvme-mi</span></a><u></u><u></u></p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext"><span d=
ir=3D"RTL"></span><span dir=3D"RTL"></span><span lang=3D"HE" dir=3D"RTL" st=
yle=3D"font-size:10.5pt;font-family:&quot;Times New Roman&quot;,serif"><spa=
n dir=3D"RTL"></span><span dir=3D"RTL"></span>=C2=A0</span><u></u><u></u></=
p>
<p class=3D"m_-3247337819342318172m6552336304203016699msoplaintext">Andrew<=
u></u><u></u></p>
</div>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><span class=3D"m_-3247337819342318172gmailsignaturep=
refix">-- </span><u></u><u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hao<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr">Hao</div></div>

--00000000000046a21805f8fddb6f--
