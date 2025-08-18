Return-Path: <openbmc+bounces-471-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6227BB2B116
	for <lists+openbmc@lfdr.de>; Mon, 18 Aug 2025 21:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5MYN14Xfz3cgM;
	Tue, 19 Aug 2025 05:03:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755543784;
	cv=none; b=nhViiPNUdKDm8PU/YdSXt469WztndKJCz2cmuRA+nSJO+zmzUhVqMUL/BxGhKNu1L+U4XLw+gEPRfh1gAePmMGAtotZE7dm5nW4GgE+g0QCGMZP8Mg50maSgHmPvdlj0m9Qak0fwxOprkDHiwnd9bJy3IpG9VTAaVtwPneD9n7WMAInKQRMJ8aRdFsddR3JQueJ1fmqTal7T0lMjMDtW5lJqOr9hQl4Cegh/5TZ3BAJ8I2u79pjvgCqNLnmK3+V8swfqBjdF+7UeC2DNdYAPGtIoZXKUkNl+8SP5UE1AABUAJpYYRa04DqERWAEKt6IvhUg1Yrb6of6qz3hihvguBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755543784; c=relaxed/relaxed;
	bh=6f+dr0EXniQ5lJ20K3E33HtqEw32lhObQUk2i6AeF60=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Nmxkktv8utyxN3PRvA7SbOz8tqmLNnwLl0zFW18yQG+9Rkh1hXvjC7Tie9cOOf/KIj/ycNb2aNHIZI2WiB7ZxMOkQvpua1ENhGmu0Pjzz5CjRXwGVS+pq2AfbnukPYZkiHaGNq8TzS1Dzf4f+zUzdLk+EAPqBjNnHmjI4+TDeiZsjpinh+i6typRKcalNhY7XZ5HGpgQAs694r7vVDVeYDN3UJgpspinGgVXAuiMZYR6qm0KKzbVLAO9UdERp+rcSTzXzkMZdTsAqQEdJnMczPkmVb56sxa9xc9ZUA+lVxnOZaq3LwVX9YgNpCFOCu6FcORteRbXGdSJaJs177+4CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DmV9tnCi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DmV9tnCi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5MYM2GrLz3cgB
	for <openbmc@lists.ozlabs.org>; Tue, 19 Aug 2025 05:03:02 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IBdJVf003258;
	Mon, 18 Aug 2025 19:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=6f+dr0EXniQ5lJ20K3E33HtqEw32
	lhObQUk2i6AeF60=; b=DmV9tnCidyh/cy9i0mnlDrcO4TfH6bE3ZG1+j6La7K98
	Hu8YhzoVeRDW2tIVUYSqiAOY89MxNZd0auA0eDFTHwHyZnRV+aQQq0D1SRdPJUaH
	zxu2hT9c4gaESCgJJu8hNhxCLm0+I8D4CE2puzSKqCAPlzuEjl2p0UqeuAlfQJVR
	Z53pIEH7CoB/XclJtLYPIDZ2++IpNNE739OtL6h6J6tC6WBZpKrh8yM1LSeGBnta
	+zMIFz+bVHhQ+OZ304Q2/UKCVUJ+YpI81CtWg59nMsEr+D0OZPWvwmZ6Zs5aGQih
	G9XWMG574HihNHtaBgDVMjo/p9AmdhsB5aq86/t6ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48jfdrtyvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 19:02:49 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57IIuCL8015413;
	Mon, 18 Aug 2025 19:02:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48jfdrtyvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 19:02:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57II3jcd001467;
	Mon, 18 Aug 2025 19:02:48 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48k4q0q7kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 19:02:48 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57IJ2lpT31785556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Aug 2025 19:02:47 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31E3458059;
	Mon, 18 Aug 2025 19:02:47 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E32E958058;
	Mon, 18 Aug 2025 19:02:46 +0000 (GMT)
Received: from [9.61.87.76] (unknown [9.61.87.76])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Aug 2025 19:02:46 +0000 (GMT)
Message-ID: <9e74ee30-547d-4643-af34-9e72ce263e4b@linux.ibm.com>
Date: Mon, 18 Aug 2025 14:02:46 -0500
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openbmc@lists.ozlabs.org
Cc: amirmizi6@gmail.com, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>
From: Eddie James <eajames@linux.ibm.com>
Subject: linux dev-5.4 TPM patches
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uFK-8os976AFbhj12RczYwuIai3W_32K
X-Proofpoint-GUID: tGBPc--pzx0jMonDLPLavb15UByJCq5N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfXxUFit7G0L8di
 kojIKVmpZdtr4VxRIAIgmH9Da3u0Dh+R3z8XenkguoWwyyWiFUaIo3JhejI0/hNZfIkakRqrGWE
 7GTFixEYgaxYdkjXexgKUl8fPmxw0tQfOXKn/mkbzkYFAHfavRXadDm4xwSEo0Xlns8+bEHHVQY
 uVGJNDURe9rRjp84RBDX+iXY75q83D3HNHDjPReuSpeziuCfxJI3HOVBfeIKI4vD9pwlMBRHTEU
 NJ6sVIZ2c3ecHMziByNhsbWnYuGFTpTdD6xjqQ+0c3Cf4xjMYKMN4ZiUDrw2rYnLIUX6IGv7Xcg
 dDI3Vg7TEqmWpTM/+0i2lhxYhlntdNkl/u+0Hv71jPP4VGwCUVvmYnUkv4HC4afxFuHvQWToYor
 4XkcUYwK
X-Authority-Analysis: v=2.4 cv=GotC+l1C c=1 sm=1 tr=0 ts=68a378d9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=GiLTzOXsY2XwoAOIv20A:9
 a=QEXdDO2ut3YA:10 a=1urcsAcQ4Z0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160001
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,


I'm trying to figure out if we need these 3 patches for dev-5.4 that no 
longer apply on the latest stable release:


https://github.com/openbmc/linux/commit/1e25a8b13ace408da8d0e54798d6e5ec059a205d

https://github.com/openbmc/linux/commit/1749e34cd7893a0cdfe6661f10a90d417c0e0515

https://github.com/openbmc/linux/commit/4c43f94ed9e6239dd6bb6405b227506cbe85c4d0


I do not see them upstream anywhere or in dev-6.6. Can we drop them for 
dev-5.4?


Thanks-

Eddie


