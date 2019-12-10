Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268E1193DB
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 22:15:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XXrs52wfzDqc2
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 08:15:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XXm54S0zzDqZV
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 08:11:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBAL93lS118106; Tue, 10 Dec 2019 16:10:56 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtfbwgj2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 16:10:56 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBAL9aFg122238;
 Tue, 10 Dec 2019 16:10:56 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wtfbwgj21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 16:10:55 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBALAXBf018067;
 Tue, 10 Dec 2019 21:10:54 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 2wtdq72c19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Dec 2019 21:10:54 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBALAsQl33096038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 21:10:54 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4991FB2064;
 Tue, 10 Dec 2019 21:10:54 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13BA8B2068;
 Tue, 10 Dec 2019 21:10:54 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 10 Dec 2019 21:10:53 +0000 (GMT)
Subject: Re: [EXTERNAL] Re: BMC update via TFTP
To: Neeraj Ladkani <neladk@microsoft.com>,
 Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Venture <venture@google.com>
References: <q7_GhCRdlxUNHfFX0Y4tW7FPq5Md7qwdFWbwd39V_S5zxrSBYtoXtvlNpQdZchvPB27edbJ3-QKFyZ97kzXoeH3Bby8IIHSWhxle9jzteKA=@protonmail.com>
 <5747d991-27b7-4bb1-8a25-f46d1de832e1@linux.vnet.ibm.com>
 <f778ce0c-f395-7528-ed05-cec194707a14@linux.vnet.ibm.com>
 <9e0303e5beb34b9bb50b050cd56e35d8@linux.vnet.ibm.com>
 <ed917fd0-61e1-3ff8-05f9-863d3e451c93@linux.ibm.com>
 <20191204213650.GB9613@mauery.jf.intel.com>
 <94b297b5-81d1-1e07-498f-155a9160cb1d@linux.intel.com>
 <20191205223708.GC9613@mauery.jf.intel.com>
 <1c75671d-904e-8a06-07f5-c93fcf0e5e50@linux.intel.com>
 <d6b4685e-5834-7bfb-609e-c53159a54176@linux.ibm.com>
 <f6254181-64e8-e923-8d60-9f7632a899e5@linux.intel.com>
 <3231c302-27a9-3437-849a-767850d12fd0@linux.ibm.com>
 <DM6PR21MB1388F87CA03203F0C5F9F331C85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <b13a3d03-333b-e5b7-b6b1-28159f233a2d@linux.ibm.com>
Date: Tue, 10 Dec 2019 15:10:53 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <DM6PR21MB1388F87CA03203F0C5F9F331C85B0@DM6PR21MB1388.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_06:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912100175
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

On 12/10/19 12:58 PM, Neeraj Ladkani wrote:
> Are there any thoughts to get rid of BMC reset to trigger FW update? I understand FW reset is required after the update.

I'm not sure I understand the question.  I think the answer depends on 
the [Software.VersionPurpose][1].
For VersionPurpose=BMC or System, the BMC must be reset.
For VersionPurpose=Host, PSU, or Other, I don't know why the BMC would 
need to be reset.

Do you want to be able to update non-BMC firmware without having to 
reset the BMC?

- Joseph

[1]: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Software/Version.interface.yaml

>
> -----Original Message-----
> From: openbmc <openbmc-bounces+neladk=microsoft.com@lists.ozlabs.org> On Behalf Of Joseph Reynolds
> Sent: Monday, December 9, 2019 5:25 PM
> To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>; openbmc@lists.ozlabs.org
> Subject: [EXTERNAL] Re: BMC update via TFTP
>
> On 12/9/19 10:06 AM, Alexander Tereschenko wrote:
>> On 06-Dec-19 23:52, Joseph Reynolds wrote:
>>> I was thinking along the lines of adding [SFTP][] (or SCP) support
>>> and then migrating existing TFTP users to the new secure solution.

[...snip...]

>> Yes, that could be a solution for the problem we discuss, providing
>> both integrity and confidentiality, without any major OpenBMC
>> development necessary - but it would mean more operational burden for
>> BMC admins. The problem with SCP/SFTP in this context is that for this
>> to work in the same manner as TFTP, the BMC must be an SSH client -
>> i.e. have some sort of identity/credentials for the SCP/SFTP server
>> provisioned first. That might not be the easiest solution to setup,
>> but it's of course possible and can be automated if OpenBMC provides
>> respective config knobs.
>>
>> Existing ways we have in code-update.md either don't require
>> credentials (TFTP), so being a client is easy, or are not making a
>> "client" from BMC, it's the admin who uploads stuff (SCP/REST).
> Yes, that's what I was thinking.  (And no, I am not going to recommend setting up a SCP or SFTP server that allows anonymous access.)
>
> This highlight the need for OpenBMC to put together a guide to provisioning your BMC.    Such as guide would give us a place to talk about uploading to the BMC SSH client certificates needed to access and download the firmware images.
>
> - Joseph
>
>> regards,
>> Alexander
>>

