Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D463D2621EB
	for <lists+openbmc@lfdr.de>; Tue,  8 Sep 2020 23:26:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmJ9r4RFHzDqLf
	for <lists+openbmc@lfdr.de>; Wed,  9 Sep 2020 07:26:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pfutJaSZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmJ8t6b4GzDqFH
 for <openbmc@lists.ozlabs.org>; Wed,  9 Sep 2020 07:25:33 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 088L3Lj3034387; Tue, 8 Sep 2020 17:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eb9nJPNED5TUyuS+9/KUa20eqc00Tcc7fUz7ATxkbqg=;
 b=pfutJaSZCbUxixNkhW6SvnqNt3YQ8+jxCicTjRjDuY5s+Vqw6e86o/zApnz7rsbwiRPR
 5bRf1JR8fzXMfPXlAVwHz8vmQZsastRRGEklikCX8C3JHDtv214iJZyVaGbDsiPdhsBt
 zKBN2skVSEzhRasB8i1IqSYepK1lUX58154a47ElrmEBBGhbP0AisgBdf5ppH3xLfgcL
 5wDMmiMyoW7ePXJ5vgNjdrkEVhTgOPQEOiGyBPZR5aODLEeTz1OcQq6n+U6cxRqUZ1J1
 0qq8wAxogMwYaWuVeue5HniXBKs0cW/KGmDUN2x9omw1tA6vwamykEq7+RsKCE7K8MnA xg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33eh1e1jf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 17:25:29 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 088LI7Wg014124;
 Tue, 8 Sep 2020 21:25:28 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 33c2a98uea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 21:25:28 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 088LPSQe52625678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 21:25:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EA20B205F;
 Tue,  8 Sep 2020 21:25:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA6AB2064;
 Tue,  8 Sep 2020 21:25:27 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.201.154])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Sep 2020 21:25:27 +0000 (GMT)
Subject: Re: How to comprehensively search the OpenBMC Archives
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 "Muggeridge, Matt" <matt.muggeridge2@hpe.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
Date: Tue, 8 Sep 2020 16:25:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_09:2020-09-08,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=847
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080189
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

On 9/8/20 1:51 PM, Gunnar Mills wrote:
> On 9/3/2020 6:14 PM, Muggeridge, Matt wrote:
>>
>> Is there a more comprehensive/reliable way to search through these 
>> mamil archives?
>>

I used the following (bash) script to download the entire openbmc email 
archive to my workstation's storage.  (And then I use my local search 
capability (grep,  spotlight search, Windows-f, etc.) to locate the 
desired content.

- Joseph

wget --no-check-certificate https://lists.ozlabs.org/pipermail/openbmc
set -x
for f in $(grep '<td>.*.txt.gz' index.html | cut -d\" -f2); do
   wget --no-check-certificate https://lists.ozlabs.org/pipermail/openbmc/$f
   gunzip "$f"
done


> +1. Could we look at moving to Mailman v3 and like 
> https://docs.mailman3.org/projects/hyperkitty/en/latest/ ?
>
>
>> I have been using google to search the archives, but have noticed the 
>> results are not complete.
>>
>>
>

