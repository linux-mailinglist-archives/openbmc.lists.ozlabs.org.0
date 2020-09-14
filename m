Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F3268DD1
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 16:34:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqpmC4KzGzDqT7
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 00:34:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CpuwzmY9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqpj9656WzDqNV
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 00:32:12 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08EEW0FS074383; Mon, 14 Sep 2020 10:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Gag5BLsSINxdWYeJtkOXGe7jn26CmhphMg/kY6Po+dE=;
 b=CpuwzmY9tR+v8amvMgxppEtwNnvj7LFiP7iibb7IpewbvCMHCT3lEeOzgMvE5HJwRMIj
 CLabNCpgX/Hl+z6ClD1by1HVgpD71kRUgo13PC6eat8qn5+jsgoukhtYIULzG4Yx5aA1
 I0T0b2OsmCmlXhNU8fifYL1VKsXYmRK+6bwaKmc7hM6kM8mcNiWy3iqCMUTsT9zbYCFe
 2pESlft8840D6vBf6nay/uGLVMCP3ucDX6GhLCScIdR/CCiXrUX1yklenZ9kQ6QZTSI/
 XKeFHXF7GYNqnJirK3lnxEHPWPfW8Rm6jwOB6B1dDrlFa323hsK9zk4S8OSTRyVy1Q9l yA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33j7v55f5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 10:32:05 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08EEQcB7005647;
 Mon, 14 Sep 2020 14:31:57 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 33gny8vg05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Sep 2020 14:31:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08EEVuIG44040468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Sep 2020 14:31:56 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72CB7C605A;
 Mon, 14 Sep 2020 14:31:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C35E3C6055;
 Mon, 14 Sep 2020 14:31:55 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.204.63])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Sep 2020 14:31:55 +0000 (GMT)
Subject: Re: bmcweb 30 second lockout
To: Neil Bradley <Neil_Bradley@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
 <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
 <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
 <39b0c34a-d780-d4c8-ae23-b536d999df58@linux.ibm.com>
 <a9d812ca6d134e568a278db9693f1e66@SCL-EXCHMB-13.phoenix.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <fa795eb0-dd22-cd84-bb4f-d59bf365d797@linux.ibm.com>
Date: Mon, 14 Sep 2020 09:31:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a9d812ca6d134e568a278db9693f1e66@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_04:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140115
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

On 9/11/20 4:42 PM, Neil Bradley wrote:
> Hi Joseph!
>
> Correct: The problem we wish to solve is to stop or make brute force password attacks logistically impossible/useless, but still allow credentialed individuals in.
>
> I don't have any particular objection to a short lockout period, provided that lockout period is bound to both the user and the actual TCP connection (assuming a TCP link is maintained during the login process) or perhaps the source IP address.
>
> I still think a simple 2-4 second delay (without the 30 second delay) is more than sufficient. For example, let's say there's 96 possible characters and an 8 character password. That's 7,213,895,789,838,336 possibilities. Let's also say there are 8000 incoming TCP connections to the web server - I know, it's kind of absurd, but let's assume a massively coordinated attack. /8000=901,736,973,729. Multiply that by 2 seconds, and you get roughly 57,187 years to exhaust all possibilities. Granted, it's likely the password would be found in a quarter of that time, but that's still 14,296 years. The problem gets lots worse quickly when the password is longer. Even a 4 character password is 84,934,656 possibilities and 8000 incoming connections it'd still take 5.8 hours to exhaust everything, and by then the system would have lots of other problems with that many attempts. Though it also could be successfully argued that anyone using a 4 character password is asking for it. 😉
Neil, thanks for

Cc: +Ed Tanous for BMCWeb.  I created an issue on BMCWeb to track this 
specific approach: https://github.com/openbmc/bmcweb/issues/151

So I would support a design for BMCWeb to have a 2-4 second delay for 
every authentication failure.  But I think it comes with problems of its 
own and I don't know if it is the right answer for everyone.

Specifically, as I wrote in the issue/151 this solution gives attackers 
another way to DoS the machine.
Also, what defense does it provide against an attacker who uses many 
multiple connections?  Without additional defenses, such an attacker can 
theoretically try 1000 passwords in that 2-4 second time window.  To be 
sure this is a more sophisticated attacker and the attack requires more 
system resources.

What is the right way to defend against password-guessing attacks (short 
of going to 100% certificate-based auth)?

- Joseph

