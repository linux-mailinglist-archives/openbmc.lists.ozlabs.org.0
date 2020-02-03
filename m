Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9138150D6E
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2020 17:44:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BDF15XqmzDqBt
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2020 03:44:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W7yDCT15; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BDCT2vHnzDqHP
 for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2020 03:43:01 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id q81so15424750oig.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Feb 2020 08:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wQZbn51Kswa8/PpdJAQ1Q0Kiwom+bAAGyzQfOygW8wM=;
 b=W7yDCT156r/QyVsxpcbkdz/7uSKSzRqyWA0tOSNUGmcircrU71NL5y0Wf09tvvXlxU
 obtVSsxbptTkUHsgCuXxXsmA5ceypHCTCzojAyN//aeyztbsDNZZe8NFcxMZflSTESPD
 KnGz0aD1yJ+Hq7n87MXbwq6LCUS4ot2q69c2J4IkwQsB3AON7691JETc4IuSUKYCAAmH
 vBO+kCmoVIfuXEGTA02SWcUsEyLwOgCcoiNfbwMPCMfrjECag0KnJfDqAhWdTH4s8ChH
 Gg7mk4pgSS07V6Jiv84rvGeqSdeEADdYPGVF5KoKiMHA7bvod1ettTmSnIqHLwT1KJ0F
 rdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wQZbn51Kswa8/PpdJAQ1Q0Kiwom+bAAGyzQfOygW8wM=;
 b=srwGlyneABMRdJkj5IIQgX6M7eNtsyDDHvcxVsvhUWlcqWW3aNFcOda0nKlZFIw7YW
 8P+SdiBqiT56tvsiED7VXoBURtoRleCvwyxtIzm+5d3Dr0zhTnL8yCFTQw8QvogNKtjn
 qB3jzrvAFKd0k7EY6Gx6f8w30nv838SWMsM2nIMpUFWfCeuyCm4w/XEPAIu2w8aY7daM
 9Q22H9XB+coP0FZU2ocyY40djbpxuk3jXKD7XnTNFsk9nRnTEEbibKeepYhniNmW3uY0
 Q1s+t9FbaoLNvTwo5dUsVrykV8LWRtLy2zuiANZ0/B2EXZEqaoyxTw4WwTGh1aIYoYZw
 Qb/g==
X-Gm-Message-State: APjAAAVDzaYAyVj3Bas228w9oxzFkSik4LKtmsG52a2VDHAc5Th3pF+N
 skpfdNEywmoN82nmcQom+VU=
X-Google-Smtp-Source: APXvYqw0gGpcDyWaPlhgiujoC4w2eqMQdZxgeeQEz+zr9LTDBH/DIZ0xVCUegmN5FwD2173yLVzZpQ==
X-Received: by 2002:aca:aa05:: with SMTP id t5mr15155061oie.93.1580748175234; 
 Mon, 03 Feb 2020 08:42:55 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id n22sm6876637otj.36.2020.02.03.08.42.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Feb 2020 08:42:54 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: BIOS, Hypervisor, and OS detailed boot progress in Redfish
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <7b1259fe-7204-3b24-1941-e2df93d3c2f2@linux.vnet.ibm.com>
Date: Mon, 3 Feb 2020 10:42:53 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <9B81E0EE-9780-406D-A2DD-708048001C73@gmail.com>
References: <CALLMt=q-f=_5dR=E7QNwB893c1+inv4EPe5ZrAfhG1Va8fUHQQ@mail.gmail.com>
 <7b1259fe-7204-3b24-1941-e2df93d3c2f2@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jan 29, 2020, at 6:10 AM, Deepak Kodihalli =
<dkodihal@linux.vnet.ibm.com> wrote:
>=20
> On 29/01/20 2:23 am, Andrew Geissler wrote:
>> I think our goal should be to provide a high level summary of the =
boot from
>> the BIOS, to the Hypervisor, to the OS.
>> Something like this?
>> Unknown -> MotherboardInit -> MemoryInit -> SecondaryProcInit ->
>>         -> HypervisorStart -> HypervisorStandby -> OSStart -> =
OSRunning
>> These would need PLDM commands for the host to send these down so =
maybe the
>> PLDM specifications provides a hint on what these should be? I see =
this doc[4]
>> has a "Boot Progress" State Set but a lot of these just don't make =
much sense
>> to me.
>=20
> [4] does have states for the flow you've described above, mostly. =
Also, the state set enums can have specific meanings once they're =
associated to a sensor (or an effecter), in fact they have to be =
interpreted in conjunction with the sensor or effecter. So for eg a =
state enum such as "boot started" can be associated with both a logical =
sensor monitoring the hypervisor boot and a logical sensor monitoring =
the OS boot.
>=20

ok, thanks for all the feedback everyone. Looking at the =E2=80=9CBoot =
Progress=E2=80=9D in the=20
pldm doc[4], and taking into account Brad=E2=80=99s comment, how about =
the below for a
Redfish enumeration?

Based on Deepak=E2=80=99s comment, there=E2=80=99s a mechanism to map a =
Boot Progress value
to the system firmware or the OS so I take that into account below.

Redfish Enum  |  PLDM Boot Progress Mapping

MotherBoardInit -> SystemFirmware-=E2=80=9C22 Baseboard or Motherboard =
Initialization=E2=80=9D
PrimaryProcInit -> SystemFirmware-=E2=80=9C26 Primary Processor =
Initialization"
SecondaryProcInit -> SystemFirmware-=E2=80=9C5 Secondary Processor(s) =
Initialization=E2=80=9D
MemoryInit -> SystemFirmware-=E2=80=9C3 Memory Initialization=E2=80=9D
PCIResourceConfig -> SystemFirmware-=E2=80=9C9 PCI Resource =
Configuration=E2=80=9D
SystemFirmwareComplete -> SystemFirmware-=E2=80=9C2 Boot Completed=E2=80=9D=

OSStart -> SystemFirmware-=E2=80=9C21 Starting Operating System Boot =
Process=E2=80=9D
OSRunning -> OS-=E2=80=9C2 Boot Completed"

Andrew

> Regards,
> Deepak
>=20
>> Thoughts/Ideas appreciated.
>> Thanks,
>> Andrew
>> [1]: =
https://redfishforum.com/thread/275/bios-hypervisor-detailed-boot-progress=

>> [2]: =
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/State/Boot/Progress.interface.yaml
>> [3]: =
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbm=
c_project/State/OperatingSystem/Status.interface.yaml
>> [4]: =
https://www.dmtf.org/sites/default/files/standards/documents/DSP0249_1.0.0=
.pdf
>=20

