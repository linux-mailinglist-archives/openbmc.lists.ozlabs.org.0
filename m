Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 347328A388
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 18:41:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466hS85WWJzDqY1
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 02:41:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 466hRM3kHmzDqXQ
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 02:40:30 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7CGbcis008457
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 12:40:26 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ubbpxr9ru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 12:40:25 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7CGe7tA030721
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:40:25 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2u9nj62dsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:40:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7CGeOpg44237292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:40:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A6E4AE068
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:40:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 042F6AE064
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:40:23 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.85.205.93])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 16:40:23 +0000 (GMT)
Subject: Re: 2.7 Release: Freeze Week - What to do
To: openbmc@lists.ozlabs.org
References: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <38b54d0a-80d9-e9a1-2243-003e6d76afba@linux.ibm.com>
Date: Mon, 12 Aug 2019 11:40:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2061b2a4-5308-0d65-ad52-4a4ad4dbaca5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908120185
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


On 7/8/19 2:00 PM, krtaylor wrote:
> Soon we will branch a 2.7 release candidate. <UPDATE: done, see email 
> from Brad> Here are some things to prepare for:
>
> 1) Start testing the release candidate as soon as possible - please 
> post results to IRC or email, openly discuss any problems that you 
> find on your system.
>
> 2) Clean up documentation, bring old docs current, add documentation 
> for new functionality.
>
> 3) Send me any input for release notes that did not make it in a 
> release feature (github issue)
>
> 4)Bug cleanup/feature (issue) cleanup, add comments, indicate state - 
> if something didn't make it in the release, please let me know first 
> and/or come to a release planning meeting and we'll take care of it.

Please review https://github.com/openbmc/docs/blob/master/features.md
and update it with new features.  If you send me a link to your feature 
docs, I will be happy to add it.

> 5) Master will not be frozen, so new functionality can continue to 
> make progress, but please take some time in the next couple of weeks 
> to test or contribute docs, etc
>
> Remember: communicate outside your organization MUCH more than you 
> think you need to - use IRC, send email, share what you are doing and 
> where you are with it!
>
> Happy 2.7 release month!
> Kurt Taylor (krtaylor)
>

