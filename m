Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5063730E0F1
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 18:26:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW7rR3FVwzDwsv
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 04:26:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uYAI8PL8; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW7q921q4zDwrG
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 04:25:03 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id e133so81164iof.8
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 09:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oeombo/SNz1miY53X5sprpRc+LGUwih20vGsGwdgJ2Y=;
 b=uYAI8PL8LXDpoCaquUnDSuXl3F+ytckU+pqpdK9oyMAAd2W/uxg878nYupczXOEf9J
 QKS9DFTLRT6uGp4WVsbSF2VxirRE35HnIRqKaKqctBurmRu7wbtgbZ3rDycxJDVv1fUw
 t4MsNLU48k5/mR5m/an8PuownY9BI059B3rfSpzql/KMQKDTCtb5aXa5B7JZw89uqyvS
 FPhslgwtPYk39mXF68trG+u/4MVqDNeHVUosDrhRTllxj+vo2V+zN5fMLhSkytA7EUJO
 pQDIi4sIGGz6cTirjfwmudtPsVPQzvt7VfcwKUlPQyRNHE6johUEGWYoJ57jtRbF/uzC
 PkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oeombo/SNz1miY53X5sprpRc+LGUwih20vGsGwdgJ2Y=;
 b=stXVl3OTrLiqMRbWDagXGCLzGsRLx707BQDzPFS113QiFLGYzpw08aj3PkbZXmoo+Y
 LB1ojp41UQVBMeKJo2JvMW1mfgUyUM3ZOCXx4jiLJSl/g3zIkmhf6FhkjCtpmbtJZeJR
 suLuYXsIYLxIZvDjfHtoqv0rWmwfmueJYXGad1HLLAsrzwzYgnXN1auIEOGeWpMVSl9m
 8I1Svp/wNIt6ciYZ1ZUi9CU2W26YJosGJzwZG8au2ZD7lihcqt3+UYjuyoLTJsPXQLRF
 7c9IVDVEoXMjDrmGYsRB/xpfteHTV4eZbDOhIDPmov3djSkZZR4zqWjKyF6wrxtmnMAw
 EPJw==
X-Gm-Message-State: AOAM532teOvTOS5XGYCdnS7w2i6mrDDNSaYJutZZbkVrgA9t6j23Uh+4
 8ejAC4BjFHCyBqbbrTsN2CTAdiRwdt9rF5p2HD4=
X-Google-Smtp-Source: ABdhPJxfh4reefJuNXQwXq2t1a7DH8o9qUjAxEldJUxwPsiefIHewIbAV1VC4PWWMCoxTom5NBvtMQM7aqmFo6y65qs=
X-Received: by 2002:a05:6638:3006:: with SMTP id
 r6mr4031203jak.72.1612373099547; 
 Wed, 03 Feb 2021 09:24:59 -0800 (PST)
MIME-Version: 1.0
References: <TYZPR04MB43666E803D310720362F0CD4F3B59@TYZPR04MB4366.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB43666E803D310720362F0CD4F3B59@TYZPR04MB4366.apcprd04.prod.outlook.com>
From: Sui Chen <suichen6@gmail.com>
Date: Wed, 3 Feb 2021 09:24:46 -0800
Message-ID: <CAFaEeaG3Bt2DJnRHbKVQrYK94EfxhWjOmBfNrWvswj4fN8xW6A@mail.gmail.com>
Subject: Re: dbus-broker caused the system OOM issue.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>
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

On Mon, Feb 1, 2021 at 5:40 PM Fran Hsu (=E5=BE=90=E8=AA=8C=E8=AC=99) <Fran=
.Hsu@quantatw.com> wrote:
>
> Hello,
>         Sometimes my BMC will run out of memory so that I try to find out=
 which process caused the OOM issue.
> From the htop information, it looks like the dbus-broker uses huge memory=
 space.
> What I'm doing is to send the ipmi sdr list command from Host OS thru the=
 kcs interface every 2 seconds.
> In the begging, I could see the dbus-broker uses up to 400MB and then red=
uced to less than 100MB.
> But after some hours I could see the memory usage keep increasing and the=
 dbus-broker caused system OOM eventually.
>
>   1  [||||||||||||||||||||||||||||||||          67.1%]   Tasks: 104, 20 t=
hr; 2 running
>   2  [||||||||||||||||||||||||||||||            60.4%]   Load average: 3.=
12 3.34 3.54
>   Mem[|||||||||||||||||||||||||||||||||||||969M/1003M]   Uptime: 12:59:12
>   Swp[                                          0K/0K]
>
>   PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
>   281 messagebu  20   0  870M  868M   376 S  0.6 86.6 40:54.32 dbus-broke=
r --log 4 --controller 9 --machine-id 932c
>   265 messagebu  20   0  259M   284     4 S  0.0  0.0  0:00.34 /usr/bin/d=
bus-broker-launch --scope system --audit
>
> Version:
>         dbus-broker :25-r0
>
> I'd appreciate any comments or feedback.
>
> Thanks,
> Fran Hsu
> E-Mail : Fran.Hsu@QuantaTW.com
> Tel: +886-3-327-2345 Ext: 16935
>
>

Hello Fran,

I would do a DBus message capture and use it to examine: 1) what
method calls, signals and errors happened on the system, and 2)
whether there are method calls that take too long to complete, or
never return due to some errors.

The capture may be done using a command like "busctl capture >
dbus_capture.pcap"; the command monitors and dumps the DBus messages
to the output file similarly to Wireshark's capture mode. After
transferring the output file from the BMC to the host, dbus-pcap
(https://github.com/openbmc/openbmc-tools/tree/master/dbus-pcap) or a
work-in-progress visual tool
(https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/34263)
may be used to examine it to see if there are method calls that take a
very long time to complete or not return at all.

Hope this helps and thanks,
Sui
