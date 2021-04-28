Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A5036E1A7
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 00:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVvCS5tZMz2yyL
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 08:57:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iu0FpC+K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Iu0FpC+K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVvCB3j6lz2xZR
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 08:56:53 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SMierZ017872; Wed, 28 Apr 2021 18:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RwiGZbppi5LfqIcI/ncUAaBOo08GcgKUIhlmP75dJgo=;
 b=Iu0FpC+KfIssjbneASsZf0jU/Rg8CwRXFOvS6px6PM0KaqzPQoK6eVcb5nq09e9FByz+
 6JHz4T+BOv08fwBMykQFx+ow5cjleOnajAFtvJzGKSuher5KoxNQPBEc8ocmAL2ytySA
 YjY2aV12oqfXjCX5mP54jtBY0dcGI64nu0LUL+wzquq9UpSIcVjjZ8QQdCCeFIV9vHIW
 d7Kw61Wgt6lSJCvJz07QwqwbGs2zTvLqZku8meZBh8zjcv02XJ1vlE3EkY7xWDL/isC8
 7GETOJFY9WkM43k0DOPEUrD1U6wZE14dfhYGKN/GzcYNee8nCBhrd5tKXU/t3BlIVuMx oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387grur6u0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 18:56:49 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SMm9VD029206;
 Wed, 28 Apr 2021 18:56:49 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387grur6tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 18:56:49 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SMcj6m015010;
 Wed, 28 Apr 2021 22:56:48 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 384aya0b7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 22:56:48 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SMultv19005844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 22:56:47 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BDEE6A054;
 Wed, 28 Apr 2021 22:56:47 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 651E96A051;
 Wed, 28 Apr 2021 22:56:45 +0000 (GMT)
Received: from [9.206.162.87] (unknown [9.206.162.87])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 22:56:44 +0000 (GMT)
Subject: Re: Move Inventory.Item.Board from Redfish Chassis to Redfish Assembly
To: Ed Tanous <edtanous@google.com>
References: <a3b81496-b34d-9198-66b0-f335de61a677@linux.vnet.ibm.com>
 <CAH2-KxD1kB25nYADKzJ9rCb0+fu1mWKiQ_KMQ9nRvvi7ids_4w@mail.gmail.com>
 <d181d1f7-7e9a-2f2e-edaa-3bdafef1277e@linux.vnet.ibm.com>
 <CAH2-KxDygU-V_U2e4KOF6VCMdftwXUDvYPbMMKjg+UzwqKXWJg@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <d248a6d9-48b0-6219-dcba-a4d1d11804b4@linux.vnet.ibm.com>
Date: Wed, 28 Apr 2021 16:56:42 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <CAH2-KxDygU-V_U2e4KOF6VCMdftwXUDvYPbMMKjg+UzwqKXWJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HrsBxCNgS0LZimBMeOy1X0QLAa2nk48S
X-Proofpoint-GUID: cpxDVRoeKOYlSpcK06orMXRDFgl0KVv2
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_17:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280144
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Derick <derick.montague@gmail.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/28/2021 1:44 PM, Ed Tanous wrote:
>>> On Wed, Apr 28, 2021 at 9:18 AM Gunnar Mills <gmills@linux.vnet.ibm.com> wrote:
>>>>
>>>>    From some discussion on Discord a few weeks ago. A newer way of
>>>> thinking in Redfish is for a simple rack server to just have one Redfish
>>>> Chassis and things like boards modeled as Redfish Assemblies under the
>>>> Chassis. Today we look for inventory item chassis and inventory
>>>> item board to populate the Chassis collection. I propose we move
>>>> the "Inventory.Item.Board" from Redfish Chassis to Redfish Assembly.
>>>
> 
> Here's an example of something that's type Board that creates sensors.
> https://github.com/openbmc/entity-manager/blob/master/configurations/A2UL16RISER.json
> There are several more like this.

 From follow-on discussion in Discord this afternoon.
Today the sensors to board association (e.g. the riser card above with 
sensors) is "chassis"/"all_sensor. It should be  "inventory"/"sensors" 
(Association Type #2: Linking a low-level hardware item to its sensors 
[a]). Redfish has a "RelatedItem" property on the Sensor schema. To 
populate the "RelatedItem" property we will use Association Type #2. 
This is the first step to moving Inventory.Item.Board to a Redfish 
Assembly, this is to ensure no relationships are lost.

[a]https://github.com/openbmc/docs/blob/919a7b6816a5f16aa72d298e81e0756d95d5031e/architecture/sensor-architecture.md#association-type-2-linking-a-low-level-hardware-item-to-its-sensors

> 
> I don't mean to throw up roadblocks, and I definitely don't know what
> the solution is here, but we'll need to solve it before something like
> this can go through.
> 
We further discussed how staging this change might work, it probably 
involves a compile flag for some time and separately adding 
Inventory.Item.Board to Assembly and later removing from Chassis.

Gunnar
