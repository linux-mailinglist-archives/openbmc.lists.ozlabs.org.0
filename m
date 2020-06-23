Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 230272052F0
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 14:58:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rmYB4FWKzDqPf
	for <lists+openbmc@lfdr.de>; Tue, 23 Jun 2020 22:58:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rmX34Pf9zDqKN
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 22:57:22 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NCXmEr110221
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 08:57:19 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uhbtsrpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 08:57:19 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05NCtYKP007997
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 12:57:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 31sa382214-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 12:57:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05NCvFh463242518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 12:57:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7594E11C050
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 12:57:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10E1F11C058
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 12:57:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.224])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2020 12:57:14 +0000 (GMT)
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: openbmc@lists.ozlabs.org
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <6b23a265-c1dd-4c62-4c31-de4cb1cb74e7@yadro.com>
 <f68a5e8a-2f30-fe64-f285-d06cde6bfb41@linux.vnet.ibm.com>
 <CAGm54UEx-HfVEJJv8w6UUYsmZmB9E6EG9RYbC-M=yMJW4qD30g@mail.gmail.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <838c11c2-63d4-39d5-9856-2767fa063955@linux.vnet.ibm.com>
Date: Tue, 23 Jun 2020 18:27:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAGm54UEx-HfVEJJv8w6UUYsmZmB9E6EG9RYbC-M=yMJW4qD30g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-23_06:2020-06-23,
 2020-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=918
 priorityscore=1501 mlxscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 cotscore=-2147483648 suspectscore=1 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006230097
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


On 6/23/20 4:26 PM, 郁雷 wrote:
> On Tue, Jun 23, 2020 at 5:11 PM Ratan Gupta <ratagupt@linux.vnet.ibm.com> wrote:
>> Hi Alexender,
>>
>> I am not sure how it can be achieved through some compile time option(as
>> the existing dbus interface requires changes. Might be version Dbus
>> Interfaces which is currently not supported.
>>
>> Phosphor-networkd uses systemd-networkd as backend which supports
>> multiple default gateway as fall back gateway without implementing
>> policy based routing(Both gateways are on the main routing table).
> What if we do NOT set DefaultGateway (in SystemConfiguration
> interface), and set Gateway in each IP interface?

Yes that is the plan, Default gateway property will be moved from

SystemConfiguration interface to EthernetInterface. Gateway on IP

interface is of no use today as we are not using it at all in the 
phosphor-networkd

we would be removing the gateway property from the IP address interface.

> Will it work as interface-specific gateway per interface?
>
