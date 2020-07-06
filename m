Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EFC2154DF
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 11:44:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0gd671JyzDqg8
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 19:44:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0gcC0fBbzDqD9
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 19:43:16 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0669W9hF118673; Mon, 6 Jul 2020 05:43:07 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322nngnfs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 05:43:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0669afHc021216;
 Mon, 6 Jul 2020 09:43:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 322h1h24gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 09:43:05 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0669h3G17995398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 09:43:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7A415204F;
 Mon,  6 Jul 2020 09:43:03 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.253.115])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F08235204E;
 Mon,  6 Jul 2020 09:43:02 +0000 (GMT)
Subject: Re: Reg new repository for Remote BIOS Configuration feature
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
References: <OF695C3E91.9C1FA4CC-ON00258598.00304468-00258598.00304971@LocalDomain>
 <8c52e6de-d785-6e28-c186-eb05bc405831@linux.intel.com>
 <OF4F9A7C8E.67B55B6A-ON00258598.00314874-00258598.003165E6@notes.na.collabserv.com>
 <3631d9fa-52b1-0918-bf9c-af8cb21e0c4f@linux.intel.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <204b12fe-85c3-97f1-fd16-a2b5a64e9c6b@linux.vnet.ibm.com>
Date: Mon, 6 Jul 2020 15:13:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3631d9fa-52b1-0918-bf9c-af8cb21e0c4f@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_07:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 adultscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060072
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>>         ----- Original message -----
>>         From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
>>         To: dkodihal@in.ibm.com, bradleyb@fuzziesquirrel.com,
>>         jason.m.bills@linux.intel.com, patrick@stwcx.xyz, "Thomaiyar,
>>         Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
>>         Cc:
>>         Subject: [EXTERNAL] Reg new repository for Remote BIOS
>>         Configuration feature
>>         Date: Wed, Jul 1, 2020 2:12 PM
>>         Hi Brad,
>>
>>         Can you please create new repository (repo name :
>>         Remote-BIOSConfig )


Surya, would you be too opposed to the name bios-settings-mgr?

Regards,
Deepak

