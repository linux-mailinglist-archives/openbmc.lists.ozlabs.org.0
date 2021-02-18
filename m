Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB4531E66C
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 07:49:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh50f1vznz30MG
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 17:49:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 965 seconds by postgrey-1.36 at boromir;
 Thu, 18 Feb 2021 17:49:12 AEDT
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh50S5Gy5z30Kb
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 17:49:10 +1100 (AEDT)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 11I6PxXI092348
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 14:25:59 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 11I6Pd8b092330;
 Thu, 18 Feb 2021 14:25:39 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Feb
 2021 14:32:47 +0800
Date: Thu, 18 Feb 2021 06:24:06 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
Message-ID: <20210218062406.GA31664@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
 <20210128072947.GB2594588@aspeedtech.com>
 <ce482992-48a2-4744-a466-60628a52ce50@www.fastmail.com>
 <20210201073724.GA2623538@aspeedtech.com>
 <20210209090655.GA1147175@aspeedtech.com>
 <838ffed7-37e3-4d73-a8f9-944439df9317@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <838ffed7-37e3-4d73-a8f9-944439df9317@www.fastmail.com>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 11I6Pd8b092330
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

Hi Andrew,

The 02/15/2021 07:26, Andrew Jeffery wrote:
> 
> 
> On Tue, 9 Feb 2021, at 19:36, Troy Lee wrote:
> > Hi Team,
> > 
> > While I'm evaluating the performance for the design, I notice that the
> > maximum IPMI through/put over KCS / IPMB / LAN is about 120 command per
> > second. Does anyone know where the bottleneck is?
> 
> So a few thoughts:
> 
> There are a some hints on performance profiling in the wiki:
> 
> https://github.com/openbmc/openbmc/wiki/Performance-Profiling-in-OpenBMC
> 
> However, I'd start by inspecting the message timings on D-Bus. You can capture
> the D-Bus traffic on the BMC with:
> 
> ```shell
> # busctl capture > /tmp/dbus.pcap
> ```
> 
> After that, run your image transfer test. Once the transfer completes, stop the
> capture and copy the pcap file off the BMC.
> 
> One approach to analysing the capture is to use Wireshark[1]. However, I've
> found that for this kind of exploratory stuff, scripting the filtering and
> output can give useful results. On that front I've written dbus-pcap:
> 
> https://github.com/openbmc/openbmc-tools/tree/master/dbus-pcap
The tool is very useful, I used to use dbus-monitor and inspect message
traffic by eyes only.

> 
> which can spit out the messages in JSON format if necessary and it takes
> standard D-Bus match rules for filtering as optional positional arguments:
> 
> https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-routing-match-rules
> 
> If the overhead is not dominated by the IPC on its own, it's probably time to
> start inspecting specific processes with `perf`. The wiki talks a little more
> about that.
> 
> Hope that helps.
> 
> Andrew
> 
> [1] https://www.wireshark.org/

It roughly takes 8ms to process a blobWrite command. I'll see if any thing 
I can help to improve or it is a limitation.

```
# OBMC OEM BlobTransfer blobWrite
1613620034.097539:
CookedMessage(header=CookedHeader(fixed=FixedHeader(endian=108, type=1, flags=0, version=1, length=32, cookie=107), fields=[Field(type=<MessageFieldType.PATH: 1>, data='/xyz/openbmc_project/Ipmi'), Field(type=<MessageFieldType.MEMBER: 3>, data='execute'), Field(type=<MessageFieldType.INTERFACE: 2>, data='xyz.openbmc_project.Ipmi.Server'), Field(type=<MessageFieldType.DESTINATION: 6>, data='xyz.openbmc_project.Ipmi.Host'), Field(type=<MessageFieldType.SIGNATURE: 8>, data='yyyaya{sv}'), Field(type=<MessageFieldType.SENDER: 7>, data=':1.75')]), body=[46, 0, 128, [207, 194, 0, 4, 211, 39, 84, 226, 0, 0, 64, 0, 0, 0, 16, 0], []])

# Cascaded Checking User Priviledge, not sure where it introduced, but
# it shows on every command even with in-band channel
1613620034.097977:
CookedMessage(header=CookedHeader(fixed=FixedHeader(endian=108, type=1, flags=0, version=1, length=10, cookie=224), fields=[Field(type=<MessageFieldType.PATH: 1>, data='/org/freedesktop/DBus'), Field(type=<MessageFieldType.MEMBER: 3>, data='GetConnectionUnixUser'), Field(type=<MessageFieldType.INTERFACE: 2>, data='org.freedesktop.DBus'), Field(type=<MessageFieldType.DESTINATION: 6>, data='org.freedesktop.DBus'), Field(type=<MessageFieldType.SIGNATURE: 8>, data='s'), Field(type=<MessageFieldType.SENDER: 7>, data=':1.72')]), body=[':1.75'])

# Method returns for checking user priviledge
1613620034.098058:
CookedMessage(header=CookedHeader(fixed=FixedHeader(endian=108, type=2, flags=1, version=1, length=4, cookie=4294967295), fields=[Field(type=<MessageFieldType.REPLY_SERIAL: 5>, data=224), Field(type=<MessageFieldType.SENDER: 7>, data='org.freedesktop.DBus'), Field(type=<MessageFieldType.DESTINATION: 6>, data=':1.72'), Field(type=<MessageFieldType.SIGNATURE: 8>, data='u')]), body=[0])

# Method returns for OBMC OEM BlobTransfer blobWrite
1613620034.106147:
CookedMessage(header=CookedHeader(fixed=FixedHeader(endian=108, type=2, flags=1, version=1, length=11, cookie=225), fields=[Field(type=<MessageFieldType.REPLY_SERIAL: 5>, data=107), Field(type=<MessageFieldType.DESTINATION: 6>, data=':1.75'), Field(type=<MessageFieldType.SIGNATURE: 8>, data='(yyyyay)'), Field(type=<MessageFieldType.SENDER: 7>, data=':1.72')]), body=[[47, 0, 128, 0, [207, 194, 0]]])
```

Thanks,
Troy Lee

