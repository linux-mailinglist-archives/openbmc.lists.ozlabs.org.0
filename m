Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 876BDB349E
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 08:13:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WwsL2JYxzDqYV
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 16:13:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Wwrh5x0NzF4Mn
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 16:12:35 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8G67epw046457
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 02:12:29 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v23wuhjhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 02:12:29 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8G666uo009317
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 06:12:29 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2v0swhhn3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 06:12:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8G6CRQe32375210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 06:12:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6315C6059
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 06:12:27 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EB05C6057
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 06:12:27 +0000 (GMT)
Received: from demeter.local (unknown [9.85.154.204])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 06:12:27 +0000 (GMT)
Subject: Re: Initial expired passwords - initial commit
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc@lists.ozlabs.org
References: <b15904b6-aeaa-f3b1-1a62-ba7217727b79@linux.ibm.com>
 <38b5f461-98d8-4152-3795-cfa3e975d178@linux.vnet.ibm.com>
 <3a5d8de0-bb39-f2de-ffbc-b1900d864f88@linux.ibm.com>
Message-ID: <92a01ad9-ee40-1b9e-f516-764013358fe4@linux.ibm.com>
Date: Mon, 16 Sep 2019 01:12:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3a5d8de0-bb39-f2de-ffbc-b1900d864f88@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909160067
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



On 8/22/19 5:49 PM, Joseph Reynolds wrote:
>
> On 8/21/19 10:19 PM, Ratan Gupta wrote:
>> Hi Joseph,
>>
>> On 19/08/19 10:32 PM, Joseph Reynolds wrote:
>>> This is an attempt to over-communicate progress on the [Initial 
>>> expired passwords design][], currently in review.  This email has 
>>> the significant and tricky work items needed to implement the 
>>> design. Emails about the BMCWeb pieces that need to be changed are 
>>> [here][]; in contrast, this email attempts to decompose the overall 
>>> design.
>>>
>>> [Initial expired passwords design]: 
>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849
>>> [here][]: 
>>> https://lists.ozlabs.org/pipermail/openbmc/2019-August/017625.html
>>>
>>> The "initial expired passwords design" includes the following work. 
>>> An understanding of that design is a pre-requisite to understand the 
>>> items here.
>>>
>>> 1. Implement the new EXPIRED_PASSWORD image feature (initially 
>>> off).  This ensures the password is expired for all local users. The 
>>> right place to do this piece is in Yocto/OpenEmbedded; see 
>>> https://lists.yoctoproject.org/pipermail/yocto-security/2019-July/000114.html
>>>
>>> 2. Enhance BMCWeb to handle Redfish PasswordChangeRequired 
>>> (reference: 
>>> https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.7.0.pdf 
>>> ("Redfish Specification" version 1.7.0 or later) section 13.2.6.1).
>>> This further breaks down into:
>>>
>>> 2a. Add the PasswordChangeRequired field to 
>>> /redfish/v1/SessionManager/Sessions/<session>.  This new field comes 
>>> from PAM_NEW_AUTHTOK_REQD.

The first commit for this is available in gerrit review.  It implements 
most of parts 2 and 2a above.  The BMCWeb issue for discussion is here: 
https://github.com/openbmc/bmcweb/issues/103#issuecomment-530969632

Please review the design and the first commit.

- Joseph

The related GUI work for this is here: 
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018184.html

A question about a potential hole in the security provided by the 
"expired password" design is here: 
https://lists.ozlabs.org/pipermail/openbmc/2019-September/018080.html

