Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D2AA0410F
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 14:45:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSC474Q2Dz3cYB
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2025 00:45:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736257540;
	cv=none; b=e85TzzP/wgBMA0tAFt6/cNOjqj0EDZ3P/ONDQykxSfICfNlw5KLvrzxZ9McLlf2Hhs3/p7EPR4ftNjfDV3xZeG0iCDAzPF2H32Pha2tfTtOjwj2bA+9050Sc0tZ6SuN45qg0F23dGyKCuB/HdOz7Tqg88Qrcj06d+gOpeN/aiZ/+mXPIHsVQ7R/ZFfQHnfXhVXjJ7Q7+EPONsSyywCVKTIgCUbnqt8wAKrfb/xtQf83+tp6zdxbwuP/r058cOdM5Yj/rNpbgbK+k90+kdzKjYh4yp3qHa5GsCY4pXePgU03CJz6suguhys7Lv/+FvdAfrHQSRfWIUgubtSA4IjLwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736257540; c=relaxed/relaxed;
	bh=5k6aiau0CXtdQdT+F+/jTSe6b2826PUl6ZCVJY0ew0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nSsijDTzf4iqLfrk5Lg2XTkXpkwUZHN7ju84viRGZE0zow839eFq9gjBmHi7YPpCN6RrnLzVA7HX2EQ6UCBoIUAfLCU1tifRW/QnraPWPYfk4+FHJXB5flsngP0XiJ0N2B1a7Z4JHXuiGL92WpsrcbJJj8llLVr6uil7klJaL3ME5P2TvATJ1CPFnqVrOfuI9N8BINWulhG0bCnlaR3UKvrE56svfAp80SkRuRzWMNwHlPXqtk0GX8xrDe9u4ST5SYWDrKpe0LfEFfUPEaiVFleCE+wmRNBkJ50vfWOiF6XlQt38YUC6WAVBXXc957hJ6BteIL8x1/TopEPLqzPjZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nNAbmWQ9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nNAbmWQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSC430PFFz30WW
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2025 00:45:38 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507CKOQg024527;
	Tue, 7 Jan 2025 13:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5k6aia
	u0CXtdQdT+F+/jTSe6b2826PUl6ZCVJY0ew0k=; b=nNAbmWQ9rYgcq/w45WQYZC
	GaBkLl7NabHdfRmRJG7LOuKN99oeNgz22C76YBq6tXv+eLJtSDj09MxbHVmubT0d
	bo6/eaKrxVJtDMYGyk3XmxYk+Z5mk/h774Z8WEpxa58dCILoZn0rUzgxpNU1oYQI
	AX7fNFeKejt8CL90l/AEG75REaplnJLxGluljxAXVcZBzUaAplBMrEfuL56ITqVK
	TrH4V+67NcvMfQoSaqq0fG1jv48UPV7wSuQlzNWDfJadkjC1O8UGt7XugYKiHQHR
	f3uuDyPaWVurUGPGLAokPvMHBhDjNjWhdUqxBnndi5C0Bq4q1qNjfjos/f2+j2pw
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440sahk5a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 13:45:24 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 507AQDea026179;
	Tue, 7 Jan 2025 13:45:23 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj122cam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 13:45:23 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 507DjN5w57803196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2025 13:45:23 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1634D58066;
	Tue,  7 Jan 2025 13:45:23 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F27355805C;
	Tue,  7 Jan 2025 13:45:22 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jan 2025 13:45:22 +0000 (GMT)
Message-ID: <4fd46421-cb17-4b67-9147-272562f4e5c5@linux.ibm.com>
Date: Tue, 7 Jan 2025 07:45:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.6 v1 0/4] Add support for Intel CRPS PSU
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com
References: <20250106171530.1063148-1-ninad@linux.ibm.com>
 <48739595439c7b9a39bf97eba86fea064dc16bda.camel@codeconstruct.com.au>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <48739595439c7b9a39bf97eba86fea064dc16bda.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 93k8z_nEbe82xSEsZqxZOPtyj5roaj4w
X-Proofpoint-ORIG-GUID: 93k8z_nEbe82xSEsZqxZOPtyj5roaj4w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070113
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Hi Andrew,

On 1/7/25 00:12, Andrew Jeffery wrote:
> Hi Ninad,
>
> On Mon, 2025-01-06 at 11:15 -0600, Ninad Palsule wrote:
>> Hello,
>>
>> Please review the version 1 of patchset.
>>
>> This patchset is already applied upstream:
>> https://lore.kernel.org/linux-kernel/20241217173537.192331-1-ninad@linux.ibm.com
>>
>> Ninad Palsule (4):
>>    hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
>>    hwmon: (pmbus/crps) Add Intel CRPS185 power supply
>>    dt-bindings: hwmon: intel,crps185: Add to trivial
>>    ARM: dts: aspeed: system1: Use crps PSU driver
>>
>>   .../devicetree/bindings/trivial-devices.yaml  |  2 +
>>   Documentation/hwmon/crps.rst                  | 97
>> +++++++++++++++++++
>>   Documentation/hwmon/index.rst                 |  1 +
>>   MAINTAINERS                                   |  7 ++
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |  8 +-
>>   drivers/hwmon/pmbus/Kconfig                   |  9 ++
>>   drivers/hwmon/pmbus/Makefile                  |  1 +
>>   drivers/hwmon/pmbus/crps.c                    | 74 ++++++++++++++
>>   drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
>>   9 files changed, 206 insertions(+), 6 deletions(-)
>>   create mode 100644 Documentation/hwmon/crps.rst
>>   create mode 100644 drivers/hwmon/pmbus/crps.c
>>
> I've cherry-picked the changes out of hwmon/hwmon-next where
> appropriate, and backported the devicetree change from my BMC tree.

Thanks for the review and applying the changes.

Regards,

Ninad

>
> Thanks,
>
> Andrew
