Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4BB3D2F5
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 18:49:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbZD2KWTzDqgV
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 02:49:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NbQg1zQ0zDqjc
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 02:42:50 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5BGfuXm075822
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 12:42:47 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t2eug434h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 12:42:47 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Tue, 11 Jun 2019 17:42:46 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Jun 2019 17:42:44 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5BGghlh25887118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 16:42:43 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57044C6059
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 16:42:43 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 353DBC605B
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 16:42:43 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 16:42:43 +0000 (GMT)
Subject: Re: Removing sensors on standby
To: openbmc@lists.ozlabs.org
References: <CAH2KKeYfWaaQHq2gcmBYZUedVz2hB0Bjbf8fzEN72JqBF3kpBg@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Tue, 11 Jun 2019 11:42:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAH2KKeYfWaaQHq2gcmBYZUedVz2hB0Bjbf8fzEN72JqBF3kpBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061116-0016-0000-0000-000009C164BD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011247; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216506; UDB=6.00639631; IPR=6.00997606; 
 MB=3.00027265; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-11 16:42:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061116-0017-0000-0000-0000439CE003
Message-Id: <ecf28031-c144-3356-4154-bdc9c0da7e55@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=859 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906110107
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



On 6/11/2019 5:07 AM, Thaj wrote:
> Hi,
>
> As per current implementation of OpenBMC sensor architecture sensor is 
> added/removed when hwmon driver is probed/removed.
> But there are scenarios where hwmon driver is available but values are 
> not available. For example there are some sensors (VR, ADC, pwm tach) 
> in my system which are unavailable on BMC Standby(Host powered OFF). 
> Power to these devices are removed when host is off causing hwmon 
> driver to read a value 0. Please find the attached screenshot for 
> reference.
>
> Requirement is that, Sensor should be monitored only on host powered 
> ON state.
>
> How to handle sensors in this case?
>
> Is it a good idea to add a config file entry for this purpose 
> (something like REMOVE_ON_STANDBY) ?
>
If you are referring to the phosphor-hwmon repository (as opposed to 
dbus-sensors), I would accept a patch
that does that.

There is already a case in phosphor-hwmon where an OperationalStatus 
interface, with a boolean
Functional property, can get added.  Another idea would be to set that 
to not Functional in this case,
and have the web UI check that and display something different if it 
isn't functional.

In hindsight, having another property on the Sensor.Value interface to 
give the sensor status, like
working, broken, or not-available may have been a good idea.

> Regards,
> Thaj
>
>

