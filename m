Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FD2FBECD
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 19:21:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKxnb1PL2zDqkj
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 05:21:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Gl7FQO1K; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKxmg1WsJzDqkj
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 05:21:06 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JI9GCv022109; Tue, 19 Jan 2021 13:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dD60bRuzULQPaPfb2ChCLZwDaQh/W4ErI3CMk067N0E=;
 b=Gl7FQO1KQ55oEdKon2TM+EMWEDXEbiGYdKMxTK0QamIJh2gv3pZSiV/Z8W98bfS+rIKs
 XoXPNuJHooDnPcruekFBufFHaEQJoUU93GKAUCCUBpk+b2AfalE0uwnfbtHbxDOY9ACl
 E4/7X8vr7TMIvbW4n/hfVHqjXmFKk+EQg+hK0fPqhHHsyIfbIwYW+oBCs41TntFTMHIb
 eYNL6hRnu96U0o6moYfts3WWC9ZFoI17LE1sEFlEyITNKYkkChOFuiSW0Y3KlPrGo7OV
 qnJg+R1z3z8/xHeSXzjWLGJkZ9Ve2OwExOLA9aqHe0pY7XxOL/mFrFIRFaa/+8ZC+KAQ Jg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36621p5c29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 13:21:00 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JICONB017301;
 Tue, 19 Jan 2021 18:21:00 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 363qs9663u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 18:21:00 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JIKxph30540258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 18:20:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 642FC112061;
 Tue, 19 Jan 2021 18:20:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E9B4112066;
 Tue, 19 Jan 2021 18:20:57 +0000 (GMT)
Received: from [9.206.201.239] (unknown [9.206.201.239])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 18:20:56 +0000 (GMT)
Subject: Re: Switch SensorCollection to show all sensors as new power/thermal
 schemas implemented
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <3475dcc0-5630-b18d-5cbe-e36ba1454fc4@linux.vnet.ibm.com>
Message-ID: <d1511a78-6a2d-4709-9839-fc7413c64a92@linux.vnet.ibm.com>
Date: Tue, 19 Jan 2021 11:20:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3475dcc0-5630-b18d-5cbe-e36ba1454fc4@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_07:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190099
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
Cc: Ed Tanous <ed@tanous.net>, Lei Yu <yulei.sh@bytedance.com>, "Li,
 Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/11/2021 11:19 AM, Gunnar Mills wrote:
> Similar discussion has been on the mailing list before: 
> https://lists.ozlabs.org/pipermail/openbmc/2020-October/023568.html
> 
> The new PowerSubsystem/ThermalSubsystem Redfish schemas can coexist with 
> the old Power/Thermal schemas. I suspect we will have both the new and 
> old for some time. As we implement the new 
> PowerSubsystem/ThermalSubsystem is it okay to switch the behavior of the 
> sensor collection from "show sensors that are not covered elsewhere in 
> the model" to "show all sensors" as the new 
> PowerSubsystem/ThermalSubsystem schemas call for?
> 
> I reposted in 
> https://redfishforum.com/thread/190/sensorcollection-contain-all-sensors-chassis, 
> unless I am missing something I believe Redfish's guidance will be "move 
> to a SensorCollection that shows all the sensors". If indeed that is 
> their guidance, is everyone okay as we implement the new 
> PowerSubsystem/ThermalSubsystem in bmcweb, we move sensor collection to 
> show all sensors? Things like webui-vue will have to be updated (not 
> sure anything breaks for webui-vue just would have duplicate sensors).

Redfish's reply was "My statement from 18 months ago is no longer our 
recommendation. That was before we proposed to re-factor the Power and 
Thermal schemas to use the Sensor model. And that continues to be our 
direction. So in that light, we want everything that counts as a 
"sensor" to be part of the Sensor collection so that generic monitoring 
software can be built to harvest sensor data across the Redfish model.

Even if an implementation hasn't decided to adopt the (still a 
work-in-progress) PowerSubystem and ThermalSubsystem models, the 
underlying temperature and fan sensors can be rendered as Redfish Sensor 
resources as a good middle ground (and a step in the right direction for 
future work).".

Based on that reply, I propose we move Redfish SensorCollection to show 
all sensors. Let me know if anyone objects.

Thanks,
Gunnar
