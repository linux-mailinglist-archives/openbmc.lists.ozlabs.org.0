Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BE90928
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 22:05:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 469DpS4ZQDzDsGf
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 06:05:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 469DYr2XxczDs09
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 05:54:53 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 72CEB6DC94;
 Fri, 16 Aug 2019 15:54:49 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Historical Sensor Information
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <96c68da9-8abf-aa64-7d88-ffa4596927ac@linux.ibm.com>
Date: Fri, 16 Aug 2019 15:54:49 -0400
Message-Id: <C28BB0B0-AFCD-41AA-BF7E-82CE85593020@fuzziesquirrel.com>
References: <FB0EDEFC-F92E-4F6E-B6BC-B0C5E7AD6E73@fb.com>
 <CAJoAoZm9QpFgRdCsxoaNuCu1YONm_CFUp1fhdFj+h5uZhuCzAw@mail.gmail.com>
 <CF903FDC-3D9E-4FB9-8A3E-34ABB5BDD6B8@fb.com>
 <OF838F4B69.A8C14781-ON00258457.005B6C1A-00258457.005B781B@notes.na.collabserv.com>
 <CAGMNF6XTn4ktTXj6zVkviS3J5OOKwSkNYUBDsrnfPrT2EH3WSQ@mail.gmail.com>
 <C1B2C3C5-B14B-4DF4-8DD9-38D70E112627@fb.com>
 <96c68da9-8abf-aa64-7d88-ffa4596927ac@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 1:02 PM, Joseph Reynolds <jrey@linux.ibm.com> wrote:

>
>
> On 8/15/19 5:50 PM, Wilfred Smith wrote:
>> Many thanks to Emily, Milton and Kun Yi for their quick responses and =
=20
>> pointers.
>>
>> Among the reasons for local historical data collection are independent=
 =20
>> auditing, disaster recovery, debugging and increasing availability =20
>> during periods of intermittent network connectivity.
>>
>> Vijay is already participating in the Telemetry workgroup, so I=E2=80=99=
ll try =20
>> to get a download from him to see what can be leveraged.
>>
>> The requirement at Facebook includes the ability to retrieve historica=
l =20
>> sensor information for a user-defined period and interval on the BMC =20
>> console (through sensor-util, and in the same format). Based on my =20
>> cursory review of collectd, its lossy multicast network protocol =20
>> wouldn=E2=80=99t allow this information to be re-synthesized with fide=
lity on the
>
> I share this concern and would prefer to have a more reliable way to ge=
t =20
> sensor data off the BMC.  This data may be valuable to help detect when=
 =20
> the BMC is being attacked.

I don=E2=80=99t think anyone intended to use the collectd network plugin =
to publish =20
the sensor data (although you could).  IIUC the intent was to use collect=
d =20
only in the capacity of collecting the sensor data into an rrd database o=
n =20
the BMC flash.  From there you can get the data out of the BMC however yo=
u =20
like.  IPMI<->rrd.  Redfish<->rrd.  ssh+cli<->rrd.  Do I have it right Ku=
n?
