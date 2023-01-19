Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7DD6734E4
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 10:58:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyJ3Q0Gg7z3fD3
	for <lists+openbmc@lfdr.de>; Thu, 19 Jan 2023 20:58:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=CCG7WLMQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=g.semenov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=CCG7WLMQ;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyJ2m6y3vz3bYW
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2023 20:57:35 +1100 (AEDT)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id AC973341895;
	Thu, 19 Jan 2023 12:57:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-type:content-type:date:from:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=mta-01; bh=zGJMJHFV2QA985wN5E9UaM0Fxy2kcn7gwywc3Qu2EfA=; b=
	CCG7WLMQBz4tQDIvwYlUAlGd2+a5aHCKBSIKJXpPuuHlqfkX6YhYKSEtZrNFDhwY
	8DogrYP8QfEbNsXjIxOHH8PksH9wBiqqUZjjZHegbyTmZMvHYZBDQp4owMxUlZFx
	AWPALb406lXFrDHhLTK2aq6eeGivg/r8+vOVhL+JuEw=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 9FDF934188A;
	Thu, 19 Jan 2023 12:57:31 +0300 (MSK)
Received: from [10.199.28.51] (10.199.28.51) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Thu, 19 Jan
 2023 12:57:31 +0300
Content-Type: multipart/alternative;
	boundary="------------vUvqOCM1OZzjAIuaccgcQb04"
Message-ID: <ca88bc4a-74aa-9e5d-3ebd-f9f2ce925634@yadro.com>
Date: Thu, 19 Jan 2023 12:57:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [External] Add UDP transport for rsyslog
Content-Language: en-US
To: Zhang Jian <zhangjian.3032@bytedance.com>
References: <4fcca645-ebc3-792f-aff2-e26df9660d72@yadro.com>
 <CA+J-oUv6L0MnfN_OcbZqAudSupCxH1g-gtyfw8NOO117Wd=6-Q@mail.gmail.com>
From: Gleb Semenov <g.semenov@yadro.com>
In-Reply-To: <CA+J-oUv6L0MnfN_OcbZqAudSupCxH1g-gtyfw8NOO117Wd=6-Q@mail.gmail.com>
X-Originating-IP: [10.199.28.51]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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

--------------vUvqOCM1OZzjAIuaccgcQb04
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jian!

Thank You for this note. We must pay attention to this circumstance 
during test phase.

Regards!

Gleb

