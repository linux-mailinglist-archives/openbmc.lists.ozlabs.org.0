Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E2D346261
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 16:09:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4ZWx3kQYz30N0
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 02:09:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSUgXyr3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QSUgXyr3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4ZWh5TPqz30Fk
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 02:08:47 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NF3HFT105494; Tue, 23 Mar 2021 11:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oKk+RycS1EMPYuhLpn9vyLeaFZMbjXbBDQldCoyT1AQ=;
 b=QSUgXyr3NGT5/bEaIpWFe7pB7oKSblMP44ohJdNQDQb5/X1O/3qzTC1bz9UkIH3tvv8b
 33T08CcTwnvX+w5RMSC8UeERLLQXqfy8ulnEAvffj93ukvGIFyfIOAJbA/FGyRxDNPEk
 h5bFUcuRZDigDSUwvemy/25kZOk5IfbjJywRDp8Mi2ED7PlYZCbMYXhatXDVHqiHoCL8
 xBGW6hNahpq3lpsHs4+w+HIWvtjZ838MsIhTlJsmE4qqIygM6KwJf4qDhVYPKBGCZHLG
 hTMhmoc5vxSKZ8CHpV/14IOudBW+Kr4I9CW6I0E0U6BxOiIYRIFfNSudH5oWNKnFe5HZ 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fjmng9f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 11:08:41 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NF3qj4107220;
 Tue, 23 Mar 2021 11:08:41 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37fjmng9du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 11:08:41 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NF1ZMp023232;
 Tue, 23 Mar 2021 15:03:39 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 37d9akcb0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 15:03:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NF3dsr32506272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 15:03:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A7E9AE060;
 Tue, 23 Mar 2021 15:03:39 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E8C7AE05F;
 Tue, 23 Mar 2021 15:03:38 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.38])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 15:03:38 +0000 (GMT)
Subject: Re: UnitTest using the /tmp file system
To: Sunitha Harish <sunithaharish04@gmail.com>, openbmc@lists.ozlabs.org
References: <158971a4-119a-eeb4-bf83-72ed17e29d9f@gmail.com>
 <411b0a86-799a-3038-ee3a-70007feab0d5@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <315434fc-94d3-ec8c-b99d-80a88690a119@linux.ibm.com>
Date: Tue, 23 Mar 2021 10:03:37 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <411b0a86-799a-3038-ee3a-70007feab0d5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_06:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230112
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
Cc: deepak.kodihalli.83@gmail.com, edtanous@google.com,
 bradleyb@fuzziesquirrel.com, gmills@us.ibm.com, geissonator@yahoo.com,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/23/21 12:44 AM, Sunitha Harish wrote:
> Any views please ?
>
> On 21-03-2021 09:30, Sunitha Harish wrote:
>> Hi,
>>
>> This is regarding the unit tests in various repos under openbmc like: 
>> phosphor-bmc-code-management, phosphor-logging, phosphor-networkd, 
>> pldm etc . I have seen the testcases using the /tmp filesystem to 
>> create the directories/files when the UT is run.

Are the files written to the BMC's file system or to the test platform's 
file system?  I don't understand why this is important either way.  
Can't we just erase the file when the unit test is complete?

Joseph

>>
>> I followed the similar way of writing the UT in one of my commits 
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/37352 . As per 
>> the review comments in this commit, using the /tmp file system for UT 
>> is anti-pattern, and this needs to be changed by mocking the same. I 
>> agree that this is a valid thing to do.
>>
>> Now this email is to discuss why this was originally done? Can the 
>> community come-up with a generalized solution for this ?
>>
>> Thanks & regards,
>> Sunitha
>>
>>
>>
>>

