Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 574EC2669EC
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 23:13:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp7l03MgzzDqwb
	for <lists+openbmc@lfdr.de>; Sat, 12 Sep 2020 07:13:00 +1000 (AEST)
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
 header.s=pp1 header.b=qOlM9YjH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp7hP1jjkzDqfy
 for <openbmc@lists.ozlabs.org>; Sat, 12 Sep 2020 07:10:44 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08BL4hq4157539; Fri, 11 Sep 2020 17:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=odSxFBOrkDIom1+7hcGak7BSPqGQ/h7pqHJLfHUL8Xc=;
 b=qOlM9YjHkPTIaxRlXa+07RCNraGaPWb7xeKZocajjABM8xLl1iHIMWPEfE3KSVoYGxla
 4g2OocaS7NNOTnJVPIeWxHzaqQe8f0Jnu4i2SsKnckP/6VIZPATwRBEGJBOUQStQXDAE
 qlRzrjmNh8qzL0l7dCQrViE/f0U5H0GGeXEgYfcKvmndjyKrbctAYo57ml1CYd/Ff1Dl
 pdMr0ftvJl6fnZ9dppJhXSjbP3V6ffdB9wHxw4IUfLf2PQTXuzLL6B1/iyHcBtKy26xK
 yeQbGmSpgb5NeM5wi+SWn8Y+gO/y5ZymwGDzzaEOhzwsrLIO8hJxs/LzVcA0OGoumV75 FA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ggm98eps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 17:10:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08BL8NwL021894;
 Fri, 11 Sep 2020 21:10:39 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 33c2a9yc9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Sep 2020 21:10:39 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08BLAZ4G27329276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Sep 2020 21:10:35 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69C8C136051;
 Fri, 11 Sep 2020 21:10:38 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B337413604F;
 Fri, 11 Sep 2020 21:10:37 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.216.162])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 11 Sep 2020 21:10:37 +0000 (GMT)
Subject: Re: bmcweb 30 second lockout
To: Neil Bradley <Neil_Bradley@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
 <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
 <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <39b0c34a-d780-d4c8-ae23-b536d999df58@linux.ibm.com>
Date: Fri, 11 Sep 2020 16:10:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bd56cc8d9bdc4bdea49046d9444e2a9f@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-11_12:2020-09-10,
 2020-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009110172
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

On 9/9/20 6:26 PM, Neil Bradley wrote:
> Thanks Joseph! I'll look at this in more detail in a bit but I noticed your comments here:
>
> " This issue is to add capability for "authentication rate limiting" for BMCWeb (login and Basic Auth), SSH login, and ideally for IPMI authentication. This capability is to be independent from account lockouts, specifically so someone could use the auth rate limiting as an effective defense and not need to lock accounts."
>
> This is precisely what I was getting at. I'm not a fan of lockouts generally because they can be abused (depending upon implementation of course), and adding in auth rate limiting (just delaying a few seconds when credentials are wrong) winds up making brute force attacks ineffective.

Thanks Neil.  Its you and me against the world.

Let's be clear about the problem we want to solve: stop brute force 
password-guessing attacks but not deny service to legitimate users. Is 
that also your problem?  That is a difficult problem, and I think 
solving it will require defenses in multiple layers.

I believe the most promising solution is limiting the number of 
authentication attempts after too many failures (item 1 in the email 
below).  I think a PAM authentication module like pam_abl could be a 
solution here.  Would that work for you?  But I want to go a step 
farther and actually notify the person logging in when their attempt was 
rejected because authentication rate-limiting is in effect. Right now 
they get an "authentication failure" message which leads them to believe 
their password was wrong, or their account is missing, and that confuses 
them.  My issues with linux-pam and pam_abl are to help provide clarity 
to the user what happeded to their login attempt.  Is this what you want?

The approach you mentioned ("delay a few seconds when credentials are 
wrong") defends against a single-threaded attacker (or a misbehaving 
tool), but it breaks down in (at least) two ways:
- When the attacker establishes multiple connections to the BMC.  A 
defense against this might be limiting the number of connections.
- When the attacker has a long time to attack, for example, a year or 
more.  A defense might be password expiration.

Which of these were you thinking?  I would be happy to make progress on 
any of them.

- Joseph

> -->Neil
>
>
> -----Original Message-----
> From: Joseph Reynolds <jrey@linux.ibm.com>
> Sent: Wednesday, September 9, 2020 4:21 PM
> To: Neil Bradley <Neil_Bradley@phoenix.com>; OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: bmcweb 30 second lockout
>
> On 9/9/20 5:13 PM, Neil Bradley wrote:
>> I had recently read somewhere on the OpenBMC mailing list (forgive me,
>> as I can't find it anywhere now) recently indicating that there'd be a
>> 30 second lockout for a given user if there were 3 consecutive failed
>> login attempts. My question is firstly, is this the case, and
>> secondly, is it tied to the user globally regardless of connection or
>> is it per user and connection? The reason I ask is that the former
>> would still allow for a denial of service attack and want to make sure
>> that's not actually the case.
>>
> I can think of two items:
>
> 1. I had pushed an experimental gerrit code review to do what you described.
> Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
> My idea has not gained much traction and is recorded here:
> https://github.com/ibm-openbmc/dev/issues/2434
> and here: https://github.com/linux-pam/linux-pam/issues/216
> and here: https://github.com/deksai/pam_abl/issues/4
> and other places.
> If this ever gets merged, it would NOT the be default behavior.
>
> 2. The user lockouts for failed authentication attempts is handled by
> pam_tally2 and controlled by Redfish APIs.
> See
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth
> In pam.d/common-auth, the default pam_tally2 deny=0 means "accounts are
> never locked because of failed authentication attempts".
>
> The Redfish APIs are implemented here:
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp
> Specifically, PATCHing /redfish/v1/AccountService/ property
> AccountLockoutDurationor AccountLockoutThreshold invokes a D-Bus method
> which ultimately modifies the pam.d/common-auth config file above.
>
> Note that downstream projects may typically want to modify these default
> settings.
>
> 3. I don't think you mean this: There is a current code review for a
> BMCWeb enhancement to allow the BMC admin to control the idle session
> SessionTimeout property.  The minimum is 30 seconds. See
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016
>
> - Joseph
>
>> Thanks!
>>
>> àNeil
>>

