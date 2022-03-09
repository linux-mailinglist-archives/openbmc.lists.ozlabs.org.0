Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643574D5427
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 23:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF38q2TQsz30J7
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 09:07:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sysmate.com (client-ip=58.224.160.96; helo=sysmate.com;
 envelope-from=pooky@sysmate.com; receiver=<UNKNOWN>)
Received: from sysmate.com (mail.sysmate.com [58.224.160.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDSmk0HYvz2xMQ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 10:18:29 +1100 (AEDT)
From: <pooky@sysmate.com>
To: "'Patrick Williams'" <patrick@stwcx.xyz>
References: <000001d831cf$88c2f8e0$9a48eaa0$@sysmate.com>
 <YieTeLalmiLBiRnB@heinlein>
In-Reply-To: <YieTeLalmiLBiRnB@heinlein>
Subject: RE: [Help] I want to know how to make an image for w25q256JV flash
 memory.
Date: Thu, 10 Mar 2022 08:18:20 +0900
Organization: SYSMATE
Message-ID: <000c01d8340b$f7836e20$e68a4a60$@sysmate.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIP7IYXwugatMURS1KXfJvNuykWNAHy5RCJrDimNlA=
Content-Language: ko
X-Mailman-Approved-At: Fri, 11 Mar 2022 09:06:58 +1100
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
Reply-To: pooky@sysmate.com
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Patrick,

Thank you very much for your quick response.

Houn-Joung Rim


-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz> 
Sent: Wednesday, March 9, 2022 2:34 AM
To: pooky@sysmate.com
Cc: openbmc@lists.ozlabs.org
Subject: Re: [Help] I want to know how to make an image for w25q256JV flash
memory.

On Mon, Mar 07, 2022 at 12:00:42PM +0900, pooky@sysmate.com wrote:
 
> I am developing a motherboard using AST2500 chip using openbmc. 
> It is booting with w25q256JV flash memory attached to the AST2500 chip.
> I want to know how to make an image for w25q256JV flash memory.

That chip is relatively small for our codebase (32MB).  We still have some
machines running that size but we typically have to reduce the features in
order to make it fit.

Building an image doesn't really concern itself with the particular model of
chip but the size.  The more important thing for your system is all the
configuration information you need to provide about your motherboard so that
the software knows how to operate the hardware.

In our repository you'll see a lot of 'meta-*' subdirectories.  Most of
these are the Yocto layers for machines designed by various companies.
These are the configuration data on those machines.  You may want to take
one that looks similar in design and start with that.

Specifically on your question regarding this chip, the only thing we really
need configured is the FLASH_SIZE variable.  This will build the 32MB image
that can fit into your chip.  Nothing else should care about the specific
model because u-boot and Linux should use the JEDEC model information to
determine the size of that chip when they access it.  Here are a number of
machines configured with a 32MB flash layout:

```
$ git grep 'FLASH_SIZE = "32768"'
meta-amd/meta-ethanolx/conf/machine/ethanolx.conf:FLASH_SIZE = "32768"
meta-asrock/meta-e3c246d4i/conf/machine/e3c246d4i.conf:FLASH_SIZE = "32768"
meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf:FLASH_SIZE =
"32768"
meta-facebook/meta-yosemitev2/conf/machine/yosemitev2.conf:FLASH_SIZE =
"32768"
meta-ibm/meta-palmetto/conf/machine/palmetto.conf:FLASH_SIZE = "32768"
meta-inspur/meta-on5263m5/conf/machine/on5263m5.conf:FLASH_SIZE = "32768"
meta-intel-openbmc/meta-s2600wf/conf/machine/s2600wf.conf:FLASH_SIZE =
"32768"
meta-nuvoton/conf/machine/evb-npcm750.conf:FLASH_SIZE = "32768"
meta-quanta/meta-gsj/conf/machine/gsj.conf:FLASH_SIZE = "32768"
meta-quanta/meta-olympus-nuvoton/conf/machine/olympus-nuvoton.conf:FLASH_SIZ
E = "32768"
meta-quanta/meta-q71l/conf/machine/quanta-q71l.conf:FLASH_SIZE = "32768"
meta-supermicro/meta-x11spi/conf/machine/x11spi.conf:FLASH_SIZE = "32768"
meta-tyan/meta-s7106/conf/machine/s7106.conf:FLASH_SIZE = "32768"
meta-tyan/meta-s8036/conf/machine/s8036.conf:FLASH_SIZE = "32768"
```

--
Patrick Williams

