Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84B23F309
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 21:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNb5B1h29zDqlh
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 05:29:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ibMSnq15; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNb4F1YgQzDqlQ
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 05:28:12 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id i10so1174961ybt.11
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v33wQkQXCRwmyMJi7QXzW2ieVTKnP9MtDdjMlTFwKrM=;
 b=ibMSnq15n3tnDwh5RNPqICYQNKeyP8ImxIV18yqT+Uia/NVTXP+ZRM8JmbyD7Sp5AU
 qcq2daFkW5P8lvQ48ra92FYuT8k5S5ZAIhoGruXsqQYhw3C8MWMaPpDcFqh3dYNSMDFD
 zESVsItEVZXzRtyQ2uu/JRsTRDkG7bvkZpymVL3gZl96PZ80ODtcZUhjGW3OE5ladk2F
 WnkutR5V53IBkS3rbQ2uMGcjkx9QD3mBEuf5SX2bkTZcETYHL0O3fQDPz84xmxvszWKC
 bnRqZlN2HF/EMIz0nRfuPDwmLEtrWukjQ+iuuLlxyLDYDImVVeGTkWTuoCpSXaW/QNR4
 s0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v33wQkQXCRwmyMJi7QXzW2ieVTKnP9MtDdjMlTFwKrM=;
 b=AceD8vJSsX1u597O5vJGtTdEPMt9aVvte5qIeFdharY2WeShlDqZ80g38o5OJHVSYa
 AdBdwZyfUz9M+wmFdZ5LyRvmffUCGaeXmZBmbZPtgW0eFY2pFfPF3Xooferis0ztRkaT
 thmT79b07Gz26BmO7z1rcGYSXPcnEvpWButbnJMJFtuqDEhgtGYpWF1Mf3jGJ9l0RIsR
 EeBM2FHIIXZJx9+xxL8avm4EI4s2RCr+TxfCydfBOM9IckG3XPqmbRcvx1mNIGinJwaL
 k2Xaf4yzYtEk/BoO4DzK8JzTuXEcY7Ff38cTfySngAd/g8aFOrz3aDKX5uFe44Kh2+me
 eqUQ==
X-Gm-Message-State: AOAM532OPtVaIGqRfguQOhp0IGaRMlcbpdOfskMqK2NCAYSp3lVKpJsl
 n5aNDUHn/SlKQTKLsUx4Pscv5IoL3ZwQhiZa09cm7g==
X-Google-Smtp-Source: ABdhPJzVoX0Y34LShTMdUcPNKCnz8UJPMSm5zsBMGJ3hOKbBqASMcyp+C0rE6DsTgw3gGb+cx3rYDEXe9tzvpIC3Q2M=
X-Received: by 2002:a25:8481:: with SMTP id v1mr23045784ybk.203.1596828488167; 
 Fri, 07 Aug 2020 12:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
 <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
 <9deda21d-aa01-d15e-464e-7ab0fb2f751c@linux.intel.com>
 <CAHBbfcX7TahfKcVcUqWKQGTK5s9Rzw3mT4_3v4tWtkAgHBgX6g@mail.gmail.com>
 <cf598e89-10ba-8cdd-f6c6-26f175e21e83@linux.intel.com>
 <CAHBbfcW=r9=sCPkV-bEXuE-Fi_2w-REE3RuaAhLHYL3iMZdVxw@mail.gmail.com>
In-Reply-To: <CAHBbfcW=r9=sCPkV-bEXuE-Fi_2w-REE3RuaAhLHYL3iMZdVxw@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 12:27:57 -0700
Message-ID: <CACWQX81K_Nc4PaHet3R74M3Mn+Q13QzO7+LHW_KjV5cpYMggyg@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
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
Cc: Alex Qiu <xqiu@google.com>, James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 11:30 AM Jason Ling <jasonling@google.com> wrote:
>
> A quick word about the original topic of this thread; we picked hwmontemp=
 sensors where possible because we've seen performance issues for PSUSensor=
s (could be N seconds before Sensor.Value gets updated to dbus). This has u=
ndesirable implications for PID loops..
> thought was that spreading temp sensors over into hwmontemp sensor where =
possible would help mitigate the performance issue until we can figure out =
a better long term solution.
>

Have you filed a bug, or asked on the mailing list before now?  This
is the kind of feedback the authors of that sensor need (Ideally
before you move over to another subsystem like hwmontemp).  If I
didn't see your message/bug and you did post it, I apologize, I'm not
trying to call you out.
If you have specifics, like the value of N, and the details around
what chips you're interacting with and whatever debugging you've done,
it would be helpful to put that in a bug for triage.
Keep in mind, PSUSensor by default has a 1 second scan rate.
https://github.com/openbmc/dbus-sensors/blob/41061e2c3198c0f597d4f6bb702b69=
0a273ab45d/include/PSUSensor.hpp#L38

If it's not obeying that, clearly there's a bug to fix somewhere.

On some platforms, I have seen very high rate polling of power values
on the PSU I2c bus by other devices, and that tends to hold up
transactions for other components.  If that bus is misbehaving or
overloaded on your platform, it might have triggered a weird condition
within the PSU sensor (like the scans taking longer than the scan
rate).

If you have any more details here, it's quite possible someone will
have an idea where to look, or know exactly where the problem is.
