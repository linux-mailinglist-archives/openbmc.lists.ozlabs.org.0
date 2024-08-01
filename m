Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08860944E1D
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 16:34:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAyuxVZh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZWgR3s3Xz3dmy
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 00:34:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAyuxVZh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZWfw1pDHz2ysc
	for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2024 00:33:44 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471AgEnD001769;
	Thu, 1 Aug 2024 14:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:message-id:date:mime-version:subject:to:cc
	:references:from:in-reply-to; s=pp1; bh=ABmkWkQ6wQboRWdn6PU1BBfB
	pYXCSVHxiV+8wgZTCYo=; b=YAyuxVZhYcediRD3XSXU03GuzXFwusFXnh0kuGq8
	V+tXiSXe+7MnTDI674G3oCETOpmwTru+8GK6kJC3xam7xP2RL8Mw7lGwoBWScero
	hbbd+Z4G1oaugPiqraAozX74q+df3EAryoHQorm3QohPcrlITkwGlsTQXZI7Ngnj
	nQ+GFMETDRqS3TqFPE7m5bWbZSMVIhB7tkfVBpQHYJKQUvDYAuWx4dwsSTdrPZBQ
	6llvPePpPjI/KStCPrYLZWkQLD10yGbVwow9kIlqjB/q61JXBKrRIxMLFxL7ATcy
	zfXmM17FOafIuz68/dyfUjL+hhenJHCymx9uOXVuzBFk8w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40r54u138g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 14:33:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 471EWCct029094;
	Thu, 1 Aug 2024 14:33:35 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nbm12du2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 14:33:35 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 471EXWDe59769182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Aug 2024 14:33:34 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 806825805F;
	Thu,  1 Aug 2024 14:33:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32E405805D;
	Thu,  1 Aug 2024 14:33:32 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Aug 2024 14:33:32 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------d79vOstBitTNgzkctvrQtzix"
Message-ID: <35f053bb-b339-41ca-807c-0bebdc0b6dd3@linux.ibm.com>
Date: Thu, 1 Aug 2024 09:33:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: system1: IBM System1 BMC update
To: Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240731214737.986010-1-ninad@linux.ibm.com>
 <20240731214737.986010-2-ninad@linux.ibm.com>
 <fcdb4d899effa877e1acc0576194425484d5208a.camel@codeconstruct.com.au>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <fcdb4d899effa877e1acc0576194425484d5208a.camel@codeconstruct.com.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 78KJxLd3MdfSWVvWSrYsVzV6fLhv1WjZ
X-Proofpoint-ORIG-GUID: 78KJxLd3MdfSWVvWSrYsVzV6fLhv1WjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_12,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010093
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
Cc: Ninad Palsule <ninad@linux.vnet.ibm.com>, openbmc <openbmc@lists.ozlabs.org>, eajames@linux.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------d79vOstBitTNgzkctvrQtzix
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 7/31/24 20:37, Andrew Jeffery wrote:
>>   
>> +
> This whitespace change seems unnecessary.
Fixed the whitespace in version 2.
>
> Note that none of these maxim-specific properties are documented in the
> upstream bindings. You will need to get that addressed either before or
> in the same series as this DTS patch when you send it upstream.
>
> Can you please fix up the whitespace and re-send this to the OpenBMC
> list, with the appropriate subject prefix, and _without_ including the
> upstream maintainers and lists (but still including Joel and myself)?
>
> Please reach out if there's anything that needs clarification before
> you do so.
>
> Andrew

Got it. Thank you for the review.

Regards,

Ninad Palsule

--------------d79vOstBitTNgzkctvrQtzix
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Andrew,<br>
    </p>
    <div class="moz-cite-prefix">On 7/31/24 20:37, Andrew Jeffery wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:fcdb4d899effa877e1acc0576194425484d5208a.camel@codeconstruct.com.au"><span
      style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This whitespace change seems unnecessary.</pre>
    </blockquote>
    Fixed the whitespace in version 2.<br>
    <blockquote type="cite"
cite="mid:fcdb4d899effa877e1acc0576194425484d5208a.camel@codeconstruct.com.au">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Note that none of these maxim-specific properties are documented in the
upstream bindings. You will need to get that addressed either before or
in the same series as this DTS patch when you send it upstream.

Can you please fix up the whitespace and re-send this to the OpenBMC
list, with the appropriate subject prefix, and _without_ including the
upstream maintainers and lists (but still including Joel and myself)?

Please reach out if there's anything that needs clarification before
you do so.

Andrew
</pre>
    </blockquote>
    <p>Got it. Thank you for the review.</p>
    <p>Regards,</p>
    <p>Ninad Palsule<br>
    </p>
  </body>
</html>

--------------d79vOstBitTNgzkctvrQtzix--

