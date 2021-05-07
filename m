Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31076376895
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 18:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcG2Y13Cyz2yyS
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 02:23:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KvqOCusL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KvqOCusL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcG2D1QGPz2yY7
 for <openbmc@lists.ozlabs.org>; Sat,  8 May 2021 02:22:42 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 147G4Px2096772; Fri, 7 May 2021 12:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jO/tR3sumbBD6O9//SzRuG5pNJwTuBRXPnnf/9G8jEg=;
 b=KvqOCusLc3Epd93ZDie2jdMFx09CHuFFo7yfFwVT78pENs09EzrYCNFTXuuPEHoc2ezA
 hJutknGuLJkeeYCir6XNSkGW6uuzrDxigZohx8qsG+t+zLYX7nM+1SoIjxxU9+6NJuAB
 5o1fdiv1HvH3ofGsbSFsJvEf70xn+Y/cdnMVFQ6DkUaEZ5HtRuYiHvFhxns1sb3g45eV
 VpisR9dzH49wzeYbF0yFf4GBKD8ybv9ASeNBrAHGF3xNjJwA+b1pdnuNPGQ6N4nF3BiA
 R7FC51qGv2ql8PC0TPLuBNjA1LyL/kjAP0GfTz9wSVklKB3pxby8y94r+OFPDOUDilkb YA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38d8g7ry0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 12:22:37 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 147GMIwI027831;
 Fri, 7 May 2021 16:22:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 38csqr6ecb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 May 2021 16:22:37 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 147GMaOq24707376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 May 2021 16:22:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B8A7112061;
 Fri,  7 May 2021 16:22:36 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0142112062;
 Fri,  7 May 2021 16:22:35 +0000 (GMT)
Received: from [9.163.36.104] (unknown [9.163.36.104])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 May 2021 16:22:35 +0000 (GMT)
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
To: Thu Nguyen OS <thu@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
 <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
 <DAC41731-7B29-4743-87D8-40324324FF96@amperemail.onmicrosoft.com>
 <37873411-cdda-bcd5-0a2a-6cd46192f80d@linux.ibm.com>
 <6F0BA8AE-40E7-47EB-BA16-B445738548D2@amperemail.onmicrosoft.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <17e3409e-64bb-0c3c-cbe7-028d88df17ca@linux.ibm.com>
Date: Fri, 7 May 2021 11:22:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6F0BA8AE-40E7-47EB-BA16-B445738548D2@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CQnSgC4tQGSTtiYCJuhWCDzPcu8dUMNF
X-Proofpoint-ORIG-GUID: CQnSgC4tQGSTtiYCJuhWCDzPcu8dUMNF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-07_06:2021-05-06,
 2021-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105070109
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


On 5/6/21 5:34 PM, Thu Nguyen OS wrote:
>
> ﻿On 06/05/2021, 23:30, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>
>
>     On 5/6/21 10:59 AM, Thu Nguyen OS wrote:
>     >
>     > On 06/05/2021, 20:09, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>     >
>     >
>     >     On 5/6/21 4:22 AM, Thu Nguyen OS wrote:
>     >     > Hi,
>     >     >
>     >     > I’m supporting the fan control algorithms using phosphor-fan. Phosphor-fan monitoring and controlling require interface xyz.openbmc_project.Control.FanPwm in the fan inventory object.
>     >     That is a sensor interface, not an interface that's added to inventory objects
>     >     > https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
>     >     What you linked to here refers to where the fan inventory object is located and nothing to do with with the fan sensors that fan monitor is to be monitoring.
>     >
>     > [Thu Nguyen] The link detail about the inventory configuration in monitor.yaml for fan monitor  and fan.yaml for fan control feature. It should be " The relative path under inventory where the fan's inventory object exists ".
>
>     The README links refer to the use of JSON config files in place of YAML. YAML based configs for the fan presence and fan monitor applications has been deprecated, so please use JSON based configs instead. Fan control is in the process of getting converted to JSON based configs so that it too can have its YAML based config support deprecated. To enable the use of JSON, supply "json" to the PACKAGECONFIG and to continue using YAML based fan control, also provide "--disable-json-control" until fan control's support of JSON is completed. i.e.) https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/fans/phosphor-fan_%25.bbappend#L59-L60
>
>     > Look at the example of the fan control configuration  file named fan.yaml below you can see the yaml file includes "inventory" setting. And xyz.openbmc_project.Control.FanPwm interface is required interface for that inventory path.
>     > https://github.com/openbmc/phosphor-fan-presence/blob/master/control/example/fans.yaml
>     Now to address what you're seeing, the "inventory" entry for fans.yaml is just used to name a fan object created within fan control and not related to anything actually in dbus inventory. This will become "name" in the JSON based (fans.json) for fan control.
>     >     >
>     >     > But FanSensor daemon of dbus-sensor only adds /xyz/openbmc_project/sensors/fan_tach to inventory list, and this path don’t support xyz.openbmc_project.Control.FanPwm interface.
>     >     I cant speak to the support of dbus-sensors and the use of the FanPwm interface, but phosphor-fan-monitor can support either the use of RPM or PWM fan sensors for monitoring and updating the corresponding OperationalStatus of a fan in inventory.
>     >     https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/sensors.md
>     >
>     >     Supplying the ` "target_interface": "xyz.openbmc_project.Control.FanPwm" ` directs fan monitor to monitor the fan sensor using the Target property from that interface. When the "target_interface" is not provided on a fan sensor, the default is to use the "xyz.openbmc_project.Control.FanSpeed" (RPM) interface.
>     > [Thu Nguyen]
>     > The point here is the phosphor-fan-monitor/control expect xyz.openbmc_project.Control.FanPwm or xyz.openbmc_project.Control.FanSpeed is included in /xyz/openbmc_project/sensors/fan_tach.
>     > But dbus-sensor don't support that. In dbus sensor xyz.openbmc_project.Control.FanPwm is only available in /xyz/openbmc_project/control/fanpwm.
>     Ok, that clarifies things...and I welcome a proposed change to support the different dbus object paths in which the xyz.openbmc_project.Control.* interfaces that the fan sensors can be be at. Before dbus-sensors existed in openbmc, the fan sensors were provided by phosphor-hwmon on the dbus object path of /xyz/openbmc_project/sensors/fan_tach regardless of being PWM or RPM so that's why they are looking at that path.
>
> [Thu Nguyen]
> How about add target_path option in fan.yaml and monitor.yaml to set the dbus object path?
> Example:
> target_path: /xyz/openbmc_project/control/fanpwm.
> The setting of target_path will override value of "FAN_SENSOR_PATH" in fan.cpp and tach_sensor.hpp.
Does dbus-sensors place the sensor value of the fan on the same dbus object path as the target? Fan monitor looks for the interfaces of both the target and the sensor value(feedback) on the same dbus object path.
>
>     >     >
>     >     > Do you have any solution to make phosphor-fan work with dbus-sensor?
>     >     >
>     >     > I’m currently update FanSensor in dbus-sensor to add xyz.openbmc_project.Control.FanPwm to /xyz/openbmc_project/sensors/fan_tach.
>     >     Refer to the doc link I provided above on how to utilize monitoring fans that use a PWM target on that interface. Then phosphor-fan-monitor will update the fan inventory object's (as configured with https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md) xyz.openbmc_project.State.Decorator.OperationalStatus Functional property based on how you configure fan monitor to monitor the fan sensors.
>     >     >
>     >     > Regards.
>     >     > Thu Nguyen.
>     >
>
