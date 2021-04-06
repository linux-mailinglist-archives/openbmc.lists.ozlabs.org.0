Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB8B3557C2
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 17:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFBHj2mSpz30BN
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 01:28:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bl8glDeV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bl8glDeV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFBHR3snQz2xZl
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 01:28:02 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 136F4ir3022695; Tue, 6 Apr 2021 11:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Fs+uSZq46+9yz3VdXCrc1RQC0iWgVziT+Nr32TTTmK0=;
 b=bl8glDeVDxTT8sJ66mN5it2ph7yrA5hE8kYYi/L2KeXfJ8WWqgqbAuoTQXdAglbhr5Nc
 9PGV4jVTXvgGgh/LRi7sHb8AIwVCMjOF8+VQKXniUbyF5mmotorN4btfvRCA7SAuUVGv
 xVwb+3S0J3+MTAXrOqYs8KPw/Geb1vdrA6JYx4u9fEg7KaALolqYfRiwJTXr+RGtQiLz
 8K0DVRq8EToqGlpSUEluNVvKRMqqIRxivSm+KnGud5nqNhj2IOcn58p+8VSZ/BsTNSVO
 4JQ0CrlKIGQOAE5C4F/TWb0B9Kv45Z3pKbVQIeZc69xN8XP1+hzCvnRD9HvHPs4ENF/r 5g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rsxa99xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 11:27:55 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 136FNQQb023901;
 Tue, 6 Apr 2021 15:27:54 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 37qbgye81x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 15:27:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 136FRsVU33358090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 15:27:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C18BAC05E;
 Tue,  6 Apr 2021 15:27:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC5C6AC05B;
 Tue,  6 Apr 2021 15:27:53 +0000 (GMT)
Received: from [9.160.119.78] (unknown [9.160.119.78])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 15:27:53 +0000 (GMT)
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
To: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
 <12cb9e34-d110-1575-0b39-296083bd6410@linux.ibm.com>
 <7843F2AF-30DE-4F78-B7C1-2BBDC99689B5@amperemail.onmicrosoft.com>
 <a988408c-64ad-35e6-eb12-2c2babf802c0@linux.ibm.com>
 <2E3157F2-E7D6-49B6-A015-A9DA00E6CD78@amperemail.onmicrosoft.com>
 <2eeceb70-2ca6-59ec-6545-35e08782fb29@linux.ibm.com>
 <3E440C07-3F1F-48BF-A40C-F8E8A38350B5@amperemail.onmicrosoft.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <1fb3e1d6-e7ed-6aef-dbfa-111e42ed5fa6@linux.ibm.com>
Date: Tue, 6 Apr 2021 10:27:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <3E440C07-3F1F-48BF-A40C-F8E8A38350B5@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u3D5OdgybW2Lc3TYFqmULxVKte2Dmwep
X-Proofpoint-GUID: u3D5OdgybW2Lc3TYFqmULxVKte2Dmwep
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_04:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060102
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



On 4/6/2021 10:23 AM, Thu Nguyen OS wrote:
> Let me think about "putting it into phosphor-hwmon".
> There are two problem with this:
> 1. Currently phosphor-hwmon start before phosphor-state-manager create CurrentHostState dbus property. So there is the short time which we can't access this property to know the host state.
> 2. We need add one or some options in sensor configuration file to difference the binded/unbinded  drivers with the normal one.

Oh, what I meant here was still having a new daemon, but just putting it 
in the same phosphor-hwmon git repository that phosphor-hwmon-readd 
lives in.


