Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ABF1000A
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 21:01:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44trVT02cYzDqRK
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 05:01:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="INERLXvI"; 
 dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44trTH2397zDqTm
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 05:00:50 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id d31so7264153pgl.7
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Nz0a2hnKXMIpxinaabl7JCaJSxA1iHGyywTQq0Cguw=;
 b=INERLXvIuQzXlyfhSvsXIAQ0Z/+7WN1SfimrykV71v0GkC5LRuv4UmhCSM3QGWAYd3
 ZsLnkAD+8seZCDkUtDVCilpYNfS0Wh5SYhmjvXSFHf/uuOAAZ8SvCTu1C0Ilmn8CBgqy
 37a4+MMZqXyfUT7KvGcFduRUJZ4l1WdpG44wfToY4LsVRzrZaSO7Mm9R/B+2Khum0vb6
 PDHBqAL/jlay0GnOudYT/wrBtHvM/khmUu3aTeiThAtzmxHzlYWQESoNYTruylzku88k
 UfNTZAQNHPfxjT54RfllpBlL5v7vcfRudfLBwB5aI2lPc6As7lCbIvtGPcFfzu8/vBYI
 6PkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Nz0a2hnKXMIpxinaabl7JCaJSxA1iHGyywTQq0Cguw=;
 b=KFEI41sAOBo9EpHGjFeLQw0a7Lk9tlquJjXtgpdERRGGNgtqHy8DuE/fq3xMwTEVUQ
 iy7pp5RMT2LzI9AuAUFR6grqqwjo1BHouQUfRylq2UvVGc1Oc4tSWMFjmlxMmP/f+Bhl
 T2rh6DcfTrEvZ71x87BFpa6i3NC3+1AN+Ewx2nyboI1q167Xt3CJ+ctMjlQ2ZQVVu8J3
 R8KrkIjUIEkvHfk+m9ZxCC6PC2NsPfPvONjtagf/AkqL6izjFiAYaUGOJCxPpQPj36wJ
 vINwCaZMFK6dNUj1jDYNtUr/mPtegel8p47WfaCXRVYsux6Sxjo70w5WlIewMgre85SW
 VH+Q==
X-Gm-Message-State: APjAAAWlVyGCiY3H4rdcE/rVqL5mkRjuRv/pImDs51+j3gjwY0FXvCX7
 5cX3YvLlj/fQ/SUUSmuwBQDguUioIcyQOgM4RzCm0lU2j7E5ZQ==
X-Google-Smtp-Source: APXvYqxDTddSmK5QSalN/Tw7Az3xJuBvKpql1TVxO7vdhCyxeka9BO+oehas6k8Sbp+zkhj7r+N/032AVO8/nfKHWzs=
X-Received: by 2002:a63:de11:: with SMTP id f17mr58114772pgg.94.1556650847126; 
 Tue, 30 Apr 2019 12:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <303477D5-BB35-4FC8-98FB-9C59A188064C@fb.com>
 <CAO=notzKTpC-6zAGODatyDJL5p1Y3+mW5-LbxRh7qtg1hNmufQ@mail.gmail.com>
 <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
In-Reply-To: <AF2ED931-7FB2-4AFE-AFCE-D0AEC3646A44@fb.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 30 Apr 2019 12:00:35 -0700
Message-ID: <CAO=notyhSG=E6kwv63ODRQQz7SD3rindmtAYxa=OuFvSv=mELg@mail.gmail.com>
Subject: Re: Phosphor pid control
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2019 at 11:41 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> I checked in code and looks like /usr/share/swampd/config.json file is mi=
ssing. Where do we get this file from or where is example config.json file?

If you're using the entity-manager to configure it, you wont' need
that file, but you will need to tell swampd that it's in that mode
during configuration.

You can add this to your swampd_%.bbappend:

EXTRA_OECONF_append =3D " --enable-configure-dbus"

>
> =EF=BB=BFOn 4/30/19, 11:31 AM, "Patrick Venture" <venture@google.com> wro=
te:
>
>     +James Feist to provide assistance.
>
>     On Tue, Apr 30, 2019 at 11:30 AM Vijay Khemka <vijaykhemka@fb.com> wr=
ote:
>     >
>     > I have enabled phosphor-pid-control in my image and I see following=
 log
>     >
>     >
>     >
>     > Apr 12 23:22:43 tiogapass systemd[1]: Started Phosphor-Pid-Control =
Margin-based Fan Control Daemon.
>     >
>     > Apr 12 23:22:46 tiogapass swampd[1072]: terminate called after thro=
wing an instance of 'std::runtime_error'
>     >
>     > Apr 12 23:22:46 tiogapass swampd[1072]:   what():  ObjectMapper Cal=
l Failure
>     >
>     > Apr 12 23:23:04 tiogapass systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mph=
osphor-pid-control.service: Main process exited, code=3Dkilled, status=3D6/=
ABRT[[0m
>     >
>     > Apr 12 23:23:04 tiogapass systemd[1]: [[0;1;39m[[0;1;31m[[0;1;39mph=
osphor-pid-control.service: Failed with result 'signal'.[[0m
>     >
>     > Apr 12 23:23:13 tiogapass systemd[1]: phosphor-pid-control.service:=
 Service RestartSec=3D5s expired, scheduling restart.
>     >
>     > Apr 12 23:23:13 tiogapass systemd[1]: phosphor-pid-control.service:=
 Scheduled restart job, restart counter is at 1.
>     >
>     > Apr 12 23:23:16 tiogapass systemd[1]: Stopped Phosphor-Pid-Control =
Margin-based Fan Control Daemon.
>     >
>     > Apr 12 23:23:16 tiogapass systemd[1]: Started Phosphor-Pid-Control =
Margin-based Fan Control Daemon.
>     >
>     > Apr 12 23:23:17 tiogapass swampd[1145]: No fan zones, application p=
ausing until reboot
>     >
>     > Apr 12 23:23:27 tiogapass swampd[1145]: New configuration detected,=
 restarting
>     >
>     > Apr 12 23:23:27 tiogapass swampd[1145]: .
>     >
>     > Apr 12 23:23:27 tiogapass systemd[1]: phosphor-pid-control.service:=
 Succeeded.
>     >
>     > Apr 12 23:23:32 tiogapass systemd[1]: phosphor-pid-control.service:=
 Service RestartSec=3D5s expired, scheduling restart.
>     >
>     > Apr 12 23:23:32 tiogapass systemd[1]: phosphor-pid-control.service:=
 Scheduled restart job, restart counter is at 2.
>     >
>     > Apr 12 23:23:33 tiogapass systemd[1]: Stopped Phosphor-Pid-Control =
Margin-based Fan Control Daemon.
>     >
>     > Apr 12 23:23:33 tiogapass systemd[1]: Started Phosphor-Pid-Control =
Margin-based Fan Control Daemon.
>     >
>     > Apr 12 23:23:34 tiogapass swampd[1183]: No fan zones, application p=
ausing until reboot
>     >
>     >
>     >
>     >
>     >
>     > I have configuration defined through entity manager. What is the be=
st way to debug this and modify configurations.
>     >
>     >
>     >
>     > Regards
>     >
>     > -Vijay
>
>
