Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E323C050
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 21:55:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLlqL6XxnzDqXZ
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 05:55:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLlpL2mjbzDqRs
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 05:54:48 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 074JX1ax192397
 for <openbmc@lists.ozlabs.org>; Tue, 4 Aug 2020 15:54:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qcf1jr8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Aug 2020 15:54:44 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 074JX0Dh192333
 for <openbmc@lists.ozlabs.org>; Tue, 4 Aug 2020 15:54:44 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qcf1jr8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 15:54:44 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 074JsdIU031461;
 Tue, 4 Aug 2020 19:54:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 32n0191n9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Aug 2020 19:54:43 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 074JsgiX49938806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Aug 2020 19:54:42 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B00F4112065;
 Tue,  4 Aug 2020 19:54:42 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A6C9112062;
 Tue,  4 Aug 2020 19:54:42 +0000 (GMT)
Received: from [9.85.173.101] (unknown [9.85.173.101])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Aug 2020 19:54:42 +0000 (GMT)
Subject: Re: How to put sensors into the ObjectMapper
To: Mike Jones <proclivis@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <34F75302-6F54-4EE1-849F-F5B1D7118259@gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <8d5f2838-4fe2-d8ec-1874-03ac90c4cc7f@linux.ibm.com>
Date: Tue, 4 Aug 2020 14:54:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <34F75302-6F54-4EE1-849F-F5B1D7118259@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-04_04:2020-08-03,
 2020-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008040137
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 8/3/2020 1:03 PM, Mike Jones wrote:
> My RaspPi work has progressed but I don’t know how to get sensors in 
> the ObjectMapper, which I hope will mean sensors end up in webui.
>
> BASIC INFORMATION
> ------------------------------
>
> At this point, I have my PMbus devices in the device tree like this path:
>
> /sys/firmware/devicetree/base/soc/i2c@7e804000/ltc2974@32/regulators/vout0 
> to vout3
>
> And the config files like this path:
>
> /etc/default/obmc/hwmon/soc/i2c#7e804000/ltc2974@32/reg1@32.conf 
> <mailto:32/reg1@32.conf>
>
> The sensors show up here:
>
> /sys/bus/i2c/devices/1-0032/hwmon/hwmon2
>
> Indicating that the device tree is causing hwmon to offer its 
> telemetry nodes.
>
> From my reading of the docs, it seems like the ObjectMapper keeps an 
> inventory of sensors.
>
> So to search, I did something like:
>
> dbus-send —system -print-reply \
> —dest=xyz.openbmc_project.ObjectMapper \
> /xyz/openbmc_project/object_mapper \
> xyz.openbmc_project.ObjectMapper.GetAncestors \
> string:”/xyz/openbmc_project/inventory.system” array:string: | grep 
> ltc2974
>
> But none of my devices are there.
>
> I looked at meta-ibm and meta-hxt and could not see how to get the 
> devices into the ObjectMapper.
>
> ACTUAL QUESTIONS
> ------------------------------
>
> So I have these questions:
>
> - What it the mechanism for getting these into the ObjectMapper?

Hi,
The mapper just adds some convenience functions to be able to find 
things on D-Bus, so if the mapper
can't find it, then it isn't on D-Bus.

https://github.com/openbmc/docs/blob/master/architecture/sensor-architecture.md 
talks about how
phosphor-hwmon-readd will put sensor values on D-Bus.  What I don't 
think it mentions is that it
uses a udev rule to start its service when udev sees the hwmon subsystem 
hotplug.

> - Once there, will they show up in webui without any other files and 
> recipes?

Yea, they will show up as /xyz/openbmc_project/sensors/<type>/<name> and 
bmcweb can find that.

> - What docs might describe what I need to know to connect the hwmon 
> devices to the ObjectMapper?

That sensors doc I mentioned above has the goal of describing that.

> - Is there something I have to do to start the ObjectMapper service? I 
> don’t see it with a grep through systemctl.

The service file for that is 
/lib/systemd/system/xyz.openbmc_project.ObjectMapper.service. Hopefully
that is present on your system.

> - Is there an existing meta layer that would be a good example and a 
> pointer to the proper bb files to look at?

The meta-ibm layer makes extensive use of phosphor-hwmon:
meta-ibm/recipes-phoshpor/sensors/phosphor-hwmon_%.bbappend

>
> THE CODE/LAYERS
> ----------------------------
>
> My work so far is here:
>
> https://github.com/Proclivis/meta-pmbus
>
> Configured by:
>
> https://github.com/Proclivis/conf-meta-rasberrypi-evb
>
> Thanks, and sorry I am a newbie without tribal knowledge. I am trying 
> to find solutions on my own and only ask for help when stuck. 
> Unfortunately, I’m stuck.
>
> Mike

