Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B54F2D7A9A
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 17:14:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cswp82Bp2zDqs2
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 03:14:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y5g/yi7O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cswmy1mGfzDqnr
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 03:12:58 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BBG3NV5133231; Fri, 11 Dec 2020 11:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SfX2x7iCE9MAh34c8VsaPNPAgSK5nimXG02ACE3DkB8=;
 b=Y5g/yi7OZ7A1TR6r2UOfWVwbJppdH7zf+10iGm4ef8p3LulI3dIHFgRIkujFnzDvEe7M
 4ZJdqlsSKUUiz/6uH75RHuqJWK4RcORnCkAjpbwzCwY0Xw2QLq/CPWSjsiMHuQnLG3EC
 PZGAsNMNwx0hjDlZMrn0+eW8fg9FD5L+Grj8ob9N+Q7ExVaRt0znqf0xr6Zxfnd2WrNe
 4ausimiLNY0Fo3YSklIM4EQFyC3Fi8ZKK2ptyhS/3ao7Qq9R5F0cYPbBSI3gqaWueNyU
 EihC/N4AjAZZ/e4VeVvJKRtbBEQocXV6BxgStgDRXKAYJmOKEAsalRCPh9lUBOpD7Qu0 Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c8txeps1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 11:12:50 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BBG3Vo7134316;
 Fri, 11 Dec 2020 11:12:50 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35c8txeprv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 11:12:50 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BBG8ULF024006;
 Fri, 11 Dec 2020 16:12:49 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3581uamvt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Dec 2020 16:12:49 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BBGCmxY26476900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 16:12:48 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A22C0AE05C;
 Fri, 11 Dec 2020 16:12:48 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2BDDAE05F;
 Fri, 11 Dec 2020 16:12:46 +0000 (GMT)
Received: from [9.206.154.251] (unknown [9.206.154.251])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 11 Dec 2020 16:12:46 +0000 (GMT)
Subject: Re: Proposal for operations on isolated hardware units using Redfish
 logging
To: Ed Tanous <ed@tanous.net>, dhruvaraj S <dhruvaraj@gmail.com>
References: <CAK7WosgZtEj_fp_Jx8rqWKHJb7AF8cPHR-_33jo_5vQx645_Bg@mail.gmail.com>
 <CACWQX8050TCOT8z5efOWQ_q7b9Ucqv6+w1X1J1NRwba9AGKq8g@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <e925631f-54db-ae7e-21c2-3d1600349299@linux.vnet.ibm.com>
Date: Fri, 11 Dec 2020 09:12:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CACWQX8050TCOT8z5efOWQ_q7b9Ucqv6+w1X1J1NRwba9AGKq8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-11_03:2020-12-11,
 2020-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012110106
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/10/2020 10:29 AM, Ed Tanous wrote:
> On Thu, Dec 10, 2020 at 7:49 AM dhruvaraj S <dhruvaraj@gmail.com> wrote:
>>
>>
>> Listing isolated hardware units.
>> redfish >> v1 >> Systems >> system >> LogServices >> IsolatedHardware >> Entries
>> {
>>    "@odata.id": "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries",
>>    "@odata.type": "#LogEntryCollection.LogEntryCollection",
>>    "Description": "Collection of Isolated Hardware Components",
>>    "Members": [
>>      {
>>        "@odata.id":
>> "/redfish/v1/Systems/system/LogServices/IsolatedHardware/Entries/1",
>>        "@odata.type": "#LogEntry.v1_7_0.LogEntry",
>>        "Created": "2020-10-15T10:30:08+00:00",
>>        "EntryType": "Event",
>>        "Id": "1",
>>        "Resolved": "false",
> 
> LogEntry doesn't have a "Resolved" field that I can see.

Part of Redfish's 2020.4. Matches OpenBMC's 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/05dd96872560bc6f11616be48b1873f539904142/xyz/openbmc_project/Logging/Entry.interface.yaml#L29

> 
>>        "Name": "Processor 1",
>>        "links":  {
>>                   "OriginOfCondition": {
>>                          "@odata.id":
>> "/redfish/v1/Systems/system/Processors/cpu1"
>>                      },
>>        "Severity": "Critical",
>>         "SensorType" : "Processor",
> 


