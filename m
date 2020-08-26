Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB022533D2
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 17:38:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc94b3HtlzDqGp
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 01:38:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l2Ydkg0R; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc9355yVYzDq72
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 01:37:21 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07QFWe0I142964; Wed, 26 Aug 2020 11:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6IrvWBtRoGofl6RQ5he5JcaxPJEDbsnBrn4+9ThNObI=;
 b=l2Ydkg0RP/eiBE2DnQwGuFkhsMGqa7KMijXjUpF2HlhESyBiLX3UbWb8S0H2tPuSzI+x
 jYFqbSjq/8B248m7yDvFWXYfbiwSMeCTn5ezZH6FGUeZysvP/wyPqtixh7H4xJLup6Zd
 UKKUnyPBlPaWE6uo40HZWh9uK0Wjma5nA7yV5eD6vlCMLMENHYmpBuJtr0Lh/D+7I4+8
 lRJaSa+dhQpIsgYWyW4u4XK909LAZHzeTQwHYP9G3IFvvQ5g89N7zVq/y+USNQ//9Xwg
 dq9R1aTo52ZbNp1hlxxZwH8oulZqFlD6FrJJCTfbNhlmYgjL0+6TCIwmyNfKKI2CwjNf BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 335sbetq5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 11:37:17 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07QFXLcr145699;
 Wed, 26 Aug 2020 11:37:17 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 335sbetq5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 11:37:17 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07QFX6WI020928;
 Wed, 26 Aug 2020 15:37:16 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 332uttkm7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 15:37:16 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07QFbCas65405404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Aug 2020 15:37:12 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2781136051;
 Wed, 26 Aug 2020 15:37:15 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 427DF13604F;
 Wed, 26 Aug 2020 15:37:15 +0000 (GMT)
Received: from [9.80.221.161] (unknown [9.80.221.161])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 26 Aug 2020 15:37:15 +0000 (GMT)
Subject: Re: systemd clarification
To: Mike Jones <proclivis@gmail.com>, Bruno Cornec <Bruno.Cornec@hpe.com>
References: <20200826091619.GG2172@morley.fr.hpecorp.net>
 <61CFB1DD-83E4-4664-A807-43A8F00F91CB@gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <a9e18e05-4dde-61cd-a25c-c4072bfc676f@linux.ibm.com>
Date: Wed, 26 Aug 2020 10:37:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <61CFB1DD-83E4-4664-A807-43A8F00F91CB@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_09:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260114
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Not sure you will find it useful, but have a regular control app, 
phosphor-regulators, that uses /dev/i2c along with
JSON configuration files to do arbitrary regulator control and 
configuration.  It also does its own sensor monitoring as
the devices can't use hwmon since it already uses /dev/i2c.  It has 
D-Bus interfaces into it to kick things off.

https://github.com/openbmc/phosphor-power/tree/master/phosphor-regulators

Ideally this would all have been done using device drivers, but we were 
resource constrained and also have to deal
with our hardware teams wanting to be able to do last minute 
configuration changes to all sorts of models of
regulators we use.

Also, while this is geared toward regulators, it would work for any 
PMBus/I2C based devices.

On 8/26/2020 8:45 AM, Mike Jones wrote:
> Bruno,
>
> I found an example meta layer that modifies a service and uses gpio to power on/off.
>
> My bigger problem is linux. From studying the regulator driver, the intent is when controlling power to hardware that is auxiliary to the device running the kernel, like ethernet or a RF power amplifier, the driver for that unit makes client driver calls to regulator.
>
> For obmc, reg control for the host is similar. Current designs use gpio. This is limiting for non cpu based designs with complex sequencing, and does not allow for PMBus devices with margin capability in cases where the bmc is part of system testing/diagnostics.
>
> What is missing is dbus access to the PMBus OPERATION command.
>
> You can’t use /dev/i2c because hwmon locks it, amd hwmon is used for sensor monitoring.
>
> I think the solution is to configure the regulator in the devicetree such that suspend and other state like changes don’t enable/disable, the add a regulatorctl driver that dbus can use for control.
>
> Then we have to chose a user mode interface like ioctl, debugfs, or sysfs. I’m thinking sysfs, so that it is easy to script and we don’t need a compiled user mode application.
>
>  From the point of view of cpu based systems, nobody may care. But I am looking beyond that. I see so many custom bmc designs that could use obmc with some extra infrastructure. My interest is the power control, because that my area of specialty and applications, both for work, and as a PMBus standards committee member.
>
> Anybody have thoughts on how to structure a regulatorctl client driver user mode interface?
>
> Mike
>
> Sent from my iPad
>
>> On Aug 26, 2020, at 3:16 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wrote:
>>
>> ﻿Sorry Mike, I can't really comment on the OpenBMC side, as I'm more a reader here than a contriutor myself. Someone else more accustomed to that will surely give you an answer.
>>
>> Best regards,
>> Bruno.
>>
>> Mike Jones said on Tue, Aug 25, 2020 at 12:03:23PM -0600:
>>
>>> Bruno,
>>>
>>> A related question.
>>>
>>> When I look through the services and targets installed when including meta-phosphor, power on/off seems to lead to dead ends, meaning no exe to do the work.
>>>
>>> So I looked at meta-facebook, and it adds host-poweron.service, which calls exec power-util…
>>>
>>> So it seems to me that meta-phosphor only puts in the infrastructure, and a particular use/design requires adding services to do the actual work of power on/off. This seems logical wrt factoring out behaviors. Is this correct?
>>>
>>> This would mean in my cause of use meta-raspberrypi, I need to add the missing pieces if I want power control of my externally connected regulators to get powered on/off.
>>>
>>> Mike
>>>
>>>>> On Aug 25, 2020, at 10:52 AM, Bruno Cornec <Bruno.Cornec@hpe.com> wrote:
>>>> Hello,
>>>>
>>>> /etc/systemd is used to override or add locally units which are not delivered as part of the std systemd delivery which is under /lib/systemd (or /usr/lib/systemd depending on Linux distribuions). It's an easy way to modify a std unit file and change say the options used to start the daemon e.g.
>>>> So:
>>>>
>>>> Mike Jones said on Tue, Aug 25, 2020 at 10:20:54AM -0600:
>>>>> The lib path is not a search path in the systemd documentation, and the etc path has links into the lib path. So I assume services in the lib path are only run if they are linked into the etc path. Is this correct?
>>>> No. they are run if they are enabled (systemctl list-units to see that)
>>>>
>>>>> If there is a an After= that lists something found only in the lib path, I assume it will run because After is not strong enough to prevent start. But if it was Requires=, then I assume it cannot start unless it is linked into the etc path so that it is available. Is this correct?
>>>> No. No link is necessary.
>>>> Best regards,
>>>> Bruno.
>>>> --
>>>> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/opensource
>>>> Open Source Profession, WW Linux Community Lead    http://github.com/bcornec
>>>> FLOSS projects:     http://mondorescue.org         http://project-builder.org
>>>> Musique ancienne?   http://www.musique-ancienne.org   http://www.medieval.org
>> -- 
>> HPE WW FLOSS Technology Strategist      http://www.hpe.com/engage/opensource
>> Open Source Profession, WW Linux Community Lead    http://github.com/bcornec
>> FLOSS projects:     http://mondorescue.org        http://project-builder.org
>> Musique ancienne?   http://www.musique-ancienne.org  http://www.medieval.org

