Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE00375471
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 15:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbYnS4yl8z3022
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 23:09:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TohferoG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TohferoG; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbYn575lKz2yxl
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 23:08:57 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 146D2k7b097676; Thu, 6 May 2021 09:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=k/4GUtnSPq1rZIg4/aORIbuhXGiqamtSkLfAw4n0gBg=;
 b=TohferoG5GXv4fB9sVhhEfuFRa6abGVhq6ndwpGyvn8w+0BO99+LC/g+9Wzo6l2MS6p7
 uivDE79AMA4i8fPxzZzFoltsEbUheKlz381rfTtAGd9qMOiGcSvlAHYDsDhAkiTi6eUe
 V/y/Pcp1VwcNx84APM7s0X6n2sD0MBTd2QSpyRapk9qDMVmnZx68y3bj5e1ouG64U1u+
 BJfA/p3ekQ9PVdxlYky1MvlQXdBgEeTIv9tA0YjpZZ9LbEQDqV6xeAG50G+xxxNC2Eha
 ZJsCDGDPyUA4A341qE1wK328Fov0j6W5GGySeEiz4peKVEUH3wa3sETcO2uBNbcMU4JT wA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38cgqa0qw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 09:08:52 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146D8DMu002075;
 Thu, 6 May 2021 13:08:51 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 38bee0xp8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 13:08:51 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 146D8oAQ15073602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 13:08:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A54F7AC05B;
 Thu,  6 May 2021 13:08:50 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A08AC059;
 Thu,  6 May 2021 13:08:50 +0000 (GMT)
Received: from [9.65.118.171] (unknown [9.65.118.171])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 May 2021 13:08:50 +0000 (GMT)
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
To: Thu Nguyen OS <thu@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
Date: Thu, 6 May 2021 08:08:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fZK33ODgOTDFud1Otk8lcBeTGL7UbCBQ
X-Proofpoint-GUID: fZK33ODgOTDFud1Otk8lcBeTGL7UbCBQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_08:2021-05-06,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060094
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


On 5/6/21 4:22 AM, Thu Nguyen OS wrote:
> Hi,
>
> I’m supporting the fan control algorithms using phosphor-fan. Phosphor-fan monitoring and controlling require interface xyz.openbmc_project.Control.FanPwm in the fan inventory object.
That is a sensor interface, not an interface that's added to inventory objects
> https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
What you linked to here refers to where the fan inventory object is located and nothing to do with with the fan sensors that fan monitor is to be monitoring.
>
> But FanSensor daemon of dbus-sensor only adds /xyz/openbmc_project/sensors/fan_tach to inventory list, and this path don’t support xyz.openbmc_project.Control.FanPwm interface.
I cant speak to the support of dbus-sensors and the use of the FanPwm interface, but phosphor-fan-monitor can support either the use of RPM or PWM fan sensors for monitoring and updating the corresponding OperationalStatus of a fan in inventory.
https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/sensors.md

Supplying the ` "target_interface": "xyz.openbmc_project.Control.FanPwm" ` directs fan monitor to monitor the fan sensor using the Target property from that interface. When the "target_interface" is not provided on a fan sensor, the default is to use the "xyz.openbmc_project.Control.FanSpeed" (RPM) interface.
>
> Do you have any solution to make phosphor-fan work with dbus-sensor?
>
> I’m currently update FanSensor in dbus-sensor to add xyz.openbmc_project.Control.FanPwm to /xyz/openbmc_project/sensors/fan_tach.
Refer to the doc link I provided above on how to utilize monitoring fans that use a PWM target on that interface. Then phosphor-fan-monitor will update the fan inventory object's (as configured with https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md) xyz.openbmc_project.State.Decorator.OperationalStatus Functional property based on how you configure fan monitor to monitor the fan sensors.
>
> Regards.
> Thu Nguyen.