> Unless I'm completely missing something, I don't see that a longer lockout period is necessary or at all. I do understand the confusion of a user who doesn't know if they're being locked out because their password , however, but without a lockout period, that problem goes away.
>
> Let me know what you think.
>
> -->Neil
>
> -----Original Message-----
> From: Joseph Reynolds <jrey@linux.ibm.com>
> Sent: Friday, September 11, 2020 2:11 PM
> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: bmcweb 30 second lockout
>
> On 9/9/20 6:26 PM, Neil Bradley wrote:
>> Thanks Joseph! I'll look at this in more detail in a bit but I noticed your comments here:
>>
>> " This issue is to add capability for "authentication rate limiting" for BMCWeb (login and Basic Auth), SSH login, and ideally for IPMI authentication. This capability is to be independent from account lockouts, specifically so someone could use the auth rate limiting as an effective defense and not need to lock accounts."
>>
>> This is precisely what I was getting at. I'm not a fan of lockouts generally because they can be abused (depending upon implementation of course), and adding in auth rate limiting (just delaying a few seconds when credentials are wrong) winds up making brute force attacks ineffective.
> Thanks Neil.  Its you and me against the world.
>
> Let's be clear about the problem we want to solve: stop brute force password-guessing attacks but not deny service to legitimate users. Is that also your problem?  That is a difficult problem, and I think solving it will require defenses in multiple layers.
>
> I believe the most promising solution is limiting the number of authentication attempts after too many failures (item 1 in the email below).  I think a PAM authentication module like pam_abl could be a solution here.  Would that work for you?  But I want to go a step farther and actually notify the person logging in when their attempt was rejected because authentication rate-limiting is in effect. Right now they get an "authentication failure" message which leads them to believe their password was wrong, or their account is missing, and that confuses them.  My issues with linux-pam and pam_abl are to help provide clarity to the user what happeded to their login attempt.  Is this what you want?
>
> The approach you mentioned ("delay a few seconds when credentials are
> wrong") defends against a single-threaded attacker (or a misbehaving tool), but it breaks down in (at least) two ways:
> - When the attacker establishes multiple connections to the BMC.  A defense against this might be limiting the number of connections.
> - When the attacker has a long time to attack, for example, a year or more.  A defense might be password expiration.
>
> Which of these were you thinking?  I would be happy to make progress on any of them.
>
> - Joseph
>
>> -->Neil
>>
>>
>> -----Original Message-----
>> From: Joseph Reynolds <jrey@linux.ibm.com>
>> Sent: Wednesday, September 9, 2020 4:21 PM
>> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: bmcweb 30 second lockout
>>
>> On 9/9/20 5:13 PM, Neil Bradley wrote:
>>> I had recently read somewhere on the OpenBMC mailing list (forgive
>>> me, as I can't find it anywhere now) recently indicating that there'd
>>> be a
>>> 30 second lockout for a given user if there were 3 consecutive failed
>>> login attempts. My question is firstly, is this the case, and
>>> secondly, is it tied to the user globally regardless of connection or
>>> is it per user and connection? The reason I ask is that the former
>>> would still allow for a denial of service attack and want to make
>>> sure that's not actually the case.
>>>
>> I can think of two items:
>>
>> 1. I had pushed an experimental gerrit code review to do what you described.
>> Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
>> My idea has not gained much traction and is recorded here:
>> https://github.com/ibm-openbmc/dev/issues/2434
>> and here: https://github.com/linux-pam/linux-pam/issues/216
>> and here: https://github.com/deksai/pam_abl/issues/4
>> and other places.
>> If this ever gets merged, it would NOT the be default behavior.
>>
>> 2. The user lockouts for failed authentication attempts is handled by
>> pam_tally2 and controlled by Redfish APIs.
>> See
>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-e
>> xtended/pam/libpam/pam.d/common-auth
>> In pam.d/common-auth, the default pam_tally2 deny=0 means "accounts
>> are never locked because of failed authentication attempts".
>>
>> The Redfish APIs are implemented here:
>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account
>> _service.hpp Specifically, PATCHing /redfish/v1/AccountService/
>> property AccountLockoutDurationor AccountLockoutThreshold invokes a
>> D-Bus method which ultimately modifies the pam.d/common-auth config
>> file above.
>>
>> Note that downstream projects may typically want to modify these
>> default settings.
>>
>> 3. I don't think you mean this: There is a current code review for a
>> BMCWeb enhancement to allow the BMC admin to control the idle session
>> SessionTimeout property.  The minimum is 30 seconds. See
>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
>>
>> - Joseph
>>
>>> Thanks!
>>>
>>> àNeil
>>>

