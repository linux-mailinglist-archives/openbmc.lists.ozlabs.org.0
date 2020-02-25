Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 182AF16F26C
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 23:04:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RtJ031vkzDqN7
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 09:04:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RtHF0zrdzDqMy
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 09:03:35 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PLniQw139658
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 17:03:33 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yd1q8p7qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 17:03:32 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01PM3SYj030807
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 22:03:32 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2yaux6ye5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 22:03:32 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01PM3VVu49086770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Feb 2020 22:03:31 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33209AE08B;
 Tue, 25 Feb 2020 22:03:31 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EFF3AE092;
 Tue, 25 Feb 2020 22:03:31 +0000 (GMT)
Received: from [9.10.100.197] (unknown [9.10.100.197])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 25 Feb 2020 22:03:30 +0000 (GMT)
Subject: Re: Adding a resolved timestamp to phosphor-logging's event logs
To: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <6155facb-1b35-8c1f-f95e-2aaebee413c6@linux.ibm.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <587442bf-678b-6c34-f451-32d47d640b33@linux.vnet.ibm.com>
Date: Tue, 25 Feb 2020 16:03:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6155facb-1b35-8c1f-f95e-2aaebee413c6@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_08:2020-02-25,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250151
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


On 2/25/2020 12:58 PM, Matt Spinler wrote:
> To those that use phosphor-logging's openbmc event logs:
>
> I just put up a phosphor-dbus-interfaces change 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/29734
> to add a new ResolvedTimestamp property to the OpenBMC event log entry.
>
> Next I'll update phosphor-logging to set that timestamp when the Resolved
> property changes, so that users can know when an error was resolved.
>

Redfish is adding a "modified" property to the LogEntry Schema.
https://redfish.dmtf.org/schemas/v1/LogEntry.v1_5_1.json

(Redfish issue 3854 for those that have access to the repo.)

Does it make more sense to have a Last Updated Time property on the 
event log entry in D-Bus? Then this could map to the Redfish "modified" 
property easier.  This property would get updated when the event log was 
resolved, unresolved, or any other action.

Thanks,
Gunnar

