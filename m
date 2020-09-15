Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA5326A9A1
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 18:22:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrT5h743SzDqPK
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 02:22:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JshyV8ak; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrSxP1JLlzDqNL
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 02:15:04 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08FG7TWj089871; Tue, 15 Sep 2020 12:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=c2B1TRP7LXpWOqRU1xInEl9Qk8yKj/QrQT0/ijUpYwc=;
 b=JshyV8akJa1klK9h6Vyow6oqVi8rfM/DMqFKBc8D4PaVJ2W9NbMJiKsr98XXQ2kgK4u/
 TjvMBnJqd127Ubu+skT5QOFZ7kJVI1+Ns84TEuIKcUTMAXM6rFm/D8Y0sxlQaui4jNs0
 AZkEQrRHFPF/fxwwNtgMRLSlRraf9FkXuQSzyhQWpBQt2Vlt1ltjiN1dmYNquRMCUJwr
 dnMHTFlyv0D/Pb48I6/I0+rr3jAn22+S16TVY+7b5ZAW9Uf+Z4RWQNyFuooYDGM8+sgy
 wH212hdYl+9CiHJfi2GJYVEugb9CZ7IIYIFccWy/qNx2sMyjhRpeuTdskYXJd8VaD/yx 1A== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33jx26w39s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 12:14:57 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08FGBtcA008418;
 Tue, 15 Sep 2020 16:14:56 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 33jaxxr2gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 16:14:56 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08FGEuTb54919528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Sep 2020 16:14:56 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10AF0124055;
 Tue, 15 Sep 2020 16:14:56 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CD5B124052;
 Tue, 15 Sep 2020 16:14:55 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.204.63])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Sep 2020 16:14:55 +0000 (GMT)
Subject: Re: bmcweb 30 second lockout
To: Ed Tanous <ed@tanous.net>, Neil Bradley <Neil_Bradley@phoenix.com>
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
 <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
 <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
 <39b0c34a-d780-d4c8-ae23-b536d999df58@linux.ibm.com>
 <a9d812ca6d134e568a278db9693f1e66@SCL-EXCHMB-13.phoenix.com>
 <CACWQX801K=a9cvx5oQ4LLek4S9RaP0pUhYbvEPFfziZ7rLYjTA@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <08e5c541-b889-c911-a7f9-d0cb540c6c80@linux.ibm.com>
Date: Tue, 15 Sep 2020 11:14:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACWQX801K=a9cvx5oQ4LLek4S9RaP0pUhYbvEPFfziZ7rLYjTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_11:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150130
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/14/20 9:55 AM, Ed Tanous wrote:
> On Fri, Sep 11, 2020 at 2:43 PM Neil Bradley <Neil_Bradley@phoenix.com> wrote:
>> Hi Joseph!
>>
>> Correct: The problem we wish to solve is to stop or make brute force password attacks logistically impossible/useless, but still allow credentialed individuals in.
>>
>> I don't have any particular objection to a short lockout period, provided that lockout period is bound to both the user and the actual TCP connection (assuming a TCP link is maintained during the login process) or perhaps the source IP address.
>>
>> I still think a simple 2-4 second delay (without the 30 second delay) is more than sufficient. For example, let's say there's 96 possible characters and an 8 character password. That's 7,213,895,789,838,336 possibilities. Let's also say there are 8000 incoming TCP connections to the web server - I know, it's kind of absurd, but let's assume a massively coordinated attack. /8000=901,736,973,729. Multiply that by 2 seconds, and you get roughly 57,187 years to exhaust all possibilities. Granted, it's likely the password would be found in a quarter of that time, but that's still 14,296 years. The problem gets lots worse quickly when the password is longer. Even a 4 character password is 84,934,656 possibilities and 8000 incoming connections it'd still take 5.8 hours to exhaust everything, and by then the system would have lots of other problems with that many attempts. Though it also could be successfully argued that anyone using a 4 character password is asking for it.
>
> This type of approach works great in an apache-type server, where we
> have thread per connection, and we can rely on running out of threads
> to slow us down.  For better or worse, bmcweb is an async reactor
> model (a lot like nginx), so while a 2-4 second delay would slow that
> that specific connection, all an attacker would have to do is to spin
> up N connections in parallel to bypass this per-connection limit.

Ed, thanks.  Would the solution above help if BMCWeb also limited the 
number of simultaneous connections, for example N=32.  Then the attacker 
can guess only 32 password every few seconds.  But what are the 
consequences?  During an attack, can a legitimate user compete for one 
of these connections?

I am summarizing the results of this email conversation here: 
https://github.com/openbmc/bmcweb/issues/151

- Joseph

>
> For what it's worth, I think something similar to the fail2ban
> approach would work well here, where after a number of failures, we
> lock out specific IPs for a specific amount of time at the networking
> layer using something like nftables.  Unfortunately, fail2ban is
> python, so that's a non-starter but there's a similar "copy" of it
> here that I've been meaning to play with at some point:
> https://github.com/swillner/regban
> (credit goes to James F for finding it).

