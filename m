Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E1DB94AE
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2019 17:57:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zddf0qHpzF3QZ
	for <lists+openbmc@lfdr.de>; Sat, 21 Sep 2019 01:57:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zdbk04gbzF1rp
 for <openbmc@lists.ozlabs.org>; Sat, 21 Sep 2019 01:55:45 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8KFl6jX144639; Fri, 20 Sep 2019 11:55:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v501td6ug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 11:55:36 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8KFlMZs001659;
 Fri, 20 Sep 2019 11:55:36 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v501td6t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 11:55:36 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8KFp6mG030191;
 Fri, 20 Sep 2019 15:55:35 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 2v3vc5q5hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 15:55:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8KFtVbv57213398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 15:55:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74E30C6055;
 Fri, 20 Sep 2019 15:55:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E742DC6059;
 Fri, 20 Sep 2019 15:55:30 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 20 Sep 2019 15:55:30 +0000 (GMT)
Subject: Re: Machine name in Code update
To: Lei YU <mine260309@gmail.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Adriana Kobylak <anoo@linux.ibm.com>
References: <90E110C3-D171-4E85-9558-D1A0631C265A@fb.com>
 <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <1b08815f-5258-2635-ce2d-9c0e0e51e3e0@linux.ibm.com>
Date: Fri, 20 Sep 2019 10:55:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAARXrtmM9iHd0ohOo5Ah=O-_XBvx-abggt4jf+7wuMqhF=y_5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-20_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200144
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Ben Wei <benwei@fb.com>,
 "ed.tanous@intel.com" <ed.tanous@intel.com>, Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 9/19/19 9:21 PM, Lei YU wrote:
> On Fri, Sep 20, 2019 at 2:15 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>> Team,
>>
>> I am trying to add a feature of verifying machine name while upgrading BMC image. I have submitted a couple of patches, 1. Which adds machine name in manifest file and 2. Which verifies machine name from manifest to os-release file. Below are 2 gerrit review patch.
>>
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/25324/
>>
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-bmc-code-mgmt/+/25344/
>>
>>
>> I have received some valuable feedback on design approach and I agreed with some of them. Let me explain complete thought here and please provide your valuable feedback as well as new ideas.
>>
>>
>>
>> Currently available:
>>
>> ================
>>
>> Currently, Software updater updates image based on version reading and purpose from manifest file.
>>
>> I find here a security issues of upgrading an image which was built for different machine and upgraded to BMC with different platform.
>>
> + @Adriana Kobylak
>
> And here is my thought:
> * Initially I wanted to add such check to make sure a BMC is not updated with
>    a different BMC build.
> * Later the signature and verification code is added, and the tarball contains
>    signatures.
>    In practice and in field, the deployed BMCs will not be using the "default"
> openbmc key, and thus any update shall be using a signed tarball. The one who
> generates the signed tarball shall make sure the build matches the machine.
>
> So I think the "security issue" is not really a problem.

There can be two mechanisms to prevent the wrong image from being loaded 
onto the BMC.
1. Check the new firmware image's digital signature.
2. Checking the new firmware image's machine type.

Both of these can work together.   For example, consider an environment 
where two machine types are supported.  Would each machine type have its 
own digital signing key?  If the key was shared, you might still be able 
to load a firmware image onto the wrong BMC, and even though its 
signature checked out okay, it would be for the wrong machine type.

Finally, have we worked out how to recover when your private signing key 
has been compromised?  Or the public key stored in the BMC has been 
damaged (altered)?  It might be nice to have the "machine type" check 
independent of the digital signature check.


I understand this email is focused on trying to prevent code update with 
unintended firmware images, but I see additional security 
considerations.  For example, attackers can downgrade the BMC to an 
older release that has known security vulnerabilities (a "downgrade 
attack") and exploit them.  To help prevent that, we want to include a 
version check as part of code update, and require additional authority 
to downgrade.  Some advocate for semantic versioning: 
https://en.wikipedia.org/wiki/Software_versioning

>
> But I still like the idea to check the machine name to prevent incorrect
> updates accidentally.
>
>> Design approach:
>>
>> ==============
>>
>> As I see that while building image, there is a /etc/os-release file which gets created and includes version, machine name as OPENBMC_TARGET_MACHINE. This machine name is nothing but a MACHINE defined in bitbake environment. So I thought of using same MACHINE value to be appended in MANIFEST file which is being parsed by updater. And verify this against running image release file before validating image. There are following question comes here.
>>
>>
>>
>> Backward compatibility : For this we can allow image upgrade if machine name is not defined in MANIFEST file or if it is defined than it should match to current running image.
> Yes, I prefer to keep backward compatibility for a few release cycles.
> E.g. in 2.7 and 2.8, let's make it support tarballs without machine name.
> And in 2.9, make machine name mandatory.
> What do you think?

The staging plan makes sense, but we may want to consider more use 
cases.  For example, consider what happens when we scrap or re-purpose a 
system.  The BMC gets pulled out and may be re-used for a different 
target machine.  To support this, we might consider a way to override or 
force a new image onto the BMC regardless of the machine type it 
currently supports.

An alternate conflicting viewpoint is to lock down security so there is 
no way to update the BMC with an image that supports the wrong machine 
type.  In this case, flashing the BMC is the only escape. We can do that 
in the development lab, but not all facilities have that capability.

>> Validation level: Current code updater supports upgrade for host, bmc and psu all firmware. So I am not sure if machine name is going to be same for all components or it is different. In my understanding, all components should have same machine name if they are part of single machine. I am open to discuss this point as I am not sure how everyone else is defining it.
> I agree with this one.
> Adding machine name for all tarballs (BMC, host, PSU) makes sure the image is
> for a specific machine.
> Even if an image is meant to support multiple systems (e.g. a PSU image may be
> used on different systems with the same PSU), the update image could be
> generated (and signed) for the specific machine as well.

What I would like to see (but don't have time to propose) is a check 
made during code update that checks:
1. Is the new image in the same series as the current code?  That's your 
machine type check.
2. If so, is it a higher-numbered image?  That helps prevent accidental 
downgrades.

If these checks fail, we can either (A) generate warnings, or (B) 
require additional confirmation from the operator to proceed, or (C) 
refuse to load the new image.

I see the check for machine type as a step in the right direction, so I 
am in favor of it.  Thanks!

- Joseph

