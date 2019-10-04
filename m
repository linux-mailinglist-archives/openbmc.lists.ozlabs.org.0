Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF6CBD32
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 16:29:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lC1L6yWYzDqfW
	for <lists+openbmc@lfdr.de>; Sat,  5 Oct 2019 00:29:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lC0f31RLzDqZk
 for <openbmc@lists.ozlabs.org>; Sat,  5 Oct 2019 00:28:29 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x94ELuhW030116
 for <openbmc@lists.ozlabs.org>; Fri, 4 Oct 2019 10:28:21 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ve7hurvp5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 04 Oct 2019 10:28:21 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Fri, 4 Oct 2019 15:28:18 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 4 Oct 2019 15:28:16 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x94ESFua47186026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Oct 2019 14:28:15 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BF3F42042;
 Fri,  4 Oct 2019 14:28:15 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5E224203F;
 Fri,  4 Oct 2019 14:28:14 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.85.71.202])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Oct 2019 14:28:14 +0000 (GMT)
Subject: Re: libpldmresponder comments
To: Supreeth.Venkatesh@arm.com
References: <VE1PR08MB51659EF13F43D182785C0B81809E0@VE1PR08MB5165.eurprd08.prod.outlook.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Fri, 4 Oct 2019 19:58:13 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB51659EF13F43D182785C0B81809E0@VE1PR08MB5165.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19100414-0028-0000-0000-000003A608B1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100414-0029-0000-0000-0000246813B8
Message-Id: <90f319cc-904e-e7ed-92b0-2e5e34c79168@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-04_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910040133
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04/10/19 7:26 PM, Supreeth Venkatesh wrote:
> Hello Deepak/all,
> 
> Sorry for the late comments/feedback.

No problem, thanks for the feedback Supreeth!

> I was looking at porting libpldmresponder and libpldm to an Arm based 
> platform.

libpldm - sure, it is meant to be portable across OpenBMC, but 
libpldmresponder is not :)

> These are  few observations with the design, some of them were discussed 
> during OSF OpenBMC Hackathon, summarizing them here:
> 
> Assumption was that libpldmresponder can be easily ported to Host/other 
> Satellite/Service Management controller,

libpldmresponder was not meant to be ported outside OpenBMC - it's the 
OpenBMC implementation of the BMC as a PLDM responder.

> However, in the current design,
> 
>  1. libpldmresponder implements standard Commands/APIs defined by PLDM
>     specifications in C++.
>  2. libpldmresponder PDR, BIOS config structures are defined by PLDM
>     specifications, However, the library uses Json format, thus making
>     JSON parser mandatory for 
> Host/Service management controller firmware.
> 
>  3. libpldmresponder has DBUS/other OpenBMC implementation dependencies,
>     thus making portability harder. >  4. I guess the expectation when we started with the design was that
>     there will be one **single** library which will handle all pldm
>     requests/responses and 
> 
> upper layer application/Daemon will call the APIs provided by PLDM 
> library to implement use cases as they fit.

https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md makes 
the distinction between a portable libpldm (which handles the protocol 
encode/decode), and an OpenBMC specific responder implementation.

>  5. Libpldm also has dependencies on OpenBMC structures/DBUS objects,
>     making it a little harder to port.

No, libpldm has no OpenBMC dependencies. It for example is used by IBM's 
host firmware stacks today without any code changes. Can you point me to 
where you see D-Bus dependencies in libpldm? Do you just mean you find 
this hard to build outside an OpenBMC environment?

> Please let me know, how I can help fix some of these, so that it is 
> easily portable.

No change should be needed to libpldm code, it should already be 
portable like noted earlier. As far as the libpldmresponder is 
considered, like we discussed at the OSFC, one thing we could do is to 
write a responder API layer, the implementation of which is platform 
(for eg OpenBMC/ARM) specific. Would you like to propose a design update 
for this to the existing document? I think we need to understand the 
usefulness of such a layer though. I mean for example if you consider a 
PLDM command along the lines of ReadSensor, such a sensor maybe a D-Bus 
object on OpenBMC and something else on the ARM platform, those 
specifics *must* be implemented on the platform, so what would the 
portable layer consist of? Those details would be good to capture in the 
design doc.

> Thanks,
> 
> Supreeth
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are 
> confidential and may also be privileged. If you are not the intended 
> recipient, please notify the sender immediately and do not disclose the 
> contents to any other person, use it for any purpose, or store or copy 
> the information in any medium. Thank you.

