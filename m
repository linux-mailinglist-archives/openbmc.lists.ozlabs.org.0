Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667B7EC9A
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 08:27:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460HJW3T2kzDqtr
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 16:27:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460HHw6kyxzDqjT
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 16:26:51 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x726McOs102298
 for <openbmc@lists.ozlabs.org>; Fri, 2 Aug 2019 02:26:49 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u4d8jn1k3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Aug 2019 02:26:48 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 2 Aug 2019 07:26:47 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Aug 2019 07:26:45 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x726Qi9b43581816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Aug 2019 06:26:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A241A5204E;
 Fri,  2 Aug 2019 06:26:44 +0000 (GMT)
Received: from [9.122.210.177] (unknown [9.122.210.177])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0670052052;
 Fri,  2 Aug 2019 06:26:43 +0000 (GMT)
From: vishwa <vishwa@linux.vnet.ibm.com>
To: Lei YU <mine260309@gmail.com>
Subject: Re: Small help on trivial issue
References: <A6540D28-604F-4057-8065-0EB20BFE92A5@fb.com>
 <CAARXrtn6OqU9P5MEbZ9znetZ5f115vyZ8NYr0e_P79PFdG1ChA@mail.gmail.com>
Date: Fri, 2 Aug 2019 11:56:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtn6OqU9P5MEbZ9znetZ5f115vyZ8NYr0e_P79PFdG1ChA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080206-0012-0000-0000-00000338A9ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080206-0013-0000-0000-00002172592B
Message-Id: <23b0b26b-2ad2-d97d-a7e5-d2518b801d6d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020067
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here is another instance: from one of my old commits.

https://github.com/openbmc/phosphor-host-ipmid/blob/master/systemintfcmds.cpp#L131

!! Vishwa !!

On 8/2/19 7:39 AM, Lei YU wrote:
> I did not check the code details, but from the description, it is likely due to
> the global variable's initialization order in a shared library.
>
> Basically, you need to specify `__attribute__((init_priority(101)))` for your
> global variables.
>
> Please check below commit for details and how to manually specify the init
> order for such variables.
> https://github.com/openbmc/phosphor-host-ipmid/commit/4b0ddb68b4e76420358589213bc400155fa12e43
>
>
> On Fri, Aug 2, 2019 at 4:12 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>> Team,
>>
>> I am having small issue of global json object corruption and I am unable to find reason for it. I am defining a global json object (nlohmann::json appSelData) at the start of file. I am initializing this object in register function and accessing this in different functions defined in same shared library. While accessing in different function, it doesn’t hold initialized data. This is failing in my storagecommands.cpp for IPMI.
>>
>>
>>
>> Then I created a separate new file selcommands.cpp and did the same operation, it works here as expected. So I am wondering why it is failing in existing file vs new one. Looks like there are some header included in existing file is messing it up but I have no clue yet. This only happens with json object.
>>
>>
>>
>> For your reference, I am attaching both below files
>>
>> Storagecommands.cpp – where this fails
>>
>> Selcommands.cpp – where it works.
>>
>>
>>
>> I know it is a debug issue and I have been struggling last 2 days so thought of asking for help to team. Any help here would be appreciated.
>>
>>
>>
>> Regards
>>
>> -Vijay

