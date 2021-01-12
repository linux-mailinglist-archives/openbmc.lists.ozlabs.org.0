Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B22F3B6A
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 21:12:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFhZP6gkDzDr7m
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 07:12:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z5pSVKRV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFhYM68RQzDr63
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 07:11:35 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10CK35IX055731; Tue, 12 Jan 2021 15:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WfUyEl0m411vG16J0DmemJIv+N3FGvLGfPhw2S02CEs=;
 b=Z5pSVKRVnY57PUeQ67J3/lbUu1rdoEpBiJRYD96Nkr7ahb+sWOIdRiWQQ+krkMEH7ofr
 aiJd7qlsfUf5LaFQJmGfteoqewCC1TEzjemr56OQASZPAcuKT9g1pExFsY3bExJl8cFK
 QBM9mpoUPR3YTUtTnXyXt/wngK5i981Lxx5+DRfc+BJaRrdivRXkjRsQGsUwwu4QeANP
 0Eq61T9/it8JNCoj9mKNcU5xkPdFI9CwUk5TduOG0Oq3MN6tGKtSyfT3vEiCOdsmPRbM
 4qGIbB42n+eUYQfNq6BVEaqx2Z5QvrCBT4xcoCtc78TAa7fW3FkAcmzp4rsu1Y0X8HMw 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 361hqh9ckk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 15:11:29 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10CK3Pvj057105;
 Tue, 12 Jan 2021 15:11:29 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 361hqh9ckd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 15:11:29 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10CK3GwO023419;
 Tue, 12 Jan 2021 20:11:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 35y4490h4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 20:11:28 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10CKBSKo43647280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jan 2021 20:11:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 603D0AC05B;
 Tue, 12 Jan 2021 20:11:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3262AC05E;
 Tue, 12 Jan 2021 20:11:26 +0000 (GMT)
Received: from [9.206.180.135] (unknown [9.206.180.135])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jan 2021 20:11:26 +0000 (GMT)
Subject: Re: Call for volunteers
To: Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <20210111220919.zwc727vbwc4itm7h@thinkpad.fuzziesquirrel.com>
 <CAH2-KxC7=rNHJo2g=bO3nma9ViQ+hJsGEcRLtsJWs0QKUnqkVw@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <de92110c-e566-99c8-bc9d-cc45e9530a57@linux.vnet.ibm.com>
Date: Tue, 12 Jan 2021 13:11:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAH2-KxC7=rNHJo2g=bO3nma9ViQ+hJsGEcRLtsJWs0QKUnqkVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-12_15:2021-01-12,
 2021-01-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101120114
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/12/2021 9:55 AM, Ed Tanous wrote:
> On Mon, Jan 11, 2021 at 2:10 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
>>
>> Hello OpenBMC-ers!
>>
>> Your TSC has been aware of the problem of fragmentation in our project for some
>> time.  Fragmentation is a loose term - for the purposes of this note consider
>> it to be any time contributor efforts in the community are duplicated without
>> thought given to maintenance and/or compatibility.
>>
>> To begin to address this issue the TSC is looking for volunteers to serve on a
>> "repository review forum" to which the TSC will initially delegate its
>> authority in the areas of:
>> - new repository creation
>> - placement of contributed new function into existing repositories
>>
>> The TSC fully expects the scope of this forum to quickly grow into the role of
>> a traditional TSC providing frequent, technical oversight to project
>> contributors.  The current TSC will continue to serve the project in terms of
>> governance, advocacy and industry exposure - and likely get a rename (OpenBMC
>> Board? or OpenBMC Steering Committee?) in the process.
>>
>> The new forum would meet periodically or at the demand of other forum members
>> to:
>> - raise the forums combined awareness of new function under development
>>     (information exchange)
>> - build a consensus within the forum on where the function should exist
>> - inform the function contributor and the rest of the community of the decision
>>
>> A successful forum would be a forum that can simultaneously encourage the
>> contribution of new and innovative solutions to existing problems without
>> introducing complexity to the project as a whole.
>>
>> A successful forum member will have previously demonstrated a breadth of
>> understanding of the upstream OpenBMC codebase through:
>> - frequent participation in peer review, the mailing list, IRC, and Discord.
>> - submission of high quality designs and code to upstream OpenBMC
>>     (github.com/openbmc)
>> - a history of working with and guiding less experienced OpenBMC developers
>>     in a timely manner, enabling them to come up to speed quickly.
>>
>> If you are interested in serving the project in this manner, please reply to
>> submit yourself as a candidate.
> 
> I'll volunteer.
> 

I would like to nominate Brad. ;)

> 
>>
>> -brad, on the behalf of the OpenBMC TSC

