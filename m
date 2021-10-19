Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81F433864
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 16:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYbg02Mfkz307g
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 01:27:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sna8v9pp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sna8v9pp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYbfV1t3Cz2yHW
 for <openbmc@lists.ozlabs.org>; Wed, 20 Oct 2021 01:26:57 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JDIFJO031998; 
 Tue, 19 Oct 2021 10:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1rnuZisn323ZkOdcoMEX9BaZqRqUAO/+xMkOlvTk3OI=;
 b=Sna8v9ppBrF1vypuO52MScu/mo2h35zGF0BPfcfiBt1P2incjswrEw9YBgjJqoS2CbxU
 DfL8+sXI3hMLZ+tx078ht03WqQSJdOTTiOdvJ0psaAtbPZbH2hU4SU0TP3pA4wjoRIoP
 sKY9y3om5N83LEKNHl9h4p9+q9DUtE5WRCwSbl8dRjPmu/qLCZPvbAld1VPcZHO2UwSv
 W3YAKsewDcI1kyzpNrT/IDPtCkVdpTrCzfaB+GTp7sYtsO6Lud0V2GU0Jzpk8qic1hpL
 LZdD8u+lCZr+OU2Nsd61lYU908+g9nEcE6DCapTOfONm44xEFiFInmkwNZ01ahGJHd+i iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsxs99nuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 10:26:50 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19JDK5TW006727;
 Tue, 19 Oct 2021 10:26:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bsxs99nub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 10:26:49 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19JEDSiZ030976;
 Tue, 19 Oct 2021 14:26:48 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3bqpcbuur9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 14:26:48 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19JEQlft37945692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 14:26:47 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0979311206F;
 Tue, 19 Oct 2021 14:26:47 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3381711206B;
 Tue, 19 Oct 2021 14:26:46 +0000 (GMT)
Received: from [9.163.19.199] (unknown [9.163.19.199])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 14:26:46 +0000 (GMT)
Message-ID: <62b61415-8b76-0a38-0a00-3fa2e9f20c46@linux.vnet.ibm.com>
Date: Tue, 19 Oct 2021 07:26:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Control and uses of USB for BMC's own internal uses
Content-Language: en-US
To: Ed Tanous <edtanous@google.com>
References: <3d3276b0-6408-88bf-94b1-5060e0fbeee7@linux.vnet.ibm.com>
 <9424b5c3-729d-a9f2-353e-546de7700c5d@linux.vnet.ibm.com>
 <CAH2-KxCbH76ByDPD2sOjL1S_x-7pn1-dKn7S7-ukfUzcgNhMfA@mail.gmail.com>
 <d3f90413-f3e8-a5cf-4d3c-47c99d4cca4e@linux.vnet.ibm.com>
 <CAH2-KxDyAU_ziv9rD0o28KoowWe8H7fYMFCd3YnvnYShm8OCkg@mail.gmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
