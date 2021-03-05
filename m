Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637532F193
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 18:43:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsZp83HdPz3dH7
	for <lists+openbmc@lfdr.de>; Sat,  6 Mar 2021 04:43:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VArniufp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VArniufp; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsZnv5hzkz3dDP
 for <openbmc@lists.ozlabs.org>; Sat,  6 Mar 2021 04:42:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 125HWwJG089195; Fri, 5 Mar 2021 12:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3OjgjzV/Qi0yCmajz88sEiFsa7NNtcoMW0AWSGHKoVU=;
 b=VArniufpygLxewIjkrVI7mY3EajzEHxNGiMSMuZsetFqQVaNth11D6Wj6FeVAz/POPUl
 LzrrrHnPfs9yLlc78yuarvv0u013SUqfcv1pH2ALKxmWvQy+g8EN+A+GBAAcnonRFtYs
 wgFSaFMRf1tLJRSa1K3EjWhuHNnDEYssGvEKVC7ZuEK0UnJh5yyZHN6D6I/3kzYBdN0k
 Q3YZxbViKlRdkZuvvIqkZt7fUJQJOjxqGPAcjgFYdgvVH+KtIZuefksMcl+aK9ZlkuHr
 hlgbeyqaJIDKJ0PWmr9nOEhrUvMQCDPgpTSPvbjf2nwLFglEPtjEL4QSsY4nLFkxsCpV jQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 373rduhk9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 12:42:51 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 125HgNFU006755;
 Fri, 5 Mar 2021 17:42:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3720r1321j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 17:42:51 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 125Hgmmv24183108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Mar 2021 17:42:48 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BE136A047;
 Fri,  5 Mar 2021 17:42:48 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F3476A04F;
 Fri,  5 Mar 2021 17:42:46 +0000 (GMT)
Received: from [9.81.205.174] (unknown [9.81.205.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  5 Mar 2021 17:42:45 +0000 (GMT)
Subject: Re: No option to delete SSL certificates
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <PS2PR02MB35414D7358C4248DF668A4E790969@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <6fafb378-5de7-74e3-4fef-17cb93d61c41@linux.vnet.ibm.com>
Date: Fri, 5 Mar 2021 10:42:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <PS2PR02MB35414D7358C4248DF668A4E790969@PS2PR02MB3541.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_13:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103050090
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
Cc: devenrao@in.ibm.com, ojayanth@in.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/4/2021 8:52 PM, Mohammed.Habeeb ISV wrote:
> In webui-vue , SSL certificates has only replace option. Delete button 
> is greyed out.
> 
> Is there any reason for not providing delete option?

Looking at the code, I believe the only certificate that can be deleted 
in bmcweb is the Trust Store Certificate
https://github.com/openbmc/bmcweb/blob/feaf15005555a3099c7f22a7e3d16c99ccb40e72/redfish-core/lib/certificate_service.hpp#L1347

And this is reflected in the webui-vue code:
https://github.com/openbmc/webui-vue/blob/4da9495925d601bb4edfb8b007d5b54792b7491b/src/views/AccessControl/SslCertificates/SslCertificates.vue#L183

I am not sure if there is a reason for not supporting deleting other 
certificates or just no one has done the work.
https://github.com/openbmc/bmcweb/commit/07a602993f1007b0b0b764bdb3f14f302a8d2e26

Thanks,
Gunnar
