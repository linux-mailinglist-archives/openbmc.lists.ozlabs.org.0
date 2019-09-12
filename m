Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F58B0FDF
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 15:27:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TfhV27tQzF4Pw
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 23:27:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tfd82pbMzDr2l
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 23:24:42 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id E274F5C09F;
 Thu, 12 Sep 2019 09:24:37 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: how to do large-ish IPC transfers
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
Date: Thu, 12 Sep 2019 09:24:37 -0400
Message-Id: <8B34652D-4C2B-44F2-A05B-68D7C3B24279@fuzziesquirrel.com>
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
 <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
To: Alexander Amelkin <a.amelkin@yadro.com>
X-Mailer: Apple Mail (2.3445.104.11)
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

at 6:30 AM, Alexander Amelkin <a.amelkin@yadro.com> wrote:

> 11.09.2019 21:31, Vernon Mauery wrote:
>> On 11-Sep-2019 01:49 PM, Brad Bishop wrote:
>>> Hi everyone
>>>
>>> I have an application or two that need to collect and save ~ 16KiB of
>>> debugging data.  The applications have various triggers but they are =
very
>>> infrequent when deployed (on the order of months/years).  In the lab =
it
>>> would happen much more frequently.  It isn=E2=80=99t really debugging=
 information
>>> for the developer of the application but rather for customer service
>>> personnel debugging broken components on a deployed server, after the=
 =20
>>> event
>>> (and state) that caused the data to be collected.
>>>
>>> The applications generating this data will not be the same applicatio=
ns =20
>>> that
>>> publish it (the webserver), so there is a need to transfer it using I=
PC.
>>>
>>> 16KiB seemed a little big for a DBus interface, and we=E2=80=99d have=
 to ascii
>>> encode all that into a string.  Some other ideas were:
>>>
>>> 1 - passing a file descriptor over dbus
>> This would probably be the best, given our architecture. It would allo=
w,
>> at some point in the future, to have the sender have different
>> permissions on the file and allow access to a less-privileged process.
>
> What is a 'file descriptor' you're referring to here? The Linux file =20
> descriptor
> (the integer you get from open()) is process-specific and doesn't keep =
its
> meaning in another process' context.

On Linux you can pass file descriptors (the ones returned by open) over =20
unix sockets.  The implementation of the =E2=80=98h=E2=80=99 DBus type re=
lies on that.
