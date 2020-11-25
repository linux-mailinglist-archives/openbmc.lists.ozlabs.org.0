Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 332FD2C4B28
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 00:02:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChGcf4bgtzDr3h
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 10:02:26 +1100 (AEDT)
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
 header.s=pp1 header.b=tkEX3uYC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChGbl3Z3WzDqxH
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 10:01:38 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APMWHXU053113
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 18:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=RsG5Y8UfzU+JADBMXK+AboZOlzXWno56nGZEOqyEw1s=;
 b=tkEX3uYC6snYxsfzPu5qYZXNylC8YkouHgIRao8QAp2FEbTtoAwxDsmQWje0Z10m9Ybu
 0KIfQkJd3bHKabmOvld47vGJT1Jj7X6HjiiIaXmre2WHufCVDZMsCchyf0ujVnBOTN7Y
 w+MJrAfqWXRHTkMRkOTsbXpdPr0TppKBOqCEQKpv0M+hNlwVMX9GOL7gOdQ4Q6mw6W4i
 KT843YY1obgOSGUyT+WWWmJV5AIPGn0r3VgHuct+pYUGoiWW1msH6q6H4m4Kw/vea8Fc
 Ztth6/Bfv75+zLznIkbD8qLTyt6bG1fGIhlJN8fDqpB9M76AOFYgNohes2zzS/yjOd3b 5A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351vyvd7vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 18:01:34 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APMq8Yx019343
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 23:01:33 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 34xth9um8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 23:01:33 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APN1Qpt22807168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 23:01:26 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 502BA6E053
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 23:01:32 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 127696E04C
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 23:01:31 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.239.116])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 23:01:31 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday November 25 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <f02f2bfd-4a5f-a023-9add-cd6c4bb11914@linux.ibm.com>
Message-ID: <ad96b0cd-6cb5-fac1-9fad-a8c523df8185@linux.ibm.com>
Date: Wed, 25 Nov 2020 17:01:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <f02f2bfd-4a5f-a023-9add-cd6c4bb11914@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_13:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250134
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



On 11/24/20 4:53 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday November 25 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. Phosphor user manager - default group roles

Richard and Joseph went through the email thread and agreed on the 
solution for the ssh group.  This includes the use case where SSH is 
enabled, but only special pre-created users are allowed to access it 
(such as manufacturing and service accounts).


We also discussed an image feature to disable SSH.  Is there such an 
image feature in yocto/OpenEmbedded?  If so, use it; otherwise add an 
option to openbmc.  Specifically, if SSH is not present, then remove the 
“ssh” group privilege from the image (such as phosphor-user-manager).


We discussed the concept of “image type” as an image feature.  A 
“development” image would have features such as SSH enabled and is 
intended for developers.  A “production” image would have fewer (or 
different) features enabled and is intended for production servers.  
This might simplify testing.  However, we did not discuss any specific 
features (beyond SSH).


Joseph mentioned that changing the SSH default was one of several 
desired changes...


Joseph is moving forward with a proof of concept (PoC) for a special 
pre-created “service” account that has a custom OEM “ServiceAgent” role 
that has the custom “PerformService” privilege.  I believe all agreed 
that this privilege is needed to perform operations such as change a 
permanent MAC address or a FRU serial number.


(Joseph introduced the way we plan to authenticate the special-privilege 
pre-created users.  Having a default password is problematic.  The 
service user (person) will create a certificate pair, and work with the 
BMC admin to install the “public” copy onto the BMC.  Details pending.)


(Joseph mentioned the “service” account is “special” in several ways: 
special authentication as mentioned above, and there are no APIs to 
delete or modify the account.  The main idea is to prevent the admin 
user from escalating into the special account.)


We discussed if the OEM ServiceAgent role would be (A) a superset of the 
Administrator role, or (B) if it should be a subset of Administrator 
privileges plus the custom PerformService privilege.  Option A is the 
use case currently needed.  Option B may be more difficult to design, 
implement, document, test, and reason about.


We discussed the idea of making all these changes in BMCWeb and 
user-manager, and which would become image features.

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>