For what its worth, I think fail2ban or regban could be part of a solution.

>> Unless I'm completely missing something, I don't see that a longer lockout period is necessary or at all. I do understand the confusion of a user who doesn't know if they're being locked out because their password , however, but without a lockout period, that problem goes away.
>>
>>
>> Let me know what you think.
>>
>> -->Neil
>>
>> -----Original Message-----
>> From: Joseph Reynolds <jrey@linux.ibm.com>
>> Sent: Friday, September 11, 2020 2:11 PM
>> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Re: bmcweb 30 second lockout
>>
>> On 9/9/20 6:26 PM, Neil Bradley wrote:
>>> Thanks Joseph! I'll look at this in more detail in a bit but I noticed your comments here:
>>>
>>> " This issue is to add capability for "authentication rate limiting" for BMCWeb (login and Basic Auth), SSH login, and ideally for IPMI authentication. This capability is to be independent from account lockouts, specifically so someone could use the auth rate limiting as an effective defense and not need to lock accounts."
>>>
>>> This is precisely what I was getting at. I'm not a fan of lockouts generally because they can be abused (depending upon implementation of course), and adding in auth rate limiting (just delaying a few seconds when credentials are wrong) winds up making brute force attacks ineffective.
>> Thanks Neil.  Its you and me against the world.
>>
>> Let's be clear about the problem we want to solve: stop brute force password-guessing attacks but not deny service to legitimate users. Is that also your problem?  That is a difficult problem, and I think solving it will require defenses in multiple layers.
>>
>> I believe the most promising solution is limiting the number of authentication attempts after too many failures (item 1 in the email below).  I think a PAM authentication module like pam_abl could be a solution here.  Would that work for you?  But I want to go a step farther and actually notify the person logging in when their attempt was rejected because authentication rate-limiting is in effect. Right now they get an "authentication failure" message which leads them to believe their password was wrong, or their account is missing, and that confuses them.  My issues with linux-pam and pam_abl are to help provide clarity to the user what happeded to their login attempt.  Is this what you want?
>>
>> The approach you mentioned ("delay a few seconds when credentials are
>> wrong") defends against a single-threaded attacker (or a misbehaving tool), but it breaks down in (at least) two ways:
>> - When the attacker establishes multiple connections to the BMC.  A defense against this might be limiting the number of connections.
>> - When the attacker has a long time to attack, for example, a year or more.  A defense might be password expiration.
>>
>> Which of these were you thinking?  I would be happy to make progress on any of them.
>>
>> - Joseph
>>
>>> -->Neil
>>>
>>>
>>> -----Original Message-----
>>> From: Joseph Reynolds <jrey@linux.ibm.com>
>>> Sent: Wednesday, September 9, 2020 4:21 PM
>>> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist
>>> <openbmc@lists.ozlabs.org>
>>> Subject: Re: bmcweb 30 second lockout
>>>
>>> On 9/9/20 5:13 PM, Neil Bradley wrote:
>>>> I had recently read somewhere on the OpenBMC mailing list (forgive
>>>> me, as I can't find it anywhere now) recently indicating that there'd
>>>> be a
>>>> 30 second lockout for a given user if there were 3 consecutive failed
>>>> login attempts. My question is firstly, is this the case, and
>>>> secondly, is it tied to the user globally regardless of connection or
>>>> is it per user and connection? The reason I ask is that the former
>>>> would still allow for a denial of service attack and want to make
>>>> sure that's not actually the case.
>>>>
>>> I can think of two items:
>>>
>>> 1. I had pushed an experimental gerrit code review to do what you described.
>>> Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
>>> My idea has not gained much traction and is recorded here:
>>> https://github.com/ibm-openbmc/dev/issues/2434
>>> and here: https://github.com/linux-pam/linux-pam/issues/216
>>> and here: https://github.com/deksai/pam_abl/issues/4
>>> and other places.
>>> If this ever gets merged, it would NOT the be default behavior.
>>>
>>> 2. The user lockouts for failed authentication attempts is handled by
>>> pam_tally2 and controlled by Redfish APIs.
>>> See
>>> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-e
>>> xtended/pam/libpam/pam.d/common-auth
>>> In pam.d/common-auth, the default pam_tally2 deny=0 means "accounts
>>> are never locked because of failed authentication attempts".
>>>
>>> The Redfish APIs are implemented here:
>>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account
>>> _service.hpp Specifically, PATCHing /redfish/v1/AccountService/
>>> property AccountLockoutDurationor AccountLockoutThreshold invokes a
>>> D-Bus method which ultimately modifies the pam.d/common-auth config
>>> file above.
>>>
>>> Note that downstream projects may typically want to modify these
>>> default settings.
>>>
>>> 3. I don't think you mean this: There is a current code review for a
>>> BMCWeb enhancement to allow the BMC admin to control the idle session
>>> SessionTimeout property.  The minimum is 30 seconds. See
>>> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
>>>
>>> - Joseph
>>>
>>>> Thanks!
>>>>
>>>> àNeil
>>>>

