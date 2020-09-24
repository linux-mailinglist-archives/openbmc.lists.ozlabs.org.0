Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1992766C4
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:09:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxg4V3m8SzDqc3
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 13:09:14 +1000 (AEST)
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
 header.s=pp1 header.b=rg+k/IIA; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxg3m3khTzDqSf
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 13:08:36 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O33lkg165858; Wed, 23 Sep 2020 23:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tNWw3f3Xuc6Ib9LswZ808J8jProebwOKtfOLPtuyHwQ=;
 b=rg+k/IIA+Tluv1//zadDM3D2jCjbWKjIJAKimvEoq/kCKByrsXG8dvRUbiA0uC06qq8B
 GcXJpI9fuAYR5ncuDGDkQwLIdqZz9YHyLAryLZo250h7W61erlOsygItsdkgGOwh3zME
 QAqAbUHfly4WLw85xfSki/tWejvFaf6JXkKMr0aH4YlESawrVRQvQCTLO9VBKYGjYDAr
 IGTLKXgIAm+M+AxM9hLABn6ezVd/+NuVTPHY4QTC999t3NjU/39Y3obgM36h75v3sSWu
 fjqdBp+vL5UKLwzH5kzfWgwPMicmuO9OGTGQyOC4qI2J8HwJ8CWqCb7v3TIDOL0J9Sk1 Bg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33rhn0hy6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 23:08:33 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O36pEH011006;
 Thu, 24 Sep 2020 03:08:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 33n9m9db7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 03:08:32 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08O38RMP19137198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 03:08:28 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF4A3BE05A;
 Thu, 24 Sep 2020 03:08:31 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 202ADBE051;
 Thu, 24 Sep 2020 03:08:31 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.207.145])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 24 Sep 2020 03:08:30 +0000 (GMT)
Subject: Re: Chassis reset
To: Patrick Williams <patrick@stwcx.xyz>, Ed Tanous <ed@tanous.net>
References: <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
 <20200923191051.GR6152@heinlein>
 <CACWQX81tyY1Wo6a8e4hnk3fvinfV-x3ogRK1q1W5cfx28tpfrw@mail.gmail.com>
 <20200923202113.GT6152@heinlein>
 <CACWQX8135vU++ztaVaaKjJyq2C=DdqDti623xGdCeT9fSJDQAA@mail.gmail.com>
 <20200923214237.GV6152@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c1252b83-ce94-40d5-9bfe-62e796c96af9@linux.ibm.com>
Date: Wed, 23 Sep 2020 22:08:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923214237.GV6152@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_01:2020-09-23,
 2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240019
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/23/20 4:42 PM, Patrick Williams wrote:
> On Wed, Sep 23, 2020 at 02:12:10PM -0700, Ed Tanous wrote:
>> On Wed, Sep 23, 2020 at 1:21 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>> On Wed, Sep 23, 2020 at 12:26:58PM -0700, Ed Tanous wrote:
>>>> On Wed, Sep 23, 2020 at 12:10 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>>>>> On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
>>>>>> Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xyz/openbmc_project/chassis_system0.
>>>>>> Later one is used for AC reset.
>>>>> Can we do a query to see if 'chassis_system0' exists and use it first
>>>>> and then 'chassis0' if not?
>>>>
...snip...
> With CIM there use to be these Profile documents that showed "the right
> way" to fit all these pieces together.  Does that not exist with
> Redfish?  How does any external application consume Redfish in a
> consistent way?

I don't know much about this area.  I understand Redfish is always 
looking for more system configurations:
https://redfish.dmtf.org/redfish/mockups/v1

Otherwise, you could post this question here:
https://redfishforum.com/board/1/protocol-specification

- Joseph

