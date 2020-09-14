Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374426987B
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 00:01:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Br0gb2fsCzDqRx
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 08:01:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=derekh@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YXmZvIkg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Br0fM0WB2zDqLh
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 08:00:19 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08ELfsng074682
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 18:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hUtvJwh/noggaMe4Ia2sy60cdA/jjbA4YZImfK7Gg9w=;
 b=YXmZvIkg/oQXoGekdgd6/8/Tm/YjDJ/cwnDEIcvVeLlSm2cix5m72pJuab8KyTouwbZe
 7v2DXzoJMXJGrHpu/77BRRJSxSRLGdnNiOgm4MQKqGEEQ27swpXa0DyjA3tU/5bQXiF3
 C4ZJtqhxfmVuQiQ8Ex9IMSVMxjNe1qTt2JjqtxhbX3wpcRolEqKe2/R0RBaHV0Lf4VP5
 OnKljR03QynUb/CuMCvPTddgx8NIv0EO0ob+DITnQiiG3oq6LQO5uZatdoOB1pzwcqg0
 v18GgY9uzmn29FYd3oE9X7yjJfxKAzB2yXWxSWwD+ARORD2AdMtUcSe8MTeBxUqqLSPe +g== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33jgnh0b90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 18:00:16 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08ELmAEM000883
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 22:00:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 33gny8tw0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 22:00:16 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08EM09Ja14614862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 22:00:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 223FBC6057
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 22:00:15 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D12E0C6055
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 22:00:14 +0000 (GMT)
Received: from [9.65.210.1] (unknown [9.65.210.1])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 22:00:14 +0000 (GMT)
Subject: Re: Defining a Power Supply Configuration Format with the PMBus
 Standards Working Group
To: openbmc@lists.ozlabs.org
References: <CAB-qw-hpuKJbuqoafpZpFBCZYdZhKrRHbjeUjgziX2pgxYGBRg@mail.gmail.com>
From: Derek Howard <derekh@linux.vnet.ibm.com>
Message-ID: <1a74d4fc-7e5c-1e68-5eee-0683d1c4281a@linux.vnet.ibm.com>
Date: Mon, 14 Sep 2020 17:00:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAB-qw-hpuKJbuqoafpZpFBCZYdZhKrRHbjeUjgziX2pgxYGBRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-14_09:2020-09-14,
 2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009140164
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


On 9/11/2020 4:00 PM, Vivek Gani wrote:
> Hello,
>
> My name is Vivek Gani and I’m representing the Power Management Bus 
> (PMBus(r)) Forum (https://PMBus.org), part of the System Management 
> Interface Forum (SMIF), Inc (http://smiforum.org/). Our group is 
> composed of both power supply vendors and chip/system manufacturers. 
> Together we create digital power protocols (PMBus, AVSBus(tm)) 
> supported by a number of power supplies on the market.
>
> Lately we have been discussing how to define a standard file format 
> for digital power supplies. Currently each power supply vendor has 
> their own format. This causes a burden for the system designer and 
> manufacturer using a mixture of power supplies from different vendors. 
> On the power supply vendor (and procurement manager) end this has also 
> led to more logistics in order to ship power supplies 'preconfigured' 
> when in many cases an 'off-the-shelf' product could have been used 
> then configured during system board manufacture or even in-system.
>
> Our focus is currently around power supply configuration and updates 
> over PMBus, though we want it to be open-ended to support other 
> usecases too. As far as stakeholders, initially this started out 
> within the PMBus Standards Working Group where power supply vendors 
> were focused on board bringup scenarios but thanks to people like Mike 
> Jones (Analog Devices) and Mariusz Oriol (Intel) we’re now realizing 
> such an effort will make more sense if done while keeping in mind the 
> needs of groups like OpenBMC & Redfish.  Specifically we want to try 
> and create a configuration format and toolchain that will find a 
> balance between:
>
> - Being human editable.
> In theory files could be generated in syntactically verbose formats 
> like XML, but in practice as an applications engineer being able to 
> easily edit configuration files by hand has proven very helpful in 
> resolving customer issues.
>
>  - Protocol generic enough to support minimum data to perform a PMBus 
> transaction.
> Specifically, one can use just address, command code, data (in 
> hex/binary), and PMBus transaction type data to configure a device. 
> Additional specifiers such as numeric format & named bitfields are 
> optional.
>  
> - Facilitates conditional/stateful aspects in the configuration process.
> While in theory things would be purely declarative in practice most 
> power supply devices may be in certain states (that change as commands 
> are sent) that necessitate management of state, dependencies, and 
> ordering.
>  
> - Having a verification mechanism with common format for ‘proof of 
> content’.
> Format could be something standard like sha1/md5 sum though the 
> instructions to perform verification may be vendor-specific. May be 
> limited to RAM-only though some vendors may offer non-volatile memory 
> verification methods.
>
> Here’s a high-level graphic of what we have in mind: 
> https://www.dropbox.com/s/8ey0errn7fe9gc0/2020-09-11%20-%20standard%20config%20groups%20and%20collateral.png
>
> We want to first present the idea here and see what the OpenBMC 
> community thinks about this effort. Is power supply configuration and 
> updates something of interest to this community? Have there been any 
> pain points experienced so far from the system engineering side you 
> could see solved through collaboration on a common format?
>
> Regards,
>
> Vivek

Hello, yes this is something we struggle with quite a bit at IBM - not 
only in the different configurations and firmware update procedures of 
specific power supplies, but also in differences between what pmbus 
commands are supported, data formats, unspecified behavior, etc.  
Definitely adds to the complexity required in the device driver and app 
code.

Please include me in future discussions, thanks!

