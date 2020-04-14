Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A61A8EA2
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:31:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4920Zj547qzDqsL
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:31:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4920Ys6BK8zDqBG
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:30:41 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EM3RSG029256; Tue, 14 Apr 2020 18:30:34 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnmu0kft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 18:30:34 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EMURKU002073;
 Tue, 14 Apr 2020 22:30:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 30b5h746qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 22:30:33 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EMUVFb56492396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 22:30:31 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E98936A04D;
 Tue, 14 Apr 2020 22:30:30 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61E7C6A047;
 Tue, 14 Apr 2020 22:30:30 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Apr 2020 22:30:30 +0000 (GMT)
Subject: Re: ipmi password storage
To: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Milton Miller II <miltonm@us.ibm.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <OFED1A87B9.D16D66BD-ON0025854A.004EDFC4-0025854A.00634C8E@notes.na.collabserv.com>
 <20200414191444.GE9295@mauery.jf.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <aa6d601a-998b-8ed0-24bb-27e5fdf0828f@linux.ibm.com>
Date: Tue, 14 Apr 2020 17:30:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414191444.GE9295@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_11:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140156
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/14/20 2:14 PM, Vernon Mauery wrote:
> On 14-Apr-2020 06:04 PM, Milton Miller II wrote:
>> On Apr 13, 2020 around 6:01PM in some time zone, Vernon Mauery wrote:
>>>
>>> Internally, an issue was raised that basically says that the
>>> mechanism
>>> by which we are storing the IPMI passwords on the BMC is
>>> insufficiently
>>> obfuscated. I have come up with a patch set that resolves this at the
>>>
>>> expense of no downgrading the BMC without the side-effect of losing
>>> all
>>> IPMI passwords. I would like to know what the community thinks about
>>> usability vs. security in this scenario.
>>
>> ...
>>
>>> The migration from the old mechanism to the new could be done simply>by
>>> using the new key on the next write to the /etc/ipmi_pass file. After
>>> a
>>> firmware update to this new code, a password change would trigger a
>>> decrypt of the /etc/ipmi_pass file, a modification of the plain text,
>>>
>>> and a re-encryption of the data. If it reads the 'legacy' key in and
>>> writes out the data using the new key mechanism and deletes the
>>> legacy
>>> key, it would use the new key mechanism from that point onward.
>>> However,
>>> this would cause any downgrades to prior versions to fail to decrypt
>>> the
>>> /etc/ipmi_pass file, thereby losing all the ipmi passwords. This is
>>> not
>>> ideal, but could possibly be mitigating by truncating the new
>>> machine-id
>>> derivative password to 8 bytes and storing it in the /etc/key_file
>>> instead of just deleting it. This might improve security only
>>> slightly
>>> at for the price of a better user experience.
>>>
>>
>> I'll point out the code to handle the new password could be added
>> before the cdoe to use the new method, allowing test and revert
>> until the users are upgraded to the new method.  It does require
>> both methods to be supported.
>
> Yes, it looks like any sort of change here would need to be a staged 
> change to reduce the disruption.

Thanks for handling this issue -- I appreciate it.  Don't take this the 
wrong way, but...
If this change provides little value and causes upgrade issues, would it 
be better to avoid having an upgrade path?
Instead, use this new approach for new major release that requires a 
fresh install and upgrading is not an option.

>
>> I didn't follow why currently all openbmc systems end up with
>> the same encryption^Wobsfucation for what that is worth.
>
> Unless the build has a bbappend that changes the contents of the 
> key_file that is a part of the pam-ipmi package, all of the builds 
> will contain that same key_file. I can't say for sure how many builds 
> have this already, but I did not see much documentation around that 
> fact that would have spurred people to take action, so it is my 
> assumption that most builds would use the default.

 From previous emails in this thread, it doesn't seem like having each 
BMC having an unique key_file would help much.  Nevertheless, I've added 
this to my notes for BMC build considerations: 
https://github.com/ibm-openbmc/dev/issues/1531#issuecomment-613676676

- Joseph

>
> --Vernon

