Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B13825B34F
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 20:03:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhWxz01f6zDr0f
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 04:03:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HThNYyJP; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhWwy6KTzzDqf6
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 04:02:10 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082I208l165604; Wed, 2 Sep 2020 14:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=g4W7HbxdWHhmIGhflqKfIrGFbRYmc97Y5ejt1PsAFrE=;
 b=HThNYyJPNMLyKZYhctyvdRUHy3/Zz4SfD7zhU20DDY4CA0lCzbLhOSFLw/ABjSFn+PN4
 HJjDMqsMU+emmFR4S54JW9vuw/I5XUf/lYEy2zUJQYBj2ZzjmzWOGBJb6WSWxIW6FoBv
 f8vTMEiJ/zXYXfK5sYe8I3uPCu9bsYxZg2FI51i8/btpn8nXhY/ofNEEE3xZIrchEaX5
 SKYiE0UQfetnMUqiquahXOgKb1CuLHielLaT82+SfzFcJE5T5cofWNsqbLDwnNVhuj5r
 n+o4puLw2fNO4JKVPy85CumIJZ01W8cEd2lo1Nau2krbVJMlNcrtDJZVGBBS4yNqCIxu RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ag61879r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 14:02:07 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 082I20fS165680;
 Wed, 2 Sep 2020 14:02:06 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ag61879c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 14:02:06 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082HwAeA022364;
 Wed, 2 Sep 2020 18:02:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 337ena27t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 18:02:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082I21u252101550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 18:02:01 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 520822805C;
 Wed,  2 Sep 2020 18:02:01 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D932805E;
 Wed,  2 Sep 2020 18:02:00 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Sep 2020 18:02:00 +0000 (GMT)
Subject: Re: Disable specific URLs in bmcweb
To: Ed Tanous <ed@tanous.net>, Richard Hanley <rhanley@google.com>
References: <98b9d39aa9004df78f8072ee6bdf4901@quantatw.com>
 <CACWQX82NP+SPyHoPhkri=3eT+7jJYqmuTdwcTy2qDV0mTzrWkw@mail.gmail.com>
 <CAH1kD+bHghGN_Gy-rXNyOZuyYJm585GK9KVCp0YOH-z8TOsnVQ@mail.gmail.com>
 <CACWQX81tzqMcYrGYFVQaF3O7zE8wsLjV-3XKx1FQ2pWZEs0JDg@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <3bb7f5d7-ad1d-58f3-740e-c2769c4ca964@linux.ibm.com>
Date: Wed, 2 Sep 2020 13:02:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACWQX81tzqMcYrGYFVQaF3O7zE8wsLjV-3XKx1FQ2pWZEs0JDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_12:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020167
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/2/20 12:46 PM, Ed Tanous wrote:
> On Wed, Sep 2, 2020 at 9:57 AM Richard Hanley <rhanley@google.com> wrote:
>> Hi Ed,
>>
>> In this particular case, I think Alan is talking about disabling the POST for certain resources, effectively making them readonly. One example I remember talking to him about was disabling the addition of new users via bmcweb.
>>
> Gotcha.
>
> In that particular case, Redfish PrivilegeRegistry schema is probably
> what you're looking for.  To handle that specific case, you would add

Here is an alternate solution: use the administrator account (currently 
"root") to create a new user with the Operator role, then use that new 
account and discontinue using the Administrator account.  For example 
(change the password):

|curl -x POST https://${bmc}/redfish/v1/AccountService/Accounts/ -d 
'{"UserName": "joeoperator", "Password": "0penBmc1", "RoleId": "Operator"}'|

- Joseph

> a mapping that looks like:
>          {
>              "Entity": "ManagerAccount",
>              "OperationMap": {
>                  "GET": [
>                      {
>                          "Privilege": [
>                              "Login"
>                          ]
>                      }
>                  ],
>                  "HEAD": [
>                      {
>                          "Privilege": [
>                              "Login"
>                          ]
>                      }
>                  ],
>                  "PATCH": [
>                      {
>                          "Privilege": []
>                      }
>                  ],
>                  "POST": [
>                      {
>                          "Privilege": [,
>                  "PUT": [
>                      {
>                          "Privilege": []
>                      }
>                  ],
>                  "DELETE": [
>                      {
>                          "Privilege": []
>                      }
>                  ]
>              }
>          },
>
> I don't believe there's an implementation of PrivilegeRegistry for
> bmcweb today, although we kept it in mind (ish) when we built the
> privileges system.  If you want to chat more about how you could add
> it, I'm happy to talk more specifics with you.
>
> -Ed
>
>> - Richard
>>
>> On Tue, Sep 1, 2020 at 10:55 PM Ed Tanous <ed@tanous.net> wrote:
>>> On Tue, Sep 1, 2020 at 10:40 PM Alan Kuo (郭振維) <Alan_Kuo@quantatw.com> wrote:
>>>> Are there some configuration files in bmcweb that can be used to disable specific URLs and HTTP methods ?
>>>>
>>> There are compile time options that can disable features (and
>>> therefore URLs associated).  They're listed in the CMakeLists.txt
>>> file.
>>>
>>> As far as disabling particular methods, why are you wanting to disable
>>> them?  It seems odd to want to disable a few particular HTTP verbs.

