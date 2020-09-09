Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4D26395F
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 01:21:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmyhZ0Vg6zDqZk
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 09:21:50 +1000 (AEST)
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
 header.s=pp1 header.b=UVdjFvA3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmygl1CYpzDqYM
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 09:21:05 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089N26fJ178170; Wed, 9 Sep 2020 19:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=POepctUaEJgUbiSDNdsq1eVawNw1eJ81+Eu4ggiy7ls=;
 b=UVdjFvA35tTzsRwPt2BHKQAqu6zeSnA4uxjd0n10/3wpBfnNd33lpfQSF5Zrz+WuHZ5A
 hBukE70G0t/0ZvReu40jovwuPzOplajJMGpcchWTPqWLyVJ29wOnWYP2UmTbQ0r/DFPT
 vbWr8nO3qz2PNnz7D5q/OwjlLu7odHr9Kh2paBWwWFp67OD1NT+JST2mmWYqgLdTDd5u
 JvsU+799tOx5qWISClIF6vELNGzBsqFgRm0v4NkzU+L/I3ul/dHfXF6xsMFP4vyUW7y8
 6WCl5dNGMOnQbLYwTy79lV5UyIkXjaPp3VQNNM00E4QBi0/RccKWdmE2OTF5dVEuTQtB fw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33f78vsy6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 19:21:01 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089NHWOP007512;
 Wed, 9 Sep 2020 23:21:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 33c2a9axmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 23:21:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 089NKxTi66716140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 23:21:00 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2E526E04E;
 Wed,  9 Sep 2020 23:20:59 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 469286E050;
 Wed,  9 Sep 2020 23:20:59 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.182.69])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  9 Sep 2020 23:20:59 +0000 (GMT)
Subject: Re: bmcweb 30 second lockout
To: Neil Bradley <Neil_Bradley@phoenix.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <063c4d06-8e54-4682-8d41-573ce08839b5@linux.ibm.com>
Date: Wed, 9 Sep 2020 18:20:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1f5b34f7029a48f39a5dfdbf9aad9e93@SCL-EXCHMB-13.phoenix.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_17:2020-09-09,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090197
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

On 9/9/20 5:13 PM, Neil Bradley wrote:
>
> I had recently read somewhere on the OpenBMC mailing list (forgive me, 
> as I can’t find it anywhere now) recently indicating that there’d be a 
> 30 second lockout for a given user if there were 3 consecutive failed 
> login attempts. My question is firstly, is this the case, and 
> secondly, is it tied to the user globally regardless of connection or 
> is it per user and connection? The reason I ask is that the former 
> would still allow for a denial of service attack and want to make sure 
> that’s not actually the case.
>

I can think of two items:

1. I had pushed an experimental gerrit code review to do what you described.
Here: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841
My idea has not gained much traction and is recorded here: 
https://github.com/ibm-openbmc/dev/issues/2434
and here: https://github.com/linux-pam/linux-pam/issues/216
and here: https://github.com/deksai/pam_abl/issues/4
and other places.
If this ever gets merged, it would NOT the be default behavior.

2. The user lockouts for failed authentication attempts is handled by 
pam_tally2 and controlled by Redfish APIs.
See 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth
In pam.d/common-auth, the default pam_tally2 deny=0 means "accounts are 
never locked because of failed authentication attempts".

The Redfish APIs are implemented here: 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp
Specifically, PATCHing /redfish/v1/AccountService/ property 
AccountLockoutDurationor AccountLockoutThreshold invokes a D-Bus method 
which ultimately modifies the pam.d/common-auth config file above.

Note that downstream projects may typically want to modify these default 
settings.

3. I don't think you mean this: There is a current code review for a 
BMCWeb enhancement to allow the BMC admin to control the idle session 
SessionTimeout property.  The minimum is 30 seconds. See 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/36016

- Joseph

> Thanks!
>
> àNeil
>

