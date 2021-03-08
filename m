Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F46D331894
	for <lists+openbmc@lfdr.de>; Mon,  8 Mar 2021 21:30:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvVN741Jkz3cXM
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 07:30:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dC+Fv/S6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dC+Fv/S6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvVMs6S1rz30Jp
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 07:30:32 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128KNAWb132161; Mon, 8 Mar 2021 15:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DMEafyEKbFwugJQKIJUdbz4skBjHRhTc8+EKSHlvtyI=;
 b=dC+Fv/S6y1se2Sn0EBm2lBGbt8xqGeP4pYojIIwqigXLuDWkkP7VjfNd23rkfCxNqw17
 UksKe6WCeC30cvTKSOqkCQyQLDSpqWI7sAKTSgmoK+Trdc1BRUXP44gyTaX5cKgONxqp
 +Hb3WWny7O+kyUM139UqAiyvlzq582jwYEOBZdwnjPygUXy/0GPV618DAy6ehTzkUOT3
 tgom3+wfG3/+b6E/r5jqw3s5cN8/fqDmeO/weuScrOc0lQQAdCPz8bmCQqrj6ZreWW01
 mmT1tsWZvJ6LJga1Zy3pn9eh4wd/KkGgHlq+L7u4RQ+1cjCNRXjcDpLg+k/7B+zyniFo 4w== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375tvc089v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 15:30:29 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128KNYGe029377;
 Mon, 8 Mar 2021 20:30:28 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 3741c9nmwc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 20:30:28 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128KURId21365130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 20:30:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9375BAC064;
 Mon,  8 Mar 2021 20:30:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 498D4AC065;
 Mon,  8 Mar 2021 20:30:27 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.63])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Mar 2021 20:30:27 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code - pam_2fa discussion
To: Patrick Williams <patrick@stwcx.xyz>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <15f3a43c-d876-38e0-8397-9db8a3896d38@linux.ibm.com>
Date: Mon, 8 Mar 2021 14:30:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEZwz6C5uGk8Vobs@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_17:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080104
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

On 3/8/21 12:45 PM, Patrick Williams wrote:
> On Sat, Mar 06, 2021 at 10:09:36PM -0600, Joseph Reynolds wrote:
>> On 3/5/21 1:15 PM, Patrick Williams wrote:
>>> On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
>>> My first reading of what is there, I'm not sure why typical certificate
>>> based authentication couldn't solve your needs (but I'm just guessing
>>> what your needs are).  It seems like you have a root-authority (IBM), a
>>> a daily expiring certificate, and some fields in the certificate you
>>> want to confirm (ex. serial number).  I've seen other production-level
>>> systems doing similar for SSH/HTTPS without additional PAM modules.
>> Our service team requires password based authentication.  Period. And
>> they don't like the idea of having to generate a certificate/password
>> pair for each service call.  But certificates offer the best technology
>> we have to solve the access problem.  And we are not yet prepared to go
>> to a certificate-only solution. ... So this is where we are at.
>>
>>>> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
>>>> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
>>>> proposed ibm-pam-acf module is intended only for IBM Enterprise
>>>> systems.  The intended implementation is based on standard cryptography
>>>> techniques and could be developed into a general authentication
>>>> solution, but the ACF is specific to IBM in terms of its exact format
>>>> and content, and I expect it will only be used by IBM and its partners.
>>> Are you planning to open up the tools necessary to create these ACFs?
>> No, I hadn't been, but good idea!  We have prototype tools to generate
>> and read the ACF.  They should be useful to our test team.
>> There should be nothing secret in the code.  ("The only secret is the
>> private key.")  I'll check with my security team.
> My two concerns about hosting a repository for this are:
>     1. Is it actually a secure method?
>     2. Is it [potentially] useful to anyone else?
>
> WRT, #1, I think we need more details to make an assessment.
>
> For #2 I think there is some unsettled debate around "what do we do
> about code that is only ever going to be useful to one company"?
> Opening up the tools would at least make it possible that someone else
> could find this useful.  I think the proposed "Repository Review Board"
> might work on better guidance otherwise.
>
> Beyond that, I just have the normal "is this the right way to be doing
> this" questions.  You've answered that somewhat with the Certs.  I may
> disagree with it, but you obviously know your support team better than I
> do.
>
> I recommended some SSH support for certificates before.  Based on your
> ask for password-based authentiation, I would suggest looking into
> pam_2fa[1] as a potential implementation as well.  I know on the surface
> this doesn't sound like 2FA, but the pam_2fa module has some benefits, I
> think, in this scenario:
>      * We avoid writing our own [scary] PAM module.
>      * You pave the way for a much more common use case that others could
>        build on for other scenarios.
> Using pam_2fa, we would only need to make a small localhost-only REST
> daemon to answer the 2fa requests for your service users and not a full
> PAM module.  Your service users would have a static password plus a 2FA
> code (secondary password) populated by whatever this ACF method is.  On
> other installs, we could use a proper 2FA server with slightly different
> configuration to satisfy things like Yubikey-backed 2FA.
>
> 1. https://github.com/CERN-CERT/pam_2fa

Patrick, thanks for that.  I was unaware of the pam_2fa project.  I 
agree this could a be a good way for BMCs to get 2FA.

However, as I tried to state in this email thread, the IBM firmware 
service organization requires that all credentials be brought onto the 
work site because some sites have no way to communicate with an external 
server.  That is, once you are on a customer site, you might not be able 
to call into IBM (or even have access to a phone).  Although this is not 
typical, I don't think it is unique to IBM.  What is done other secure 
installations?

The IBM ACF design in terms of 2FA is:
1. For each service call, the IBM service rep generates an unique ACF 
certificate and its associated password, using a secure server within 
IBM.  The ACF and its password are the two factors.
2. The ACF has no secrets (other than the password hash stored within 
it) and can be installed onto the BMC by the admin or the service rep.
3. The BMC itself validates the ACF's signature.  This validates the 
first authentication factor.
4. When the service user requests authentication, the BMC validates the 
password with the ACF password hash.  This validates the second 
authentication factor.

Per concern 1 above:
A. Only IBM can sign the ACF and only IBM can install the corresponding 
public key into the BMC.  So only IBM can authorize service reps.  (Note 
this solution can be directly re-used by other organizations.)
B. Note the password hash is readable by the BMC admin.  It is possible 
the hash could be cracked offline.  That (coupled with the ability 
change the BMC TOD) would give service access against IBM's wishes.

Joseph