In-Reply-To: <CAH2-KxDyAU_ziv9rD0o28KoowWe8H7fYMFCd3YnvnYShm8OCkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9ix7W6LczUU0u3ir016F20pvN49SeXd0
X-Proofpoint-GUID: 1eAPAB51SKoOdRYWKui-OoAzS-hBVl84
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_01,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=957
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190087
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
Cc: openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 richard.marian.thomaiyar@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/18/2021 14:19, Ed Tanous wrote:
> On Mon, Oct 18, 2021 at 2:15 PM Bruce Mitchell
> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>
>> On 10/18/2021 13:32, Ed Tanous wrote:
>>> On Mon, Oct 18, 2021 at 11:36 AM Bruce Mitchell
>>> <bruce.mitchell@linux.vnet.ibm.com> wrote:
>>>>
>>>> On 10/17/2021 11:55, Bruce Mitchell wrote:
>>>>> This thread BMC's USB means for the BMC's own uses
>>>>> not for Host's uses nor to provide services to the
>>>>> Host.  Thus, if I said "Disable the BMC's USB" that
>>>>> would not impact the Host in any fashion.
>>>>>
>>>>> I need to be able to control the BMC's USB ports
>>>>> to prevent BMC uses of USB Pen Drive updates and
>>>>> independently prevent the BMC uses of USB serial
>>>>> cable for UPS.  As well as re-enable those usages.
>>>>>
>>>>> Clearly in this Gerrit review the term Disabled was
>>>>> not defined.  47180: bmc-usb: property to track usb state
>>>>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/47180
>>>>>
>>>>>
>>>>> Also, since this is related to security of the BMC
>>>>> my intent was to offer the users a clear way to
>>>>> achieve the control of the BMC's USB ports without
>>>>> the users needing to know any of the Servers' USB
>>>>> topology.  I personally find complicated user options
>>>>> for features adds risk to the system security.
>>>>>
>>>>> A recommendation I have receive is to use phosphor-state-manager.
>>>>>
>>>
>>> Some clarifying questions:
>>> There are physically available USB A ports connected directly to the
>>> BMC on IBM platforms?  Or are these traces within the board?
>>> What are these direct bmc usb ports used for normally?
>>>
>>> Considering that while the BMC use case is likely IBM specific, but
>>> the idea of disabling a generic USB port isn't IBM specific, it seems
>>> like we need a model for a USB port on dbus and relate it to the
>>> various resources.  If and when a host interface wanted to implement a
>>> similar feature, we'd be able to reuse it.
>>>
>>
>> Yes, theses are physically available USB A ports directly connected
>> to the BMC on IBM platforms.
>> No, these are not traces within the board; "anyone can walk up and
>> plugin a USB stick".
>> USB Flash drive for firmware update of the BMC is the first uses case
>> the second uses case is to talk to a UPS via a USB to Serial port.
>>
>> Please clarify "generic USB port".  From my perspective there are
>> USB Ports to be used "owned" by the BMC's firmware and there are
>> USB Ports to be used "owned" by the Host.  I know of no USB Ports that
>> are shared by the BMC and the Host (I know that the physical BMC
>> provides SIO and thus some USB ports as well to the Host in many
>> situations, I see them as Host owned USB Ports).
> 
> There are platforms that have USB ports connected between the host and
> BMC.  The point is, regardless of the owner, we should have a common
> interface for it such that when and if "out of band host USB port
> disabling" comes, we can simply implement the same interface and have
> the code be very similar.  This is the same pattern we follow for
> almost all other interfaces, so it should be pretty straightforward to
> represent.
> 

On our systems (at least some), the BMC does not have control over the
Host's USB ports.  The Host USB Ports are disjoint from the BMC.  The
Host has its own independent USB Ports and they are controlled by the
Host's Firmware and or Software and the BMC does not come into play.
So the BMC's Redfish API will not know about the Host's USB nor offer
any control of the Host's USB ports.

>>
>>>>> Also, from what I have observed this control of the
>>>>> BMC's USB ports may be unique to my company (IBM).
>>>>> And thus, an OEM solution may be best.
>>>
>>> Keep in mind, you'll need a new schema and collection for these
>>> things;  I'd recommend starting up a thread with DMTF about getting
>>> those added.  Keep in mind, they already have the "port" schema, which
>>> might fulfill the need, although it doesn't have a USB enumeration, so
>>> it's possible that's an intentional omission.
>>>
>>> https://github.com/openbmc/bmcweb/blob/master/OEM_SCHEMAS.md
>>>
>>
>> I am going to let Brad address this one.
>>
>>>>>
>>>>> Does anyone else have a need or desire to control the
>>>>> BMC's USB ports?
>>>>
>>>> Also suggested utilize https://github.com/openbmc/service-config-manager
>>>> to disable/enable the service and make it like enable/disable SSH
>>>> via Redfish via bmcweb
>>

