Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5891447F2
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 00:01:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482PD65fNkzDqR5
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 10:01:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 482PCB31lWzDqQH
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 10:00:37 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LMlM91093094; Tue, 21 Jan 2020 18:00:32 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xp2jf1eks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 18:00:32 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 00LMpenJ136017;
 Tue, 21 Jan 2020 18:00:31 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xp2jf1eka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 18:00:31 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00LMvIfO001812;
 Tue, 21 Jan 2020 23:00:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 2xksn6fng8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 23:00:31 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00LN0UmI49676642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 23:00:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 366F4BE056;
 Tue, 21 Jan 2020 23:00:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6DFFBE04F;
 Tue, 21 Jan 2020 23:00:29 +0000 (GMT)
Received: from [9.10.252.41] (unknown [9.10.252.41])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 23:00:29 +0000 (GMT)
Subject: Re: No sensors displayed in webUI
To: James Feist <james.feist@linux.intel.com>,
 Max Power <max_power2005-openbmc@yahoo.com>, openbmc@lists.ozlabs.org
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
 <454935377.24643249.1579594638683@mail.yahoo.com>
 <a91d25dc-9435-63e2-8611-bee8c80c8e2d@linux.intel.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <39f5ca46-9617-c233-a6ed-30e6b978572d@linux.vnet.ibm.com>
Date: Tue, 21 Jan 2020 17:00:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a91d25dc-9435-63e2-8611-bee8c80c8e2d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_05:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210169
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


On 1/21/2020 1:02 PM, James Feist wrote:
> On 1/21/20 12:17 AM, Max Power wrote:
>>
>> Any chance to get the "bug in dbus-sensors" fixed in the near future?
>
> I have no plans on changing dbus-sensors, since this works with 
> Redfish, and Redfish is the future back-end for the WebUI. I'd be fine 
> if someone wants to add unit support for an intermediate fix. That or 
> we could finish this patch and get the WebUI moved over.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/28342
>

I support moving the WebUI to Redfish but moving the sensor page to 
Redfish, I feel hides the actual problem.
I think we should follow the phosphor-dbus-interfaces.

If we don't follow the interfaces, how when writing code, whether 
phoshor-webui code or bmcweb code, do you know what to expect?

If "Unit" is redundant information, then I feel it should be removed 
from phosphor-dbus-interfaces and stricter requirements on the sensor 
path should be added.

See https://lists.ozlabs.org/pipermail/openbmc/2020-January/020207.html

Thanks!
Gunnar
