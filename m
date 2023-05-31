Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A8718A9A
	for <lists+openbmc@lfdr.de>; Wed, 31 May 2023 21:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWg4d1hNjz3fCm
	for <lists+openbmc@lfdr.de>; Thu,  1 Jun 2023 05:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OVIsxE+b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OVIsxE+b;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWg4200m0z30Ky
	for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2023 05:55:45 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34VJgnXP029533
	for <openbmc@lists.ozlabs.org>; Wed, 31 May 2023 19:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Hu9uYDah3PLbuqFwFRhKN4lSJdeik4io7ufz2jX0Wfw=;
 b=OVIsxE+btpfUmeybRzsF71Mhopb4QuD1k6hshNLYg15B917uvxBsu3CqvXMUzOHM30eQ
 s+vFan36OU5m0083Ba7JW9s3NG17km+njQ9LfAV2m+kuPXIXdaOxomGe1Z4gUH1R33QF
 P9lcW0/ABdLbHXEx0V/kcC1fYdF3py6Oq1HMDc6AyZhYqvJCWzku0ZNxOQ/gg1u5Ch32
 CxAPBRR0IaaTILqbkte5gVRJFPVo4p0r3L3arAVdftGBLgbSU0QHMO78Q51dPpMsCRc0
 6cIlRu6Ziu3eTWtYSDnm8aZa2n88lIgIghFC0hM4ajbeXksQPUC21nV3jSKCDTkdhN/e og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxc8fgtug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 31 May 2023 19:55:42 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34VJjK40004412
	for <openbmc@lists.ozlabs.org>; Wed, 31 May 2023 19:55:42 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxc8fgtuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 19:55:42 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34VG95M4009525;
	Wed, 31 May 2023 19:55:41 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3qu9g5wa2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 19:55:41 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34VJtfVg36242014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 May 2023 19:55:41 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 035D85805F;
	Wed, 31 May 2023 19:55:41 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBBFF5805A;
	Wed, 31 May 2023 19:55:40 +0000 (GMT)
Received: from [9.61.6.79] (unknown [9.61.6.79])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 May 2023 19:55:40 +0000 (GMT)
Message-ID: <191b90a4-3659-0470-46e8-75367ffe0db4@linux.vnet.ibm.com>
Date: Wed, 31 May 2023 13:55:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Disabling https
To: hamid amirrad <h-a-m-i-d@hotmail.com>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SA3PR15MB5728B4C071EDCE147FC860B1A6479@SA3PR15MB5728.namprd15.prod.outlook.com>
Content-Language: en-US
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <SA3PR15MB5728B4C071EDCE147FC860B1A6479@SA3PR15MB5728.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kueMNCafUIOcjRAU5dTeWspZjxuixBbJ
X-Proofpoint-ORIG-GUID: 9ClxcMgg33ZI2AmYDa7wKHyAqgSlyCyv
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_14,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=794 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310166
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

On 5/26/2023 11:21 AM, hamid amirrad wrote:

> I have built an openbmc image for ast2500 module but i am really having 
> a hard time accessing it via REST or web. Both of them fail with ssl 
> certificate even when I try to import the server.pem from the BMC module 
> into my browser or use --insecure for my curl.
> 
> Can you guys guide me on how to disable the https so i can just access 
> my module via REST and web?
> 

What is the exact error? bmcweb will generate a self-signed certificate 
if it doesn't find a usable one. 
https://github.com/openbmc/bmcweb/blob/13451e3913c29bb380ef6778f11749d337ddd442/README.md?plain=1#L72

If a web user interface is enabled, it can be accessed at "https://<bmc 
ip address>".
https://github.com/openbmc/bmcweb/blob/master/meson_options.txt#L71
You will need to accept/proceed with the certificate warning in your 
browser if the certificate is self-signed.

Lastly, you can disable SSL via 
https://github.com/openbmc/bmcweb/blob/master/meson_options.txt#L270
A lot of times, this is done in conjunction with setting the port to 80, 
https://github.com/openbmc/bmcweb/blob/master/meson_options.txt#L230 and 
additionally disabling insecure-disable-auth 
https://github.com/openbmc/bmcweb/blob/master/meson_options.txt#L278. 
These options should not be used for production systems.

Gunnar
