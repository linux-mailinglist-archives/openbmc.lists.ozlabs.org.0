Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C69332D80
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 18:43:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw2d62DTrz3cRq
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:43:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DdHQ5SYC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DdHQ5SYC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw2cs517pz30N9
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 04:43:41 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 129Hdifd050412; Tue, 9 Mar 2021 12:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NrXQb8nzSGv6auqDBAQySWCdoWtI4y27JoT3v1Glke0=;
 b=DdHQ5SYC2Nekh6EnWdX6Rr4uiSV1yJnmbWFxiZT+vzPEUPzB5x5ebOgNT7RK8x0XnzTh
 8JdRxYkQN8BlGspd1zLnEFLMyk7mqQwuMwShscm+ZWyiCswgJtDdfJAk0he+Ux3xiBSb
 0lfYZk/bUv/nSXb7UvZf3iBCRq4++xGbCJLr/fyQFW/9W6uH8Ao1kVI6XT9kB2/EptPg
 1B0s/DaeKdQRoibl5tiIn6RUmmXI4Prvo/mM7XP0T0nfiPqT8hPfctbZKF9pywXwRCcO
 ma/Sd5ILmNN5I8ZlTirdUCm2GirgTK4y51iJ0Ukosn8LQIs5NbJZAz6WlyrjQMI4MtK/ Og== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 375wmk1qpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 12:43:37 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 129HRQxH007506;
 Tue, 9 Mar 2021 17:43:36 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3768rbahx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 17:43:36 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 129HhaQI27263338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Mar 2021 17:43:36 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E932B112067;
 Tue,  9 Mar 2021 17:43:35 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A014711206E;
 Tue,  9 Mar 2021 17:43:35 +0000 (GMT)
Received: from demeter.local (unknown [9.160.115.82])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Mar 2021 17:43:35 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code - pam_2fa discussion
To: Patrick Williams <patrick@stwcx.xyz>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <15f3a43c-d876-38e0-8397-9db8a3896d38@linux.ibm.com>
 <YEaoJH+TP0A79tfM@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <39a37872-79fd-7377-6ebe-1f50d42ab282@linux.ibm.com>
Date: Tue, 9 Mar 2021 11:43:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEaoJH+TP0A79tfM@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-09_14:2021-03-08,
 2021-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090084
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

On 3/8/21 4:41 PM, Patrick Williams wrote:
> On Mon, Mar 08, 2021 at 02:30:26PM -0600, Joseph Reynolds wrote:
>> Patrick, thanks for that.  I was unaware of the pam_2fa project.  I
>> agree this could a be a good way for BMCs to get 2FA.
>>
>> However, as I tried to state in this email thread, the IBM firmware
>> service organization requires that all credentials be brought onto the
>> work site because some sites have no way to communicate with an external
>> server.  That is, once you are on a customer site, you might not be able
>> to call into IBM (or even have access to a phone).  Although this is not
>> typical, I don't think it is unique to IBM.  What is done other secure
>> installations?
> I might have poorly explained my thought process before.  I know
> *normal* 2FA requires remote access to the 2FA server.  The PAM_2FA
> allows configuration of the URL and there is no reason why the URL
> cannot be a localhost implementation of the 2FA protocol.  All the
> protocol does is POST to the URL and make a decision based on the HTTP
> return code.
>
> Proposal:
>      * Use 'pam_2fa' using Yubikey protocol to point at a 'localhost' URL.
>      * Implement Yubikey 2FA protocol (described in pam_2fa
>        documentation) in a small daemon on the BMC, specific for ACF
>        certificates.
>          - 2FA request will get the ACF password.
>          - ACF daemon hashes password, checks with installed certificate
>            and returns 4xx/2xx codes as appropriate.
>      * Set PAM config to use 'pam_2fa' (pointed at localhost) for IBM
>        service users.

Thanks again.  I see it now.  This could work for IBM ACFs.

Your proposal is:
Instead of writing a new Linux-PAM module which checks the password with 
the ACF, this proposal uses pam_2fa.so together with a new BMC-hosted 
HTTPS server (implemented as a new systemd service) which checks the 
password with the ACF.  Instead of putting the checks into my new 
proposed Linux-PAM module, I would put them into the HTTPS REST API server.

I'm not sure what advantage this would give.  It seems like this gives 
me a tested PAM module in exchange for implementing a REST API server.  
I'm not sure I want to make that trade.  The Linux-PAM coding aspects of 
my proposed module are well-understood and straightforward.

> In summary, the service accounts can have a static primary password AND
> an ACF-secured secondary password which is checked with the standard 2FA
> protocol.
>
>> The IBM ACF design in terms of 2FA is:
> ...
>> 2. The ACF has no secrets (other than the password hash stored within
>> it) and can be installed onto the BMC by the admin or the service rep.
> Doesn't the service user have access you're not expecting the 'admin' to
> be able to have on your machines?  How do you ensure a compromised ACF
> cannot be replayed onto another machine?  With admin-level access it is
> fairly trivial to fake out the serial number.

Yes, on IBM Enterprise machines, service access is a superset of admin 
access.  In particular, the interface to change an existing machine 
serial number requires service access.  However, it remains possible for 
a machine owner to use shenanigans to change serial numbers.  This, plus 
the admin's ability to record the service user password and to change 
the BMC's TOD would give them the ability to re-use an ACF.

> I might be misunderstanding something with "... or ther service rep".
> It seems like there is a gap in how the service rep would install
> something when the ACF is what gives them permissions to do the install?

You are correct.  I didn't explain scenarios.

First, note the proposed REST API to install the ACF requires admin 
authority.  There are multiple alternate workflows:
1. A security conscious system owner would have the admin install the 
ACF immediately before service and remove it immediately afterward.  And 
probably look over the service agent's shoulder.
2. A trusting system owner would share admin access with the service 
agent who would install and remove the ACF on behalf of the owner.
3. A forgetful system owner would not have admin access (having lost the 
password).  In this case the service agent asserts physical presence to 
open a time window in which they could upload the ACF without 
authentication or authority needed.

Joseph