On 19.01.2023 08:25, Zhang Jian wrote:
> Hi Gleb,
>
> I share a problem I encountered some time ago about using `UDP`
> rsyslog.If there are more UDP(About 50 logs per second) logs, will
> block ipmi messages,
> due to bad udp tx performance.
>
> My network is a 1000M direct connection, using `iperf3` to verify.
> ```
> ./iperf3 -u -c 192.168.1.2 -b 1000m -t 10 -p 1314
> Connecting to host 192.168.1.2, port 1314
> [  5] local 192.168.1.108 port 55038 connected to 192.168.1.2 port 1314
> [ ID] Interval           Transfer     Bitrate         Total Datagrams
> [  5]   0.00-1.00   sec  58.0 KBytes   475 Kbits/sec  41
> [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec  0
> [  5]   9.00-10.00  sec  0.00 Bytes  0.00 bits/sec  0
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Jitter
> Lost/Total Datagrams
> [  5]   0.00-10.00  sec  58.0 KBytes  47.5 Kbits/sec  0.000 ms  0/41
> (0%)  sender
> [  5]   0.00-11.69  sec  58.0 KBytes  40.6 Kbits/sec  0.030 ms  0/41
> (0%)  receiver
> ```
>
> I found a patch[0] that may fix it.
> Apply this patch:
> ```
> iperf3 -u -c 192.168.1.2 -b 1000m -t 10 -p 1314
> Connecting to host 192.168.1.2, port 1314
> [  5] local 192.168.1.108 port 34362 connected to 192.168.1.2 port 1314
> [ ID] Interval           Transfer     Bitrate         Total Datagrams
> [  5]   0.00-1.01   sec  23.2 MBytes   193 Mbits/sec  16782
> [  5]   1.01-2.01   sec  24.8 MBytes   209 Mbits/sec  17977
> [  5]   2.01-3.00   sec  31.5 MBytes   266 Mbits/sec  22819
> [  5]   3.00-4.00   sec  28.3 MBytes   237 Mbits/sec  20461
> [  5]   4.00-5.00   sec  27.6 MBytes   232 Mbits/sec  19996
> [  5]   5.00-6.00   sec  28.3 MBytes   237 Mbits/sec  20498
> [  5]   6.00-7.00   sec  30.1 MBytes   252 Mbits/sec  21796
> [  5]   7.00-8.00   sec  28.5 MBytes   239 Mbits/sec  20609
> [  5]   8.00-9.00   sec  25.0 MBytes   210 Mbits/sec  18140
> [  5]   9.00-10.00  sec  24.1 MBytes   202 Mbits/sec  17457
> - - - - - - - - - - - - - - - - - - - - - - - - -
> [ ID] Interval           Transfer     Bitrate         Jitter
> Lost/Total Datagrams
> [  5]   0.00-10.00  sec   271 MBytes   228 Mbits/sec  0.000 ms
> 0/196535 (0%)  sender
> [  5]   0.00-10.04  sec   271 MBytes   227 Mbits/sec  0.065 ms
> 0/196535 (0%)  receiver
> ```
>
> [0]:https://github.com/AspeedTech-BMC/linux/commit/05c055107d56cd699bc88a3440665d95d9a634ff
>
> Cheers,
> Jian
>
>
> On Wed, Jan 18, 2023 at 7:46 PM Gleb Semenov<g.semenov@yadro.com>  wrote:
>> Hello colleagues!
>>
>> I'm a new member of the Yadro OBMC team and currently working on modifications of the phosphor logging service. Our client requested us to make OBMC's rsyslog to use UDP transport for remote logging. Currently it uses just TCP and this configuration is hard-coded.
>>
>> It looks like the phosphor-rsyslog-config has only one external dependency, namely the sdbusplus library, which provides appropriate DBUS interface handler to configure network parameters. Also it needs to modify DBUS interface description for network client.
>>
>> The following should be performed:
>>
>> Modification of the xyz/openbmc_project/Network/Client.interface.yaml interface to add the protocol attribute.
>> Handling for the  interface changes in the code of the dbusplus library.
>> Corresponding changes to the phosphor-rsyslog-config service.
>> Proper changes to the REST/redfish API.
>> Modification of the web interface and command line tools.
>>
>> Also, current DBUS interface to the object implies two independent messages to change network parameters, one to set the IP-address, and the other to set the port number. They are not atomic and configuring just one parameter yields in undesirable state transitions of the service to configure. It is good to send all the parameters in one "atomic" message. But, I'm understand that this may require to persist current network parameters on both sides of transmission (or, at least, to have all of them on sending side upfront).
>>
>> So, it needs to add  DBUS getters/setters for just protocol type, and all parameters at once.
>>
>> I'm interested in what other components may be affected by such improvements?
>>
>> Your comments will be appreciated.
>>
>> Regards!
>>
>> Gleb
--------------vUvqOCM1OZzjAIuaccgcQb04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Jian! <br>
    </p>
    <p>Thank You for this note. <span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">We must pay
            attention to this circumstance during test phase.</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">Regards!</span></span></span></p>
    <p><span class="HwtZe" lang="en"><span class="jCAhz ChMk0b"><span
            class="ryNqvb">Gleb<br>
          </span></span></span></p>
    <div class="moz-cite-prefix">On 19.01.2023 08:25, Zhang Jian wrote:
    </div>
    <blockquote type="cite"
cite="mid:CA+J-oUv6L0MnfN_OcbZqAudSupCxH1g-gtyfw8NOO117Wd=6-Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
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

[0]: <a class="moz-txt-link-freetext" href="https://github.com/AspeedTech-BMC/linux/commit/05c055107d56cd699bc88a3440665d95d9a634ff">https://github.com/AspeedTech-BMC/linux/commit/05c055107d56cd699bc88a3440665d95d9a634ff</a>

Cheers,
Jian


On Wed, Jan 18, 2023 at 7:46 PM Gleb Semenov <a class="moz-txt-link-rfc2396E" href="mailto:g.semenov@yadro.com">&lt;g.semenov@yadro.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hello colleagues!

I'm a new member of the Yadro OBMC team and currently working on modifications of the phosphor logging service. Our client requested us to make OBMC's rsyslog to use UDP transport for remote logging. Currently it uses just TCP and this configuration is hard-coded.

It looks like the phosphor-rsyslog-config has only one external dependency, namely the sdbusplus library, which provides appropriate DBUS interface handler to configure network parameters. Also it needs to modify DBUS interface description for network client.

The following should be performed:

Modification of the xyz/openbmc_project/Network/Client.interface.yaml interface to add the protocol attribute.
Handling for the  interface changes in the code of the dbusplus library.
Corresponding changes to the phosphor-rsyslog-config service.
Proper changes to the REST/redfish API.
Modification of the web interface and command line tools.

Also, current DBUS interface to the object implies two independent messages to change network parameters, one to set the IP-address, and the other to set the port number. They are not atomic and configuring just one parameter yields in undesirable state transitions of the service to configure. It is good to send all the parameters in one "atomic" message. But, I'm understand that this may require to persist current network parameters on both sides of transmission (or, at least, to have all of them on sending side upfront).

So, it needs to add  DBUS getters/setters for just protocol type, and all parameters at once.

I'm interested in what other components may be affected by such improvements?

Your comments will be appreciated.

Regards!

Gleb
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------vUvqOCM1OZzjAIuaccgcQb04--

