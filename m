Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F72FE67D
	for <lists+openbmc@lfdr.de>; Fri, 15 Nov 2019 21:41:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F9HZ0TlPzF3Wd
	for <lists+openbmc@lfdr.de>; Sat, 16 Nov 2019 07:41:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OoinSEuj"; 
 dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F9Gj66lYzF7bp
 for <openbmc@lists.ozlabs.org>; Sat, 16 Nov 2019 07:40:43 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id d22so2829868oic.7
 for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2019 12:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0Gbtw/ZBsy8+VXzmQ7ibMikB+6hCmAj7mkYpwlIutY8=;
 b=OoinSEujrjo0HJa2nqK23f8z9QzExd7z0hnQ959OaiyTeaCf7lTZiXKLEGMwVOdnQy
 0l6lyWQQI68FmQoQqTgpgEH+hTcqGSZhferacNYafFZhecX4w92dqeNwY1PDTmJGiLyl
 oW1ZSIm8h9mMOlQi1LYJcxFv8NYIBvtMVlqcS30co7JlHaMwmBhcKYVFJLq1s7Uti3VU
 Jq8w+kivBsge/fGXt+MkKQ/fzkSeozgisfETvbnyk30ac51yZ0yc4qvTJVMdEBjjyHfC
 hXSmxCzGW2Xnd7FUV4vw4Bhdrs/IGP/cuaRNWPfWlaxD1sYB/rO4255hwL6gPLZ7X/Vr
 uMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0Gbtw/ZBsy8+VXzmQ7ibMikB+6hCmAj7mkYpwlIutY8=;
 b=Piy6cs1Fuk6tgSGKNhmy1xyPFD+WQSYcDfZZxoGazyysezGrTywH5lQMxfKJHUcOiO
 lyYG7t3MD39U5bM3LCb9yLK5OsagMmlBqxUAhWCPFXzEBTCWyfTZR2hPReAd5aszW2Sc
 eEnb59uFVNP2E4cAaQWlmZJ0iqcQaW+WuugfoeFocj9TcUocbK6o2rHaNdZoGsPwHIUN
 EXASGb6x4feBbFFLsGjndXh54IwwTeB+EpTxT8kKx6q+GQ77LB14F9o760j6kZGo8z5/
 P1Y8C5LGsh6c0QM5GiysXo3OgHWh6lEafdvPVJbZkSG9UZuf3pkqff0K2RJE3kgHA2cV
 WTqQ==
X-Gm-Message-State: APjAAAWW2jxlvXSxKTCGGV8Clcn2E5o3m1ZREZChwd+PkwA50M8F22PE
 UIJrV25ZD5DXQ/l45cN0hvRoxeuOI4W6EWfjTGE=
X-Google-Smtp-Source: APXvYqxTV85LZKkVv01YCBIcgoYNRWZq06iOwEgdAX1Mdg20RMzmsNO70whOkkVb9w9izHFN/OxqfeWlwhni6e6La6M=
X-Received: by 2002:aca:c7c1:: with SMTP id x184mr9701332oif.158.1573850440046; 
 Fri, 15 Nov 2019 12:40:40 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 15 Nov 2019 14:40:24 -0600
Message-ID: <CALLMt=qGFEdZ3xFntm7cOrLXxcUJE2T3XkrOT12L6wiCjcoe3Q@mail.gmail.com>
Subject: phosphor-state-manager enhancements
To: apparao.puli@linux.intel.com, jason.m.bills@linux.intel.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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

Since the creation of phosphor-state-manager and its representation of the
different bmc/chassis/host states, there has been a steady influx of requests
to provide more state and actions to these objects.

I'm starting to look into how best do this. There have been a few different
code and doc commits in this area, but they all seem to get stuck because
they break with the original design points of phosphor-state-manager. I'd
like to fix that. See [1] below for different requests I know of.

My concern is that if we don't address these additional state needs within
phosphor-state-manager, we'll just do it elsewhere, which causes redundancy
and makes it more challenging to share code.

The original design of phosphor-state-manager was to keep it super simple
and basically make it a wrapper around systemd targets. There was a large
focus on keeping the different objects (BMC, Chassis, Host) separate to ensure
some day when multiple BMC's, Chassis's, or Hosts are added to a system, it
all would just work.

There are definitely some merits to this design:
- It ensures anyone can insert their services into the appropriate systemd
  targets without any phosphor-state-manager code changes required
- A direct mapping of phosphor-state-manager state to systemd target keeps the
  code very simple

Some drawbacks to this design though:
- Our systemd target design is complicated [2]. There are lots of targets that
  need to be understood to get services in the right spots.
- It provides very limited state information. BMC is ready or not ready, chassis
  is on or off, host is running or off.
- It provides limited control. Reboot the BMC, turn chassis on or off, start,
  stop, or reboot the host.

The design was that external entities could do the more advanced logic. Want
your system to hard power off, use the chassis object. Want to power cycle
your chassis, turn it off, wait, then turn it on. Want to know if it's
powering on, look at the requested state and current state and do the logic
yourself.

So what am I thinking? I'm thinking that we should at least represent a subset
of Redfish states. Here's the full list:

"Absent": "This function or Resource is either not present or detected.",
"Deferring": "The element does not process any commands but queues new
 requests.",
"Disabled": "This function or Resource is disabled.",
"Enabled": "This function or Resource is enabled.",
"InTest": "This function or Resource is undergoing testing.",
"Quiesced": "The element is enabled but only processes a restricted set of
 commands.",
"StandbyOffline": "This function or Resource is enabled but awaits an external
 action to activate it.",
"StandbySpare": "This function or Resource is part of a redundancy set and
 awaits a failover or other external action to activate it.",
"Starting": "This function or Resource is starting.",
"UnavailableOffline": "This function or Resource is present but cannot be
 used.",
"Updating": "The element is updating and may be unavailable or degraded."

Starting -> Could apply to Chassis and Host when they are powering on / starting
InTest -> Could apply to when a host is taking an NMI and collecting debug
Updating -> Could apply to BMC and Host when a firmware update is in progress

There is actually a PowerState associated with the ComputerSystem we could
enhance the chassis with as well (PoweringOn, PoweringOff)

And also, some Redfish ComputerSystem.Reset operations we don't currently
support:
- ForceOff, ForceRestart, PowerCycle
Note we do "support" these but only via multiple operations.

Should we try to capture more of the host states? Right now we capture those
in the BootProgress and OperatingSystemState sensors.

So anyways, before I went to far I figured I'd get a note out to see if others
have thoughts. How ingrained are the current states? Will adding new one's
have a large impact on other software?

Thanks,
Andrew

[1]
# add firmware update state to BMC
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/26867

# Add PowerCycle and Reset to Chassis
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/22270

# Additional host states (Started)
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22461

[2]
https://github.com/openbmc/phosphor-state-manager/blob/master/README.md
https://github.com/openbmc/docs/blob/master/architecture/openbmc-systemd.md
