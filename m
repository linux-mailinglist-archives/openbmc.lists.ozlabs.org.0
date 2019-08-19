Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D69207B
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 11:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bpgm1nsGzDqLh
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 19:35:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=dkodihal@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bpg76fhPzDq83
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 19:34:56 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7J9XgF4132754
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 05:34:54 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ufp4uyjav-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 05:34:54 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Mon, 19 Aug 2019 10:34:52 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 19 Aug 2019 10:34:50 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7J9YnDu51249382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 09:34:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99DC04C04A
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 09:34:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 190594C044
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 09:34:49 +0000 (GMT)
Received: from deepaks-mbp.in.ibm.com (unknown [9.193.94.91])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 09:34:48 +0000 (GMT)
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Update on PLDM stack
To: openbmc@lists.ozlabs.org
Date: Mon, 19 Aug 2019 15:04:48 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081909-0008-0000-0000-0000030AA53A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081909-0009-0000-0000-00004A28C7AE
Message-Id: <9be344be-e5ab-7a47-3141-da36e0c691e8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190109
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

Since the PLDM design document[1] was discussed on this mailing list and 
Gerrit earlier this year, several features have been contributed to the 
PLDM stack on OpenBMC[2]. I wanted to share a brief report of what's 
supported currently and what still needs work. Comments are welcome!

The code is organized into the following components:

1) libpldm

This is a C library that provides APIs to encode and decode PLDM 
messages. It is implemented in a way such that it can be used by 
different firmware stacks, and not just OpenBMC firmware. For eg IBM 
systems have host firmware stacks making use of this.
DMTF groups PLDM commands into different PLDM specs[3]. Following are 
the commands for which the encode/decode APIs are implemented :

a) PLDM message control and discovery spec (most commands implemented) : 
GetTID, GetPLDMVersion, GetPLDMTypes, GetPLDMCommands

b) PLDM BIOS spec (subset of commands implemented) : GetDateTime, 
GetBIOSTable, GetBIOSAttributeCurrentValueByHandle

c) PLDM Platform Monitoring and Control spec (subset of commands 
implemented) : GetPDR, SetStateEffecterStates

d) PLDM FRU spec : There are patches to implement a couple of commands 
under review in the OpenBMC Gerrit[4].

e) PLDM firmware update spec : nothing implemented yet. I believe Ben 
Wei from Facebook was interested in this spec.

f) PLDM for SMBIOS spec : nothing implemented yet.



2) libpldmresponder

A PLDM device can either be a PLDM requester (PLDM client) or a PLDM 
responder (PLDM server). This library implements the BMC as a PLDM 
responder function. It contains handlers for incoming PLDM requests 
(from PLDM requesters).
The responder implementation is mostly platform specific, so this 
component relies on OpenBMC APIs, and is implemented in modern C++.
To handle platform specific behavior, config files (written in JSON) are 
used to feed in information specific to a platform. For eg this is how 
PLDM PDRs (system specific PLDM metadata) are implemented. Some of the 
responder handlers make D-Bus calls to other OpenBMC apps and then 
transform the D-Bus response to a PLDM response.
Handlers for the following commands are implemented :

a) PLDM message control and discovery spec : GetTID, GetPLDMVersion, 
GetPLDMTypes, GetPLDMCommands

b) PLDM BIOS spec : GetDateTime, GetBIOSTable, 
GetBIOSAttributeCurrentValueByHandle

c) PLDM Platform Monitoring and Control spec : GetPDR



3) pldmd

The pldm daemon is a responder daemon for the BMC. It links with libpldm 
and libpldmresponder, and it also handles the transport aspect - sending 
and receiving PLDM messages over MCTP[5][6].



4) BMC as a PLDM requester

The design for the BMC as a PLDM requester was recently submitted to 
Gerrit[7]. In general, an OpenBMC app can link with libpldm to be able 
to send out PLDM request messages.



5) PLDM tools

There's an initial version of a pldmtool, which can run on the BMC as a 
PLDM requester. It writes a PLDM message on the MCTP socket exposed by 
the MCTP demux daemon; pldmd listens on this socket for incoming 
messages. The pldmtool then outputs the response received from the 
pldmd. Other features, such as validation and the ability to target 
connected PLDM devices need to be added to the tool.



6) OEM extensions

The PLDM specs allow for OEM additions wherever possible, both in terms 
of OEM commands and OEM extensions to standard commands. The current 
infrastructure expects OEM code to be built with the pldm stack, and to 
be enabled by compile time flags. An example[8] that's out there today 
is an IBM OEM extension to treat files as PLDM objects, which enables 
the transfer of things like firmware images. We plan to discuss this 
particular extension with the DMTD to see if it's worth standardizing.



[1] https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
[2] https://github.com/openbmc/pldm
[3] https://www.dmtf.org/standards/pmci
[4] https://gerrit.openbmc-project.xyz/#/q/status:open+project:openbmc/pldm
[5] https://github.com/openbmc/docs/blob/master/designs/mctp.md
[6] https://github.com/openbmc/libmctp
[7] https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/24409/
[8] https://github.com/openbmc/pldm/tree/master/oem/ibm


Regards,
Deepak

