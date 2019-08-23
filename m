Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFAA9B866
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 00:01:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Fb2N3df2zDrQN
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 08:01:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Fb1R4zGkzDrR4
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 08:00:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7NLvYe8098513; Fri, 23 Aug 2019 18:00:21 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ujn8ynyj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 18:00:21 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7NM04DE008549;
 Fri, 23 Aug 2019 22:00:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 2ue976kh1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Aug 2019 22:00:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7NM0J8a52429306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Aug 2019 22:00:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9B61C605A;
 Fri, 23 Aug 2019 22:00:18 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97DE7C605F;
 Fri, 23 Aug 2019 22:00:18 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Aug 2019 22:00:18 +0000 (GMT)
Subject: Re: [yocto-security] Design for initial expired default password
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openbmc <openbmc@lists.ozlabs.org>, yocto-security@yoctoproject.org
References: <cafdcfd1-7f98-4eab-eb07-ad5df650db2a@linux.ibm.com>
 <c3b7056b3327a2b930a48060edfe368bb9dfb2a0.camel@linuxfoundation.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <b8f568cd-4d70-4e24-b9a2-d1849a3b8c50@linux.ibm.com>
Date: Fri, 23 Aug 2019 17:00:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c3b7056b3327a2b930a48060edfe368bb9dfb2a0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-23_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908230206
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


On 7/25/19 3:43 AM, Richard Purdie wrote:
> On Wed, 2019-07-24 at 18:06 -0500, Joseph Reynolds wrote:
>> I pushed an OpenBMC design to [Gerrit review][] for the OpenBMC
>> project
>> for a new distro or image feature (disabled by default) which causes
>> the
>> initial password to be disabled by default, so the password has to
>> be
>> changed before using the BMC.
>>
>> This design is intended to make it easier to comply with the new CA
>> law
>> [SB-327][] which becomes effective on 2020-01-01 (in 5 months).
>>
>> - Joseph
>>
>> [Gerrit review]:
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
>> [SB-327]:
>> https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=201720180SB327
> I'm fine with adding a mechanism like this. I'd suggest it should be an
> image feature rather than a distro feature as you'll only realistically
> know the users, image usage and so on in the image recipe itself
> (locking up an initramfs would be bad).

Thanks.  I am proceeding with my design.  I need help with the direction 
for the EXPIRED_PASSWORD image feature implementation.

Should the password be expired when the user is added?  Like this code 
in useradd_base.bblcass:
```
eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO passwd --expire 
$username\" || true
password_change_date=`grep "^$username:" <$rootdir/etc/shadow | cut -d: -f3`
if test 0 != $password_change_date; then
     bbfatal "${PN}: passwd --expire $username failed."
fi
```

Or should the passwords be expired as a post-processing step?  Where 
would this code go?  Get list of users who have passwords, and expire 
each of them:
```
usernames=`grep '^[^\:]*:[^\:\*\!]' <$rootdir/etc/shadow | cut -d: -f1`
for username in $usernames; do
     eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO passwd --expire 
$username\" || true
     password_change_date=`grep "^$username:" <$rootdir/etc/shadow | cut 
-d: -f3`
     if test "x0" != "x$password_change_date"; then
         bbfatal "${PN}: passwd --expire $username failed."
     fi
done
```

I am not knowledgeable about how /etc/passwd and /etc/shadow are 
populated and would appreciate some guidance how which approach you 
think is best.

- Joseph

> Cheers,
>
> Richard
>

