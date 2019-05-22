Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1BF271FA
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 23:58:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458RNJ3cYNzDqRX
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 07:58:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458RMr36PszDqRX
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 07:58:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4MLvQXo010814
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 17:58:12 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sncjmw0ay-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 17:58:12 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Wed, 22 May 2019 22:58:12 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 22 May 2019 22:58:09 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4MLw8OW26017872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 May 2019 21:58:08 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A4C3AE05C;
 Wed, 22 May 2019 21:58:08 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A857AE05F;
 Wed, 22 May 2019 21:58:07 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 May 2019 21:58:07 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 22 May 2019 16:58:34 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
In-Reply-To: <CACPK8Xc62bCPeZsPVoXiRWgTvKMp1tZofzx9s4Z1UASEnrA1iA@mail.gmail.com>
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
 <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
 <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
 <CACPK8Xe4b9MvdendfEbN3LAxaaSC0V6V56FzvuFPpPruCXqQXw@mail.gmail.com>
 <3fff6467-4167-3b23-07b0-77329df511a8@kaod.org>
 <CACPK8Xc62bCPeZsPVoXiRWgTvKMp1tZofzx9s4Z1UASEnrA1iA@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19052221-0064-0000-0000-000003E395AB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011145; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01207153; UDB=6.00633941; IPR=6.00988129; 
 MB=3.00027009; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-22 21:58:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052221-0065-0000-0000-00003D9275E8
Message-Id: <898d0cb80f1ec3c124efb8713a5acdfc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=959 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905220152
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>> >>> Should we introduce a machine option to set the model name of the
>> >>> FMC flash chip ? I think I tried that in the past but at the block
>> >>> level and mainline did not like it. But we could try at the machine
>> >>> level.
>> >>>
>> >>> Anyhow, it's a good way to debug flash issues on real HW.
>> >>
>> >> Eh. I'm not fussed by a new machine. I wouldn't do anything for the moment.
>> >
>> > We could instead add a swift machine with the 128MB NOR. When we get a
>> > model for the SD/MMC it would use that too.
>> 
>> OK. That's a good direction.
> 
> Adriana, could you take this on?

Yeah, was thinking about it when Cedric sent out this patch, but since 
theoretically the witherspoon128-bmc model could be used with a swift 
image, I put it to the side. But now that you mention it, yeah we can 
add the SD/MMC to it later so that'd be valuable to have in a qemu 
model. Will send a patch based on the 128 for a new swift bmc to start 
with.

