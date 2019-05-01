Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0810A13
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 17:31:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vMnd0FXdzDqSB
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 01:31:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vMmd6qj9zDqPG
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 01:30:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x41FMJR0147195
 for <openbmc@lists.ozlabs.org>; Wed, 1 May 2019 11:30:53 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s7dvvrpfa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 May 2019 11:30:53 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 1 May 2019 16:30:52 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 May 2019 16:30:49 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x41FUmiS35520512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 May 2019 15:30:49 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C89876E04E;
 Wed,  1 May 2019 15:30:48 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BDDD6E053;
 Wed,  1 May 2019 15:30:48 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 May 2019 15:30:48 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 01 May 2019 10:32:44 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: One-way dbus properties
In-Reply-To: <dcca3e80-93a4-beed-33dc-6d59512bd37c@linux.vnet.ibm.com>
References: <a25981c28a179307d5b8135e32a072ff@linux.vnet.ibm.com>
 <dcca3e80-93a4-beed-33dc-6d59512bd37c@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19050115-0036-0000-0000-00000AB1065C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011029; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197080; UDB=6.00627832; IPR=6.00977933; 
 MB=3.00026684; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-01 15:30:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050115-0037-0000-0000-00004B996D92
Message-Id: <75d6db408ef61d60de465501e3569787@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-01_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=946 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905010097
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> 
> What's the purpose of this property ? Why we are not using the same in
> RestrictionMode ? Any pointers when RestrictionMode::whitelist /
> blacklist will be used.
> 
> Reason: Defining new one, and planning to use
> Security::RestrictionMode itself to indicate that BMC system in not
> deployed (i.e. not in field), or deployed with certain restriction?
> 

FieldMode is an 'old' property used in the phosphor-bmc-code-mgmt repo 
to make decisions such as if the code update should fail when there's a 
digital signature mismatch, and whether /usr/local/ is allowed to be 
mounted to allow the system to be patched.
I'd say it's a bit different than the IPMI whitelist in that it doesn't 
necessarily block interfaces, but interfaces use it to make decisions. 
Of course this may be implemented differently in Redfish.
There was just recently a request to return an error when trying to 
clear it since historically it has been a no-op.


> How is it different from readonly property, so suppose there is a
> object which implements this interface.
> 
> when this object gets created, as part of creation we can set the
> property, but after object creation user can,t set
> 
> the property.
> 

The intent is that the property is set by an external entity like 
manufacturing, before a system is shipped, so we don't want to set it 
when the object is created. We want to keep its value unset in the lab 
machines, but if the value is set then it can't be cleared (and per 
Deepak's comment should return an error instead of success).

