Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A583F0BA1
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 21:13:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqcxK6Dlrz3cMW
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 05:13:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjnMPOoL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FjnMPOoL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqcww6lF6z2yx2
 for <openbmc@lists.ozlabs.org>; Thu, 19 Aug 2021 05:12:48 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IJ3CSA101884; Wed, 18 Aug 2021 15:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wtjwp7JEH8LBl+K/wq+a9L2ikDuRFbuqYAfbWW1Rqgg=;
 b=FjnMPOoLG8/c9xQEBHUlepabitLYa1AdumlaHtyaPjHXc3PnDb3oNFRbvLBbSaOpSTMU
 cswQ6aXPgq54cZ7ILjglvx6+xW4t1n1LfjN0vhHcEkduuhkN1Wlrxn/qEtlRDWrKR3Dq
 2322qa8MNYDZhEvh+t1XyDMXt0bPJlLgOnS/yXS7QgU7HSl8T+rNJdIxCSdRnn9+mTfj
 undQ1PPMknsJvO2SDz1Xq+6lpkXv8DgZsSdAwvQzMT4K/dqhPADqpO+X3HfKw4iPR9In
 bNiwdNo1PljWbFRor4uTKTlM51mqDuWOhwJapq5m8JU0M4LYPhcx9/aEOJ+xve72K9/d Cw== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aftx64ggy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 15:12:44 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IJ901v013012;
 Wed, 18 Aug 2021 19:12:44 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3ae5fe21s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 19:12:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IJChjd37028304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 19:12:43 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03A9F6E053;
 Wed, 18 Aug 2021 19:12:43 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABC616E056;
 Wed, 18 Aug 2021 19:12:42 +0000 (GMT)
Received: from demeter.local (unknown [9.163.42.82])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 18 Aug 2021 19:12:42 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 18
To: Patrick Williams <patrick@stwcx.xyz>
References: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
 <YR1EXQVdfz3RwIso@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <4c6d60fc-f290-c92f-421f-4fcfd1a87d29@linux.ibm.com>
Date: Wed, 18 Aug 2021 14:12:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <YR1EXQVdfz3RwIso@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0NUKbD1USqvm8TbzY4SzJADZeZNGWnFW
X-Proofpoint-GUID: 0NUKbD1USqvm8TbzY4SzJADZeZNGWnFW
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_06:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108180118
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

On 8/18/21 12:33 PM, Patrick Williams wrote:
> On Wed, Aug 18, 2021 at 08:54:52AM -0500, Joseph Reynolds wrote:
>   
>> 1. Wholesale changes to bitbake recipes were made.  See
>> https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u
>> <https://lore.kernel.org/openbmc/YQ1FD5q8KbhbXVBK@heinlein/T/#u>  My
>> non-specific security concern (Joseph) is accidentally mis-configuring
>> something with these changes.
> How do we ensure that any configuration you want to ensure is done,
> security-wise, is covered by tests going forward?

Here are my ideas:

For build-time configurations, I suggest documenting all important 
configuration settings.  Each item to include (links to) description of 
what the configuration setting controls, considerations for selecting 
the appropriate setting, and which recipe to append.  Then add links to 
test cases.  Examples:
- For example, if out-of-band/network IPMI is configured out of the 
image, have a test case to determine that UDP port 623 is unresponsive 
and PATCH /redfish/v1/SessionService {"IPMI": {"ServiceEnabled": true}} 
fails and has no effect.
- On the other hand, if out-of-band/network IPMI is configured into the 
image but disabled by default, have a  test case to determine that UDP 
port 623 is unresponsive and PATCH /redfish/v1/SessionService {"IPMI": 
{"ServiceEnabled": true}} succeeds, and makes port 623 active, etc.

These test cases are necessarily specific to a specific configuration, 
so they are not all appropriate to run.
That is, we can have a test case for each configuration setting, and 
configure them into or out-of the test suite as needed.

Specifically, the person responsible for configuring their downstream 
firmware image must also work to configure the appropriate tests to be 
run.  (Example: if you configure IPMI out of the image, configure your 
test suite to (a) remove tests for IPMI function, and (b) add tests to 
ensure IPMI is not present.)

I would be happy add test case links to the OpenBMC configuration wiki:
https://github.com/openbmc/openbmc/wiki/Configuration-guide

Joseph

