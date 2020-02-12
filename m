Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5BD15B35D
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:05:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Htxr0fVyzDqRv
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:05:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Htn12tGlzDqLY
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 08:58:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CLp9L3088404; Wed, 12 Feb 2020 16:58:06 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4j8eavv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 16:58:06 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01CLsd3F007121;
 Wed, 12 Feb 2020 21:58:05 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2y1mm87mbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 21:58:05 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01CLw4uY52494700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2020 21:58:04 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45BE46E056;
 Wed, 12 Feb 2020 21:58:04 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C9246E052;
 Wed, 12 Feb 2020 21:58:03 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.142.217])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Feb 2020 21:58:03 +0000 (GMT)
Subject: Re: Functionality vs Security
To: James Feist <james.feist@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <36a83c91-dfde-6048-14b5-f35a004f8e37@linux.ibm.com>
Date: Wed, 12 Feb 2020 15:58:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_10:2020-02-12,
 2020-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 priorityscore=1501 mlxlogscore=916
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120150
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, "Mihm, James" <james.mihm@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/12/20 3:16 PM, James Feist wrote:
> In IRC yesterday I proposed the question of whether to change the 
> default of bmcweb to disable REST D-Bus, or to change it in our 
> meta-layers only. I created the patch here: 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 and I am 
> looking for feedback. While REST D-Bus does expose many useful APIs, 
> and phosphor-webui depends heavily on it, it does leak information to 
> any logged in user. This comes to the question, should we prefer 
> functionality by default or security by default? It is a compile 
> switch either way, so each user can still decide which they prefer. I 
> have the opinion that the default should be the safest configuration, 
> and if someone wants to change that, then they can accept the risk and 
> change the build flag.
>
> Thoughts?

Thanks for the email.  Some thoughts to help illuminate the situation....

OpenBMC ought to be "secure by default".  I agree the Rest-DBus APIs 
represent an unnecessary information exposure, albeit only to 
authenticated users.  That is, I have no doubt the APIs should be 
disabled by default.

I understand the reason why the D-Bus APIs are enabled-by-default is 
because they were developed first, before the Redfish APIs were 
available.  And I understand the direction and current efforts are to 
develop Redfish APIs to replace all D-Bus APIs, then disable the D-Bus 
APIs by default.

In that context, you are asking if this can happen now.  Let's explore that:

If we disable D-Bus APIs now, we'll also disable the web access. Users 
who don't use web access will not be affected.  Anyone who wants web 
access can easily configure their bmcweb recipe to re-enable the D-Bus 
APIs.  ==> In the future (a year from now?) when the web app is using 
only Redfish APIs (and no longer using any D-Bus APIs), the bmcweb 
recipes can be changed back.

(The project really needs a build-time  security configuration guide.)

- Joseph

BMCWEB_ENABLE_DBUS_REST:
https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt

>
> Thanks,
>
> James

