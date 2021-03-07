Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 057DE32FEA2
	for <lists+openbmc@lfdr.de>; Sun,  7 Mar 2021 05:09:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtSfs05vkz3cc8
	for <lists+openbmc@lfdr.de>; Sun,  7 Mar 2021 15:09:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X7k06D9b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X7k06D9b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtSfc1B8hz3bcv
 for <openbmc@lists.ozlabs.org>; Sun,  7 Mar 2021 15:09:42 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 127454rO159511; Sat, 6 Mar 2021 23:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pezlLh3ViyNHmufJFkO2MCQZBS4BK1S0LogkpSzDPCo=;
 b=X7k06D9bA8g/LO9JyqJmkPbJGAY4iUcZEMCEJyBbYY46SFUJmM3vH7JKldfIfUr+F1fQ
 Ffy+mkHokMxQ55oW/pVxX735C/DgNAsqepSHpt7vUpgEDGk2Z8+zn+0prK+KSsadFHeZ
 7sVURNCAaYIMpGmD0WBQ8gZjaIgtRAtOTQXHwcsjyX3gQxbbZk4adtHR7Hv6fEN8gfVM
 3X325ED7CSqgSSls2poqm8Ae2igKW1hiTvYpAuaB5PbxR1qJv/iCoz9oU56IzDsX+yNb
 tfI6Wq31nnuZZVpjZCi2XIjbm2lbIJRgDzdmzUP/ptj00EyY7l0OGOTPz+WX/J7arxL5 Xw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 374phr0w8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 06 Mar 2021 23:09:39 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1273uWIi030424;
 Sun, 7 Mar 2021 04:09:38 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3741c8yjy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Mar 2021 04:09:38 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12749bhe26935704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Mar 2021 04:09:37 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57B2312405A;
 Sun,  7 Mar 2021 04:09:37 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CC28124052;
 Sun,  7 Mar 2021 04:09:37 +0000 (GMT)
Received: from demeter.local (unknown [9.160.85.231])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Sun,  7 Mar 2021 04:09:36 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code
To: Patrick Williams <patrick@stwcx.xyz>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
Date: Sat, 6 Mar 2021 22:09:36 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEKDY6+zfW5Uuqkl@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-06_08:2021-03-03,
 2021-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103070019
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/5/21 1:15 PM, Patrick Williams wrote:
> On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
>> What is the right repository for a new Linux-PAM module to implement an
>> IBM-specific ACF authentication?
>>
>> The access control file (ACF) design was introduced to the OpenBMC
>> security working group and is described in [IBM issue 1737][] and
>> further explained in [IBM issue 2562][].
> I'm not really seeing much documentation on this in either issue.  Do
> you have a document describing your requirements and how you're planning
> to accomplish it?

Patrick, thanks for your response!  You are correct I did not motivate 
this very well.  The short answer is twofold:
1. IBM service reps need password authentication: that is how they will 
access the BMC.  They work in a variety of environments, some of which 
do not allow them to carry a certificate to the BMC.
2. Each service call requires an unique password which is enabled by a 
digital certificate.  There is nothing secret in the certificate, so an 
admin may install it on the BMC.

Thus, the flow is for the service rep to generate a certificate (and its 
accompanying password), work with the BMC admin to install the cert onto 
the BMC, and then use the password to authenticate to the BMC.  Password 
authentication steps for the service user are detailed in issue 2562 
cited above.

> My first reading of what is there, I'm not sure why typical certificate
> based authentication couldn't solve your needs (but I'm just guessing
> what your needs are).  It seems like you have a root-authority (IBM), a
> a daily expiring certificate, and some fields in the certificate you
> want to confirm (ex. serial number).  I've seen other production-level
> systems doing similar for SSH/HTTPS without additional PAM modules.

Our service team requires password based authentication.  Period. And 
they don't like the idea of having to generate a certificate/password 
pair for each service call.  But certificates offer the best technology 
we have to solve the access problem.  And we are not yet prepared to go 
to a certificate-only solution. ... So this is where we are at.

>> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
>> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
>> proposed ibm-pam-acf module is intended only for IBM Enterprise
>> systems.  The intended implementation is based on standard cryptography
>> techniques and could be developed into a general authentication
>> solution, but the ACF is specific to IBM in terms of its exact format
>> and content, and I expect it will only be used by IBM and its partners.
> Are you planning to open up the tools necessary to create these ACFs?

No, I hadn't been, but good idea!  We have prototype tools to generate 
and read the ACF.  They should be useful to our test team.
There should be nothing secret in the code.  ("The only secret is the 
private key.")  I'll check with my security team.

- Joseph

>> Can we create a new OpenBMC repo for this?  Perhaps ibm-pam-acf?  Or
>> should this go into some other repo?
>>
>> - Joseph
>>
>> [IBM issue 1737]: https://github.com/ibm-openbmc/dev/issues/1737
>> [IBM issue 2562]: https://github.com/ibm-openbmc/dev/issues/2562
>> [pam-ipmi modules]: https://github.com/openbmc/pam-ipmi

