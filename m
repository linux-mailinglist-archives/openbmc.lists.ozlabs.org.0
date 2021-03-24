Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259734796C
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 14:20:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F58461rGmz30Jr
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 00:20:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sQSoo6I9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sQSoo6I9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F583s3nGYz2ydJ
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 00:20:08 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OD3M9X121554; Wed, 24 Mar 2021 09:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pT9nQvko0akdPkD+/2elqwMTf7aW7SNLQvVw4ZTd1jk=;
 b=sQSoo6I9laNmDojv3s4oQr5qj378zek36Yz7kbccBS07wfkb0HW6o2dsskKVWF6n2Y8b
 KAD3D6VubegGkIsWxRoZtWmgKrOREXfzj2Wz6m82EXfzcwWKpmjZI08Pi+eCUwlxYegY
 eTqcy5jhUpsxi4xDxg+n1nQ1vviVLS59+SahO95TTnASI7A6qZQx/5CvHU+80vdju2V/
 J92YDOsqltS1pqQp4P3W7mHhI+fqqPA1qeh/gY6Np49HomFTF8f3n5XjIsdTCzYD+plu
 RCUkT3eVxbijPBtLaBijn1o8ZjFyX+3MpMJbPNpg4pCbYkSFeG78K4lv5DhG1JIvStAU Ew== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g08mtuhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 09:20:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12ODIREX021673;
 Wed, 24 Mar 2021 13:20:02 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 37d9bf5b09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 13:20:02 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12ODK1kw10813786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 13:20:01 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 573D1AE06B;
 Wed, 24 Mar 2021 13:20:01 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6944AE064;
 Wed, 24 Mar 2021 13:20:00 +0000 (GMT)
Received: from [9.160.76.70] (unknown [9.160.76.70])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 13:20:00 +0000 (GMT)
Subject: Re: Question of phosphor-sel-logger
To: =?UTF-8?B?RHVrZSBEdSAo5p2c56Wl5ZiJKQ==?= <Duke.Du@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <707efde2-b301-fc23-be4c-92d1d96d8432@linux.ibm.com>
Date: Wed, 24 Mar 2021 08:20:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <TY2PR04MB3712DCE11C578706F5F6401F88639@TY2PR04MB3712.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_10:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240098
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
Cc: "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/24/2021 6:28 AM, Duke Du (杜祥嘉) wrote:
> Hi all,
>
>       I used package phosphor-hwmon and phospor-sel-logger to monitor sensor and create log when sensor reading
>     cross the threshold. I found after the commit 25b26e162bd109b51aa09b16f26f9aa3d9d940fa of phosphor-sel-logger
>     would catch the signal "ThresholdAsserted" to create sensor threhold log in the journal, but the phosphor-hwmon
>     would not send the signal "ThresholdAsserted" when sensor reading is abnormal so that phosphor-sel-logger
>     would not create the sensor threhold log, am I right ?
>
>     If I'm right, can you give me some suggestion to fix this side effect, or what setting I have lost in the
>     phosphor-hwmon or phosphor-sel-logger ?

Hi,
That signal isn't defined in phosphor-dbus-interfaces, so phosphor-hwmon 
cannot use it.  When I tried to add it, it was rejected as-is with a 
recommendation to break it up into separate signals for each alarm 
property on each interface.  At that point I gave up and had the code I 
was working on at the time just look at propertiesChanged signals instead.

If you would like to take that up it would entail:
* Update 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/39899 
as requested
* Update phosphor-hwmon to emit the new signals
* Update phosphor-sel-logger to also listen for these new signals in 
addition to the  current one, or change the dbus-sensors code to only 
emit the new signals.


>     phosphor-sel-logger commit 25b26e162bd109b51aa09b16f26f9aa3d9d940fa link :
>     https://github.com/openbmc/phosphor-sel-logger/commit/25b26e162bd109b51aa09b16f26f9aa3d9d940fa
>
>     Thanks very much !
>     Duke

