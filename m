Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE633705BC
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 07:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXHrh6BM7z300c
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 15:30:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jkppossl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jkppossl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXHrR23MSz2yRF
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 15:30:30 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14153GhT107217; Sat, 1 May 2021 01:30:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NieyIHIfx68C58j5Abw59y9N0YJ52eVsfbP+EkOIJm4=;
 b=jkppossl2RzXwuxJvIdhnaLoIAjSKQlcljQHvSIB2rjTeddNEJi02h62YZQap+aEvoZ/
 3FbLAyLQh5+UuoyfRGYCJ4y5nLbFZ/QwGjiqKiIq9SYsGhJth+O0HB71plzESZbuN3LQ
 fFpYBGXZjGq7iOu/Jx/szBp7j4GaLSgUAExhCHAjU90AKBGFxsSMfu0KJdqegcdUL7+j
 3vDmfuBtpZ+BGynsk8hPlIVGvuv1CHgw4kjZsmWSaY0sLO/edJXgT2/ieU2OTJksUkV/
 pLxpGgeLnuGlM6OdbXWKx9oWtHoHX6Ufiq+COBHF2Zd+lDBhV/Nc/jwCtGx8pXO5xp+a 6A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388xw8t1kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 01:30:26 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1415RE0W019481;
 Sat, 1 May 2021 05:30:24 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 388xm9gmdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 01 May 2021 05:30:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1415UOaP19464670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 1 May 2021 05:30:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75395124052;
 Sat,  1 May 2021 05:30:24 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15102124053;
 Sat,  1 May 2021 05:30:24 +0000 (GMT)
Received: from demeter.local (unknown [9.160.95.243])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Sat,  1 May 2021 05:30:23 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code: ibm-acf
To: Patrick Williams <patrick@stwcx.xyz>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
 <YIwGHYc11MZ6Dxz7@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <4b25d1d9-b4c7-1a58-f0a0-b9fd9cd73fe8@linux.ibm.com>
Date: Sat, 1 May 2021 00:30:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YIwGHYc11MZ6Dxz7@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S-9Zo4TbjPoqt8eg_lYwUt4_LqHoM087
X-Proofpoint-GUID: S-9Zo4TbjPoqt8eg_lYwUt4_LqHoM087
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-01_02:2021-04-30,
 2021-05-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105010034
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/30/21 8:29 AM, Patrick Williams wrote:
> On Thu, Apr 29, 2021 at 04:09:58PM -0500, Joseph Reynolds wrote:
>   
>> So ... does the GitHub OpenBMC organization host vendor specific repos
>> (perhaps github.com/openbmc/ibm-misc), or does the source code go
>> somewhere else (such as IBM's public fork in
>> github.com/ibm-openbmc/pam-ibm-acf)?
> I'm strongly opposed to dumping-ground repositories like
> "<company>-misc".  We approved exactly one of those and the rationale we
> were given was they had a bunch of existing code they were going to work
> at getting upstreamed, but wanted a place to be able to interact with
> their vendors in the interrim.  We should not be having *new* code going
> into that or any other "misc" repository.
>
> We have generally not wanted OpenBMC-oriented code in non-openbmc-org
> repositories that are then picked up by openbmc/openbmc recipes.  If you
> have a generally applicable library that isn't tied to openbmc in any
> way, or especially one that already has good usage outside of openbmc,
> then another github org seems reasonable.  That isn't what you have
> here.
>
> It sounds like you have a good definition here of what you want to do,
> so I'm fine with `openbmc/pam-ibm-acf`.  I don't see any reason we
> cannot host `openbmc/<company>-<feature>` repositories for things which
> are company specific, as long as those repositories are only picked up
> by your meta-<company> layer.

Patrick,

Thanks.  That works for me.  I propose a new repo ibm-acf which will 
have 4 related parts:
1. The Linux-PAM pam_ibmacf module (targeted to run on the BMC)
2. A tool to create and read ACF files (targeted to run on the build host)
3. Common source library for use by the two items above and by the BMC's 
function to upload & validate an ACF file.
4. Absolutely minimal test cases and documentation.

The idea is the meta-ibm layer could optionally pick up the pam_ibmacf 
piece and configure it into the Linux-PAM stack, then the tester can 
create or inject a key pair, and use the provided tool to create an ACF 
file for upload to the BMC.

Joseph

> [[
>     I think is / will be additional work going on in the background to
>     come to better consensus and document any rules around repository
>     creation.  This is my current opinion.
> ]]
>

