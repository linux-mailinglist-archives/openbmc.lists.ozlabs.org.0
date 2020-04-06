Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47919F906
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 17:40:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wvqy0LTdzDrB4
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 01:40:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wvps1pSGzDr7b
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 01:39:16 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036FYHg4066884; Mon, 6 Apr 2020 11:39:14 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 306nvuwfe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 11:39:14 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 036FZV2G015383;
 Mon, 6 Apr 2020 15:39:13 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 306hv611rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Apr 2020 15:39:13 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 036FdCDB49611224
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Apr 2020 15:39:12 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B8D2AC05E;
 Mon,  6 Apr 2020 15:39:12 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50639AC059;
 Mon,  6 Apr 2020 15:39:12 +0000 (GMT)
Received: from [9.163.59.134] (unknown [9.163.59.134])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Apr 2020 15:39:12 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 v2] fsi: master: Add link_disable function
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
References: <20200305034641.11426-1-eajames@linux.ibm.com>
 <20fd1439d28e6310d6c4dfc1d98ef4fa63cca794.camel@ozlabs.org>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <215b5850-7a97-4210-330d-c95a4e1f0d20@linux.ibm.com>
Date: Mon, 6 Apr 2020 10:39:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20fd1439d28e6310d6c4dfc1d98ef4fa63cca794.camel@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_08:2020-04-06,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004060124
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


On 3/31/20 12:18 AM, Jeremy Kerr wrote:
> Hi Eddie,
>
>> The master driver should disable links that don't have slaves or links
>> that fail to be accessed. To do this, add a link_disable function and
>> use it in the failure path for slave break and init.
> Concept looks good, but would it work to merge the disable
> functionality with the existing link_enable callback?
>
> ie., something like:
>
> --- a/drivers/fsi/fsi-master.h
> +++ b/drivers/fsi/fsi-master.h
> @@ -130,6 +130,7 @@ struct fsi_master {
>   				uint32_t addr, const void *val, size_t size);
>   	int		(*term)(struct fsi_master *, int link, uint8_t id);
>   	int		(*send_break)(struct fsi_master *, int link);
> -  	int		(*link_enable)(struct fsi_master *, int link);
> +  	int		(*link_enable)(struct fsi_master *, int link, bool enable);
>   	int		(*link_config)(struct fsi_master *, int link,
>   				       u8 t_send_delay, u8 t_echo_delay);
>
> (and add the bool to the core api too).
>
> - as I suspect the logic between enable and disable will be much the
> same, aside from the actual value set.
>
> Along those lines:
>
>> --- a/drivers/fsi/fsi-master-aspeed.c
>> +++ b/drivers/fsi/fsi-master-aspeed.c
>> @@ -299,6 +299,20 @@ static int aspeed_master_write(struct fsi_master *master, int link,
>>   	return 0;
>>   }
>>   
>> +static int aspeed_master_link_disable(struct fsi_master *master, int link)
>> +{
>> +	struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
>> +	int idx, bit;
>> +	__be32 reg;
>> +
>> +	idx = link / 32;
>> +	bit = link % 32;
>> +
>> +	reg = cpu_to_be32(0x80000000 >> bit);
>> +
>> +	return opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
>> +}
> If we don't need the delay and read-back here, should we drop it from
> enable too?


No, the delay is required by the FSI spec for enabling the link.


Thanks for the review!

Eddie


>
> Cheers,
>
>
> Jeremy
>
