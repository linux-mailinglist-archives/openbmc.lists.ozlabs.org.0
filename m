Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 880891A8E5E
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 00:12:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49208f2w3mzDqwf
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:12:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49207d5Y6yzDqvj
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 08:11:24 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EM4Kvc026653; Tue, 14 Apr 2020 18:11:20 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnn30413-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 18:11:20 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03EM1bq1013734;
 Tue, 14 Apr 2020 22:03:44 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 30b5h6vs11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 22:03:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03EM3hat55116048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 22:03:43 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26F0E6A09C;
 Tue, 14 Apr 2020 22:03:43 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F9276A0A2;
 Tue, 14 Apr 2020 22:03:42 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Apr 2020 22:03:42 +0000 (GMT)
Subject: Re: ipmi password storage
To: Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <20200414155019.GB443018@heinlein.lan.stwcx.xyz>
 <20200414164610.GC9295@mauery.jf.intel.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <c59d8a92-aabd-1a79-a97a-5947bb7ff4cc@linux.ibm.com>
Date: Tue, 14 Apr 2020 17:03:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414164610.GC9295@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_11:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140153
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 4/14/20 11:46 AM, Vernon Mauery wrote:
> On 14-Apr-2020 10:50 AM, Patrick Williams wrote:
>> On Mon, Apr 13, 2020 at 04:00:15PM -0700, Vernon Mauery wrote:
>>
>> Vernon,
>>
>> Is there some background pointers on why IPMI needs to store passwords
>> in a reverable way?  I never understood that.
>
> Sure. I think this is most clearly described in section 13.31 "RMCP+ 
> Authenticated Key-Exchange Protocol (RAKP)" in the IPMI v2 1.1 spec.

This may be a bit naive....  Is it possible to expand the RCMP+ spec 
with a new cipher suite or similar, to use a mechanism more like HTTPS 
or SSH that does not require the server to be able to produce a clear 
text password?  Given that IPMI will be used for many years, this seems 
worthwhile, and would solve the current problem.

- Joseph

> --Vernon
>
>>>
>>>
>>> --Vernon
>>
>> -- 
>> Patrick Williams
>
>

