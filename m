Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7EB62E971
	for <lists+openbmc@lfdr.de>; Fri, 18 Nov 2022 00:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCwqD4lYnz3cML
	for <lists+openbmc@lfdr.de>; Fri, 18 Nov 2022 10:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TDtX7CJT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TDtX7CJT;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCwpb0DXtz3bjy
	for <openbmc@lists.ozlabs.org>; Fri, 18 Nov 2022 10:19:02 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AHN403M015218;
	Thu, 17 Nov 2022 23:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0JdujIJ7BAwgMdgp1VcCVeuzAJivsGcTVCOPUmNdNbo=;
 b=TDtX7CJTzL/bYl9h67ebvXwkwUuHQSqfZYhVPIAeRqB1uiuJhSSDSMN7PseqsiEPTPMm
 4Be/stCJSKLbhG9Ip9NlZFRFJSymYWTw1vgj96lVb9GTG98dF4AM/5k63n3+x8y5PbKT
 GNXSARe/lUGntO03irdYl3WuMy4uvRrgEw0+lcVqVdFBB8ddw5fQgT2GdO6JRKOFVkWR
 01eAoZaDpzYVb00q9pJ7TDmQrxwfefWy40Mbk8OgoGYWpg3TNmfyLsQDqKNhD7gLoLLB
 mR/w8RvJWNDJQ4jJEiprZ4BtvsjvxCu9Cl4jT2L5jwQfMrzJQzvHm9+2i1AKJbxth8TU sg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwxa5ragu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 23:18:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AHN5KYv030357;
	Thu, 17 Nov 2022 23:18:54 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma03dal.us.ibm.com with ESMTP id 3kt34ad17v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Nov 2022 23:18:54 +0000
Received: from smtpav04.wdc07v.mail.ibm.com ([9.208.128.116])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AHNIqdR3736168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Nov 2022 23:18:53 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FD1858054;
	Thu, 17 Nov 2022 23:18:52 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3818C58052;
	Thu, 17 Nov 2022 23:18:52 +0000 (GMT)
Received: from [9.160.119.212] (unknown [9.160.119.212])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 17 Nov 2022 23:18:52 +0000 (GMT)
Message-ID: <94c0b27f-8120-a3ba-749e-d3f735442754@linux.ibm.com>
Date: Thu, 17 Nov 2022 17:18:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH linux dev-6.0] arm: dts: aspeed: ibm-power9-dual: Update
 OCC nodes
To: Joel Stanley <joel@jms.id.au>
References: <20221116165714.2349545-1-eajames@linux.ibm.com>
 <CACPK8Xej5SS-N=JBUnZfG0jb7f-Lw7g_neLXeA4vhdm1ZkWLvA@mail.gmail.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8Xej5SS-N=JBUnZfG0jb7f-Lw7g_neLXeA4vhdm1ZkWLvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eLgo6U0t3wFEr7w3SBZ_CzMKZzBfK9cM
X-Proofpoint-ORIG-GUID: eLgo6U0t3wFEr7w3SBZ_CzMKZzBfK9cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 adultscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170163
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


On 11/16/22 21:13, Joel Stanley wrote:
> On Wed, 16 Nov 2022 at 16:57, Eddie James <eajames@linux.ibm.com> wrote:
>> Set the ibm,no-poll-on-init property for the OCCs.
> Is this required to make them probe?
>
> Previously they worked (it would attempt to read form the host and
> fail, but the driver would probe). Do we need to fix the driver, or do
> we need to fix all of the device trees (vesnin, palmetto, tacoma)?


No, they will probe if the host is on. The probe will fail if the host 
is off - as before. The problem is the occ-control application no longer 
binds the device to the driver. So, on any system, if the BMC boots with 
the host off, the device will not be probed. Then the application fails 
because it's expecting the device to be there.


Thanks,

Eddie


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/ibm-power9-dual.dtsi | 23 ++++++++++++-----------
>>   1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/ibm-power9-dual.dtsi b/arch/arm/boot/dts/ibm-power9-dual.dtsi
>> index a0fa65b44b0f..916041e6e00c 100644
>> --- a/arch/arm/boot/dts/ibm-power9-dual.dtsi
>> +++ b/arch/arm/boot/dts/ibm-power9-dual.dtsi
>> @@ -86,8 +86,13 @@ sbefifo@2400 {
>>                          #address-cells = <1>;
>>                          #size-cells = <0>;
>>
>> -                       fsi_occ0: occ@1 {
>> +                       fsi_occ0: occ {
>>                                  compatible = "ibm,p9-occ";
>> +
>> +                               occ-hwmon {
>> +                                       compatible = "ibm,p9-occ-hwmon";
>> +                                       ibm,no-poll-on-init;
>> +                               };
>>                          };
>>                  };
>>
>> @@ -187,8 +192,13 @@ sbefifo@2400 {
>>                          #address-cells = <1>;
>>                          #size-cells = <0>;
>>
>> -                       fsi_occ1: occ@2 {
>> +                       fsi_occ1: occ {
>>                                  compatible = "ibm,p9-occ";
>> +
>> +                               occ-hwmon {
>> +                                       compatible = "ibm,p9-occ-hwmon";
>> +                                       ibm,no-poll-on-init;
>> +                               };
>>                          };
>>                  };
>>
>> @@ -203,15 +213,6 @@ fsi_hub1: hub@3400 {
>>          };
>>   };
>>
>> -/* Legacy OCC numbering (to get rid of when userspace is fixed) */
>> -&fsi_occ0 {
>> -       reg = <1>;
>> -};
>> -
>> -&fsi_occ1 {
>> -       reg = <2>;
>> -};
>> -
>>   / {
>>          aliases {
>>                  i2c100 = &cfam0_i2c0;
>> --
>> 2.31.1
>>
