Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E52DB98C
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 04:13:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwgF34FqwzDqLt
	for <lists+openbmc@lfdr.de>; Wed, 16 Dec 2020 14:13:27 +1100 (AEDT)
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
 header.s=pp1 header.b=KwLa0LWV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwgDK6BHHzDqK3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2020 14:12:49 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG345D3124100; Tue, 15 Dec 2020 22:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L24AFwumsnQf10xMeVxT2AIAv2znYmiWbXneuBr7N3E=;
 b=KwLa0LWVGUnot8hdSWJT99Dz43TAuXiI02hS16SPhWHExDXvPolIzNUH144TPSeT99Be
 rgfwsBLzzzpgDgsNffYoeg/FFGDz7jaNcydBXLHQIYS5qUNLoABF3Mc5ZxQZKupHtY5F
 CxMqVMwpM3sVRWs49arcpVijt7ehy0uH1r+viOwdG3fatvaFHKkyVT9JMhCuf6wB2XsX
 JYZlZ7Gie2mQtvnB/4gCsvXP/nbedwvKK1+6VuYUh7sV/+p23jdQeaGVUtj0QvRIVq7t
 /n+WlWaORZd9P9Eht3utoCnCuxvw2EJsq3xM8YV6kxqFArR70WBc6vbFQ+GoQ/slS/ej TA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35f9ans7rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 22:12:45 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG38Sim032110;
 Wed, 16 Dec 2020 03:12:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 35cng9bs08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 03:12:43 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG3CgKR30867798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 03:12:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EEC86A047;
 Wed, 16 Dec 2020 03:12:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48C7B6A054;
 Wed, 16 Dec 2020 03:12:42 +0000 (GMT)
Received: from [9.163.44.51] (unknown [9.163.44.51])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 03:12:42 +0000 (GMT)
Subject: Re: Phosphor-fan-present only update fan Functional for
 xyz.openbmc_project.Inventory.Manager
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>, openbmc@lists.ozlabs.org
References: <5299ced6-5d6a-843c-4112-3d9fa34f3ae7@amperemail.onmicrosoft.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <d7f1a690-bf35-dcb1-2bdb-33caba87bf66@linux.ibm.com>
Date: Tue, 15 Dec 2020 21:12:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5299ced6-5d6a-843c-4112-3d9fa34f3ae7@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_13:2020-12-15,
 2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160013
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


On 12/15/20 9:01 PM, Thu Nguyen wrote:
> Hi,
>
> I would like to ask about current behavior of phosphor-fan-present.
>
> When I unplug one fan, phosphor-fan-monitor will only update the 
> Functional Dbus properties of 
> /system/chassis/motherboard/FAN3_1/FAN3_1 and 
> /system/chassis/motherboard/FAN3_1 of inventory interface to false.
>
> But not for "/xyz/openbmc_project/sensors/fan_tach/FAN3_1" of hwmon 
> interface.
>
> Below is test log:
>
> ~# busctl get-property xyz.openbmc_project.Inventory.Manager 
> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b false
> ~# busctl get-property xyz.openbmc_project.Inventory.Manager 
> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b false
> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> b true
>
> Is this the expected behavior?
>
Yes. The phosphor-fan-monitor application is configured to only update 
the functional status of the fan (and/or individual fan rotors) within 
inventory. This is separate than the functional state of the device 
providing the tach sensors themselves since, for example, the sensor can 
be correctly reporting 0 RPMs for a feedback speed, however that should 
be shown as a nonfunctional fan needing to be replaced and not the 
device providing the tach sensors of the fan.

> Regards.
>
> Thu Nguyen.
>
Matt
