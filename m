Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6CA9674
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 00:29:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nz516FXBzDqwH
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 08:29:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nz4T3zj6zDq8F
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 08:28:40 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x84MR8bK114663; Wed, 4 Sep 2019 18:28:35 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2utkj15bp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 18:28:35 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x84MSQHW005141;
 Wed, 4 Sep 2019 22:28:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2uqgh7b3sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Sep 2019 22:28:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x84MSXuJ66847058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Sep 2019 22:28:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE0B5C6055;
 Wed,  4 Sep 2019 22:28:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DB71C6059;
 Wed,  4 Sep 2019 22:28:33 +0000 (GMT)
Received: from demeter.local (unknown [9.85.187.198])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  4 Sep 2019 22:28:33 +0000 (GMT)
Subject: Re: BMCWeb changes login password
To: Alexander Tereschenko <aleksandr.v.tereschenko@linux.intel.com>,
 openbmc@lists.ozlabs.org
References: <959CAFA1E282D14FB901BE9A7BF4E7724E51562F@shsmsx102.ccr.corp.intel.com>
 <c73c4823-7fd1-0762-72d1-da1920897667@linux.ibm.com>
 <3160626c-d162-c7bb-1059-f8215dd69717@linux.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a39c9605-d216-29de-3c4d-f8ff7aff8c1f@linux.ibm.com>
Date: Wed, 4 Sep 2019 17:28:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3160626c-d162-c7bb-1059-f8215dd69717@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-04_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909040216
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


On 9/4/19 9:57 AM, Alexander Tereschenko wrote:
> On 04-Sep-19 04:06, Joseph Reynolds wrote:
>> 2. The scenario where we may want to ask for the old password is the 
>> "password change dialog".  This dialog is accessed when the user 
>> signs into the Web App login page and the web app informs the user 
>> that their password is expired and must be changed before they can 
>> access the BMC  The dialog asks for their new password (twice) ... 
>> and does it also ask for the old password? <== That's the question.
>
> FWIW, by the time the BMC is able to determine that user's password is 
> expired (and make sure that's indeed that user who's accessing the web 
> app), the user must have entered their password, so asking it once 
> again sounds like surplus step in this particular scenario.
I agree.  Industry standards are not clear about the best practices in 
this situation.

- Joseph

>
> regards,
> Alexander
>

