Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678F15D00F
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 03:41:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Jd114gBbzDqXV
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 13:41:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sia+krSK; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jd0F4Jc1zDqN0
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 13:40:27 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id o15so8980789ljg.6
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 18:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1KiV8xpX78tzdxeKDQP+Upo8ahYqpIvFE1wOhiMpfpQ=;
 b=sia+krSKrGUyizpcwIh0JGwY8VPn3DWJzFTbh115a0SZntBOwXwlxM14jeyYLJcvax
 kaoSG+1r4VM/8u//zKCFoy/pur2M2Pq5xs1T6mGXQEqvd7AbLZBXgPyd44jMcYoHO9WX
 0/rjywDZr0zTEXiOMnn9h0VVnq/krF+lcciQHWzIi0cBzxAvPRvkUg0bl2g1Oo9KShPT
 2F/6gBWB6WA2/669NrDS3yIKbHPe2p5BAQ/8swZDuTBXTN6yS8ZtpEWfYYijqiAbMX43
 AvU6P9wRl7q0OwK6SRngNwxny+fbvvhQMDe+BZeQrQH0rWko5fUbdwLWP4nuw7Vcm5Vc
 19cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1KiV8xpX78tzdxeKDQP+Upo8ahYqpIvFE1wOhiMpfpQ=;
 b=rGg+ehP3S4G0uF0SH0zER9FcD5ztW45jodZR4ds1foXyAFod4gakeCEDp4Vodz4H0z
 VG5ntv+80vw7bqfIA6xKgxDasY5mB7l6W/3wBWfEHmdsk7KLYX+2KWcAtu70A3A8wAQN
 F/K8BNNq7iQrD6th+3PyYhuuWYTwliNTzogrCGZOLbUQXbkVgepi/19+ehN1V+oYvNNN
 02XbXEYWOsUpbm1YIn7ElNufKWCbsFoNpcPIL6HyVcCQusGm0miTDE4jlRAGSY4txNQw
 RE98uM43QqyZq9m1M22t7yohP7QT0ouJxLId0BrUgQuBcg1Nij75bZ094sQRnobtkYdY
 pZMA==
X-Gm-Message-State: APjAAAWqCf4GW+SALW0GhQ7oJU7AZcC6p+lV/FGeIPhLoUV/uWfp1igK
 V1pa8MygDcpx6J5FDAXHUKVz0cajv49qJugR8XA=
X-Google-Smtp-Source: APXvYqyZKqIpoElEDLUJoZMmzfUoqRr030lP9YXaXe0tSh0nJvNsQxhtAF1DlfUthR1bEdBDE+LD2w4oCK58ZDqvRcM=
X-Received: by 2002:a2e:6817:: with SMTP id c23mr481582lja.263.1581648022655; 
 Thu, 13 Feb 2020 18:40:22 -0800 (PST)
MIME-Version: 1.0
References: <tencent_00C3206803D76A7D3DA93D84@qq.com>
In-Reply-To: <tencent_00C3206803D76A7D3DA93D84@qq.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 14 Feb 2020 10:40:11 +0800
Message-ID: <CAARXrtkNXsYh9me851DUFZLWKxi+nR=3TO_5dgQDRF_45e93Fg@mail.gmail.com>
Subject: Re: how softpoweroff works for openbmc
To: =?UTF-8?B?5Y2X6YeO44Og44Or44K344Ko44Op44K0?= <1181052146@qq.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I had a summary of how the soft-off works=EF=BC=8C please see below.

---

On OpenPOWER systems, the soft-off is implemented by
phosphor-softpoweroff in phosphor-host-ipmid/softoff.
The whole steps are described as below:

1. To power off the host gracefully, BMC sets  RequestedHostTransition
to Off implemented by phosphor-host-state-manager.
   https://github.com/openbmc/phosphor-state-manager/blob/c101157e5b138f360=
44a2a3aaf15ad8ac16501fc/host_state_manager.cpp#L316
2. phosphor-host-state-manager starts obmc-host-shutdown@0.target
3. The target depends on
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service, and it comes
to phosphor-softpoweroff.
4. phosphor-softpoweroff invokes sendHostShutDownCmd(), that calls the
"Execute" method of "xyz.openbmc_project.Control.Host".
   https://github.com/openbmc/phosphor-host-ipmid/blob/51f781418013b993f4b3=
