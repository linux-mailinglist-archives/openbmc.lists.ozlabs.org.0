Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD51838F9
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 19:47:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dd9S1RgQzDqQB
	for <lists+openbmc@lfdr.de>; Fri, 13 Mar 2020 05:47:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dd8l3GlnzDqMf
 for <openbmc@lists.ozlabs.org>; Fri, 13 Mar 2020 05:46:47 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02CIecAd033334; Thu, 12 Mar 2020 14:46:22 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yqta6s32b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 14:46:22 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02CIif9q031138;
 Thu, 12 Mar 2020 18:46:21 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2yqt6pr7s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Mar 2020 18:46:21 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02CIkLqb34210256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 18:46:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECE7BAE062;
 Thu, 12 Mar 2020 18:46:20 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C70F2AE05F;
 Thu, 12 Mar 2020 18:46:20 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 12 Mar 2020 18:46:20 +0000 (GMT)
Subject: Re: Proposal: delete BMCWeb sessions after some kinds of account
 changes
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 openbmc@lists.ozlabs.org
References: <62c905ac-d35b-f670-aed7-589488676db0@linux.ibm.com>
 <ef0ff8ae-4e43-1905-c5a8-d8c523c3a82a@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c06b807c-1012-e51c-74d2-d95eb47065b7@linux.ibm.com>
Date: Thu, 12 Mar 2020 13:46:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ef0ff8ae-4e43-1905-c5a8-d8c523c3a82a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-12_12:2020-03-11,
 2020-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1011 malwarescore=0 phishscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003120094
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

On 2/21/20 6:45 AM, Alexander Tereschenko wrote:
> On 17-Feb-20 23:10, Joseph Reynolds wrote:
>> This proposal is to enhance BMCWeb to terminate login session that 
>> are associated with accounts that have incompatible changes.  I 
>> understand this practice is allowed Redfish and recommended by OWASP.
>>
> This makes sense to me, with one specific note - see below

Good.  I hadn't thought through any of the specific cases.  Some ideas:
1. password becomes expired (for any reason, for example due to password 
aging (which is not implemented in OpenBMC)) ==> the 
PasswordChangeRequired property becomes true, with its restrictions.
2. password becomes unexpired (because a new password was successfully 
set) ==> currently the session remains valid <-- Redfish specifically 
allows that behavior.  On the other hand, OWASP recommends deleting the 
session even in this case.
3. The account itself is disabled, expired, or deleted.  ==> The session 
gets deleted.
4. The account is renamed ==> The session gets deleted.

Hey George, are you getting some ideas for test cases here?  :-)

>
>> - The [proposed][] ExpiredPassword D-Bus property and the 
>> PasswordChangeRequired Redfish properties set to True.  Sessions 
>> where this property is True are needed for a user to change their own 
>> password.
>
> While not terminating these sessions (which certainly makes sense), 
> should we restrict them to only allow for password change action 
> starting immediately after that flag is set? I'm not sure how it works 
> now.

Yes.  To clarify the wording: When an account's password changes to 
expired aka "PasswordChangeRequired", in-flight operations can complete, 
but new operations (including operations from an valid login session) 
should be restricted by the PasswordChangeRequired requirements (which 
restrict the session to the operations required to change the account 
password).

My proposed ExpiredPassword D-Bus property design ( 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020554.html) 
would make the statement above become true.  I am currently working on 
the first part of the implementation (the D-Bus portion), with the 
BMCWeb portion to follow.
That same design would also make the converse true: Successfully setting 
a new password would remove the PasswordChangeRequired condition; this 
would allow the session's usual privileges to take effect.

Now let me get back to that....

- Joseph

>
> regards,
> Alexander
>