> Regards.
> Thu Nguyen.
>
> ﻿On 05/04/2021, 23:20, "Matt Spinler" <mspinler@linux.ibm.com> wrote:
>
>
>
>      On 4/5/2021 10:17 AM, Thu Nguyen OS wrote:
>      > Sure, I will prepare the code.
>      >
>      > 1. Do you suggest the name of repo? I though we can use phosphor-driver-binder.
>
>      At one point, there was going to be an official way to ask where new
>      functionality should go -
>      https://lore.kernel.org/openbmc/20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com/.
>      I can't remember seeing a way to make these requests though.  Maybe Brad
>      can chime in.
>
>      How about just put it into the the phosphor-hwmon repo?
>
>      > 2. Below is format of the configuration file which I'm using.
>      > {
>      >         "hostDrivers" :
>      >         {
>      >                "bindDelay" : 0,
>      >                "unbindDelay" : 0,
>      >                "drivers" :
>      >                [
>      >                       {
>      >                              "name" : "",
>      >                              "path" : ""
>      >                       },
>      >                       {
>      >                              "name" : "",
>      >                              "path" : ""
>      >                       }
>      >                ]
>      >         },
>      >         "powerDrivers" :
>      >         {
>      >                "bindDelay" : 0,
>      >                "unbindDelay" : 0,
>      >                "drivers" :
>      >                [
>      >                       {
>      >                              "name" : "",
>      >                              "path" : ""
>      >                       },
>      >                       {
>      >                              "name" : "",
>      >                              "path" : ""
>      >                       }
>      >                ]
>      >          }
>      > }
>      > Where:
>      > * hostDrivers: Json entry to define the drivers which bind/unbind when the host change state.
>      > * bindDelay: The delay will be applied before start binding the drivers in the list.
>      > * unbindDelay: The delay will be applied before start unbinding the drivers in the list.
>      > * drivers: Define the list of drivers in one driver type.
>      > * name: define driver name.
>      > * path: is the path of that driver which have bind and unbind binary.
>      >
>      > * powerDrivers: Json entry to define the drivers which bind/unbind when the power change state.
>      >
>      > Do you think the json format is ok?
>
>      Looks pretty good to me.
>
>      > Regards.
>      > Thu Nguyen.
>      >
>      > On 05/04/2021, 22:06, "Matt Spinler" <mspinler@linux.ibm.com> wrote:
>      >
>      >
>      >
>      >      On 4/2/2021 2:52 AM, Thu Nguyen OS wrote:
>      >      > I thought that OpenBmc community have to have the solution for this.
>      >      > I can propose my solution but I don't think it is common enough.
>      >
>      >      I haven't seen any code that does a bind/unbind on power on, so I would
>      >      welcome your solution being upstreamed.  We put similar functionality
>      >      into phosphor-gpio-presence that can bind/unbind around presence
>      >      detection where the drivers are also listed in a config file.
>      >
>      >
>      >      >
>      >      > Regards,
>      >      > Thu Nguyen.
>      >      >
>      >      > On 31/03/2021, 23:14, "Joseph Reynolds" <jrey@linux.ibm.com> wrote:
>      >      >
>      >      >      On 3/30/21 9:14 PM, Thu Nguyen OS wrote:
>      >      >      > Hi All, Currently, In Mtjade platform of Ampere, we have SMPro mdf
>      >      >      > drivers (SMPro hwmon, SMPro errmon, SMPro misc driver). The drivers
>      >      >      > will be loaded by kernel when the BMC boot up. But they are only
>      >      >      > binded when the host is already On. ‍ ‍ ‍ ‍
>      >      >      >
>      >      >      > Hi All,
>      >      >      >
>      >      >      > Currently, In Mtjade platform of Ampere, we have SMPro mdf drivers
>      >      >      > (SMPro hwmon, SMPro errmon, SMPro misc driver).
>      >      >      >
>      >      >      > The drivers will be loaded by kernel when the BMC boot up. But they
>      >      >      > are only binded when the host is already On.
>      >      >      >
>      >      >      > They are also unbinded when the host is Off.
>      >      >      >
>      >      >      > To support binding/unbinding the SMPro drivesr, we have one service
>      >      >      > name driver-binder.
>      >      >      >
>      >      >      >  1. When the Dbus property CurrentHostState of service
>      >      >      >     xyz.openbmc_project.State.Host changes to “not Off”, we will bind
>      >      >      >     the drivers.
>      >      >      >  2. When the Dbus property RequestedHostTransition of service
>      >      >      >     xyz.openbmc_project.State.Host OR Dbus property
>      >      >      >     RequestedPowerTransition of xyz.openbmc_project.State.Chassis
>      >      >      >
>      >      >      > change to Off, we will unbind the drivers.
>      >      >      >
>      >      >      > The driver-binder is working as expected, it have the configuration
>      >      >      > file to configure which drivers will be binded/unbinded.
>      >      >      >
>      >      >      > But that is our solution.
>      >      >      >
>      >      >      > Do we have any common solution to do that job?
>      >      >      >
>      >      >
>      >      >      Thu,
>      >      >
>      >      >      I don't have a solution.  But I do want to be able to bind and unbind
>      >      >      drivers for the BMC-attached USB ports (as the underlying mechanism when
>      >      >      the BMC admin disables the ports), so I think it would be good to have a
>      >      >      common solution or understand the best practices.
>      >      >
>      >      >      Joseph
>      >      >
>      >      >      > Regards.
>      >      >      >
>      >      >      > Thu Nguyen.
>      >      >      >
>      >      >
>      >      >
>      >
>      >
>
>

