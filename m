Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBBE673128
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 06:26:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyB1S3gQ0z3c7K
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 16:26:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fKx4fo/U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fKx4fo/U;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyB0t1GMFz3c7K
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2023 16:25:32 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id k16so645073wms.2
        for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 21:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xv27NsyWfAe5oUwI99vdT9GjAwb2vz+7sc5Sxl10N4=;
        b=fKx4fo/Uamc2Gg8gD4HgbZ9aZnCCquJM8E/CVMBa2+KlA5dQsxZ5y/+0Y1v6ZgHbgw
         8zjcljncTY0D8OQFNGYh6v49rzLuO8dlzEtj3BvVLTcQf3g5/Zao0PQ72+Sy9kmHz6Zn
         WGfbkEqqnBC7HIOc2IcS2I4a09NGg47pDtQURWq/YfbVDXGKhoc1ysoo4wSPV8AfE8Kl
         j1Fq4gojhOhxEe+2rQRZt+Hqa+CVU3s/iORx0Szdiyy1sykyChe8fenDF2xHM9Sbgifm
         x+RLMArxMvXonpvOR+5Oyc6Pu26DUABvOAoseUIM5zm/I1BgawbjrBPTbF8eR+aqJQb9
         h8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2xv27NsyWfAe5oUwI99vdT9GjAwb2vz+7sc5Sxl10N4=;
        b=VNrdjyylwOB5M9kHDSbJtqjBew3v51srIK/f2D5/z/Ce1DMA8dBW/jOAD++d1IJ9n8
         jdZTDQQFByGVyXL+iKzcPXEAFWa4WNDd0lDgc+W+JnjtSv0VjJJ5tQBchm056++tiG9W
         lBqQQwTEuFF+gBuSpGxzPh1XJ021FQHi12Q8pkAcykiashPuyJThY1nL1zifSeTXJDCm
         IdgZAHDEyVJF+PT8WTAEbG1DZ3rlPagCF6el2tTuKyAVYzPlv7s0lzYjB6kMaKd5vagf
         WTSkT0cWP6cCkzIRTyI/opyQCIC6f6Cjjktx/5yvnd9uBAboe/ysn5fGP79KnS2FHnAR
         64Rg==
X-Gm-Message-State: AFqh2kozn/lKDkRwT361UgH7oDbbBlyYq9DkLJc2e9VZegZgZf4Dkjh0
	fg+e86IsWPSG38JAYqV7Q4uNQwCmO/chiprYWVn8gQ6IWl4xqKLs
X-Google-Smtp-Source: AMrXdXtHaI26zL66W6kZioyqnTrpu5MoBcIcZwmQ/BWImh4xarvUBC9DRXdpVs6MPt4EpUjq5G0LSgv96d/exsrAF2Y=
X-Received: by 2002:a05:600c:5389:b0:3d7:fa4a:6827 with SMTP id
 hg9-20020a05600c538900b003d7fa4a6827mr469317wmb.188.1674105925031; Wed, 18
 Jan 2023 21:25:25 -0800 (PST)
MIME-Version: 1.0
References: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
In-Reply-To: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Thu, 19 Jan 2023 13:25:13 +0800
Message-ID: <CA+J-oUv6L0MnfN_OcbZqAudSupCxH1g-gtyfw8NOO117Wd=6-Q@mail.gmail.com>
Subject: Re: [External] Add UDP transport for rsyslog
To: Gleb Semenov <g.semenov@yadro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Gleb,

I share a problem I encountered some time ago about using `UDP`
rsyslog.If there are more UDP(About 50 logs per second) logs, will
block ipmi messages,
due to bad udp tx performance.

