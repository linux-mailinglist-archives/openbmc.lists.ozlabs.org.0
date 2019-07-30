Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D57B5BE
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 00:35:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yrwz0cd4zDqQ1
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 08:35:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yrwH4tJszDqKR
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 08:34:54 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UMWoc2088212
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 18:34:51 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u2uq3endw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 18:34:51 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Tue, 30 Jul 2019 23:34:50 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Jul 2019 23:34:49 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6UMYmXK49545692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 22:34:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4590728059;
 Tue, 30 Jul 2019 22:34:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1521628058;
 Tue, 30 Jul 2019 22:34:48 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Jul 2019 22:34:47 +0000 (GMT)
Subject: Re: journal log of boot requests?
To: Tom Joseph <tomjose@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CALLMt=rPEUO80HSivQYY9b0WuaxM_8LwTkPxyySADVxL1A4j+A@mail.gmail.com>
 <e8b521f1-41e4-cd07-df92-7f766b05f9de@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Date: Tue, 30 Jul 2019 17:34:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e8b521f1-41e4-cd07-df92-7f766b05f9de@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19073022-0052-0000-0000-000003E6BDE6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011525; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01239788; UDB=6.00653718; IPR=6.01021200; 
 MB=3.00027965; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-30 22:34:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073022-0053-0000-0000-000061E7041E
Message-Id: <b39c4a62-3e64-9974-34d8-e6638e102197@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300226
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


> +1. Detailed journal logs help in a big way to debug issues.

+1.
Auditing or Accounting capability is a typical security requirement, for 
example, as in https://en.wikipedia.org/wiki/RADIUS.  A BMC would 
probably want to log the following:
  - Requests to modify the server state.
  - Requests to modify the BMC state.
  - Access attempts (example: new Redfish sessions) to the BMC, with the 
result (was access granted?).
  - Etc.

- Joseph

>
> On Thursday 25 July 2019 09:01 PM, Andrew Geissler wrote:
>> I intermittently deal with issues where someone comes to me and says the
>> "BMC is randomly rebooting my server". I then get to peel through the 
>> journal
>> and look for things like this:
>>
>> Thu Jun 27 10:45:59 2019 witherspoon phosphor-host-state-manager: Host
>> State transaction request
>> Thu Jun 27 10:45:59 2019 witherspoon netipmid: Transition request
>> initiated successfully
>>
>> And point out to the person that it appears an out of band IPMI command
>> actually requested the state change.
>>
>> Certain paths like a external REST/Redfish commands or I think an 
>> inband host
>> initiated reboot will only provide the phosphor-host-state-manager 
>> entry which
>> makes it even more complicated to debug the "who did it" aspect.
>>
>> You can dig into the details of the journal entry and get the request 
>> but
>> I think it would be nice to have a little more detail in the journal 
>> from the
>> server side application that gets the request.
>>
>> I was thinking of adding a more detailed journal log in ipmi and 
>> bmcweb when
>> these requests come in. I know we don't want to clog up the journal 
>> but state
>> changes to the server are a big deal IMHO and should be fairly rare.
>>
>> Thoughts?
>> Andrew
>>
>

