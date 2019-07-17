Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD536B590
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 06:29:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pPRV67rnzDqRt
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 14:29:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pPPR6gnCzDqTp
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 14:27:23 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6H4MZgA140603
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 00:27:19 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tss7gevs3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 00:27:19 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Wed, 17 Jul 2019 05:27:17 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Jul 2019 05:27:14 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6H4RD3157606216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 04:27:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55E4C4C040;
 Wed, 17 Jul 2019 04:27:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 407BC4C046;
 Wed, 17 Jul 2019 04:27:12 +0000 (GMT)
Received: from [9.202.13.25] (unknown [9.202.13.25])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 17 Jul 2019 04:27:12 +0000 (GMT)
Subject: Re: Out-of-band NIC management
To: openbmc@lists.ozlabs.org, joel Stanley <joel@jms.id.au>,
 Ben Wei <benwei@fb.com>, Jeremy Kerr <jk@ozlabs.org>
References: <MWHPR15MB132793F6F3B5BD2777083F46A3CE0@MWHPR15MB1327.namprd15.prod.outlook.com>
 <CACPK8XdkYbPB2+g9yjennzmOCq3Spe09HZVHxQaz0oP3JCZYjQ@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Wed, 17 Jul 2019 09:57:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XdkYbPB2+g9yjennzmOCq3Spe09HZVHxQaz0oP3JCZYjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071704-0008-0000-0000-000002FE2F81
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071704-0009-0000-0000-0000226BA7BB
Message-Id: <8aa4e88f-99f0-83ca-0f2e-7e1edd55de8d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1031 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170053
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

Hi Joel,

We had ported the similiar ncsi-netlink utility to openbmc under 
phosphor-networkd.

https://github.com/openbmc/phosphor-networkd/blob/master/ncsi_util.hpp

Ben,

we can extend the same.

Regards
Ratan Gupta



On 17/07/19 8:40 AM, Joel Stanley wrote:
> On Tue, 16 Jul 2019 at 21:46, Ben Wei <benwei@fb.com> wrote:
>> Hi all,
>>
>> Would anyone be interested in collaborating on out-of-band NIC management and monitoring?
>>
>> DMTF has as a NCSI spec (https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.1.0.pdf), that defines a standard interface for BMCs to manage NICs.
>> And in kernel 5.x , NC-SI driver supports Netlink interface for communicating with userspace processes.
>>
>> I'm thinking adding the following tools to OpenBMC as a starting point and build form there:
>>
>>        1. A command line utility (e.g. ncsi-util) to send raw NC-SI commands, useful for debugging and initial NIC bring up,
>>        For example:
>>            ncsi-util -eth0 -ch 0 <raw NC-SI command>
> The NCSI kernel maintainer, Sam, has written a tool that fits this descirption:
>
>   https://github.com/sammj/ncsi-netlink
>
>>        We can further extend this command line tool to support other management interfaces, e.g sending MCTP or PLDM commands to NIC.
> I have added Jeremy to cc, who has been doing some MCTP related work recently.
>
>>        2. A daemon running on OpenBMC (e.g ncsid) monitoring NIC status,  for example:
>>            a. Query and log NIC capability and current parameter setting
>>            b. Periodically check NIC link status, re-initialize NC-SI link if NIC is unreachable, log the status
>>            c. Enable and monitor NIC Asynchronous Event Notifications (AENs)
>>                  i. such as  Link Status Change, Configuration required, Host driver status change
>>                  ii. there are OEM-specific AENs that BMC may also enable and monitor
>>                  iii. either log these events, and/or performs recovery and remediation as needed
>>            d. Additional monitoring such as
>>                  i.  temperature (not in standard NC-SI command yet),
>>                  ii. firmware version, update event, network traffic statistics
>>
>> Both the CLI tool and the monitoring daemon can either communicate to kernel driver directly via Netlink independently, or we can have the ncsi daemon acting as command serializer to kernel and other user space processes.
>> These are just some of my initial thoughts and I'd love to hear some feedback if these would be useful to OpenBMC.
>>
>> If anyone in interested in collaborate on these we can discuss more on features and design details.
>>
>> Regards,
>> -Ben