My network is a 1000M direct connection, using `iperf3` to verify.
```
./iperf3 -u -c 192.168.1.2 -b 1000m -t 10 -p 1314
Connecting to host 192.168.1.2, port 1314
[  5] local 192.168.1.108 port 55038 connected to 192.168.1.2 port 1314
[ ID] Interval           Transfer     Bitrate         Total Datagrams
[  5]   0.00-1.00   sec  58.0 KBytes   475 Kbits/sec  41
[  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec  0
[  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec  0
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter
Lost/Total Datagrams
[  5]   0.00-10.00  sec  58.0 KBytes  47.5 Kbits/sec  0.000 ms  0/41
(0%)  sender
[  5]   0.00-11.69  sec  58.0 KBytes  40.6 Kbits/sec  0.030 ms  0/41
(0%)  receiver
```

I found a patch[0] that may fix it.
Apply this patch:
```
iperf3 -u -c 192.168.1.2 -b 1000m -t 10 -p 1314
Connecting to host 192.168.1.2, port 1314
[  5] local 192.168.1.108 port 34362 connected to 192.168.1.2 port 1314
[ ID] Interval           Transfer     Bitrate         Total Datagrams
[  5]   0.00-1.01   sec  23.2 MBytes   193 Mbits/sec  16782
[  5]   1.01-2.01   sec  24.8 MBytes   209 Mbits/sec  17977
[  5]   2.01-3.00   sec  31.5 MBytes   266 Mbits/sec  22819
[  5]   3.00-4.00   sec  28.3 MBytes   237 Mbits/sec  20461
[  5]   4.00-5.00   sec  27.6 MBytes   232 Mbits/sec  19996
[  5]   5.00-6.00   sec  28.3 MBytes   237 Mbits/sec  20498
[  5]   6.00-7.00   sec  30.1 MBytes   252 Mbits/sec  21796
[  5]   7.00-8.00   sec  28.5 MBytes   239 Mbits/sec  20609
[  5]   8.00-9.00   sec  25.0 MBytes   210 Mbits/sec  18140
[  5]   9.00-10.00  sec  24.1 MBytes   202 Mbits/sec  17457
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Jitter
Lost/Total Datagrams
[  5]   0.00-10.00  sec   271 MBytes   228 Mbits/sec  0.000 ms
0/196535 (0%)  sender
[  5]   0.00-10.04  sec   271 MBytes   227 Mbits/sec  0.065 ms
0/196535 (0%)  receiver
```

[0]: https://github.com/AspeedTech-BMC/linux/commit/05c055107d56cd699bc88a3=
440665d95d9a634ff

Cheers,
Jian


On Wed, Jan 18, 2023 at 7:46 PM Gleb Semenov <g.semenov@yadro.com> wrote:
>
> Hello colleagues!
>
> I'm a new member of the Yadro OBMC team and currently working on modifica=
tions of the phosphor logging service. Our client requested us to make OBMC=
's rsyslog to use UDP transport for remote logging. Currently it uses just =
TCP and this configuration is hard-coded.
>
> It looks like the phosphor-rsyslog-config has only one external dependenc=
y, namely the sdbusplus library, which provides appropriate DBUS interface =
handler to configure network parameters. Also it needs to modify DBUS inter=
face description for network client.
>
> The following should be performed:
>
> Modification of the xyz/openbmc_project/Network/Client.interface.yaml int=
erface to add the protocol attribute.
> Handling for the  interface changes in the code of the dbusplus library.
> Corresponding changes to the phosphor-rsyslog-config service.
> Proper changes to the REST/redfish API.
> Modification of the web interface and command line tools.
>
> Also, current DBUS interface to the object implies two independent messag=
es to change network parameters, one to set the IP-address, and the other t=
o set the port number. They are not atomic and configuring just one paramet=
er yields in undesirable state transitions of the service to configure. It =
is good to send all the parameters in one "atomic" message. But, I'm unders=
tand that this may require to persist current network parameters on both si=
des of transmission (or, at least, to have all of them on sending side upfr=
ont).
>
> So, it needs to add  DBUS getters/setters for just protocol type, and all=
 parameters at once.
>
> I'm interested in what other components may be affected by such improveme=
nts?
>
> Your comments will be appreciated.
>
> Regards!
>
> Gleb
