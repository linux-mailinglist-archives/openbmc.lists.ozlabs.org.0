Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D7197B2EF
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2024 18:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7Rs71hhQz3c7H
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 02:22:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726590166;
	cv=none; b=EVGqrpJe5eCObr0Pefwypf4rlX5CgzvuTnAJFFuJ71Wiyxf6KY3oApyDHm85NRscUORQHK6qHZR48CvvWN1L89fn/lAo9r9sD9YGlwF4KUtjZSNic9sNMk6yU8MMpKkUjD3CqEB3tOa2P7qg2rSbuxOkjGl0OLRHPXVtHu0RfQBCE7Au2Uftf0ehQgK+SnjYVeNHA5NLdVwNzZSnCggNptme0Z5Td+nrsMOPh3LcDjgpD703u1WSny9AWzxFPVMBxKQF6g0V8bILRY3A//mvI2Jy7yN8SNVEMDpkzt94MjN39GYkwMhirOUmyW1xhhGWHAgjCugHqMGwj/kF+S+XOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726590166; c=relaxed/relaxed;
	bh=z/BUNgbpGEULA+jkrSFN2rEv+lvwqyTyEN6iPWBM8uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Yzr4Ulq8swiLwzFq09viH3UKEOhTLVEeXPhX3IaiRVcW9SxJTbjiw/zI332UvQmqZttgABNmq55IAAKr9lM34jZyaI+aCNIaQDCi77FSZhXAzvkBEyG2MTLQPM6jD08WU2z5Zor3LiafNLf1wY/yIPtsDnGvkSD16qcmdVvZoNwEtfw2EI0EdQlNAgZ41mT/L+YzT9+2p/RNp29U3bu/85EUBMm14tBRZyZV6KO+SuQK44ejiGRNmlENvnVLtES//IyfOTM9LI2e407uOr95qYRe810MFv5YnDLZUv0mXyn5JRqNtNOlFFFxRw2nMELg+nY2pNHaYMZ7AFulrJXUPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MV8Jtl3d; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MV8Jtl3d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7Rs20BrPz2y8B
	for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 02:22:45 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H8eXBd006164;
	Tue, 17 Sep 2024 16:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=z
	/BUNgbpGEULA+jkrSFN2rEv+lvwqyTyEN6iPWBM8uw=; b=MV8Jtl3du/nnPZm5s
	NADHIzQNroWZhDC668g7OvBnoIrO1v/hwiyGqzJip5mUAkv2tou0MtyzQkIR3Pud
	SvmnG5oIVsnvA9M7aawnIpIjNHi2x6B3s4Sb5Ed70toARCx3AlfbI8r4y/H24QCi
	UIazAlCXjOLn2HkOZTjIjuTYLB1UdbzKG3mKc90y+AVEKj8Oq6ao+4bJJ/aHvjlc
	lNyxLFwfhgkRG9+FIn9hsxLYf9gIl0DhkDiHV56evG6EQgE1K077x1vjmct0fGoA
	X8k4AN9FJRrTW93bWcWkFcpbVAYXR0vqqFShHjoVGuE3ceBd5Jcb8DahraoeaIEk
	Tr73w==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n41agmp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 16:22:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48HFC1gS001892;
	Tue, 17 Sep 2024 16:22:39 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nmtupex7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 16:22:39 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48HGMdhi47972844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Sep 2024 16:22:39 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 563C158057;
	Tue, 17 Sep 2024 16:22:39 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4106B58059;
	Tue, 17 Sep 2024 16:22:39 +0000 (GMT)
Received: from [9.61.93.228] (unknown [9.61.93.228])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Sep 2024 16:22:39 +0000 (GMT)
Message-ID: <8f60284b-8b91-4669-88f3-3bad5086b1c9@linux.ibm.com>
Date: Tue, 17 Sep 2024 11:22:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux dev-6.6] ARM: dts: aspeed: Fix Rainier and Blueridge
 GPIO LED names
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org
References: <20240903155947.425132-1-eajames@linux.ibm.com>
 <15bc181d5cbbdef6590e1945ace206a00525b477.camel@codeconstruct.com.au>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <15bc181d5cbbdef6590e1945ace206a00525b477.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WWJI6MFzscnj3SZWWUO6v7Npo7o5T2Ma
X-Proofpoint-ORIG-GUID: WWJI6MFzscnj3SZWWUO6v7Npo7o5T2Ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-17_08,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 mlxlogscore=664 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170118
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


On 9/11/24 22:18, Andrew Jeffery wrote:
> On Tue, 2024-09-03 at 10:59 -0500, Eddie James wrote:
>> Blueridge updated the LED names to include the "led-" prefix as
>> upstream required. Rainier should match for ease of application
>> design. In addition, the gpio line name needs to match.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Is there an equivalent patch upstream? If not can you first send one
> there, and we can backport it?


Sure, I just sent it upstream.

Thanks,

Eddie


>
> Andrew
