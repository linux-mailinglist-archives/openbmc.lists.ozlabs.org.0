Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB661240ADF
	for <lists+openbmc@lfdr.de>; Mon, 10 Aug 2020 17:56:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQLD84jXNzDqVF
	for <lists+openbmc@lfdr.de>; Tue, 11 Aug 2020 01:56:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UHQPT/pO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQLC21WFpzDqRL
 for <openbmc@lists.ozlabs.org>; Tue, 11 Aug 2020 01:55:09 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07AFXY8o135199; Mon, 10 Aug 2020 11:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5JXPlslo9hslSMgWmZelcxUWZSLgXIGmVoBh7C3UHrQ=;
 b=UHQPT/pOk3rKCJNRQdp6xNA2mUxmfzYBqFAs7IlABH7zOJHwPMbd5HMvvF7LV4n4g4RE
 KjQw+HiJLRWV+ZOpbknRLKBSCgUEz9badW+K/coQooOe/KRgHOYUC+Ce1UtEEZWReaGi
 //66FKn/zp2oCkkGBBZZyWOp9upUWU7c4WBYTLmdmqFM+QmQREZb9AaHvtaPZGov4SdF
 25KMoCAbcebeeazf5b01o4NzzkBt9dqba7fSvfRnih7hhPQcrysgtcmyjwDR5mb7Hu+u
 1HYkQaqVfKMVWpJZ0byz69eQsNT6CBMMzAmQ0So3YOLPfNBYd4PVdAbuDmmK/+LHIQng 2Q== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32u4g1s4s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 11:55:05 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07AFaG5h022267;
 Mon, 10 Aug 2020 15:55:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 32skp8tf5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 15:55:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07AFt3wE63701336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 15:55:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F97E78064;
 Mon, 10 Aug 2020 15:55:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E125F7805F;
 Mon, 10 Aug 2020 15:55:02 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 10 Aug 2020 15:55:02 +0000 (GMT)
Subject: BMCWeb payloads larger than than 64MB
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>, Ed Tanous <ed.tanous@intel.com>
References: <cf68b3d3-9f1d-0f2e-cfa2-98afde52e243@linux.ibm.com>
 <e736ad6d-66fd-f24f-b1e5-74cc2c71e856@linux.ibm.com>
Message-ID: <9d648ded-ed67-da73-1fa9-084cdc02713c@linux.ibm.com>
Date: Mon, 10 Aug 2020 10:55:01 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e736ad6d-66fd-f24f-b1e5-74cc2c71e856@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_12:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100115
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
Cc: james.feist@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/5/20 6:26 PM, Joseph Reynolds wrote:
> On 8/3/20 4:09 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday August 5 at 10:00am PDT.
>>
>> We'll discuss current development items, and anything else that comes 
>> up.

...snip...

>> 4. Is there interest in enhancing OpenBMC firmware image update 
>> uploads using the Redfish-specified multipart HTTP push updates (that 
>> is, support the MultipartHttpPushUri property?
> Sounds good, but nobody is working on it.  We also discussed use cases 
> for golden/primary/active/alternate images.
>
Ed,

You mentioned "For any payloads larger than 64MB, this stuff needs 
revisited" on Jul 22 in 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/34972 and I would 
like to learn more about what you think the direction should be.

In the mean time it seems like the current design can tolerate a 128Mb 
payload.  Do you foresee additional problems other than we've already 
seen?  Examples: resource use, slow connections, and the attending 
security vulnerabilities.

- Joseph

