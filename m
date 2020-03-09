Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB817E834
	for <lists+openbmc@lfdr.de>; Mon,  9 Mar 2020 20:21:45 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bp4M5HKpzDqVm
	for <lists+openbmc@lfdr.de>; Tue, 10 Mar 2020 06:21:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bp3R1k56zDqK3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Mar 2020 06:20:46 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029JKZMg111916
 for <openbmc@lists.ozlabs.org>; Mon, 9 Mar 2020 15:20:37 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ynmxfrwg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Mar 2020 15:20:37 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 029JK5mH020530
 for <openbmc@lists.ozlabs.org>; Mon, 9 Mar 2020 19:20:16 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2ym386hwvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Mar 2020 19:20:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 029JKEfn52887960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 19:20:15 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E221F7805F;
 Mon,  9 Mar 2020 19:20:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD19A78064;
 Mon,  9 Mar 2020 19:20:14 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Mar 2020 19:20:14 +0000 (GMT)
Subject: Re: OpenBMC GUI Design Workgroup - Today 10:00 AM CST
To: Derick Montague <Derick.Montague@ibm.com>
References: <c7d6f785-755b-1c1c-9ec9-66862a6fedfb@linux.ibm.com>
 <OFFE8CB186.710715E7-ON00258522.00132915-00258522.0013A0F0@notes.na.collabserv.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <1adc6d23-a180-6bc2-108d-db31cf05bd7f@linux.ibm.com>
Date: Mon, 9 Mar 2020 14:20:14 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <OFFE8CB186.710715E7-ON00258522.00132915-00258522.0013A0F0@notes.na.collabserv.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_08:2020-03-09,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090119
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/4/20 9:34 PM, Derick Montague wrote:
> Hi Joseph,
>
> Thank you for your feedback.
>
>> My two cents worth:
>> 1. Data should be stored untranslated whenever possible, and translated
>> only when it is presented to the user.
>>
>> 2. It seems to me the language preference should ideally be associated
>> with the session (whether login session or a session to perform a single
>> operation ~
>> https://lists.ozlabs.org/pipermail/openbmc/2019-November/019422.html).
> 1. The GUI translations are stored in JSON files. Which content is determined
> by the Vue i18n Plugin.

That sounds good but covers only the GUI elements.  I was thinking about 
the human readable data that flows from the Redfish APIs into the 
browser.  For example, SEL data.  Do you know if this data will flow 
from the Redfish APIs as messageId and replacementText, similar to 
Redfish messages?  Alternately will the message already be formatted as 
a single string when it flows from the Redfish API? <-- That was the 
intent of my original cent (quoted above).

>
>
> 2. The language preference will be stored in local storage, so it will persist
> for as long as the user doesn't change the language or clear their browser's
> local storage. The question is whether the user should have to log out if they
> want to change their preference.
>   

I understand your response to mean: the user's language preference is 
stored in the browser's local storage and presented to the BMCWeb server 
in form of something like the a HTTP request Language header (whatever 
the current practice is).  That sounds okay to me.  In any case, I think 
switching languages is infrequent.  That is, I do not foresee a user 
requirement to switch language frequently during a single signon session.

- Joseph