d5c1572ce19a5b93edf0/softoff/softoff.cpp#L32
5. The host control service (implemented in host-cmd-manager.cpp) puts
the command in a queue and invokes checkQueueAndAlertHost(), which
invokes "setAttention" method of "org.openbmc.HostIpmi".
   https://github.com/openbmc/phosphor-host-ipmid/blob/51f781418013b993f4b3=
d5c1572ce19a5b93edf0/host-cmd-manager.cpp#L112
6. btbridged implements setAttention()=EF=BC=8C and it sends SMS ATN messag=
e
to host via IPMI BT.
   https://github.com/openbmc/btbridge/blob/aa5511d28ff9acee4a404c6397d09f5=
187812ed8/btbridged.c#L261
7. Then the Host received the attention, so it reads messages from BMC.
8. BMC's ipmid's ipmi_app_read_event() is invoked, and the queued SOFT
OFF command is sent to the Host, and sends a CommandComplete signal on
DBus.
   https://github.com/openbmc/phosphor-host-ipmid/blob/51f781418013b993f4b3=
d5c1572ce19a5b93edf0/systemintfcmds.cpp#L23
9. phosphor-softpoweroff registers the signal, so the callback
hostControlEvent() is invoked, which starts a timer (configurable by
IPMI_HOST_SHUTDOWN_COMPLETE_TIMEOUT_SECS).
   When it times out, the BMC will shutdown the chassis power.
   https://github.com/openbmc/phosphor-host-ipmid/blob/51f781418013b993f4b3=
d5c1572ce19a5b93edf0/softoff/softoff.cpp#L75
10. When the Host OS is shutdown, it sends the chassis control's
CMD_POWER_OFF message via IPMI.
11. The ipmid invokes stop_soft_off_timer()=EF=BC=8Cand sets the property
"ResponseReceived" to "SoftPowerOff.HostResponse.HostShutdown".
   https://github.com/openbmc/phosphor-host-ipmid/blob/51f781418013b993f4b3=
d5c1572ce19a5b93edf0/chassishandler.cpp#L1159
12. In phosphor-softpoweroff, responseReceived() is invoked, stops the
timer, and the process exits normally.
    https://github.com/openbmc/phosphor-host-ipmid/blob/51f781418013b993f4b=
3d5c1572ce19a5b93edf0/softoff/softoff.cpp#L118
13. Then systemd will execute the other dependent
obmc-chassis-poweroff@.target, which shutdowns the chassis power.


On Thu, Feb 13, 2020 at 11:20 PM =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 <1181052146@qq.com> wrote:
>
> Greetings:
> I am learning how power control works in openbmc system. It comes to powe=
roff sequence. I found that for poweroff there are "poweroff" and "softpowe=
roff".
> 1. for "poweroff", I found the call path:
> ipmiChassisControl()             //phosphor-host-ipmid
> initiate_state_transition()
> ...
> d-bus
> ...
> requestedHostTransition()   //phosphor-state-manager
> ...
> dbus
> ...
> on_set_power_state()            //skeleton
> and finally write some gpio pin to power down.
> 2. for "softpoweroff", I found the call path:
> ipmiChassisControl()             //phosphor-host-ipmid
> stop_soft_off_timer()
> sendHostShutDownCmd()
> ipmid_send_cmd_to_host()
> checkQueueAndAlertHost()
> ...
> d-bus(setAttention)
> ...
> method_send_sms_atn()      //btbridge
> and finally send some message to host via BT, or in case of KCS via KCS.
> My question is:
> 1. In case of softpoweroff I found in code that the openbmc system just s=
end setAttention to host and return? Does that mean letting the host system=
 to powerdown and openbmc system does not write any power related gpio anym=
ore?
> 2. If host system can handle the softpoweroff request sent by openbmc, Ho=
w can host system handle it? I know there is a module called ipmi_si.ko whi=
ch may communicate with openbmc. But I do not find and code in ipmi_si rela=
ted with softpoweroff, or any other module in host system to control softpo=
weroff?
> 3. I am a learner of openbmc, I know there must be errors in my mail.
> Can anyone help tell me?
>
> Best Regards!
> Liu Hongwei
