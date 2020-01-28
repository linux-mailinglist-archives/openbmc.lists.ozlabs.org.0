Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E7814C1D2
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 21:54:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486f3t2MmFzDqLD
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 07:54:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a5/0hm0Y; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486f3H3MgxzDqFG
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 07:53:31 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id g15so13449201otp.3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 12:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IADUpuMsxpT0yDEEuvdSRcAyEIQnR4+W0YotYv/ivZc=;
 b=a5/0hm0YIWJTLr4DtLnnvlQTtWOEcTw2jjLp2tvynoyAO78hKPd6At8Zjw2zrlQmSO
 tOT73JcbSokCz67QDw4RHfgk0awlTJzG+xEIxZYvht4XR58h+aAqyfHVb3vOz2s+Q1w2
 ZfgtU+DtShOIhDjE/QXGDJ5uvFZM7t64El7tLOnDX+olOjF3OE074c/04o9EFa7FvMTp
 IPUsbX7EmiUaAXGYmwHOA6c5+Uy6uybvO6868EHRNZNw5ZaeBoKM3NPU8+NNrg5w9MBk
 4P7pef1LQ7XZ3qw2J8YqgKNKAtdANXzy0FNJIrVCIzfJVlzShTApNrGCUPe07sweF8yF
 wuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IADUpuMsxpT0yDEEuvdSRcAyEIQnR4+W0YotYv/ivZc=;
 b=ETVODGO7IqFpciDrXK8lFE8ifk37BinuXzBCA72NIcKfvpDizLkr75v26MA5laAaua
 CBchjmrhXR9PLqYv7tDhXqf3o2TGZjrKEYX5+Fsy1HJ9qsIiUYEARWBbj1eZsF7xBNZl
 R46V34upY8kOpV/1k5acn67ZgWPQmK5Eq3hRWaWen0GtIeMNwhFrhsZG9WJLhrZiPrpn
 2C+R6OCqR75KVUJDPOpa9y/hLTsAuTvN0mWODUULEauox9UFIjJy/AqnoZN3JBsawt3+
 sDOsitnVCRDlKz0KcaW8foqWy37ID1QsI0DDJNNHb4sgtnGIRqvujGxrlwdcQMbAPV7C
 k8bg==
X-Gm-Message-State: APjAAAULTy8KwOHPX7vb8SSg+p2YabN4nwiTG15egrTpOgECjPk0MwN0
 P7vvZTAHv6H+/KBq60JebFRphiGL4N0VQ9HhX+pOnurWjYI=
X-Google-Smtp-Source: APXvYqxutwE11Oy7gqWkXyuWzPdAWolXCIri668GkACXhMB+hTNY5cvEw2JFu4Z285tlpFDWftHejIbFUxVzk8X7XqM=
X-Received: by 2002:a9d:12cf:: with SMTP id g73mr17117452otg.329.1580244807765; 
 Tue, 28 Jan 2020 12:53:27 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 28 Jan 2020 14:53:11 -0600
Message-ID: <CALLMt=q-f=_5dR=E7QNwB893c1+inv4EPe5ZrAfhG1Va8fUHQQ@mail.gmail.com>
Subject: BIOS, Hypervisor, and OS detailed boot progress in Redfish
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

I recently opened a Redfish forum post[1] asking about tracking BIOS,
Hypervisor,
and OS boot status.

With IPMI we had the "System Firmware Progress" and
"Base OS Boot / Installation Status" sensors which we then mapped to some
D-Bus sensors[2][3]. My goal is that we have similar level of detail in a
Redfish interface.

Gunnar discussed this with the DMTF and it seems they are open to a enum that
would describe the boot status.

Any thoughts from the community on how we'd like this to look? Should it just
be a combination of our BootProgress and OperatingSystemStatus D-Bus properties?

Some fields in those seem pretty IPMI/legacy specific (CDROMBoot, ROMBoot, ...)

I think our goal should be to provide a high level summary of the boot from
the BIOS, to the Hypervisor, to the OS.

Something like this?
Unknown -> MotherboardInit -> MemoryInit -> SecondaryProcInit ->
        -> HypervisorStart -> HypervisorStandby -> OSStart -> OSRunning

These would need PLDM commands for the host to send these down so maybe the
PLDM specifications provides a hint on what these should be? I see this doc[4]
has a "Boot Progress" State Set but a lot of these just don't make much sense
to me.

Thoughts/Ideas appreciated.

Thanks,
Andrew

[1]: https://redfishforum.com/thread/275/bios-hypervisor-detailed-boot-progress
[2]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/State/Boot/Progress.interface.yaml
[3]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/State/OperatingSystem/Status.interface.yaml
[4]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0249_1.0.0.pdf
