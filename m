Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D2014CA66
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 13:11:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4872Qc6VVRzDqRn
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 23:11:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4872P02BTqzDqKX
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 23:10:10 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TC9wRU019745
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 07:10:07 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xtrmb8hst-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 07:10:07 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <dkodihal@linux.vnet.ibm.com>;
 Wed, 29 Jan 2020 12:10:05 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 12:10:04 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TCA35x53280856
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 12:10:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3422A11C05C;
 Wed, 29 Jan 2020 12:10:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E04B11C05E;
 Wed, 29 Jan 2020 12:10:02 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.199.36.146])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 12:10:02 +0000 (GMT)
Subject: Re: BIOS, Hypervisor, and OS detailed boot progress in Redfish
To: geissonator@gmail.com
References: <CALLMt=q-f=_5dR=E7QNwB893c1+inv4EPe5ZrAfhG1Va8fUHQQ@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Date: Wed, 29 Jan 2020 17:40:01 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CALLMt=q-f=_5dR=E7QNwB893c1+inv4EPe5ZrAfhG1Va8fUHQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20012912-4275-0000-0000-0000039BFA4B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012912-4276-0000-0000-000038B0154F
Message-Id: <7b1259fe-7204-3b24-1941-e2df93d3c2f2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_02:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290102
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

On 29/01/20 2:23 am, Andrew Geissler wrote:
> 
> I think our goal should be to provide a high level summary of the boot from
> the BIOS, to the Hypervisor, to the OS.
> 
> Something like this?
> Unknown -> MotherboardInit -> MemoryInit -> SecondaryProcInit ->
>          -> HypervisorStart -> HypervisorStandby -> OSStart -> OSRunning
> 
> These would need PLDM commands for the host to send these down so maybe the
> PLDM specifications provides a hint on what these should be? I see this doc[4]
> has a "Boot Progress" State Set but a lot of these just don't make much sense
> to me.

[4] does have states for the flow you've described above, mostly. Also, 
the state set enums can have specific meanings once they're associated 
to a sensor (or an effecter), in fact they have to be interpreted in 
conjunction with the sensor or effecter. So for eg a state enum such as 
"boot started" can be associated with both a logical sensor monitoring 
the hypervisor boot and a logical sensor monitoring the OS boot.

Regards,
Deepak

> Thoughts/Ideas appreciated.
> 
> Thanks,
> Andrew
> 
> [1]: https://redfishforum.com/thread/275/bios-hypervisor-detailed-boot-progress
> [2]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/State/Boot/Progress.interface.yaml
> [3]: https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/State/OperatingSystem/Status.interface.yaml
> [4]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0249_1.0.0.pdf
> 

