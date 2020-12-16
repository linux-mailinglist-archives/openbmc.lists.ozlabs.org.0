Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A07152DC8A9
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 23:04:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cx8L93SPrzDqQb
	for <lists+openbmc@lfdr.de>; Thu, 17 Dec 2020 09:04:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MnlbBK3H; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cx8KS1kbXzDqN5
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2020 09:03:55 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BGM1uap075711; Wed, 16 Dec 2020 17:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wNQ4w0RrY+eOv9ibyrRsNZ6wPNDULK9loAe2yT8Z5nk=;
 b=MnlbBK3HgsqBbfjAZWfaynq5WWFYPtimLFdLQ3/SSDlXDpVqky+0jldwrYYFKjTZA5oZ
 a2WeT6Hv9jLjIwULs7E1cKs6yvi/hNp8NTIWJDzSITgcr54vydDjzOgwa8ca6XuKx+Am
 VBexPaGGhrghFOK/aZiIHeAj105YX6dPso8jC+U4PmCAt/eCYYwLMAyilPKrrukxNifY
 Aw3RbAM0AdoRgr2PhPy9Cj7+8+IqxR6SHAGPFyk0+xj3tLiP8bbdP4QrEga4mPdf3paJ
 qb+obmqrt5drkZL3MdaVGj+HUnfzWkZisiD1fcg88mcBxxld1IIIXhQiKU2GIHIAUcZs JQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fshhsk7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 17:03:51 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BGLw7ig029034;
 Wed, 16 Dec 2020 22:03:50 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 35cng9avnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 22:03:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BGM3nru18022714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 22:03:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3395E6A06F;
 Wed, 16 Dec 2020 22:03:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDFC66A077;
 Wed, 16 Dec 2020 22:03:26 +0000 (GMT)
Received: from [9.163.44.51] (unknown [9.163.44.51])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 22:03:24 +0000 (GMT)
Subject: Re: phosphor-hwmon + phosphor-fan: Fan functional properties are
 mismatched when unplug fan
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>, openbmc@lists.ozlabs.org
References: <117d107d-236d-d361-7188-42065baaa656@amperemail.onmicrosoft.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <c610636d-bf38-4077-edbf-5e0ad727a3ab@linux.ibm.com>
Date: Wed, 16 Dec 2020 16:03:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <117d107d-236d-d361-7188-42065baaa656@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_09:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160134
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


On 12/16/20 2:03 AM, Thu Nguyen wrote:
> Hi,
>
>
> In the current code of phosphor-hwmon, when flag 
> --enable-update-functional-on-fail is set. The fan functional DBus 
> property in sensors interface will be set to false when unplug fans 
> (FAN4_2).
>
> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b false
>
> AND the fan Value properties will keep the latest reading value before 
> unplug.
>
> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
> xyz.openbmc_project.Sensor.Value Value
>
> d 4794
>
> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
> xyz.openbmc_project.Sensor.Value Value
> d 4794
>
> This cause phosphor-fan-monitor failed to detect the fan failure so 
> the fan functional are wrong.
>
> busctl get-property xyz.openbmc_project.Inventory.Manager 
> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b true
>
> Should phosphor-hwmon keep updating the fan value Dbus properties with 
> error code when the fans is nonfunctional? Or phosphor-fan-monitor 
> should also check the fan functional in sensor interface to update fan 
> functional in inventory interface?
>
I recall this was something that would be needed in phosphor-fan-monitor 
when a fan's sensor is marked faulted since the value should no longer 
be trusted by phosphor-fan-monitor. A phosphor-fan-monitor configuration 
option needs to be added per fan sensor to check the sensor's functional 
property and use that to update the fan's functional state in inventory 
as well.

Please feel free to submit a patch to add this configuration option to 
drive setting the fan's functional state in inventory based on the state 
of a fan sensor's functional state.


Matt

>
> Regards.
>
> Thu Nguyen.
>
>
>
