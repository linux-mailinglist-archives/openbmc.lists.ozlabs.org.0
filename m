Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA2989C7
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 05:19:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DVBt4TT5zDqst
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 13:19:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DVBB042lzDqV4
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 13:19:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M38Op8000928
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 23:19:10 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhg1fd49s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 23:19:10 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 04:19:08 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 04:19:07 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7M3IjE440501574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 03:18:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 609B4A4051
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 03:19:06 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89F31A4053
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 03:19:05 +0000 (GMT)
Received: from [9.85.165.197] (unknown [9.85.165.197])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 03:19:05 +0000 (GMT)
Subject: Re: Initial expired passwords - low level designs
To: openbmc@lists.ozlabs.org
References: <b15904b6-aeaa-f3b1-1a62-ba7217727b79@linux.ibm.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Date: Thu, 22 Aug 2019 08:49:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b15904b6-aeaa-f3b1-1a62-ba7217727b79@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19082203-0016-0000-0000-000002A15260
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082203-0017-0000-0000-0000330188FD
Message-Id: <38b5f461-98d8-4152-3795-cfa3e975d178@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220031
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

Hi Joseph,

On 19/08/19 10:32 PM, Joseph Reynolds wrote:
> This is an attempt to over-communicate progress on the [Initial 
> expired passwords design][], currently in review.  This email has the 
> significant and tricky work items needed to implement the design. 
> Emails about the BMCWeb pieces that need to be changed are [here][]; 
> in contrast, this email attempts to decompose the overall design.
>
> [Initial expired passwords design]: 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
> [here][]: 
> https://lists.ozlabs.org/pipermail/openbmc/2019-August/017625.html
>
> The "initial expired passwords design" includes the following work. An 
> understanding of that design is a pre-requisite to understand the 
> items here.
>
> 1. Implement the new EXPIRED_PASSWORD image feature (initially off).  
> This ensures the password is expired for all local users. The right 
> place to do this piece is in Yocto/OpenEmbedded; see 
> https://lists.yoctoproject.org/pipermail/yocto-security/2019-July/000114.html
>
> 2. Enhance BMCWeb to handle Redfish PasswordChangeRequired (reference: 
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.7.0.pdf 
> ("Redfish Specification" version 1.7.0 or later) section 13.2.6.1).
> This further breaks down into:
>
> 2a. Add the PasswordChangeRequired field to 
> /redfish/v1/SessionManager/Sessions/<session>.  This new field comes 
> from PAM_NEW_AUTHTOK_REQD.
   Are you mentioning the OEM filed in the session schema ? I think that 
we should define a new error message that will tell that password change 
required during creation of the session.
>
> 2b. Add the PasswordChangeRequired field to 
> /redfish/v1/AccountManager/Accounts/<account>.  Does this require 
> D-Bus changes?
   I understand that PasswordChangeRequired filed is supported by the 
redfish in the account schema, but how it would be useful.
   Suppose we have the implementation for the above then how does user 
knows that his password has been expired.
   He has to create the session which should tell that his password has 
been expired.

  2c. Tweak the authority model to handle privilege ConfigureSelf which 
applies only to *your* Session or Account and is intended to encompass 
all the privileges needed change your own expired password.  I am 
pursuing this question in private Redfish forums (issue 1986).

My suggestion is to allow the session to be created with the expired 
password and the session with expired password only allow to change the 
password for that account.
Other redfish interfaces should be restricted to access.
>
> 2d. Tweak the authority for the 
> /redfish/v1/AccountManager/Accounts/<account> "Password" property as a 
> Redfish "property override".  The Password property needs to have a 
> different authority than the other ManagerAccount properties in that 
> same account.
Why do we need property override for the same? User can change it's own 
user configuration eg password etc.  why different authority for the 
password?
Seems I am missing something here.
>
> 3. Enhance phosphor-webui to handle the expired password dialog at 
> login.  This will use the enhanced Redfish APIs. See 
> https://github.com/ibm-openbmc/dev/issues/1048
>
> 4. Enhance Dropbear SSH so a user can change their expired password.  
> See 
> https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2016q2/001895.html 
> This piece is optional, but I would like this to be available. The 
> alternative is to use the OpenSSH server instead of Dropbear. The 
> right place to do this piece is in Dropbear.
What about IPMI? As you mentioned we need to support this through IPMI 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849/3/designs/expired-password.md#98
How does user knows that his password has been expired via inband access 
IPMI?
>
> - Joseph
>
Ratan

